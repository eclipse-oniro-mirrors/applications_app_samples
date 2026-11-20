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
const { fixture, deferred, until, load, settle } = require('./helpers/PlaybackFlowFixture.cjs');

async function testStartupCancellation() {
  for (const reject of [false, true]) {
    const f = fixture(), p = f;
    const old = p.flow.play();
    assert.equal((!p.state.buttonEnabled && p.state.activePath === null), true);
    await p.flow.stop();
    assert.equal(f.stopCalls, 0, 'Preparing a URI does not call Native stop');
    assert.equal(p.state.buttonEnabled, true); assert.equal(p.state.isStopping, false);
    if (reject) { f.prepares[0].reject(Error('late preparation failure')); } else { f.prepares[0].resolve(); }
    await old;
    assert.equal(f.launches.length, 0); assert.equal(f.notices.length, 0);
    assert.equal((!p.state.buttonEnabled && p.state.activePath === null), false);
  }
  for (const oldFirst of [false, true]) {
    for (const reject of [false, true]) {
      const f = fixture(), p = f;
      const old = p.flow.play(); await p.flow.stop();
      p.path = 'new'; const next = p.flow.play();
      const settleOld = () => reject ? f.prepares[0].reject(Error('old failure')) : f.prepares[0].resolve();
      if (oldFirst) {
        settleOld(); await old;
        assert.equal(p.state.buttonEnabled, false, 'Old request cannot unlock newer preparation');
        assert.equal((!p.state.buttonEnabled && p.state.activePath === null), true);
      }
      f.prepares[1].resolve(); await next;
      if (!oldFirst) { settleOld(); await old; }
      assert.deepEqual(f.launches.map(item => item.uri), ['new']);
      assert.equal(p.state.buttonEnabled, false, 'Old request cannot unlock active playback');
      assert.equal(f.notices.length, 0);
      assert.equal(p.state.activePath, 'new');
    }
  }
  const leaving = fixture(), pending = leaving.flow.play();
  leaving.active = false; leaving.flow.leave(); leaving.active = true;
  leaving.prepares[0].resolve(); await pending;
  assert.equal(leaving.launches.length, 0, 'Leaving and returning invalidates preparation');
  const failed = fixture(), failing = failed.flow.play();
  failed.prepares[0].reject(Error('current failure')); await failing;
  assert.equal(failed.state.buttonEnabled, true);
  assert.equal(failed.state.activePath, null);
  assert.equal(failed.notices.length, 1, 'Current preparation errors still display feedback');
  console.info('Playback flow: startup cancellation, late success/failure, immediate replay and page re-entry passed');
}

async function testPreparationHandoffCancellation() {
  for (const action of ['stop', 'new-play', 'leave']) {
    const f = fixture(), p = f;
    const old = p.flow.play(); f.prepares[0].resolve();
    await Promise.resolve();
    assert.equal(f.launches.length, 0, 'Preparation finished before the caller resumes');
    let stopped, next;
    if (action === 'leave') {
      p.active = false; p.flow.leave(); p.active = true;
    } else {
      stopped = p.flow.stop();
      if (action === 'new-play') {
        await stopped; p.path = 'B'; next = p.flow.play();
      }
    }
    await old; await stopped;
    assert.equal(f.launches.length, 0, action + ': cancelled handoff cannot launch Native');
    if (next) { f.prepares[1].resolve(); await next; assert.equal(f.launches[0].uri, 'B'); }
  }
}

async function testLateResumeFeedback() {
  for (const action of ['new-session', 'leave', 'stop', 'completed', 'same-file-replay', 'current']) {
    const f = fixture(), p = f, wait = deferred();
    p.seekTo = () => wait.promise;
    const starting = p.flow.play(3_000_000); f.prepares[0].resolve(); await starting;
    const callback = f.timers.values().next().value; f.timers.clear();
    callback();
    if (action === 'new-session' || action === 'same-file-replay') {
      f.complete(); p.path = action === 'new-session' ? 'B' : 'A'; await f.start();
    } else if (action === 'leave') { p.active = false; p.flow.leave(); }
    else if (action === 'stop') { await p.flow.stop(); }
    else if (action === 'completed') { f.complete('completed'); }
    wait.resolve('completed'); await settle();
    checkEqual(f.notices.length, action === 'current' ? 1 : 0, action + ': resume feedback belongs to active playback');
  }
}

async function testLateNativeStartup()
{
  const f = fixture();
  f.startGate = deferred();
  const starting = f.start();
  await f.waitAt('launch:A');
  assert.equal(f.state.phase, 'starting');
  assert.equal(f.state.canControl, false);
  await f.flow.stop();
  f.startGate.resolve({ started: true, completionOwned: true });
  await starting;
  assert.equal(f.state.phase, 'stopping');
  assert.equal(f.state.canControl, false);
  assert.equal(f.stopCalls, 1);
}

async function testQueueContinuations() {
  for (const stage of ['session', 'seek']) {
    for (const action of ['new-play', 'clear', 'replace', 'leave', 'stop', 'change-target']) {
      const f = fixture(), p = f, wait = deferred(), entered = deferred();
      const block = () => { entered.resolve(); return wait.promise; };
      if (stage === 'session') { f.sessionStop = block; } else { f.seekIdle = block; }
      p.queue.requestSwitch(1);
      const switching = p.flow.continuePending(); await entered.promise;
      let selected;
      if (action === 'new-play' || action === 'replace') {
        if (action === 'replace') { p.queue.replace(['recent']); p.path = 'recent'; selected = p.flow.play(); }
        else { p.path = 'C'; selected = p.flow.play(); }
        f.prepares[0].resolve(); await selected;
      } else if (action === 'clear') { p.queue.clear(); }
      else if (action === 'leave') {
        p.active = false; p.flow.stop(); p.active = true;
      } else if (action === 'stop') { p.flow.stop(); }
      else { p.queue.replace(['A', 'changed', 'C'], p.queue.index); }
      const expected = { path: p.path, index: p.queue.index, entries: p.queue.paths.join(',') };
      wait.resolve(); await switching;
      assert.equal(p.path, expected.path, stage + '/' + action);
      assert.equal(p.queue.index, expected.index, stage + '/' + action);
      assert.equal(p.queue.paths.join(','), expected.entries, stage + '/' + action);
      assert.equal(f.prepares.length, selected ? 1 : 0, 'A stale switch does not prepare another file');
    }
  }
  const normal = fixture(), p = normal; p.queue.requestSwitch(1);
  const switching = p.flow.continuePending();
  await until(() => normal.prepares.length === 1);
  normal.prepares[0].resolve(); await switching;
  assert.equal(p.path, 'B'); assert.equal(p.queue.index, 1);
  assert.deepEqual(normal.launches.map(item => item.uri), ['B']);
  console.info('Playback flow: queue waits, replacement, clear, stop and dispatch passed');
}

async function testCompletionAndStop() {
  const f = fixture(), p = f; await f.start();
  const completedSession = p.state.session, waitingSave = deferred(); f.persist = () => waitingSave.promise;
  const stopping = p.flow.stop(); await until(() => f.stopCalls === 1);
  assert.equal(p.state.session, completedSession, 'Stop preserves the active completion generation');
  f.complete();
  assert.equal(p.state.activePath, null);
  assert.equal(p.state.buttonEnabled, true); assert.equal(p.state.isStopping, false);
  assert.equal(f.stopCalls, 1, 'Storage latency does not delay Native stop');
  waitingSave.resolve(); await stopping;

  const automatic = fixture(); await automatic.start();
  automatic.queue.next = () => 1; automatic.complete('completed');
  await until(() => automatic.prepares.length === 2); automatic.prepares[1].resolve();
  await until(() => automatic.launches.length === 2);
  assert.deepEqual(automatic.launches.map(item => item.uri), ['A', 'B']);
  assert(automatic.history.some(item => item.uri === 'A' && item.completed));

  for (const action of ['clear', 'stop', 'new-play']) {
    const late = fixture(); await late.start();
    const wait = deferred(), entered = deferred();
    late.seekIdle = () => { entered.resolve(); return wait.promise; };
    late.queue.next = () => 1; late.complete('completed'); await entered.promise;
    let stopping;
    if (action === 'clear') { late.queue.clear(); }
    else if (action === 'stop') { stopping = late.flow.stop(); }
    else { late.path = 'C'; await late.start(); }
    const expected = late.path; wait.resolve(); await stopping;
    await settle();
    assert.equal(late.path, expected);
    assert.equal(late.launches.length, action === 'new-play' ? 2 : 1);
  }
  console.info('Playback flow: completion, asynchronous storage, stop and continuation passed');
}

function checkEqual(actual, expected, message) {
  console.info('Playback flow:', message, { actual, expected });
  assert.equal(actual, expected, message);
}

// Natural completion saves independently of cleanup and starting the next queue entry.
async function testCompletionHistoryFinalization() {
  const f = fixture(), marking = deferred(), flushing = deferred(); await f.start();
  f.markCompleted = () => marking.promise; f.flush = () => flushing.promise;
  f.queue.next = () => 1; f.complete('completed');
  checkEqual(f.state.activePath, null, 'Completion releases the active source before storage finishes');
  checkEqual(f.events.some(event => event.type === 'finished'), true,
    'Completion publishes cleanup before storage finishes');
  checkEqual(f.state.buttonEnabled, true, 'Completion restores controls before storage finishes');
  checkEqual(f.flushCalls, 0, 'Final flush waits for the completion mark');
  await until(() => f.prepares.length === 2); f.prepares[1].resolve();
  await until(() => f.launches.length === 2);
  checkEqual(f.launches[1].uri, 'B', 'Next queue entry starts while completion storage is pending');
  marking.resolve(false); await until(() => f.flushCalls === 1); flushing.resolve(true);
  await settle();
  checkEqual(f.path, 'B', 'Late final save preserves the new playback path');
  checkEqual(f.progress.positionUs, 10_000_000, 'Late final save preserves the supplied progress');
  checkEqual(f.state.buttonEnabled, false, 'Late final save preserves the new controls');
  checkEqual(f.warnings.length, 0, 'Successful final retry needs no warning');

  for (const failure of ['false', 'reject']) {
    const failed = fixture(); await failed.start();
    failed.markCompleted = async () => { if (failure === 'reject') { throw Error('mark failed'); } return false; };
    failed.flush = async () => { if (failure === 'reject') { throw Error('flush failed'); } return false; };
    failed.complete('completed');
    await settle();
    checkEqual(failed.flushCalls, 1, 'Completion failure still gets a final flush');
    checkEqual(failed.warnings.length, failure === 'reject' ? 2 : 1, 'Final failure is handled and logged');
    checkEqual(failed.state.buttonEnabled, true, 'Storage failure does not leave the player busy');
  }
  for (const action of ['leave', 'cleanup-pending']) {
    const closing = fixture(); await closing.start();
    closing.active = action !== 'leave';
    closing.complete('completed', action === 'cleanup-pending');
    await until(() => closing.flushCalls === 1);
    checkEqual(closing.history[0].uri, 'A', 'Early cleanup retains the completed source for saving');
    checkEqual(closing.launches.length, 1, 'Early cleanup does not start another media task');
  }

}

// Natural completion uses the available duration snapshot before progress refresh.
async function testCompletionBeforeProgressRefresh() {
  for (const duration of [0, 60_000_000]) {
    for (const hint of [0, 60_000_000]) {
      const f = fixture(); await f.start();
      f.progress.durationUs = duration; f.completedInfo.durationUs = hint;
      f.complete('completed'); await until(() => f.flushCalls === 1);
      checkEqual(f.history.filter(item => item.completed).length, 1, 'Completion always marks history');
      checkEqual(f.history[0].durationUs, duration > 0 ? duration : hint, 'Missing duration uses completed snapshot');
    }
  }

}

async function testUnconfirmedInputClosure() {
  for (const reason of ['completed', 'stopped', 'error']) {
    for (const active of [false, true]) {
      const f = fixture(), p = f; await f.start();
      p.options.autoRecovery = true; p.flow.observe(1_000_000, false, true);
      p.queue.next = () => 1; p.queue.requestSwitch(1); p.active = active;
      f.complete(reason, true);
      await settle();
      assert.equal(p.state.activePath, null); assert.equal(p.state.buttonEnabled, true);
      assert.equal(p.state.isStopping, false); assert(f.events.some(event => event.type === 'finished'));
      assert.equal(p.queue.pendingIndex, -1); assert.equal(p.queue.index, 0);
      assert.equal(f.prepares.length, 1); assert.equal(f.launches.length, 1);
      assert.equal(f.events.filter(event => event.type === 'recovery_pending').length, 0);
      assert.equal(f.sessionStops, 1); assert.equal(f.notices.length, active ? 1 : 0);
      if (active) assert.equal(f.notices[0], 'close_unconfirmed');
    }
  }
  const waiting = fixture(), gate = deferred(), entered = deferred(); await waiting.start();
  waiting.seekIdle = () => { entered.resolve(); return gate.promise; };
  waiting.queue.requestSwitch(1);
  const pending = waiting.flow.continuePending();
  await entered.promise; waiting.complete('completed', true); gate.resolve(); await pending;
  assert.equal(waiting.path, 'A', 'An already waiting continuation is invalidated');
  assert.equal(waiting.launches.length, 1);
  const rejected = fixture(); rejected.launchError = 'close_unconfirmed'; await rejected.start();
  assert.equal(rejected.notices.length, 1);
  assert.equal(rejected.notices[0], 'close_unconfirmed');
  assert.equal(rejected.state.buttonEnabled, true); assert.equal(rejected.launches.length, 0);
  console.info('Playback flow: unconfirmed close blocks continuation and retry, then prompts restart');
}

// Recovery goes through the public play/observe/stop contract and the real recovery model.
async function testRuntimeRecovery() {
  for (const paused of [false, true]) {
    const f = fixture(), p = f; p.options.autoRecovery = true; await f.start();
    p.state.setRequestedSpeed(2); p.options.muted = true;
    p.flow.observe(7_000_000, paused, true); f.complete('error');
    await until(() => f.prepares.length === 2); f.prepares[1].resolve();
    await until(() => f.launches.length === 2);
    assert.equal(f.events.filter(event => event.type === 'recovery_pending').length, 1);
    assert.equal(f.events.filter(event => event.type === 'recovery_succeeded').length, 1);
    assert.equal(p.state.requestedSpeed, 2);
    assert.deepEqual(f.nativeControls.slice(0, 2), [['volume', 0], ['speed', 2]]);
    assert.equal(f.nativeControls.some(item => item[0] === 'pause'), paused);
    f.timers.values().next().value(); await until(() => f.seekTargets.length === 1);
    assert.deepEqual(f.seekTargets, [7_000_000]);
    await until(() => f.notices.includes('recovered'));
    p.flow.observe(8_000_000, paused, true); f.complete('error');
    await settle();
    assert.equal(f.launches.length, 2, 'A runtime failure gets at most one retry');
    assert.equal(f.events.filter(event => event.type === 'recovery_failed').length, 1);
  }
  for (const action of ['stop', 'no-output', 'disabled']) {
    const f = fixture(); f.options.autoRecovery = action !== 'disabled'; await f.start();
    f.flow.observe(3_000_000, false, action !== 'no-output');
    if (action === 'stop') { await f.flow.stop(); }
    f.complete('error'); await settle();
    assert.equal(f.launches.length, 1, action + ': runtime retry remains disabled');
  }
}

async function testLaunchFailureAndStopRejection() {
  for (const owns of [false, true]) {
    const f = fixture(); f.startResult = { started: false, nativeOwnsLease: owns }; await f.start();
    assert.equal(f.state.buttonEnabled, !owns);
    assert.equal(f.state.activePath, owns ? 'A' : null);
    assert.equal(f.events.filter(event => event.type === 'start_failed').length, 1);
    assert.equal(f.notices.length, 1);
    if (owns) {
      await f.flow.play(); assert.equal(f.launches.length, 1);
      f.complete('error');
      assert.equal(f.state.buttonEnabled, true);
      assert.equal(f.notices.length, 1, 'Late failure does not repeat startup feedback');
    }
  }
  for (const error of ['open', 'empty', 'busy', 'close_unconfirmed']) {
    const f = fixture(); f.launchError = error; await f.start();
    assert.equal(f.state.buttonEnabled, true);
    assert.equal(f.events.filter(event => event.notice === error).length, 1);
  }
  const f = fixture(); await f.start(); f.nativeState = f.states.IDLE;
  await f.flow.stop();
  assert.equal(f.state.isStopping, false);
  assert.equal(f.events.filter(event => event.type === 'stop_rejected').length, 1,
    'Rejected stop requests a state refresh');
}

async function testQueueNavigationAndModes() {
  for (const direction of [-1, 1]) {
    const f = fixture(); await f.start(); f.queue.select(1);
    f.flow.switchQueue(direction); await until(() => f.stopCalls === 1);
    f.complete(); await until(() => f.prepares.length === 2); f.prepares[1].resolve();
    await until(() => f.launches.length === 2);
    assert.equal(f.launches[1].uri, direction < 0 ? 'A' : 'C');
  }
  for (const mode of [0, 1, 2]) {
    const f = fixture(); f.options.mode = mode; await f.start(); f.queue.select(2);
    // Use the production mode implementation instead of the fixture's fixed no-next decision.
    const modes = load('model/PlaybackModeModel.ets', {});
    f.queue.next = currentMode => modes.nextPlaybackIndex(currentMode, 2, 3);
    f.complete('completed');
    if (mode === 0) {
      await settle();
      assert.equal(f.launches.length, 1);
    } else {
      await until(() => f.prepares.length === 2); f.prepares[1].resolve();
      await until(() => f.launches.length === 2); assert.equal(f.launches[1].uri, mode === 1 ? 'C' : 'A');
    }
  }
}

async function testStaleCompletionAndEntryGuards() {
  const f = fixture(); await f.start(); const completeOld = f.launches[0].complete; f.complete();
  f.path = 'B'; await f.start(); const events = f.events.length;
  completeOld({ reason: 'completed', success: true }, false);
  assert.equal(f.state.activePath, 'B'); assert.equal(f.events.length, events);
  for (const guard of ['inactive', 'stopping', 'busy-seek', 'transcoding', 'no-source']) {
    const blocked = fixture();
    if (guard === 'inactive') { blocked.active = false; }
    if (guard === 'stopping') { await blocked.start(); await blocked.flow.stop(); blocked.prepares.length = 0; }
    if (guard === 'busy-seek') { blocked.seeks.isBusy = () => true; }
    if (guard === 'transcoding') { blocked.transcoding = true; }
    if (guard === 'no-source') { blocked.path = null; }
    await blocked.flow.play(); assert.equal(blocked.prepares.length, 0, guard);
  }
}
const completionGuard = setTimeout(() => {
  console.error('Playback flow tests did not finish'); process.exit(1);
}, 30_000);
(async () => {
  await testQueueNavigationAndModes(); await testStaleCompletionAndEntryGuards();
  await testRuntimeRecovery(); await testLaunchFailureAndStopRejection();
  await testPreparationHandoffCancellation();
  await testStartupCancellation(); await testQueueContinuations(); await testCompletionAndStop();
  await testUnconfirmedInputClosure();
  await testCompletionHistoryFinalization();
  await testLateResumeFeedback();
  await testLateNativeStartup();
  await testCompletionBeforeProgressRefresh();
})()
  .catch(error => { console.error(error); process.exitCode = 1; }).finally(() => clearTimeout(completionGuard));
