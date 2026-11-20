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
const { fixture: createCoreFixture, deferred, until, load, states, settle } = require('./PlaybackFlowFixture.cjs');
const { flowEvents } = require('./PlaybackFlowFixture.cjs');
const sourceRoot = path.resolve(__dirname, '../../../entry/src/main/ets');
const pageSource = fs.readFileSync(path.join(sourceRoot, 'pages/Index.ets'), 'utf8');
const newline = String.fromCharCode(10);
const noOp = () => {};
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
// Only the page adapter and page-specific subtitle/lifecycle hooks need an ArkUI fixture.
const methods = ['aboutToDisappear', 'cancelRecordingStartup', 'selectSubtitleFile',
  'refreshPlaybackHistory', 'createPlaybackFlowHost', 'getPlaybackFlowOptions',
  'handlePlaybackFlowEvent', 'preparePlaybackView',
  'initializePlaybackView', 'showStartedPlayback', 'clearFinishedPlayback', 'showPlaybackStartFailure',
  'showPlaybackFlowNotice', 'getPlaybackFlowMessage', 'createPlaybackControlHost', 'handlePlaybackControlEvent',
  'showPlaybackPauseResult', 'updateSeekStatistics', 'requestSeek', 'setPlaybackSpeed', 'togglePlaybackPause',
  'stepFrame', 'togglePictureInPicture', 'toggleBackgroundPlayback', 'handleSessionPlay', 'handleSessionPause'
].map(pageMethod).join(newline);
const compiledPage = ts.transpileModule('class PlaybackPageFixture {' + newline + methods +
  newline + '} module.exports = PlaybackPageFixture;', {
  compilerOptions: { target: ts.ScriptTarget.ES2020, module: ts.ModuleKind.CommonJS }, reportDiagnostics: true
});
assert.equal(compiledPage.diagnostics.length, 0);

function createView(f, page) {
  Object.assign(page, { pageActive: true, selectFilePath: 'A',
    recordingRequestRevision: 0, recorderLaunch: { cancel: noOp }, subtitleSourcePath: '', configurationController: {},
    playerSettings: { audioVolume: 100, resumeLastPosition: false }, autoRecoveryEnabled: false,
    sliderDragging: false, thermalWarningActive: false,
    seekRequests: { isBusy: () => false, resetStatistics: noOp, cancel: noOp, waitForIdle: () => f.seekIdle() },
    playbackSessionController: { updateState: noOp, stop() { f.sessionStops++; return f.sessionStop(); } },
    playbackViewModel: { positionUs: 10_000_000, durationUs: 60_000_000, state: states.PLAYING,
      speed: 1, setSeekPosition(positionUs) { this.positionUs = positionUs; },
      update() { this.state = f.nativeState; },
      recoveryAttemptCount: 0, clearRecoveryDiagnostics() { this.recoveryAttemptCount = 0; },
      markRecoveryPending() { this.recoveryAttemptCount++; }, markRecoveryFailed() {}, markRecoverySucceeded() {} },

    updatePlaybackInfo() { f.updateCalls++; },
    updateMediaInfo() { page.currentMediaInfo = { durationUs: 60_000_000 }; },
    resetPlaybackProgress() { page.playbackViewModel.positionUs = 0; page.playbackViewModel.durationUs = 0; },
    showControlToast: message => f.toasts.push({ message }), clearSubtitle: noOp, resetAbLoop: noOp,
    showPlaybackControls: noOp, capturePlaybackFailure: noOp,
    startPlaybackInfoUpdates() {
      Object.assign(page.playbackViewModel, { positionUs: 10_000_000, durationUs: 60_000_000, state: states.PLAYING });
    }, stopPlaybackInfoUpdates: noOp, startPlaybackSession: noOp, stopPictureInPicture: noOp,
    clearPlaybackControlsTimer: noOp, isPictureInPictureHoldingPlayback: () => false, transcodeModel: { dispose: noOp },
    getUIContext: () => ({ getHostContext: () => ({}),
      getPromptAction: () => ({ showToast: toast => f.toasts.push(toast) }) })
  });
}
function attachSources(f, page, logger, timers) {
  page.playbackQueue = f.queue; page.queueEntries = f.queue.paths.slice();
  const { PlaybackSourceController } = load('controller/PlaybackSourceController.ets', {
    '@kit.CoreFileKit': { picker: { DocumentSelectOptions: class {},
      DocumentViewPicker: class { select() {
        const gate = deferred(); f.documents.push(gate); return gate.promise;
      } } } },
    '@kit.MediaLibraryKit': { photoAccessHelper: { PhotoViewMIMETypes: { VIDEO_TYPE: 'video' },
      PhotoViewPicker: class { select() { const gate = deferred(); f.albums.push(gate); return gate.promise; } } } },
    '../common/LocalizedText': { LocalizedText: { get: key => key } },
    '../common/utils/Logger': { default: logger }, '../common/utils/MediaUtils': {},
    './PlaybackUriAccessController': { PlaybackUriAccessController: { persistDocumentUri: async () => true } }
  }, { $r: key => key, ...timers });
  const history = page.playbackHistory;
  page.playbackSources = new PlaybackSourceController(() => ({}), page.playbackQueue, history, {
    activatePlayer: noOp, closeQueue: noOp, isPageActive: () => page.pageActive,
    isButtonEnabled: () => page.playbackFlowState.buttonEnabled, isStopping: () => page.playbackFlowState.isStopping,
    setPath: uri => { page.selectFilePath = uri; }, getPath: () => page.selectFilePath,
    setQueueEntries: entries => { page.queueEntries = entries; }, setRecentEntries: noOp, showNoMediaSelected: noOp,
    play: position => { f.sourcePlay = page.playbackFlow.play(position); },
    stop: () => { f.sourceStop = page.playbackFlow.stop(); }
  });
}
function fixture() {
  let page;
  const f = createCoreFixture(core => {
    const module = { exports: {} };
    vm.runInNewContext(compiledPage.outputText, { module, player: { PlayerState: states,
      isSmartFluencyAvailable: () => false, getMediaInfo: () => ({ video: { frameRate: 25 } }) },
      ...flowEvents, PiPWindow: { isPiPEnabled: () => true }, Logger: core.logger, TAG: 'PlaybackPageTest',
      PlaybackRecoveryReason: { RUNTIME_ERROR: 1 }, $r: key => key, Const: { DURATION: 1, BOTTOM: 1 } });
    page = new module.exports(); core.toasts = []; core.updateCalls = 0;
    createView(core, page);
    page.playbackFlowState = core.state; page.playbackQueue = core.queue; page.playbackMode = 0;
    page.playbackHistory = core.historyModel; page.seekRequests = core.seeks;
    page.playbackSessionController = core.session;
    core.onHistoryChanged = () => page.refreshPlaybackHistory();
    return page.createPlaybackFlowHost();
  });
  const { PlaybackCommandController } = load('controller/PlaybackCommandController.ets', {
    '../common/utils/Logger': { default: f.logger }
  });
  f.seeks.request = positionUs => f.seekTo(positionUs);
  page.playbackFlowState = f.state;
  page.playbackCommands = new PlaybackCommandController(f.flow.commandState, f.seeks,
    page.createPlaybackControlHost(), f.runtime);
  page.playbackFlow = f.flow; f.page = page; f.documents = []; f.albums = [];
  const timers = { setTimeout: f.runtime.schedule, clearTimeout: f.runtime.cancelTimer };
  attachSources(f, page, f.logger, timers);
  page.stopPlayback = () => f.flow.stop();
  page.persistPlaybackProgress = (...args) => f.flow.persistProgress(...args);
  return f;
}
module.exports = { fixture, deferred, until, load, states, settle };
