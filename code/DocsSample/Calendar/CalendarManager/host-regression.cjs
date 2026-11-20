const fs = require('fs');
const path = require('path');
const crypto = require('crypto');
const cp = require('child_process');
const Module = require('module');
const assert = require('assert/strict');
const ts = require('D:/Program Files/Huawei/DevEco Studio/tools/hvigor/hvigor/node_modules/typescript');
const root = __dirname;
const timeoutMs = 2000;
const suites = process.argv.slice(2).filter(arg => !arg.startsWith('--'));
if (suites.length === 0) {
  suites.push('entry/src/ohosTest/ets/test/CalendarManagerLogic.test.ets',
    'entry/src/ohosTest/ets/test/CalendarManagerLifecycle.test.ets',
    'entry/src/ohosTest/ets/test/CalendarManagerErrorBoundary.test.ets',
    'entry/src/test/LocalUnit.test.ets');
  const matrix = JSON.parse(fs.readFileSync(path.join(root, '.validation/matrix-manifest.json'), 'utf8'));
  suites.push(...matrix.suites.map(suite => 'entry/src/ohosTest/ets/test/' + suite.file));
}
const childArgument = process.argv.find(arg => arg.startsWith('--case-name='));
const selfTest = process.argv.find(arg => arg.startsWith('--self-test='));
const cases = [];
const stack = [];
const cache = new Map();
let assertions = 0;
let currentSuite;
const hypium = {
  Level: { LEVEL0: 1 << 24 },
  Size: { MEDIUMTEST: 1 << 17 },
  TestType: { FUNCTION: 1 },
  describe(name, body) {
    assert(!/RealSdk|NativeSdk/.test(name), 'Host cannot register SDK suites');
    const suite = { name, before: [], after: [] };
    stack.push(suite);
    body();
    stack.pop();
  },
  it(name, level, body) {
    cases.push({ name: stack.map(suite => suite.name).join('/') + '/' + name,
      level, body, parents: [...stack], file: currentSuite });
  },
  beforeEach(body) { stack[stack.length - 1].before.push(body); },
  afterEach(body) { stack[stack.length - 1].after.push(body); },
  expect(actual) {
    return {
      assertEqual(expected) { assertions++; assert.strictEqual(actual, expected); },
      assertTrue() { assertions++; assert.strictEqual(actual, true); },
      assertFalse() { assertions++; assert.strictEqual(actual, false); },
      assertUndefined() { assertions++; assert.strictEqual(actual, undefined); }
    };
  }
};
function load(file) {
  file = path.resolve(file);
  if (!path.extname(file) || file.endsWith('.test')) file += '.ets';
  if (cache.has(file)) return cache.get(file).exports;
  const code = ts.transpileModule(fs.readFileSync(file, 'utf8'), {
    compilerOptions: { target: ts.ScriptTarget.ES2020, module: ts.ModuleKind.CommonJS }
  }).outputText;
  const mod = new Module(file);
  cache.set(file, mod);
  mod.filename = file;
  mod.require = name => {
    if (name === '@ohos/hypium') return hypium;
    if (name === '@kit.CalendarKit') {
      return { calendarManager: { CalendarType: { LOCAL: 'local' } } };
    }
    if (name.startsWith('.')) return load(path.resolve(path.dirname(file), name));
    throw Error('Host must not execute SDK/native module: ' + name);
  };
  mod._compile(code, file);
  return mod.exports;
}
function register() {
  if (selfTest) {
    const mode = selfTest.split('=')[1];
    assert(['timeout', 'assertion', 'cleanup'].includes(mode), 'Unknown self-test');
    hypium.describe('RunnerSelfTest', () => {
      if (mode === 'cleanup') hypium.afterEach(() => { throw Error('cleanup failed'); });
      hypium.it(mode, 0, async () => {
        if (mode === 'timeout') await new Promise(() => {});
        if (mode === 'assertion') hypium.expect(1).assertEqual(2);
      });
    });
  } else {
    for (const suite of suites) {
      currentSuite = suite;
      load(path.join(root, suite)).default();
    }
  }
  assert(cases.length > 0, 'No host cases registered');
  assert(new Set(cases.map(item => item.name)).size === cases.length, 'Duplicate host case names');
}
function manifest() {
  const files = [];
  function scan(relative) {
    for (const item of fs.readdirSync(path.join(root, relative), { withFileTypes: true })) {
      const next = path.join(relative, item.name);
      if (item.isDirectory()) scan(next);
      else if (item.isFile()) files.push({ path: next.replace(/\\/g, '/'),
        hash: crypto.createHash('sha256').update(fs.readFileSync(path.join(root, next))).digest('hex') });
    }
  }
  scan('entry/src');
  files.sort((a, b) => a.path.localeCompare(b.path));
  return { files, sha256: crypto.createHash('sha256').update(JSON.stringify(files)).digest('hex') };
}
async function executeChild(index) {
  const item = cases[index];
  assert(item, 'Unknown host case index');
  const started = performance.now();
  let reported = false;
  function report(error, failed = true) {
    if (reported) return;
    reported = true;
    console.info('HOST_RESULT ' + JSON.stringify({ name: item.name, pass: !failed,
      assertions, durationMs: Math.round(performance.now() - started),
      error: failed ? error?.stack || error?.message || String(error) : undefined }));
  }
  const watchdog = setTimeout(() => {
    report(Error('Host case exceeded real wall-clock timeout'));
    process.exit(1);
  }, timeoutMs);
  process.on('unhandledRejection', error => {
    report(error instanceof Error ? error : Error(String(error)));
    process.exit(1);
  });
  let primaryError;
  let failed = false;
  try {
    for (const parent of item.parents) for (const hook of parent.before) await hook();
    await item.body();
    if (!selfTest) assert(assertions > 0, 'A host case must execute assertions');
  } catch (error) {
    primaryError = error;
    failed = true;
  } finally {
    for (const parent of [...item.parents].reverse()) {
      for (const hook of parent.after) {
        try { await hook(); } catch (error) {
          if (!failed) primaryError = error;
          failed = true;
        }
      }
    }
  }
  clearTimeout(watchdog);
  report(primaryError, failed);
  process.exitCode = failed ? 1 : 0;
}
function executeParent() {
  const before = manifest();
  const results = [];
  for (let index = 0; index < cases.length; index++) {
    const started = performance.now();
    const args = [__filename, ...(cases[index].file ? [cases[index].file] : suites),
      `--case-name=${cases[index].name}`];
    if (selfTest) args.push(selfTest);
    const child = cp.spawnSync(process.execPath, args, {
      encoding: 'utf8', timeout: timeoutMs, maxBuffer: 4 * 1024 * 1024, windowsHide: true
    });
    const line = (child.stdout || '').split(/\r?\n/).find(value => value.startsWith('HOST_RESULT '));
    const result = line ? JSON.parse(line.slice('HOST_RESULT '.length)) :
      { name: cases[index].name, pass: false, assertions: 0,
        error: child.error?.message || child.stderr || 'Child returned no case result' };
    result.exitCode = child.status;
    result.wallClockMs = Math.round(performance.now() - started);
    result.timeoutMs = timeoutMs;
    result.pass = result.pass && child.status === 0 && !child.error;
    results.push(result);
    if (!result.pass) break;
  }
  const after = manifest();
  const report = {
    generatedAt: new Date().toISOString(),
    kind: 'host-isolated-production-business-only-not-sdk-device-ui-permission-or-hypium',
    boundary: 'Transpiles the current pure account and permission business sources. CalendarType is a data constant; '
      + 'recording ports, assertion and hook adapters are host boundaries, not Calendar SDK or Hypium runtime.',
    runtime: process.version, suites, cases: cases.length, executed: results.length,
    passed: results.filter(item => item.pass).length, failed: results.filter(item => !item.pass).length,
    assertions: results.reduce((sum, item) => sum + item.assertions, 0),
    isolation: 'Fresh child process per case', timeoutMsPerCase: timeoutMs,
    stopAfterFirstFailureOrTimeout: true, failureExitCodeNonZero: true,
    sdkOrDeviceExecuted: false, results,
    sourceHashVerification: { filesBefore: before.files.length, filesAfter: after.files.length,
      before: before.sha256, after: after.sha256, identical: before.sha256 === after.sha256 }
  };
  const file = path.join(root, '.validation', selfTest ? `runner-${selfTest.split('=')[1]}.json` : 'host-regression.json');
  fs.writeFileSync(file, JSON.stringify(report, null, 2));
  console.info(JSON.stringify({ cases: report.cases, executed: report.executed, passed: report.passed,
    failed: report.failed, assertions: report.assertions, sourceUnchanged: report.sourceHashVerification.identical }));
  process.exitCode = report.failed || report.executed !== report.cases || before.sha256 !== after.sha256 ? 1 : 0;
}
try {
  register();
  if (childArgument) executeChild(cases.findIndex(item =>
    item.name === childArgument.slice('--case-name='.length))).catch(error => {
    console.error(error);
    process.exitCode = 1;
  });
  else executeParent();
} catch (error) {
  console.error(error);
  process.exitCode = 1;
}
