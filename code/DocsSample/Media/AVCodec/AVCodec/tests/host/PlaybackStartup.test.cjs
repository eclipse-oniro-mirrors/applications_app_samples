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
  const cache = new Map();
  const mocks = {
    '@kit.CoreFileKit': { fileIo: { OpenMode: { READ_ONLY: 0 },
      openSync(uri) { f.events.push('open'); if (f.openError) throw Error('open failed'); return f.file; },
      statSync(fd) { assert.equal(fd, f.file.fd); if (f.statError) throw Error('stat failed');
        return { size: f.size, mtime: 1 }; },
      closeSync(file) { assert.equal(file, f.file); f.events.push('close'); if (f.closeError) throw f.closeError; }
    } },
    'libplayer.so': { default: { PlayerState: { IDLE: 0 }, getState: () => f.state,
      getCompletedPlaybackInfo: () => ({}),
      play(options, complete) {
        assert.equal(options.inputFileFd, f.file.fd); f.events.push('play');
        f.callbacks.push(complete); f.state = f.started ? 3 : f.rejectedState;
        if (f.playError) throw Error('native launch failed');
        return f.started;
      } } },
    '../model/MediaSessionStore': { MediaSessionStore: {
      async begin(context, pending) { f.events.push('begin'); f.pending = pending; },
      async finish(context, id, report) { assert.equal(id, f.pending.id); f.events.push('finish'); f.report = report; }
    } },
    '../model/MediaSessionReport': { MediaReports: { inputSnapshot: () => ({}),
      playback: (id, info, reason) => ({ id, reason }), base: id => ({ id }), error: () => ({}) } },
    '../common/utils/Logger': { default: { warn() {}, error() {} } }
  };
  function load(relative) {
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
  }
  f.Coordinator = load('model/MediaTaskCoordinator.ets').MediaTaskCoordinator;
  f.Activity = load('model/MediaFileActivity.ets').MediaFileActivity;
  f.Controller = load('controller/PlaybackStartupController.ets').PlaybackStartupController;
  f.launch = () => f.Controller.launch({}, 'file://input', { createPlayOptions: options => options }, false,
    lease => { f.lease = lease; }, (result, cleanupPending) => { f.completed.push({ result, cleanupPending }); });
  f.complete = (reason = 'completed') => { f.state = 0; f.callbacks.at(-1)({ reason, success: reason === 'completed' }); };
  f.count = event => f.events.filter(item => item === event).length;
  f.assertHeld = () => {
    assert.equal(f.count('close'), 1); assert.equal(f.count('finish'), 0);
    assert.equal(f.Coordinator.currentPhase(), 'cancelling');
    assert.equal(f.Coordinator.current().id, f.pending.id);
    assert.equal(f.Controller.unconfirmedInputs.get(f.file.fd), f.file, 'The File remains retained');
    assert.equal(f.Activity.beginCleanup(), false); assert.equal(f.Activity.beginTranscode(), false);
    assert.equal(f.Coordinator.acquire('recording'), undefined);
    const opens = f.count('open'), next = f.launch();
    assert.equal(next.error, 'close_unconfirmed'); assert.equal(next.cleanupPending, true);
    assert.equal(next.started, false); assert.equal(next.nativeOwnsLease, false);
    assert.equal(f.count('open'), opens); assert.equal(f.count('close'), 1, 'Unconfirmed fd is never retried');
  };
  return f;
}

for (const reason of ['completed', 'stopped', 'error']) {
  for (const code of [undefined, 13900008, 13900005]) {
    const f = fixture(); f.closeError = code === undefined ? undefined : { code };
    const launch = f.launch();
    assert.equal(launch.started, true); assert.equal(f.Coordinator.currentPhase(), 'running');
    assert.equal(f.count('close'), 0); assert.equal(f.count('finish'), 0);
    f.complete(reason); f.complete(reason);
    assert.equal(f.count('close'), 1); assert.equal(f.completed.length, 1, 'Duplicate completion is ignored');
    assert.equal(f.completed[0].result.reason, reason, 'Cleanup retains the Native completion reason');
    assert.equal(f.completed[0].cleanupPending, code === 13900005);
    if (code === 13900005) { f.assertHeld(); }
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
    const launch = f.launch(); assert.equal(launch.started, false); assert.equal(launch.nativeOwnsLease, false);
    assert.equal(f.completed.length, 0); assert.equal(f.count('close'), 1);
    if (code === 13900005) { assert.equal(launch.error, 'close_unconfirmed'); f.assertHeld(); }
    else { assert.equal(f.count('finish'), 1); assert.equal(f.Coordinator.busy(), false); }
  }
}
const unopened = fixture(); unopened.openError = true; assert.equal(unopened.launch().error, 'open');
assert.equal(unopened.count('close'), 0); assert.equal(unopened.count('finish'), 1);
assert.equal(unopened.Coordinator.busy(), false);
for (const failClose of [false, true]) {
  const f = fixture(); f.started = false; f.rejectedState = 4;
  if (failClose) f.closeError = { code: 13900005 };
  const launch = f.launch(); assert.equal(launch.nativeOwnsLease, true);
  assert.equal(f.count('close'), 0); assert.equal(f.Coordinator.currentPhase(), 'cancelling');
  f.complete('error');
  if (failClose) f.assertHeld();
  else { assert.equal(f.count('finish'), 1); assert.equal(f.Coordinator.busy(), false); }
}
console.info('Playback startup: failed preparation, Native rejection and asynchronous release passed');
