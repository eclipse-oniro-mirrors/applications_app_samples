/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const testRoot = path.join(__dirname, 'ets', 'test');

function read(file) {
  return fs.readFileSync(file, 'utf8');
}

async function checkYieldToEventLoop() {
  const source = read(path.join(testRoot, 'TestEventLoop.ets'))
    .replace('export function yieldToEventLoop(): Promise<void> {', 'function yieldToEventLoop() {')
    .replace('new Promise<void>', 'new Promise')
    .replace('(resolve: () => void)', '(resolve)');
  let timerCallback;
  let timerDelay;
  const context = {
    Promise,
    setTimeout: (callback, delay) => {
      timerCallback = callback;
      timerDelay = delay;
    }
  };
  vm.createContext(context);
  vm.runInContext(source + '\nthis.yieldToEventLoop = yieldToEventLoop;', context);
  const pending = context.yieldToEventLoop();
  let completed = false;
  pending.then(() => {
    completed = true;
  });
  await Promise.resolve();
  await Promise.resolve();
  assert.equal(completed, false, 'Promise completed before the timer fired');
  assert.equal(timerDelay, 1);
  assert.equal(typeof timerCallback, 'function');
  timerCallback();
  await pending;
  assert.equal(completed, true);
}

function checkLogicSuites() {
  const logicRoot = path.join(testRoot, 'logic');
  const files = fs.readdirSync(logicRoot).filter((name) => name.endsWith('.test.ets'));
  assert.equal(files.length, 45);
  let caseCount = 0;
  for (const name of files) {
    const source = read(path.join(logicRoot, name));
    assert.equal((source.match(/beforeEach\(yieldToEventLoop\);/g) || []).length, 1, name);
    assert.ok(source.includes("import { yieldToEventLoop } from '../TestEventLoop';"), name);
    const describeAt = source.indexOf('describe(');
    const hookAt = source.indexOf('beforeEach(yieldToEventLoop);');
    const firstItAt = source.indexOf('    it(');
    assert.ok(describeAt < hookAt && hookAt < firstItAt, `${name}: hook is outside describe`);
    const registrations = source.match(/^    it\(/gm) || [];
    const literalNames = source.match(/^    it\('[^']+',/gm) || [];
    assert.equal(literalNames.length, registrations.length, `${name}: non-literal it name`);
    assert.ok(!/^(?:  describe|    it)\([^\n]*\(\): void =>/m.test(source), `${name}: typed callback`);
    caseCount += registrations.length;
  }
  assert.equal(caseCount, 2384);
}

function checkListTest() {
  const source = read(path.join(testRoot, 'List.test.ets'));
  const imports = [...source.matchAll(/^import (\w+) from '([^']+)';$/gm)];
  assert.equal(imports.length, 50);
  const body = source.slice(source.indexOf('export default function testsuite()'));
  const calls = [...body.matchAll(/^  (\w+)\(\);$/gm)].map((match) => match[1]);
  assert.equal(calls.length, 50);
  for (const match of imports) {
    assert.equal(calls.filter((name) => name === match[1]).length, 1, match[1]);
    assert.ok(fs.existsSync(path.resolve(testRoot, match[2] + '.ets')), match[2]);
  }
}

function checkRunner() {
  const source = read(path.join(__dirname, 'ets', 'testrunner', 'OpenHarmonyTestRunner.ets'));
  const sequence = [
    'abilityDelegatorRegistry.getArguments()',
    'abilityDelegatorRegistry.getAbilityDelegator()',
    'global[savePath] =',
    'global[readPath] =',
    'global[testMode] =',
    'createModuleContext(moduleName)',
    'await checkMock(abilityDelegator, context.resourceManager)',
    "await import('../test/List.test')",
    'Hypium.hypiumTest('
  ];
  let previous = -1;
  for (const token of sequence) {
    const current = source.indexOf(token);
    assert.ok(current > previous, `Runner order: ${token}`);
    previous = current;
  }
  assert.equal((source.match(/Hypium\.hypiumTest\(/g) || []).length, 1);
  assert.ok(!source.includes("import testsuite from '../test/List.test'"));
  assert.ok(!source.includes('startAbility('));
  assert.ok(!source.includes('TestAbility'));
}

async function main() {
  await checkYieldToEventLoop();
  checkLogicSuites();
  checkListTest();
  checkRunner();
  console.log('PASS: timer yielding, 45 suite hooks, 50 List.test calls, Runner initialization order');
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
