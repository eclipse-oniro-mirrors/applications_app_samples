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
const { createHash } = require('node:crypto');
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
let preview = async () => status({ previewWidth: 2, previewHeight: 2, previewRgba: new ArrayBuffer(16) });
let canceled = 0;
let cancelDialog = false;
let pickerPaths = ['file://report'];
const transcoder = { inspect: request => inspect(request), start: request => start(request),
  preview: request => preview(request),
  getStatus: () => status({ state: 1 }), cancel: () => { canceled++; } };
function status(patch = {}) {
  return { state: 2, stage: 'complete', detail: '', errorCode: 0, progress: 100, frames: 30, bytes: 100,
    outputWidth: 1280, outputHeight: 720, audioCopied: true, elapsedMs: 1000, firstFrameMs: 20,
    fps: 30, speed: 1, remainingSeconds: 0, decoderWaitMs: 2, encoderInputWaitMs: 3, encoderOutputWaitMs: 4,
    copiedBytes: 1000, fileBytes: 200, availableBytes: 1e9, estimatedBytes: 1e6, diagnostics: [],
    decoderName: 'decoder', encoderName: 'encoder', sourceWidth: 1280, sourceHeight: 720, durationUs: 1e6,
    sourceFrameRate: 30, sourceMime: 'video/avc', audioTracks: ['audio'], audioTrackIds: [2],
    originalWidth: 2, originalHeight: 2, originalRgba: new ArrayBuffer(16),
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
  return { size: item.data?.length ?? (item.text?.length || 200), mtime: item.mtime ?? 10, isDirectory: () => item.kind === 'dir',
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
    files.get(file).offset = 0;
    return { fd: file };
  },
  read: async (fd, buffer, options) => {
    const file = files.get(fd);
    const offset = file.offset || 0;
    const length = Math.min(options.length, 3, file.data.length - offset);
    new Uint8Array(buffer, 0, length).set(file.data.subarray(offset, offset + length));
    file.offset = offset + length;
    if (file.mutate) { file.mtime = 11; }
    return length;
  },
  close: async () => {}, fsync: async () => {}, readText: async file => files.get(file).text,
  rename: async (from, to) => { files.set(to, files.get(from)); files.delete(from); },
  unlink: async file => { removed.push(file); files.delete(file); }, copyFile: async () => {}
};
const mocks = {
  '@kit.ImageKit': { image: { PixelMapFormat: { RGBA_8888: 3 },
    createPixelMap: async () => ({ release: async () => {} }) } },
  '@kit.BasicServicesKit': { deviceInfo: { productModel: 'host', osFullName: 'mock', sdkApiVersion: 26 } },
  '@kit.ArkData': {},
  '@kit.CryptoArchitectureKit': { cryptoFramework: { createMd: algorithm => {
    assert.equal(algorithm, 'SHA256');
    const hash = createHash('sha256');
    return { update: async blob => { hash.update(blob.data); },
      digest: async () => ({ data: new Uint8Array(hash.digest()) }) };
  } } },
  '@kit.ArkUI': {}, '@kit.AbilityKit': {}, '@kit.MediaLibraryKit': { photoAccessHelper: {} },
  '@kit.CoreFileKit': { fileIo: io, fileUri: { getUriFromPath: file => 'file://' + file },
    statfs: { getFreeSize: async () => 1e9 },
    picker: { DocumentViewPicker: class { async save() { return pickerPaths; } } } },
  'libplayer.so': { default: { getState: () => playbackState, PlayerState: { IDLE: 0 } } },
  'librecorder.so': { default: { getDiagnostics: () => ({ active: recordingActive }) } },
  'libtranscoder.so': { default: transcoder }
};
function load(name) {
  name = path.normalize(name);
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
      if (name === '../common/utils/Logger') { return { default: { warn: () => {}, error: () => {} } }; }
      if (name === '@kit.LocalizationKit' || name === '@kit.ArkTS') { return {}; }
      if (name === '../common/LocalizedText') { return { LocalizedText: { get: key => key } }; }
      if (name === './PlaybackHistoryModel') { return { getPlaybackTitle: uri => uri.split('/').pop() }; }
      if (name === './MediaFileWriter') {
        return { MediaFileWriter: { writeAll: async (fd, value) => { files.get(fd).text = value; } } };
      }
      if (name.startsWith('./') || name.startsWith('../')) {
        return load(path.relative(root, path.resolve(path.dirname(file), name)));
      }
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
  const originalStat = io.stat;
  try {
    io.stat = async file => {
      if (file === model.sourceUri) { throw new Error('Provider does not expose source metadata'); }
      return originalStat(file);
    };
    await model.start(ui);
    assert.equal(model.status.state, 2, 'Optional source metadata must not block transcoding');
    const report = (await MediaSessionStore.reports(ui.getHostContext()))[0];
    assert.equal(report.input, undefined, 'Unavailable metadata cannot produce a source baseline');
  } finally { io.stat = originalStat; }
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
  files.set(directory + '/transcoded_128.mp4.part', { kind: 'file', text: 'partial' });
  files.set(directory + '/transcoded_129.json.pending', { kind: 'file', text: 'pending' });
  files.set(directory + '/transcoded_130.mp4', { kind: 'link' });
  const list = await TranscodeFilesModel.list(directory);
  assert.equal(list.length, 1);
  assert.equal(list[0].hasFile, true);
  const firstPage = await TranscodeFilesModel.listPage(directory, 0, 1);
  assert.equal(firstPage.entries.length, 0, 'Invalid reports are skipped without breaking the page cursor');
  assert.equal(firstPage.nextOffset, 1);
  assert.equal(firstPage.hasMore, true);
  let pageOffset = firstPage.nextOffset;
  let pagedEntries = firstPage.entries;
  while (pageOffset < 5) {
    const nextPage = await TranscodeFilesModel.listPage(directory, pageOffset, 1);
    pagedEntries = pagedEntries.concat(nextPage.entries);
    pageOffset = nextPage.nextOffset;
  }
  assert.equal(pagedEntries.length, 1, 'Older history can be loaded in bounded pages');
  const text = TranscodeFilesModel.report(report);
  assert(text.includes('\n'));
  assert.doesNotMatch(text, /private-name|file:\/\/|\/private\//);
  files.set(directory + '/transcoded_128.mp4.part', { kind: 'file', text: 'partial' });
  files.set(directory + '/transcoded_129.json.pending', { kind: 'file', text: 'pending' });
  files.set(directory + '/transcoded_130.mp4', { kind: 'link' });
  const usage = await TranscodeFilesModel.storageUsage(directory);
  assert.equal(usage.orphanCount, 2, 'Count regular incomplete transcode files');
  assert(usage.bytes >= 'partial'.length + 'pending'.length);
  await TranscodeFilesModel.cleanupOrphans(directory);
  assert(!files.has(directory + '/transcoded_128.mp4.part'));
  assert(!files.has(directory + '/transcoded_129.json.pending'));
  assert(files.has(directory + '/transcoded_123.mp4'), 'Orphan cleanup retains complete videos');
  assert(files.has(directory + '/transcoded_123.json'), 'Orphan cleanup retains reports');
  assert(files.has(directory + '/transcoded_130.mp4'), 'Orphan cleanup does not follow links');
  files.set(directory + '/transcoded_123.mp4.part', { kind: 'file' });
  await TranscodeFilesModel.deleteEntry(directory, 'transcoded_123');
  assert(!files.has(directory + '/transcoded_123.mp4'));
  assert(!files.has(directory + '/transcoded_123.json'));
  assert(!files.has(directory + '/transcoded_123.mp4.part'));
  files.set(directory + '/transcoded_140.mp4', { kind: 'file' });
  files.set(directory + '/transcoded_140.json', { kind: 'link' });
  const removedBeforeUnsafeDelete = removed.length;
  await assert.rejects(() => TranscodeFilesModel.deleteEntry(directory, 'transcoded_140'), /Unsafe transcode file/);
  assert.equal(removed.length, removedBeforeUnsafeDelete, 'Preflight all paths before deleting any file');
  assert(files.has(directory + '/transcoded_140.mp4'));
  assert(files.has(directory + '/transcoded_140.json'));
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
async function testInputFingerprint() {
  const { MediaInputFingerprint } = load('MediaInputFingerprint');
  const { MediaBuildInfo } = load('MediaBuildInfo');
  assert.equal(MediaBuildInfo.valid({ appVersion: '1.0', revision: 'a'.repeat(40), sourceDigest: 'b'.repeat(64),
    builtAt: '2026-11-13T00:00:00Z' }), true);
  assert.equal(MediaBuildInfo.valid({ appVersion: '1.0', revision: 'bad', sourceDigest: 'b'.repeat(64),
    builtAt: '2026-11-13T00:00:00Z' }), false);
  const file = '/private/fingerprint.mp4';
  const data = Buffer.from('source bytes for checksum');
  files.set(file, { kind: 'file', data });
  const input = { sourceUri: file, bytes: data.length, modifiedAt: 10 };
  let closes = 0;
  const close = io.close;
  io.close = async () => { closes++; };
  try {
    const result = await MediaInputFingerprint.calculate(ui.getHostContext(), input);
    assert.equal(result.sha256, createHash('sha256').update(data).digest('hex'), 'All short reads are hashed');
    assert.equal(closes, 1);
    assert.equal(MediaTaskCoordinator.busy(), false);
    const active = MediaTaskCoordinator.acquire('playback');
    await assert.rejects(() => MediaInputFingerprint.calculate(ui.getHostContext(), input), /busy/);
    MediaTaskCoordinator.release(active);
    files.get(file).mtime = 12;
    await assert.rejects(() => MediaInputFingerprint.calculate(ui.getHostContext(), input), /changed/);
    files.get(file).mtime = 10;
    files.get(file).mutate = true;
    await assert.rejects(() => MediaInputFingerprint.calculate(ui.getHostContext(), input), /changed/);
    delete files.get(file).mutate;
    files.get(file).mtime = 10;
    const read = io.read;
    io.read = async () => 0;
    try { await assert.rejects(() => MediaInputFingerprint.calculate(ui.getHostContext(), input), /complete/); }
    finally { io.read = read; }
    assert.equal(closes, 4, 'Every opened descriptor closes on both success and failure');
    assert.equal(MediaTaskCoordinator.busy(), false, 'Failure releases the task lease');
    assert.equal(input.sha256, undefined, 'Failed or successful calculation does not mutate the input report');
  } finally { io.close = close; files.delete(file); }
  console.info('Input fingerprints: SHA256, short reads, busy task, changed source, EOF and fd/lease cleanup passed');
}

function testBuildMetadata() {
  const { execFileSync } = require('node:child_process');
  const os = require('node:os');
  const prefix = path.resolve(os.tmpdir(), 'avcodec-build-info-');
  const scratch = fs.mkdtempSync(prefix);
  assert(scratch.startsWith(prefix), 'Fixture cleanup must stay within the named temporary directory');
  try {
    fs.mkdirSync(path.join(scratch, 'AppScope'));
    fs.mkdirSync(path.join(scratch, 'scripts'));
    fs.mkdirSync(path.join(scratch, 'entry/src/main'), { recursive: true });
    fs.writeFileSync(path.join(scratch, 'AppScope/app.json5'), '{"app":{"versionName":"1.0.0"}}');
    const generator = path.join(scratch, 'scripts/generate-build-info.cjs');
    fs.copyFileSync(path.resolve(__dirname, '../../scripts/generate-build-info.cjs'), generator);
    const source = path.join(scratch, 'entry/src/main/source.txt');
    const local = path.join(scratch, 'build-profile.json5');
    const generated = path.join(scratch, 'entry/src/main/resources/rawfile/build-info.json');
    fs.writeFileSync(source, 'first');
    const generate = () => {
      execFileSync(process.execPath, [generator], { cwd: scratch, stdio: 'pipe' });
      return JSON.parse(fs.readFileSync(generated, 'utf8'));
    };
    const first = generate();
    assert.equal(first.revision, 'unknown', 'A source archive builds without Git history');
    assert.equal(first.appVersion, '1.0.0');
    assert.match(first.sourceDigest, /^[0-9a-f]{64}$/);
    assert.equal(generate().sourceDigest, first.sourceDigest, 'Generated metadata does not hash itself');
    fs.writeFileSync(local, 'local signing settings');
    assert.equal(generate().sourceDigest, first.sourceDigest, 'Local signing configuration is excluded');
    fs.writeFileSync(source, 'second');
    assert.notEqual(generate().sourceDigest, first.sourceDigest, 'Local source edits have a distinct identity');
  } finally { fs.rmSync(scratch, { recursive: true, force: true }); }
  console.info('Build identity: archive fallback, deterministic source digest, local edits and signing exclusion passed');
}

async function main() {
  testBuildMetadata();
  await testInputFingerprint();
  files.set('/private/source.mp4', { kind: 'file' });
  await testStateFiles();
  await testInspection();
  await testTimeRanges();
  await testActivity();
  await testHistory();
  await testSessionTasks();
  await testQueue();
  testCapabilityAndGeometry();
  console.info('Transcode models: inspection races, resource lease, failure/cancel cleanup, reports and history passed');
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
  assert.equal(MediaPerformanceBaseline.eligible(report), false, 'Old reports without input hashes cannot become baselines');
  report.input = { bytes: 100, modifiedAt: 10, sha256: 'a'.repeat(64), sourceUri: 'file://private/secret.mp4' };
  assert.equal(MediaPerformanceBaseline.eligible({ ...report, input: { sha256: 'a'.repeat(64) } }), false);
  const baseline = JSON.parse(JSON.stringify(report));
  baseline.input.sha256 = 'b'.repeat(64);
  assert.equal(MediaPerformanceBaseline.compare(report, baseline), '', 'Different source bytes cannot be compared');
  baseline.input.sha256 = report.input.sha256;
  baseline.input.bytes++;
  assert.equal(MediaPerformanceBaseline.compare(report, baseline), '');
  baseline.input.bytes = report.input.bytes;
  assert.doesNotMatch(JSON.stringify(MediaReports.shareable(report)), /secret/);
  assert.equal(MediaReports.parseList(JSON.stringify([{ ...report, input: { ...report.input, sha256: 'bad' } }])).length, 0);
  assert.equal(MediaReports.parseList(JSON.stringify([{ ...report, build: { revision: 'bad' } }])).length, 0);
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
  const options = { codecIndex: 0, modeIndex: 0, sizeIndex: 0, bitrateIndex: 2,
    encoderCategory: 0, audioMode: 0, audioTrack: 0, resizeMode: 0 };
  model.quality.codecMode = 1;
  model.queue.add('/private/source.mp4', 'one.mp4', options, false, 0, 0, model.quality.snapshot());
  model.queue.add('/private/source.mp4', 'two.mp4', options, false);
  const rangeQueue = new TranscodeQueueModel();
  rangeQueue.add('/private/source.mp4', 'clip.mp4', options, true, 250, 1250);
  const rangeId = rangeQueue.items[0].id;
  rangeQueue.update(rangeId, 'failed', 40, '/private/partial.mp4');
  rangeQueue.reassociate(rangeId, '/private/relinked.mp4', 'relinked.mp4');
  assert.equal(rangeQueue.items[0].uri, '/private/relinked.mp4');
  assert.equal(rangeQueue.items[0].title, 'relinked.mp4');
  assert.equal(TranscodeQueueModel.settings(rangeQueue.items[0]).bitrateIndex, options.bitrateIndex);
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
  const allAudioWithoutAudio = { ...legacyItem, id: 'queue_7_4', options: [0, 0, 0, 2, 0, 2, 0, 0],
    quality: { operation: 1, filter: 0, frameRate: 0, bitrateMode: 0, keyFrame: 1,
      audioRate: 0, audioChannels: 0, audioBitrate: 1, remuxAllAudioTracks: true } };
  assert.equal(TranscodeQueueModel.validated([invalidRange, surfaceRange, allAudioWithoutAudio]).length, 0);
  const done = deferred();
  const entered = deferred();
  let started = 0;
  start = request => {
    assert.equal(request.codecMode, 1, 'Queue dispatch restores asynchronous scheduling');
    started++; entered.resolve(); return done.promise;
  };
  model.quality.codecMode = 0;
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
  assert.equal(restored.queue.items[0].quality.codecMode, 1, 'Scheduling survives queue persistence');
  restored.queue.items[1].state = 'running';
  await restored.persistQueue(ui);
  const interrupted = new TranscodeModel();
  await interrupted.restoreQueue(ui);
  assert.equal(interrupted.queue.items[1].state, 'interrupted');
  interrupted.queue.retry(interrupted.queue.items[1].id);
  assert.equal(interrupted.queue.items[1].state, 'waiting');
  const invalid = JSON.parse(JSON.stringify(restored.queue.items));
  invalid[0].settings.codecIndex = 999;
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
async function testQualityProfiles() {
  const model = new TranscodeModel();
  model.sourceUri = '/private/source.mp4';
  model.sourceTitle = 'source.mp4';
  assert.equal(model.request(1, 2).codecMode, 0, 'Synchronous remains the default');
  const legacyQuality = model.quality.snapshot();
  delete legacyQuality.codecMode;
  delete legacyQuality.audioSourceLayout;
  model.quality.codecMode = 1;
  model.quality.audioSourceLayout = 2;
  model.quality.restore(legacyQuality);
  assert.equal(model.quality.codecMode, 0, 'Old snapshots restore synchronous mode');
  assert.equal(model.quality.audioSourceLayout, 0, 'Old snapshots default to an unspecified source layout');
  model.quality.codecMode = 1;
  model.quality.audioSourceLayout = 2;
  model.quality.filter = 1; model.quality.frameRate = 2; model.quality.bitrateMode = 1;
  model.quality.keyFrame = 3; model.quality.audioRate = 2; model.quality.audioChannels = 1;
  model.quality.audioBitrate = 2;
  const request = model.request(1, 2);
  assert.equal(request.codecMode, 1);
  assert.match(model.configuration(), /codecMode=async/);
  assert.equal(request.scalingFilter, 1); assert.equal(request.frameRateLimit, 30);
  assert.equal(request.bitrateMode, 1); assert.equal(request.keyFrameIntervalMs, 5000);
  assert.equal(request.audioSampleRate, 48000); assert.equal(request.audioChannels, 1);
  assert.equal(request.audioBitrate, 192000);
  assert.equal(request.audioSourceLayout, 2, 'Pass the selected 5.1 layout to Native');
  assert.equal(model.quality.snapshot().audioSourceLayout, 2, 'Persist the selected source layout');
  const queue = new TranscodeQueueModel();
  queue.add(model.sourceUri, model.sourceTitle, { codecIndex: 0, modeIndex: 0, sizeIndex: 0, bitrateIndex: 2,
    encoderCategory: 0, audioMode: 1, audioTrack: 0, resizeMode: 0 }, false, 0, 0, model.quality.snapshot());
  model.quality.filter = 0;
  model.quality.codecMode = 0;
  model.quality.audioSourceLayout = 1;
  assert.equal(queue.items[0].quality.codecMode, 1, 'Queue retains its codec scheduling');
  assert.equal(queue.items[0].quality.filter, 1, 'Queue must retain independent quality settings');
  assert.equal(queue.items[0].quality.audioSourceLayout, 2, 'Queue keeps the selected source layout');
  queue.update(queue.items[0].id, 'failed', 10);
  queue.reassociate(queue.items[0].id, '/private/new.mp4', 'new.mp4');
  assert.equal(queue.items[0].quality.audioChannels, 1);
  const invalid = JSON.parse(JSON.stringify(queue.items[0])); invalid.quality.audioRate = 9;
  assert.equal(TranscodeQueueModel.validated([invalid]).length, 0);
  const invalidLayout = JSON.parse(JSON.stringify(queue.items[0])); invalidLayout.quality.audioSourceLayout = 3;
  assert.equal(TranscodeQueueModel.validated([invalidLayout]).length, 0, 'Reject invalid source layouts');
  for (const codecMode of [-1, 2, 0.5, null, '1']) {
    const invalidMode = JSON.parse(JSON.stringify(queue.items[0])); invalidMode.quality.codecMode = codecMode;
    assert.equal(TranscodeQueueModel.validated([invalidMode]).length, 0, 'Reject invalid scheduling');
  }
  const legacy = JSON.parse(JSON.stringify(queue.items[0])); delete legacy.quality.codecMode;
  assert.equal(TranscodeQueueModel.validated([legacy]).length, 1, 'Legacy quality remains valid');
  const surfaceAsync = JSON.parse(JSON.stringify(queue.items[0]));
  surfaceAsync.settings.modeIndex = 1; surfaceAsync.quality.filter = 0;
  assert.equal(TranscodeQueueModel.validated([surfaceAsync]).length, 1, 'Surface supports asynchronous scheduling');
  const surfaceFilter = JSON.parse(JSON.stringify(queue.items[0]));
  surfaceFilter.settings.modeIndex = 1;
  assert.equal(TranscodeQueueModel.validated([surfaceFilter]).length, 0, 'Surface cannot restore CPU filtering');
  const remuxFilter = JSON.parse(JSON.stringify(queue.items[0]));
  remuxFilter.quality.operation = 1; remuxFilter.settings.audioMode = 0;
  assert.equal(TranscodeQueueModel.validated([remuxFilter]).length, 0, 'Remux cannot restore processing controls');
  model.audioMode = 1; model.rangeEnabled = true; model.sizeIndex = 2; model.grayscale = true;
  model.quality.deepValidation = true;
  model.setOperation(1);
  assert.equal(model.request(1, 2).remuxOnly, true);
  assert.equal(model.quality.deepValidation, false, 'Remux clears hidden decode validation');
  model.quality.deepValidation = true;
  assert.equal(model.request(1, 2).deepValidation, false, 'Restored remux settings cannot enable decode validation');
  model.quality.deepValidation = false;
  assert.equal(model.audioMode, 0); assert.equal(model.rangeEnabled, false);
  assert.equal(model.sizeIndex, 0); assert.equal(model.grayscale, false);
  model.setOperation(0);
  const done = deferred(); const entered = deferred();
  preview = () => { entered.resolve(); return done.promise; };
  const task = model.preview(ui); await entered.promise;
  assert.equal(MediaFileActivity.isTranscoding(), true);
  assert.equal(MediaFileActivity.beginLaunch(), false);
  model.cancel();
  assert.equal(MediaFileActivity.isTranscoding(), true, 'Preview cancellation holds resources until completion');
  done.resolve(status({ state: 3 })); await task;
  assert.equal(model.previewImage, undefined); assert.equal(model.busy, false);
  assert.equal(MediaFileActivity.isTranscoding(), false);
  model.quality.codecMode = 1;
  preview = async request => {
    assert.equal(request.codecMode, 1, 'Preview accepts a draft selecting asynchronous transcoding');
    return status({ previewWidth: 2, previewHeight: 2, previewRgba: new ArrayBuffer(16) });
  };
  await model.preview(ui); assert(model.previewImage);
  model.dispose(); assert.equal(model.previewImage, undefined);
  console.info('Quality: request mapping, queue snapshots, remux resets and preview cancellation lease passed');
}
async function testBatchOperations() {
  const { TranscodeQueueRunner } = load('../controller/TranscodeQueueRunner');
  const { TranscodeExportController } = load('../controller/TranscodeExportController');
  const queue = new TranscodeQueueModel();
  for (let index = 0; index < 4; index++) {
    queue.add('file://' + index, 'Clip ' + index, { codecIndex: 0, modeIndex: 0, sizeIndex: 0, bitrateIndex: 2,
      encoderCategory: 0, audioMode: 0, audioTrack: 0, resizeMode: 0 }, false);
  }
  const ids = queue.items.map(item => item.id);
  queue.update(ids[0], 'running', 10); queue.activeId = ids[0];
  queue.move(ids[3], -1);
  assert.equal(queue.items[2].id, ids[3]);
  queue.move(ids[1], -1);
  assert.equal(queue.items[0].id, ids[0], 'Running entries do not move');
  queue.update(ids[0], 'completed', 100); queue.activeId = '';
  const order = [];
  const runner = new TranscodeQueueRunner();
  queue.stopOnFailure = true;
  const host = {
    available: () => true, disposed: () => false, persist: async () => true,
    execute: async item => { order.push(item.id); return { state: 4, progress: 5, path: '' }; }
  };
  await runner.run(queue, host);
  assert.equal(order.length, 1, 'Failure policy pauses before starting another task');
  assert.equal(queue.paused, true);
  queue.stopOnFailure = false;
  await runner.run(queue, host);
  assert.equal(order.length, 3, 'Continue policy visits every remaining waiting task');
  assert.equal(queue.activeId, '');
  const paused = new TranscodeQueueModel();
  const pausedSettings = new TranscodeModel().queueSettings();
  paused.add('file://a', 'A', pausedSettings, false);
  paused.add('file://b', 'B', pausedSettings, false);
  assert.equal(JSON.stringify(paused.items[0].settings), JSON.stringify(pausedSettings));
  const current = deferred();
  const entered = deferred();
  const pauseHost = { available: () => true, disposed: () => false, persist: async () => true,
    execute: async () => { entered.resolve(); return current.promise; } };
  const running = runner.run(paused, pauseHost);
  await entered.promise;
  paused.paused = true;
  assert.equal(paused.items[0].state, 'running', 'Queue pause must not cancel the active file');
  current.resolve({ state: 2, progress: 100, path: '/done.mp4' });
  await running;
  assert.equal(paused.items[0].state, 'completed');
  assert.equal(paused.items[1].state, 'waiting');
  const exporter = new TranscodeExportController();
  const originalCopy = io.copyFile;
  try {
    pickerPaths = ['file://success', 'file://failure'];
    files.set('file://success', { kind: 'file' }); files.set('file://failure', { kind: 'file' });
    io.copyFile = async source => { if (source === '/failed.mp4') { throw new Error('Storage full'); } };
    await exporter.save({ filesDir: '/private' }, ['/ok.mp4', '/failed.mp4', '/cancelled.mp4'], false);
    assert.equal(exporter.results.map(result => result.state).join(','), 'saved,failed,cancelled');
    pickerPaths = ['file://retry']; io.copyFile = async () => {};
    files.set('file://retry', { kind: 'file' });
    await exporter.save({ filesDir: '/private' }, ['/failed.mp4'], false);
    assert.equal(exporter.results[0].state, 'saved');
  } finally { io.copyFile = originalCopy; pickerPaths = ['file://report']; }
  const model = new TranscodeModel();
  model.quality.filter = 2; model.setMode(2);
  assert.equal(model.request(1, 2).gpuProcessing, true);
  assert.equal(model.quality.filter, 1, 'GPU uses only supported texture filters');
  model.quality.audioResampler = 1;
  assert.equal(model.request(1, 2).audioResampler, 1);
  assert.equal(model.quality.snapshot().audioResampler, 1);
  console.info('Batch operations: waiting order, failure policy, partial exports, retry and GPU options passed');
}
async function testPreviewDisposal() {
  const { TranscodePreviewController } = load('../controller/TranscodePreviewController');
  const images = mocks['@kit.ImageKit'].image;
  const originalCreate = images.createPixelMap;
  const originalPreview = preview;
  const controller = new TranscodePreviewController();
  const model = new TranscodeModel();
  model.analysis = status({ durationUs: 1000000, sourceFrameRate: 30 });
  model.previewState.position = 100;
  assert.equal(model.previewTimeMs(), 966, 'The slider endpoint stays before the final frame interval');
  model.rangeEnabled = true; model.rangeStart = '0.2'; model.rangeEnd = '0.5';
  model.previewState.position = 0;
  assert.equal(model.previewTimeMs(), 200);
  model.previewState.position = 100;
  assert.equal(model.previewTimeMs(), 466);
  const first = deferred();
  const entered = deferred();
  let released = 0;
  let calls = 0;
  try {
    files.set('/source.mp4', { kind: 'file' });
    preview = async () => status({ previewWidth: 2, previewHeight: 2, previewRgba: new ArrayBuffer(16) });
    images.createPixelMap = async () => {
      if (++calls === 1) { entered.resolve(); return first.promise; }
      return { release: async () => { released++; } };
    };
    const loading = controller.load('/source.mp4', new TranscodeModel().request(0, 0), 'draft');
    await entered.promise;
    controller.clear();
    first.resolve({ release: async () => { released++; } });
    await loading;
    assert.equal(controller.processed, undefined);
    assert.equal(controller.original, undefined);
    assert.equal(released, 2, 'Late PixelMaps are released after disposal during bitmap creation');
    images.createPixelMap = async () => ({ release: async () => { released++; } });
    await controller.load('/source.mp4', new TranscodeModel().request(0, 0), 'current');
    assert(controller.processed && controller.original);
    controller.clear();
    await Promise.resolve();
    assert.equal(released, 4, 'Clearing a successful comparison releases both images');
  } finally { images.createPixelMap = originalCreate; preview = originalPreview; }
  console.info('Preview lifecycle: disposal during bitmap creation and paired image release passed');
}
async function testPreviewLoadFailures() {
  const { TranscodePreviewController } = load('../controller/TranscodePreviewController');
  const images = mocks['@kit.ImageKit'].image;
  const originalCreate = images.createPixelMap;
  const originalPreview = preview;
  const originalOpen = io.open;
  const originalClose = io.close;
  const controller = new TranscodePreviewController();
  const failure = new Error('Preview processing failed');
  let closed = 0;
  let released = 0;
  try {
    io.close = async () => { closed++; };
    io.open = async () => { throw failure; };
    await assert.rejects(controller.load('/source.mp4', {}, 'open'), error => error === failure);
    assert.equal(closed, 0, 'An unsuccessful open has no descriptor to close');
    io.open = originalOpen;
    preview = async () => { throw failure; };
    await assert.rejects(controller.load('/source.mp4', {}, 'decode'), error => error === failure);
    assert.equal(closed, 1, 'Decoder rejection still closes the source');
    preview = async () => status({ previewWidth: 2, previewHeight: 2, previewRgba: new ArrayBuffer(16) });
    let created = 0;
    images.createPixelMap = async () => {
      if (++created === 2) { throw failure; }
      return { release: async () => { released++; } };
    };
    await assert.rejects(controller.load('/source.mp4', {}, 'bitmap'), error => error === failure);
    assert.equal(closed, 2, 'Bitmap rejection still closes the source');
    assert.equal(released, 1, 'A partially created pair releases the first PixelMap');
    assert.equal(controller.processed, undefined);
    assert.equal(controller.original, undefined);
  } finally {
    images.createPixelMap = originalCreate; preview = originalPreview;
    io.open = originalOpen; io.close = originalClose;
  }
  console.info('Preview cleanup: open, decoder and bitmap errors retain their original result');
}

async function testPreviewEarlyCancellation() {
  const { TranscodePreviewController } = load('../controller/TranscodePreviewController');
  const controller = new TranscodePreviewController();
  const originalOpen = io.open;
  const originalClose = io.close;
  const originalPreview = preview;
  let closed = 0;
  let decoded = 0;
  try {
    const opening = deferred();
    io.open = async () => opening.promise;
    io.close = async () => { closed++; };
    preview = async () => { decoded++; return status(); };
    const staleOpen = controller.load('/source.mp4', {}, 'stale open');
    controller.clear();
    opening.resolve({ fd: '/source.mp4' });
    await staleOpen;
    assert.equal(closed, 1, 'Cancellation while opening still closes the acquired source');
    assert.equal(decoded, 0, 'Cancellation before decoding skips Native preview');
    io.open = originalOpen;
    const decoding = deferred();
    const entered = deferred();
    preview = () => { entered.resolve(); return decoding.promise; };
    const staleDecode = controller.load('/source.mp4', {}, 'stale decode');
    await entered.promise;
    controller.clear();
    decoding.resolve(status());
    await staleDecode;
    assert.equal(closed, 2, 'Cancellation while decoding still closes the source');
    assert.equal(controller.processed, undefined);
    assert.equal(controller.original, undefined);
  } finally { io.open = originalOpen; io.close = originalClose; preview = originalPreview; }
  console.info('Preview cleanup: cancellation while opening and decoding passed');
}

async function testHistoryController() {
  const { TranscodeHistoryController } = load('../controller/TranscodeHistoryController');
  const { TranscodeFilesModel } = load('TranscodeFilesModel');
  const originalPage = TranscodeFilesModel.listPage;
  const originalUsage = TranscodeFilesModel.storageUsage;
  let held = deferred();
  let hold = true;
  TranscodeFilesModel.listPage = async (_directory, offset) => {
    if (hold) { return held.promise; }
    return { entries: [{ id: String(offset) }], nextOffset: offset + 1, hasMore: offset === 0 };
  };
  TranscodeFilesModel.storageUsage = async () => ({ bytes: 1234, orphanCount: 2 });
  try {
    const history = new TranscodeHistoryController();
    const stale = history.load('/files/transcodes');
    history.invalidate();
    hold = false;
    await history.load('/files/transcodes');
    held.resolve({ entries: [{ id: 'stale' }], nextOffset: 99, hasMore: false });
    await stale;
    assert.equal(history.entries[0].id, '0', 'Invalidated load cannot replace a fresh page');
    await history.load('/files/transcodes', true);
    assert.equal(history.entries.length, 2);
    assert.equal(history.hasMore, false);
    assert.equal(history.storageBytes, 1234);
    assert.equal(history.orphanCount, 2);
    held = deferred(); hold = true;
    const pending = history.refresh('/files/transcodes');
    history.dispose();
    held.resolve({ entries: [], nextOffset: 0, hasMore: false });
    await pending;
    assert.equal(history.entries.length, 2, 'Disposal rejects pending history updates');
    assert.equal(history.loading, false);
    const model = new TranscodeModel();
    held = deferred(); hold = true;
    const staleLoad = model.loadHistory(ui);
    model.dispose();
    model.activate();
    const fresh = deferred();
    TranscodeFilesModel.listPage = async () => fresh.promise;
    const freshLoad = model.loadHistory(ui);
    assert.equal(model.historyLoading, true, 'Activation permits another history request');
    held.resolve({ entries: [{ id: 'obsolete' }], nextOffset: 99, hasMore: false });
    await staleLoad;
    assert.equal(model.historyLoading, true, 'An obsolete request cannot clear the current loading state');
    fresh.resolve({ entries: [{ id: 'reactivated' }], nextOffset: 1, hasMore: false });
    await freshLoad;
    assert.equal(model.history[0].id, 'reactivated', 'Reactivated model accepts only the current result');
    assert.equal(model.historyLoading, false);
  } finally {
    TranscodeFilesModel.listPage = originalPage; TranscodeFilesModel.storageUsage = originalUsage;
  }
  console.info('History controller: page append, usage, stale requests and disposal passed');
}

async function testTaskSnapshot() {
  files.set('/private/snapshot.mp4', { kind: 'file' });
  const model = new TranscodeModel();
  model.sourceUri = '/private/snapshot.mp4';
  model.sourceTitle = 'snapshot.mp4';
  const entered = deferred();
  const gate = deferred();
  let before, submitted;
  inspect = async request => { before = { ...request }; entered.resolve(); return gate.promise; };
  start = async request => { submitted = { ...request }; return status(); };
  const pending = model.start(ui);
  await entered.promise;
  model.bitrateIndex = 3; model.rangeEnabled = true; model.rangeStart = '999'; model.quality.codecMode = 1;
  gate.resolve(status());
  await pending;
  assert.equal(submitted.bitrate, before.bitrate, 'Native request retains the preflight bitrate');
  assert.equal(submitted.startTimeMs, before.startTimeMs, 'Range validation uses the task snapshot');
  assert.equal(submitted.codecMode, before.codecMode, 'Scheduling retains the task snapshot');
  assert.match(model.activeEntry.configuration, /8 Mbps/);
  const serialized = JSON.parse(JSON.stringify(model.queue.items));
  assert.equal(TranscodeQueueModel.validated(serialized).length, serialized.length);
  const legacy = { id: 'queue_900_1', uri: 'source', title: 'old', options: [0, 0, 0, 2, 0, 0, 0],
    grayscale: false, state: 'waiting', progress: 0, resultPath: '' };
  const migrated = TranscodeQueueModel.validated([legacy])[0];
  assert.equal(migrated.settings.resizeMode, 0);
  assert.equal(migrated.options, undefined, 'New snapshots store named settings only');
  assert.equal(TranscodeQueueModel.validated([migrated]).length, 1);
  console.info('Task snapshot: preflight, Native request, report and legacy queue migration passed');
}

async function testAuxiliaryCloseFailure(mode) {
  const model = new TranscodeModel();
  model.sourceUri = '/private/auxiliary.mp4';
  files.set(model.sourceUri, { kind: 'file' });
  inspect = async () => status();
  preview = async () => status({ previewWidth: 2, previewHeight: 2, previewRgba: new ArrayBuffer(16) });
  io.close = async () => { throw Object.assign(Error('close unknown'), { code: 13900005 }); };
  await model[mode](ui);
  assert.equal(model.status.cleanupStage, 'files.close', mode + ' reports the cleanup stage');
  assert.equal(model.busy, false);
  assert.equal(model.inspecting, false);
  assert.equal(model.queue.paused, true);
  assert.match(model.notice, /transcode_close_unconfirmed/);
  assert.equal(MediaFileActivity.beginTranscode(), false);
  assert.equal(MediaFileActivity.beginLaunch(), false);
  assert.equal(MediaTaskCoordinator.busy(), true);
  console.info(mode + ': close failure retains the gate and reports restart guidance');
}

function testAuxiliaryCloseFailures() {
  const { spawnSync } = require('node:child_process');
  const modes = ['inspect', 'preview', 'preview-close-success', 'preview-close-decode',
    'preview-close-bitmap', 'preview-close-stale-open', 'preview-close-stale-bitmap'];
  for (const mode of modes) {
    const result = spawnSync(process.execPath, [__filename, process.argv[2], mode],
      { encoding: 'utf8', timeout: 20000 });
    assert.equal(result.status, 0, result.stdout + result.stderr);
    process.stdout.write(result.stdout);
  }
}

async function testPreviewCloseFailure(mode) {
  const { TranscodePreviewController } = load('../controller/TranscodePreviewController');
  const controller = new TranscodePreviewController();
  const failure = new Error('Preview processing failed');
  const stale = mode.includes('stale');
  const operationFails = mode === 'preview-close-decode' || mode === 'preview-close-bitmap';
  let closed = 0;
  let released = 0;
  let created = 0;
  files.set('/source.mp4', { kind: 'file' });
  io.open = async () => {
    if (mode === 'preview-close-stale-open') { controller.clear(); }
    return { fd: '/source.mp4' };
  };
  io.close = async () => {
    closed++;
    throw Object.assign(new Error('close unknown'), { code: 13900005 });
  };
  preview = async () => {
    if (mode === 'preview-close-decode') { throw failure; }
    return status({ previewWidth: 2, previewHeight: 2, previewRgba: new ArrayBuffer(16) });
  };
  mocks['@kit.ImageKit'].image.createPixelMap = async () => {
    if (++created === 2 && mode === 'preview-close-bitmap') { throw failure; }
    if (mode === 'preview-close-stale-bitmap') { controller.clear(); }
    return { release: async () => { released++; } };
  };
  await assert.rejects(controller.load('/source.mp4', {}, 'preview'), error =>
    operationFails ? error === failure : /Transcode file close unconfirmed/.test(error.message));
  assert.equal(closed, 1, 'Every opened source is closed once, including stale results');
  assert.equal(MediaFileActivity.isCleanupUnconfirmed(), true);
  assert.equal(MediaFileActivity.beginTranscode(), false);
  assert.equal(MediaFileActivity.beginLaunch(), false);
  if (stale || operationFails) {
    assert.equal(controller.processed, undefined);
    assert.equal(controller.original, undefined);
    assert.equal(released, created - (mode === 'preview-close-bitmap' ? 1 : 0));
  }
  controller.clear();
  console.info(mode + ': cleanup blocks further tasks and preserves the operation error');
}

async function testTranscodeCloseFailure() {
  const { TranscodeFileCloser } = load('../controller/TranscodeFileCloser');
  const originalClose = io.close;
  let calls = 0;
  const entered = deferred();
  const gate = deferred();
  io.close = async () => { calls++; entered.resolve(); await gate.promise; };
  const firstClose = TranscodeFileCloser.close({ fd: 9099 });
  await entered.promise;
  const secondClose = TranscodeFileCloser.close({ fd: 9099 });
  assert.equal(calls, 1, 'Concurrent cleanup shares the same close operation');
  gate.resolve();
  assert.deepEqual(await Promise.all([firstClose, secondClose]), [true, true]);
  io.close = async () => { calls++; throw Object.assign(Error('invalid descriptor'), { code: 13900008 }); };
  assert.equal(await TranscodeFileCloser.close({ fd: 9100 }), true, 'EBADF confirms closure');
  assert.equal(MediaTaskCoordinator.busy(), false);
  files.set('/private/close.mp4', { kind: 'file' });
  const model = new TranscodeModel(); model.sourceUri = '/private/close.mp4';
  inspect = async () => status(); start = async () => status();
  io.close = async file => {
    const fd = file?.fd ?? file;
    if (fd === '/private/close.mp4') {
      calls++; throw Object.assign(Error('close result unknown'), { code: 13900005 });
    }
    return originalClose(file);
  };
  try {
    const previous = (await MediaSessionStore.pending(ui.getHostContext())).length;
    await model.start(ui);
    assert.equal(model.status.state, 4);
    assert.equal(model.status.cleanupStage, 'files.close');
    assert.equal((await MediaSessionStore.pending(ui.getHostContext())).length, previous + 1,
      'Unconfirmed cleanup retains the pending session');
    assert.equal(model.busy, false, 'UI completes while the resource gate remains held');
    assert.equal(model.queue.paused, true);
    assert.equal(MediaFileActivity.beginTranscode(), false);
    assert.equal(MediaFileActivity.beginLaunch(), false);
    assert.equal(MediaTaskCoordinator.busy(), true);
    let inspections = 0;
    inspect = async () => { inspections++; return status(); };
    const blocked = new TranscodeModel(); blocked.sourceUri = '/private/close.mp4';
    await blocked.inspect(ui);
    assert.equal(inspections, 0, 'Source inspection respects unconfirmed cleanup');
    const beforeRetry = calls;
    assert.equal(await TranscodeFileCloser.close({ fd: '/private/close.mp4' }), false);
    assert.equal(calls, beforeRetry, 'Unconfirmed descriptors are never retried');
  } finally { io.close = originalClose; }
  console.info('Transcode cleanup: EBADF, retained File, blocked lease and no repeated close passed');
}

(process.argv[3] ? (process.argv[3].startsWith('preview-close-') ?
  testPreviewCloseFailure(process.argv[3]) : testAuxiliaryCloseFailure(process.argv[3])) : main()
  .then(testQualityProfiles)
  .then(testBatchOperations)
  .then(testPreviewDisposal)
  .then(testPreviewLoadFailures)
  .then(testPreviewEarlyCancellation)
  .then(testHistoryController)
  .then(testTaskSnapshot)
  .then(testAuxiliaryCloseFailures)
  .then(testTranscodeCloseFailure))
  .catch(error => { console.error(error); process.exitCode = 1; });
