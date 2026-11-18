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
const { fixture: coreFixture, load, deferred, until } = require('./helpers/PlaybackFlowFixture.cjs');

function fixture() {
  const f = { updates: [], completions: [], queries: [], warnings: [], notifications: [], flushes: 0,
    update: async () => true, mark: async () => true, flush: async () => true };
  const store = { async update(uri, title, positionUs, durationUs, force) {
    f.updates.push({ uri, title, positionUs, durationUs, force }); return await f.update();
  }, markCompleted(uri, durationUs) { f.completions.push({ uri, durationUs }); return f.mark(); },
  flush() { f.flushes++; return f.flush(); }, getResumePosition(uri, durationUs, enabled) {
    f.queries.push({ uri, durationUs, enabled }); return enabled ? 3_000_000 : 0;
  } };
  const { PlaybackHistoryCoordinator } = load('controller/PlaybackHistoryCoordinator.ets', {
    '../model/PlaybackHistoryModel': { getPlaybackTitle: uri => 'title:' + uri },
    '../common/utils/Logger': { default: { warn: (tag, message) => f.warnings.push(message) } }
  });
  f.saving = new PlaybackHistoryCoordinator(store, () => f.notifications.push(f.updates.length));
  return f;
}
async function testSavePolicy() {
  const f = fixture();
  await f.saving.persistProgress(3_000_000, 60_000_000); assert.equal(f.updates.length, 0);
  f.saving.activate('A');
  for (const [position, duration] of [[-1, 60], [1, 0], [NaN, 60], [1, Infinity]]) {
    await f.saving.persistProgress(position, duration);
  }
  assert.equal(f.updates.length, 0, 'Invalid snapshots never reach storage');
  await f.saving.persistProgress(3_000_000, 60_000_000);
  await f.saving.persistProgress(4_999_999, 60_000_000); assert.equal(f.updates.length, 1);
  await f.saving.persistProgress(5_000_000, 60_000_000); assert.equal(f.updates.length, 2);
  await f.saving.persistProgress(5_000_000, 60_000_000, true); assert.equal(f.updates.length, 3);
  assert.equal(f.updates.at(-1).force, true); assert.equal(f.updates.at(-1).title, 'title:A');
  f.update = async () => false;
  await f.saving.persistProgress(9_000_000, 60_000_000);
  f.update = async () => true;
  await f.saving.persistProgress(9_000_000, 60_000_000); assert.equal(f.updates.length, 5);
  f.saving.release(); await f.saving.persistProgress(20_000_000, 60_000_000, true);
  assert.equal(f.updates.length, 5, 'Released playback cannot add new progress');
  assert.equal(f.notifications.length, 5, 'Completed attempts notify listeners to read current entries');
}
async function testSessionOwnership() {
  for (const path of ['A', 'B']) {
    const f = fixture(), gate = deferred(); f.saving.activate('A');
    f.update = () => gate.promise;
    const old = f.saving.persistProgress(9_000_000, 60_000_000);
    f.saving.release(); f.saving.activate(path);
    f.update = async () => true; await f.saving.persistProgress(1_000_000, 60_000_000);
    gate.resolve(true); await old;
    await f.saving.persistProgress(9_000_000, 60_000_000);
    assert.deepEqual(f.updates.map(item => item.uri), ['A', path, path]);
    assert.equal(f.updates.at(-1).positionUs, 9_000_000, 'Old save cannot throttle a new playback');
    assert.equal(f.saving.getResumePosition(60_000_000, true), 3_000_000);
    assert.equal(f.queries.at(-1).uri, path);
    assert.equal(f.saving.getResumePosition(60_000_000, false), 0);
  }
}
async function testCompletionOwnership() {
  const f = fixture(), gate = deferred(); f.saving.activate('A'); f.mark = () => gate.promise;
  let reads = 0; const completed = f.saving.complete(0, () => { reads++; return 100_000; });
  assert.equal(reads, 1); assert.equal(f.flushes, 0);
  f.saving.release(); f.saving.activate('B');
  await f.saving.persistProgress(1_000_000, 60_000_000);
  gate.resolve(false); await completed;
  assert.deepEqual(f.completions, [{ uri: 'A', durationUs: 100_000 }]);
  assert.equal(f.flushes, 1, 'Completion retries after the mark returns false');
  assert.equal(f.notifications.length, 2);
  await f.saving.persistProgress(2_000_000, 60_000_000); assert.equal(f.updates.length, 1);
  f.saving.release(); await f.saving.complete(0, () => { throw Error('must not read'); });
  assert.equal(f.completions.length, 1);
}
async function testFinalSaveFailures() {
  for (const rejects of [false, true]) {
    const f = fixture(); f.saving.activate('A');
    f.mark = async () => { if (rejects) { throw Error('mark failed'); } return false; };
    f.flush = async () => { if (rejects) { throw Error('flush failed'); } return false; };
    await f.saving.complete(60_000_000, () => { throw Error('duration already known'); });
    assert.equal(f.flushes, 1); assert.equal(f.warnings.length, rejects ? 2 : 1);
  }
  const f = fixture(); f.saving.activate('A');
  await f.saving.complete(0, () => { throw Error('duration unavailable'); });
  assert.equal(f.completions[0].durationUs, 0); assert.equal(f.flushes, 1);
  assert.equal(f.warnings.length, 1);
}
async function testCompletionHistoryRetry() {
  // Exercise the production history writer when both markCompleted attempts fail.
  const actual = coreFixture(); let saved = JSON.stringify([
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
  Object.assign(actual.historyModel, {
    markCompleted: (...args) => history.markCompleted(...args), flush: () => history.flush()
  });
  await actual.start(); actual.complete('completed');
  await until(() => JSON.parse(saved)[0].positionUs === 0);
  checkEqual(writes, 3, 'Final completion flush retries after both initial writes fail');
  checkEqual(actual.state.buttonEnabled, true, 'Completion retry leaves player cleanup finished');
}
async function testUnreadHistoryCompletion() {
  let saved = JSON.stringify([{ uri: 'A', title: 'A', positionUs: 30, durationUs: 100, updatedAt: 1 }]);
  let reads = 0;
  const f = coreFixture();
  const { PlaybackHistoryModel } = load('model/PlaybackHistoryModel.ets', {
    '@kit.ArkData': { preferences: { getPreferences: async () => ({ get: async () => {
      if (++reads === 1) { throw Error('first read fails'); } return saved;
    }, put: async (key, value) => { saved = value; }, flush: async () => {} }) } },
    '../common/utils/Logger': { default: { warn: (tag, message) => f.warnings.push(message) } }
  });
  const history = new PlaybackHistoryModel(); await history.load({});
  Object.assign(f.historyModel, {
    markCompleted: (...args) => history.markCompleted(...args), flush: () => history.flush()
  });
  await f.start();
  f.progress.durationUs = 0; f.completedInfo.durationUs = 0; f.complete('completed');
  await until(() => JSON.parse(saved)[0].positionUs === 0);
  checkEqual(reads, 2, 'Final completion flush retries the failed initial read');
  checkEqual(JSON.parse(saved)[0].positionUs, 0, 'Recovered history retains the completion mark');

}
async function testShortMediaCompletion() {
  const short = coreFixture(); let shortSaved = '[]';
  const shortStore = { get: async () => shortSaved,
    put: async (key, value) => { shortSaved = value; }, flush: async () => {} };
  const shortModule = load('model/PlaybackHistoryModel.ets', {
    '@kit.ArkData': { preferences: { getPreferences: async () => shortStore } },
    '../common/utils/Logger': { default: { warn: (tag, message) => short.warnings.push(message) } }
  });
  const shortHistory = new shortModule.PlaybackHistoryModel(); await shortHistory.load({});
  Object.assign(short.historyModel, {
    markCompleted: (...args) => shortHistory.markCompleted(...args), flush: () => shortHistory.flush()
  });
  await short.start();
  short.progress.durationUs = 0; short.completedInfo.durationUs = 100_000;
  short.complete('completed'); await until(() => JSON.parse(shortSaved).length === 1);
  checkEqual(JSON.parse(shortSaved)[0].durationUs, 100_000, 'Native snapshot supplies short-media duration');
  checkEqual(JSON.parse(shortSaved)[0].positionUs, 0, 'Short media completed before refresh has a history record');
}
function checkEqual(actual, expected, message) {
  console.info('Playback history:', message, { actual, expected }); assert.equal(actual, expected, message);
}

(async () => {
  await testSavePolicy(); await testSessionOwnership(); await testCompletionOwnership();
  await testFinalSaveFailures();
  await testCompletionHistoryRetry(); await testUnreadHistoryCompletion(); await testShortMediaCompletion();
  console.info('Playback history coordinator: save policy, replay ownership and final retries passed');
})().catch(error => { console.error(error); process.exitCode = 1; });
