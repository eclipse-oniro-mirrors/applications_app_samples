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

function pageMethod(name, source = pageSource) {
  const prefixes = ['  ', '  private ', '  async ', '  private async '].map(prefix => prefix + name + '(');
  const line = source.split(newline).find(item => prefixes.some(prefix => item.startsWith(prefix)));
  assert(line, 'Missing page method: ' + name);
  const start = source.indexOf(line);
  const scanner = ts.createScanner(ts.ScriptTarget.Latest, true, ts.LanguageVariant.Standard, source);
  scanner.setTextPos(start);
  let depth = 0, opened = false;
  for (let token = scanner.scan(); token !== ts.SyntaxKind.EndOfFileToken; token = scanner.scan()) {
    if (token === ts.SyntaxKind.OpenBraceToken) { depth++; opened = true; }
    if (token === ts.SyntaxKind.CloseBraceToken && --depth === 0 && opened) {
      return source.slice(start, scanner.getTextPos());
    }
  }
  throw Error('Unterminated page method: ' + name);
}
function compile(source) {
  const result = ts.transpileModule(source, {
    compilerOptions: { target: ts.ScriptTarget.ES2020, module: ts.ModuleKind.CommonJS }, reportDiagnostics: true
  });
  assert.equal(result.diagnostics.length, 0);
  return result.outputText;
}
const methods = ['cancelRecordingStartup', 'dismissRecordingSheet', 'isRecordingRequestCurrent', 'prepareRecording',
  'checkIsProfileSupport', 'saveRecorderOutput', 'onPageHide', 'onPageShow', 'aboutToDisappear']
  .map(name => pageMethod(name));
const compiledPage = compile('class RecordingPageFixture {' + newline + methods.join(newline) +
  newline + '} module.exports = RecordingPageFixture;');
function load(relative, mocks) {
  const file = path.join(sourceRoot, relative), module = { exports: {} };
  vm.runInNewContext(compile(fs.readFileSync(file, 'utf8')), { module, exports: module.exports,
    $r: key => key, require(name) { assert(mocks[name], name); return mocks[name]; } }, { filename: file });
  return module.exports;
}
function deferred() {
  let resolve, reject;
  const promise = new Promise((yes, no) => { resolve = yes; reject = no; });
  return { promise, resolve, reject };
}
function fixture() {
  const f = { events: [], permissions: [], checks: [], pending: new Set(), active: false,
    retainNative: false, fail: '', onRoute: () => {}, hold: undefined, context: {}, pictureInPicture: false };
  const logger = { error() {}, warn() {} };
  const { MediaTaskCoordinator } = load('model/MediaTaskCoordinator.ets', {});
  const { MediaFileActivity } = load('model/MediaFileActivity.ets', {
    './MediaTaskCoordinator': { MediaTaskCoordinator }
  });
  async function checkpoint(stage, value) {
    f.events.push({ stage, value });
    if (f.hold?.stage === stage) {
      const gate = f.hold; f.hold = undefined; gate.entered.resolve(); await gate.release.promise;
    }
    if (f.fail === stage) { f.fail = ''; throw Error('injected ' + stage); }
  }
  const { RecordingFileCloser } = load('controller/RecordingFileCloser.ets', {
    '@kit.CoreFileKit': { fileIo: { close: fd => checkpoint('close', fd) } },
    '../common/utils/Logger': { default: logger }
  });
  const { RecorderLaunchController } = load('controller/RecorderLaunchController.ets', {
    './RecordingFileCloser': { RecordingFileCloser },
    '../common/LocalizedText': { LocalizedText: { get: key => key } },
    '@kit.CoreFileKit': { fileIo: { close: fd => checkpoint('close', fd) } },
    'librecorder.so': { default: { getDiagnostics: () => ({ active: f.active }), async stopEndNative() {
      await checkpoint('stop'); if (!f.retainNative) { f.active = false; }
    } } },
    '../model/CameraDataModel': {},
    './RecorderOutputController': { RecorderOutputController: { async open(context, data) {
      await checkpoint('open');
      data.outputfd = 11; data.secondaryOutputfd = 12; f.active = true;
      await checkpoint('init');
    } } },
    '../common/utils/Logger': { default: logger },
    '@kit.BasicServicesKit': { deviceInfo: { sdkApiVersion: 26 } },
    '../model/ConfigurationFeedback': { ConfigurationFeedback: { recordingConstraint: () => '' } },
    '../model/MediaFileActivity': { MediaFileActivity }, '../model/MediaTaskCoordinator': { MediaTaskCoordinator },
    '../model/MediaSessionStore': { MediaSessionStore: {
      async begin(context, lease) { f.pending.add(lease.id); await checkpoint('begin', lease.id); },
      async finish(context, id) { await checkpoint('finish', id); f.pending.delete(id); }
    } }
  });
  const controller = new RecorderLaunchController();
  const ui = { getHostContext: () => f.context, getPromptAction: () => ({
    showToast: value => f.events.push({ stage: 'toast', value })
  }), getRouter: () => ({ async pushUrl(value) { f.onRoute(); await checkpoint('route', value); } }) };
  const module = { exports: {} };
  const noOp = () => {};
  vm.runInNewContext(compiledPage, { module, MediaFileActivity, Logger: logger, TAG: 'RecordingPageTest',
    $r: key => key, Const: { DURATION: 1, BOTTOM: 1 }, AppStorage: { get: () => '', delete: noOp },
    requestRecordPermissions(context, audio) {
      const gate = deferred(); f.permissions.push({ ...gate, audio }); return gate.promise;
    }, RecorderCapabilityController: { check() {
      const gate = deferred(); f.checks.push(gate); return gate.promise;
    } }, player: { PlayerState: { IDLE: 0, PLAYING: 3, PAUSED: 6 } }, clearTimeout: noOp });
  const page = new module.exports();
  Object.assign(page, { pageActive: true, recordingPageVisible: true, recordingRequestRevision: 0,
    isPreparingRecording: false, isSavingRecording: false, isShow: false, configurationController: {},
    cameraData: { recordAudio: true, outputfd: -1, secondaryOutputfd: -1 }, recordingHistoryRevision: 0,
    getUIContext: () => ui, recorderLaunch: controller,
    isPictureInPictureHoldingPlayback: () => f.pictureInPicture, persistPlaybackProgress: async () => {},
    stopPictureInPicture: async () => {},
    playbackFlow: { leave: noOp }, playbackSources: { cancelSelection: noOp }, transcodeModel: { dispose: noOp },
    seekRequests: { cancel: noOp }, playbackSessionController: { stop: async () => {} }, stopPlayback: async () => {},
    clearPlaybackControlsTimer: noOp, stopPlaybackInfoUpdates: noOp, resetPlaybackProgress: noOp,
    clearSubtitle: noOp, resetAbLoop: noOp, playbackViewModel: { state: 0, positionUs: 0, durationUs: 0 } });
  return Object.assign(f, { page, controller, ui, coordinator: MediaTaskCoordinator, activity: MediaFileActivity,
    block(stage) { const gate = { stage, entered: deferred(), release: deferred() }; f.hold = gate; return gate; },
    count: stage => f.events.filter(event => event.stage === stage).length,
    show() { page.pageActive = true; page.onPageShow(); },
    async authorize() { const task = page.prepareRecording(); f.permissions.at(-1).resolve(true); await task; },
    async save() { const task = page.saveRecorderOutput(); f.checks.at(-1).resolve('supported'); await task; }
  });
}
async function testPermissions() {
  for (const hook of ['onPageHide', 'aboutToDisappear']) {
    for (const granted of [true, false]) {
      for (const reenter of [true, false]) {
        const f = fixture(), p = f.page;
        const old = p.prepareRecording(); await p.prepareRecording();
        assert.equal(f.permissions.length, 1, 'Repeated starts share the pending authorization');
        p[hook]();
        if (reenter) { f.show(); await p.prepareRecording(); }
        assert.equal(f.permissions.length, 1, 'Returning does not start a second authorization concurrently');
        f.permissions[0].resolve(granted); await old;
        assert.equal(p.isShow, false, 'Old authorization cannot open the sheet');
        assert.equal(f.count('toast'), 0, 'Old denial cannot display a prompt');
        assert.equal(p.isPreparingRecording, false, 'Settled authorization releases the request guard');
        if (reenter) {
          const current = p.prepareRecording(); f.permissions[1].resolve(true); await current;
          assert.equal(p.isShow, true);
        }
      }
    }
  }
  const denied = fixture(), request = denied.page.prepareRecording();
  denied.permissions[0].resolve(false); await request;
  assert.equal(denied.count('toast'), 1, 'Current denial still explains the missing permission');
  await denied.authorize();
  assert.equal(denied.page.isShow, true);
  await denied.page.prepareRecording();
  assert.equal(denied.permissions.length, 2, 'An open sheet cannot start another authorization');
  const pip = fixture(); pip.pictureInPicture = true;
  const pending = pip.page.prepareRecording(); pip.page.aboutToDisappear();
  pip.permissions[0].resolve(true); await pending;
  assert.equal(pip.page.isShow, false, 'PiP retention does not retain recording authorization');
  console.info('Recording page: permission deduplication, stale grant/denial, page re-entry and PiP cancellation passed');
}
function assertReleased(f) {
  assert.equal(f.coordinator.busy(), false, 'Cancelled startup releases its lease');
  assert.equal(f.pending.size, 0, 'Cancelled startup removes its pending record');
  assert.equal(f.page.cameraData.outputfd, -1);
  assert.equal(f.page.cameraData.secondaryOutputfd, -1);
  assert.equal(f.controller.launching, false);
  assert.equal(f.activity.beginCleanup(), true, 'The launch gate reopens after cleanup');
  f.activity.endCleanup();
}
async function testSaveCancellation() {
  for (const reject of [false, true]) {
    const f = fixture(); await f.authorize();
    const task = f.page.saveRecorderOutput(); await f.page.saveRecorderOutput();
    assert.equal(f.checks.length, 1, 'Repeated saves do not start more capability queries');
    f.page.onPageHide(); f.show();
    await f.page.saveRecorderOutput();
    assert.equal(f.checks.length, 1, 'An in-flight save cannot be duplicated after re-entry');
    if (reject) { f.checks[0].reject(Error('late capability failure')); } else { f.checks[0].resolve('supported'); }
    await task;
    assert.equal(f.count('begin'), 0); assert.equal(f.count('toast'), 0);
  }
  for (const stage of ['begin', 'open', 'init']) {
    for (const reject of [false, true]) {
      const f = fixture(); await f.authorize(); const gate = f.block(stage);
      const task = f.page.saveRecorderOutput(); f.checks[0].resolve('supported'); await gate.entered.promise;
      f.page.onPageHide(); f.show();
      await f.page.saveRecorderOutput();
      assert.equal(f.count('begin'), 1, 'A repeated request cannot bypass active initialization');
      assert.equal(f.coordinator.busy(), true, 'Cancellation waits for outstanding initialization');
      assert.equal(f.count('close'), 0, 'Descriptors stay open while Native may still use them');
      if (reject) { f.fail = stage; }
      gate.release.resolve(); await task;
      assert.equal(f.count('route'), 0, stage + '/cancelled startup does not navigate');
      assert.equal(f.count('toast'), 1, 'Only the current capability result was shown');
      const initialized = stage === 'init' || (stage === 'open' && !reject);
      assert.equal(f.count('stop'), initialized ? 1 : 0);
      assert.equal(f.count('close'), initialized ? 2 : 0);
      if (initialized) {
        assert(f.events.findIndex(event => event.stage === 'stop') < f.events.findIndex(event => event.stage === 'close'),
          'Native shutdown precedes descriptor closure');
      }
      assertReleased(f);
      await f.authorize(); await f.save();
      assert.equal(f.count('route'), 1, 'A new request works after cancelled cleanup');
    }
  }
  const kept = fixture(); await kept.authorize(); const gate = kept.block('init');
  const saving = kept.page.saveRecorderOutput(); kept.checks[0].resolve('supported'); await gate.entered.promise;
  kept.retainNative = true; kept.fail = 'stop'; kept.page.onPageHide(); gate.release.resolve(); await saving;
  assert.equal(kept.count('close'), 0, 'Failed Native shutdown keeps descriptors alive');
  assert.equal(kept.coordinator.busy(), true, 'Unreleased Native retains its lease');
  assert.equal(kept.pending.size, 1);
  console.info('Recording startup: capability cancellation, delayed initialization, stop-before-close, lease cleanup and retry passed');
}
async function testHandoff() {
  const normal = fixture(); await normal.authorize();
  const gate = normal.block('route'); normal.onRoute = () => normal.page.onPageHide();
  const task = normal.page.saveRecorderOutput(); normal.checks[0].resolve('supported'); await gate.entered.promise;
  gate.release.resolve(); await task;
  assert.equal(normal.count('route'), 1); assert.equal(normal.count('stop'), 0); assert.equal(normal.count('close'), 0);
  assert.equal(normal.coordinator.busy(), true, 'Successful routing transfers resources to the recording page');
  assert.equal(normal.pending.size, 1); assert.equal(normal.page.isShow, false);
  const failed = fixture(); await failed.authorize(); failed.fail = 'route';
  failed.onRoute = () => failed.page.onPageHide(); await failed.save();
  assert.equal(failed.count('stop'), 1); assert.equal(failed.count('close'), 2); assertReleased(failed);
  const current = fixture(); current.fail = 'init'; await current.authorize(); await current.save();
  assert.equal(current.count('toast'), 2, 'Current startup failures still display an error'); assertReleased(current);
  const segment = fixture();
  assert.equal(await segment.controller.launch(segment.ui, segment.page.cameraData, false), true);
  assert.equal(segment.count('route'), 0); assert.equal(segment.count('stop'), 0);
  assert.equal(segment.coordinator.busy(), true, 'Segment initialization still transfers resources without routing');
  console.info('Recording startup: close rejection retains descriptor, lease and pending journal');
  const closeFailed = fixture(); await closeFailed.authorize(); closeFailed.fail = 'route';
  closeFailed.onRoute = () => { closeFailed.fail = 'close'; throw Error('route failed'); };
  await closeFailed.save();
  assert.equal(closeFailed.page.cameraData.outputfd, 11);
  assert.equal(closeFailed.page.cameraData.secondaryOutputfd, -1);
  assert.equal(closeFailed.coordinator.busy(), true);
  assert.equal(closeFailed.coordinator.currentPhase(), 'cancelling');
  assert.equal(closeFailed.pending.size, 1);
  assert.equal(closeFailed.count('finish'), 0);
  console.info('Recording startup: route success/failure, page-hide handoff, current errors and segment initialization passed');
}
async function testSheetDismissal() {
  for (const reason of [0, 1, 2, 3]) {
    for (const stage of ['capability', 'begin', 'init']) {
      const f = fixture(); await f.authorize();
      const gate = stage === 'capability' ? undefined : f.block(stage);
      const task = f.page.saveRecorderOutput();
      if (gate) { f.checks[0].resolve('supported'); await gate.entered.promise; }
      let dismissed = 0;
      f.page.dismissRecordingSheet({ reason, dismiss() { dismissed++; } });
      assert.equal(dismissed, 1, 'Interactive dismissal is acknowledged once');
      assert.equal(f.page.isShow, false, 'Dismissal closes the save sheet');
      assert.equal(f.page.isSavingRecording, true, 'Initialization retains its guard until settled');
      if (gate) { gate.release.resolve(); } else { f.checks[0].resolve('supported'); }
      await task;
      assert.equal(f.count('route'), 0, 'Dismissal during ' + stage + ' cancels navigation');
      assert.equal(f.count('stop'), stage === 'init' ? 1 : 0);
      assert.equal(f.count('close'), stage === 'init' ? 2 : 0);
      assertReleased(f);
      await f.authorize(); await f.save();
      assert.equal(f.count('route'), 1, 'A new recording can start after sheet cancellation');
    }
  }
  const rejected = fixture(); await rejected.authorize();
  const task = rejected.page.saveRecorderOutput();
  rejected.page.dismissRecordingSheet({ reason: 0, dismiss() {} });
  rejected.checks[0].reject(Error('late capability error')); await task;
  assert.equal(rejected.count('toast'), 0, 'Dismissed requests do not display stale capability errors');
  console.info('Recording sheet: interactive dismissal cancels capability/init waits, releases resources and allows retry passed');
}

function cameraFixture() {
  const events = [], opening = deferred();
  const profile = { size: { width: 1280, height: 720 }, frameRateRange: { min: 30, max: 30 } };
  const output = { release: async () => events.push('output.release'), off() {} };
  const preview = { release: async () => events.push('preview.release') };
  const input = { async open() { events.push('input.open'); await opening.promise; },
    close: async () => events.push('input.close') };
  const manager = {
    getSupportedCameras: () => [{}], getSupportedSceneModes: () => [0],
    createVideoOutput() { events.push('output.create'); return output; },
    createPreviewOutput() { events.push('preview.create'); return preview; },
    createCameraInput() { events.push('input.create'); return input; },
    createSession() { throw Error('A closing camera cannot create a session'); }
  };
  const { CameraSessionController } = load('controller/CameraSessionController.ets', {
    '@kit.CameraKit': { camera: { SceneMode: { NORMAL_VIDEO: 0 }, getCameraManager() {
      events.push('manager'); return manager;
    } } }, '@kit.ArkGraphics2D': { colorSpaceManager: {} }, '../model/CameraDataModel': {},
    '../common/utils/CameraCheck': { previewProfileCameraCheck: () => profile,
      encoderProfileCameraCheck: () => profile }, '../common/CommonConstants': { CommonConstants: {} },
    '../common/LocalizedText': { LocalizedText: { get: key => key } },
    '../common/utils/Logger': { default: { warn() {} } }
  });
  return { controller: new CameraSessionController(), events, opening,
    ui: { getHostContext: () => ({}) }, data: { bufferInput: false, outputId: 'output' } };
}
async function testClosedCamera() {
  for (const action of ['stop', 'release', 'releasing']) {
    const f = cameraFixture(), c = f.controller;
    let closing;
    if (action === 'stop') { await c.stop(() => {}); }
    else if (action === 'release') { await c.release(); }
    else { closing = c.release(); }
    await assert.rejects(() => c.prepare(f.ui, f.data, 'preview'), /Camera is closing/);
    await closing; await c.release();
    assert.deepEqual(f.events, [], action + ': a late prepare must not touch the camera manager');
    assert.equal(c.input, undefined); assert.equal(c.preview, undefined); assert.equal(c.output, undefined);
  }
  for (const action of ['stop', 'release']) {
    const f = cameraFixture(), c = f.controller;
    const preparing = c.prepare(f.ui, f.data, 'preview');
    const closing = action === 'stop' ? c.stop(() => {}) : c.release();
    await assert.rejects(() => c.prepare(f.ui, f.data, 'late'), /Camera is closing/);
    assert.equal(f.events.includes('input.close'), false, 'Existing preparation settles before cleanup');
    f.opening.resolve(); await preparing; await closing; await c.release();
    assert.equal(f.events.filter(item => item === 'manager').length, 1);
    assert.equal(f.events.filter(item => item === 'input.close').length, 1);
    assert.equal(f.events.filter(item => item === 'preview.release').length, 1);
    assert.equal(f.events.filter(item => item === 'output.release').length, 1);
  }
  console.info('Camera lifecycle: prepare after stop/release and during cleanup touches no new resources passed');
}
async function testLateRecorderLoad() {
  const source = fs.readFileSync(path.join(sourceRoot, 'recorder/pages/Recorder.ets'), 'utf8');
  const methods = ['prepare', 'start'].map(name => pageMethod(name, source)).join(newline);
  const compiled = compile('class RecorderPageFixture {' + newline + methods +
    newline + '} module.exports = RecorderPageFixture;');
  for (const ended of [true, false]) {
    for (const rejected of [true, false]) {
      const gate = deferred(), events = [], module = { exports: {} };
      vm.runInNewContext(compiled, { module, RecordingPhase: { READY: 1 },
        LocalizedText: { get: key => key }, $r: key => key, Logger: { error() {} } });
      const p = new module.exports();
      Object.assign(p, { ending: false, canNavigate: true, phase: 1, data: { bufferInput: true },
        camera: { prepare() { events.push('prepare'); return gate.promise; } },
        session: { phase: 1, ready: () => events.push('ready'), mark: () => events.push('mark') },
        previewController: { getXComponentSurfaceId: () => 'preview' },
        getUIContext: () => ({ getPromptAction: () => ({ showToast: () => events.push('toast') }) }),
        finish: async () => events.push('finish'), beginCapture: async () => events.push('capture') });
      if (ended) { p.ending = true; } else { p.canNavigate = false; }
      await p.prepare(); await p.start();
      assert.deepEqual(events, [], 'Late onLoad/start is ignored after finish or hiding');
      p.ending = false; p.canNavigate = true;
      const preparing = p.prepare();
      if (ended) { p.ending = true; } else { p.canNavigate = false; }
      if (rejected) { gate.reject(Error('late camera failure')); } else { gate.resolve(); }
      await preparing;
      assert.deepEqual(events, ['prepare'], 'Late camera completion does not update or prompt on the old page');
    }
  }
  console.info('Recorder page: late onLoad/start and delayed camera success/failure after exit passed');
}

const completionGuard = setTimeout(() => { console.error('Recording lifecycle tests did not finish'); process.exit(1); }, 30_000);
(async () => {
  await testPermissions(); await testSaveCancellation(); await testHandoff();
  await testSheetDismissal(); await testClosedCamera(); await testLateRecorderLoad();
})()
  .catch(error => { console.error(error); process.exitCode = 1; }).finally(() => clearTimeout(completionGuard));
