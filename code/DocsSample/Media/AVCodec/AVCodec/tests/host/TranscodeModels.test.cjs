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
  access: async file => files.has(file), mkdir: async file => { files.set(file, { kind: 'dir' }); },
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
      if (name === './RecordingReportStore') {
        return { RecordingReportStore: { writeAll: async (fd, value) => { files.get(fd).text = value; } } };
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
async function main() {
  files.set('/private/source.mp4', { kind: 'file' });
  await testInspection();
  await testActivity();
  await testHistory();
  console.log('Transcode models: inspection races, resource lease, failure/cancel cleanup, reports and history passed');
}
main().catch(error => { console.error(error); process.exitCode = 1; });
