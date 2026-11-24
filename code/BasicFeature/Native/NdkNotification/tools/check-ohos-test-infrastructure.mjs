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

import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';
import vm from 'node:vm';
import { fileURLToPath } from 'node:url';

const projectRoot = fileURLToPath(new URL('../', import.meta.url));
const testRoot = path.join(projectRoot, 'entry/src/ohosTest/ets/test');
const logicRoot = path.join(testRoot, 'logic');
const read = (file) => fs.readFileSync(file, 'utf8');
const count = (source, pattern) => (source.match(pattern) || []).length;

const runner = read(path.join(projectRoot, 'entry/src/ohosTest/ets/testrunner/OpenHarmonyTestRunner.ets'));
const orderedSteps = [
  'abilityDelegatorRegistry.getArguments()',
  'abilityDelegatorRegistry.getAbilityDelegator()',
  'globalObject[savePath]',
  'createModuleContext(moduleName)',
  'await checkMock(',
  "await import('../test/List.test')",
  'Hypium.hypiumTest('
];
let previousPosition = -1;
for (const step of orderedSteps) {
  const position = runner.indexOf(step);
  assert.ok(position > previousPosition, `Runner step missing or out of order: ${step}`);
  previousPosition = position;
}
for (const field of ['globalObject[readPath]', 'globalObject[testMode]']) {
  assert.ok(runner.includes(field), `Missing coverage field: ${field}`);
}
assert.equal(count(runner, /Hypium\.hypiumTest\(/g), 1, 'Hypium entry must run once');
assert.equal(count(runner, /await import\('\.\.\/test\/List\.test'\)/g), 1, 'List.test must be imported once');
assert.ok(!runner.includes('import testsuite'), 'List.test must not be statically imported');
assert.ok(!runner.includes('startAbility') && !runner.includes('TestAbility'), 'Runner must not start a second test entry');

const logicFiles = fs.readdirSync(logicRoot)
  .filter((name) => name.endsWith('.test.ets'))
  .sort()
  .map((name) => path.join(logicRoot, name));
const targetFiles = [
  ...logicFiles,
  path.join(testRoot, 'NapiQueryCore.test.ets'),
  path.join(testRoot, 'NapiQueryExtended.test.ets')
];
assert.equal(targetFiles.length, 53, 'Unexpected logic suite count');
for (const file of targetFiles) {
  const source = read(file);
  const helperPath = file.startsWith(logicRoot) ? '../YieldToEventLoop' : './YieldToEventLoop';
  assert.ok(source.includes(`import { yieldToEventLoop } from '${helperPath}';`), `Missing helper import: ${file}`);
  assert.ok(source.includes('beforeEach, describe,'), `Missing beforeEach import: ${file}`);
  assert.equal(count(source, /beforeEach\(yieldToEventLoop\);/g), 1, `Missing or duplicate hook: ${file}`);
  assert.match(source, /describe\('[^']+', \(\) => \{\r?\n    beforeEach\(yieldToEventLoop\);/,
    `Hook must be directly inside describe: ${file}`);
  assert.ok(!source.includes('beforeEachIt'), `Unsupported hook used: ${file}`);
}

const allTestFiles = [];
function collectTests(directory) {
  for (const entry of fs.readdirSync(directory, { withFileTypes: true })) {
    const file = path.join(directory, entry.name);
    if (entry.isDirectory()) collectTests(file);
    else if (entry.name.endsWith('.test.ets')) allTestFiles.push(file);
  }
}
collectTests(testRoot);
let testCount = 0;
for (const file of allTestFiles) {
  const source = read(file);
  if (!/\bit\s*\(/.test(source)) continue;
  const registrations = count(source, /\bit\s*\(/g);
  const literalNames = count(source, /\bit\s*\(\s*'[^']+'\s*,/g);
  assert.equal(literalNames, registrations, `Non-literal test name: ${file}`);
  assert.ok(!/\(\)\s*:\s*void\s*=>/.test(source), `Non-conventional callback: ${file}`);
  testCount += registrations;
}
assert.equal(testCount, 2725, 'Test case count changed');
for (const name of ['Ability.test.ets', 'NdkUiState.test.ets']) {
  assert.ok(!read(path.join(testRoot, name)).includes('beforeEach(yieldToEventLoop)'), `Unexpected UI hook: ${name}`);
}

const list = read(path.join(testRoot, 'List.test.ets'));
const suiteBody = list.match(/export default function testsuite\(\) \{([\s\S]*?)\r?\n\}/);
assert.ok(suiteBody, 'Missing default testsuite');
const statements = suiteBody[1].split(/\r?\n/).map((line) => line.trim()).filter(Boolean);
assert.ok(statements.every((line) => /^[A-Za-z_$][\w$]*\(\);$/.test(line)), 'testsuite must only contain direct calls');
assert.equal(statements.length, 55, 'Suite registration count changed');
assert.equal(new Set(statements).size, statements.length, 'Duplicate suite registration');

const helper = read(path.join(testRoot, 'YieldToEventLoop.ets'));
const functionSource = helper.match(/export function yieldToEventLoop\(\): Promise<void> \{[\s\S]*?\n\}/);
assert.ok(functionSource, 'Missing yieldToEventLoop function');
const javascript = functionSource[0]
  .replace('export function ', 'function ')
  .replace('(): Promise<void>', '()')
  .replace('new Promise<void>', 'new Promise')
  .replace('(resolve: () => void)', '(resolve)');
const timers = [];
const sandbox = {
  setTimeout: (callback, delay) => timers.push({ callback, delay })
};
vm.createContext(sandbox);
vm.runInContext(javascript + '\nthis.yieldToEventLoop = yieldToEventLoop;', sandbox);
const promise = sandbox.yieldToEventLoop();
let settled = false;
promise.then(() => {
  settled = true;
});
assert.equal(timers.length, 1, 'Helper must schedule exactly one timer');
assert.equal(timers[0].delay, 1, 'Helper must use a 1ms timer');
await new Promise((resolve) => setImmediate(resolve));
assert.equal(settled, false, 'Promise completed before the timer fired');
timers[0].callback();
await promise;
assert.equal(settled, true, 'Promise did not complete after the timer fired');

console.log(`OK: ${testCount} cases, ${targetFiles.length} logic hooks, 55 direct suite calls, Runner order and timer behavior.`);
