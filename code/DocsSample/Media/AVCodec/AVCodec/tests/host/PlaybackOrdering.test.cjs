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
const { fixture, deferred, scenario, settle } = require('./helpers/PlaybackFlowFixture.cjs');

function invariant(f) {
  assert.equal(f.state.canStart && f.state.canControl, false);
  if (f.state.phase === 'idle' || f.state.phase === 'close_pending') { assert.equal(f.state.activePath, null); }
  if (f.state.phase === 'active') { assert.notEqual(f.state.activePath, null); }
  assert(f.launches.length <= f.trace.filter(event => event.startsWith('complete:')).length + 1);
}
async function testStopReplayAndOldSave() {
  for (const replayBeforeSave of [false, true]) {
    const f = fixture(), gate = deferred(); let stopping; await f.start();
    await scenario('stop/replay/save:' + replayBeforeSave, f, [
      async () => { f.persist = () => gate.promise; stopping = f.flow.stop(); await f.waitAt('stop'); },
      async () => { f.complete(); f.persist = async () => true; },
      async () => { if (replayBeforeSave) { await f.start(); } },
      async () => { gate.resolve(true); await stopping; if (!replayBeforeSave) { await f.start(); } },
      async () => { await f.flow.persistProgress(10_000_000, 60_000_000); }
    ], () => invariant(f));
    assert.equal(f.launches.length, 2); assert.equal(f.state.phase, 'active');
    assert.equal(f.history.at(-1).uri, 'A'); assert.equal(f.history.at(-1).position, 10_000_000);
  }
}
async function testReplacementDuringSeekWait() {
  for (const completeBeforeReplacement of [false, true]) {
    const f = fixture(), gate = deferred(), entered = deferred(); await f.start();
    f.seekIdle = () => { entered.resolve(); return gate.promise; }; let stopping;
    await scenario('queue/seek/complete:' + completeBeforeReplacement, f, [
      async () => { f.queue.requestSwitch(1); stopping = f.flow.stop(); await entered.promise; },
      async () => { if (completeBeforeReplacement) { f.complete(); } },
      async () => {
        f.queue.replaceSource('C', true);
        if (!completeBeforeReplacement) { f.complete(); } else { void f.flow.continuePending(); }
      },
      async () => { gate.resolve(); await f.waitAt('prepare:C'); await stopping; },
      async () => { f.prepares.at(-1).resolve(); await f.waitAt('launch:C'); }
    ], () => invariant(f));
    assert.deepEqual(f.launches.map(item => item.uri), ['A', 'C']); assert.equal(f.stopCalls, 0);
    assert(f.history.filter(item => item.position !== undefined).every(item => item.uri === 'A'));
  }
}
async function testAppendOrClearDuringContinuation() {
  for (const action of ['append', 'clear', 'replace']) {
    const f = fixture(), gate = deferred(), entered = deferred();
    f.sessionStop = () => { entered.resolve(); return gate.promise; };
    f.queue.requestSwitch(1); const pending = f.flow.continuePending(); await entered.promise;
    await scenario('queue wait:' + action, f, [
      async () => {
        if (action === 'append') { f.queue.append('D'); }
        else if (action === 'clear') { f.queue.clear(); }
        else { f.queue.replaceSource('B', true); }
      },
      async () => { gate.resolve();
        if (action === 'append') { await f.waitAt('prepare:B'); f.prepares[0].resolve(); }
        await pending;
      },
      async () => { await settle(); }
    ], () => invariant(f));
    assert.equal(f.launches.length, action === 'append' ? 1 : 0);
    if (action === 'append') { assert.deepEqual(Array.from(f.queue.paths), ['A', 'B', 'C', 'D']); }
  }
}
(async () => {
  await testStopReplayAndOldSave(); await testReplacementDuringSeekWait();
  await testAppendOrClearDuringContinuation();
  console.info('Playback ordering: stop, replay, stale save, queue replacement and lease invariants passed');
})().catch(error => { console.error(error); process.exitCode = 1; });
