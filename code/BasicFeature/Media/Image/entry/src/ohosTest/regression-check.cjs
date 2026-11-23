'use strict';

const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');

const etsDir = path.join(__dirname, 'ets');
const testDir = path.join(etsDir, 'test');
const logicDir = path.join(testDir, 'logic');
const coreSuites = [
  'AdjustDataModelsCore.test.ets',
  'EditFeatureControllerCore.test.ets',
  'ImageParamsComputeCore.test.ets'
];

function read(file) {
  return fs.readFileSync(file, 'utf8');
}

function count(source, pattern) {
  return (source.match(pattern) || []).length;
}

function findRunners(dir) {
  return fs.readdirSync(dir, { withFileTypes: true }).flatMap((entry) => {
    const file = path.join(dir, entry.name);
    if (entry.isDirectory()) {
      return findRunners(file);
    }
    return /^OpenHarmonyTestRunner\.(?:ets|ts)$/.test(entry.name) ? [file] : [];
  });
}

function checkSuites() {
  const logicNames = fs.readdirSync(logicDir).filter((name) => name.endsWith('.test.ets')).sort();
  assert.equal(logicNames.length, 46);
  const rootNames = fs.readdirSync(testDir)
    .filter((name) => name.endsWith('.test.ets') && name !== 'List.test.ets')
    .sort();
  assert.equal(rootNames.length, 7);

  const hookTargets = logicNames.map((name) => ({
    file: path.join(logicDir, name),
    helperImport: "import { yieldToEventLoop } from '../YieldToEventLoop';"
  })).concat(coreSuites.map((name) => ({
    file: path.join(testDir, name),
    helperImport: "import { yieldToEventLoop } from './YieldToEventLoop';"
  })));
  assert.equal(hookTargets.length, 49);
  for (const target of hookTargets) {
    const source = read(target.file);
    assert.ok(source.includes(target.helperImport), target.file);
    assert.equal(count(source, /beforeEach\(yieldToEventLoop\);/g), 1, target.file);
    assert.match(source, /describe\('[^']+', \(\) => \{\r?\n    beforeEach\(yieldToEventLoop\);\r?\n/, target.file);
    assert.ok(!source.includes('beforeEachIt'), target.file);
  }

  const suiteFiles = rootNames.map((name) => path.join(testDir, name))
    .concat(logicNames.map((name) => path.join(logicDir, name)));
  let caseCount = 0;
  for (const file of suiteFiles) {
    const source = read(file);
    const fileCases = count(source, /\bit\s*\(/g);
    assert.equal(count(source, /\bit\s*\(\s*'[^'\r\n]*'\s*,/g), fileCases, file);
    assert.ok(!/\(\)\s*:\s*void\s*=>/.test(source), file);
    caseCount += fileCases;
  }
  assert.equal(caseCount, 2194);
  return caseCount;
}

function checkList() {
  const source = read(path.join(testDir, 'List.test.ets'));
  const imports = Array.from(source.matchAll(/^import\s+(\w+)\s+from\s+'[^']+';$/gm), (match) => match[1]);
  assert.equal(imports.length, 53);
  const body = source.match(/export default function testsuite\(\) \{([\s\S]*?)\}/);
  assert.ok(body);
  const statements = body[1].split(/\r?\n/).map((line) => line.trim()).filter(Boolean);
  const calls = statements.map((statement) => {
    const call = statement.match(/^(\w+)\(\);?$/);
    assert.ok(call, statement);
    return call[1];
  });
  assert.equal(calls.length, imports.length);
  assert.equal(new Set(calls).size, imports.length);
  assert.deepEqual(calls.slice().sort(), imports.slice().sort());
  return imports.length;
}

function checkRunner() {
  const runners = findRunners(etsDir);
  assert.equal(runners.length, 1);
  assert.equal(path.relative(etsDir, runners[0]).split(path.sep).join('/'),
    'testrunner/OpenHarmonyTestRunner.ets');
  const source = read(runners[0]);
  assert.equal(count(source, /Hypium\.hypiumTest\(/g), 1);
  assert.equal(count(source, /await import\('\.\.\/test\/List\.test'\)/g), 1);
  assert.ok(!/import\s+testsuite\s+from/.test(source));
  assert.ok(!source.includes('startAbility('));
  const order = [
    'abilityDelegatorRegistry.getArguments()',
    'abilityDelegatorRegistry.getAbilityDelegator()',
    'global[savePath]',
    'global[readPath]',
    'global[testMode]',
    'await application.createModuleContext(',
    'await doOnRun(context);',
    'await checkMock(abilityDelegator, context.resourceManager);',
    "await import('../test/List.test')",
    'Hypium.hypiumTest('
  ];
  let previous = -1;
  for (const token of order) {
    const current = source.indexOf(token);
    assert.ok(current > previous, token);
    previous = current;
  }
  const testAbility = read(path.join(etsDir, 'testability', 'TestAbility.ets'));
  assert.ok(!testAbility.includes('Hypium.hypiumTest'));
  assert.ok(!testAbility.includes("../test/List.test"));
}

async function checkYield() {
  const source = read(path.join(testDir, 'YieldToEventLoop.ets'));
  assert.ok(source.includes('setTimeout(resolve, 1);'));
  assert.ok(!source.includes('Promise.resolve()'));
  const executable = source
    .replace('export function yieldToEventLoop(): Promise<void>', 'function yieldToEventLoop()')
    .replace('new Promise<void>', 'new Promise');
  assert.ok(!executable.includes('export function yieldToEventLoop'));
  assert.ok(!executable.includes('new Promise<void>'));
  let scheduled;
  const yieldToEventLoop = vm.runInNewContext(executable + '\nyieldToEventLoop;', {
    Promise,
    setTimeout: (callback, delay) => {
      scheduled = { callback, delay };
    }
  });
  let settled = false;
  const pending = yieldToEventLoop();
  assert.equal(typeof pending.then, 'function');
  const observed = pending.then(() => {
    settled = true;
  });
  assert.ok(scheduled);
  assert.equal(scheduled.delay, 1);
  await Promise.resolve();
  assert.equal(settled, false);
  scheduled.callback();
  await observed;
  assert.equal(settled, true);
}

async function main() {
  const cases = checkSuites();
  const suites = checkList();
  checkRunner();
  await checkYield();
  console.log(`PASS: ${cases} cases, ${suites} suite calls, 49 hooks, Runner order, delayed Promise.`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
