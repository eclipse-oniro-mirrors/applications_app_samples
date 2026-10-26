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

// node tests/host/RecorderModels.test.cjs <SDK ets-loader/node_modules/typescript/lib/typescript.js>
// 只验证纯计算和文件接口调用顺序，不代替 ArkUI、文件选择器或真机编码验证。
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const ts = require(path.resolve(process.argv[2]));
const sourceRoot = path.resolve(__dirname, '../../entry/src/main/ets');
const cache = new Map();
let playbackState = 0;
let recordingActive = false;
let destinations = ['file://saved'];
let names = [];
let stats = new Map();
let texts = new Map();
let calls = [];
let copyFails = false;
let compressFails = false;
let onPicker = () => {};
let onUnlink = () => {};
let freeBytes = 1024 * 1024 * 1024;
const preferenceValues = new Map();
let failPreferenceWrite = false;
let failPreferenceOpen = false;
const mocks = {
  '@kit.ArkData': { preferences: {
    getPreferences: async () => {
      if (failPreferenceOpen) { throw new Error('preferences unavailable'); }
      return {
        get: async (key, fallback) => preferenceValues.get(key) ?? fallback,
        put: async (key, value) => {
          if (failPreferenceWrite) { throw new Error('write failed'); }
          preferenceValues.set(key, value.slice());
        },
        flush: async () => {}
      };
    }
  } },
  '@kit.CameraKit': { camera: { CameraFormat: { CAMERA_FORMAT_YUV_420_SP: 1003 } } },
  'libplayer.so': { default: { getState: () => playbackState, PlayerState: { IDLE: 0 } } },
  'librecorder.so': { default: { getDiagnostics: () => ({ active: recordingActive }) } },
  '@kit.CoreFileKit': {
    picker: {
      DocumentSaveOptions: class {},
      DocumentViewPicker: class {
        async save() { onPicker(); return destinations; }
      }
    },
    statfs: { getFreeSize: async () => freeBytes },
    fileIo: {
      OpenMode: { READ_ONLY: 1, WRITE_ONLY: 2, TRUNC: 4 },
      listFile: async () => names,
      stat: async (file) => {
        if (!stats.has(file)) { throw new Error('file removed'); }
        return { size: stats.get(file), mtime: 10, isFile: () => true };
      },
      lstat: async (file) => {
        if (!stats.has(file)) { throw new Error('file removed'); }
        return { size: stats.get(file), mtime: 10, isFile: () => true, isSymbolicLink: () => false };
      },
      readText: async (file) => texts.get(file) || '',
      open: async (file) => { calls.push('open:' + file); return { fd: file }; },
      close: async (file) => { calls.push('close:' + file.fd); },
      unlink: async (file) => { onUnlink(); calls.push('unlink:' + file); },
      copyFile: async () => {
        calls.push('copy');
        if (copyFails) { throw new Error('copy failed'); }
      }
    }
  },
  '@kit.BasicServicesKit': {
    zlib: {
      CompressLevel: { COMPRESS_LEVEL_NO_COMPRESSION: 0 },
      compressFiles: async (files, archive, options) => {
        calls.push('zip:' + files.length + ':' + options.level);
        if (compressFails) { throw new Error('archive failed'); }
      }
    }
  }
};

function load(file) {
  if (cache.has(file)) { return cache.get(file).exports; }
  const module = { exports: {} };
  cache.set(file, module);
  const compiled = ts.transpileModule(fs.readFileSync(file, 'utf8'), {
    fileName: file.replace(/\.ets$/, '.ts'),
    compilerOptions: { module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2020, experimentalDecorators: true }
  });
  vm.runInNewContext(compiled.outputText, {
    module, exports: module.exports, Observed: (target) => target,
    $r: (name) => ({ id: name }),
    require: (name) => {
      if (mocks[name]) { return mocks[name]; }
      if (name === '@kit.LocalizationKit') { return {}; }
      if (name === '@kit.ArkTS') {
        return { util: { TextEncoder: class { encodeInto(text) { return new Uint8Array(Buffer.from(text)); } } } };
      }
      if (name === '@kit.ArkGraphics2D') { return { colorSpaceManager: {} }; }
      if (name === '@kit.MediaKit') { return { media: {} }; }
      if (name === './Logger' || name === './utils/Logger' || name === '../common/utils/Logger') {
        return { default: { error: () => {}, warn: () => {} } };
      }
      if (name.startsWith('.')) { return load(path.resolve(path.dirname(file), name + '.ets')); }
      throw new Error('Unexpected dependency: ' + name);
    }
  }, { filename: file });
  return module.exports;
}

const { LocalizedText } = load(path.join(sourceRoot, 'common/LocalizedText.ets'));
const strings = new Map(JSON.parse(fs.readFileSync(path.join(sourceRoot, '../resources/zh_CN/element/string.json'),
  'utf8')).string.map((entry) => [entry.name, entry.value]));
LocalizedText.bind({ getStringSync: (id, ...args) => {
  const key = id.replace('app.string.', '');
  assert(strings.has(key), 'Missing string resource: ' + key);
  return strings.get(key).replace(/%(\d+)\$s/g, (_, index) => String(args[Number(index) - 1]));
} });

const { RecorderPreprocessModel } = load(path.join(sourceRoot, 'model/RecorderPreprocessModel.ets'));
const { CameraDataModel } = load(path.join(sourceRoot, 'model/CameraDataModel.ets'));
const { DumpFilesModel } = load(path.join(sourceRoot, 'model/DumpFilesModel.ets'));
const { UserConfiguration } = load(path.join(sourceRoot, 'model/UserConfiguration.ets'));
const { ConfigurationStore } = load(path.join(sourceRoot, 'model/ConfigurationStore.ets'));
const { PlayerSettingsModel } = load(path.join(sourceRoot, 'model/PlayerSettingsModel.ets'));
const { PlayerSettingsDraft, RecorderSettingsDraft } = load(path.join(sourceRoot, 'model/SettingsDraftModels.ets'));
const { DumpPolicyModel } = load(path.join(sourceRoot, 'model/DumpPolicyModel.ets'));
const { ConfigurationFeedback } = load(path.join(sourceRoot, 'model/ConfigurationFeedback.ets'));
const { MediaFileActivity } = load(path.join(sourceRoot, 'model/MediaFileActivity.ets'));
const { RecorderLiveDiagnosticsModel } = load(path.join(sourceRoot, 'model/RecorderLiveDiagnosticsModel.ets'));

function testLiveDiagnostics() {
  const timing = { count: 0, averageMs: 0, p95Ms: 0, maximumMs: 0 };
  const stream = {
    frames: 100, bytes: 2000, framesPerSecond: 30, bitrate: 20000000,
    recentFps: 30, recentBitrate: 10000000, expectedFps: 30, targetBitrate: 10000000,
    outputIdleMs: 20, longestGapMs: 50, ptsRegressions: 0,
    keyFrames: 2, lastKeyFramePtsUs: 1000000, keyFrameIntervalMs: 1000, keyFrameRequests: 1,
    keyFrameRequest: 'observed', keyFrameWaitMs: 40, parameterAccepted: 2, parameterRejected: 1,
    queueDepth: 1, queuePeak: 3, queueWait: timing, queueResidence: timing, muxerWrite: timing,
    dumpWrite: timing, bufferHold: timing, fileBytes: -1, freeBytes: -1, fileBytesPerSecond: -1,
    dumpBytes: 0, dumpState: 'disabled', requestedConfiguration: 'requested', codecDescription: 'codec',
    codecWidth: 0, codecHeight: 0, codecFps: 0, codecBitrate: 0
  };
  const detail = RecorderLiveDiagnosticsModel.details(stream, 'Primary');
  assert.match(detail, /近 1 秒: 30.0 fps \/ 10.00 Mbit\/s/);
  assert.match(detail, /全程平均: 30.0 fps \/ 20.00 Mbit\/s/);
  assert.match(detail, /短时码率相对目标偏差: 0.0%/);
  assert.match(detail, /容器文件: 未提供/);
  assert.match(detail, /返回尺寸（非码流解析）: 未提供/);
  assert.match(detail, /请求后检测到关键帧/);
  assert.match(detail, /码流尺寸 \/ HDR：未解析确认/);
  assert.equal(RecorderLiveDiagnosticsModel.warnings(stream, true), '');
  stream.recentFps = 10;
  assert.match(RecorderLiveDiagnosticsModel.warnings(stream, true), /不等同于编码器丢帧/);
  stream.outputIdleMs = 1200;
  stream.freeBytes = 100 * 1048576;
  assert.match(RecorderLiveDiagnosticsModel.warnings(stream, true), /暂未收到新的视频输出/);
  assert.match(RecorderLiveDiagnosticsModel.warnings(stream, true), /存储空间偏低/);
  assert.equal(RecorderLiveDiagnosticsModel.warnings(stream, false), '');
  stream.targetBitrate = 0;
  assert.match(RecorderLiveDiagnosticsModel.details(stream, 'Primary'), /已接受目标: 未提供/);
  const diagnostics = { primary: stream, secondary: stream, failure: { stage: '', code: 0, message: '' } };
  assert.match(RecorderLiveDiagnosticsModel.report(diagnostics, true), /副路/);
  stream.frames = 0;
  assert.doesNotMatch(RecorderLiveDiagnosticsModel.report(diagnostics, false), /副路/);
  console.log('Live recording diagnostics: sources, target comparison, unknowns, warnings, and dual reports passed');
}

async function testConfiguration() {
  const player = new PlayerSettingsModel();
  const camera = new CameraDataModel();
  camera.outputfd = 37;
  player.audioTrackIndex = 8;
  player.videoDecoderRunMode = 1;
  player.enableVideoDump = true;
  camera.enableDualOutput = true;
  camera.cropPercent = 90;
  DumpPolicyModel.maxMiB = 0;
  const snapshot = UserConfiguration.capture(player, camera);
  const restoredPlayer = new PlayerSettingsModel();
  const restoredCamera = new CameraDataModel();
  UserConfiguration.restore(snapshot, restoredPlayer, restoredCamera);
  assert.equal(restoredPlayer.videoDecoderRunMode, 1);
  assert.equal(restoredPlayer.enableVideoDump, true);
  assert.equal(restoredPlayer.audioTrackIndex, -1);
  assert.equal(restoredCamera.outputfd, -1);
  assert.equal(restoredCamera.enableDualOutput, true);
  assert.equal(restoredCamera.cropPercent, 90);
  assert.equal(DumpPolicyModel.maxMiB, 0);
  const bad = { player: [NaN], recorder: [1], dump: [-1, 999] };
  UserConfiguration.restore(bad, restoredPlayer, restoredCamera);
  assert.equal(restoredCamera.cropPercent, 90);
  assert.equal(restoredPlayer.videoDecoderRunMode, 1);
  for (let preset = 0; preset < 4; preset++) {
    const p = new PlayerSettingsModel();
    const r = new CameraDataModel();
    UserConfiguration.restore(UserConfiguration.preset(preset), p, r);
    assert.equal(p.enableVideoDump, false);
    assert.equal(r.enableVideoDump, false);
    assert.equal(p.videoDecoderRunMode, preset === 1 ? 1 : 0);
    assert.equal(r.cameraHeight, preset === 2 ? 720 : 1080);
    assert.equal(r.frameRate, preset === 3 ? 60 : 30);
  }
  const pd = new PlayerSettingsDraft();
  pd.load(player);
  pd.runMode = 0;
  assert.equal(player.videoDecoderRunMode, 1);
  assert.equal(pd.apply(player), true);
  assert.equal(player.enableVideoDump, false);
  const rd = new RecorderSettingsDraft();
  rd.load(camera, true);
  rd.frameRate = 1;
  rd.cropPercent = 50;
  rd.preprocMode = 2;
  rd.dropFrameRate = 1;
  assert.equal(camera.cropPercent, 90);
  assert.equal(rd.toCamera('').frameRate, 60);
  assert.equal(rd.apply(camera), true);
  assert.equal(camera.cropPercent, 50);
  assert.equal(camera.dropToFrameRate, 30);
  assert.match(ConfigurationFeedback.recordingConstraint(camera, 25), /API 26/);
  camera.isSync = 1;
  assert.match(ConfigurationFeedback.recordingConstraint(camera, 26), /异步/);
  failPreferenceOpen = true;
  await assert.rejects(() => ConfigurationStore.open({}));
  failPreferenceOpen = false;
  await ConfigurationStore.open({});
  const pending = ConfigurationStore.save(snapshot);
  snapshot.player[0] = 99;
  await pending;
  assert.notEqual((await ConfigurationStore.load()).player[0], 99);
  await ConfigurationStore.save(UserConfiguration.preset(2), true);
  assert.equal((await ConfigurationStore.load(true)).recorder[4], 720);
  failPreferenceWrite = true;
  await assert.rejects(() => ConfigurationStore.save(UserConfiguration.preset(1)));
  failPreferenceWrite = false;
  await ConfigurationStore.save(UserConfiguration.preset(3));
  assert.equal((await ConfigurationStore.load()).recorder[5], 60);
  const committed = preferenceValues.get('current.snapshot');
  preferenceValues.set('current.snapshot', [1, 999, 0, 0]);
  assert.equal((await ConfigurationStore.load()).player.length, 0);
  preferenceValues.set('current.snapshot', committed);
  assert.equal(preferenceValues.size, 2, 'One stored value is expected per complete configuration');
  console.log('Configuration: round trip, presets, invalid values, draft isolation, write ordering, and retry passed');
}

async function testDumpCleanup() {
  resetIo();
  names = ['recording_123_primary.h265', 'recording_123_primary.h265.session.txt',
    'recording_123_secondary.h265', 'recording_123.mp4', 'VideoDecoderOut_nv12_123.yuv',
    'recording_123_primary.h265.session.txt.pending', '../recording_123_primary.h265'];
  stats = new Map(names.map((name) => ['/files/' + name, 16]));
  recordingActive = true;
  await assert.rejects(() => DumpFilesModel.removeSession('/files', 'recording_123'));
  assert.equal(calls.length, 0);
  recordingActive = false;
  assert.equal(MediaFileActivity.beginLaunch(), true);
  await assert.rejects(() => DumpFilesModel.removeSession('/files', 'recording_123'));
  MediaFileActivity.endLaunch();
  onUnlink = () => { assert.equal(MediaFileActivity.beginLaunch(), false); };
  assert.equal(await DumpFilesModel.removeSession('/files', 'recording_123'), 3);
  onUnlink = () => { throw new Error('unlink failed'); };
  await assert.rejects(() => DumpFilesModel.removeSession('/files', 'recording_123'));
  onUnlink = () => {};
  assert.equal(MediaFileActivity.beginLaunch(), true, 'Failed cleanup must release the startup guard');
  MediaFileActivity.endLaunch();
  assert.equal(calls.filter((call) => call.startsWith('unlink:')).length, 3);
  assert.ok(!calls.some((call) => call.includes('.mp4') || call.includes('.pending') || call.includes('/../')));
  assert.equal(await DumpFilesModel.removeSession('/files', '../recording_123'), 0);
  console.log('Dump cleanup: idle checks, session grouping, sidecars, and unrelated-file protection passed');
}

function testPreprocessing() {
  let cases = 0;
  for (const [width, height] of [[1920, 1080], [3840, 2160], [1280, 720], [1080, 1920], [1919, 1079]]) {
    for (const mode of [0, 1, 2]) {
      for (const percent of [50, 75, 90, 100]) {
        for (const target of [360, 480, 720, 1080, 4320]) {
          const plan = RecorderPreprocessModel.plan(width, height, 60, mode, percent, target, target, 30);
          assert.equal(plan.cropLeft % 2, 0);
          assert.equal(plan.cropTop % 2, 0);
          assert.equal(plan.cropWidth % 2, 0);
          assert.equal(plan.cropHeight % 2, 0);
          assert.ok(plan.cropLeft + plan.cropWidth <= width);
          assert.ok(plan.cropTop + plan.cropHeight <= height);
          assert.ok(plan.primaryWidth <= width && plan.primaryHeight <= height);
          assert.ok(plan.secondaryWidth <= width && plan.secondaryHeight <= height);
          if (mode !== 0) { assert.equal(plan.primaryWidth % 2 + plan.primaryHeight % 2, 0); }
          assert.equal(plan.outputFrameRate, 30);
          cases++;
        }
      }
    }
  }
  const plan = RecorderPreprocessModel.plan(1920, 1080, 30, 2, 75, 720, 720, 60);
  assert.equal([plan.cropLeft, plan.cropTop, plan.cropWidth, plan.cropHeight].join(','), '240,134,1440,810');
  assert.equal(plan.outputFrameRate, 30);
  const data = new CameraDataModel();
  data.preprocMode = 2;
  RecorderPreprocessModel.apply(data);
  assert.equal(data.cropRight - data.cropLeft + 1, 1440);
  assert.equal(data.cropBottom - data.cropTop + 1, 810);
  assert.equal(data.downsamplingWidth, 1280);
  assert.equal(data.downsamplingHeight, 720);
  console.log('Preprocessing: ' + cases + ' combinations and inclusive crop bounds passed');
}

function resetIo() {
  playbackState = 0; recordingActive = false; destinations = ['file://saved'];
  calls = []; copyFails = false; compressFails = false; onPicker = () => {};
  freeBytes = 1024 * 1024 * 1024;
}

async function testDumpGroups() {
  names = ['recording_123_primary.h265', 'recording_123_secondary.h265',
    'recording_123_primary.h265.session.txt', 'recording_124_primary.h264',
    'VideoDecoderOut_nv12_123.yuv', 'VideoDecoderOut_nv12_123.yuv.layout.txt',
    'VideoDecoderOut_nv12_123.yuv.session.txt', 'recording_125_gone.h265',
    'recording_123_primary.h265.session.txt.pending', 'other.mp4'];
  stats = new Map(names.filter((name) => !name.includes('gone')).map((name) => ['/files/' + name, 16]));
  texts.set('/files/recording_123_primary.h265.session.txt', 'state=size_limit\nbytes=16');
  texts.set('/files/VideoDecoderOut_nv12_123.yuv.session.txt', 'state=completed\nbytes=16');
  const groups = await DumpFilesModel.sessions('/files');
  assert.equal(groups.length, 3);
  assert.equal(groups.find((group) => group.id === 'recording_123').files.length, 3);
  assert.equal(groups.find((group) => group.id === 'VideoDecoderOut_nv12_123.yuv').files.length, 3);
  assert.equal(groups.find((group) => group.id === 'recording_123').status, '达到容量限制');
  assert.ok(groups.every((group) => group.files.every((file) => !file.name.endsWith('.pending'))));
  console.log('Dump grouping: primary/secondary, sidecars, replaced files, and unrelated files passed');
}

async function testDumpExports() {
  const context = { filesDir: '/files', cacheDir: '/cache' };
  const entry = { name: 'recording_123_primary.h265', path: '/files/recording_123_primary.h265', bytes: 16 };
  const session = { id: 'recording_123', files: [entry], bytes: 16 };
  resetIo();
  destinations = [];
  assert.equal(await DumpFilesModel.exportSession(context, session), false);
  assert.equal(calls.length, 0);
  resetIo();
  onPicker = () => { recordingActive = true; };
  await assert.rejects(() => DumpFilesModel.exportSession(context, session));
  assert.equal(calls.length, 0);
  resetIo();
  onPicker = () => { playbackState = 1; };
  await assert.rejects(() => DumpFilesModel.exportFile(context, entry));
  assert.equal(calls.length, 0);
  resetIo();
  freeBytes = 128 * 1024 * 1024;
  await assert.rejects(() => DumpFilesModel.exportSession(context, session));
  assert.equal(calls.length, 0);
  resetIo();
  assert.equal(await DumpFilesModel.exportSession(context, session), true);
  assert.ok(calls.includes('zip:1:0'));
  assert.ok(calls.includes('copy'));
  assert.equal(calls.filter((call) => call.startsWith('close:')).length, 2);
  assert.equal(calls.filter((call) => call.startsWith('unlink:/cache/')).length, 1);
  resetIo();
  compressFails = true;
  await assert.rejects(() => DumpFilesModel.exportSession(context, session));
  assert.equal(calls.filter((call) => call.startsWith('unlink:/cache/')).length, 1);
  assert.ok(!calls.some((call) => call.startsWith('open:')));
  resetIo();
  copyFails = true;
  await assert.rejects(() => DumpFilesModel.exportFile(context, entry));
  assert.equal(calls.filter((call) => call.startsWith('close:')).length, 2);
  console.log('Dump export: cancellation, activity recheck, space, ZIP cleanup, and fd cleanup passed');
}

async function testRecordingReports() {
  const { RecordingReportStore } = load(path.join(sourceRoot, 'model/RecordingReportStore.ets'));
  const { RecordingHistoryModel } = load(path.join(sourceRoot, 'model/RecordingHistoryModel.ets'));
  const io = mocks['@kit.CoreFileKit'].fileIo;
  const original = { ...io };
  const files = new Map();
  const context = { filesDir: '/files' };
  let failWrite = false;
  let failureTriggered = false;
  let concurrent = 0;
  let peak = 0;
  const operations = [];
  io.mkdir = async () => {};
  io.access = async (file) => files.has(file);
  io.listFile = async (dir) => [...files.keys()].filter(x => x.startsWith(dir + '/')).map(x => x.slice(dir.length + 1));
  io.open = async (file) => { files.set(file, Buffer.alloc(0)); return { fd: file }; };
  io.close = async () => {};
  io.fsync = async () => {};
  io.write = async (fd, data) => {
    if (failWrite && fd.includes('recording_900_1.json.pending')) {
      failureTriggered = true; throw new Error('disk full');
    }
    concurrent++;
    peak = Math.max(peak, concurrent);
    await Promise.resolve();
    const chunk = Buffer.from(data).subarray(0, 7);
    files.set(fd, Buffer.concat([files.get(fd), chunk]));
    concurrent--;
    return chunk.length;
  };
  io.rename = async (src, dest) => { operations.push('rename:' + dest); files.set(dest, files.get(src)); files.delete(src); };
  io.readText = async (file) => files.get(file).toString();
  io.lstat = async (file) => {
    if (!files.has(file)) { throw new Error('missing'); }
    return { size: files.get(file).length, isFile: () => true, isSymbolicLink: () => false };
  };
  io.unlink = async (file) => { operations.push('unlink:' + file); files.delete(file); };
  const timing = { count: 0, averageMs: 0, p95Ms: 0, maximumMs: 0 };
  const stream = { frames: 0, bytes: 0, framesPerSecond: 0, bitrate: 0, recentFps: 0, recentBitrate: 0,
    expectedFps: 30, targetBitrate: 10000000, outputIdleMs: -1, longestGapMs: 0, ptsRegressions: 0,
    keyFrames: 0, lastKeyFramePtsUs: -1, keyFrameIntervalMs: -1, keyFrameRequests: 0, keyFrameRequest: 'none',
    keyFrameWaitMs: -1, parameterAccepted: 0, parameterRejected: 0, queueDepth: 0, queuePeak: 0,
    queueWait: timing, queueResidence: timing, muxerWrite: timing, dumpWrite: timing, bufferHold: timing,
    fileBytes: -1, freeBytes: -1, fileBytesPerSecond: -1, dumpBytes: 0, dumpState: 'disabled',
    requestedConfiguration: 'requested', codecDescription: 'codec', codecWidth: 0, codecHeight: 0,
    codecFps: 0, codecBitrate: 0 };
  const report = { version: 1, sessionId: 'recording_900_1', recordedAt: 1, durationSeconds: 2,
    title: '本地秘密.mp4', primaryUri: 'file://private-video', secondaryUri: 'file://private-secondary',
    primaryDump: '/private/dump', secondaryDump: '', fileMetadata: '1920 x 1080', text: '中文报告',
    diagnostics: { requestedConfiguration: 'requested', observedConfiguration: 'actual', parameterChanges: '',
      endReason: 'user_stop', failure: { stage: '', code: 0, message: '' }, timeline: [
        { elapsedMs: 0, stage: 'initialize.begin', result: 'ok' }], primary: stream, secondary: stream } };
  assert.equal(RecordingReportStore.validId('../recording_1_1'), false);
  assert.equal(RecordingReportStore.validId('recording_1_1/../other'), false);
  failWrite = true;
  await assert.rejects(() => RecordingReportStore.save(context, report));
  assert.equal(failureTriggered, true);
  assert.equal((await RecordingReportStore.read(context, report.sessionId)).persistenceFailed, true);
  assert.equal(files.has('/files/recording_reports/recording_900_1.json'), false);
  failWrite = false;
  report.persistenceFailed = true;
  await RecordingReportStore.save(context, report);
  assert.equal((await RecordingReportStore.read(context, report.sessionId)).persistenceFailed, false);
  assert.equal(JSON.parse(files.get('/files/recording_reports/recording_900_1.json')).persistenceFailed, false);
  assert.equal(files.get('/files/recording_reports/recording_900_1.txt').toString(), '中文报告');
  const originalId = report.sessionId;
  const firstSave = RecordingReportStore.save(context, report);
  report.sessionId = 'recording_901_1';
  const secondSave = RecordingReportStore.save(context, report);
  await Promise.all([firstSave, secondSave]);
  assert.equal(peak, 1);
  assert.equal(JSON.parse(files.get('/files/recording_reports/' + originalId + '.json')).sessionId, originalId);
  const originalPath = '/files/recording_reports/' + originalId + '.json';
  const originalData = files.get(originalPath);
  const damaged = JSON.parse(originalData);
  delete damaged.diagnostics.primary;
  files.set(originalPath, Buffer.from(JSON.stringify(damaged)));
  await assert.rejects(() => RecordingReportStore.read(context, originalId), /Invalid recording diagnostics/);
  files.set(originalPath, originalData);
  assert.equal((await RecordingReportStore.read(context, originalId)).title, report.title);
  for (let i = 1; i <= 35; i++) {
    const id = 'recording_' + i + '_1';
    files.set('/files/recording_reports/' + id + '.json', Buffer.from(JSON.stringify({ ...report, sessionId: id })));
    files.set('/files/recording_reports/' + id + '.txt', Buffer.from('old'));
  }
  files.set('/files/recording_reports/keep.mp4', Buffer.from('media'));
  files.set('/files/recording_reports/recording_2_1Xjson', Buffer.from('unrelated'));
  await RecordingReportStore.save(context, report);
  assert.equal([...files.keys()].filter(x => /recording_[0-9]+_[0-9]+\.json$/.test(x)).length, 30);
  assert.equal(files.has('/files/recording_reports/keep.mp4'), true);
  assert.equal(files.has('/files/recording_reports/recording_2_1Xjson'), true);
  destinations = ['file://shared-report'];
  onPicker = () => {};
  assert.equal(await RecordingReportStore.export(context, report, true), true);
  const shared = files.get(destinations[0]).toString();
  assert.ok(!shared.includes('file://private') && !shared.includes('/private/dump') && !shared.includes('本地秘密'));
  assert.equal(report.primaryUri, 'file://private-video');
  const history = new RecordingHistoryModel();
  await history.load(context);
  await history.add('', 'failed', '', 10, 0, '', '', 'recording_900_1');
  assert.equal(history.getEntries()[0].sessionId, 'recording_900_1');
  const reopened = new RecordingHistoryModel();
  await reopened.load(context);
  assert.equal(reopened.getEntries()[0].durationSeconds, 0);
  Object.assign(io, original);
  console.log('Recording reports: Unicode/partial writes, atomic JSON, retry, snapshots, redaction, bounded cleanup, and failed-session history passed');
}

function testStorageProtection() {
  const { RecorderDiagnosticsController } = load(path.join(sourceRoot, 'controller/RecorderDiagnosticsController.ets'));
  const controller = new RecorderDiagnosticsController();
  const m = 1048576;
  const diagnostics = { primary: { fileBytes: 0, freeBytes: 1024 * m, dumpBytes: 0 },
    secondary: { fileBytes: 0, freeBytes: 1024 * m, dumpBytes: 0 } };
  assert.equal(controller.estimate(diagnostics, true, false, 1000).remainingSeconds, -1);
  let estimate;
  for (let i = 1; i <= 3; i++) {
    diagnostics.primary.fileBytes = i * m;
    diagnostics.secondary.fileBytes = i * m;
    diagnostics.primary.dumpBytes = i * m;
    estimate = controller.estimate(diagnostics, true, true, (i + 1) * 1000);
  }
  assert.equal(estimate.availableBytes, 1024 * m);
  assert.equal(estimate.bytesPerSecond, 3 * m);
  assert.equal(estimate.remainingSeconds, 256);
  diagnostics.primary.freeBytes = 100 * m;
  assert.equal(controller.estimate(diagnostics, true, false, 5000).shouldStop, false);
  assert.equal(controller.estimate(diagnostics, true, true, 6000).shouldStop, true);
  diagnostics.primary.freeBytes = -1;
  assert.equal(controller.estimate(diagnostics, true, true, 7000).shouldStop, false);
  assert.equal(controller.estimate(diagnostics, true, true, 8000).remainingSeconds, -1);
  const highRate = new RecorderDiagnosticsController();
  diagnostics.primary.freeBytes = 1024 * m;
  diagnostics.primary.fileBytes = 0;
  diagnostics.primary.dumpBytes = 0;
  highRate.estimate(diagnostics, false, true, 1000);
  for (let i = 1; i <= 3; i++) {
    diagnostics.primary.fileBytes = i * 40 * m;
    estimate = highRate.estimate(diagnostics, false, true, (i + 1) * 1000);
  }
  assert.equal(estimate.remainingSeconds, (1024 - 400) / 40, 'Estimate must use the ten-second reserve at high bitrate');
  console.log('Storage protection: warm-up, shared volume, both files/Dump growth, default-off and unknown-space handling passed');
}


async function testRecordingLifecycle() {
  const { RecordingSessionController, RecordingPhase } = load(path.join(sourceRoot, 'controller/RecordingSessionController.ets'));
  const { RecordingReportStore } = load(path.join(sourceRoot, 'model/RecordingReportStore.ets'));
  const api = mocks['librecorder.so'].default;
  const io = mocks['@kit.CoreFileKit'].fileIo;
  const originalApi = { ...api };
  const originalClose = io.close;
  const originalSave = RecordingReportStore.save;
  const originalText = RecordingReportStore.text;
  let stages = [];
  let releaseConfirmed = true;
  let failBegin = false;
  let failSave = false;
  const events = [];
  const stream = { fileBytes: 10, width: 1920, height: 1080, frames: 5, framesPerSecond: 30, bitrate: 1000000 };
  api.getDiagnostics = () => ({ sessionId: 'recording_5000_1', endReason: 'user_stop',
    failure: { stage: '', code: 0, message: '' }, primary: stream, secondary: { ...stream, fileBytes: 0 }, timeline: stages });
  api.markStage = (_id, stage) => { events.push(stage); stages.push({ stage, result: 'ok', elapsedMs: 1 }); };
  api.startNative = () => true;
  api.stopBeginNative = async () => { events.push('stop.begin'); if (failBegin) { throw new Error('queue rejected'); } };
  api.stopEndNative = async () => {
    events.push('stop.end');
    if (releaseConfirmed) { stages.push({ stage: 'native.released', result: 'ok', elapsedMs: 2 }); }
    return { code: releaseConfirmed ? 0 : -1 };
  };
  io.close = async (fd) => { events.push('close:' + fd); };
  RecordingReportStore.text = () => 'report';
  RecordingReportStore.save = async () => { events.push('report.save'); if (failSave) { throw new Error('disk full'); } };
  function data() {
    return { outputfd: 11, secondaryOutputfd: 12, outputTitle: 'video.mp4', outputUri: 'file://primary',
      secondaryOutputUri: 'file://secondary', primaryDumpPath: '', secondaryDumpPath: '' };
  }
  try {
    let unblock;
    const stopping = new Promise(resolve => { unblock = resolve; });
    const cameraStop = async () => { events.push('camera.stop'); await stopping; };
    const cameraRelease = async () => { events.push('camera.release'); };
    const session = new RecordingSessionController();
    session.ready();
    assert.equal(session.start(), true);
    assert.equal(session.start(), false);
    const model = data();
    const first = session.finish({ filesDir: '/files' }, model, cameraStop, cameraRelease);
    const second = session.finish({ filesDir: '/files' }, model, cameraStop, cameraRelease);
    assert.equal(first, second, 'Repeated stop must share one task');
    assert.equal(session.phase, RecordingPhase.FINALIZING);
    assert.equal(session.start(), false);
    assert.equal(events.includes('stop.begin'), false, 'Native EOS cannot start while camera stop is pending');
    unblock();
    const report = await first;
    assert.equal(report.primaryUri, 'file://primary');
    assert.equal(report.secondaryUri, '');
    assert.equal(model.outputfd, -1);
    assert.equal(events.filter(x => x === 'stop.end').length, 1);
    assert.ok(events.indexOf('close:11') > events.indexOf('stop.end'));
    assert.ok(events.indexOf('report.save') > events.indexOf('camera.release'));
    assert.equal(session.phase, RecordingPhase.FINISHED);
    stages = []; events.length = 0; failBegin = true; failSave = true;
    const interrupted = new RecordingSessionController();
    const failedReport = await interrupted.finish({ filesDir: '/files' }, data(), async () => {}, cameraRelease);
    assert.equal(failedReport.persistenceFailed, true);
    assert.ok(events.includes('stop.end') && events.includes('close:11') && events.includes('camera.release'));
    stages = []; events.length = 0; releaseConfirmed = false; failBegin = false; failSave = false;
    const incomplete = new RecordingSessionController();
    const held = data();
    await assert.rejects(() => incomplete.finish({ filesDir: '/files' }, held, async () => {}, cameraRelease),
      /release was not confirmed/);
    assert.equal(events.some(x => x.startsWith('close:')), false, 'Unconfirmed Native ownership must retain descriptors');
    assert.equal(held.outputfd, 11);
    assert.equal(events.includes('camera.release'), true);
  } finally {
    Object.assign(api, originalApi);
    io.close = originalClose;
    RecordingReportStore.save = originalSave;
    RecordingReportStore.text = originalText;
  }
  console.log('Recording lifecycle: idempotent stop, camera-before-EOS, rejected begin, persistence failure, and descriptor ownership passed');
}

async function testCameraLifecycle() {
  const { CameraSessionController } = load(path.join(sourceRoot, 'controller/CameraSessionController.ets'));
  const events = [];
  const createOutput = (listenFails, stopFails) => ({
    start: async () => { events.push('output.start'); },
    on: () => { if (listenFails) { throw new Error('listener unavailable'); } },
    off: () => { throw new Error('listener unavailable'); },
    stop: async () => { events.push('output.stop'); if (stopFails) { throw new Error('stop failed'); } },
    release: async () => { events.push('output.release'); }
  });
  const session = { stop: async () => { events.push('session.stop'); },
    release: async () => { events.push('session.release'); } };
  const controller = new CameraSessionController();
  let unblock;
  controller.preparing = new Promise(resolve => { unblock = resolve; });
  controller.output = createOutput(true, false);
  controller.session = session;
  controller.outputStarted = true;
  const stopping = controller.stop(() => { events.push('frame.end'); });
  await Promise.resolve();
  assert.equal(events.length, 0, 'Stop waits for camera preparation');
  unblock();
  assert.equal(await stopping, false);
  assert.equal(events.includes('output.stop'), true, 'Listener failure must not skip output stop');
  assert.equal(events.includes('frame.end'), false, 'No synthetic camera tail frame');
  const release = controller.release();
  assert.equal(release, controller.release());
  await release;
  assert.equal(events.filter(x => x === 'output.release').length, 1, 'Failed off must not skip output release');
  const starting = new CameraSessionController();
  events.length = 0;
  let started;
  starting.output = createOutput(false, false);
  starting.output.start = () => new Promise(resolve => { started = resolve; });
  starting.session = session;
  const startTask = starting.start();
  const releaseTask = starting.release();
  await Promise.resolve();
  assert.equal(events.length, 0);
  started();
  await Promise.all([startTask, releaseTask]);
  assert.ok(events.indexOf('session.stop') < events.indexOf('output.release'));
  const failure = new CameraSessionController();
  events.length = 0;
  failure.output = createOutput(false, true);
  failure.session = session;
  failure.outputStarted = true;
  await assert.rejects(() => failure.stop(() => {}), /Camera output stop failed/);
  assert.equal(events.includes('session.stop'), true);
  console.log('Camera lifecycle: preparation/start exit races, listener/stop failures, and idempotent release passed');
}

async function main() {
  testLiveDiagnostics();
  await testConfiguration();
  testPreprocessing();
  await testDumpGroups();
  await testDumpExports();
  await testDumpCleanup();
  await testRecordingReports();
  testStorageProtection();
  await testRecordingLifecycle();
  await testCameraLifecycle();
}
main().catch((error) => { console.error(error); process.exitCode = 1; });
