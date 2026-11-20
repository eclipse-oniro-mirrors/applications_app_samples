'use strict';

const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');

const TEST_ROOT = path.join(__dirname, 'ets', 'test');
const EXPECTED_SUITES = 49;
const EXPECTED_CASES = 2559;
const EXPECTED_LOGIC_SUITES = 48;

function read(filePath) {
  return fs.readFileSync(filePath, 'utf8');
}

function walk(directory) {
  const files = [];
  for (const entry of fs.readdirSync(directory, { withFileTypes: true })) {
    const filePath = path.join(directory, entry.name);
    if (entry.isDirectory()) {
      files.push(...walk(filePath));
    } else {
      files.push(filePath);
    }
  }
  return files;
}

function occurrences(source, token) {
  return source.split(token).length - 1;
}

const listPath = path.join(TEST_ROOT, 'List.test.ets');
const listSource = read(listPath);
const imports = Array.from(listSource.matchAll(/^import ([A-Za-z_$][\w$]*) from '(\.[^']+)';\r?$/gm),
  match => ({ name: match[1], filePath: path.resolve(path.dirname(listPath), match[2] + '.ets') }));
assert.equal(imports.length, EXPECTED_SUITES, 'List.test import count');
assert.equal(new Set(imports.map(item => item.name)).size, EXPECTED_SUITES, 'duplicate suite import');
assert.equal(new Set(imports.map(item => item.filePath)).size, EXPECTED_SUITES, 'duplicate suite path');

const bodyMatch = listSource.match(/export default function testsuite\(\) \{\r?\n([\s\S]*?)\r?\n\}/);
assert(bodyMatch, 'List.test default testsuite missing');
const statements = bodyMatch[1].split(/\r?\n/).map(line => line.trim()).filter(Boolean);
assert(statements.every(statement => /^[A-Za-z_$][\w$]*\(\);$/.test(statement)),
  'testsuite must contain direct suite calls only');
const calls = statements.map(statement => statement.slice(0, statement.indexOf('(')));
assert.deepEqual(calls.slice().sort(), imports.map(item => item.name).sort(), 'suite imports and calls differ');
assert.equal(new Set(calls).size, EXPECTED_SUITES, 'suite registered more than once');

const suiteFiles = walk(TEST_ROOT).filter(filePath => filePath.endsWith('.test.ets') && filePath !== listPath);
assert.equal(suiteFiles.length, EXPECTED_SUITES, 'test suite file count');
assert.deepEqual(imports.map(item => item.filePath).sort(), suiteFiles.slice().sort(), 'unregistered suite file');
for (const item of imports) {
  assert(fs.existsSync(item.filePath), 'missing suite: ' + item.filePath);
}

const caseNames = [];
for (const filePath of suiteFiles) {
  const source = read(filePath);
  const allItCalls = Array.from(source.matchAll(/\bit\(/g));
  const literalItCalls = Array.from(source.matchAll(/\bit\(\s*'([^']*)'\s*,/g));
  assert.equal(literalItCalls.length, allItCalls.length, 'non-literal it name: ' + filePath);
  assert(!source.includes('(): void =>'), 'typed registration callback: ' + filePath);
  for (const match of literalItCalls) {
    const nameIndex = source.lastIndexOf('@tc.name', match.index);
    assert(nameIndex >= 0, 'missing @tc.name for ' + match[1]);
    const nameLine = source.slice(nameIndex, source.indexOf('\n', nameIndex));
    assert(nameLine.includes(match[1]), 'runtime name changed: ' + match[1]);
    caseNames.push(match[1]);
  }
}
assert.equal(caseNames.length, EXPECTED_CASES, 'test case count');
assert.equal(new Set(caseNames).size, EXPECTED_CASES, 'duplicate runtime test name');

const logicFiles = suiteFiles.filter(filePath => path.basename(filePath) !== 'LocationUiState.test.ets');
assert.equal(logicFiles.length, EXPECTED_LOGIC_SUITES, 'non-UI suite count');
for (const filePath of logicFiles) {
  const source = read(filePath);
  assert.equal(occurrences(source, 'beforeEach(yieldToEventLoop);'), 1, 'yield hook count: ' + filePath);
  assert(/describe\('[^']+', \(\) => \{\r?\n    beforeEach\(yieldToEventLoop\);/.test(source),
    'yield hook must be inside describe: ' + filePath);
  assert(source.includes("from './TestYield'") || source.includes("from '../TestYield'"),
    'shared yield import missing: ' + filePath);
  assert(!source.includes('beforeEachIt'), 'unsupported Hypium hook: ' + filePath);
}

const runnerPath = path.join(__dirname, 'ets', 'testrunner', 'OpenHarmonyTestRunner.ets');
const runnerSource = read(runnerPath);
const testAbilitySource = read(path.join(__dirname, 'ets', 'testability', 'TestAbility.ets'));
assert.equal(occurrences(runnerSource, 'Hypium.hypiumTest('), 1, 'Runner Hypium entry count');
assert(!testAbilitySource.includes('Hypium') && !testAbilitySource.includes('List.test'),
  'TestAbility must not register tests');
const runnerFiles = walk(path.join(__dirname, 'ets')).filter(filePath =>
  path.basename(filePath).startsWith('OpenHarmonyTestRunner.'));
assert.deepEqual(runnerFiles, [runnerPath], 'duplicate or misplaced Runner');
const orderedTokens = [
  'abilityDelegatorRegistry.getArguments()',
  'abilityDelegatorRegistry.getAbilityDelegator()',
  'global[savePath] =',
  'global[readPath] =',
  'global[testMode] =',
  'createModuleContext(moduleName)',
  'await checkMock(',
  "await import('../test/List.test')",
  'Hypium.hypiumTest('
];
const positions = orderedTokens.map(token => runnerSource.indexOf(token));
assert(positions.every(position => position >= 0), 'Runner initialization step missing');
assert(positions.every((position, index) => index === 0 || positions[index - 1] < position),
  'Runner initialization order');
assert(!runnerSource.includes('executeShellCommand') && !runnerSource.includes('addAbilityMonitor'),
  'Runner must not start a second test entry');

async function checkYieldToEventLoop() {
  const yieldPath = path.join(TEST_ROOT, 'TestYield.ts');
  const source = read(yieldPath);
  assert(source.includes('setTimeout(resolve, 1);'), '1ms timer yield missing');
  assert(!source.includes('Promise.resolve'), 'Promise.resolve is not an event-loop yield');
  const nativeSetTimeout = global.setTimeout;
  let timerCallback;
  let timerDelay;
  global.setTimeout = (callback, delay) => {
    timerCallback = callback;
    timerDelay = delay;
    return 0;
  };
  try {
    const { yieldToEventLoop } = require(yieldPath);
    let completed = false;
    const pending = yieldToEventLoop().then(() => {
      completed = true;
    });
    await new Promise(resolve => nativeSetTimeout(resolve, 5));
    assert.equal(timerDelay, 1, 'yield timer delay');
    assert.equal(typeof timerCallback, 'function', 'yield timer callback');
    assert.equal(completed, false, 'Promise completed before the timer fired');
    timerCallback();
    await new Promise(resolve => nativeSetTimeout(resolve, 5));
    assert.equal(completed, true, 'Promise did not complete after the timer fired');
    await pending;
  } finally {
    global.setTimeout = nativeSetTimeout;
  }
}

checkYieldToEventLoop().then(() => {
  console.log('PASS: ' + EXPECTED_SUITES + ' suites, ' + EXPECTED_CASES +
    ' cases, ' + EXPECTED_LOGIC_SUITES + ' yield hooks, Runner order, and timer behavior.');
}).catch(error => {
  console.error(error);
  process.exitCode = 1;
});
