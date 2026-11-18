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
const { fixture, deferred, until, settle, load } = require('./helpers/PlaybackPageFixture.cjs');
const { flowEvents: { PlaybackNoticeEvent } } = require('./helpers/PlaybackFlowFixture.cjs');

function checkEqual(actual, expected, message) {
  console.info('Playback page adapter:', message, { actual, expected }); assert.equal(actual, expected, message);
}
async function testPageAdapter() {
  const f = fixture(); await f.start();
  assert.equal(f.page.configurationController.touched, true); assert.equal(f.page.audioMuted, false);
  assert.equal(f.page.playbackViewModel.positionUs, 10_000_000);
  f.complete(); assert.equal(f.page.playbackViewModel.positionUs, 0);
  assert.equal(f.page.playbackFlowState.phase, 'idle'); assert.equal(f.page.playbackFlowState.buttonEnabled, true);
  const leaving = fixture(), pending = leaving.page.playbackFlow.play();
  leaving.page.aboutToDisappear(); leaving.page.pageActive = true; leaving.prepares[0].resolve(); await pending;
  assert.equal(leaving.launches.length, 0);
  const failed = fixture(); failed.startResult = { started: false, nativeOwnsLease: false }; await failed.start();
  assert.equal(failed.page.playbackViewModel.positionUs, 0); assert.equal(failed.toasts.length, 1);
}
async function testLateSubtitleFeedback() {
  for (const action of ['leave', 'same-file-replay', 'current']) {
    const f = fixture(), p = f.page, wait = deferred();
    p.subtitles = { selectAndLoad: () => wait.promise, clear() {} };
    const loading = p.selectSubtitleFile();
    if (action === 'leave') { p.pageActive = false; }
    else if (action === 'same-file-replay') { await f.start(); }
    wait.reject(Error('late subtitle failure')); await loading;
    checkEqual(f.toasts.length, action === 'current' ? 1 : 0, action + ': current subtitle feedback');
  }
}

async function testLateResumeFeedback() {
  for (const action of ['new-session', 'leave', 'stop', 'completed', 'same-file-replay', 'current']) {
    const f = fixture(), p = f.page, wait = deferred();
    p.requestSeek = () => wait.promise;
    const starting = p.playbackFlow.play(3_000_000); f.prepares[0].resolve(); await starting;
    const callback = f.timers.values().next().value; f.timers.clear();
    callback();
    if (action === 'new-session' || action === 'same-file-replay') {
      f.complete(); p.selectFilePath = action === 'new-session' ? 'B' : 'A'; await f.start();
    } else if (action === 'leave') { p.aboutToDisappear(); }
    else if (action === 'stop') { await p.playbackFlow.stop(); }
    else if (action === 'completed') { f.complete('completed'); }
    wait.resolve('completed'); await settle();
    checkEqual(f.toasts.length, action === 'current' ? 1 : 0, action + ': resume feedback belongs to active playback');
  }
}

async function testHistoryRefresh() {
  const f = fixture(); await f.start();
  await f.flow.persistProgress(20_000_000, 60_000_000, true);
  assert.equal(f.page.recentEntries.at(-1).uri, 'A');
  const entries = f.page.recentEntries, gate = deferred(); f.persist = () => gate.promise;
  const saving = f.flow.persistProgress(30_000_000, 60_000_000, true);
  f.page.pageActive = false; gate.resolve(true); await saving;
  assert.equal(f.page.recentEntries, entries, 'Detached page retains its last rendered history');
}
async function testNoticeResources() {
  const mappings = { no_source: 'alert', close_unconfirmed: 'playback_close_unconfirmed',
    busy: 'playback_cleanup_busy', empty: 'media_file_empty', invalid: 'media_file_invalid',
    recovered: 'playback_recovered', resumed: 'playback_resume_position', open: 'media_file_open_failed',
    recovering: 'playback_recovering', transcoding: 'transcode_resource_busy' };
  for (const [notice, resource] of Object.entries(mappings)) {
    const f = fixture();
    f.page.handlePlaybackFlowEvent(new PlaybackNoticeEvent(notice));
    assert.equal(f.toasts[0].message, 'app.string.' + resource);
  }
}
async function testControlAdapter() {
  const f = fixture(), p = f.page, gate = deferred(); await f.start();
  f.seekTo = () => gate.promise;
  f.seeks.submitted = 1; f.seeks.merged = 0; f.seeks.completed = 0;
  const seeking = p.requestSeek(20_000_000);
  assert.equal(p.playbackViewModel.positionUs, 20_000_000);
  assert.equal(p.playbackViewModel.isSeeking, true);
  assert.equal(p.playbackViewModel.seekSubmitted, 1);
  f.seeks.isBusy = () => true; p.setPlaybackSpeed(2);
  assert.equal(f.nativeControls.length, 0);
  p.thermalWarningActive = true; f.seeks.completed = 1; f.seeks.isBusy = () => false;
  gate.resolve('completed'); assert.equal(await seeking, 'completed');
  assert.equal(p.playbackViewModel.isSeeking, false); assert.equal(p.playbackViewModel.seekCompleted, 1);
  assert.deepEqual(f.nativeControls, [['after-seek', 2, true]]);
  p.togglePlaybackPause(true);
  assert.equal(p.playbackViewModel.state, f.states.PAUSED);
  assert.equal(f.sessionState[0], f.states.PAUSED);
  assert.equal(f.toasts.at(-1).message, 'app.string.playback_pause');
  p.togglePlaybackPause(true);
  assert.equal(p.playbackViewModel.state, f.states.PLAYING);
  assert.equal(f.sessionState[0], f.states.PLAYING);
  assert.equal(f.toasts.at(-1).message, 'app.string.playback_gesture_play');
}
async function testControlNoticeResources() {
  const f = fixture(), p = f.page; await f.start();
  f.seeks.isBusy = () => true; p.togglePlaybackPause(true);
  assert.equal(f.toasts.at(-1).message, 'app.string.playback_seek_busy');
  assert.equal(f.nativeControls.length, 0);
  f.seeks.isBusy = () => false; f.seekTo = async () => 'failed';
  assert.equal(await p.requestSeek(20_000_000), 'failed');
  assert.equal(p.playbackViewModel.isSeeking, false);
  assert.equal(f.toasts.at(-1).message, 'app.string.seek_failed');
}
async function testRejectedStopSettlesView() {
  const f = fixture(), p = f.page, gate = deferred(); await f.start();
  f.seekTo = () => gate.promise; f.seekIdle = () => gate.promise;
  f.runtime.stop = () => false;
  const seeking = p.requestSeek(20_000_000), stopping = f.flow.stop();
  gate.resolve('completed'); await seeking; await stopping;
  assert.equal(f.state.phase, 'active');
  assert.equal(p.playbackViewModel.isSeeking, false, 'Rejected stop settles the cancelled Seek display');
  assert.equal(f.nativeControls.length, 0, 'The cancelled Seek cannot restore Native controls');
}
async function testFrameStepAdapter() {
  const f = fixture(), p = f.page, targets = []; await f.start();
  p.rejectWhileSeeking = () => false; p.currentPlaybackPositionUs = () => 10_000_000;
  p.playbackCommands.stepFrame = async target => { targets.push(target); return 'completed'; };
  p.stepFrame(1); p.stepFrame(-1);
  assert.deepEqual(targets, [10_040_000, 9_960_000]);
  p.handlePlaybackControlEvent({ type: 'frame_step_failed' });
  assert.equal(f.toasts.at(-1).message, 'app.string.playback_frame_step_failed');
}
async function testSessionTargetCommands() {
  const f = fixture(), p = f.page; await f.start();
  p.playbackViewModel.state = f.states.PAUSED;
  p.handleSessionPause(); assert.equal(f.nativeState, f.states.PAUSED);
  p.handleSessionPause(); assert.equal(f.nativeControls.length, 1);
  p.playbackViewModel.state = f.states.PLAYING;
  p.handleSessionPlay(); assert.equal(f.nativeState, f.states.PLAYING);
  p.handleSessionPlay(); assert.equal(f.nativeControls.length, 2);
}
async function testBackgroundFeedback() {
  const outcomes = ['enabled', 'disabled', 'cleanup_pending', 'failed', 'cancelled', 'replay', 'leave', 'replaced'];
  for (const outcome of outcomes) {
    const f = fixture(), p = f.page, gate = deferred(); await f.start();
    p.rejectWhileSeeking = () => false;
    const controller = { backgroundRequestRevision: 0, isBackgroundRequested: outcome === 'disabled',
      setBackgroundPlayback: enabled => {
      controller.backgroundRequestRevision++; controller.isBackgroundRequested = enabled; return gate.promise;
    } };
    p.ensurePictureInPictureController = () => controller;
    const pending = p.toggleBackgroundPlayback();
    if (outcome === 'replay') { f.complete(); await f.start(); }
    if (outcome === 'leave') { p.pageActive = false; }
    if (outcome === 'replaced') { controller.backgroundRequestRevision++; }
    gate.resolve(['replay', 'leave'].includes(outcome) ? 'enabled' :
      (outcome === 'replaced' ? 'failed' : outcome)); await pending;
    if (['cancelled', 'replay', 'leave', 'replaced'].includes(outcome)) { assert.equal(f.toasts.length, 0); continue; }
    const resource = outcome === 'enabled' ? 'playback_background_enabled' :
      (outcome === 'disabled' ? 'playback_background_disabled' : 'playback_pip_failed');
    assert.equal(f.toasts.at(-1).message, 'app.string.' + resource);
  }
}
async function testLatePipFeedback() {
  for (const action of ['leave', 'replay', 'stop', 'current']) {
    const f = fixture(), p = f.page, gate = deferred(); await f.start();
    p.rejectWhileSeeking = () => false;
    p.ensurePictureInPictureController = () => ({ start: () => gate.promise });
    const starting = p.togglePictureInPicture();
    if (action === 'leave') p.pageActive = false;
    if (action === 'replay') { f.complete(); await f.start(); }
    if (action === 'stop') await f.flow.stop();
    gate.resolve(false); await starting;
    assert.equal(f.toasts.length, action === 'current' ? 1 : 0, action + ': PiP feedback ownership');
  }
}

(async () => {
  await testHistoryRefresh(); await testNoticeResources(); await testPageAdapter();
  await testLateSubtitleFeedback(); await testLateResumeFeedback();
  await testControlAdapter(); await testControlNoticeResources();
  await testRejectedStopSettlesView();
  await testFrameStepAdapter(); await testLatePipFeedback();
  await testSessionTargetCommands(); await testBackgroundFeedback();
})()
  .catch(error => { console.error(error); process.exitCode = 1; });
