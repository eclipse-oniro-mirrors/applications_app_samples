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
const crypto = require('node:crypto');
const fs = require('node:fs');
const path = require('node:path');
const { pathToFileURL } = require('node:url');

const TEST_ROOT = path.join(__dirname, 'ets/test');
const EXPECTED_CASE_COUNT = 2515;
const EXPECTED_NAME_DIGEST = 'c982765c49246c9e91d068f9e32f7359a8fe75d5910b49d9a8ac7a265f77fafd';
const UI_SUITES = new Set(['./EntrySmokeTest.test']);

function walk(directory) {
  return fs.readdirSync(directory, { withFileTypes: true }).flatMap((entry) => {
    const fullPath = path.join(directory, entry.name);
    return entry.isDirectory() ? walk(fullPath) : [fullPath];
  }).sort();
}

function checkCases() {
  const files = walk(TEST_ROOT).filter((file) => file.endsWith('.test.ets') && !file.endsWith('List.test.ets'));
  const cases = {};
  for (const file of files) {
    const text = fs.readFileSync(file, 'utf8');
    const key = path.relative(TEST_ROOT, file).split(path.sep).join('/');
    const names = [...text.matchAll(/\bit\s*\(\s*('[^'\r\n]*'|"[^"\r\n]*")\s*,/g)]
      .map((match) => match[1].slice(1, -1));
    assert.equal(names.length, (text.match(/\bit\s*\(/g) || []).length, key + ' has a non-literal name');
    assert.ok(!text.includes('(): void =>'), key + ' has a typed registration callback');
    cases[key] = names;
  }
  const allNames = Object.values(cases).flat();
  assert.equal(allNames.length, EXPECTED_CASE_COUNT);
  const canonical = Object.keys(cases).sort()
    .map((file) => file + '\n' + cases[file].join('\n')).join('\n');
  assert.equal(crypto.createHash('sha256').update(canonical, 'utf8').digest('hex'), EXPECTED_NAME_DIGEST);
  return files.length;
}

function checkListAndHooks() {
  const listFile = path.join(TEST_ROOT, 'List.test.ets');
  const listText = fs.readFileSync(listFile, 'utf8');
  const imports = [...listText.matchAll(/^import (\w+) from '([^']+)';$/gm)]
    .map((match) => ({ name: match[1], source: match[2] }));
  const body = listText.match(/export default function testsuite\(\) \{([\s\S]*?)\n\}/)[1];
  const statements = body.split(/\r?\n/).map((line) => line.trim()).filter(Boolean);
  assert.deepEqual(statements, imports.map((entry) => entry.name + '();'));
  assert.equal(new Set(statements).size, imports.length);

  let hookCount = 0;
  for (const entry of imports) {
    const text = fs.readFileSync(path.resolve(TEST_ROOT, entry.source + '.ets'), 'utf8');
    if (UI_SUITES.has(entry.source)) {
      continue;
    }
    assert.ok(/describe\('[^']+', \(\) => \{\r?\n\s*beforeEach\(yieldToEventLoop\);/.test(text), entry.source);
    assert.equal((text.match(/\bbeforeEach\s*\(/g) || []).length, 1, entry.source);
    assert.ok(/import \{ yieldToEventLoop \} from '\.\.?\/YieldToEventLoop';/.test(text), entry.source);
    assert.ok(/import \{[^}]*\bbeforeEach\b[^}]*\} from '@ohos\/hypium';/.test(text), entry.source);
    assert.ok(!text.includes('beforeEachIt'), entry.source);
    hookCount++;
  }
  assert.equal(hookCount, 46);
}

function checkRunner() {
  const runner = fs.readFileSync(path.join(__dirname, 'ets/testrunner/OpenHarmonyTestRunner.ets'), 'utf8');
  const order = [
    'abilityDelegatorRegistry.getArguments()',
    'abilityDelegatorRegistry.getAbilityDelegator()',
    'global[savePath]',
    'global[readPath]',
    'global[testMode]',
    'await application.createModuleContext',
    'await checkMock',
    "await import('../test/List.test')",
    'Hypium.hypiumTest'
  ];
  let previous = -1;
  for (const marker of order) {
    const index = runner.indexOf(marker);
    assert.ok(index > previous, 'Runner order: ' + marker);
    previous = index;
  }
  assert.ok(runner.includes("'__savePath__'"));
  assert.ok(runner.includes("'__readPath__'"));
  assert.ok(runner.includes("'__testMode__'"));
  assert.ok(runner.includes('checkMock(abilityDelegator, context.resourceManager)'));
  assert.equal((runner.match(/Hypium\.hypiumTest/g) || []).length, 1);
  assert.equal((runner.match(/await import\('\.\.\/test\/List\.test'\)/g) || []).length, 1);
  assert.ok(!runner.includes('TestAbility'));
  assert.ok(!runner.includes('import testsuite from'));
}

async function checkYield() {
  const helper = await import(pathToFileURL(path.join(TEST_ROOT, 'YieldToEventLoop.ts')).href);
  const originalSetTimeout = globalThis.setTimeout;
  let timerCallback;
  let timerDelay;
  globalThis.setTimeout = (callback, delay) => {
    timerCallback = callback;
    timerDelay = delay;
    return 0;
  };
  let promise;
  try {
    promise = helper.yieldToEventLoop();
  } finally {
    globalThis.setTimeout = originalSetTimeout;
  }
  assert.equal(timerDelay, 1);
  assert.equal(typeof timerCallback, 'function');
  let settled = false;
  const observed = promise.then(() => {
    settled = true;
  });
  await Promise.resolve();
  assert.equal(settled, false);
  timerCallback();
  await observed;
  assert.equal(settled, true);
}

async function main() {
  await checkYield();
  const suiteCount = checkCases();
  checkListAndHooks();
  checkRunner();
  assert.equal(suiteCount, 47);
  console.log('PASS: timer yield, 46 suite hooks, 47 suites, 2515 unchanged names, Runner order');
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
