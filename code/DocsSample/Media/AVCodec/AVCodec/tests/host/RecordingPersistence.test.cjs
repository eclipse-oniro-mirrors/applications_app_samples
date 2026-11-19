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
const root = path.resolve(__dirname, '../../entry/src/main/ets');
function deferred() {
  let resolve; const promise = new Promise(done => { resolve = done; }); return { promise, resolve };
}
function loader(mocks) {
  const cache = new Map();
  function load(relative) {
    const file = path.resolve(root, relative);
    if (cache.has(file)) return cache.get(file).exports;
    const module = { exports: {} }; cache.set(file, module);
    const compiled = ts.transpileModule(fs.readFileSync(file, 'utf8'), {
      compilerOptions: { module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2020 }
    }).outputText;
    vm.runInNewContext(compiled, { module, exports: module.exports,
      require(name) {
        if (name in mocks) return mocks[name];
        if (name.startsWith('.')) return load(path.resolve(path.dirname(file), name + '.ets'));
        throw Error('Unexpected dependency: ' + name);
      } }, { filename: file });
    return module.exports;
  }
  return load;
}
function historyFixture() {
  const f = { disk: '[]', cache: '[]', failOpen: false, failRead: false, puts: 0, flushes: 0,
    putFailures: 0, flushFailures: 0, readGate: undefined, writeGate: undefined, events: [],
    backups: new Map(), backupCache: new Map(), backupPutFailures: 0, backupFlushFailures: 0,
    backupCollisions: 0 };
  const prefs = {
    async has(key) {
      if (f.backupCollisions-- > 0) { f.backups.set(key, 'previous backup'); return true; }
      return f.backupCache.has(key) || f.backups.has(key);
    },
    async get(key, fallback) {
      if (f.readGate) await f.readGate.promise; if (f.failRead) throw Error('read failed');
      return key === 'entries' ? f.disk : f.backupCache.get(key) ?? f.backups.get(key) ?? fallback;
    },
    async put(key, value) {
      if (key !== 'entries') {
        f.events.push('backup.put');
        if (f.backupPutFailures-- > 0) throw Error('backup put failed');
        f.backupCache.set(key, value); return;
      }
      f.events.push('put'); f.puts++;
      if (f.writeGate) { const gate = f.writeGate; f.writeGate = undefined; gate.entered.resolve(); await gate.release.promise; }
      if (f.putFailures-- > 0) throw Error('put failed'); f.cache = value;
    },
    async flush() {
      if (f.backupCache.size > 0) {
        f.events.push('backup.flush');
        if (f.backupFlushFailures-- > 0) throw Error('backup flush failed');
        for (const [key, snapshot] of f.backupCache) f.backups.set(key, snapshot);
        f.backupCache.clear(); return;
      }
      f.events.push('flush'); f.flushes++; if (f.flushFailures-- > 0) throw Error('flush failed'); f.disk = f.cache;
    }
  };
  const load = loader({
    '@kit.ArkData': { preferences: { async getPreferences() { if (f.failOpen) throw Error('open failed'); return prefs; } } },
    '../common/utils/Logger': { default: { warn: message => f.events.push(message) } }
  });
  f.Model = load('model/RecordingHistoryModel.ets').RecordingHistoryModel;
  f.Segments = load('controller/RecorderSegmentController.ets').RecorderSegmentController;
  f.context = { filesDir: '/history' };
  f.add = (model, id, group = '') => model.add('file://' + id, id + '.mp4', '', 100, 1, id, true, group);
  f.ids = () => JSON.parse(f.disk).map(x => x.sessionId);
  return f;
}
async function testCorruptHistoryRecovery() {
  for (const snapshot of ['{broken', '{}', 'null', '42']) {
    const f = historyFixture(); f.disk = snapshot;
    const a = new f.Model(), b = new f.Model();
    console.info('Recording history: invalid JSON or root is backed up before replacement: ' + snapshot);
    await Promise.all([a.load(f.context), b.load(f.context)]);
    assert([...f.backups.values()].includes(snapshot));
    assert.equal(f.disk, snapshot);
    assert.equal(await f.add(a, 'recovered'), true);
    assert.deepEqual(f.ids(), ['recovered']);
    assert(f.events.indexOf('backup.flush') < f.events.indexOf('put'));
    await b.load(f.context);
    assert.equal(b.getEntries()[0].sessionId, 'recovered');
  }
  for (const stage of ['Put', 'Flush']) {
    const f = historyFixture(); f.disk = '{preserve'; f['backup' + stage + 'Failures'] = 20;
    const a = new f.Model(); await a.load(f.context);
    console.info('Recording history: failed backup ' + stage + ' blocks official writes and preserves pending records');
    assert.equal(await f.add(a, 'pending', 'group'), false);
    assert.equal(await a.flush(), false);
    assert.equal(f.puts, 0); assert.equal(f.disk, '{preserve'); assert.equal(f.backups.size, 0);
    f['backup' + stage + 'Failures'] = 0;
    const b = new f.Model(); await b.load(f.context);
    assert([...f.backups.values()].includes('{preserve'));
    assert.equal(await b.flush(), true);
    assert.deepEqual(f.ids(), ['group']);
    assert.equal(b.getEntries()[0].segments.length, 1);
  }
  const f = historyFixture(), a = new f.Model(); await a.load(f.context);
  await f.add(a, 'known'); f.disk = '{later damage';
  await a.load(f.context);
  console.info('Recording history: recovery retains previously loaded entries and does not overwrite earlier backups');
  assert.equal(a.getEntries()[0].sessionId, 'known');
  assert.equal(await f.add(a, 'next'), true);
  assert.deepEqual(f.ids(), ['next', 'known']);
  const firstBackup = [...f.backups.entries()][0];
  f.disk = '{different damage'; await a.load(f.context);
  assert.equal(f.backups.get(firstBackup[0]), firstBackup[1]);
  assert([...f.backups.values()].includes('{different damage'));
  const collision = historyFixture(); collision.disk = '{collision'; collision.backupCollisions = 1;
  const recovered = new collision.Model(); await recovered.load(collision.context);
  console.info('Recording history: an existing backup key is skipped without overwriting its contents');
  assert([...collision.backups.values()].includes('previous backup'));
  assert([...collision.backups.values()].includes('{collision'));
  assert.equal(await collision.add(recovered, 'new'), true);
}
async function testCorruptBackupReuse() {
  const f = historyFixture(); f.disk = '{same damage';
  const a = new f.Model(), b = new f.Model();
  for (let i = 0; i < 10; i++) { await (i % 2 ? a : b).load(f.context); }
  assert.equal(f.backups.size, 1, 'Models sharing storage reuse a confirmed backup');
  assert.equal(f.events.filter(event => event === 'backup.flush').length, 1);
  assert.equal(f.puts, 0); assert.equal(f.disk, '{same damage');
  const original = [...f.backups.entries()][0];
  f.disk = '{new damage'; await a.load(f.context);
  assert.equal(f.backups.size, 2); assert.equal(f.backups.get(original[0]), original[1]);
  let key = [...f.backups.keys()].at(-1); f.backups.delete(key);
  await b.load(f.context);
  assert.equal(f.events.filter(event => event === 'backup.flush').length, 3, 'A missing backup is recreated');
  key = [...f.backups.keys()].at(-1); f.backups.set(key, 'changed backup');
  await a.load(f.context);
  assert.equal(f.events.filter(event => event === 'backup.flush').length, 4, 'A changed backup is recreated');
  assert.equal(f.backups.get(key), 'changed backup', 'Existing backup contents remain untouched');
  await b.load(f.context);
  assert.equal(f.events.filter(event => event === 'backup.flush').length, 4);
  for (const stage of ['Put', 'Flush']) {
    const failed = historyFixture(); failed.disk = '{failed backup'; failed['backup' + stage + 'Failures'] = 1;
    const model = new failed.Model(); await model.load(failed.context);
    assert.equal(failed.backups.size, 0); assert.equal(failed.puts, 0);
    await model.load(failed.context);
    assert([...failed.backups.values()].includes(failed.disk), 'Failed backups are retried before reuse');
    const writes = failed.events.filter(event => event === 'backup.put').length;
    await model.load(failed.context);
    assert.equal(failed.events.filter(event => event === 'backup.put').length, writes);
  }
  console.info('Recording history: repeated refresh, shared backups, changed contents and backup retry passed');
}
async function testRecordingReadFailureAfterLoad() {
  for (const stage of ['Open', 'Read']) {
    const f = historyFixture(), a = new f.Model(); await a.load(f.context);
    await f.add(a, 'known'); const before = f.puts;
    f['fail' + stage] = true; await a.load(f.context);
    console.info('Recording history: failed reload ' + stage + ' blocks writes and retains known records');
    assert.equal(await f.add(a, 'pending'), false);
    assert.equal(await a.flush(), false);
    assert.deepEqual(f.ids(), ['known']); assert.equal(f.puts, before);
    assert.equal(a.getEntries().some(item => item.sessionId === 'known'), true);
    f['fail' + stage] = false; await a.load(f.context);
    assert.deepEqual(f.ids(), ['pending', 'known']);
  }
}
async function testSegmentSaveRecovery() {
  for (const stage of ['put', 'flush']) {
    const f = historyFixture(), history = new f.Model(), segments = new f.Segments();
    await history.load(f.context); f[stage + 'Failures'] = 20;
    const add = async id => {
      const saved = await f.add(history, id, 'group');
      const result = { sessionId: id, recordedAt: 100, durationSeconds: 1, title: id,
        primaryUri: 'file://' + id, secondaryUri: '', complete: true, historySaved: saved };
      segments.add(result); return result;
    };
    await add('part1');
    console.info('Recording segments: a successful ' + stage + ' recovery clears the stale unsaved status');
    assert.equal(segments.result('group').historySaved, false);
    segments.add({ sessionId: 'legacy', recordedAt: 100, durationSeconds: 0, title: 'legacy',
      primaryUri: '', secondaryUri: '', complete: true });
    assert.equal(segments.result('group').historySaved, false);
    f[stage + 'Failures'] = 0; const latest = await add('part2');
    assert.equal(segments.result('group').historySaved, true);
    assert.equal(JSON.parse(f.disk)[0].segments.length, 2);
    segments.add({ ...latest, historySaved: false });
    assert.equal(segments.result('group').historySaved, true);
    f[stage + 'Failures'] = 20; await add('part3');
    assert.equal(segments.result('group').historySaved, false);
  }
}
async function testSharedHistory() {
  const f = historyFixture(), a = new f.Model(), b = new f.Model();
  await Promise.all([a.load(f.context), b.load(f.context)]);
  console.info('Recording history: concurrent instances and queued writes');
  const gate = { entered: deferred(), release: deferred() }; f.writeGate = gate;
  const first = f.add(a, 'a'); await gate.entered.promise;
  const second = f.add(b, 'b'); const refresh = b.load(f.context);
  assert.equal(f.puts, 1); gate.release.resolve();
  assert.equal(await first, true); assert.equal(await second, true); await refresh;
  assert.deepEqual(f.ids(), ['b', 'a']);
  const copy = a.getEntries(); copy[0].title = 'mutated';
  assert.equal(a.getEntries()[0].title, 'b.mp4');
  await Promise.all([f.add(a, 'part1', 'group'), f.add(b, 'part2', 'group')]);
  assert.equal(await a.markIncomplete('group'), true);
  const group = JSON.parse(f.disk).find(x => x.sessionId === 'group');
  assert.equal(group.complete, false); assert.equal(group.segments.length, 2);
}
async function testHistoryFailures() {
  for (const stage of ['put', 'flush']) {
    const f = historyFixture(), a = new f.Model(); await a.load(f.context);
    console.info('Recording history: bounded ' + stage + ' failures and recovery');
    f[stage + 'Failures'] = 1;
    assert.equal(await f.add(a, 'transient'), true);
    assert.equal(f[stage === 'put' ? 'puts' : 'flushes'], 2);
    f[stage + 'Failures'] = 100;
    const before = f[stage === 'put' ? 'puts' : 'flushes'];
    assert.equal(await f.add(a, 'pending'), false);
    assert.equal(f[stage === 'put' ? 'puts' : 'flushes'] - before, 2);
    assert.equal(f.ids().includes('pending'), false);
    assert.equal(a.getEntries().some(x => x.sessionId === 'pending'), true);
    const b = new f.Model(); await b.load(f.context);
    assert.equal(b.getEntries().some(x => x.sessionId === 'pending'), true);
    f[stage + 'Failures'] = 0; assert.equal(await b.flush(), true);
    assert.deepEqual(f.ids(), ['pending', 'transient']);
    const puts = f.puts; assert.equal(await b.flush(), true); assert.equal(f.puts, puts);
  }
  for (const stage of ['Open', 'Read']) {
    const f = historyFixture();
    f.disk = JSON.stringify([{ uri:'file://old',title:'old.mp4',secondaryUri:'',recordedAt:1,durationSeconds:1,sessionId:'old' }]);
    const a = new f.Model(); f['fail' + stage] = true; await a.load(f.context);
    console.info('Recording history: first ' + stage + ' failure retains pending changes without overwriting disk');
    assert.equal(await f.add(a, 'new'), false); assert.deepEqual(f.ids(), ['old']);
    f['fail' + stage] = false; const b = new f.Model(); await b.load(f.context);
    assert.deepEqual(f.ids(), ['new', 'old']);
  }
  const f = historyFixture(), a = new f.Model(); f.readGate = deferred();
  const loading = a.load(f.context); const adding = f.add(a, 'late');
  console.info('Recording history: delayed load precedes queued mutation');
  assert.equal(f.puts, 0); f.readGate.resolve(); await loading; assert.equal(await adding, true);
  assert.deepEqual(f.ids(), ['late']);
}
function sessionFixture() {
  const f = { events: [], closeErrors: new Map(), frames: 0, failure: '', started: false, saved: true, released: true,
    startResult: true, history: [], closeCalls: [] };
  const lease = { id: 'recording-test', kind: 'recording' };
  const api = {
    getDiagnostics: () => ({ sessionId: 'recording-test', endReason: 'user_stop', failure: { stage: f.failure },
      timeline: f.released ? [{ stage:'native.released' }] : [],
      primary: { frames:f.frames,fileBytes:f.frames ? 100 : 0,width:1920,height:1080 },
      secondary: { frames:0,fileBytes:0,width:0,height:0 } }),
    markStage: (id, stage) => f.events.push(stage), startNative: () => f.startResult,
    stopBeginNative: async () => f.events.push('native.stop.begin'),
    stopEndNative: async () => f.events.push('native.stop.end')
  };
  const load = loader({
    'librecorder.so': { default: api },
    '@kit.CoreFileKit': { fileIo: { async close(fd) { f.closeCalls.push(fd); if (f.closeErrors.has(fd)) throw f.closeErrors.get(fd); } } },
    '../common/utils/Logger': { default: { warn() {}, error() {} } },
    '../model/MediaTaskCoordinator': { MediaTaskCoordinator: { current: () => lease, running() {}, cancelling() {},
      release: () => f.events.push('lease.release') } },
    '../model/MediaSessionStore': { MediaSessionStore: { finish: async () => f.events.push('journal.finish') } },
    '../model/RecordingClock': { RecordingClock: class { start() { f.started = true; } seconds() { return f.started ? 1 : 0; } } },
    './RecordingMetadataReader': { RecordingMetadataReader: { validate: async () => { f.events.push('metadata'); return {}; } } },
    '../model/RecordingHistoryModel': { RecordingHistoryModel: class { async load() {} async add(...args) { f.history.push(args); return f.saved; } } }
  });
  f.Session = load('controller/RecordingSessionController.ets').RecordingSessionController;
  f.Closer = load('controller/RecordingFileCloser.ets').RecordingFileCloser;
  f.data = () => ({ outputfd:11,secondaryOutputfd:12,outputUri:'file://primary',secondaryOutputUri:'',
    outputTitle:'video.mp4',recordAudio:true,enableDualOutput:false });
  f.finish = (session, data = f.data()) => session.finish({}, data, async()=>{}, async()=>{});
  return f;
}
async function testCancellationAndFailures() {
  const f = sessionFixture();
  console.info('Recording finish: preview cancellation does not consume history capacity');
  for (let i=0;i<35;i++) { const s=new f.Session(); s.ready(); assert.equal(await f.finish(s), undefined); }
  assert.equal(f.history.length, 0); assert.equal(f.events.includes('metadata'), false);
  console.info('Recording finish: attempted start, camera failure and partial output remain visible');
  const attempt = new f.Session(); attempt.ready(); f.startResult=false; assert.equal(attempt.start(), false);
  assert.equal((await f.finish(attempt)).complete, false); assert.equal(f.history.length, 1);
  const camera = new f.Session(); camera.mark('camera.failed','prepare_failed');
  assert.equal((await f.finish(camera)).complete, false); assert.equal(f.history.length, 2);
  f.frames=5; f.saved=false; const normal=new f.Session(); normal.ready(); f.startResult=true; normal.start();
  const result=await f.finish(normal); assert.equal(result.complete,true); assert.equal(result.historySaved,false);
  assert.equal(f.events.includes('history.save_failed'),true);
}
async function testCloseFailures() {
  for (const fd of [11,12]) {
    const f=sessionFixture(); f.frames=5; f.closeErrors.set(fd,{code:13900005}); const data=f.data();
    console.info('Recording close: unconfirmed fd=' + fd + ' retains ownership without retry');
    const result=await f.finish(new f.Session(),data);
    assert.equal(result.cleanupPending,true); assert.equal(result.complete,false);
    assert.equal(fd===11?data.outputfd:data.secondaryOutputfd,fd);
    assert.equal(fd===11?data.secondaryOutputfd:data.outputfd,-1);
    assert.equal(f.events.includes('lease.release'),false); assert.equal(f.events.includes('journal.finish'),false);
    assert.equal(await f.Closer.close(fd),false); assert.equal(f.closeCalls.filter(x=>x===fd).length,1);
  }
  const f=sessionFixture(); f.frames=5; f.closeErrors.set(11,{code:13900008}); const data=f.data();
  console.info('Recording close: EBADF is already closed and Native ownership must be confirmed');
  assert.equal((await f.finish(new f.Session(),data)).cleanupPending,false); assert.equal(data.outputfd,-1);
  const held=sessionFixture(); held.released=false; const heldData=held.data();
  await assert.rejects(()=>held.finish(new held.Session(),heldData),/release was not confirmed/);
  assert.equal(heldData.outputfd,11); assert.equal(held.closeCalls.length,0);
}
(async()=>{
  await testSharedHistory(); await testHistoryFailures(); await testCorruptHistoryRecovery();
  await testCorruptBackupReuse();
  await testRecordingReadFailureAfterLoad();
  await testSegmentSaveRecovery(); await testCancellationAndFailures(); await testCloseFailures();
  console.info('Recording persistence: shared writes, bounded retry, cancellation and descriptor failures passed');
})().catch(error=>{console.error(error);process.exitCode=1;});
