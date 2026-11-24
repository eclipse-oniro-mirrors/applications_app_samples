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

const projectRoot = path.dirname(fileURLToPath(import.meta.url));
const testRoot = path.join(projectRoot, 'entry/src/ohosTest/ets/test');
const listPath = path.join(testRoot, 'List.test.ets');
const helperPath = path.join(testRoot, 'EventLoopYield.ets');
const runnerPath = path.join(projectRoot, 'entry/src/ohosTest/ets/testrunner/OpenHarmonyTestRunner.ets');
const listSource = fs.readFileSync(listPath, 'utf8');
const imports = [...listSource.matchAll(/^import (\w+) from '(.+)';$/gm)].map((match) => ({
  name: match[1],
  modulePath: match[2]
}));
const suiteMatch = listSource.match(/export default function testsuite\(\) \{\r?\n([\s\S]*?)\r?\n\}/);
assert(suiteMatch, 'List.test must have a default testsuite');
const statements = suiteMatch[1].split(/\r?\n/).filter((line) => line.trim().length > 0);
const calls = statements.map((line) => {
  const call = line.match(/^  (\w+)\(\);$/);
  assert(call, 'testsuite must contain only direct suite calls: ' + line);
  return call[1];
});
assert.equal(imports.length, 45);
assert.equal(calls.length, imports.length);
assert.equal(new Set(calls).size, calls.length);
for (const entry of imports) {
  assert.equal(calls.filter((name) => name === entry.name).length, 1, entry.name + ' must be called once');
}

const uiSuites = new Set(['Abiility.test.ets', 'LoginUiState.test.ets']);
const suites = imports.map((entry) => {
  const filePath = path.resolve(path.dirname(listPath), entry.modulePath + '.ets');
  return { filePath, source: fs.readFileSync(filePath, 'utf8') };
});
const allNames = [];
for (const suite of suites) {
  const caseCount = (suite.source.match(/^\s*it\s*\(/gm) || []).length;
  const names = [...suite.source.matchAll(/^\s*it\s*\(\s*'([^'\r\n]+)'/gm)].map((match) => match[1]);
  const metadataNames = [...suite.source.matchAll(/@tc\.name[ \t]+(\S+)/g)].map((match) => match[1]);
  assert.equal(names.length, caseCount, suite.filePath + ': every it name must be a string literal');
  assert.deepEqual(names, metadataNames, suite.filePath + ': literal names must preserve @tc.name');
  assert(!suite.source.includes('(): void =>'), suite.filePath + ': registration callbacks must use () =>');
  allNames.push(...names);
}
assert.equal(allNames.length, 1977);
assert.equal(new Set(allNames).size, allNames.length, 'test names must remain unique');

const logicalSuites = suites.filter((suite) => !uiSuites.has(path.basename(suite.filePath)));
assert.equal(logicalSuites.length, 43);
for (const suite of logicalSuites) {
  const hookPattern = /^  describe\('[^']+', \(\) => \{\r?\n    beforeEach\(yieldToEventLoop\);\r?\n/m;
  assert(hookPattern.test(suite.source), suite.filePath + ': hook must be directly inside describe');
  assert.equal((suite.source.match(/beforeEach\(yieldToEventLoop\);/g) || []).length, 1, suite.filePath);
  assert(/import \{ beforeEach, [^}\r\n]+\} from '@ohos\/hypium';/.test(suite.source), suite.filePath);
  const relativeHelper = path.relative(path.dirname(suite.filePath), helperPath)
    .replace(/\\/g, '/').replace(/\.ets$/, '');
  const helperImport = relativeHelper.startsWith('.') ? relativeHelper : './' + relativeHelper;
  assert(suite.source.includes("import { yieldToEventLoop } from '" + helperImport + "';"), suite.filePath);
}
for (const suite of suites.filter((entry) => uiSuites.has(path.basename(entry.filePath)))) {
  assert(!suite.source.includes('beforeEach(yieldToEventLoop)'), suite.filePath + ': UI suite is not a target');
}

const helperSource = fs.readFileSync(helperPath, 'utf8');
assert(!helperSource.includes('Promise.resolve'));
const runnableHelper = helperSource
  .replace('export function yieldToEventLoop(): Promise<void>', 'function yieldToEventLoop()')
  .replace('(resolve: () => void)', '(resolve)')
  .replace('new Promise<void>', 'new Promise');
let timerCallback;
let timerDelay;
const context = {
  setTimeout: (callback, delay) => {
    assert.equal(timerCallback, undefined, 'yieldToEventLoop must schedule one timer');
    timerCallback = callback;
    timerDelay = delay;
  }
};
vm.runInNewContext(runnableHelper + '\nthis.yieldToEventLoop = yieldToEventLoop;', context);
let completed = false;
const yielded = context.yieldToEventLoop();
assert.equal(typeof yielded.then, 'function');
const observed = yielded.then(() => {
  completed = true;
});
await Promise.resolve();
assert.equal(completed, false, 'Promise must remain pending before the timer fires');
assert.equal(timerDelay, 1);
assert.equal(typeof timerCallback, 'function');
timerCallback();
await observed;
assert.equal(completed, true);

const runner = fs.readFileSync(runnerPath, 'utf8');
const checkpoints = [
  'abilityDelegatorArguments = abilityDelegatorRegistry.getArguments();',
  'abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();',
  'global[SAVE_PATH_KEY] =',
  'global[READ_PATH_KEY] =',
  'global[TEST_MODE_KEY] =',
  'await application.createModuleContext(',
  'await checkMock(abilityDelegator, context.resourceManager);',
  "const testList = await import('../test/List.test');",
  'Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testList.default);'
];
let previousIndex = -1;
for (const checkpoint of checkpoints) {
  const index = runner.indexOf(checkpoint);
  assert(index > previousIndex, 'Runner initialization order: ' + checkpoint);
  previousIndex = index;
}
assert.equal((runner.match(/Hypium\.hypiumTest\s*\(/g) || []).length, 1);
assert.equal((runner.match(/await import\('\.\.\/test\/List\.test'\)/g) || []).length, 1);
assert(!/^import .*List\.test/m.test(runner), 'List.test must be imported dynamically');
assert(!/\bstartAbility\s*\(/.test(runner), 'Runner must not start a second test entry');
assert(!runner.includes('TestAbility'));
assert(runner.includes('delegator.setMockList(mockMap);'));

console.log('OK: 45 suites, 1977 literal cases, 43 hooks, Runner order, timer-gated Promise.');
