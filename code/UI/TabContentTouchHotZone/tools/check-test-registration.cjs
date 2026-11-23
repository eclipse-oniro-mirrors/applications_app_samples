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
const vm = require('node:vm');

assert(process.argv[2], 'Usage: node tools/check-test-registration.cjs <SDK typescript.js>');
const ts = require(path.resolve(process.argv[2]));
const root = path.resolve(__dirname, '../entry/src/ohosTest/ets');
const listText = fs.readFileSync(path.join(root, 'test/List.test.ets'), 'utf8');
const list = ts.createSourceFile('List.test.ets', listText, ts.ScriptTarget.Latest, true, ts.ScriptKind.TS);
assert.equal(list.parseDiagnostics.length, 0);
const imports = list.statements.filter(ts.isImportDeclaration);
const entry = list.statements.find(node => ts.isFunctionDeclaration(node) && node.name.text === 'testsuite');
const names = entry.body.statements.map(node => {
  assert(ts.isExpressionStatement(node) && ts.isCallExpression(node.expression));
  assert(ts.isIdentifier(node.expression.expression));
  return node.expression.expression.text;
});
const declarations = list.statements.filter(ts.isVariableStatement)
  .flatMap(node => Array.from(node.declarationList.declarations));
const registrations = declarations.find(node => node.name.text === 'testSuites').initializer.elements;
assert(registrations.every(ts.isIdentifier));
assert.deepEqual(registrations.map(node => node.text), names);
assert.deepEqual(names, imports.map(node => node.importClause.name.text));
assert.equal(names.length, 59);
let cases = 0;
for (const node of imports) {
  const text = fs.readFileSync(path.join(root, 'test', node.moduleSpecifier.text + '.ets'), 'utf8');
  cases += (text.match(/^\s*it\(/gm) || []).length;
}
assert.equal(cases, 2334);
const abilityText = fs.readFileSync(path.join(root, 'testability/TestAbility.ets'), 'utf8');
assert(!abilityText.includes('hypiumTest'));
assert(abilityText.includes('runTestSuites(testSuites)'));
assert(abilityText.includes('clearTimeout(this.testTaskId)'));
const runnerText = fs.readFileSync(path.join(root, 'TestRunner/OpenHarmonyTestRunner.ts'), 'utf8');
const runnerAst = ts.createSourceFile('OpenHarmonyTestRunner.ts', runnerText, ts.ScriptTarget.Latest, true, ts.ScriptKind.TS);
assert.equal(runnerAst.parseDiagnostics.length, 0);
function checkImportBoundary(node) {
  if (ts.isImportDeclaration(node) && node.moduleSpecifier.text.startsWith('.')) {
    const modulePath = path.resolve(root, 'TestRunner', node.moduleSpecifier.text);
    assert(!fs.existsSync(modulePath + '.ets'), 'TS must not import ArkTS: ' + modulePath);
  }
  if (ts.isCallExpression(node) && node.expression.kind === ts.SyntaxKind.ImportKeyword) {
    assert.fail('Test registration must be passed from ArkTS, not imported by TS');
  }
  ts.forEachChild(node, checkImportBoundary);
}
checkImportBoundary(runnerAst);
const runner = ts.transpileModule(runnerText, {
  compilerOptions: { target: ts.ScriptTarget.ES2017, module: ts.ModuleKind.CommonJS, esModuleInterop: true },
  reportDiagnostics: true
});
assert.equal((runner.diagnostics || []).filter(item => item.category === ts.DiagnosticCategory.Error).length, 0);

async function check(mode) {
  let launched = false;
  let registered = 0;
  let yields = 0;
  let executions = 0;
  let finished = 0;
  let observer;
  const args = { bundleName: 'com.samples.tabcontenttouchhotzone', parameters: { '-D': 'true', timeout: '15000' } };
  const delegator = {
    addAbilityMonitor() {},
    executeShellCommand: async cmd => {
      assert(cmd.includes('TestAbility') && cmd.endsWith(' -D'));
      await new Promise(resolve => setImmediate(resolve));
      launched = mode !== 'launch-failure';
      return { exitCode: launched ? 0 : 1, stdResult: '' };
    },
    finishTest(message, code) {
      assert.notEqual(code, 0);
      assert(message.includes('Test runner failed:'));
      finished++;
    }
  };
  const config = {
    translateParams(parameters) { assert.equal(parameters, args.parameters); return parameters; },
    setConfig(parameters) { assert.equal(parameters, args.parameters); }
  };
  const sys = {};
  const core = {
    addService() {},
    init() { assert(launched); assert.equal(sys.delegator, delegator); },
    subscribeEvent(name, service) {
      if (name === 'spec' && typeof service.specStart === 'function') observer = service;
    },
    getDefaultService(name) { assert.equal(name, 'config'); return config; },
    execute(value) {
      assert.equal(value, delegator);
      assert.equal(registered, names.length);
      assert.equal(yields, names.length);
      assert(observer);
      executions++;
    }
  };
  const testSuites = names.map((name, index) => () => {
    assert(launched);
    assert.equal(yields, index, 'Registration must yield between suites: ' + name);
    if (mode === 'registration-failure' && index === 1) throw new Error('registration failed');
    registered++;
  });
  const modules = {
    '@kit.PerformanceAnalysisKit': { hilog: { info() {}, error() {} } },
    '@kit.TestKit': { abilityDelegatorRegistry: { getArguments: () => args, getAbilityDelegator: () => delegator } },
    '@kit.BasicServicesKit': {},
    '@ohos/hypium/src/main/core': { __esModule: true, default: { getInstance: () => core } },
    '@ohos/hypium/src/main/module/assert/ExpectExtend': { __esModule: true, default: class {} },
    '@ohos/hypium/src/main/module/report/OhReport': { __esModule: true, default: class {} },
    '@ohos/hypium/src/main/module/kit/SysTestKit': { __esModule: true, default: sys }
  };
  const module = { exports: {} };
  vm.runInNewContext(runner.outputText, {
    module, exports: module.exports,
    require(name) {
      assert(Object.hasOwn(modules, name), name);
      return modules[name];
    },
    setTimeout(callback, delay) {
      assert.equal(delay, 1);
      return setImmediate(() => { yields++; callback(); });
    }
  });
  await new module.exports.default().onRun();
  assert.equal(registered, 0, 'Runner startup must not import or register ArkTS tests');
  if (mode !== 'launch-failure') {
    await module.exports.runTestSuites(testSuites);
  }
  if (mode === 'success') {
    assert.equal(executions, 1);
    assert.equal(finished, 0);
    await observer.specStart();
    assert.equal(yields, names.length + 1, 'Each case must yield before execution');
    observer.specDone();
  } else {
    assert.equal(executions, 0);
    assert.equal(finished, 1, 'Failures must finish exactly once');
  }
}

function checkAbilityLifecycle(cancel) {
  let starts = 0;
  let nextTimerId = 0;
  const timers = new Map();
  const testSuites = names.map(() => () => {});
  const modules = {
    '@kit.AbilityKit': { UIAbility: class {} },
    '@kit.PerformanceAnalysisKit': { hilog: { info() {}, error() {} } },
    '@kit.ArkUI': {},
    '../TestRunner/OpenHarmonyTestRunner': {
      runTestSuites(value) {
        assert.equal(value, testSuites);
        starts++;
        return Promise.resolve();
      }
    },
    '../test/List.test': { testSuites }
  };
  const ability = ts.transpileModule(abilityText, {
    compilerOptions: { target: ts.ScriptTarget.ES2017, module: ts.ModuleKind.CommonJS, esModuleInterop: true },
    reportDiagnostics: true
  });
  assert.equal((ability.diagnostics || []).filter(item => item.category === ts.DiagnosticCategory.Error).length, 0);
  const module = { exports: {} };
  vm.runInNewContext(ability.outputText, {
    module, exports: module.exports,
    require(name) { assert(Object.hasOwn(modules, name), name); return modules[name]; },
    setTimeout(callback, delay) {
      assert.equal(delay, 0);
      const id = ++nextTimerId;
      timers.set(id, callback);
      return id;
    },
    clearTimeout(id) { assert(timers.delete(id)); }
  });
  const instance = new module.exports.default();
  instance.onCreate({}, {});
  assert.equal(starts, 0, 'Lifecycle must return before registration');
  assert.equal(timers.size, 1);
  if (cancel) instance.onDestroy();
  for (const [id, callback] of timers) { timers.delete(id); callback(); }
  assert.equal(starts, cancel ? 0 : 1, 'Registration must start once or be cancelled');
  assert.equal(timers.size, 0);
  instance.onDestroy();
}

(async () => {
  await check('success');
  await check('launch-failure');
  await check('registration-failure');
  checkAbilityLifecycle(false);
  checkAbilityLifecycle(true);
  console.log('PASS: 59 suites / 2334 cases; import boundary, scheduling, lifecycle cancellation and failure paths.');
})().catch(error => { console.error(error); process.exitCode = 1; });
