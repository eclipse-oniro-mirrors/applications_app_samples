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

async function fixture() {
  const f = coreFixture(undefined, state => {
    Object.assign(state, { track: deferred(), seek: deferred(), busy: false, speed: 1, volume: 1,
      muted: false, thermalWarning: false, events: [] });
    const { SeekRequestController } = load('controller/SeekRequestController.ets', {});
    return new SeekRequestController(async () => {
      state.busy = true; const result = await state.seek.promise; state.busy = false; return result;
    });
  });
  await f.start();
  const native = { PlayerState: f.states, getState: () => f.nativeState,
    getMediaInfo: () => ({ tracks: [0, 1].map(index => ({ index, type: 0, codecMime: 'audio/aac',
      audioSampleRate: 48000, audioChannelCount: 2, bitrate: 128000 })) }),
    async selectAudioTrackAsync() {
      f.busy = true;
      try { return await f.track.promise; } finally { f.busy = false; }
    }, setVolume(volume) { if (!f.busy) { f.volume = volume; } } };
  const runtime = { ...f.runtime, setSpeed(speed) { if (!f.busy) { f.speed = speed; } },
    restoreAfterSeek(speed, thermalWarning) {
      if (!f.busy) { f.speed = speed; f.restoredThermalWarning = thermalWarning;
        f.restores = (f.restores ?? 0) + 1; }
    } };
  const { PlaybackCommandController } = load('controller/PlaybackCommandController.ets', {
    '../common/utils/Logger': { default: f.logger } });
  f.commands = new PlaybackCommandController(f.state, f.seeks, {
    getSnapshot: () => ({ active: true, dragging: false, thermalWarning: f.thermalWarning }),
    onEvent: event => f.events.push(event.type) }, runtime);
  const { PlaybackAudioController } = load('controller/PlaybackAudioController.ets', {
    'libplayer.so': { default: native }, '../common/CommonConstants': { CommonConstants: {} },
    '../common/utils/MediaUtils': { getPickerSelectedIndex: index => index } }, { $r: key => key });
  f.settings = { audioVolume: 100, audioTrackIndex: 0 };
  f.audio = new PlaybackAudioController(() => ({ showTextPickerDialog: options => { f.dialog = options; },
    getPromptAction: () => ({ showToast() {} }) }), f.settings, () => f.seeks.isBusy(), key => key,
  () => {}, () => f.muted, muted => { f.muted = muted; }, () => 100, () => {},
  () => f.state.canControl ? f.state.session : -1,
  index => { f.switching = f.commands.selectTrack(() => native.selectAudioTrackAsync(index)); return f.switching; });
  f.audio.selectTrack(); f.dialog.onAccept({ index: 1 });
  return f;
}

async function testControlsDuringSwitch() {
  for (const outcome of ['success', 'failure', 'rejection']) {
    const f = await fixture();
    assert.equal(f.seeks.isBusy(), true);
    f.commands.setSpeed(2); f.audio.toggleMute();
    assert.equal(f.muted, false, 'Busy mute keeps the icon consistent with Native volume');
    assert.equal(f.volume, 1); assert.equal(f.speed, 1);
    assert.equal(f.commands.setPaused(true), false);
    f.thermalWarning = true;
    if (outcome === 'rejection') { f.track.reject(Error('track failed')); }
    else { f.track.resolve(outcome === 'success'); }
    await f.switching; await settle();
    assert.equal(f.seeks.isBusy(), false);
    assert.equal(f.speed, 2, 'The latest speed is applied after every settled track operation');
    assert.equal(f.restoredThermalWarning, true, 'Track completion applies the latest thermal policy');
    assert.equal(f.settings.audioTrackIndex, outcome === 'success' ? 1 : 0);
    f.audio.toggleMute(); assert.equal(f.muted, true); assert.equal(f.volume, 0);
    console.info('Track controls:', outcome, { speed: f.speed, muted: f.muted, volume: f.volume });
  }
}

async function testQueuedSeekAndCancellation() {
  const f = await fixture();
  const seeking = f.commands.seek(100); f.commands.setSpeed(2);
  let idle = false; const waiting = f.seeks.waitForIdle().then(() => { idle = true; });
  f.track.resolve(true); await f.switching;
  assert.equal(f.seeks.isBusy(), true); assert.equal(idle, false); assert.equal(f.restores ?? 0, 0);
  f.seek.resolve(true); await seeking; await waiting;
  assert.equal(f.speed, 2); assert.equal(f.restores, 1);
  const cancelled = await fixture();
  const stopping = cancelled.flow.stop();
  assert.equal(cancelled.stopCalls, 0, 'Stop waits for the submitted track operation');
  cancelled.track.resolve(true); await cancelled.switching; await stopping; await settle();
  assert.equal(cancelled.restores ?? 0, 0, 'A cancelled track result cannot restore new playback controls');
  assert.equal(cancelled.settings.audioTrackIndex, 0);
  assert.equal(cancelled.seeks.isBusy(), false);
  assert.equal(cancelled.stopCalls, 1);
  cancelled.complete(); await cancelled.start();
  assert.equal(cancelled.state.canControl, true);
}

(async () => {
  await testControlsDuringSwitch(); await testQueuedSeekAndCancellation();
  console.info('Track switch: shared busy gate, controls, queued seek and stale completion passed');
})().catch(error => { console.error(error); process.exitCode = 1; });
