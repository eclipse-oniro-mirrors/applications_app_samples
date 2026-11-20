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

'use strict';

const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const testRoot = path.join(__dirname, 'ets', 'test');
const logicRoot = path.join(testRoot, 'logic');
const read = file => fs.readFileSync(file, 'utf8');
const count = (source, pattern) => (source.match(pattern) || []).length;
const rootSuites = fs.readdirSync(testRoot).filter(file => file.endsWith('.test.ets'));
const logicSuites = fs.readdirSync(logicRoot).filter(file => file.endsWith('.test.ets'));
const allSuites = rootSuites.map(file => path.join(testRoot, file))
  .concat(logicSuites.map(file => path.join(logicRoot, file)));

let caseCount = 0;
for (const file of allSuites) {
  const source = read(file);
  const allCases = count(source, /^[ \t]*it\(/gm);
  const literalCases = count(source, /^[ \t]*it\([ \t]*'[^']+'[ \t]*,/gm);
  assert.equal(literalCases, allCases, file + ': every it name must be a string literal');
  assert.doesNotMatch(source, /\)[ \t]*:[ \t]*void[ \t]*=>/, file + ': typed registration callback');
  assert.doesNotMatch(source, /beforeEachIt/, file + ': unsupported hook');
  caseCount += allCases;
}
assert.equal(caseCount, 2300, 'test case count changed');

const listSource = read(path.join(testRoot, 'List.test.ets'));
const importedSuites = Array.from(listSource.matchAll(/^import (\w+) from '[^']+';/gm), match => match[1]);
const suiteBody = listSource.match(/export default function testsuite\(\) \{([\s\S]*?)\}/);
assert.ok(suiteBody, 'default testsuite is missing');
const statements = suiteBody[1].split(/\r?\n/).map(line => line.trim()).filter(Boolean);
for (const statement of statements) {
  assert.match(statement, /^\w+\(\);$/, 'testsuite must only contain direct suite calls');
}
const calledSuites = statements.map(statement => statement.slice(0, -3));
assert.equal(importedSuites.length, 49, 'suite import count changed');
assert.equal(calledSuites.length, 49, 'suite call count changed');
assert.equal(new Set(calledSuites).size, calledSuites.length, 'duplicate suite registration');
assert.deepEqual(calledSuites.slice().sort(), importedSuites.slice().sort(), 'suite imports and calls differ');

assert.equal(logicSuites.length, 43, 'logic suite count changed');
for (const file of logicSuites) {
  const source = read(path.join(logicRoot, file));
  assert.equal(count(source, /beforeEach\(yieldToEventLoop\);/g), 1, file + ': hook registration');
  assert.equal(count(source, /import \{ yieldToEventLoop \} from '\.\.\/YieldToEventLoop';/g), 1,
    file + ': helper import');
  assert.match(source, /describe\('[^']+', \(\) => \{\r?\n {4}beforeEach\(yieldToEventLoop\);/,
    file + ': hook must be inside describe');
}

const runnerSource = read(path.join(__dirname, 'ets', 'testrunner', 'OpenHarmonyTestRunner.ets'));
const initializationOrder = [
  'abilityDelegatorRegistry.getArguments()',
  'abilityDelegatorRegistry.getAbilityDelegator()',
  'coverageGlobal.__savePath__',
  'coverageGlobal.__readPath__',
  'coverageGlobal.__testMode__',
  '.createModuleContext(moduleName)',
  'await checkMock(',
  "await import('../test/List.test')",
  'Hypium.hypiumTest('
];
let previousIndex = -1;
for (const token of initializationOrder) {
  const tokenIndex = runnerSource.indexOf(token);
  assert.ok(tokenIndex > previousIndex, 'Runner initialization order: ' + token);
  previousIndex = tokenIndex;
}
assert.equal(count(runnerSource, /Hypium\.hypiumTest\(/g), 1, 'Runner must have one Hypium entry');
assert.doesNotMatch(runnerSource, /^import testsuite from/m, 'List.test must use dynamic import');
assert.doesNotMatch(runnerSource, /TestAbility|startAbility/, 'Runner must not start a second test entry');

async function checkYieldToEventLoop() {
  const helperSource = read(path.join(testRoot, 'YieldToEventLoop.ets'))
    .replace('export function yieldToEventLoop(): Promise<void>', 'function yieldToEventLoop()')
    .replace('new Promise<void>', 'new Promise');
  let timerCallback;
  let timerDelay;
  const context = vm.createContext({
    Promise,
    setTimeout: (callback, delay) => {
      timerCallback = callback;
      timerDelay = delay;
    }
  });
  vm.runInContext(helperSource + '\nthis.yieldToEventLoop = yieldToEventLoop;', context);
  let completed = false;
  const pending = context.yieldToEventLoop();
  pending.then(() => {
    completed = true;
  });
  assert.equal(timerDelay, 1, 'yield must schedule a 1ms timer');
  assert.equal(typeof timerCallback, 'function', 'yield must schedule the Promise resolver');
  assert.equal(completed, false, 'Promise completed before the timer fired');
  timerCallback();
  await pending;
  assert.equal(completed, true, 'Promise did not complete after the timer fired');
}

checkYieldToEventLoop().then(() => {
  console.log('PASS: 2300 cases, 49 suites, 43 yielding logic suites, Runner order and timer behavior');
}).catch(error => {
  console.error(error);
  process.exitCode = 1;
});
