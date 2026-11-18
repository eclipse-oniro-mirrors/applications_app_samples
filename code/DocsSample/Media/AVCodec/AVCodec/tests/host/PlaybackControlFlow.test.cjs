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
const { fixture: coreFixture, load, deferred, settle } = require('./helpers/PlaybackFlowFixture.cjs');

function fixture() {
  const { SeekRequestController } = load('controller/SeekRequestController.ets', {});
  const f = coreFixture(undefined, core => {
    core.requests = [];
    return new SeekRequestController(target => {
      const gate = deferred(); core.requests.push({ target, ...gate }); core.record('native-seek'); return gate.promise;
    });
  });
  const { PlaybackCommandController } = load('controller/PlaybackCommandController.ets', {
    '../common/utils/Logger': { default: f.logger }
  });
  f.controlEvents = [];
  f.commands = new PlaybackCommandController(f.state, f.seeks, {
    getSnapshot: () => ({ active: f.active, dragging: false, thermalWarning: false, paused: f.nativeState === 6 }),
    onEvent: event => { f.controlEvents.push(event); f.record('control:' + event.type); }
  }, f.runtime);
  f.seekTo = position => f.commands.seek(position); return f;
}
async function testStopWaitsForSeek() {
  for (const rejected of [false, true]) {
    const f = fixture(); await f.start(); const seeking = f.commands.seek(100);
    if (rejected) { f.runtime.stop = () => { f.stopCalls++; return false; }; }
    const stopping = f.flow.stop(); assert.equal(f.state.phase, 'stopping'); assert.equal(f.stopCalls, 0);
    assert.equal(f.seeks.isBusy(), true); f.requests[0].resolve(true);
    assert.equal(await seeking, 'cancelled'); await stopping;
    assert.equal(f.stopCalls, 1); assert.equal(f.nativeControls.length, 0);
    assert.equal(f.controlEvents.some(event => event.type === 'seek_settled'), false);
    assert.equal(f.state.phase, rejected ? 'active' : 'stopping');
    if (!rejected) { f.complete(); await f.start(); }
    const next = f.commands.seek(200); f.requests.at(-1).resolve(true);
    assert.equal(await next, 'completed'); assert.deepEqual(f.nativeControls, [['after-seek', 1, false]]);
  }
}
async function testCompletionBeforeSeekAndReplay() {
  for (const reason of ['completed', 'error', 'stopped']) {
    const f = fixture(); await f.start(); const seeking = f.commands.seek(100); f.complete(reason);
    await f.flow.play(); assert.equal(f.launches.length, 1, 'Active Native Seek blocks premature replay');
    f.requests[0].resolve(false); assert.equal(await seeking, 'cancelled'); await f.start();
    assert.equal(f.state.phase, 'active'); assert.equal(f.nativeControls.length, 0);
    assert.equal(f.launches.length, 2);
  }
}
async function testLeaveAndMergedSeek() {
  const f = fixture(); await f.start();
  const first = f.commands.seek(100), second = f.commands.seek(200); f.commands.setSpeed(2);
  f.active = false; f.flow.leave(); assert.equal(await second, 'cancelled');
  f.requests[0].resolve(true); assert.equal(await first, 'cancelled'); await f.waitAt('stop');
  f.complete(); f.active = true; await f.start();
  assert.equal(f.nativeControls.length, 0); assert.equal(f.state.requestedSpeed, 1);
}
async function testCommandsAcrossPhases() {
  for (const phase of ['idle', 'preparing', 'stopping', 'releasing', 'close_pending']) {
    const f = fixture();
    if (phase === 'preparing') { void f.flow.play(); }
    if (phase === 'stopping') { await f.start(); await f.flow.stop(); }
    if (phase === 'releasing') { f.startResult = { started: false, nativeOwnsLease: true }; await f.start(); }
    if (phase === 'close_pending') { await f.start(); f.complete('completed', true); }
    assert.equal(f.state.phase, phase);
    assert.equal(f.commands.setPaused(true), false); f.commands.togglePause(); f.commands.setSpeed(2);
    assert.equal(await f.commands.seek(100), 'cancelled');
    assert.equal(await f.commands.stepFrame(100), 'cancelled');
    assert.equal(f.nativeControls.length, 0, phase + ': controls cannot reach Native');
    assert.equal(f.requests.length, 0);
  }
}
async function testIdempotentPauseAndFrameStep() {
  const f = fixture(); await f.start();
  assert.equal(f.commands.setPaused(true), true); assert.equal(f.commands.setPaused(true), true);
  assert.deepEqual(f.nativeControls, [['paused', true]]);
  assert.equal(f.commands.setPaused(false), true); assert.equal(f.commands.setPaused(false), true);
  assert.equal(f.nativeControls.length, 2);
  const stepping = f.commands.stepFrame(40_000); assert.equal(f.nativeState, 6);
  assert.equal(f.requests.at(-1).target, 40_000);
  assert.equal(await f.commands.stepFrame(80_000), 'cancelled');
  f.requests.at(-1).resolve(true); assert.equal(await stepping, 'completed'); assert.equal(f.nativeState, 6);
  f.commands.setPaused(false); f.runtime.setPaused = () => false;
  const requests = f.requests.length; assert.equal(await f.commands.stepFrame(80_000), 'failed');
  assert.equal(f.requests.length, requests); assert.equal(f.controlEvents.at(-1).type, 'frame_step_failed');
}
(async () => {
  await testStopWaitsForSeek(); await testCompletionBeforeSeekAndReplay();
  await testLeaveAndMergedSeek(); await testIdempotentPauseAndFrameStep(); await settle();
  await testCommandsAcrossPhases();
  console.info('Playback control flow: real Seek sharing, stop/rejection, completion, replay, leave ' +
    'and frame step passed');
})().catch(error => { console.error(error); process.exitCode = 1; });
