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
const root = path.resolve(__dirname, '../../entry/src/main/ets');

function fixture() {
  const f = { events: [], callbacks: [], completed: [], file: { fd: 17 }, size: 100, state: 0,
    started: true, rejectedState: 0, closeError: undefined, statError: false, openError: false, playError: false };
  const mocks = {
    '@kit.CoreFileKit': { fileIo: { OpenMode: { READ_ONLY: 0 },
      openSync(uri) { f.events.push('open'); if (f.openError) throw Error('open failed'); return f.file; },
      statSync(fd) { assert.equal(fd, f.file.fd); if (f.statError) throw Error('stat failed');
        return { size: f.size, mtime: 1 }; },
      closeSync(file) { assert.equal(file, f.file); f.events.push('close'); if (f.closeError) throw f.closeError; }
    } },
    'libplayer.so': { default: { PlayerState: { IDLE: 0 }, getState: () => f.state,
      getCompletedPlaybackInfo: () => { if (f.reportError) throw Error('report failed'); return {}; },
      async playAsync(options, complete) {
        assert.equal(options.inputFileFd, f.file.fd); f.events.push('play');
        f.callbacks.push(complete); f.state = f.started ? 3 : f.rejectedState;
        if (f.beforeLaunchResult) await f.beforeLaunchResult();
        if (f.playError) throw Error('native launch failed');
        return { started: f.started, completionOwned: f.started || f.rejectedState !== 0 };
      } } },
    '../model/MediaSessionStore': { MediaSessionStore: {
      async begin(context, pending) { f.events.push('begin'); f.pending = pending; },
      async finish(context, id, report) { assert.equal(id, f.pending.id); f.events.push('finish'); f.report = report; }
    } },
    '../model/MediaSessionReport': { MediaReports: { inputSnapshot: () => ({}),
      playback: (id, info, reason) => ({ id, reason }), base: id => {
        if (f.reportError) throw Error('report failed'); return { id };
      }, error: () => ({}) } },
    '../common/utils/Logger': { default: { warn() {}, error() {} } }
  };
  const load = createStartupLoader(mocks);
  f.Coordinator = load('model/MediaTaskCoordinator.ets').MediaTaskCoordinator;
  f.Activity = load('model/MediaFileActivity.ets').MediaFileActivity;
  f.Controller = load('controller/PlaybackStartupController.ets').PlaybackStartupController;
  f.launch = () => f.Controller.launch({}, 'file://input', { createPlayOptions: options => options }, false,
    lease => { f.lease = lease; }, (result, cleanupPending) => { f.completed.push({ result, cleanupPending }); });
  f.complete = (reason = 'completed') => {
    f.state = 0; f.callbacks.at(-1)({ reason, success: reason === 'completed' });
  };
  f.count = event => f.events.filter(item => item === event).length;
  f.assertHeld = () => assertUnconfirmedInputHeld(f);
  return f;
}
function createStartupLoader(mocks) {
  const cache = new Map();
  return function load(relative) {
    const file = path.resolve(root, relative);
    if (cache.has(file)) return cache.get(file).exports;
    const module = { exports: {} }; cache.set(file, module);
    const compiled = ts.transpileModule(fs.readFileSync(file, 'utf8'), {
      compilerOptions: { module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2020 }, reportDiagnostics: true
    });
    assert.equal(compiled.diagnostics.length, 0);
    vm.runInNewContext(compiled.outputText, { module, exports: module.exports,
      require(name) {
        if (name in mocks) return mocks[name];
        if (name.startsWith('.')) return load(path.resolve(path.dirname(file), name + '.ets'));
        throw Error('Unexpected dependency: ' + name);
      } }, { filename: file });
    return module.exports;
  };
}
async function assertUnconfirmedInputHeld(f) {
  assert.equal(f.count('close'), 1); assert.equal(f.count('finish'), 0);
  assert.equal(f.Coordinator.currentPhase(), 'cancelling');
  assert.equal(f.Coordinator.current().id, f.pending.id);
  assert.equal(f.Controller.unconfirmedInputs.get(f.file.fd), f.file, 'The File remains retained');
  assert.equal(f.Activity.beginCleanup(), false); assert.equal(f.Activity.beginTranscode(), false);
  assert.equal(f.Coordinator.acquire('recording'), undefined);
  const opens = f.count('open'), next = await f.launch();
  assert.equal(next.kind, 'close_pending'); assert.equal(next.reason, 'close_unconfirmed');
  assert.equal(Object.keys(next).sort().join(','), 'kind,reason');
  assert.equal(f.count('open'), opens); assert.equal(f.count('close'), 1, 'Unconfirmed fd is never retried');
}

async function main() {
for (const reason of ['completed', 'stopped', 'error']) {
  for (const code of [undefined, 13900008, 13900005]) {
    const f = fixture(); f.closeError = code === undefined ? undefined : { code };
    const launch = await f.launch();
    assert.equal(launch.kind, 'started'); assert.equal(f.Coordinator.currentPhase(), 'running');
    assert.equal(f.count('close'), 0); assert.equal(f.count('finish'), 0);
    f.complete(reason); f.complete(reason);
    assert.equal(f.count('close'), 1); assert.equal(f.completed.length, 1, 'Duplicate completion is ignored');
    assert.equal(f.completed[0].result.reason, reason, 'Cleanup retains the Native completion reason');
    assert.equal(f.completed[0].cleanupPending, code === 13900005);
    if (code === 13900005) { await f.assertHeld(); }
    else {
      assert.equal(f.count('finish'), 1); assert.equal(f.Coordinator.busy(), false);
      assert.equal(f.Activity.beginCleanup(), true); f.Activity.endCleanup();
      assert.equal(f.report.reason, reason);
    }
  }
}
console.info('Playback startup: completion, stop, error, duplicate callbacks and EBADF passed');

for (const stage of ['empty', 'stat', 'reject', 'throw']) {
  for (const code of [undefined, 13900008, 13900005]) {
    const f = fixture(); f.closeError = code === undefined ? undefined : { code };
    if (stage === 'empty') f.size = 0;
    if (stage === 'stat') f.statError = true;
    if (stage === 'reject' || stage === 'throw') f.started = false;
    if (stage === 'throw') f.playError = true;
    const launch = await f.launch(); assert.equal(launch.kind, code === 13900005 ? 'close_pending' : 'rejected');
    assert.equal(f.completed.length, 0); assert.equal(f.count('close'), 1);
    if (code === 13900005) { assert.equal(launch.reason, 'close_unconfirmed'); await f.assertHeld(); }
    else {
      assert.equal(launch.reason, stage === 'empty' ? 'empty' : stage === 'reject' ? 'invalid' : 'open');
      assert.equal(f.count('finish'), 1); assert.equal(f.Coordinator.busy(), false);
    }
  }
}
const unopened = fixture(); unopened.openError = true; assert.equal((await unopened.launch()).reason, 'open');
assert.equal(unopened.count('close'), 0); assert.equal(unopened.count('finish'), 1);
assert.equal(unopened.Coordinator.busy(), false);
for (const failClose of [false, true]) {
  const f = fixture(); f.started = false; f.rejectedState = 4;
  if (failClose) f.closeError = { code: 13900005 };
  const launch = await f.launch(); assert.equal(launch.kind, 'releasing');
  assert.equal(launch.reason, 'invalid');
  assert.equal(f.count('close'), 0); assert.equal(f.Coordinator.currentPhase(), 'cancelling');
  f.complete('error');
  if (failClose) await f.assertHeld();
  else { assert.equal(f.count('finish'), 1); assert.equal(f.Coordinator.busy(), false); }
}
console.info('Playback startup: failed preparation, Native rejection and asynchronous release passed');

async function testFailureOwnership() {
  const pending = fixture(); pending.playError = true;
  assert.equal((await pending.launch()).kind, 'releasing'); assert.equal(pending.count('close'), 0);
  assert.equal(pending.Coordinator.currentPhase(), 'cancelling');
  pending.complete('error'); assert.equal(pending.count('close'), 1);
  assert.equal(pending.Coordinator.busy(), false);
  for (const started of [false, true]) {
    const f = fixture(); f.started = started; f.reportError = true;
    assert.equal((await f.launch()).kind, started ? 'started' : 'rejected');
    if (started) f.complete();
    assert.equal(f.count('close'), 1); assert.equal(f.Coordinator.busy(), false);
    if (started) assert.equal(f.completed.length, 1, 'Report failure still dispatches completion');
  }
}
await testFailureOwnership();
await testAsynchronousOwnership();

async function testAsynchronousOwnership() {
  for (const closeError of [undefined, { code: 13900005 }]) {
    const f = fixture();
    f.closeError = closeError;
    let release;
    f.beforeLaunchResult = () => new Promise(resolve => { release = resolve; });
    const launching = f.launch();
    assert.equal(f.Coordinator.currentPhase(), 'preparing');
    assert.equal(f.count('close'), 0);
    f.complete();
    release();
    const result = await launching;
    assert.equal(f.count('close'), 1);
    assert.equal(f.completed.length, 1);
    assert.equal(f.Coordinator.busy(), closeError !== undefined);
    assert.equal(result.kind, closeError ? 'close_pending' : 'rejected');
  }
  const f = fixture();
  let release;
  f.beforeLaunchResult = () => new Promise(resolve => { release = resolve; });
  const launching = f.launch();
  f.Coordinator.cancelling(f.lease);
  release();
  assert.equal((await launching).kind, 'releasing');
  assert.equal(f.count('close'), 0);
  f.complete('stopped');
  assert.equal(f.count('close'), 1);
  assert.equal(f.Coordinator.busy(), false);
}

function testSystemFlowRuntime() {
  const { load } = require('./helpers/PlaybackFlowFixture.cjs');
  const calls = [], source = {}, settings = {}, lease = {}, completion = () => {}, prepared = () => {};
  const result = { kind: 'started', reason: 'none' };
  const { SystemPlaybackFlowRuntime } = load('controller/PlaybackFlowRuntime.ets', {
    'libplayer.so': { default: { PlayerState: { STOPPING: 4 },
      setVolume: volume => calls.push(['volume', volume]),
      setPlaybackSpeed: speed => calls.push(['speed', speed]),
      pause: () => { calls.push(['pause']); return true; },
      resume: () => { calls.push(['resume']); return true; },
      onThermalWarningReceived: ratio => calls.push(['thermal', ratio]),
      onThermalLevelRecovered: () => calls.push(['thermal-recovered']),
      stop: () => true, getState: () => 3, getCompletedPlaybackInfo: () => ({ durationUs: 500 }) } },
    '../model/MediaFileActivity': { MediaFileActivity: { isTranscoding: () => true } },
    '../model/MediaTaskCoordinator': { MediaTaskCoordinator: {
      cancelling: current => calls.push(['lease', current])
    } },
    './PlaybackUriAccessController': { PlaybackUriAccessController: { prepare: (uri, context) => {
      calls.push(['prepare', uri, context]); return Promise.resolve();
    } } },
    './PlaybackStartupController': { PlaybackStartupController: { launch(...args) {
      calls.push(['launch', ...args]); return result;
    } } }
  }, { setTimeout: (callback, delay) => { calls.push(['timer', callback, delay]); return 7; },
    clearTimeout: id => calls.push(['cancel', id]) });
  const runtime = new SystemPlaybackFlowRuntime();
  assert.equal(runtime.launch(source, 'A', settings, true, prepared, completion), result);
  assert.deepEqual(calls.shift(), ['launch', source, 'A', settings, true, prepared, completion]);
  runtime.restoreControls(2, true, 0); runtime.restoreControls(1, false, 0.8);
  assert.deepEqual(calls.splice(0), [['volume', 0], ['speed', 2], ['pause'], ['volume', 0.8], ['speed', 1]]);
  runtime.restoreAfterSeek(3, true); runtime.restoreAfterSeek(1, false);
  assert.deepEqual(calls.splice(0), [['speed', 3], ['thermal', 0.3], ['speed', 1], ['thermal-recovered']]);
  assert.equal(runtime.setPaused(true), true); assert.equal(runtime.setPaused(false), true);
  assert.deepEqual(calls.splice(0), [['pause'], ['resume']]);
  runtime.cancelling(lease); assert.equal(calls.shift()[1], lease);
  void runtime.prepare('A', source); assert.deepEqual(calls.shift(), ['prepare', 'A', source]);
  assert.equal(runtime.schedule(completion, 300), 7); runtime.cancelTimer(7);
  assert.deepEqual(calls.splice(0), [['timer', completion, 300], ['cancel', 7]]);
  assert.equal(runtime.stop(), true); assert.equal(runtime.getState(), 3);
  assert.equal(runtime.stoppingState, 4); assert.equal(runtime.isTranscoding(), true);
  assert.equal(runtime.completedDuration(), 500);
}
testSystemFlowRuntime();
console.info('Playback runtime: launch callback ownership, recovery controls and timer cancellation passed');
}
main().catch(error => { console.error(error); process.exitCode = 1; });
