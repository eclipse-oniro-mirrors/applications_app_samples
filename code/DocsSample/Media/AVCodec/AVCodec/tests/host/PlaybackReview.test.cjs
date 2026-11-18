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
const sourceRoot = path.resolve(__dirname, '../../entry/src/main/ets');
function check(actual, expected, message) {
  console.info('Playback review:', message, { actual, expected });
  assert.deepEqual(actual, expected, message);
}
function deferred() {
  let resolve, reject;
  const promise = new Promise((yes, no) => { resolve = yes; reject = no; });
  return { promise, resolve, reject };
}
function load(relative, mocks = {}, globals = {}) {
  const file = path.join(sourceRoot, relative);
  const compiled = ts.transpileModule(fs.readFileSync(file, 'utf8'), {
    compilerOptions: { target: ts.ScriptTarget.ES2020, module: ts.ModuleKind.CommonJS }
  });
  const module = { exports: {} };
  vm.runInNewContext(compiled.outputText, { module, exports: module.exports, ...globals,
    require(name) { if (!(name in mocks)) { throw Error('Unexpected dependency: ' + name); } return mocks[name]; }
  }, { filename: file });
  return module.exports;
}
function audioFixture() {
  const f = { session: 1, dialogs: [], selections: [], toasts: [], muted: false, changes: 0 };
  const tracks = [0, 1].map(index => ({ index, type: 0, codecMime: 'audio/aac',
    audioSampleRate: 48000, audioChannelCount: 2, bitrate: 128000 }));
  const { PlaybackAudioController } = load('controller/PlaybackAudioController.ets', {
    'libplayer.so': { default: { getMediaInfo: () => ({ tracks }),
      selectAudioTrackAsync: async index => { f.selections.push(index); return true; },
      getState: () => 3, PlayerState: { PLAYING: 3, PAUSED: 5 }, setVolume() {} } },
    '../common/CommonConstants': { CommonConstants: { DURATION: 1, BOTTOM: 1 } },
    '../common/utils/MediaUtils': { getPickerSelectedIndex: index => index },
  }, { $r: key => key });
  f.settings = { audioVolume: 100, audioTrackIndex: 0 };
  f.controller = new PlaybackAudioController(() => ({ showTextPickerDialog: options => f.dialogs.push(options),
    getPromptAction: () => ({ showToast: toast => f.toasts.push(toast) }) }), f.settings, () => false,
    key => key, () => { f.changes++; }, () => f.muted, value => { f.muted = value; },
    () => 100, () => {}, () => f.session);
  return f;
}
async function testAudioDialogOwnership() {
  for (const session of [2, -1]) {
    const f = audioFixture(); f.controller.selectTrack(); f.session = session;
    f.dialogs[0].onAccept({ index: 1 });
    check(f.selections.length, 0, 'Stale or inactive audio dialogs cannot select a track');
    check(f.changes, 0, 'Stale dialogs do not refresh new media');
    check(f.toasts.length, 0, 'Stale dialogs do not display success');
  }
  const f = audioFixture(); f.controller.selectTrack(); f.dialogs[0].onAccept({ index: 1 });
  check(f.selections, [1], 'The active playback dialog can still select a track');
}

function subtitleFixture() {
  const f = { stats: 0, reads: 0, parses: 0, stat: async () => ({ size: 10 }), read: async () => 'subtitle' };
  class Timeline { setCues(cues) { this.cues = cues; } textAt() { return ''; } }
  const { PlaybackSubtitleController } = load('controller/PlaybackSubtitleController.ets', {
    '@kit.CoreFileKit': { fileIo: { stat() { f.stats++; return f.stat(); },
      readText() { f.reads++; return f.read(); } } },
    '../model/SubtitleModel': { SubtitleTimeline: Timeline, parseSubtitle() {
      f.parses++; return [{ startUs: 0, endUs: 100, text: 'subtitle' }];
    } }
  });
  f.controller = new PlaybackSubtitleController(); return f;
}
async function testSubtitleCancellation() {
  for (const stage of ['stat', 'read']) {
    const f = subtitleFixture(), wait = deferred(); f[stage] = () => wait.promise;
    const loading = f.controller.load('old.srt');
    for (let i = 0; i < 10; i++) { await Promise.resolve(); }
    f.controller.clear(); wait.resolve(stage === 'stat' ? { size: 10 } : 'old subtitle');
    check(await loading, '', stage + ': cancelled subtitle does not complete');
    check(f.reads, stage === 'stat' ? 0 : 1, stage + ': cancellation prevents further file reads');
    check(f.parses, 0, stage + ': cancellation prevents parsing obsolete content');
  }
  const current = subtitleFixture();
  check(await current.controller.load('current.srt'), 'current.srt', 'An active subtitle load still completes');
  check(current.parses, 1, 'An active load parses exactly once');
}

async function testSessionCleanup() {
  for (const rejected of ['play', 'seek', 'setSpeed']) {
    const removed = [], states = [], cleanup = [];
    const session = { on() {}, off(event) {
      removed.push(event); if (event === rejected) { throw Error('injected off failure'); }
    }, setAVMetadata: async () => {}, setLaunchAbility: async () => {}, activate: async () => {},
    setAVPlaybackState: async state => states.push(state.state),
    deactivate: async () => cleanup.push('deactivate'), destroy: async () => cleanup.push('destroy') };
    const { PlaybackSessionController } = load('controller/PlaybackSessionController.ets', {
      '@kit.AVSessionKit': { avSession: { createAVSession: async () => session,
        SkipIntervals: { SECONDS_15: 15 }, PlaybackState: { PLAYBACK_STATE_PLAY: 3, PLAYBACK_STATE_STOP: 4 } } },
      '@kit.AbilityKit': { wantAgent: { OperationType: { START_ABILITIES: 1 },
        WantAgentFlags: { UPDATE_PRESENT_FLAG: 1 }, getWantAgent: async () => ({}) } },
      '../common/utils/Logger': { default: { warn() {}, error() {} } }
    });
    const controller = new PlaybackSessionController();
    await controller.start({ abilityInfo: {} }, { assetId: 'one', title: 'one', durationMs: 100,
      queueTitle: 'queue', hasVideo: true, queueTitles: [], queueIndex: 0 }, {});
    await controller.stop();
    check(removed.length, 9, rejected + ': one failed off does not skip the remaining listeners');
    check(states.at(-1), 4, rejected + ': cleanup still publishes STOP');
    check(cleanup, ['deactivate', 'destroy'], rejected + ': cleanup releases the session');
  }
}

function historyFixture() {
  const f = { saved: '[]', cached: '[]', now: 10000, unavailable: false };
  class HistoryDate extends Date { static now() { return f.now; } }
  const store = { async get() { if (f.unavailable) { throw Error('unavailable'); } return f.saved; },
    async put(key, snapshot) { f.cached = snapshot; }, async flush() { f.saved = f.cached; } };
  const { PlaybackHistoryModel } = load('model/PlaybackHistoryModel.ets', {
    '@kit.ArkData': { preferences: { getPreferences: async () => store } },
    '../common/utils/Logger': { default: { warn() {} } }
  }, { Date: HistoryDate });
  f.history = new PlaybackHistoryModel(); return f;
}
async function testHistorySnapshots() {
  const f = historyFixture(); await f.history.load({});
  await f.history.update('one', 'one', 10, 100);
  const snapshot = f.history.getEntries(); snapshot[0].uri = 'changed'; snapshot[0].positionUs = 90;
  check(f.history.getEntries()[0].uri, 'one', 'A caller cannot change the stored history URI');
  check(f.history.getEntries()[0].positionUs, 10, 'A caller cannot change the stored history position');
  await f.history.update('two', 'two', 20, 100);
  check(JSON.parse(f.saved).find(entry => entry.uri === 'one').positionUs, 10,
    'Later saves retain the original snapshot values');
}

async function testHistoryCompletionRetention() {
  const f = historyFixture();
  f.saved = JSON.stringify(Array.from({ length: 20 }, (_, i) => ({ uri: 'item-' + i,
    title: 'item-' + i, positionUs: 50, durationUs: 100, updatedAt: i + 1 })));
  f.unavailable = true; await f.history.load({}); await f.history.markCompleted('item-0');
  f.now++; await f.history.update('new', 'new', 10, 100);
  f.unavailable = false; await f.history.flush();
  const entries = JSON.parse(f.saved);
  check(entries.length, 20, 'Recovery still respects the history limit');
  check(entries[1]?.uri, 'item-0', 'A recently completed record survives truncation during recovery');
  check(entries[1]?.positionUs, 0, 'Recovery persists the completed position');
  f.now++; await f.history.markCompleted('item-5');
  check(f.history.getEntries()[0].uri, 'item-5', 'Completion refreshes the recent-history order');
  check(JSON.parse(f.saved)[0].uri, 'item-5', 'Saved history and displayed history share the same order');
}

async function testQueueSnapshots() {
  const { TranscodeQualityModel, TranscodeAudioMode } = load('model/TranscodeQualityModel.ets', {},
    { Observed: value => value });
  const { TranscodeQueueModel } = load('model/TranscodeQueueModel.ets', {
    './TranscodeQualityModel': { TranscodeQualityModel, TranscodeAudioMode }
  }, { Observed: value => value });
  const queue = new TranscodeQueueModel(), quality = new TranscodeQualityModel().snapshot();
  quality.codecMode = 1; quality.audioResampler = 1; quality.deepValidation = true;
  const expected = JSON.parse(JSON.stringify(quality)), options = [0, 0, 0, 0, 0, 0, 0, 0];
  queue.add('one', 'one', options, false, 0, 0, quality);
  quality.codecMode = 0; options[0] = 1;
  check(queue.items[0].quality.codecMode, 1, 'Queue owns its quality snapshot after enqueue');
  check(queue.items[0].options[0], 0, 'Queue owns its options snapshot after enqueue');
  const input = JSON.parse(JSON.stringify(queue.items[0]));
  const restored = TranscodeQueueModel.validated([input]);
  input.uri = 'changed'; input.options[0] = 1; input.quality.codecMode = 0;
  check(restored[0].uri, 'one', 'Validated queue does not retain the input record reference');
  check(restored[0].options[0], 0, 'Validated queue owns its option array');
  check(JSON.parse(JSON.stringify(restored[0].quality)), expected, 'All quality settings survive the copy');
}

function seekPreviewFixture() {
  const f = { source: 'one', fetches: 0, bindings: 0, events: [], releasedFrames: 0 };
  const frame = { release(callback) { f.releasedFrames++; callback?.(); } };
  f.create = async () => generator;
  const generator = { set fdSrc(value) { f.bindings++; },
    async fetchFrameByTime() { f.fetches++; return frame; }, async release() { f.events.push('release'); } };
  const { SeekPreviewController } = load('controller/SeekPreviewController.ets', {
    '@kit.CoreFileKit': { fileIo: { OpenMode: { READ_ONLY: 0 }, openSync: () => ({ fd: 1 }),
      statSync: () => ({ size: 100 }), closeSync() { f.events.push('close'); } } },
    '@kit.MediaKit': { media: { createAVImageGenerator: () => f.create(),
      AVImageQueryOptions: { AV_IMAGE_QUERY_CLOSEST_SYNC: 0 } } },
    'libplayer.so': { default: {} },
    '../common/CommonConstants': { CommonConstants: { DEFAULT_VALUE: 0 } },
    '../common/utils/Logger': { default: { info() {}, error() {} } }
  });
  f.model = { isSeeking: true, hasVideo: true, seekPreviewVisible: true, seekPreviewFailed: false,
    seekPreviewRotation: 0, seekPreviewFrame: undefined };
  f.generator = generator; f.frame = frame;
  f.controller = new SeekPreviewController(f.model, () => f.source,
    () => ({ video: { rotation: 0, width: 1280, height: 720 } }));
  return f;
}
async function testSeekPreviewCancellation() {
  for (const action of ['cancel', 'source', 'release-drag']) {
    const f = seekPreviewFixture(), gate = deferred(); f.create = () => gate.promise;
    const loading = f.controller.fetchSeekPreview(1000, 0, 0);
    if (action === 'cancel') { f.controller.cancelSeekPreviewRequest(); }
    else if (action === 'source') { f.source = 'two'; }
    else { f.model.isSeeking = false; }
    gate.resolve(f.generator); await loading;
    check(f.fetches, 0, action + ': obsolete creation does not fetch a frame');
    check(f.bindings, 0, action + ': obsolete creation does not bind the input fd');
    check(f.events, ['release', 'close'], action + ': generator releases before the fd closes');
    check(f.model.seekPreviewFrame, undefined, action + ': obsolete creation does not publish a frame');
  }
  const current = seekPreviewFixture(); await current.controller.fetchSeekPreview(1000, 0, 0);
  check(current.fetches, 1, 'An active drag still fetches one frame');
  check(current.model.seekPreviewFrame, current.frame, 'An active drag publishes its frame');
  check(current.events, ['release', 'close'], 'Successful preview releases generator and fd');
}

const cases = { audioDialog: testAudioDialogOwnership, subtitleCancellation: testSubtitleCancellation,
  sessionCleanup: testSessionCleanup, historySnapshots: testHistorySnapshots,
  historyCompletion: testHistoryCompletionRetention, queueSnapshots: testQueueSnapshots,
  seekPreviewCancellation: testSeekPreviewCancellation };
const guard = setTimeout(() => { console.error('Playback review timed out'); process.exit(1); }, 30000);
(async () => {
  const selected = process.argv[3];
  if (selected && !cases[selected]) { throw Error('Unknown case: ' + selected); }
  for (const [name, test] of Object.entries(cases)) {
    if (!selected || selected === name) { await test(); console.info('Playback review passed: ' + name); }
  }
})().catch(error => { console.error(error); process.exitCode = 1; }).finally(() => clearTimeout(guard));
