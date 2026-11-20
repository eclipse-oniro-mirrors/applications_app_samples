const fs = require('fs');
const path = require('path');
const Module = require('module');
const assert = require('assert/strict');
const crypto = require('crypto');
const ts = require('D:/Program Files/Huawei/DevEco Studio/tools/hvigor/hvigor/node_modules/typescript');
const stack = [];
const excluded = [];
const cases = [];
let diagnostics = [];
const hypium = {
  describe(name, body) {
    if (/RealSdk|NativeSdk/.test(name)) {
      excluded.push(name);
      return;
    }
    const suite = {
      name, beforeAll: [], afterAll: [], beforeEach: [], afterEach: [], started: false,
      initializationFailed: false
    };
    stack.push(suite);
    try { body(); } finally { stack.pop(); }
  },
  it(name, level, body) {
    if (body.length) throw Error('Host tests must return promises rather than use device callback completion');
    cases.push({ name: [...stack.map(x => x.name), name].join('/'), body, suites: [...stack] });
  },
  beforeAll(body) { stack[stack.length - 1].beforeAll.push(body); },
  afterAll(body) { stack[stack.length - 1].afterAll.push(body); },
  beforeEach(body) { stack[stack.length - 1].beforeEach.push(body); },
  afterEach(body) { stack[stack.length - 1].afterEach.push(body); },
  expect(actual) {
    return {
      assertEqual(expected) { assert.strictEqual(actual, expected); },
      assertTrue() { assert.strictEqual(actual, true); },
      assertFalse() { assert.strictEqual(actual, false); },
      assertUndefined() { assert.strictEqual(actual, undefined); },
      assertContain(expected) { assert.ok(actual.includes(expected)); }
    };
  }
};
const cache = new Map();
const load = file => {
  file = path.resolve(file);
  if (!path.extname(file) || file.endsWith('.test')) file += '.ets';
  if (cache.has(file)) return cache.get(file).exports;
  const source = fs.readFileSync(file, 'utf8');
  const code = ts.transpileModule(source, {
    compilerOptions: { target: ts.ScriptTarget.ES2020, module: ts.ModuleKind.CommonJS }
  }).outputText;
  const mod = new Module(file);
  cache.set(file, mod);
  mod.filename = file;
  mod.require = name => {
    if (name === '@ohos/hypium') return hypium;
    if (name === '@kit.CalendarKit') {
      return {
        calendarManager: {
          EventType: { NORMAL: 0 }, CalendarType: { LOCAL: 'local' },
          RecurrenceFrequency: { DAILY: 3 }, ServiceType: { TRIP: 'Trip' }
        }
      };
    }
    if (name.startsWith('.')) return load(path.resolve(path.dirname(file), name));
    throw Error('Host must not execute SDK/native module: ' + name);
  };
  mod._compile(code, file);
  return mod.exports;
};
async function bounded(body) {
  let timer;
  try {
    await Promise.race([
      Promise.resolve().then(body),
      new Promise((resolve, reject) => {
        timer = setTimeout(() => reject(Error('Host case timed out after 5000 ms')), 5000);
      })
    ]);
  } finally {
    clearTimeout(timer);
  }
}
(async () => {
  const testDir = path.join(__dirname, 'entry/src/ohosTest/ets/test');
  const args = process.argv.slice(2);
  const files = args.length ? args.map(x => path.resolve(__dirname, x)) :
    fs.readdirSync(testDir).filter(x => /^Calendar.*\.test\.ets$/.test(x) && !/Sdk/.test(x))
      .sort().map(x => path.join(testDir, x));
  for (const file of files) load(file).default();
  const names = cases.map(x => x.name);
  assert.strictEqual(new Set(names).size, names.length, 'Duplicate test registration');
  assert.ok(cases.length > 0, 'No host test cases registered');
  const originalInfo = console.info;
  console.info = (...args) => {
    diagnostics.push(args.join(' '));
    if (diagnostics.length > 12) diagnostics.shift();
  };
  const results = [];
  cases.forEach((item, index) => {
    for (const suite of item.suites) suite.lastCase = index;
  });
  try {
    for (const [index, item] of cases.entries()) {
      diagnostics = [];
      const start = Date.now();
      let failed = false;
      let failure;
      const entered = [];
      const markFailed = error => {
        if (!failed) failure = error;
        failed = true;
      };
      try {
        for (const suite of item.suites) {
          if (!suite.started) {
            suite.started = true;
            try {
              for (const hook of suite.beforeAll) await bounded(hook);
            } catch (error) {
              suite.initializationFailed = true;
              suite.initializationError = error;
            }
          }
          if (suite.initializationFailed) throw suite.initializationError;
        }
        for (const suite of item.suites) {
          entered.push(suite);
          for (const hook of suite.beforeEach) await bounded(hook);
        }
        await bounded(item.body);
      } catch (error) {
        markFailed(error);
      } finally {
        for (const suite of entered.reverse()) {
          for (const hook of suite.afterEach) {
            try { await bounded(hook); } catch (error) { markFailed(error); }
          }
        }
        for (const suite of [...item.suites].reverse()) {
          if (!suite.started || suite.lastCase !== index) continue;
          for (const hook of suite.afterAll) {
            try { await bounded(hook); } catch (error) { markFailed(error); }
          }
        }
      }
      results.push({
        name: item.name, pass: !failed, durationMs: Date.now() - start,
        ...(failed ? { error: failure?.stack || String(failure), diagnostics: [...diagnostics] } : {})
      });
    }
  } finally {
    console.info = originalInfo;
  }
  const report = {
    hostOnly: true, sdkOrDeviceExecuted: false, generatedAt: new Date().toISOString(),
    testFiles: files, productionSources: [...cache.keys()].filter(p => p.includes(`${path.sep}main${path.sep}`)),
    sourceHashes: Object.fromEntries([...cache.keys()].map(file =>
      [file, crypto.createHash('sha256').update(fs.readFileSync(file)).digest('hex')])),
    excluded, results
  };
  fs.writeFileSync(path.join(__dirname, '.validation/expansion-host-regression.json'), JSON.stringify(report, null, 2));
  const failed = results.filter(x => !x.pass);
  console.info(JSON.stringify({ passed: results.length - failed.length, failed: failed.length, files: files.length,
    firstFailures: failed.slice(0, 8), excluded, hostOnly: true }));
  process.exitCode = failed.length ? 1 : 0;
})().catch(error => { console.error(error); process.exitCode = 1; });
