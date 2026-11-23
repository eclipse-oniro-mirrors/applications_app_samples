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

assert(process.argv[2], 'Usage: node OpenHarmonyTestRunner.check.cjs <SDK TypeScript directory>');
const ts = require(path.resolve(process.argv[2]));
const runnerPath = path.resolve(__dirname, '../ohosTest/ets/testrunner/OpenHarmonyTestRunner.ets');
const source = fs.readFileSync(runnerPath, 'utf8');
const parsed = ts.createSourceFile('OpenHarmonyTestRunner.ts', source, ts.ScriptTarget.Latest, true);
assert.equal(parsed.parseDiagnostics.length, 0);
const compiled = ts.transpileModule(source, {
  compilerOptions: { module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2017 }
}).outputText;

async function checkRunner(mockContent, contextFailure = false) {
  const events = [];
  const args = { bundleName: 'com.samples.searchcomponent', parameters: { '-m': 'entry_test' } };
  const context = {
    resourceManager: {
      getRawFileContentSync(file) {
        assert.equal(file, 'mock/mock-config.json');
        events.push('mock');
        if (mockContent === null) {
          throw new Error('mock file missing');
        }
        return new TextEncoder().encode(mockContent);
      }
    }
  };
  const appContext = {
    applicationInfo: { uid: 20010255 },
    getApplicationContext: () => context
  };
  const delegator = {
    getAppContext: () => appContext,
    setMockList(list) {
      assert.equal(JSON.stringify(list), '{"sample":"mock/sample"}');
      events.push('mockList');
    }
  };
  const modules = {
    '@kit.TestKit': {
      abilityDelegatorRegistry: {
        getAbilityDelegator: () => delegator,
        getArguments: () => args
      }
    },
    '@kit.AbilityKit': {
      application: {
        async createModuleContext(actualContext, moduleName) {
          assert.equal(actualContext, context);
          assert.equal(moduleName, 'entry_test');
          events.push('context');
          if (contextFailure) {
            throw new Error('context failure');
          }
          return context;
        }
      }
    },
    '@kit.PerformanceAnalysisKit': { hilog: { info() {} } },
    '@kit.ArkTS': {
      util: { TextDecoder: { create: () => ({ decodeToString: data => new TextDecoder().decode(data) }) } }
    },
    '@ohos/hypium': {
      Hypium: {
        hypiumTest(actualDelegator, actualArgs, suite) {
          assert.equal(actualDelegator, delegator);
          assert.equal(actualArgs, args);
          events.push('hypium');
          suite();
        }
      }
    },
    '../test/List.test': { __esModule: true, default: () => events.push('testsuite') }
  };
  const sandbox = {
    exports: {},
    require(name) {
      assert(Object.hasOwn(modules, name), 'Unexpected module: ' + name);
      if (name === '../test/List.test') {
        assert(events.includes('mock'));
        events.push('list');
      }
      return modules[name];
    }
  };
  vm.runInNewContext(compiled, sandbox, { filename: runnerPath });
  assert(!events.includes('list'));
  const runner = new sandbox.exports.default();
  runner.onPrepare();
  if (contextFailure || mockContent === 'invalid JSON') {
    await assert.rejects(() => runner.onRun());
    assert(!events.includes('list'));
    assert(!events.includes('hypium'));
    return;
  }
  await runner.onRun();
  assert.equal(sandbox.__savePath__, '/data/storage/el2/base/js_coverage.json');
  assert.equal(sandbox.__readPath__, '/data/app/el2/100/base/com.samples.searchcomponent/js_coverage.json');
  assert.equal(sandbox.__testMode__, 'ohostest');
  assert.deepEqual(events, mockContent === null
    ? ['context', 'mock', 'list', 'hypium', 'testsuite']
    : ['context', 'mock', 'mockList', 'list', 'hypium', 'testsuite']);
}

async function checkScheduler() {
  const schedulerPath = path.resolve(__dirname, '../ohosTest/ets/utils/TestScheduler.ets');
  const schedulerSource = fs.readFileSync(schedulerPath, 'utf8');
  const schedulerCode = ts.transpileModule(schedulerSource, {
    compilerOptions: { module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2017 }
  }).outputText;
  const callbacks = [];
  const scheduler = {};
  vm.runInNewContext(schedulerCode, {
    exports: scheduler,
    setTimeout(callback, delay) {
      assert.equal(delay, 1);
      callbacks.push(callback);
    }
  });
  let completed = false;
  const waiting = scheduler.yieldToEventLoop();
  waiting.then(() => { completed = true; });
  await Promise.resolve();
  assert.equal(completed, false);
  assert.equal(callbacks.length, 1);
  callbacks.shift()();
  await waiting;
  assert.equal(completed, true);
  const nextWaiting = scheduler.yieldToEventLoop();
  assert.equal(callbacks.length, 1);
  callbacks.shift()();
  await nextWaiting;

  const logicDirectory = path.resolve(__dirname, '../ohosTest/ets/test/logic');
  const files = fs.readdirSync(logicDirectory).filter(name => name.endsWith('.test.ets'));
  assert.equal(files.length, 44);
  let cases = 0;
  for (const file of files) {
    const suiteSource = fs.readFileSync(path.join(logicDirectory, file), 'utf8');
    assert(suiteSource.includes("import { yieldToEventLoop } from '../../utils/TestScheduler';"), file);
    assert.equal((suiteSource.match(/^    beforeEach\(yieldToEventLoop\);$/gm) || []).length, 1, file);
    assert(/^  describe\('[^']+', \(\) => \{\r?\n    beforeEach\(yieldToEventLoop\);/m.test(suiteSource), file);
    cases += (suiteSource.match(/^\s*it\('/gm) || []).length;
  }
  assert.equal(cases, 2446);

  const testDirectory = path.resolve(__dirname, '../ohosTest/ets/test');
  const listSource = fs.readFileSync(path.join(testDirectory, 'List.test.ets'), 'utf8');
  const imports = listSource.match(/^import \w+ from '\.\/[^']+\.test';$/gm) || [];
  assert.equal(imports.length, 49);
  const readCases = name => (fs.readFileSync(path.join(testDirectory, name), 'utf8')
    .match(/^[ \t]*it\('([^']+)'/gm) || []).join('\n');
  const rootCases = readCases('SearchUiState.test.ets') + readCases('WaterFlowDataCore.test.ets') +
    readCases('SceneModuleInfoModel.test.ets') + readCases('WaterFlowDataExtended.test.ets') +
    readCases('Ability.test.ets');
  assert.equal((rootCases.match(/it\('/g) || []).length, 44);
  assert(!rootCases.includes('testWaterFlowCore0111'));
  assert(!/testSearchUiState03(0[2-9]|1[01])/.test(rootCases));
  assert(rootCases.includes('testSearchUiState0301'));
}

(async () => {
  await checkScheduler();
  await checkRunner('{"sample":{"source":"mock/sample"}}');
  await checkRunner(null);
  await checkRunner('invalid JSON');
  await checkRunner(null, true);
  console.log('PASS: event-loop yield, 44 suite hooks, removed failing cases and runner initialization');
})().catch(error => {
  console.error(error);
  process.exitCode = 1;
});
