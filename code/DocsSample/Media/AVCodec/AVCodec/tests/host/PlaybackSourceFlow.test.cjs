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
const { fixture, deferred, until, load, settle } = require('./helpers/PlaybackPageFixture.cjs');

function checkEqual(actual, expected, message) {
  console.info('Playback source integration:', message, { actual, expected }); assert.equal(actual, expected, message);
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
    p.playbackQueue.requestSwitch(1);
    const switching = p.playbackFlow.continuePending();
    await entered.promise;
    p.playbackSources.enqueue('D');
    p.playbackSources.enqueue('D');
    checkEqual(p.queueEntries.join(','), 'A,B,C,D', stage + ': appended entries remain visible without duplicates');
    wait.resolve();
    await f.waitAt('prepare:B');
    checkEqual(f.prepares.length, 1, stage + ': appending preserves the pending playback switch');
    checkEqual(f.prepares[0].uri, 'B', stage + ': the original target remains selected');
    f.prepares[0].resolve();
    await switching;
    checkEqual(f.launches[0].uri, 'B', stage + ': the original target starts normally');
    checkEqual(p.queueEntries.join(','), 'A,B,C,D', stage + ': playback retains appended entries');
  }
}

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
    checkEqual(p.playbackFlowState.activePath, 'A', kind + ': history stays bound to the active source');
    checkEqual(f.launches.length, 1, kind + ': no second Native task starts before completion');
    await choose('C');
    checkEqual(f.stopCalls, 1, 'A newer selection reuses the in-flight stop');
    await p.playbackFlow.persistProgress(20_000_000, 60_000_000, true);
    checkEqual(f.history.filter(item => item.position !== undefined).every(item => item.uri === 'A'), true,
      'All old progress is saved under the active URI');
    f.complete(); await until(() => f.prepares.length === 2);
    checkEqual(f.prepares[1].uri, 'C', 'Only the latest selected source is prepared');
    f.prepares[1].resolve(); await until(() => f.launches.length === 2);
    checkEqual(p.playbackFlowState.activePath, 'C', 'Active history URI changes when the new Native task launches');
    checkEqual(f.resumeQueries.at(-1).uri, 'C', 'New source selection still consults resume settings');
    checkEqual(f.resumeQueries.at(-1).enabled, false, 'Resume remains disabled by default');
    checkEqual(f.prepares.length, 2, 'Superseded selection never starts');
  }
  const bound = fixture(); await bound.start(); bound.page.selectFilePath = 'B';
  await bound.page.playbackFlow.persistProgress(20_000_000, 60_000_000, true);
  checkEqual(bound.history.at(-1).uri, 'A', 'History uses the active URI even if selection changes');
  const cleared = fixture(); await cleared.start();
  cleared.page.playbackSources.playRecentEntry({ uri: 'B' }); await until(() => cleared.stopCalls === 1);
  cleared.page.playbackSources.clearQueue(); cleared.complete();
  await settle();
  checkEqual(cleared.prepares.length, 1, 'Clearing the queue cancels a pending source switch');
  const late = fixture(), wait = deferred(); await late.start(); late.seekIdle = () => wait.promise;
  const stopping = late.page.playbackFlow.stop(); late.complete('completed');
  late.page.selectFilePath = 'B'; await late.start(); wait.resolve(); await stopping;
  checkEqual(late.stopCalls, 0, 'An old stop cannot stop a newer playback after waiting for Seek');
  checkEqual(late.nativeState, late.states.PLAYING, 'New playback remains active');
  const enabled = fixture(); await enabled.start(); enabled.page.playerSettings.resumeLastPosition = true;
  enabled.page.playbackSources.playRecentEntry({ uri: 'B' }); await until(() => enabled.stopCalls === 1);
  enabled.complete(); await until(() => enabled.prepares.length === 2); enabled.prepares[1].resolve();
  await until(() => enabled.launches.length === 2);
  checkEqual(enabled.resumeQueries.at(-1).enabled, true, 'Source switch respects the enabled resume setting');
}

async function testQueueSelectionDuringPreparation() {
  const queued = fixture(), first = queued.page.playbackFlow.play();
  queued.page.playbackSources.playQueueEntry(1);
  await until(() => queued.prepares.length === 2);
  queued.prepares[1].resolve(); await queued.sourceStop;
  queued.prepares[0].resolve(); await first;
  assert.deepEqual(queued.launches.map(item => item.uri), ['B'], 'Next item still works during URI preparation');
  assert.equal(queued.page.playbackQueue.index, 1);
}

async function testQueueSelectionAfterStop() {
  const queued = fixture(); await queued.start();
  queued.page.playbackSources.playQueueEntry(1); await until(() => queued.stopCalls === 1);
  queued.complete(); await until(() => queued.prepares.length === 2);
  queued.prepares[1].resolve(); await queued.sourceStop;
  await until(() => queued.launches.length === 2);
  assert.deepEqual(queued.launches.map(item => item.uri), ['A', 'B']);
  assert.equal(queued.page.playbackQueue.index, 1);

}
(async () => {
  await testQueueSelectionWhileStopping(); await testAppendDuringQueueContinuation();
  await testActiveSourceSelection(); await testQueueSelectionDuringPreparation();
  await testQueueSelectionAfterStop();
})().catch(error => { console.error(error); process.exitCode = 1; });
