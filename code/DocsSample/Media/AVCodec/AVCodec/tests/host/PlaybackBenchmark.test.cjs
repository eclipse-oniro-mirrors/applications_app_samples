/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
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
const ts = require(path.resolve(process.argv[2]));
const file = path.resolve(__dirname, '../../entry/src/ohosTest/ets/test/PlaybackPollingBenchmark.test.ets');
const source = fs.readFileSync(file, 'utf8') + '\nexport { runBenchmark, saveSummary };';
const compiled = ts.transpileModule(source, { compilerOptions: {
  module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2020 } });

function fixture() {
  const f = { state: 0, closed: [], stopCalls: 0, warnings: [], pending: false, now: 0, checks: 0 };
  const player = { PlayerState: { IDLE: 0, PLAYING: 3, PAUSED: 6 }, getState: () => f.state,
    play(options, completed) { f.complete = completed; f.state = 3; return true; },
    pause() { f.state = 6; return true; }, getPlaybackInfo: () => ({ state: f.state }),
    stop() { f.stopCalls++; if (!f.pending) { f.complete({}); } return true; } };
  const deps = { '@ohos/hypium': { expect(actual) { return {
    assertEqual(expected) { f.checks++; if (f.primary && f.checks === 2) { throw f.primary; }
      assert.equal(actual, expected); }, assertTrue() { assert.equal(actual, true); } }; } },
  '@kit.TestKit': { abilityDelegatorRegistry: { getAbilityDelegator: () => ({
    getAppContext: () => ({ cacheDir: '/cache' }) }) } },
  '@kit.BasicServicesKit': { systemDateTime: { TimeType: { ACTIVE: 0 }, getUptime: () => ++f.now } },
  '@kit.CoreFileKit': { fileIo: { OpenMode: {}, openSync: name => ({ fd: name }),
    statSync: () => ({ size: 100 }), writeSync() { if (f.writeError) { throw f.writeError; } },
    closeSync(input) { f.closed.push(input.fd); if (f.closeError) { throw f.closeError; } } } },
  '@kit.PerformanceAnalysisKit': { hilog: { info() {}, error(...args) { f.warnings.push(args); } } },
  'libplayer.so': { default: player },
  '../../../main/ets/viewmodel/PlaybackViewModel': { PlaybackViewModel: class { update() {} } },
  '../../../main/ets/model/PlayerSettingsModel': { PlayerSettingsModel: class { createPlayOptions(v) { return v; } } },
  './TestCaseLogger': {} };
  const moduleValue = { exports: {} };
  vm.runInNewContext(compiled.outputText, { module: moduleValue, exports: moduleValue.exports,
    require(name) { assert(name in deps, name); return deps[name]; },
    setTimeout(callback) { callback(); return 0; } }, { filename: file });
  return Object.assign(f, moduleValue.exports);
}

async function testPrimaryAndCleanupErrors() {
  const primary = Error('Original playback assertion');
  const f = fixture(); f.primary = primary; f.pending = true;
  await assert.rejects(f.runBenchmark('AVCodec_Test', 'playing'), error => error === primary);
  assert.equal(f.stopCalls, 1); assert.equal(f.closed.length, 0); assert.equal(f.warnings.length, 1);
  f.complete({}); assert.deepEqual(f.closed, ['/cache/polling-fixture.m4a']);
  f.complete({}); assert.equal(f.closed.length, 1, 'Late completion closes the input exactly once');
  const pending = fixture(); pending.pending = true;
  await assert.rejects(pending.runBenchmark('AVCodec_Test', 'playing'), /cleanup is still pending/);
  assert.equal(pending.stopCalls, 1);
  pending.complete({});
  for (const mode of ['idle', 'playing', 'paused']) {
    const success = fixture(); await success.runBenchmark('AVCodec_Test', mode);
    assert.equal(success.stopCalls, mode === 'idle' ? 0 : 1);
    assert.equal(success.closed.filter(name => name.endsWith('fixture.m4a')).length, mode === 'idle' ? 0 : 1);
  }
}

function testSummaryErrors() {
  const summary = { mode: 'idle', samples: 8, updateMeanUs: 1 };
  const f = fixture(); f.writeError = Error('write failed'); f.closeError = Error('close failed');
  assert.throws(() => f.saveSummary('/cache', summary), error => error === f.writeError);
  assert.equal(f.closed.length, 1); assert.equal(f.warnings.length, 1);
  const close = fixture(); close.closeError = Error('close failed');
  assert.throws(() => close.saveSummary('/cache', summary), error => error === close.closeError);
}

(async () => {
  await testPrimaryAndCleanupErrors(); testSummaryErrors();
  console.info('Playback benchmark: original errors, cleanup-only failures and late close ownership passed');
})().catch(error => { console.error(error); process.exitCode = 1; });
