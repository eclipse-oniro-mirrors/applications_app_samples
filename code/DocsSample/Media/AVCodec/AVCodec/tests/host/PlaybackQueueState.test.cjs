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
const { fixture, load } = require('./helpers/PlaybackFlowFixture.cjs');

function queueFixture() {
  const { PlaybackQueueController } = load('controller/PlaybackQueueController.ets', {
    '../model/PlaybackModeModel': load('model/PlaybackModeModel.ets', {})
  }, { Observed: target => target });
  const queue = new PlaybackQueueController(); queue.replace(['A', 'B', 'C'], 0); return queue;
}
function testQueueOwnership() {
  const queue = queueFixture(), input = ['A', 'B']; queue.replace(input, 0); input[0] = 'changed';
  const snapshot = queue.paths; snapshot.push('C'); snapshot[0] = 'changed';
  assert.deepEqual(Array.from(queue.paths), ['A', 'B']);
  assert.equal(queue.requestSwitch(-1), false); assert.equal(queue.requestSwitch(5), false);
  queue.requestSwitch(1); const request = queue.takePending();
  assert.equal(request.path, 'B'); assert.equal(queue.pendingIndex, -1);
  const version = queue.version; queue.append('C'); queue.append('C');
  assert.equal(queue.version, version); assert.equal(queue.isCurrent(request), true);
  queue.requestSwitch(0); assert.equal(queue.isCurrent(request), false);
  const latest = queue.takePending(); assert.equal(latest.path, 'A');
  queue.clear(); assert.equal(queue.isCurrent(latest), false); assert.equal(queue.index, -1);
  assert.equal(queue.selectDefault(), undefined);
  queue.replaceSource('recent', true); assert.equal(queue.index, -1);
  assert.equal(queue.takePending().positionUs, -1);
  queue.replaceSource('recording', false); assert.equal(queue.index, 0);
  assert.equal(queue.pendingIndex, -1); assert.equal(queue.selectDefault(), 'recording');
}
async function testPhaseTransitions() {
  const f = fixture(); assert.equal(f.state.phase, 'idle');
  const preparing = f.flow.play(); assert.equal(f.state.phase, 'preparing');
  assert.equal(f.state.buttonEnabled, false); assert.equal(f.state.canControl, false);
  f.prepares[0].resolve(); await preparing; assert.equal(f.state.phase, 'active');
  const stopping = f.flow.stop(); assert.equal(f.state.phase, 'stopping');
  await stopping; assert.equal(f.state.canControl, false); f.complete();
  assert.equal(f.state.phase, 'idle');
  for (const owns of [false, true]) {
    const failed = fixture(); failed.startResult = { started: false, nativeOwnsLease: owns };
    await failed.start(); assert.equal(failed.state.phase, owns ? 'releasing' : 'idle');
    assert.equal(failed.state.canStart, !owns);
    if (owns) { failed.complete('error'); assert.equal(failed.state.phase, 'idle'); }
  }
  const close = fixture(); await close.start(); close.complete('completed', true);
  assert.equal(close.state.phase, 'close_pending'); assert.equal(close.state.canControl, false);
  assert.equal(close.state.canStart, false); await close.flow.play(); await close.flow.stop();
  assert.equal(close.prepares.length, 1); assert.equal(close.stopCalls, 0);
  assert.equal(close.notices.at(-1), 'close_unconfirmed');
  const rejected = fixture(); rejected.launchError = 'close_unconfirmed'; await rejected.start();
  assert.equal(rejected.state.phase, 'close_pending'); await rejected.flow.play();
  assert.equal(rejected.prepares.length, 1);
}
(async () => {
  testQueueOwnership(); await testPhaseTransitions();
  console.info('Playback queue and phases: ownership, latest request, cancellation and closure passed');
})().catch(error => { console.error(error); process.exitCode = 1; });
