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
const { pathToFileURL } = require('node:url');

const testRoot = path.join(__dirname, 'ets', 'test');
const uiFiles = new Set(['Ability.test.ets', 'VerifyCodeUiState.test.ets']);

function collectTestFiles(directory) {
  const files = [];
  for (const entry of fs.readdirSync(directory, { withFileTypes: true })) {
    const fullPath = path.join(directory, entry.name);
    if (entry.isDirectory()) {
      files.push(...collectTestFiles(fullPath));
    } else if (entry.name.endsWith('.test.ets')) {
      files.push(fullPath);
    }
  }
  return files.sort();
}

function countMatches(source, regex) {
  return (source.match(regex) || []).length;
}

async function main() {
  const allFiles = collectTestFiles(testRoot);
  const listPath = path.join(testRoot, 'List.test.ets');
  const suiteFiles = allFiles.filter((file) => file !== listPath);
  const targetFiles = suiteFiles.filter((file) => !uiFiles.has(path.basename(file)));
  assert.equal(allFiles.length, 49);
  assert.equal(suiteFiles.length, 48);
  assert.equal(targetFiles.length, 46);

  const caseNames = [];
  for (const file of suiteFiles) {
    const source = fs.readFileSync(file, 'utf8');
    const relative = path.relative(testRoot, file).replaceAll('\\', '/');
    const describeLines = source.split('\n').filter((line) => /^\s*describe\s*\(/.test(line));
    assert.equal(describeLines.length, 1, relative + ' must contain one suite');
    assert.match(describeLines[0], /,\s*\(\)\s*=>\s*\{/, relative + ' has a non-arrow describe callback');
    const itCalls = countMatches(source, /\bit\s*\(/g);
    const literalNames = Array.from(source.matchAll(/\bit\s*\(\s*'([^']+)'/g), (match) => match[1]);
    assert.equal(literalNames.length, itCalls, relative + ' has a non-literal it name');
    const itLines = source.split('\n').filter((line) => /^\s*it\s*\(/.test(line));
    assert.equal(itLines.length, itCalls, relative + ' has a multiline it registration');
    for (const line of itLines) {
      assert.match(line, /,\s*(?:async\s+)?\(\)\s*=>\s*\{/, relative + ' has a non-arrow it callback');
    }
    assert.doesNotMatch(source, /:\s*void\s*=>/, relative + ' has a typed registration callback');
    caseNames.push(...literalNames);
  }
  assert.equal(caseNames.length, 2524);
  assert.equal(new Set(caseNames).size, caseNames.length);

  const listSource = fs.readFileSync(listPath, 'utf8');
  const imports = new Map(Array.from(
    listSource.matchAll(/import\s+([A-Za-z_$][\w$]*)\s+from\s+'([^']+)';/g),
    (match) => [match[2], match[1]]
  ));
  const suiteBody = listSource.match(/export default function testsuite\(\) \{([\s\S]*?)\n\}/);
  assert.ok(suiteBody);
  const statements = suiteBody[1].split(';').map((statement) => statement.trim()).filter(Boolean);
  assert.equal(imports.size, 48);
  assert.equal(statements.length, 48);
  for (const statement of statements) {
    assert.match(statement, /^[A-Za-z_$][\w$]*\(\)$/);
  }
  for (const file of suiteFiles) {
    const relative = path.relative(testRoot, file).replaceAll('\\', '/').replace(/\.ets$/, '');
    const importName = imports.get('./' + relative);
    assert.ok(importName, relative + ' is not imported');
    assert.equal(statements.filter((statement) => statement === importName + '()').length, 1,
      relative + ' is not called exactly once');
  }

  for (const file of targetFiles) {
    const source = fs.readFileSync(file, 'utf8');
    const relative = path.relative(testRoot, file).replaceAll('\\', '/');
    const helperPath = relative.startsWith('logic/') ? '../TestExecution' : './TestExecution';
    assert.ok(source.includes("import { yieldToEventLoop } from '" + helperPath + "';"), relative);
    assert.match(source, /import\s*\{[^}]*\bbeforeEach\b[^}]*\}\s*from\s*'@ohos\/hypium';/);
    assert.equal(countMatches(source, /^\s*beforeEach\(yieldToEventLoop\);$/gm), 1, relative);
    const describeIndex = source.indexOf('describe(');
    const hookIndex = source.indexOf('beforeEach(yieldToEventLoop);');
    const firstItIndex = source.indexOf('it(');
    assert.ok(describeIndex < hookIndex && hookIndex < firstItIndex, relative + ' hook is outside describe');
  }

  const runner = fs.readFileSync(path.join(__dirname, 'ets', 'testrunner', 'OpenHarmonyTestRunner.ets'), 'utf8');
  assert.doesNotMatch(runner, /^import\s+testsuite/m);
  assert.ok(!runner.includes('TestAbility'));
  assert.ok(!runner.includes('startAbility'));
  assert.equal(countMatches(runner, /Hypium\.hypiumTest\(/g), 1);
  assert.equal(countMatches(runner, /await import\('\.\.\/test\/List\.test'\)/g), 1);
  for (const field of ['global.__savePath__ =', 'global.__readPath__ =', 'global.__testMode__ =']) {
    assert.ok(runner.includes(field));
  }
  assert.ok(runner.includes('delegator.setMockList(mockMap)'));
  const orderedSteps = [
    'abilityDelegatorRegistry.getArguments()',
    'abilityDelegatorRegistry.getAbilityDelegator()',
    'global.__savePath__ =',
    'application.createModuleContext(',
    'await checkMock(',
    "await import('../test/List.test')",
    'Hypium.hypiumTest('
  ];
  let previousIndex = -1;
  for (const step of orderedSteps) {
    const stepIndex = runner.indexOf(step);
    assert.ok(stepIndex > previousIndex, 'Runner step is missing or out of order: ' + step);
    previousIndex = stepIndex;
  }

  const helperPath = path.join(testRoot, 'TestExecution.ts');
  const helper = fs.readFileSync(helperPath, 'utf8');
  assert.ok(helper.includes('setTimeout(resolve, 1);'));
  assert.ok(!helper.includes('Promise.resolve()'));
  const { yieldToEventLoop } = await import(pathToFileURL(helperPath).href);
  let settled = false;
  const pending = yieldToEventLoop();
  assert.ok(pending instanceof Promise);
  const observed = pending.then(() => {
    settled = true;
  });
  assert.equal(settled, false);
  await Promise.resolve();
  assert.equal(settled, false);
  await observed;
  assert.equal(settled, true);

  console.log('PASS: 2524 cases, 48 suites, 46 hooks; timer and Runner order verified.');
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
