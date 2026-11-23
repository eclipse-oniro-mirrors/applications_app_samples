'use strict';

const assert = require('assert/strict');
const fs = require('fs');
const path = require('path');

const etsRoot = path.join(__dirname, 'ets');
const testRoot = path.join(etsRoot, 'test');
const logicRoot = path.join(testRoot, 'logic');

function sourceFiles(root, extension) {
  const files = [];
  function walk(directory) {
    for (const entry of fs.readdirSync(directory, { withFileTypes: true })) {
      const fullPath = path.join(directory, entry.name);
      if (entry.isDirectory()) {
        walk(fullPath);
      } else if (entry.name.endsWith(extension)) {
        files.push(fullPath);
      }
    }
  }
  walk(root);
  return files.sort();
}

function checkDiscoveryAndHooks() {
  let caseCount = 0;
  for (const file of sourceFiles(testRoot, '.test.ets')) {
    const source = fs.readFileSync(file, 'utf8');
    for (const match of source.matchAll(/^\s*it\(\s*([^,]+),/gm)) {
      const name = match[1].trim();
      assert.ok(/^'[^']*'$/.test(name) || /^"[^"]*"$/.test(name), 'Non-literal it name: ' + file);
      caseCount++;
    }
    assert.ok(!/^\s*(?:describe|it)\([^\n]*\)\s*:\s*void\s*=>/m.test(source), 'Typed callback: ' + file);
  }

  const logicFiles = sourceFiles(logicRoot, '.test.ets');
  assert.equal(logicFiles.length, 40);
  for (const file of logicFiles) {
    const source = fs.readFileSync(file, 'utf8');
    assert.ok(source.includes("import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';"));
    assert.ok(source.includes("import { yieldToEventLoop } from '../EventLoop';"));
    assert.equal((source.match(/^\s*beforeEach\(yieldToEventLoop\);$/gm) || []).length, 1, file);
    assert.ok(/describe\([^\r\n]+, \(\) => \{\r?\n\s*beforeEach\(yieldToEventLoop\);/.test(source), file);
    assert.ok(!source.includes('beforeEachIt'));
  }
  assert.equal(caseCount, 2711);
  return logicFiles.length;
}

function checkRunnerAndSuiteList() {
  const runner = fs.readFileSync(path.join(etsRoot, 'testrunner/OpenHarmonyTestRunner.ets'), 'utf8');
  for (const field of ['__savePath__', '__readPath__', '__testMode__']) {
    assert.ok(runner.includes(field), 'Missing coverage field: ' + field);
  }
  const steps = [
    'abilityDelegatorArguments = abilityDelegatorRegistry.getArguments()',
    'abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()',
    "Object.assign(globalThis, coverageFields)",
    'context = await application.createModuleContext',
    'await checkMock(abilityDelegator, mResourceManager)',
    'await startAbility(bundleName, testAbilityName, moduleName, isDebug)',
    "await import('../test/List.test')",
    'Hypium.hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite)'
  ];
  let previous = -1;
  for (const step of steps) {
    const index = runner.indexOf(step);
    assert.ok(index > previous, 'Runner step missing or out of order: ' + step);
    previous = index;
  }

  let hypiumEntries = 0;
  for (const file of sourceFiles(etsRoot, '.ets')) {
    hypiumEntries += (fs.readFileSync(file, 'utf8').match(/Hypium\.hypiumTest\(/g) || []).length;
  }
  assert.equal(hypiumEntries, 1);
  const testAbility = fs.readFileSync(path.join(etsRoot, 'testability/TestAbility.ets'), 'utf8');
  assert.ok(!testAbility.includes('List.test'));

  const list = fs.readFileSync(path.join(testRoot, 'List.test.ets'), 'utf8');
  const imports = [...list.matchAll(/^import\s+(\w+)\s+from\s+'(\.\/[^']+)';?$/gm)].map((match) => match[1]);
  const body = list.match(/export default function testsuite\(\)\s*\{([\s\S]*?)\n\}/)[1];
  assert.equal(imports.length, 47);
  for (const symbol of imports) {
    assert.equal(body.split(symbol + '()').length - 1, 1, 'Suite registration: ' + symbol);
  }
  const directCalls = body.trim().split(/\r?\n/).filter((line) => /^\s*\w+\(\);?\s*$/.test(line));
  assert.equal(directCalls.length, 47);
  return imports.length;
}

async function checkEventLoopYield() {
  const source = fs.readFileSync(path.join(testRoot, 'EventLoop.ets'), 'utf8');
  assert.ok(!source.includes('Promise.resolve'));
  const match = source.match(/export function yieldToEventLoop\(\): Promise<void> \{\r?\n\s*return new Promise<void>\(\(resolve: \(\) => void\): void => \{\r?\n\s*setTimeout\(resolve, (\d+)\);\r?\n\s*\}\);\r?\n\}/);
  assert.ok(match, 'Unexpected yieldToEventLoop implementation');
  const delay = Number(match[1]);

  let scheduled;
  let timerFired = false;
  function fakeSetTimeout(callback, actualDelay) {
    assert.equal(actualDelay, 1);
    scheduled = () => {
      timerFired = true;
      callback();
    };
  }
  function yieldToEventLoop(setTimeout) {
    return new Promise((resolve) => {
      setTimeout(resolve, delay);
    });
  }
  let completed = false;
  const promise = yieldToEventLoop(fakeSetTimeout).then(() => {
    completed = true;
  });
  await Promise.resolve();
  assert.equal(timerFired, false);
  assert.equal(completed, false);
  assert.equal(typeof scheduled, 'function');
  scheduled();
  await promise;
  assert.equal(timerFired, true);
  assert.equal(completed, true);
}

(async () => {
  const logicSuites = checkDiscoveryAndHooks();
  const registeredSuites = checkRunnerAndSuiteList();
  await checkEventLoopYield();
  console.log('PASS: 2711 literal cases, ' + logicSuites + ' suite hooks, ' + registeredSuites +
    ' direct suite calls, one ordered Runner entry, and timer-gated Promise');
})().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
