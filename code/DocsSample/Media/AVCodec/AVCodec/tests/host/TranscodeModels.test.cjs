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

// Host mocks check control flow, not ArkUI, codecs or provider URI behavior.
const assert = require('node:assert/strict');
const fs = require('node:fs');
const path = require('node:path');
const vm = require('node:vm');
const ts = require(path.resolve(process.argv[2]));
const root = path.resolve(__dirname, '../../entry/src/main/ets/model');
const cache = new Map();
const files = new Map();
const removed = [];
let failOpen = false;
let playbackState = 0;
let recordingActive = false;
let inspect = async () => status();
let start = async () => status();
let canceled = 0;
let cancelDialog = false;
let pickerPaths = ['file://report'];
const transcoder = { inspect: request => inspect(request), start: request => start(request),
  getStatus: () => status({ state: 1 }), cancel: () => { canceled++; } };
function status(patch = {}) {
  return { state: 2, stage: 'complete', detail: '', errorCode: 0, progress: 100, frames: 30, bytes: 100,
    outputWidth: 1280, outputHeight: 720, audioCopied: true, elapsedMs: 1000, firstFrameMs: 20,
    fps: 30, speed: 1, remainingSeconds: 0, decoderWaitMs: 2, encoderInputWaitMs: 3, encoderOutputWaitMs: 4,
    copiedBytes: 1000, fileBytes: 200, availableBytes: 1e9, estimatedBytes: 1e6, diagnostics: [],
    decoderName: 'decoder', encoderName: 'encoder', sourceWidth: 1280, sourceHeight: 720, durationUs: 1e6,
    sourceFrameRate: 30, sourceMime: 'video/avc', audioTracks: ['audio'], audioTrackIds: [2],
    minBitrate: 100000, maxBitrate: 20000000, audioBytes: 100, audioMode: 0, ...patch };
}
function deferred() {
  let resolve;
  const promise = new Promise(yes => { resolve = yes; });
  return { promise, resolve };
}
function stat(file) {
  if (!files.has(file)) { throw new Error('Missing file: ' + file); }
  const item = files.get(file);
  return { size: item.text?.length || 200, isDirectory: () => item.kind === 'dir',
    isFile: () => item.kind === 'file', isSymbolicLink: () => item.kind === 'link' };
}
const io = {
  OpenMode: { CREATE: 1, WRITE_ONLY: 2, TRUNC: 4, NOFOLLOW: 8, READ_ONLY: 16, READ_WRITE: 32 },
  access: async file => files.has(file), mkdir: async file => {
    if (files.has(file)) { throw Object.assign(new Error('File exists'), { code: 13900015 }); }
    files.set(file, { kind: 'dir' });
  },
  lstat: async file => stat(file), stat: async file => stat(file),
  listFile: async directory => [...files.keys()].filter(file => file.startsWith(directory + '/') &&
    !file.slice(directory.length + 1).includes('/')).map(file => file.slice(directory.length + 1)),
  open: async (file, flags) => {
    if (failOpen) { throw new Error('Open failed: /private/source.mp4'); }
    if (!files.has(file) && !(flags & 1)) { throw new Error('Missing file'); }
    if (flags & 4 || !files.has(file)) { files.set(file, { kind: 'file', text: '' }); }
    return { fd: file };
  },
  close: async () => {}, fsync: async () => {}, readText: async file => files.get(file).text,
  rename: async (from, to) => { files.set(to, files.get(from)); files.delete(from); },
  unlink: async file => { removed.push(file); files.delete(file); }, copyFile: async () => {}
};
const mocks = {
  '@kit.BasicServicesKit': { deviceInfo: { productModel: 'host', osFullName: 'mock', sdkApiVersion: 26 } },
  '@kit.ArkUI': {}, '@kit.AbilityKit': {}, '@kit.MediaLibraryKit': { photoAccessHelper: {} },
  '@kit.CoreFileKit': { fileIo: io, fileUri: { getUriFromPath: file => 'file://' + file },
    statfs: { getFreeSize: async () => 1e9 },
    picker: { DocumentViewPicker: class { async save() { return pickerPaths; } } } },
  'libplayer.so': { default: { getState: () => playbackState, PlayerState: { IDLE: 0 } } },
  'librecorder.so': { default: { getDiagnostics: () => ({ active: recordingActive }) } },
  'libtranscoder.so': { default: transcoder }
};
function load(name) {
  if (cache.has(name)) { return cache.get(name).exports; }
  const module = { exports: {} };
  cache.set(name, module);
  const file = path.join(root, name + '.ets');
  const compiled = ts.transpileModule(fs.readFileSync(file, 'utf8'), {
    fileName: file.replace(/[.]ets$/, '.ts'), compilerOptions: {
      module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2020, experimentalDecorators: true }
  });
  vm.runInNewContext(compiled.outputText, { module, exports: module.exports,
    Observed: target => target, $r: name => name, setInterval: () => 1, clearInterval: () => {},
    require: name => {
      if (mocks[name]) { return mocks[name]; }
      if (name === '../common/LocalizedText') { return { LocalizedText: { get: key => key } }; }
      if (name === './PlaybackHistoryModel') { return { getPlaybackTitle: uri => uri.split('/').pop() }; }
      if (name === './MediaFileWriter') {
        return { MediaFileWriter: { writeAll: async (fd, value) => { files.get(fd).text = value; } } };
      }
      if (name.startsWith('./')) { return load(name.slice(2)); }
      throw new Error('Unexpected dependency: ' + name);
    }
  }, { filename: file });
  return module.exports;
}
const { TranscodeModel } = load('TranscodeModel');
const { TranscodeFilesModel } = load('TranscodeFilesModel');
const { MediaFileActivity } = load('MediaFileActivity');
const { MediaTaskCoordinator } = load('MediaTaskCoordinator');
const { TranscodeQueueModel } = load('TranscodeQueueModel');
const { MediaStateFiles } = load('MediaStateFiles');
const { MediaSessionStore } = load('MediaSessionStore');
const { MediaReports } = load('MediaSessionReport');
const { MediaPerformanceBaseline } = load('MediaPerformanceBaseline');
const { MediaRecoveryFiles } = load('MediaRecoveryFiles');
const { CodecCapabilityMatrix } = load('CodecCapabilityMatrix');
const { TranscodeGeometryModel } = load('TranscodeGeometryModel');
const ui = { getHostContext: () => ({ filesDir: '/private' }),
  getPromptAction: () => ({ showDialog: async () => {
    if (cancelDialog) { throw new Error('Dialog canceled'); }
    return { index: 1 };
  } }) };
function entry(id = 'transcoded_123') {
  return { id, createdAt: 123, title: 'private-name.mp4', configuration: 'H.264 · Buffer',
    status: status(), hasFile: true };
}
async function testInspection() {
  const model = new TranscodeModel();
  model.sourceUri = '/private/source.mp4';
  const first = deferred();
  const second = deferred();
  let sequence = 0;
  inspect = () => ++sequence === 1 ? first.promise : second.promise;
  const old = model.inspect(ui);
  await Promise.resolve();
  const latest = model.inspect(ui);
  await Promise.resolve();
  second.resolve(status({ encoderName: 'latest' }));
  await latest;
  first.resolve(status({ encoderName: 'stale' }));
  await old;
  assert.equal(model.analysis.encoderName, 'latest');
  inspect = async () => { throw new Error('Unsupported'); };
  await model.inspect(ui);
  assert.equal(model.analysis.state, 4);
  assert.equal(model.analysis.encoderName, '');
  assert.equal(model.inspecting, false);
  const abandoned = deferred();
  inspect = () => abandoned.promise;
  const task = model.inspect(ui);
  await Promise.resolve();
  model.dispose();
  abandoned.resolve(status({ encoderName: 'disposed' }));
  await task;
  assert.notEqual(model.analysis.encoderName, 'disposed');
}
async function testActivity() {
  assert.equal(MediaFileActivity.beginLaunch(), true);
  assert.equal(MediaFileActivity.beginTranscode(), false);
  MediaFileActivity.endLaunch();
  assert.equal(MediaFileActivity.beginCleanup(), true);
  assert.equal(MediaFileActivity.beginTranscode(), false);
  MediaFileActivity.endCleanup();
  const model = new TranscodeModel();
  model.sourceUri = '/private/source.mp4';
  playbackState = 2;
  await model.start(ui);
  assert.equal(model.busy, false);
  playbackState = 0;
  recordingActive = true;
  await model.start(ui);
  assert.equal(model.busy, false);
  recordingActive = false;
  const done = deferred();
  const entered = deferred();
  start = () => { entered.resolve(); return done.promise; };
  const task = model.start(ui);
  assert.equal(MediaFileActivity.isTranscoding(), true, 'Acquire before the first await');
  assert.equal(MediaFileActivity.beginLaunch(), false);
  assert.equal(MediaFileActivity.beginCleanup(), false);
  await entered.promise;
  model.cancel();
  assert.equal(canceled, 1);
  assert.equal(MediaFileActivity.isTranscoding(), true, 'Cancel waits for native cleanup');
  done.resolve(status({ state: 3, stage: 'cancelled' }));
  await task;
  assert.equal(model.busy, false);
  assert.equal(MediaFileActivity.isTranscoding(), false);
  assert.equal(model.history.length, 1);
  failOpen = true;
  await model.start(ui);
  failOpen = false;
  assert.equal(model.status.state, 4);
  assert.equal(MediaFileActivity.isTranscoding(), false);
  assert.doesNotMatch(TranscodeFilesModel.report(model.activeEntry), /\/private\/|source[.]mp4/);
  let started = 0;
  start = async () => { started++; return status(); };
  const early = model.start(ui);
  model.cancel();
  await early;
  assert.equal(started, 0, 'Cancel before native start must not launch a codec');
  assert.equal(model.status.state, 3);
  assert.equal(MediaFileActivity.isTranscoding(), false);
  await model.start(ui);
  assert.equal(started, 1);
  assert.equal(model.status.state, 2);
  assert(model.resultPath.endsWith('.mp4') && files.has(model.resultPath));
  assert(!files.has(model.resultPath + '.part'));
  cancelDialog = true;
  await model.clearHistory(ui);
  cancelDialog = false;
  assert.equal(MediaFileActivity.beginCleanup(), true);
  MediaFileActivity.endCleanup();
}
async function testHistory() {
  files.clear(); removed.length = 0;
  const directory = '/private/transcodes';
  files.set(directory, { kind: 'dir' });
  const report = entry();
  await TranscodeFilesModel.persist(directory, report);
  files.set(directory + '/transcoded_123.mp4', { kind: 'file' });
  files.set(directory + '/transcoded_124.json', { kind: 'link' });
  files.set(directory + '/transcoded_125.json', { kind: 'file', text: JSON.stringify(entry('../outside')) });
  files.set(directory + '/transcoded_126.json', { kind: 'file', text: '{}' });
  files.set(directory + '/transcoded_127.json', { kind: 'file',
    text: JSON.stringify({ ...entry('transcoded_127'), status: status({ state: '2' }) }) });
  const list = await TranscodeFilesModel.list(directory);
  assert.equal(list.length, 1);
  assert.equal(list[0].hasFile, true);
  const text = TranscodeFilesModel.report(report);
  assert(text.includes('\n'));
  assert.doesNotMatch(text, /private-name|file:\/\/|\/private\//);
  files.set('file://report', { kind: 'file' });
  await TranscodeFilesModel.export({}, report);
  assert.equal(files.get('file://report').text, text);
  pickerPaths = [];
  assert.equal(await TranscodeFilesModel.export({}, report), false);
  files.set(directory + '/keep.mp4', { kind: 'file' });
  files.set(directory + '/transcoded_128.mp4.part', { kind: 'file' });
  files.set('/private/source.mp4', { kind: 'file' });
  await TranscodeFilesModel.clear(directory);
  assert(removed.includes(directory + '/transcoded_123.mp4'));
  assert(removed.includes(directory + '/transcoded_128.mp4.part'));
  assert(files.has(directory + '/transcoded_124.json'), 'Do not follow symlinks');
  assert(files.has(directory + '/keep.mp4'));
  assert(files.has('/private/source.mp4'));
  files.set(directory, { kind: 'link' });
  await assert.rejects(() => TranscodeFilesModel.clear(directory), /Unsafe cleanup directory/);
}
async function testTimeRanges() {
  const model = new TranscodeModel();
  model.sourceUri = '/private/source.mp4';
  model.setRangeEnabled(true);
  model.setRangeStart('');
  let inspected = 0;
  inspect = async request => {
    inspected++;
    assert.equal(request.startTimeMs, 0, 'Draft interval must not invalidate source inspection');
    assert.equal(request.endTimeMs, 0);
    return status({ durationUs: 10000000 });
  };
  await model.inspect(ui);
  assert.equal(inspected, 1);
  assert.equal(model.analysis.state, 2);
  assert.equal(model.isRangeValid(), false);
  assert.equal(model.analysisSizeEstimate, -1);
  model.setRangeStart('1.250');
  model.setRangeEnd('3.500');
  assert.equal(model.isRangeValid(), true);
  assert.equal(model.request(0, 0).startTimeMs, 1250);
  assert.equal(model.request(0, 0).endTimeMs, 3500);
  assert.equal(model.analysisSizeEstimate, 2.25 * (8000000 + 192000) / 8 * 1.15);
  await model.enqueue(ui);
  assert.equal(model.queue.items[0].startTimeMs, 1250);
  assert.equal(model.queue.items[0].endTimeMs, 3500);
  model.setRangeEnd('');
  assert.equal(model.isRangeValid(), true);
  assert.equal(model.request(0, 0).endTimeMs, 0);
  for (const value of ['0', '1.250', '10.001', '-1', '1.0001', 'NaN', '2147483.648']) {
    model.setRangeEnd(value);
    assert.equal(model.isRangeValid(), false, 'Invalid interval end: ' + value);
  }
  model.setRangeEnd('3.500');
  model.setMode(1);
  assert.equal(model.rangeEnabled, false);
  assert.equal(model.request(0, 0).startTimeMs, 0);
  assert.equal(model.request(0, 0).endTimeMs, 0);
  inspect = async () => status();
  console.info('Time ranges: draft inspection, validation, size estimate, queue snapshot and Surface reset passed');
}
async function main() {
  files.set('/private/source.mp4', { kind: 'file' });
  await testStateFiles();
  await testInspection();
  await testTimeRanges();
  await testActivity();
  await testHistory();
  await testSessionTasks();
  await testQueue();
  testCapabilityAndGeometry();
  console.log('Transcode models: inspection races, resource lease, failure/cancel cleanup, reports and history passed');
}

async function testStateFiles() {
  const context = { filesDir: '/state-tests' };
  const directory = context.filesDir + '/media_state';
  const statePath = directory + '/pending_sessions.json';
  assert.equal(await MediaStateFiles.read(context, 'pending_sessions.json', '[]'), '[]');
  await MediaStateFiles.write(context, 'pending_sessions.json', '[1]');
  assert.equal(files.get(directory).kind, 'dir');
  assert.equal(await MediaStateFiles.read(context, 'pending_sessions.json', '[]'), '[1]');
  await MediaStateFiles.write(context, 'pending_sessions.json', '[2]');
  assert.equal(await MediaStateFiles.read(context, 'pending_sessions.json', '[]'), '[2]');
  await Promise.all([MediaStateFiles.write(context, 'pending_sessions.json', '[3]'),
    MediaStateFiles.write(context, 'pending_sessions.json', '[4]'),
    MediaStateFiles.write(context, 'transcode_queue.json', '[5]')]);
  assert.equal(await MediaStateFiles.read(context, 'pending_sessions.json', '[]'), '[4]');
  assert.equal(await MediaStateFiles.read(context, 'transcode_queue.json', '[]'), '[5]');
  assert.equal(files.has(statePath + '.pending'), false);
  for (const kind of ['file', 'link']) {
    const invalidContext = { filesDir: '/state-tests-' + kind };
    const invalidDirectory = invalidContext.filesDir + '/media_state';
    const existing = { kind, text: 'preserve' };
    files.set(invalidDirectory, existing);
    await assert.rejects(() => MediaStateFiles.write(invalidContext, 'pending_sessions.json', '[]'),
      /Invalid media state directory/);
    assert.equal(files.get(invalidDirectory), existing);
    assert.equal(files.has(invalidDirectory + '/pending_sessions.json.pending'), false);
  }
  const permissionError = Object.assign(new Error('Permission denied'), { code: 13900012 });
  const originalMkdir = io.mkdir;
  io.mkdir = async () => { throw permissionError; };
  try {
    await assert.rejects(() => MediaStateFiles.write(context, 'pending_sessions.json', '[6]'),
      error => error === permissionError);
    assert.equal(files.get(statePath).text, '[4]');
  } finally { io.mkdir = originalMkdir; }
  await MediaStateFiles.write(context, 'pending_sessions.json', '[7]');
  assert.equal(await MediaStateFiles.read(context, 'pending_sessions.json', '[]'), '[7]');
  console.info('State files: repeated/concurrent writes, existing directory, unsafe paths, error propagation and recovery passed');
}

function testErrorClassification() {
  const graphicsOperations = [
    'Get encoder input Surface',
    'Connect decoder to encoder Surface',
    'Submit decoded Surface frame',
    'Notify Surface encoder EOS',
    'Create NativeWindow',
    'Update NativeImage',
    'Vulkan present failed',
    'OpenGL render failed'
  ];
  for (const operation of graphicsOperations) {
    assert.equal(MediaReports.error(operation, -1, '').category, 'graphics', operation);
    assert.equal(MediaReports.error('', -1, operation.toUpperCase()).category, 'graphics', operation);
  }
  assert.equal(MediaReports.error('Get Buffer encoder input', -1, '').category, 'codec');
  assert.equal(MediaReports.error('Configure decoder', -1, '').category, 'configuration');
  assert.equal(MediaReports.error('Create NativeWindow', -1, 'Permission denied').category, 'permission');
  assert.equal(MediaReports.error('Vulkan present', -1, 'Not supported').category, 'capability');
  assert.equal(MediaReports.error('OpenGL render', -1, '', true).category, 'cancelled');
  assert.equal(MediaReports.error('', 0, '').category, 'none');
  assert.equal(MediaReports.error('Unrecognized stage', -1, '').category, 'unknown');
  console.info('Error classification: graphics operations, case handling, Buffer input and priority passed');
}

async function testSessionTasks() {
  testErrorClassification();
  const first = MediaTaskCoordinator.acquire('playback');
  assert(first);
  assert.equal(MediaTaskCoordinator.acquire('recording'), undefined);
  MediaTaskCoordinator.cancelling(first);
  MediaTaskCoordinator.running(first);
  assert.equal(MediaTaskCoordinator.currentPhase(), 'cancelling');
  assert.equal(MediaFileActivity.beginCleanup(), false);
  MediaTaskCoordinator.release(first);
  const next = MediaTaskCoordinator.acquire('recording');
  MediaTaskCoordinator.release(first);
  assert.equal(MediaTaskCoordinator.current().id, next.id, 'Stale completion cannot release another session');
  MediaTaskCoordinator.release(next);
  const context = ui.getHostContext();
  const playbackReport = MediaReports.playback('playback_final', {
    videoOutputFrames: 123, videoDroppedFrames: 2,
    failure: { stage: '', code: 0, message: '' },
    videoSinkDiagnostics: { averageFrameUs: 1500 },
    diagnostics: { sessionId: 'native_playback_final', requestedConfiguration: 'Surface',
      observedConfiguration: 'hardware', presentCallP95Us: 2500,
      events: [{ elapsedUs: 9000, stage: 'playback.completed' }] }
  }, 'completed');
  assert.equal(playbackReport.nativeSessionId, 'native_playback_final');
  assert.equal(playbackReport.metrics.find(item => item.name === 'video.frames').amount, 123);
  assert.equal(playbackReport.metrics.find(item => item.name === 'video.dropped').amount, 2);
  assert.equal(playbackReport.metrics.find(item => item.name === 'sink.frame').amount, 1.5);
  assert.equal(playbackReport.events[0].elapsedMs, 9);
  const report = MediaReports.base('session_1', 'transcode', 'completed');
  report.requested = 'file://private/secret.mp4';
  report.observed = 'path=/storage/private/video.mp4';
  report.error.detail = 'D:\\private\\video.mp4';
  report.events = [{ elapsedMs: 10, stage: 'read /data/private/video.mp4' }];
  report.metrics = [{ name: 'fps', amount: 30, unit: 'fps' }];
  await Promise.all([MediaSessionStore.begin(context, { id: 'session_1', operation: 'transcode', startedAt: 123 }),
    MediaSessionStore.begin(context, { id: 'session_2', operation: 'playback', startedAt: 456 })]);
  await MediaSessionStore.finish(context, 'session_1', report);
  assert.equal((await MediaSessionStore.pending(context)).length, 1);
  assert.equal((await MediaSessionStore.reports(context))[0].id, 'session_1');
  await MediaSessionStore.finish(context, 'session_1', report);
  assert.equal((await MediaSessionStore.reports(context)).filter(item => item.id === 'session_1').length, 1);
  const recordingReport = MediaReports.base('recording_legacy', 'recording', 'completed');
  const journal = context.filesDir + '/media_state/session_reports.json';
  files.set(journal, { kind: 'file', text: JSON.stringify([recordingReport, report]) });
  assert.equal((await MediaSessionStore.reports(context)).length, 1, 'Legacy recording reports must be hidden');
  assert.equal(MediaReports.parseList(JSON.stringify([recordingReport])).length, 0,
    'Recording reports must also be excluded from baseline lists');
  await MediaSessionStore.begin(context, { id: recordingReport.id, operation: 'recording', startedAt: 789 });
  const previousReports = files.get(journal).text;
  await MediaSessionStore.finish(context, recordingReport.id, recordingReport);
  assert.equal(files.get(journal).text, previousReports, 'Finishing recording must not write a diagnostic report');
  assert.equal((await MediaSessionStore.pending(context)).some(item => item.id === recordingReport.id), false);
  await MediaSessionStore.finish(context, 'session_1', report);
  assert.equal(JSON.parse(files.get(journal).text).some(item => item.operation === 'recording'), false,
    'The next normal report write must discard legacy recording reports');
  const shared = JSON.stringify(MediaReports.shareable(report));
  assert.doesNotMatch(shared, /secret|private|video[.]mp4/);
  assert.match(report.observed, /private/, 'Share export must not mutate local report');
  assert.throws(() => MediaReports.parseList('{}'), /Invalid/);
  assert.equal(MediaReports.parseList('[null,{},false]').length, 0);
  const baseline = JSON.parse(JSON.stringify(report));
  baseline.metrics[0].amount = 20;
  assert.match(MediaPerformanceBaseline.compare(report, baseline), /[+]50[.]0%/);
  baseline.api = 25;
  assert.equal(MediaPerformanceBaseline.compare(report, baseline), '');
  baseline.api = 26;
  baseline.metrics[0].amount = 0;
  assert.equal(MediaPerformanceBaseline.compare(report, baseline), '');
  baseline.metrics[0].amount = 20;
  baseline.outcome = 'failed';
  assert.equal(MediaPerformanceBaseline.compare(report, baseline), '');
  const directory = '/private/transcodes';
  files.set(directory, { kind: 'dir' });
  files.set(directory + '/transcoded_555.mp4.part', { kind: 'file' });
  files.set(directory + '/transcoded_556.mp4.part', { kind: 'link' });
  files.set(directory + '/transcoded_555.mp4', { kind: 'file' });
  assert.equal((await MediaRecoveryFiles.list(context)).length, 1);
  const active = MediaTaskCoordinator.acquire('transcode');
  await assert.rejects(() => MediaRecoveryFiles.clear(context), /owns/);
  MediaTaskCoordinator.release(active);
  await MediaRecoveryFiles.clear(context);
  assert(files.has(directory + '/transcoded_555.mp4'));
  assert(files.has(directory + '/transcoded_556.mp4.part'));
  assert(!files.has(directory + '/transcoded_555.mp4.part'));
  console.info('Session tasks: stale lease, cancellation, atomic journals, report validation/redaction and partial recovery passed');
}

async function testQueue() {
  files.set('/private/source.mp4', { kind: 'file' });
  const model = new TranscodeModel();
  const options = [0, 0, 0, 2, 0, 0, 0, 0];
  model.queue.add('/private/source.mp4', 'one.mp4', options, false);
  model.queue.add('/private/source.mp4', 'two.mp4', options, false);
  const rangeQueue = new TranscodeQueueModel();
  rangeQueue.add('/private/source.mp4', 'clip.mp4', options, true, 250, 1250);
  const rangeId = rangeQueue.items[0].id;
  rangeQueue.update(rangeId, 'failed', 40, '/private/partial.mp4');
  rangeQueue.reassociate(rangeId, '/private/relinked.mp4', 'relinked.mp4');
  assert.equal(rangeQueue.items[0].uri, '/private/relinked.mp4');
  assert.equal(rangeQueue.items[0].title, 'relinked.mp4');
  assert.deepEqual(rangeQueue.items[0].options, options);
  assert.equal(rangeQueue.items[0].grayscale, true);
  assert.equal(rangeQueue.items[0].state, 'waiting');
  assert.equal(rangeQueue.items[0].progress, 0);
  assert.equal(rangeQueue.items[0].resultPath, '');
  assert.equal(rangeQueue.items[0].startTimeMs, 250);
  assert.equal(rangeQueue.items[0].endTimeMs, 1250);
  rangeQueue.activeId = rangeId;
  rangeQueue.reassociate(rangeId, '/private/ignored.mp4', 'ignored.mp4');
  assert.equal(rangeQueue.items[0].uri, '/private/relinked.mp4', 'Active queue item cannot be relinked');
  const legacyItem = { ...rangeQueue.items[0], id: 'queue_7_1' };
  delete legacyItem.startTimeMs;
  delete legacyItem.endTimeMs;
  assert.equal(TranscodeQueueModel.validated([legacyItem]).length, 1, 'Legacy full-file entries remain valid');
  const invalidRange = { ...legacyItem, id: 'queue_7_2', startTimeMs: 2000, endTimeMs: 1000 };
  const surfaceRange = { ...legacyItem, id: 'queue_7_3', options: [0, 1, 0, 2, 0, 0, 0, 0],
    startTimeMs: 1000, endTimeMs: 2000 };
  assert.equal(TranscodeQueueModel.validated([invalidRange, surfaceRange]).length, 0);
  const done = deferred();
  const entered = deferred();
  let started = 0;
  start = () => { started++; entered.resolve(); return done.promise; };
  const task = model.runQueue(ui);
  await entered.promise;
  await model.start(ui);
  assert.equal(started, 1, 'Direct start cannot race queue');
  model.queue.paused = true;
  done.resolve(status());
  await task;
  assert.equal(model.queue.items[0].state, 'completed');
  assert.equal(model.queue.items[1].state, 'waiting', 'Pause completes only current file');
  assert.equal(model.queueRunning, false);
  const restored = new TranscodeModel();
  await restored.restoreQueue(ui);
  assert.equal(restored.queue.paused, true);
  assert.equal(restored.queue.items.length, 2);
  restored.queue.items[1].state = 'running';
  await restored.persistQueue(ui);
  const interrupted = new TranscodeModel();
  await interrupted.restoreQueue(ui);
  assert.equal(interrupted.queue.items[1].state, 'interrupted');
  interrupted.queue.retry(interrupted.queue.items[1].id);
  assert.equal(interrupted.queue.items[1].state, 'waiting');
  const invalid = JSON.parse(JSON.stringify(restored.queue.items));
  invalid[0].options[0] = 999;
  assert.equal(TranscodeQueueModel.validated(invalid).length, 1);
  assert.equal(TranscodeQueueModel.validated([null, false, {}]).length, 0);
  const abandoned = new TranscodeModel();
  abandoned.queue.add('/private/source.mp4', 'abandoned.mp4', options, false);
  const early = abandoned.runQueue(ui);
  abandoned.dispose();
  await early;
  assert.equal(abandoned.queue.items[0].state, 'waiting');
  assert.equal(started, 1, 'Disposal during queue persistence must not start native codec');
  const busy = new TranscodeModel();
  busy.status = status();
  busy.queue.add('/private/source.mp4', 'blocked.mp4', options, false);
  const owner = MediaTaskCoordinator.acquire('recording');
  await busy.runQueue(ui);
  assert.equal(busy.queue.items[0].state, 'waiting', 'Another owner must not complete a job from stale status');
  MediaTaskCoordinator.release(owner);
  const failedReport = new TranscodeModel();
  failedReport.sourceUri = '/private/source.mp4';
  const originalFinish = MediaSessionStore.finish;
  MediaSessionStore.finish = () => { throw new Error('Report storage unavailable'); };
  try {
    start = async () => status();
    await failedReport.start(ui);
    assert.equal(failedReport.status.state, 2);
    assert.equal(failedReport.busy, false);
    assert.equal(MediaTaskCoordinator.busy(), false, 'Report errors must not retain Native ownership');
  } finally { MediaSessionStore.finish = originalFinish; }
  console.info('Queue: sequential dispatch, snapshot isolation, pause boundary, restart/retry, malformed input and dispose race passed');
}

function testCapabilityAndGeometry() {
  const codec = { codecType: 1, mimeType: 'video/avc', codecName: 'decoder', hardware: true, maxInstances: 8,
    videoPixelFormats: [2, 1], profiles: [2, 1], profileLevels: [{ profile: 1, levels: [3, 1] }],
    audioSampleRates: [], audioSampleRateRanges: [] };
  const before = CodecCapabilityMatrix.capture([codec]);
  const reordered = CodecCapabilityMatrix.capture([{ ...codec, videoPixelFormats: [1, 2],
    profiles: [1, 2], profileLevels: [{ profile: 1, levels: [1, 3] }] }]);
  assert.equal(CodecCapabilityMatrix.compare(before, reordered).length, 1);
  const changed = CodecCapabilityMatrix.capture([{ ...codec, hardware: false }]);
  assert.match(CodecCapabilityMatrix.compare(changed, before).join('\n'), /before: HW/);
  assert.throws(() => CodecCapabilityMatrix.parse('{"version":1,"rows":[null]}'), /Invalid/);
  for (const width of [640, 1080, 1920]) {
    for (const height of [360, 1080, 1920]) {
      for (const mode of [0, 1, 2]) {
        const plan = TranscodeGeometryModel.plan(width, height, 720, mode);
        for (const value of Object.values(plan)) { assert.equal(value % 2, 0); }
        assert(plan.left + plan.cropWidth <= width);
        assert(plan.top + plan.cropHeight <= height);
        assert(plan.contentLeft + plan.contentWidth <= plan.width);
        assert(plan.contentTop + plan.contentHeight <= plan.height);
      }
    }
  }
  assert.equal(TranscodeGeometryModel.plan(0, 720, 720, 0).width, 0);
  console.info('Capability matrix: stable ordering, HW/SW diffs and malformed snapshots; preview: 27 aligned geometries passed');
}
main().catch(error => { console.error(error); process.exitCode = 1; });
