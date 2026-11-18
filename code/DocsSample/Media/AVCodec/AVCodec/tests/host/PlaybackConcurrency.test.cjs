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

function deferred() {
  let resolve;
  let reject;
  const promise = new Promise((done, fail) => { resolve = done; reject = fail; });
  return { promise, resolve, reject };
}

function load(relative, mocks, globals = {}) {
  const file = path.join(sourceRoot, relative);
  const compiled = ts.transpileModule(fs.readFileSync(file, 'utf8'), {
    compilerOptions: { module: ts.ModuleKind.CommonJS, target: ts.ScriptTarget.ES2020 }
  });
  assert.equal(compiled.diagnostics?.length ?? 0, 0);
  const module = { exports: {} };
  vm.runInNewContext(compiled.outputText, {
    module, exports: module.exports, Date, Number, Math, JSON, Set, ...globals,
    require(name) {
      assert(mocks[name], 'Unexpected dependency: ' + name);
      return mocks[name];
    }
  }, { filename: file });
  return module.exports;
}

async function testHistory() {
  let saved = '[]';
  let failWrite = false;
  let failFlush = false;
  let writes = 0;
  let active = 0;
  let maxActive = 0;
  let hold;
  const warnings = [];
  const store = {
    get: async () => saved,
    async put(key, value) {
      writes++;
      active++;
      maxActive = Math.max(maxActive, active);
      try {
        if (hold) {
          const gate = hold; hold = undefined; gate.entered.resolve(); await gate.release.promise;
        }
        if (failWrite) { throw Error('write rejected'); }
        saved = value;
      } finally { active--; }
    },
    async flush() { if (failFlush) { throw Error('flush rejected'); } }
  };
  const { PlaybackHistoryModel } = load('model/PlaybackHistoryModel.ets', {
    '@kit.ArkData': { preferences: { getPreferences: async () => store } },
    '../common/utils/Logger': { default: { warn: (tag, message) => warnings.push(message) } }
  });
  const history = new PlaybackHistoryModel();
  await history.load({});
  const gate = { entered: deferred(), release: deferred() }; hold = gate;
  const first = history.update('file://one', 'one', 1_000_000, 60_000_000);
  await gate.entered.promise;
  const middle = history.update('file://one', 'one', 2_000_000, 60_000_000);
  const last = history.update('file://one', 'one', 3_000_000, 60_000_000);
  let flushed = false;
  const finalFlush = history.flush().then(() => { flushed = true; });
  await Promise.resolve();
  assert.equal(flushed, false, 'Final save waits for an in-flight write');
  gate.release.resolve();
  await Promise.all([first, middle, last, finalFlush]);
  assert.equal(maxActive, 1, 'History writes must remain serial');
  assert.equal(writes, 2, 'Superseded snapshots do not write');
  assert.equal(JSON.parse(saved)[0].positionUs, 3_000_000);
  const pending = history.update('file://one', 'one', 4_000_000, 60_000_000);
  await history.markCompleted('file://one');
  await pending;
  assert.equal(JSON.parse(saved)[0].positionUs, 0, 'Completion supersedes an older progress save');
  for (const failure of ['put', 'flush']) {
    failWrite = failure === 'put'; failFlush = failure === 'flush';
    await history.update('file://one', 'one', 5_000_000, 60_000_000);
    failWrite = false; failFlush = false;
    await history.update('file://one', 'one', 6_000_000, 60_000_000, true);
    assert.equal(JSON.parse(saved)[0].positionUs, 6_000_000, 'A failed save does not poison later writes');
  }
  assert(warnings.some(message => message.includes('write rejected')));
  assert(warnings.some(message => message.includes('flush rejected')));
  const entry = (uri, updatedAt, positionUs = 1) => ({ uri, title: uri, positionUs, durationUs: 100, updatedAt });
  saved = JSON.stringify([null, 42, 'bad', {}, entry('', 50), entry('duplicate', 2),
    entry('duplicate', 3), entry('clamped', 4, -5), ...Array.from({ length: 24 }, (_, i) => entry('item-' + i, 100 + i))]);
  await history.load({});
  assert.equal(history.getEntries().length, 20);
  assert.equal(history.getEntries()[0].uri, 'item-23');
  saved = JSON.stringify([null, entry('duplicate', 2), entry('duplicate', 3), entry('clamped', 4, -5)]);
  await history.load({});
  assert.equal(history.getEntries().length, 2, 'Malformed records do not discard valid records');
  assert.equal(history.getEntries().find(item => item.uri === 'duplicate').updatedAt, 3);
  assert.equal(history.getEntries().find(item => item.uri === 'clamped').positionUs, 0);
  for (const invalid of ['{}', 'null', 'broken']) {
    saved = invalid; await history.load({});
    console.info('Playback history: malformed root preserves known entries', invalid, history.getEntries().length);
    assert.equal(history.getEntries().length, 2);
  }
  console.info('Playback history: serialized/coalesced writes, final flush, retry and isolated record validation passed');
}

function historyFixture() {
  const f = { saved: '[]', cached: '[]', writes: 0, opens: 0, failures: 0, failMethod: 'put', warnings: [],
    now: 10000, open: async () => {}, read: async value => value, put: async () => {} };
  class HistoryDate extends Date { static now() { return f.now; } }
  const store = {
    get: async () => f.read(f.saved),
    async put(key, snapshot) {
      f.writes++;
      await f.put();
      if (f.failMethod === 'put' && f.failures-- > 0) { throw Error('put rejected'); }
      f.cached = snapshot;
    },
    async flush() {
      if (f.failMethod === 'flush' && f.failures-- > 0) { throw Error('flush rejected'); }
      f.saved = f.cached;
    }
  };
  const { PlaybackHistoryModel } = load('model/PlaybackHistoryModel.ets', {
    '@kit.ArkData': { preferences: { async getPreferences() { f.opens++; await f.open(); return store; } } },
    '../common/utils/Logger': { default: { warn: (tag, message) => f.warnings.push(message) } }
  }, { Date: HistoryDate });
  return Object.assign(f, { history: new PlaybackHistoryModel() });
}

async function testHistoryInitializationAndFailures() {
  const entry = (uri, positionUs = 10) => ({ uri, title: uri, positionUs, durationUs: 100, updatedAt: 1 });
  for (const stage of ['open', 'read']) {
    const f = historyFixture();
    f.saved = JSON.stringify([entry('old')]);
    const entered = deferred(), release = deferred();
    f[stage] = async value => { entered.resolve(); await release.promise; return value; };
    const loading = f.history.load({});
    await entered.promise;
    const updating = f.history.update('new', 'new', 20, 100);
    let flushed = false;
    const flushing = f.history.flush().then(saved => { flushed = saved; });
    await Promise.resolve();
    assert.equal(f.writes, 0, 'Updates wait for history ' + stage);
    assert.equal(flushed, false);
    release.resolve();
    await loading;
    assert.equal(await updating, true);
    await flushing;
    assert.equal(flushed, true);
    assert.deepEqual(JSON.parse(f.saved).map(item => item.uri), ['new', 'old']);
    await f.history.update('next', 'next', 30, 100);
    assert(JSON.parse(f.saved).some(item => item.uri === 'new'), 'A later save retains the new record');
  }
  const completing = historyFixture();
  completing.saved = JSON.stringify([entry('old', 80)]);
  const entered = deferred(), release = deferred();
  completing.read = async value => { entered.resolve(); await release.promise; return value; };
  const loading = completing.history.load({});
  await entered.promise;
  const completed = completing.history.markCompleted('old');
  release.resolve(); await loading;
  assert.equal(await completed, true);
  assert.equal(JSON.parse(completing.saved)[0].positionUs, 0, 'Completion waits for initialization');

  const early = historyFixture();
  assert.equal(await early.history.update('early', 'early', 20, 100), false);
  early.saved = JSON.stringify([entry('stored')]);
  await early.history.load({});
  assert.deepEqual(JSON.parse(early.saved).map(item => item.uri), ['early', 'stored']);

  for (const method of ['put', 'flush']) {
    const f = historyFixture(); await f.history.load({}); f.failMethod = method; f.failures = 1;
    assert.equal(await f.history.update('one', 'one', 10, 100), true, 'Transient ' + method + ' failure retries');
    assert.equal(f.writes, 2);
    f.failures = 20;
    assert.equal(await f.history.update('one', 'one', 20, 100), false, 'Persistent failure is returned');
    assert.equal(f.writes, 4, 'Each save has at most two attempts');
    assert.equal(JSON.parse(f.saved)[0].positionUs, 10, 'Failed flush does not update durable data');
    assert.equal(await f.history.flush(), false);
    assert.equal(f.writes, 6, 'Final flush retries the pending snapshot with a bounded attempt count');
    f.failures = 0;
    assert.equal(await f.history.flush(), true, 'A later flush can persist without another update');
    assert.equal(JSON.parse(f.saved)[0].positionUs, 20);
    const writes = f.writes;
    assert.equal(await f.history.flush(), true); assert.equal(f.writes, writes, 'Clean flush does not write');
  }

  const reload = historyFixture(); await reload.history.load({});
  await reload.history.update('one', 'one', 10, 100);
  reload.failures = 20;
  assert.equal(await reload.history.update('one', 'one', 30, 100), false);
  await reload.history.load({});
  assert.equal(reload.history.getEntries()[0].positionUs, 30, 'Reload preserves dirty progress');
  reload.saved = 'broken'; await reload.history.load({});
  assert.equal(reload.history.getEntries()[0].positionUs, 30, 'Malformed storage preserves pending progress');
  reload.failures = 0; assert.equal(await reload.history.flush(), false, 'Unreadable storage blocks replacement');
  assert.equal(reload.saved, 'broken');
  reload.saved = '[]'; await reload.history.load({});
  assert.equal(await reload.history.flush(), true);
  assert.equal(JSON.parse(reload.saved)[0].positionUs, 30);

  const ordered = historyFixture();
  await Promise.all([ordered.history.load({}), ordered.history.update('ordered', 'ordered', 15, 100),
    ordered.history.load({}), ordered.history.markCompleted('ordered')]);
  assert.equal(JSON.parse(ordered.saved)[0].positionUs, 0, 'Repeated loads preserve update/completion order');
  console.info('Playback history: delayed initialization, pending completion, save results, bounded retry and dirty reload passed');
}

async function testFailedHistoryReadRecovery() {
  const old = { uri: 'old', title: 'old', positionUs: 10, durationUs: 100, updatedAt: 1 };
  for (const stage of ['open', 'read']) {
    const f = historyFixture(); f.saved = JSON.stringify([old]);
    f[stage] = async () => { throw Error('temporary ' + stage + ' failure'); };
    await f.history.load({});
    console.info('Playback history: failed first ' + stage + ' blocks writes until old records can be merged');
    assert.equal(await f.history.update('new', 'new', 20, 100), false);
    assert.equal(await f.history.markCompleted('new'), false);
    assert.equal(await f.history.flush(), false);
    assert.equal(f.writes, 0);
    assert.deepEqual(JSON.parse(f.saved), [old]);
    assert.equal(f.history.getEntries()[0].positionUs, 0);
    f[stage] = async value => value;
    await f.history.load({});
    assert.equal(await f.history.flush(), true);
    assert.deepEqual(JSON.parse(f.saved).map(item => item.uri), ['new', 'old']);
    assert.equal(JSON.parse(f.saved)[0].positionUs, 0);
  }
  const f = historyFixture(); f.saved = JSON.stringify([old]); await f.history.load({});
  f.read = async () => { throw Error('temporary reload failure'); };
  await f.history.load({});
  console.info('Playback history: failed reload retains known history and subsequent pending progress');
  assert.equal(f.history.getEntries()[0].uri, 'old');
  assert.equal(await f.history.update('new', 'new', 20, 100), false);
  assert.equal(f.writes, 0);
  f.read = async value => value; await f.history.load({});
  assert.deepEqual(JSON.parse(f.saved).map(item => item.uri), ['new', 'old']);
}

async function testAutomaticHistoryRecovery() {
  const old = { uri: 'old', title: 'old', positionUs: 10, durationUs: 100, updatedAt: 1 };
  for (const stage of ['open', 'read']) {
    const f = historyFixture(); f.saved = JSON.stringify([old]);
    f[stage] = async () => { throw Error('storage unavailable'); };
    await f.history.load({});
    for (let i = 0; i < 20; i++) { await f.history.update('new', 'new', i, 100); }
    assert.equal(f.opens, 1, 'Frequent progress updates do not retry within five seconds');
    f.now += 5000;
    await Promise.all(Array.from({ length: 10 }, () => f.history.update('new', 'new', 30, 100)));
    assert.equal(f.opens, 2, 'Concurrent progress updates share one failed reload');
    assert.equal(f.writes, 0); assert.deepEqual(JSON.parse(f.saved), [old]);
    f[stage] = async value => value; f.now += 4999;
    assert.equal(await f.history.update('new', 'new', 40, 100), false);
    assert.equal(f.opens, 2, 'A failed reload starts a new retry interval');
    f.now++;
    const entered = deferred(), release = deferred();
    f[stage] = async value => { entered.resolve(); await release.promise; return value; };
    const updates = Array.from({ length: 10 }, (_, i) => f.history.update('new', 'new', 50 + i, 100));
    await entered.promise; assert.equal(f.opens, 3); release.resolve(); await Promise.all(updates);
    assert.equal(f.opens, 3, 'Concurrent recovery opens storage once');
    assert.deepEqual(JSON.parse(f.saved).map(item => item.uri), ['new', 'old']);
    assert.equal(JSON.parse(f.saved)[0].positionUs, 59);
  }
  const immediate = historyFixture(); immediate.saved = JSON.stringify([old]);
  immediate.open = async () => { throw Error('temporarily unavailable'); };
  await immediate.history.load({}); await immediate.history.update('new', 'new', 20, 100);
  await immediate.history.markCompleted('new');
  immediate.open = async () => {};
  assert.equal(await immediate.history.flush(), true, 'Final flush retries before the five-second interval');
  assert.equal(immediate.opens, 2);
  assert.deepEqual(JSON.parse(immediate.saved).map(item => item.uri), ['new', 'old']);
  assert.equal(JSON.parse(immediate.saved)[0].positionUs, 0, 'Recovery retains completed progress');
  const complete = historyFixture(); complete.saved = JSON.stringify([old]);
  complete.open = async () => { throw Error('unavailable'); }; await complete.history.load({});
  complete.open = async () => {}; complete.now += 5000;
  assert.equal(await complete.history.markCompleted('old'), true, 'Completion can trigger recovery');
  assert.equal(JSON.parse(complete.saved)[0].positionUs, 0);
  for (const stored of [[], [old]]) {
    const f = historyFixture(); f.saved = JSON.stringify(stored);
    f.open = async () => { throw Error('unavailable'); }; await f.history.load({}); f.now += 5000;
    const entered = deferred(), release = deferred();
    f.open = async () => { entered.resolve(); await release.promise; };
    const updating = f.history.update('old', 'old', 50, 100); await entered.promise;
    const completing = f.history.markCompleted('old'); release.resolve();
    await Promise.all([updating, completing]); await f.history.flush();
    assert.equal(JSON.parse(f.saved)[0].positionUs, 0, 'Completion during recovery follows the pending update');
  }
  const noContext = historyFixture();
  await noContext.history.update('new', 'new', 20, 100); noContext.now += 10000;
  assert.equal(await noContext.history.flush(), false); assert.equal(noContext.opens, 0);
  console.info('Playback history: automatic reload, five-second throttling, concurrent recovery and immediate flush passed');
}

function checkEqual(actual, expected, message) {
  console.info('Playback history:', message, { actual, expected });
  assert.equal(actual, expected, message);
}

// Completion before the first readable snapshot must survive recovery and later replay.
async function testPendingHistoryCompletion() {
  const old = { uri: 'old', title: 'old', positionUs: 30, durationUs: 100, updatedAt: 1 };
  for (const stage of ['open', 'read', 'corrupt']) {
    for (const replay of [false, true]) {
      const f = historyFixture(); f.saved = stage === 'corrupt' ? '{}' : JSON.stringify([old]);
      if (stage !== 'corrupt') { f[stage] = async () => { throw Error('unavailable'); }; }
      await f.history.load({});
      checkEqual(await f.history.markCompleted('old'), false, stage + ': unread completion stays pending');
      checkEqual(f.writes, 0, 'An unread history is never replaced');
      if (replay) {
        checkEqual(await f.history.update('old', 'new replay', 50, 100), false, 'New replay stays pending');
      }
      f.saved = JSON.stringify([old]); f.open = async () => {}; f.read = async value => value;
      checkEqual(await f.history.flush(), true, 'Final flush recovers unread history');
      checkEqual(JSON.parse(f.saved)[0].positionUs, replay ? 50 : 0,
        'Recovery applies completion unless a later replay has replaced it');
    }
  }
  const unknown = historyFixture(); await unknown.history.load({});
  checkEqual(await unknown.history.markCompleted('short', 100), true, 'Completed duration creates missing history');
  checkEqual(JSON.parse(unknown.saved)[0].positionUs, 0, 'Short media is recorded as completed');
  checkEqual(JSON.parse(unknown.saved)[0].durationUs, 100, 'Completed snapshot supplies the actual duration');
  const delayed = historyFixture(); delayed.saved = JSON.stringify([old]);
  delayed.open = async () => { throw Error('unavailable'); }; await delayed.history.load({});
  await delayed.history.markCompleted('old'); delayed.open = async () => {};
  const entered = deferred(), release = deferred();
  delayed.read = async value => { entered.resolve(); await release.promise; return value; };
  const flushing = delayed.history.flush(); await entered.promise;
  const replaying = delayed.history.update('old', 'new replay', 60, 100); release.resolve();
  await Promise.all([flushing, replaying]); await delayed.history.flush();
  checkEqual(JSON.parse(delayed.saved)[0].positionUs, 60, 'Replay during read recovery supersedes old completion');
}

// Invalid roots block all writes, including final saves, until a valid array can be read.
async function testCorruptHistoryProtection() {
  const old = { uri: 'old', title: 'old', positionUs: 10, durationUs: 100, updatedAt: 1 };
  for (const root of ['{}', 'null', '42', '"text"', 'broken']) {
    for (const reloading of [false, true]) {
      const f = historyFixture();
      if (reloading) {
        f.saved = JSON.stringify([old]);
        await f.history.load({});
      }
      f.saved = root; await f.history.load({});
      checkEqual(f.history.getEntries().length, reloading ? 1 : 0, 'Unreadable history retains known entries');
      checkEqual(await f.history.update('new', 'new', 30, 100), false, 'Progress remains pending');
      checkEqual(await f.history.markCompleted('new'), false, 'Completion remains pending');
      checkEqual(await f.history.flush(), false, 'Final save cannot replace malformed text');
      checkEqual(f.saved, root, 'Original malformed text is unchanged');
      checkEqual(f.writes, 0, 'No storage write occurs after invalid root');
      checkEqual(f.history.getEntries().find(item => item.uri === 'new').positionUs, 0,
        'Completion is retained in memory');
      f.saved = JSON.stringify([old]);
      checkEqual(await f.history.flush(), true, 'A valid array permits recovery');
      checkEqual(JSON.parse(f.saved).find(item => item.uri === 'new').positionUs, 0,
        'Recovery persists pending completion');
      checkEqual(JSON.parse(f.saved).some(item => item.uri === 'old'), true, 'Recovery retains stored records');
    }
  }
}

// Frequent updates retain the latest position without retrying storage during backoff.
async function testHistorySaveBackoff() {
  for (const method of ['put', 'flush']) {
    const f = historyFixture(); await f.history.load({}); f.failMethod = method; f.failures = 100;
    for (let i = 0; i < 20; i++) {
      await f.history.update('one', 'one', i + 1, 100); f.now += 250;
    }
    checkEqual(f.writes, 2, method + ': twenty progress updates make only two write attempts');
    checkEqual(f.warnings.length, 2, method + ': backoff suppresses repeated warnings');
    checkEqual(f.history.getEntries()[0].positionUs, 20, 'Backoff coalesces the latest position in memory');
    f.failures = 0;
    checkEqual(await f.history.update('one', 'one', 21, 100), true, 'Progress retries at the backoff deadline');
    checkEqual(f.writes, 3, 'Only the latest snapshot is written after recovery');
    checkEqual(JSON.parse(f.saved)[0].positionUs, 21, 'Recovered snapshot contains the newest position');
    checkEqual(await f.history.update('one', 'one', 22, 100), true, 'Successful save clears backoff');

    f.failures = 100;
    await f.history.update('one', 'one', 30, 100);
    const failedWrites = f.writes;
    checkEqual(await f.history.update('one', 'one', 31, 100, true), false, 'Forced progress retries immediately');
    checkEqual(f.writes, failedWrites + 2, 'Forced progress bypasses backoff');
    checkEqual(await f.history.markCompleted('one'), false, 'Completion retries immediately');
    checkEqual(f.writes, failedWrites + 4, 'Completion bypasses backoff');
    checkEqual(await f.history.flush(), false, 'Final flush retries immediately');
    checkEqual(f.writes, failedWrites + 6, 'Final flush bypasses backoff');
    f.failures = 0;
    checkEqual(await f.history.flush(), true, 'Final flush recovers without another progress event');
    checkEqual(JSON.parse(f.saved)[0].positionUs, 0, 'Completion supersedes failed progress snapshots');
  }
  const f = historyFixture(); await f.history.load({}); f.failures = 100;
  const entered = deferred(), release = deferred();
  f.put = async () => { entered.resolve(); await release.promise; };
  const first = f.history.update('one', 'one', 10, 100); await entered.promise;
  const queued = Array.from({ length: 20 }, (_, i) => f.history.update('one', 'one', 20 + i, 100));
  await Promise.resolve(); release.resolve(); await Promise.all([first, ...queued]);
  checkEqual(f.writes, 1, 'Queued progress saves recheck backoff after the active write fails');
  checkEqual(f.history.getEntries()[0].positionUs, 39, 'Queued updates retain only the newest position');
  f.failures = 0;
  checkEqual(await f.history.flush(), true, 'Final flush drains the coalesced snapshot');
  checkEqual(JSON.parse(f.saved)[0].positionUs, 39, 'Final flush saves the newest queued position');
}

function sourceFixture(history = { update: async () => true, getEntries: () => [], load: async () => {} }) {
  const f = { active: true, path: null, plays: [], prompts: 0, mutations: 0, recent: [],
    documents: [], albums: [], permissions: [], dialogs: [], pendingTimers: new Map() };
  let timerId = 0;
  const { PlaybackQueueController } = load('controller/PlaybackQueueController.ets', {
    '../model/PlaybackModeModel': load('model/PlaybackModeModel.ets', {})
  }, { Observed: target => target });
  const queue = new PlaybackQueueController();
  const pickerRequest = requests => { const request = deferred(); requests.push(request); return request.promise; };
  const { PlaybackSourceController } = load('controller/PlaybackSourceController.ets', {
    '@kit.CoreFileKit': { picker: { DocumentSelectOptions: class {},
      DocumentViewPicker: class { select() { return pickerRequest(f.documents); } } } },
    '@kit.MediaLibraryKit': { photoAccessHelper: { PhotoViewMIMETypes: { VIDEO_TYPE: 'video' },
      PhotoViewPicker: class { select() { return pickerRequest(f.albums); } } } },
    '../model/PlaybackHistoryModel': { getPlaybackTitle: uri => uri },
    '../common/LocalizedText': { LocalizedText: { get: key => key } },
    '../common/utils/Logger': { default: { error() {} } },
    '../common/utils/MediaUtils': { getPickerSelectedIndex: index => index },
    './PlaybackUriAccessController': { PlaybackUriAccessController: { async persistDocumentUri() {
      if (f.permissions.length) { await f.permissions.shift().promise; }
      return true;
    } } }
  }, { $r: key => key, setTimeout(fn) { f.pendingTimers.set(++timerId, fn); return timerId; },
    clearTimeout(id) { f.pendingTimers.delete(id); } });
  const callbacks = { activatePlayer() {}, closeQueue() {}, stop() {},
    play: position => f.plays.push(position), isButtonEnabled: () => true, isStopping: () => false,
    isPageActive: () => f.active, getPath: () => f.path,
    setPath(uri) { f.path = uri; f.mutations++; },
    setRecentEntries(entries) { f.recent = entries; f.mutations++; },
    setQueueEntries() { f.mutations++; }, showNoMediaSelected() { f.prompts++; } };
  const controller = new PlaybackSourceController(() => ({ getHostContext: () => ({}),
    showTextPickerDialog: options => f.dialogs.push(options) }), queue, history, callbacks);
  return Object.assign(f, { controller, queue,
    runTimers() { const pending = [...f.pendingTimers.values()]; f.pendingTimers.clear(); pending.forEach(fn => fn()); } });
}

async function testCoordinatorBackoff() {
  const progress = historyFixture(); await progress.history.load({});
  const { PlaybackHistoryCoordinator } = load('controller/PlaybackHistoryCoordinator.ets', {
    '../model/PlaybackHistoryModel': { getPlaybackTitle: uri => uri },
    '../common/utils/Logger': { default: { warn() {} } }
  });
  const saving = new PlaybackHistoryCoordinator(progress.history, () => {});
  saving.activate('progress'); progress.failures = 20;
  await saving.persistProgress(3_000_000, 60_000_000);
  progress.failures = 0;
  await saving.persistProgress(3_500_000, 60_000_000);
  checkEqual(progress.writes, 2, 'Coordinator polling respects model failed-save backoff');
  await saving.persistProgress(3_000_000, 60_000_000, true);
  assert.equal(JSON.parse(progress.saved)[0].positionUs, 3_000_000, 'Forced stop save bypasses backoff');
  const writes = progress.writes;
  await saving.persistProgress(3_500_000, 60_000_000);
  assert.equal(progress.writes, writes, 'Successful save throttles nearby progress');
}

async function testSourceSelections() {
  const latest = sourceFixture();
  const older = latest.controller.selectDocument(), newer = latest.controller.selectDocument();
  latest.documents[1].resolve(['new']); await newer; latest.documents[0].resolve(['old']); await older;
  latest.runTimers();
  assert.equal(latest.path, 'new'); assert.equal(latest.plays.length, 1, 'Only the latest selection plays');

  for (const kind of ['document', 'album', 'queue']) {
    const f = sourceFixture();
    const request = kind === 'document' ? f.controller.selectDocument() :
      kind === 'album' ? f.controller.selectAlbum() : f.controller.selectQueueFiles();
    f.active = false; f.controller.cancelSelection(); f.active = true;
    const mutations = f.mutations;
    if (kind === 'album') { f.albums[0].resolve({ photoUris: ['late'] }); }
    else { f.documents[0].resolve(['late']); }
    await request; f.runTimers();
    assert.equal(f.mutations, mutations, 'No stale mutations after leaving and returning: ' + kind);
    assert.equal(f.plays.length, 0); assert.equal(f.prompts, 0);
  }
  for (const kind of ['document', 'queue']) {
    const f = sourceFixture(), permission = deferred(); f.permissions.push(permission);
    const request = kind === 'document' ? f.controller.selectDocument() : f.controller.selectQueueFiles();
    f.documents[0].resolve(['old']);
    while (f.permissions.length) { await Promise.resolve(); }
    f.controller.playRecentEntry({ uri: 'recent' });
    permission.resolve(); await request; f.runTimers();
    assert.equal(f.path, 'recent', 'Late permission result does not overwrite a recent selection');
    assert.equal(f.queue.paths.join(','), 'recent'); assert.equal(f.plays.length, 1);
  }
  const cross = sourceFixture();
  const doc = cross.controller.selectDocument(), album = cross.controller.selectAlbum();
  cross.albums[0].resolve({ photoUris: ['album'] }); await album;
  cross.documents[0].resolve(['document']); await doc; cross.runTimers();
  assert.equal(cross.path, 'album', 'Document and album share one selection generation');

  const staleError = sourceFixture();
  const rejected = staleError.controller.selectQueueFiles();
  staleError.controller.cancelSelection(); staleError.documents[0].reject(Error('cancelled'));
  await rejected; assert.equal(staleError.prompts, 0, 'Stale failures do not display a toast');

  const cleared = sourceFixture();
  const queued = cleared.controller.selectQueueFiles(); cleared.controller.clearQueue();
  cleared.documents[0].resolve(['late']); await queued;
  assert.equal(cleared.queue.paths.length, 0, 'Clearing the queue invalidates pending selections');

  const timers = sourceFixture();
  timers.controller.playRecording('recording');
  timers.controller.selectFile(); timers.runTimers();
  assert.equal(timers.plays.length, 0, 'A new picker cancels a scheduled playback');
  const oldDialog = timers.dialogs[0]; timers.controller.selectFile();
  oldDialog.onAccept({ index: 0 });
  assert.equal(timers.documents.length, 0, 'Stale source dialogs cannot open another picker');
  timers.controller.cancelSelection();
  timers.dialogs[1].onAccept({ index: 1 });
  assert.equal(timers.albums.length, 0, 'Leaving invalidates the source dialog');

  const active = sourceFixture();
  const selecting = active.controller.selectQueueFiles();
  active.documents[0].resolve(['one', 'two']); await selecting;
  assert.equal(active.queue.paths.join(','), 'one,two'); assert.deepEqual(active.plays, [0]);

  const historyGate = deferred();
  const leaving = sourceFixture({ load: () => historyGate.promise, getEntries: () => ['entry'] });
  const loading = leaving.controller.loadHistory(); leaving.controller.cancelSelection();
  historyGate.resolve(); await loading; assert.equal(leaving.mutations, 0, 'History load does not update a detached page');
  console.info('Playback source: stale picker/permission/dialog/timer callbacks, page re-entry and saved-position retry passed');
}

function sessionFixture() {
  const events = [];
  const sessions = [];
  let hold;
  let fail;
  let failListener;
  async function call(id, method, value) {
    events.push({ id, method, value });
    if (hold?.method === method) {
      const gate = hold; hold = undefined; gate.entered.resolve(); await gate.release.promise;
    }
    if (fail === method) { fail = undefined; throw Error('injected ' + method); }
  }
  const api = {
    SkipIntervals: { SECONDS_15: 15 },
    PlaybackState: { PLAYBACK_STATE_INITIAL: 0, PLAYBACK_STATE_PREPARE: 1, PLAYBACK_STATE_PLAY: 3,
      PLAYBACK_STATE_STOP: 4, PLAYBACK_STATE_PAUSE: 6 },
    async createAVSession(context, name, type) {
      const id = sessions.length;
      const listeners = new Map();
      const current = { id, type, listeners,
        on(event, handler) {
          if (event === failListener) { failListener = undefined; throw Error('injected listener registration'); }
          listeners.set(event, handler);
        },
        off: event => listeners.delete(event),
        setAVMetadata: data => call(id, 'metadata', data),
        setAVQueueItems: data => call(id, 'queue', data),
        setAVQueueTitle: data => call(id, 'title', data),
        setLaunchAbility: data => call(id, 'launch', data),
        activate: () => call(id, 'activate'), setAVPlaybackState: data => call(id, 'state', data),
        deactivate: () => call(id, 'deactivate'), destroy: () => call(id, 'destroy')
      };
      sessions.push(current); await call(id, 'create', type); return current;
    }
  };
  const { PlaybackSessionController } = load('controller/PlaybackSessionController.ets', {
    '@kit.AVSessionKit': { avSession: api },
    '@kit.AbilityKit': { wantAgent: { OperationType: { START_ABILITIES: 1 },
      WantAgentFlags: { UPDATE_PRESENT_FLAG: 1 }, getWantAgent: async () => ({}) } },
    '../common/utils/Logger': { default: { warn() {}, error() {} } }
  });
  return { controller: new PlaybackSessionController(), events, sessions,
    block(method) { hold = { method, entered: deferred(), release: deferred() }; return hold; },
    fail(method) { fail = method; },
    failListener(event) { failListener = event; } };
}

const context = { abilityInfo: { bundleName: 'test', name: 'Main' } };
const media = (title, hasVideo = true) => ({ assetId: title, title, queueTitle: title, durationMs: 60_000,
  hasVideo, queueTitles: [title], queueIndex: 0 });

async function testSessionListenerFailure() {
  for (const event of ['play', 'seek', 'setSpeed']) {
    const f = sessionFixture();
    f.failListener(event);
    await f.controller.start(context, media('failed'), {});
    checkEqual(f.events.filter(item => item.method === 'activate').length, 0,
      event + ': incomplete controls do not activate a session');
    checkEqual(f.events.filter(item => item.method === 'destroy').length, 1,
      event + ': a partial listener failure releases the session');
    checkEqual(f.sessions[0].listeners.size, 0, event + ': partial listeners are removed');
    await f.controller.start(context, media('retry'), {});
    checkEqual(f.sessions.length, 2, event + ': retry creates a fresh session');
    checkEqual(f.sessions[1].listeners.size, 9, event + ': retry registers all controls');
    await f.controller.stop();
    checkEqual(f.sessions[1].listeners.size, 0, event + ': normal cleanup removes all controls');
  }
}

async function testStaleSessionEvents() {
  const names = ['onPlay', 'onPause', 'onStop', 'onNext', 'onPrevious', 'onFastForward',
    'onRewind', 'onSeek', 'onSetSpeed'];
  for (const reused of [false, true]) {
    const f = sessionFixture(), calls = [];
    const callbacks = Object.fromEntries(names.map(name => [name, () => calls.push(name)]));
    await f.controller.start(context, media('old'), callbacks);
    const previous = [...f.sessions[0].listeners.values()];
    if (!reused) { await f.controller.stop(); }
    await f.controller.start(context, media('new'), callbacks);
    previous.forEach(handler => handler(2));
    checkEqual(calls.length, 0, 'Queued old controls do not target new playback, reuse=' + reused);
    f.sessions.at(-1).listeners.get('play')();
    checkEqual(calls.length, 1, 'Current controls remain available, reuse=' + reused);
    calls.length = 0;
    for (const handler of f.sessions.at(-1).listeners.values()) { handler(2); }
    checkEqual(calls.join(','), names.join(','), 'Every current control invokes its own callback, reuse=' + reused);
    await f.controller.stop();
  }
}

async function testSessions() {
  for (const method of ['create', 'metadata', 'queue', 'title', 'launch', 'activate', 'state']) {
    const f = sessionFixture();
    const gate = f.block(method);
    const starting = f.controller.start(context, media('old'), {});
    await gate.entered.promise;
    const stopping = f.controller.stop();
    const restarting = f.controller.start(context, media('new'), {});
    gate.release.resolve();
    await Promise.all([starting, stopping, restarting]);
    await f.controller.stop();
    assert.equal(f.sessions.length, 2, method);
    assert(!f.events.some(event => event.id === 1 && event.method === 'title' && event.value === 'old'), method);
    for (const session of f.sessions) {
      assert.equal(f.events.filter(event => event.id === session.id && event.method === 'destroy').length, 1);
    }
  }
  for (const method of ['metadata', 'queue', 'activate', 'state']) {
    const reused = sessionFixture();
    await reused.controller.start(context, media('initial'), {});
    const waiting = reused.block(method);
    const oldStart = reused.controller.start(context, media('old'), {});
    await waiting.entered.promise;
    const nextStart = reused.controller.start(context, media('latest'), {});
    waiting.release.resolve();
    await Promise.all([oldStart, nextStart]);
    await reused.controller.stop();
    const metadata = reused.events.filter(event => event.method === 'metadata');
    assert.equal(metadata.at(-1).value.title, 'latest', 'Latest metadata wins on a reused session');
    assert.equal(reused.sessions.length, 1);
  }
  for (const method of ['metadata', 'queue', 'activate', 'state']) {
    const failed = sessionFixture();
    failed.fail(method);
    await failed.controller.start(context, media('failed'), {});
    assert.equal(failed.events.filter(event => event.id === 0 && event.method === 'destroy').length, 1,
      'Partial startup releases its session after ' + method);
    await failed.controller.start(context, media('retry'), {});
    assert.equal(failed.sessions.length, 2);
    await failed.controller.stop();
  }
  const f = sessionFixture();
  await f.controller.start(context, media('first'), {});
  const gate = f.block('state');
  f.controller.updateState(3, 1, 1_000_000, 60_000_000);
  await gate.entered.promise;
  f.controller.updateState(6, 1, 2_000_000, 60_000_000);
  f.controller.updateState(3, 2, 3_000_000, 60_000_000);
  const stopping = f.controller.stop();
  const restart = f.controller.start(context, media('audio', false), {});
  gate.release.resolve();
  await Promise.all([stopping, restart]);
  const oldStates = f.events.filter(event => event.id === 0 && event.method === 'state');
  assert.equal(oldStates.at(-1).value.state, 4, 'STOP is the final state written to the old session');
  assert.equal(f.sessions[1].type, 'audio');
  f.fail('deactivate');
  await Promise.all([f.controller.stop(), f.controller.stop()]);
  assert.equal(f.events.filter(event => event.id === 1 && event.method === 'destroy').length, 1);
  console.info('AVSession: delayed startup, stop/replay, type changes, state ordering and cleanup failures passed');
}

function abLoopFixture() {
  const f = { info: { state: 3, positionUs: 1_000_000, durationUs: 60_000_000 },
    requests: [], timers: new Map(), nextTimer: 1 };
  const { PlaybackAbLoopController } = load('controller/PlaybackAbLoopController.ets', {
    'libplayer.so': { default: { PlayerState: { PLAYING: 3, STOPPING: 4 }, getPlaybackInfo: () => f.info } },
    '../common/utils/Logger': { default: { info() {} } }
  }, { $r: key => key,
    setInterval(callback) { const id = f.nextTimer++; f.timers.set(id, callback); return id; },
    clearInterval(id) { f.timers.delete(id); } });
  f.controller = new PlaybackAbLoopController({ durationUs: 60_000_000, state: 3, isSeeking: false },
    { isBusy: () => false }, targetUs => {
      const request = { targetUs, ...deferred() }; f.requests.push(request); return request.promise;
    }, () => {}, () => false, () => {});
  return f;
}

async function testAbLoopReconfiguration() {
  for (const action of ['start', 'start-and-end', 'end', 'reset']) {
    for (const result of ['failed', 'completed', 'cancelled', 'superseded']) {
      const f = abLoopFixture(), loop = f.controller;
      loop.setStart(); f.info.positionUs = 4_000_000; loop.setEnd(); loop.check();
      checkEqual(f.requests.length, 1, action + '/' + result + ': the original loop requests Seek');
      if (action === 'reset') { loop.reset(); }
      else {
        if (action !== 'end') { f.info.positionUs = 2_000_000; loop.setStart(); }
        if (action !== 'start') { f.info.positionUs = 5_000_000; loop.setEnd(); }
      }
      f.requests[0].resolve(result);
      await Promise.resolve();
      checkEqual(loop.getStartUs(), action === 'reset' ? -1 : action === 'end' ? 1_000_000 : 2_000_000,
        action + '/' + result + ': an old Seek result preserves the new A point');
      checkEqual(loop.getEndUs(), action === 'start' || action === 'reset' ? -1 : 5_000_000,
        action + '/' + result + ': an old Seek result preserves the new B point');
      checkEqual(loop.isEnabled(), action === 'start-and-end' || action === 'end',
        action + '/' + result + ': only the current loop controls enabled state');
      checkEqual(f.timers.size, loop.isEnabled() ? 1 : 0,
        action + '/' + result + ': disabled loops do not retain the polling timer');
      if (loop.isEnabled()) {
        loop.check();
        checkEqual(f.requests.length, 2, action + '/' + result + ': the new loop can request Seek');
        checkEqual(f.requests[1].targetUs, loop.getStartUs(),
          action + '/' + result + ': the new loop seeks to its current A point');
        f.requests[1].resolve('failed'); await Promise.resolve();
        checkEqual(loop.isEnabled(), false, action + '/' + result + ': a current Seek failure still clears the loop');
        checkEqual(f.timers.size, 0, action + '/' + result + ': current failure stops polling');
      }
      loop.reset();
    }
  }
}

const completionGuard = setTimeout(() => {
  console.error('Playback concurrency tests did not finish'); process.exit(1);
}, 30_000);
(async () => {
  await testHistory();
  await testHistoryInitializationAndFailures();
  await testFailedHistoryReadRecovery();
  await testAutomaticHistoryRecovery();
  await testPendingHistoryCompletion();
  await testCorruptHistoryProtection();
  await testHistorySaveBackoff();
  await testSourceSelections();
  await testCoordinatorBackoff();
  await testSessionListenerFailure();
  await testStaleSessionEvents();
  await testSessions();
  await testAbLoopReconfiguration();
})().catch(error => {
  console.error(error); process.exitCode = 1;
}).finally(() => clearTimeout(completionGuard));
