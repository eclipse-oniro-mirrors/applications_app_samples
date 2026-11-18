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
const pageSource = fs.readFileSync(path.join(sourceRoot, 'pages/Index.ets'), 'utf8');
const newline = String.fromCharCode(10);

// Run production page methods without rendering ArkUI or loading a native codec.
function pageMethod(name) {
  const prefixes = ['  ', '  private ', '  async ', '  private async '].map(prefix => prefix + name + '(');
  const line = pageSource.split(newline).find(item => prefixes.some(prefix => item.startsWith(prefix)));
  assert(line, 'Missing page method: ' + name);
  const start = pageSource.indexOf(line);
  const scanner = ts.createScanner(ts.ScriptTarget.Latest, true, ts.LanguageVariant.Standard, pageSource);
  scanner.setTextPos(start);
  let depth = 0, opened = false;
  const templateDepths = [];
  for (let token = scanner.scan(); token !== ts.SyntaxKind.EndOfFileToken; token = scanner.scan()) {
    if (token === ts.SyntaxKind.TemplateHead) { templateDepths.push(depth); }
    if (token === ts.SyntaxKind.CloseBraceToken && templateDepths.at(-1) === depth) {
      if (scanner.reScanTemplateToken(false) === ts.SyntaxKind.TemplateTail) { templateDepths.pop(); }
      continue;
    }
    if (token === ts.SyntaxKind.OpenBraceToken) { depth++; opened = true; }
    if (token === ts.SyntaxKind.CloseBraceToken && --depth === 0 && opened) {
      return pageSource.slice(start, scanner.getTextPos());
    }
  }
  throw Error('Unterminated page method: ' + name);
}
const methods = ['play', 'stopPlayback', 'continuePendingQueuePlayback', 'continuePlayback', 'aboutToDisappear',
  'cancelRecordingStartup', 'finalizePlaybackHistory', 'persistPlaybackProgress', 'selectSubtitleFile']
  .map(pageMethod).join(newline);
const compiledPage = ts.transpileModule('class PlaybackPageFixture {' + newline + methods +
  newline + '} module.exports = PlaybackPageFixture;', {
  compilerOptions: { target: ts.ScriptTarget.ES2020, module: ts.ModuleKind.CommonJS }, reportDiagnostics: true
});
assert.equal(compiledPage.diagnostics.length, 0);

function deferred() {
  let resolve, reject;
  const promise = new Promise((yes, no) => { resolve = yes; reject = no; });
  return { promise, resolve, reject };
}
function load(relative, mocks, globals = {}) {
  const file = path.join(sourceRoot, relative);
  const compiled = ts.transpileModule(fs.readFileSync(file, 'utf8'), {
    compilerOptions: { target: ts.ScriptTarget.ES2020, module: ts.ModuleKind.CommonJS }
  });
  const module = { exports: {} };
  vm.runInNewContext(compiled.outputText, { module, exports: module.exports, ...globals,
    require(name) { assert(mocks[name], name); return mocks[name]; } }, { filename: file });
  return module.exports;
}
function fixture() {
  const f = { prepares: [], launches: [], toasts: [], history: [], warnings: [], timers: new Map(),
    stopCalls: 0, sessionStops: 0, updateCalls: 0, nativeState: 0, seekIdle: async () => {},
    flushCalls: 0, markCompleted: async () => true, completedInfo: { durationUs: 60_000_000 },
    documents: [], albums: [], resumeQueries: [],
    sessionStop: async () => {}, persist: async () => {}, flush: async () => true };
  const states = { IDLE: 0, PLAYING: 3, STOPPING: 4, PAUSED: 6 };
  const logger = { info() {}, warn: (tag, message) => f.warnings.push(message), error() {} };
  const player = { PlayerState: states, getState: () => f.nativeState,
    getCompletedPlaybackInfo: () => f.completedInfo,
    stop() { f.stopCalls++; if (f.nativeState !== states.PLAYING && f.nativeState !== states.PAUSED) { return false; }
      f.nativeState = states.STOPPING; return true; }, isSmartFluencyAvailable: () => false };
  const module = { exports: {} };
  vm.runInNewContext(compiledPage.outputText, { module, player, Logger: logger, TAG: 'PlaybackPageTest',
    $r: key => key, Const: { DURATION: 1, BOTTOM: 1 }, MediaFileActivity: { isTranscoding: () => false },
    MediaTaskCoordinator: { cancelling() {} },
    PlaybackUriAccessController: { prepare(uri) { const gate = deferred(); f.prepares.push({ uri, ...gate }); return gate.promise; } },
    PlaybackStartupController: { launch(context, uri, settings, smart, prepare, complete) {
      if (f.launchError) return { started: false, nativeOwnsLease: false, error: f.launchError, cleanupPending: true };
      const lease = { id: 'lease-' + f.launches.length };
      prepare(lease); f.nativeState = states.PLAYING; f.launches.push({ uri, lease, complete });
      return { started: true, nativeOwnsLease: true, error: '' };
    } }, setTimeout(fn) { const id = f.timers.size + 1; f.timers.set(id, fn); return id; },
    clearTimeout(id) { f.timers.delete(id); } });
  const page = new module.exports();
  const noOp = () => {};
  Object.assign(page, {
    playbackSession: 0, playbackStartupRevision: 0, playbackContinuationRevision: 0, isPreparingPlayback: false,
    pageActive: true, isStopping: false, buttonEnabled: true, selectFilePath: 'A', resumeSeekTimer: 0,
    activePlaybackPath: null,
    recordingRequestRevision: 0, recorderLaunch: { cancel: noOp },
    subtitleSourcePath: '', requestedSpeed: 1, lastHistoryPositionUs: -1, configurationController: {},
    playerSettings: { audioVolume: 100, resumeLastPosition: false }, seekRequestId: 0, autoRecoveryEnabled: false,
    recovery: { reset: noOp, cancel: noOp },
    seekRequests: { isBusy: () => false, resetStatistics: noOp, cancel: noOp, waitForIdle: () => f.seekIdle() },
    playbackSessionController: { updateState: noOp, stop() { f.sessionStops++; return f.sessionStop(); } },
    playbackViewModel: { positionUs: 10_000_000, durationUs: 60_000_000, state: states.PLAYING,
      recoveryAttemptCount: 0, clearRecoveryDiagnostics: noOp },
    playbackHistory: { flush() { f.flushCalls++; return f.flush(); },
      markCompleted(uri, durationUs) {
        f.history.push({ uri, completed: true, durationUs }); return f.markCompleted(uri, durationUs);
      },
      getResumePosition(uri, durationUs, enabled) {
        f.resumeQueries.push({ uri, durationUs, enabled }); return 0;
      } },
    updatePlaybackInfo() { f.updateCalls++; }, updateMediaInfo() { page.currentMediaInfo = { durationUs: 60_000_000 }; },
    resetPlaybackProgress() { page.playbackViewModel.positionUs = 0; page.playbackViewModel.durationUs = 0; },
    clearSubtitle: noOp, resetAbLoop: noOp, showPlaybackControls: noOp, capturePlaybackFailure: noOp,
    startPlaybackInfoUpdates() {
      page.playbackViewModel.positionUs = 10_000_000;
      page.playbackViewModel.durationUs = 60_000_000;
      page.playbackViewModel.state = states.PLAYING;
    },
    stopPlaybackInfoUpdates: noOp, startPlaybackSession: noOp, stopPictureInPicture: noOp, clearPlaybackControlsTimer: noOp,
    isPictureInPictureHoldingPlayback: () => false, transcodeModel: { dispose: noOp },
    getUIContext: () => ({ getHostContext: () => ({}), getPromptAction: () => ({ showToast: toast => f.toasts.push(toast) }) })
  });
  const { PlaybackQueueController } = load('controller/PlaybackQueueController.ets', {
    '../model/PlaybackModeModel': { PlaybackMode: { REPEAT_ALL: 2 }, nextPlaybackIndex: () => -1 }
  }, { Observed: target => target });
  page.playbackQueue = new PlaybackQueueController(); page.playbackQueue.paths = ['A', 'B', 'C'];
  page.playbackQueue.index = 0; page.queueEntries = page.playbackQueue.paths.slice();
  const { PlaybackSourceController } = load('controller/PlaybackSourceController.ets', {
    '@kit.CoreFileKit': { picker: { DocumentSelectOptions: class {},
      DocumentViewPicker: class { select() { const request = deferred(); f.documents.push(request); return request.promise; } } } },
    '@kit.MediaLibraryKit': { photoAccessHelper: { PhotoViewMIMETypes: { VIDEO_TYPE: 'video' },
      PhotoViewPicker: class { select() { const request = deferred(); f.albums.push(request); return request.promise; } } } },
    '../model/PlaybackHistoryModel': { getPlaybackTitle: uri => uri },
    '../common/LocalizedText': { LocalizedText: { get: key => key } },
    '../common/utils/Logger': { default: logger }, '../common/utils/MediaUtils': {},
    './PlaybackUriAccessController': { PlaybackUriAccessController: { persistDocumentUri: async () => true } }
  }, { $r: key => key, setTimeout(fn) { const id = f.timers.size + 1; f.timers.set(id, fn); return id; },
    clearTimeout(id) { f.timers.delete(id); } });
  const sourceHistory = { async update(uri, title, position, duration, force) {
    f.history.push({ uri, position, duration, force }); await f.persist(); return true;
  }, getEntries: () => [] };
  page.playbackSources = new PlaybackSourceController(() => ({}), page.playbackQueue, sourceHistory, {
    activatePlayer: noOp, closeQueue: noOp, isPageActive: () => page.pageActive,
    isButtonEnabled: () => page.buttonEnabled, isStopping: () => page.isStopping,
    setPath: uri => { page.selectFilePath = uri; }, getPath: () => page.selectFilePath,
    setQueueEntries: entries => { page.queueEntries = entries; }, setRecentEntries: noOp, showNoMediaSelected: noOp,
    play: position => { f.sourcePlay = page.play(position); }, stop: () => { f.sourceStop = page.stopPlayback(); }
  });
  return Object.assign(f, { page, states, async start() {
    const starting = page.play(); f.prepares.at(-1).resolve(); await starting;
  }, complete(reason = 'stopped', cleanupPending = false) {
    f.nativeState = states.IDLE;
    f.launches.at(-1).complete({ reason, success: reason === 'completed' }, cleanupPending);
  } });
}
async function until(condition) {
  for (let i = 0; i < 100 && !condition(); i++) { await Promise.resolve(); }
  assert(condition(), 'Expected asynchronous checkpoint was not reached');
}

async function testStartupCancellation() {
  for (const reject of [false, true]) {
    const f = fixture(), p = f.page;
    const old = p.play();
    assert.equal(p.isPreparingPlayback, true);
    await p.stopPlayback();
    assert.equal(f.stopCalls, 0, 'Preparing a URI does not call Native stop');
    assert.equal(p.buttonEnabled, true); assert.equal(p.isStopping, false);
    if (reject) { f.prepares[0].reject(Error('late preparation failure')); } else { f.prepares[0].resolve(); }
    await old;
    assert.equal(f.launches.length, 0); assert.equal(f.toasts.length, 0);
    assert.equal(p.isPreparingPlayback, false);
  }
  for (const oldFirst of [false, true]) {
    for (const reject of [false, true]) {
      const f = fixture(), p = f.page;
      const old = p.play(); await p.stopPlayback();
      p.selectFilePath = 'new'; const next = p.play();
      const settleOld = () => reject ? f.prepares[0].reject(Error('old failure')) : f.prepares[0].resolve();
      if (oldFirst) {
        settleOld(); await old;
        assert.equal(p.buttonEnabled, false, 'Old request cannot unlock newer preparation');
        assert.equal(p.isPreparingPlayback, true);
      }
      f.prepares[1].resolve(); await next;
      if (!oldFirst) { settleOld(); await old; }
      assert.deepEqual(f.launches.map(item => item.uri), ['new']);
      assert.equal(p.buttonEnabled, false, 'Old request cannot unlock active playback');
      assert.equal(f.toasts.length, 0);
      assert.equal(p.playbackLease, f.launches[0].lease);
    }
  }
  const leaving = fixture(), pending = leaving.page.play();
  leaving.page.aboutToDisappear(); leaving.page.pageActive = true;
  leaving.prepares[0].resolve(); await pending;
  assert.equal(leaving.launches.length, 0, 'Leaving and returning invalidates preparation');
  const failed = fixture(), failing = failed.page.play();
  failed.prepares[0].reject(Error('current failure')); await failing;
  assert.equal(failed.page.buttonEnabled, true); assert.equal(failed.page.isPreparingPlayback, false);
  assert.equal(failed.toasts.length, 1, 'Current preparation errors still display feedback');
  const queued = fixture(), first = queued.page.play();
  queued.page.playbackSources.playQueueEntry(1);
  await until(() => queued.prepares.length === 2);
  queued.prepares[1].resolve(); await queued.sourceStop;
  queued.prepares[0].resolve(); await first;
  assert.deepEqual(queued.launches.map(item => item.uri), ['B'], 'Next item still works during URI preparation');
  assert.equal(queued.page.playbackQueue.index, 1);
  console.info('Playback page: startup cancellation, late success/failure, immediate replay and page re-entry passed');
}

async function testLateSubtitleFeedback() {
  for (const action of ['leave', 'same-file-replay', 'current']) {
    const f = fixture(), p = f.page, wait = deferred();
    p.subtitles = { selectAndLoad: () => wait.promise, clear() {} };
    const loading = p.selectSubtitleFile();
    if (action === 'leave') { p.pageActive = false; }
    else if (action === 'same-file-replay') { p.playbackSession++; }
    wait.reject(Error('late subtitle failure')); await loading;
    checkEqual(f.toasts.length, action === 'current' ? 1 : 0, action + ': only current subtitle errors display feedback');
  }
}

async function testLateResumeFeedback() {
  for (const action of ['new-session', 'leave', 'stop', 'completed', 'same-file-replay', 'current']) {
    const f = fixture(), p = f.page, wait = deferred();
    p.requestSeek = () => wait.promise;
    const starting = p.play(3_000_000); f.prepares[0].resolve(); await starting;
    const callback = f.timers.get(p.resumeSeekTimer);
    f.timers.delete(p.resumeSeekTimer);
    const resuming = callback();
    if (action === 'new-session' || action === 'same-file-replay') { p.playbackSession++; }
    else if (action === 'leave') { p.pageActive = false; }
    else if (action === 'stop') { p.isStopping = true; }
    else if (action === 'completed') { f.complete('completed'); }
    wait.resolve('completed'); await resuming;
    checkEqual(f.toasts.length, action === 'current' ? 1 : 0, action + ': resume feedback belongs to active playback');
  }
}

async function testQueueSelectionWhileStopping() {
  const f = fixture(), p = f.page;
  await f.start();
  p.playbackSources.playQueueEntry(1);
  await until(() => f.stopCalls === 1);
  p.playbackSources.playQueueEntry(2);
  checkEqual(p.playbackQueue.pendingIndex, 2, 'A later queue choice replaces the pending target during stop');
  p.playbackSources.playQueueEntry(0);
  checkEqual(p.playbackQueue.pendingIndex, 0, 'Selecting the stopping item requests a fresh playback');
  checkEqual(f.stopCalls, 1, 'Changing the pending target does not request another Native stop');
  f.complete();
  await until(() => f.prepares.length === 2);
  checkEqual(f.prepares[1].uri, 'A', 'Only the final queue choice is prepared');
  f.prepares[1].resolve();
  await f.sourceStop;
  await until(() => f.launches.length === 2);
  checkEqual(f.launches[1].uri, 'A', 'The final queue choice starts after cleanup');
}

async function testAppendDuringQueueContinuation() {
  for (const stage of ['session', 'seek']) {
    const f = fixture(), p = f.page, wait = deferred(), entered = deferred();
    const block = () => { entered.resolve(); return wait.promise; };
    if (stage === 'session') { f.sessionStop = block; } else { f.seekIdle = block; }
    p.playbackQueue.pendingIndex = 1;
    const switching = p.continuePendingQueuePlayback();
    await entered.promise;
    p.playbackSources.enqueue('D');
    p.playbackSources.enqueue('D');
    checkEqual(p.queueEntries.join(','), 'A,B,C,D', stage + ': appended entries remain visible without duplicates');
    wait.resolve();
    for (let i = 0; i < 100 && f.prepares.length === 0; i++) { await Promise.resolve(); }
    checkEqual(f.prepares.length, 1, stage + ': appending preserves the pending playback switch');
    checkEqual(f.prepares[0].uri, 'B', stage + ': the original target remains selected');
    f.prepares[0].resolve();
    await switching;
    checkEqual(f.launches[0].uri, 'B', stage + ': the original target starts normally');
    checkEqual(p.queueEntries.join(','), 'A,B,C,D', stage + ': playback retains appended entries');
  }
}

async function testQueueContinuations() {
  for (const stage of ['session', 'seek']) {
    for (const action of ['new-play', 'clear', 'replace', 'leave', 'stop', 'change-target']) {
      const f = fixture(), p = f.page, wait = deferred(), entered = deferred();
      const block = () => { entered.resolve(); return wait.promise; };
      if (stage === 'session') { f.sessionStop = block; } else { f.seekIdle = block; }
      p.playbackSession = 10; p.playbackQueue.pendingIndex = 1;
      const switching = p.continuePendingQueuePlayback(); await entered.promise;
      let selected;
      if (action === 'new-play' || action === 'replace') {
        if (action === 'replace') { p.playbackSources.playRecentEntry({ uri: 'recent' }); selected = f.sourcePlay; }
        else { p.selectFilePath = 'C'; selected = p.play(); }
        f.prepares[0].resolve(); await selected;
      } else if (action === 'clear') { p.playbackSources.clearQueue(); }
      else if (action === 'leave') {
        p.pageActive = false; p.playbackSources.cancelSelection(); p.stopPlayback(); p.pageActive = true;
      } else if (action === 'stop') { p.stopPlayback(); }
      else { p.playbackQueue.paths[1] = 'changed'; }
      const expected = { path: p.selectFilePath, index: p.playbackQueue.index, entries: p.queueEntries.join(',') };
      wait.resolve(); await switching;
      assert.equal(p.selectFilePath, expected.path, stage + '/' + action);
      assert.equal(p.playbackQueue.index, expected.index, stage + '/' + action);
      assert.equal(p.queueEntries.join(','), expected.entries, stage + '/' + action);
      assert.equal(f.prepares.length, selected ? 1 : 0, 'A stale switch does not prepare another file');
    }
  }
  const normal = fixture(), p = normal.page; p.playbackQueue.pendingIndex = 1;
  const switching = p.continuePendingQueuePlayback();
  await until(() => normal.prepares.length === 1);
  normal.prepares[0].resolve(); await switching;
  assert.equal(p.selectFilePath, 'B'); assert.equal(p.playbackQueue.index, 1);
  assert.deepEqual(normal.launches.map(item => item.uri), ['B']);
  console.info('Playback page: queue switch waits, new selection, queue replacement/clear, stop and normal dispatch passed');
}

async function testCompletionAndStop() {
  const f = fixture(), p = f.page; await f.start();
  const completedSession = p.playbackSession, waitingSave = deferred(); f.persist = () => waitingSave.promise;
  const stopping = p.stopPlayback(); await until(() => f.stopCalls === 1);
  assert.equal(p.playbackSession, completedSession, 'Stop preserves the active completion generation');
  f.complete();
  assert.equal(p.playbackLease, undefined); assert.equal(p.buttonEnabled, true); assert.equal(p.isStopping, false);
  assert.equal(f.stopCalls, 1, 'Storage latency does not delay Native stop');
  waitingSave.resolve(); await stopping;

  const queued = fixture(); await queued.start();
  queued.page.playbackSources.playQueueEntry(1); await until(() => queued.stopCalls === 1);
  queued.complete(); await until(() => queued.prepares.length === 2);
  queued.prepares[1].resolve(); await queued.sourceStop;
  await until(() => queued.launches.length === 2);
  assert.deepEqual(queued.launches.map(item => item.uri), ['A', 'B']);
  assert.equal(queued.page.playbackQueue.index, 1);

  const automatic = fixture(); await automatic.start();
  automatic.page.playbackQueue.next = () => 1; automatic.complete('completed');
  await until(() => automatic.prepares.length === 2); automatic.prepares[1].resolve();
  await until(() => automatic.launches.length === 2);
  assert.deepEqual(automatic.launches.map(item => item.uri), ['A', 'B']);
  assert(automatic.history.some(item => item.uri === 'A' && item.completed));

  for (const action of ['clear', 'stop', 'new-play']) {
    const late = fixture(), wait = deferred(), entered = deferred();
    late.seekIdle = () => { entered.resolve(); return wait.promise; };
    const continuing = late.page.continuePlayback(0, 'B', 0); await entered.promise;
    let stopping;
    if (action === 'clear') { late.page.playbackSources.clearQueue(); }
    else if (action === 'stop') { stopping = late.page.stopPlayback(); }
    else { late.page.selectFilePath = 'C'; await late.start(); }
    const expected = late.page.selectFilePath; wait.resolve(); await continuing; await stopping;
    assert.equal(late.page.selectFilePath, expected);
    assert.equal(late.launches.length, action === 'new-play' ? 1 : 0);
  }
  console.info('Playback page: active completion cleanup, storage-independent stop, next item and automatic continuation passed');
}

function checkEqual(actual, expected, message) {
  console.info('Playback page:', message, { actual, expected });
  assert.equal(actual, expected, message);
}

// Natural completion saves independently of cleanup and starting the next queue entry.
async function testCompletionHistoryFinalization() {
  const f = fixture(), marking = deferred(), flushing = deferred(); await f.start();
  f.markCompleted = () => marking.promise; f.flush = () => flushing.promise;
  f.page.playbackQueue.next = () => 1; f.complete('completed');
  checkEqual(f.page.playbackLease, undefined, 'Completion releases the page lease before storage finishes');
  checkEqual(f.page.playbackViewModel.positionUs, 0, 'Completion resets progress before storage finishes');
  checkEqual(f.page.buttonEnabled, true, 'Completion restores controls before storage finishes');
  checkEqual(f.flushCalls, 0, 'Final flush waits for the completion mark');
  await until(() => f.prepares.length === 2); f.prepares[1].resolve();
  await until(() => f.launches.length === 2);
  checkEqual(f.launches[1].uri, 'B', 'Next queue entry starts while completion storage is pending');
  marking.resolve(false); await until(() => f.flushCalls === 1); flushing.resolve(true);
  for (let i = 0; i < 20; i++) { await Promise.resolve(); }
  checkEqual(f.page.selectFilePath, 'B', 'Late final save preserves the new playback path');
  checkEqual(f.page.playbackViewModel.positionUs, 10_000_000, 'Late final save preserves the new progress');
  checkEqual(f.page.buttonEnabled, false, 'Late final save preserves the new controls');
  checkEqual(f.warnings.length, 0, 'Successful final retry needs no warning');

  for (const failure of ['false', 'reject']) {
    const failed = fixture(); await failed.start();
    failed.markCompleted = async () => { if (failure === 'reject') { throw Error('mark failed'); } return false; };
    failed.flush = async () => { if (failure === 'reject') { throw Error('flush failed'); } return false; };
    failed.complete('completed');
    for (let i = 0; i < 30; i++) { await Promise.resolve(); }
    checkEqual(failed.flushCalls, 1, 'Completion failure still gets a final flush');
    checkEqual(failed.warnings.length, failure === 'reject' ? 2 : 1, 'Final failure is handled and logged');
    checkEqual(failed.page.buttonEnabled, true, 'Storage failure does not leave the player busy');
  }
  for (const action of ['leave', 'cleanup-pending']) {
    const closing = fixture(); await closing.start();
    closing.page.pageActive = action !== 'leave';
    closing.complete('completed', action === 'cleanup-pending');
    await until(() => closing.flushCalls === 1);
    checkEqual(closing.history[0].uri, 'A', 'Early cleanup retains the completed source for saving');
    checkEqual(closing.launches.length, 1, 'Early cleanup does not start another media task');
  }

  // Exercise the production history writer when both markCompleted attempts fail.
  const actual = fixture(); let saved = JSON.stringify([
    { uri: 'A', title: 'A', positionUs: 30_000_000, durationUs: 60_000_000, updatedAt: 1 }
  ]); let writes = 0;
  const store = { get: async () => saved, async put(key, value) {
    writes++; if (writes <= 2) { throw Error('temporary put failure'); } saved = value;
  }, flush: async () => {} };
  const { PlaybackHistoryModel } = load('model/PlaybackHistoryModel.ets', {
    '@kit.ArkData': { preferences: { getPreferences: async () => store } },
    '../common/utils/Logger': { default: { warn: (tag, message) => actual.warnings.push(message) } }
  });
  const history = new PlaybackHistoryModel(); await history.load({});
  actual.page.playbackHistory = history; await actual.start(); actual.complete('completed');
  await until(() => JSON.parse(saved)[0].positionUs === 0);
  checkEqual(writes, 3, 'Final completion flush retries after both initial writes fail');
  checkEqual(actual.page.buttonEnabled, true, 'Completion retry leaves player cleanup finished');
}

// Selecting a new source waits for the old completion without assigning its progress to the new URI.
async function testActiveSourceSelection() {
  for (const kind of ['document', 'album', 'recent', 'recording']) {
    const f = fixture(), p = f.page; await f.start();
    const choose = async uri => {
      if (kind === 'document') {
        const selected = p.playbackSources.selectDocument(); f.documents.at(-1).resolve([uri]); await selected;
      } else if (kind === 'album') {
        const selected = p.playbackSources.selectAlbum();
        f.albums.at(-1).resolve({ photoUris: [uri] }); await selected;
      } else if (kind === 'recent') { p.playbackSources.playRecentEntry({ uri }); }
      else { p.playbackSources.playRecording(uri); }
    };
    await choose('B'); await until(() => f.stopCalls === 1);
    checkEqual(p.selectFilePath, 'A', kind + ': old source remains selected until completion');
    checkEqual(p.activePlaybackPath, 'A', kind + ': history stays bound to the active source');
    checkEqual(f.launches.length, 1, kind + ': no second Native task starts before completion');
    await choose('C');
    checkEqual(f.stopCalls, 1, 'A newer selection reuses the in-flight stop');
    await p.persistPlaybackProgress(20_000_000, 60_000_000, true);
    checkEqual(f.history.filter(item => item.position !== undefined).every(item => item.uri === 'A'), true,
      'All old progress is saved under the active URI');
    f.complete(); await until(() => f.prepares.length === 2);
    checkEqual(f.prepares[1].uri, 'C', 'Only the latest selected source is prepared');
    f.prepares[1].resolve(); await until(() => f.launches.length === 2);
    checkEqual(p.activePlaybackPath, 'C', 'Active history URI changes when the new Native task launches');
    checkEqual(f.resumeQueries.at(-1).uri, 'C', 'New source selection still consults resume settings');
    checkEqual(f.resumeQueries.at(-1).enabled, false, 'Resume remains disabled by default');
    checkEqual(f.prepares.length, 2, 'Superseded selection never starts');
  }
  const bound = fixture(); await bound.start(); bound.page.selectFilePath = 'B';
  await bound.page.persistPlaybackProgress(20_000_000, 60_000_000, true);
  checkEqual(bound.history.at(-1).uri, 'A', 'History uses the active URI even if selection changes');
  const cleared = fixture(); await cleared.start();
  cleared.page.playbackSources.playRecentEntry({ uri: 'B' }); await until(() => cleared.stopCalls === 1);
  cleared.page.playbackSources.clearQueue(); cleared.complete();
  for (let i = 0; i < 20; i++) { await Promise.resolve(); }
  checkEqual(cleared.prepares.length, 1, 'Clearing the queue cancels a pending source switch');
  const late = fixture(), wait = deferred(); await late.start(); late.seekIdle = () => wait.promise;
  const stopping = late.page.stopPlayback(); late.complete('completed');
  late.page.selectFilePath = 'B'; await late.start(); wait.resolve(); await stopping;
  checkEqual(late.stopCalls, 0, 'An old stop cannot stop a newer playback after waiting for Seek');
  checkEqual(late.nativeState, late.states.PLAYING, 'New playback remains active');
  const enabled = fixture(); await enabled.start(); enabled.page.playerSettings.resumeLastPosition = true;
  enabled.page.playbackSources.playRecentEntry({ uri: 'B' }); await until(() => enabled.stopCalls === 1);
  enabled.complete(); await until(() => enabled.prepares.length === 2); enabled.prepares[1].resolve();
  await until(() => enabled.launches.length === 2);
  checkEqual(enabled.resumeQueries.at(-1).enabled, true, 'Source switch respects the enabled resume setting');
}

// Natural completion is independent of the page timer and of initial history readability.
async function testCompletionBeforeProgressRefresh() {
  for (const duration of [0, 60_000_000]) {
    for (const hint of [0, 60_000_000]) {
      const f = fixture(); await f.start();
      f.page.playbackViewModel.durationUs = duration; f.completedInfo.durationUs = hint;
      f.complete('completed'); await until(() => f.flushCalls === 1);
      checkEqual(f.history.filter(item => item.completed).length, 1, 'Completion always marks history');
      checkEqual(f.history[0].durationUs, duration > 0 ? duration : hint, 'Missing duration uses completed snapshot');
    }
  }
  let saved = JSON.stringify([{ uri: 'A', title: 'A', positionUs: 30, durationUs: 100, updatedAt: 1 }]);
  let reads = 0;
  const f = fixture();
  const { PlaybackHistoryModel } = load('model/PlaybackHistoryModel.ets', {
    '@kit.ArkData': { preferences: { getPreferences: async () => ({ get: async () => {
      if (++reads === 1) { throw Error('first read fails'); } return saved;
    }, put: async (key, value) => { saved = value; }, flush: async () => {} }) } },
    '../common/utils/Logger': { default: { warn: (tag, message) => f.warnings.push(message) } }
  });
  const history = new PlaybackHistoryModel(); await history.load({});
  f.page.playbackHistory = history; await f.start();
  f.page.playbackViewModel.durationUs = 0; f.completedInfo.durationUs = 0; f.complete('completed');
  await until(() => JSON.parse(saved)[0].positionUs === 0);
  checkEqual(reads, 2, 'Final completion flush retries the failed initial read');
  checkEqual(JSON.parse(saved)[0].positionUs, 0, 'Recovered history retains the completion mark');
  const short = fixture(); let shortSaved = '[]';
  const shortStore = { get: async () => shortSaved,
    put: async (key, value) => { shortSaved = value; }, flush: async () => {} };
  const shortModule = load('model/PlaybackHistoryModel.ets', {
    '@kit.ArkData': { preferences: { getPreferences: async () => shortStore } },
    '../common/utils/Logger': { default: { warn: (tag, message) => short.warnings.push(message) } }
  });
  const shortHistory = new shortModule.PlaybackHistoryModel(); await shortHistory.load({});
  short.page.playbackHistory = shortHistory; await short.start();
  short.page.playbackViewModel.durationUs = 0; short.completedInfo.durationUs = 100_000;
  short.complete('completed'); await until(() => JSON.parse(shortSaved).length === 1);
  checkEqual(JSON.parse(shortSaved)[0].durationUs, 100_000, 'Native snapshot supplies short-media duration');
  checkEqual(JSON.parse(shortSaved)[0].positionUs, 0, 'Short media completed before refresh has a history record');
}

async function testUnconfirmedInputClosure() {
  for (const reason of ['completed', 'stopped', 'error']) {
    for (const active of [false, true]) {
      const f = fixture(), p = f.page; await f.start();
      let retryCalls = 0; p.autoRecoveryEnabled = true;
      p.recovery.takeRetry = () => { retryCalls++; return { positionUs: 1 }; };
      p.playbackQueue.next = () => 1; p.playbackQueue.pendingIndex = 1; p.pageActive = active;
      const revision = p.playbackContinuationRevision;
      f.complete(reason, true);
      for (let i = 0; i < 20; i++) await Promise.resolve();
      assert.equal(p.playbackLease, undefined); assert.equal(p.buttonEnabled, true);
      assert.equal(p.isStopping, false); assert.equal(p.playbackViewModel.positionUs, 0);
      assert.equal(p.playbackQueue.pendingIndex, -1); assert.equal(p.playbackQueue.index, 0);
      assert.equal(p.playbackContinuationRevision, revision + 1);
      assert.equal(f.prepares.length, 1); assert.equal(f.launches.length, 1);
      assert.equal(retryCalls, 0, 'Unconfirmed closure blocks automatic error recovery');
      assert.equal(f.sessionStops, 1); assert.equal(f.toasts.length, active ? 1 : 0);
      if (active) assert.equal(f.toasts[0].message, 'app.string.playback_close_unconfirmed');
    }
  }
  const waiting = fixture(), gate = deferred(), entered = deferred(); await waiting.start();
  waiting.seekIdle = () => { entered.resolve(); return gate.promise; };
  const pending = waiting.page.continuePlayback(waiting.page.playbackSession, 'B', 0);
  await entered.promise; waiting.complete('completed', true); gate.resolve(); await pending;
  assert.equal(waiting.page.selectFilePath, 'A', 'An already waiting continuation is invalidated');
  assert.equal(waiting.launches.length, 1);
  const rejected = fixture(); rejected.launchError = 'close_unconfirmed'; await rejected.start();
  assert.equal(rejected.toasts.length, 1);
  assert.equal(rejected.toasts[0].message, 'app.string.playback_close_unconfirmed');
  assert.equal(rejected.page.buttonEnabled, true); assert.equal(rejected.launches.length, 0);
  console.info('Playback page: unconfirmed close blocks queue continuation and error retry, restores controls and prompts restart');
}

const completionGuard = setTimeout(() => { console.error('Playback page lifecycle tests did not finish'); process.exit(1); }, 30_000);
(async () => {
  await testStartupCancellation(); await testQueueContinuations(); await testCompletionAndStop();
  await testUnconfirmedInputClosure();
  await testCompletionHistoryFinalization();
  await testQueueSelectionWhileStopping();
  await testLateResumeFeedback();
  await testLateSubtitleFeedback();
  await testAppendDuringQueueContinuation();
  await testActiveSourceSelection();
  await testCompletionBeforeProgressRefresh();
})()
  .catch(error => { console.error(error); process.exitCode = 1; }).finally(() => clearTimeout(completionGuard));
