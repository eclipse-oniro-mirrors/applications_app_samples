const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const { pathToFileURL } = require('node:url');

const testDir = path.join(__dirname, 'ets/test');
const listSource = fs.readFileSync(path.join(testDir, 'List.test.ets'), 'utf8');

function checkRegistrationsAndHooks() {
  const imports = [...listSource.matchAll(/^import\s+(\w+)\s+from\s+'([^']+)';$/gm)]
    .map(match => ({ symbol: match[1], module: match[2] }));
  const body = listSource.match(/export default function testsuite\(\) \{([\s\S]*?)\r?\n\}/);
  assert(body, 'List.test default testsuite is missing');
  const statements = body[1].trim().split(/\r?\n/).map(line => line.trim());
  assert(statements.every(line => /^\w+\(\);$/.test(line)), 'testsuite must contain direct calls only');
  assert.equal(statements.length, imports.length, 'List.test import/call count mismatch');
  for (const item of imports) {
    assert.equal(statements.filter(line => line === item.symbol + '();').length, 1,
      item.symbol + ' must be registered exactly once');
  }

  const logicDir = path.join(testDir, 'logic');
  const logicFiles = fs.readdirSync(logicDir).filter(file => file.endsWith('.test.ets')).sort();
  const logicImports = imports.filter(item => item.module.startsWith('./logic/'));
  assert.deepEqual(logicImports.map(item => path.basename(item.module) + '.ets').sort(), logicFiles,
    'Every logic test file must be imported by List.test');
  for (const item of logicImports) {
    const source = fs.readFileSync(path.resolve(testDir, item.module + '.ets'), 'utf8');
    assert.equal((source.match(/beforeEach\(yieldToEventLoop\);/g) || []).length, 1,
      item.module + ' must register one event-loop yield hook');
    assert.match(source, /import\s*\{[^}]*\bbeforeEach\b[^}]*\}\s*from\s*'@ohos\/hypium';/,
      item.module + ' must import beforeEach from Hypium');
    assert.match(source, /import\s*\{\s*yieldToEventLoop\s*\}\s*from\s*'\.\.\/\.\.\/utils\/EventLoopYield';/,
      item.module + ' must import the shared yield function');
    const describeIndex = source.indexOf('describe(');
    const hookIndex = source.indexOf('beforeEach(yieldToEventLoop);');
    const firstItIndex = source.indexOf('it(');
    assert(describeIndex >= 0 && hookIndex > describeIndex && firstItIndex > hookIndex,
      item.module + ' hook must be inside describe before its first case');
    assert(!/\bit\s*\(\s*`/.test(source), item.module + ' contains a dynamic test name');
    assert(!/\b(?:describe|it)\s*\([^\n]*\(\)\s*:\s*void\s*=>/.test(source),
      item.module + ' contains a typed registration callback');
  }
  return logicImports.length;
}

function checkRunner() {
  const source = fs.readFileSync(path.join(__dirname, 'ets/testrunner/OpenHarmonyTestRunner.ets'), 'utf8');
  const steps = [
    'abilityDelegatorRegistry.getArguments()',
    'abilityDelegatorRegistry.getAbilityDelegator()',
    'global[savePath]',
    'global[readPath]',
    'global[testMode]',
    'createModuleContext(moduleName)',
    'await checkMock(',
    "await import('../test/List.test')",
    'Hypium.hypiumTest('
  ];
  let previous = -1;
  for (const step of steps) {
    const index = source.indexOf(step);
    assert(index > previous, 'Runner step missing or out of order: ' + step);
    previous = index;
  }
  assert.equal((source.match(/Hypium\.hypiumTest\(/g) || []).length, 1,
    'Runner must have exactly one Hypium entry');
  assert(!/^import\s+testsuite\s+from/m.test(source), 'List.test must not be statically imported');
  assert(!/startAbility\(|TestAbility/.test(source), 'Runner must not start the default TestAbility entry');
}

async function checkYieldToEventLoop() {
  const helperPath = path.join(__dirname, 'ets/utils/EventLoopYield.ts');
  const helper = fs.readFileSync(helperPath, 'utf8');
  assert.match(helper, /return new Promise<void>/, 'Hook must return a Promise');
  assert.match(helper, /setTimeout\(resolve, 1\);/, 'Hook must complete through setTimeout(resolve, 1)');
  const { yieldToEventLoop } = await import(pathToFileURL(helperPath).href);
  let timerCallback;
  let timerDelay;
  const fakeSetTimeout = (callback, delay) => {
    timerCallback = callback;
    timerDelay = delay;
  };
  const originalSetTimeout = globalThis.setTimeout;
  try {
    globalThis.setTimeout = fakeSetTimeout;
    let completed = false;
    const completion = yieldToEventLoop().then(() => {
      completed = true;
    });
    assert.equal(timerDelay, 1, 'Yield timer must use 1ms');
    assert.equal(typeof timerCallback, 'function', 'Yield must schedule its Promise resolver');
    await new Promise(resolve => queueMicrotask(resolve));
    assert.equal(completed, false, 'Promise completed before the timer callback');
    timerCallback();
    await completion;
    assert.equal(completed, true, 'Promise did not complete after the timer callback');
  } finally {
    globalThis.setTimeout = originalSetTimeout;
  }
}

async function main() {
  const logicSuites = checkRegistrationsAndHooks();
  checkRunner();
  await checkYieldToEventLoop();
  console.log('PASS: timer yielding, ' + logicSuites + ' logic-suite hooks, List.test registration and Runner order.');
}

main().catch(error => {
  console.error(error);
  process.exitCode = 1;
});
