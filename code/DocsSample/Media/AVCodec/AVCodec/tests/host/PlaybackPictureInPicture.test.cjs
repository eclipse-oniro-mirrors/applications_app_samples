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
const { load, deferred } = require('./helpers/PlaybackFlowFixture.cjs');

function fixture() {
  const f = { calls: [], session: 1, active: false, playing: true, events: {}, savedEvents: [],
    creates: [], windows: [], startGate: undefined, pauseTargets: [], rejectCreate: false };
  const api = { PiPTemplateType: { VIDEO_PLAY: 1 }, PiPState: { ABOUT_TO_START: 1, STARTED: 2,
    ABOUT_TO_STOP: 3, STOPPED: 4, ABOUT_TO_RESTORE: 5, ERROR: 6 },
    PiPControlType: { VIDEO_PLAY_PAUSE: 1, FAST_FORWARD: 2, FAST_BACKWARD: 3 },
    PiPControlStatus: { PLAY: 1, PAUSE: 2 }, create() {
      const gate = deferred(); f.creates.push(gate); f.calls.push('create'); return gate.promise;
    } };
  const player = { PlayerState: { PLAYING: 3, PAUSED: 6 }, getState: () => f.playing ? 3 : 6,
    getMediaInfo: () => ({ video: { width: 1920, height: 1080 } }),
    setBackgroundPlaybackEnabled: enabled => f.calls.push(['background', enabled]) };
  const { PlayerPictureInPictureController } = load('controller/PlayerPictureInPictureController.ets', {
    '@kit.ArkUI': { PiPWindow: api }, 'libplayer.so': { default: player },
    '../common/utils/Logger': { default: { error: message => f.calls.push(['error', message]), warn() {} } }
  });
  f.controller = new PlayerPictureInPictureController({
    getPlaybackSession: () => f.session, onBackgroundChanged: enabled => { f.background = enabled; },
    onActiveChanged: active => { f.active = active; }, onPlaybackChanged() {},
    onSeekBySeconds: seconds => f.calls.push(['seek', seconds]),
    setPaused: paused => { f.pauseTargets.push(paused); f.playing = !paused; return true; }
  });
  f.window = () => {
    const w = { active: false, events: {}, async startPiP() {
      f.calls.push('start'); if (f.startGate) await f.startGate.promise; w.active = true;
    }, async stopPiP() { f.calls.push('stop'); w.active = false; },
    async isPiPActive() { return w.active; }, setAutoStartEnabled(enabled) {
      if (!enabled && f.disableError) throw Error('disable failed');
      if (enabled && f.enableError) throw Error('enable failed');
      w.autoStart = enabled;
    }, updatePiPControlStatus() {},
    on(type, callback) { w.events[type] = callback; f.savedEvents.push(callback); },
    off(type) { delete w.events[type]; } };
    f.windows.push(w); return w;
  };
  f.resolveCreate = () => { const w = f.window(); f.creates.at(-1).resolve(w); return w; };
  f.api = api; return f;
}
async function testBackgroundPolicy() {
  const f = fixture(), enabling = f.controller.setBackgroundPlayback(true, {}, {});
  assert.equal(f.controller.isBackgroundRequested, true);
  const w = f.resolveCreate(); assert.equal(await enabling, 'enabled');
  assert.equal(f.background, true); assert.equal(w.autoStart, true);
  assert.equal(await f.controller.setBackgroundPlayback(false, {}, {}), 'disabled');
  assert.equal(f.background, false); assert.equal(w.autoStart, false);
  f.enableError = true;
  assert.equal(await f.controller.setBackgroundPlayback(true, {}, {}), 'failed');
  assert.equal(f.background, false); assert.equal(f.controller.isBackgroundRequested, false);
  await f.controller.stop();
}
async function testBackgroundCleanupAndLateResults() {
  const f = fixture(), starting = f.controller.start({}, {}), w = f.resolveCreate();
  await starting; f.disableError = true; await f.controller.stop();
  assert.equal(f.controller.isCreated, true);
  assert.equal(await f.controller.setBackgroundPlayback(true, {}, {}), 'cleanup_pending');
  assert.equal(f.background, false); assert.equal(f.controller.isBackgroundRequested, false);
  f.disableError = false; await f.controller.stop();
  const pending = f.controller.setBackgroundPlayback(true, {}, {});
  assert.equal(await f.controller.setBackgroundPlayback(false, {}, {}), 'disabled');
  f.resolveCreate(); assert.equal(await pending, 'cancelled');
  assert.equal(f.background, false); assert.equal(f.controller.isBackgroundRequested, false);
  assert.equal(f.active, false, 'Cancelled background creation never activates PiP');
  await f.controller.stop(); assert.equal(w.active, false);
  const late = fixture(), request = late.controller.setBackgroundPlayback(true, {}, {});
  late.session++; late.resolveCreate(); assert.equal(await request, 'cancelled');
  assert.equal(late.controller.isBackgroundRequested, false); assert.notEqual(late.background, true);
}
async function testBackgroundStartReplacement() {
  const f = fixture(); f.startGate = deferred();
  const pending = f.controller.setBackgroundPlayback(true, {}, {}), w = f.resolveCreate();
  await new Promise(resolve => setImmediate(resolve));
  const repeated = f.controller.setBackgroundPlayback(true, {}, {});
  assert.equal(f.background, undefined, 'Pending start cannot report background enabled');
  const disabling = f.controller.setBackgroundPlayback(false, {}, {});
  assert.equal(await disabling, 'disabled');
  assert.equal(f.background, false);
  f.startGate.resolve();
  assert.equal(await pending, 'cancelled'); assert.equal(await repeated, 'cancelled');
  await f.controller.stop();
  assert.equal(f.active, false); assert.equal(w.active, false); assert.equal(w.autoStart, false);
  const retry = f.controller.setBackgroundPlayback(true, {}, {}); f.resolveCreate();
  assert.equal(await retry, 'enabled'); await f.controller.stop(); assert.equal(f.background, false);
}
async function testBackgroundFailureRestoresPolicy() {
  const f = fixture(), enabling = f.controller.setBackgroundPlayback(true, {}, {}), w = f.resolveCreate();
  assert.equal(await enabling, 'enabled');
  w.active = false; w.events.stateChange(f.api.PiPState.STOPPED);
  assert.equal(f.background, true, 'A reusable current window retains automatic entry');
  f.session++; await f.controller.start({}, {}); await f.controller.stop();
  assert.equal(f.background, false, 'Old playback cannot retain the background policy');
  assert.equal(f.controller.isBackgroundRequested, false); await f.controller.stop();
}
async function testCreateCancelled() {
  for (const action of ['stop', 'new-session']) {
    const f = fixture(), starting = f.controller.start({}, {}); let stopping;
    if (action === 'stop') { stopping = f.controller.stop(); } else { f.session++; }
    f.resolveCreate(); assert.equal(await starting, false); await stopping;
    assert.equal(f.calls.includes('start'), false, action + ': stale creation does not start PiP');
    assert.equal(f.calls.some(call => Array.isArray(call) && call[0] === 'background' && call[1]), false);
    assert.equal(f.active, false);
  }
}
async function testStartCancelledAndLateEvents() {
  const f = fixture(); f.startGate = deferred();
  const starting = f.controller.start({}, {}); const w = f.resolveCreate();
  await new Promise(resolve => setImmediate(resolve));
  assert.equal(f.calls.includes('start'), true); const oldState = w.events.stateChange;
  const oldControl = w.events.controlEvent; const stopping = f.controller.stop();
  assert.equal(await f.controller.start({}, {}), false, 'Start waits for stop cleanup');
  oldState(f.api.PiPState.STARTED); oldControl({ controlType: 1, status: 2 });
  assert.equal(f.active, false); assert.equal(f.pauseTargets.length, 0);
  f.startGate.resolve(); assert.equal(await starting, false); await stopping;
  assert.equal(w.active, false); assert.equal(f.calls.filter(call => call === 'stop').length, 1);
  assert.equal(f.active, false);
}
async function testMergedStartAndControls() {
  const f = fixture(), starting = f.controller.start({}, {});
  assert.equal(f.controller.start({}, {}), starting); const w = f.resolveCreate();
  assert.equal(await starting, true); assert.equal(f.creates.length, 1);
  w.events.controlEvent({ controlType: 1, status: 2 });
  w.events.controlEvent({ controlType: 1, status: 1 });
  w.events.controlEvent({ controlType: 2 });
  assert.deepEqual(f.pauseTargets.slice(-2), [true, false]); assert.deepEqual(f.calls.at(-1), ['seek', 15]);
  const control = w.events.controlEvent; f.session++; control({ controlType: 1, status: 2 });
  assert.equal(f.pauseTargets.at(-1), false); await f.controller.stop();
  const retry = f.controller.start({}, {}); f.resolveCreate(); assert.equal(await retry, true);
}
async function testFailuresAndRetry() {
  const f = fixture(), starting = f.controller.start({}, {});
  f.creates[0].reject(Error('create failed')); assert.equal(await starting, false);
  const retry = f.controller.start({}, {}); f.resolveCreate(); assert.equal(await retry, true);
  await f.controller.stop();
}
async function testLateStartAndStopped() {
  for (const action of ['session', 'stopped']) {
    const f = fixture(); f.startGate = deferred();
    const starting = f.controller.start({}, {}), w = f.resolveCreate();
    await new Promise(resolve => setImmediate(resolve));
    if (action === 'session') f.session++;
    else w.events.stateChange(f.api.PiPState.STOPPED);
    f.startGate.resolve(); assert.equal(await starting, false);
    await f.controller.stop(); assert.equal(w.active, false); assert.equal(f.active, false);
    assert.equal(f.pauseTargets.length, 0, 'Stale startup never resumes playback');
  }
}
async function testCleanupFailuresRemainOwned() {
  for (const failure of ['disable', 'stop', 'listener']) {
    const f = fixture(), starting = f.controller.start({}, {}), w = f.resolveCreate();
    assert.equal(await starting, true);
    if (failure === 'disable') f.disableError = true;
    if (failure === 'stop') w.stopPiP = async () => { throw Error('stop failed'); };
    if (failure === 'listener') w.off = type => {
      f.calls.push(['off', type]); if (type === 'stateChange') throw Error('off failed');
    };
    await f.controller.stop();
    if (failure === 'listener') {
      assert(f.calls.some(call => Array.isArray(call) && call[0] === 'off' && call[1] === 'controlEvent'));
    } else {
      assert.equal(f.controller.isCreated, true, 'Failed cleanup retains ownership for retry');
      f.disableError = false; w.stopPiP = async () => { w.active = false; };
      await f.controller.stop(); assert.equal(f.controller.isCreated, false);
    }
    assert.equal(w.active, false); assert.equal(f.active, false);
  }
}
async function testPartialRegistrationFailure() {
  const f = fixture(), starting = f.controller.start({}, {}), w = f.resolveCreate();
  w.on = (type, callback) => {
    if (type === 'controlEvent') throw Error('registration failed');
    w.events[type] = callback;
  };
  assert.equal(await starting, false); assert.equal(w.events.stateChange, undefined);
  assert.equal(f.controller.isCreated, false); assert.equal(f.active, false);
}
async function testAutomaticReentry() {
  const f = fixture(), starting = f.controller.start({}, {}), w = f.resolveCreate();
  assert.equal(await starting, true);
  w.active = false; w.events.stateChange(f.api.PiPState.STOPPED);
  assert.equal(f.active, false); assert.equal(f.controller.isCreated, true);
  w.active = true; w.events.stateChange(f.api.PiPState.STARTED);
  assert.equal(f.active, true, 'The current playback still accepts automatic PiP reentry');
  await f.controller.stop();
}
async function testTransitionAndError() {
  const f = fixture(); f.playing = false; f.startGate = deferred();
  const starting = f.controller.start({}, {}), w = f.resolveCreate();
  await new Promise(resolve => setImmediate(resolve));
  w.events.stateChange(f.api.PiPState.ABOUT_TO_START);
  assert.equal(f.controller.shouldKeepPlaybackOnPageDisappear, true, 'Paused startup retains page ownership');
  f.startGate.resolve(); assert.equal(await starting, true);
  w.events.stateChange(f.api.PiPState.ABOUT_TO_RESTORE);
  assert.equal(f.active, true, 'Transition retains playback until STOPPED');
  w.events.stateChange(f.api.PiPState.ERROR); await f.controller.stop();
  assert.equal(f.active, false); assert.equal(w.active, false);
}
async function testFailedStartRetainsInvalidListeners() {
  const f = fixture(), starting = f.controller.start({}, {}), w = f.resolveCreate();
  w.startPiP = async () => { throw Error('start failed'); };
  w.off = () => { throw Error('off failed'); }; f.disableError = true;
  assert.equal(await starting, false); assert.equal(f.controller.isCreated, true);
  const pauses = f.pauseTargets.length;
  w.events.stateChange(f.api.PiPState.STARTED);
  w.events.controlEvent({ controlType: 1, status: 2 });
  assert.equal(f.pauseTargets.length, pauses); assert.equal(f.active, false);
  f.disableError = false; await f.controller.stop(); assert.equal(f.controller.isCreated, false);
}
(async () => {
  await testBackgroundPolicy(); await testBackgroundCleanupAndLateResults();
  await testBackgroundStartReplacement();
  await testBackgroundFailureRestoresPolicy();
  await testCreateCancelled(); await testStartCancelledAndLateEvents();
  await testMergedStartAndControls(); await testFailuresAndRetry();
  await testLateStartAndStopped(); await testCleanupFailuresRemainOwned();
  await testPartialRegistrationFailure();
  await testAutomaticReentry();
  await testTransitionAndError();
  await testFailedStartRetainsInvalidListeners();
  console.info('PiP: cancelled creation/start, merged requests, late events, command routing and retry passed');
})().catch(error => { console.error(error); process.exitCode = 1; });
