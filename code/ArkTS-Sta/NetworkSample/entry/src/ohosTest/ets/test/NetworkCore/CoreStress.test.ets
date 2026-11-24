'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/**
 * CoreStress suite of the NetworkSample ohosTest module.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   174-198  startAllTasks creates a new lock and a new 200 ms interval per tap
 *   177      let lock = new AsyncLock() inside the handler, so a new run must not leak the old one
 *   188-196  setInterval(..., 200) that clears itself once C starts
 *
 * The suite repeats the journey many times and counts what grows, what stays
 * constant and what must return to zero. It is intentionally loop heavy: the
 * assertions are on invariants, not on a single happy path.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  PROGRESS_TOTAL,
  POLL_INTERVAL_MS,
  ERROR_TIMEOUT,
  DownloadTask,
  DependencyLock,
  PollClock,
  EventRecorder,
  SnapshotLog,
  NetworkMetrics,
  RunSnapshot,
  createTaskGraph,
  completionTrace,
  textFingerprint,
  joined
} from '../Shared/SharedDriver';

export default function networkCoreStressTest(): void {
  describe('CoreStress', () => {
    beforeAll(() => {
      logSuite('CoreStress', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CoreStress', 'end');
    });

    /**
     * @tc.name   hundredStartCompleteResetCyclesKeepStateClean
     * @tc.desc   One hundred full journeys followed by reset always end idle at zero with an enabled button.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredStartCompleteResetCyclesKeepStateClean', 0, () => {
      const graph = createTaskGraph();
      let dirty = 0;
      for (let cycle = 0; cycle < 100; cycle++) {
        graph.startAll();
        graph.completeTask(TASK_A);
        graph.completeTask(TASK_B);
        graph.pollTick(POLL_INTERVAL_MS);
        graph.completeTaskC(POLL_INTERVAL_MS);
        if (!graph.allCompleted()) {
          dirty = dirty + 1;
        }
        graph.reset();
        if (!graph.isTaskFinished || graph.totalProgress() !== 0) {
          dirty = dirty + 1;
        }
      }
      logStep('CoreStress', 'dirty cycles ' + String(dirty));
      expect(dirty).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
    });

    /**
     * @tc.name   fiftyResetsKeepButtonEnabled
     * @tc.desc   Repeated resets are idempotent: the start button is enabled after every single one of them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fiftyResetsKeepButtonEnabled', 0, () => {
      const graph = createTaskGraph();
      let disabled = 0;
      for (let cycle = 0; cycle < 50; cycle++) {
        graph.startAll();
        graph.reset();
        if (!graph.isTaskFinished) {
          disabled = disabled + 1;
        }
      }
      logStep('CoreStress', 'disabled after reset ' + String(disabled));
      expect(disabled).assertEqual(0);
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.snapshotText()).assertEqual('A:idle:0|B:idle:0|C:idle:0');
    });

    /**
     * @tc.name   eventLogGrowsByElevenPerJourney
     * @tc.desc   Without a reset the recorder grows by exactly eleven entries for every completed journey.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventLogGrowsByElevenPerJourney', 0, () => {
      const graph = createTaskGraph();
      const sizes: number[] = [];
      for (let cycle = 0; cycle < 4; cycle++) {
        graph.reset();
        graph.startAll();
        graph.completeTask(TASK_A);
        graph.completeTask(TASK_B);
        graph.pollTick(POLL_INTERVAL_MS);
        graph.completeTaskC(POLL_INTERVAL_MS);
        sizes.push(graph.events.size());
      }
      logStep('CoreStress', 'journey sizes ' + joined([String(sizes[0]), String(sizes[3])], ','));
      expect(sizes[0]).assertEqual(11);
      expect(sizes[1]).assertEqual(11);
      expect(sizes[2]).assertEqual(11);
      expect(sizes[3]).assertEqual(11);
      expect(sizes.length).assertEqual(4);
      expect(graph.events.countOf('completed')).assertEqual(3);
    });

    /**
     * @tc.name   eventLogResetEmptiesBetweenCycles
     * @tc.desc   Because every cycle starts with reset, every cycle starts from an empty recorder.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventLogResetEmptiesBetweenCycles', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      const peak = graph.events.size();
      graph.reset();
      const afterReset = graph.events.size();
      graph.startAll();
      logStep('CoreStress', 'recorder ' + String(peak) + ' -> ' + String(afterReset) + ' -> ' +
        String(graph.events.size()));
      expect(peak).assertEqual(5);
      expect(afterReset).assertEqual(0);
      expect(graph.events.size()).assertEqual(4);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(0);
      expect(graph.events.trace().startsWith('start-all:begin')).assertTrue();
    });

    /**
     * @tc.name   pollClockAdvancesTwoHundredMillisPerTick
     * @tc.desc   Each tick of the poll model advances the elapsed time by the page interval literal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollClockAdvancesTwoHundredMillisPerTick', 0, () => {
      const clock = new PollClock();
      clock.start();
      const first = clock.tick();
      const second = clock.tick();
      const third = clock.tick();
      logStep('CoreStress', 'clock ' + String(first) + '/' + String(second) + '/' + String(third));
      expect(clock.intervalMs).assertEqual(200);
      expect(first).assertEqual(200);
      expect(second).assertEqual(400);
      expect(third).assertEqual(600);
      expect(clock.ticks).assertEqual(3);
      expect(clock.active).assertTrue();
      expect(third - second).assertEqual(POLL_INTERVAL_MS);
    });

    /**
     * @tc.name   pollClockHundredTicksReachTwentySeconds
     * @tc.desc   One hundred interval rounds accumulate to 20 000 ms, which is the longest idle stretch modelled.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollClockHundredTicksReachTwentySeconds', 0, () => {
      const clock = new PollClock(POLL_INTERVAL_MS);
      clock.start();
      for (let round = 0; round < 100; round++) {
        clock.tick();
      }
      logStep('CoreStress', 'clock after 100 ticks ' + String(clock.elapsedMs));
      expect(clock.ticks).assertEqual(100);
      expect(clock.elapsedMs).assertEqual(20000);
      expect(clock.elapsedMs / clock.ticks).assertEqual(200);
      expect(clock.isDueAfter(100)).assertTrue();
      expect(clock.isDueAfter(101)).assertFalse();
      expect(clock.active).assertTrue();
    });

    /**
     * @tc.name   pollClockStopsAndIgnoresFurtherTicks
     * @tc.desc   After stop() the clock freezes: extra ticks neither raise the counter nor the elapsed time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollClockStopsAndIgnoresFurtherTicks', 0, () => {
      const clock = new PollClock();
      clock.start();
      clock.tick();
      clock.tick();
      const frozenTime = clock.elapsedMs;
      const frozenTicks = clock.ticks;
      clock.stop();
      const afterOne = clock.tick();
      const afterTwo = clock.tick();
      logStep('CoreStress', 'frozen clock ' + String(frozenTime) + ' then ' + String(afterTwo));
      expect(clock.active).assertFalse();
      expect(afterOne).assertEqual(frozenTime);
      expect(afterTwo).assertEqual(frozenTime);
      expect(clock.ticks).assertEqual(frozenTicks);
      expect(clock.elapsedMs).assertEqual(400);
      expect(clock.isDueAfter(2)).assertTrue();
    });

    /**
     * @tc.name   pollClockIsDueAfterExactRounds
     * @tc.desc   The due predicate flips exactly at the round count that matches the elapsed time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollClockIsDueAfterExactRounds', 0, () => {
      const clock = new PollClock(100);
      clock.start();
      clock.tick();
      clock.tick();
      clock.tick();
      logStep('CoreStress', 'due at three rounds ' + String(clock.isDueAfter(3)));
      expect(clock.elapsedMs).assertEqual(300);
      expect(clock.intervalMs).assertEqual(100);
      expect(clock.isDueAfter(1)).assertTrue();
      expect(clock.isDueAfter(3)).assertTrue();
      expect(clock.isDueAfter(4)).assertFalse();
      expect(clock.isDueAfter(0)).assertTrue();
      expect(clock.isDueAfter(-2)).assertTrue();
    });

    /**
     * @tc.name   pollClockRestartZeroesCounters
     * @tc.desc   A restart models a new setInterval call: ticks and elapsed time both go back to zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollClockRestartZeroesCounters', 0, () => {
      const clock = new PollClock();
      clock.start();
      clock.tick();
      clock.tick();
      clock.tick();
      clock.stop();
      clock.start();
      logStep('CoreStress', 'restart counters ' + String(clock.ticks) + '/' + String(clock.elapsedMs));
      expect(clock.ticks).assertEqual(0);
      expect(clock.elapsedMs).assertEqual(0);
      expect(clock.active).assertTrue();
      expect(clock.isDueAfter(1)).assertFalse();
      clock.tick();
      expect(clock.elapsedMs).assertEqual(200);
      expect(clock.isDueAfter(1)).assertTrue();
    });

    /**
     * @tc.name   lockCountersDoNotLeakAcrossCycles
     * @tc.desc   Ten reset cycles each end with three acquisitions, never more, so no grant is duplicated.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lockCountersDoNotLeakAcrossCycles', 0, () => {
      const graph = createTaskGraph();
      let unexpected = 0;
      for (let cycle = 0; cycle < 10; cycle++) {
        graph.startAll();
        graph.completeTask(TASK_A);
        graph.completeTask(TASK_B);
        graph.pollTick(POLL_INTERVAL_MS);
        if (graph.lock.acquisitions !== 3) {
          unexpected = unexpected + 1;
        }
        graph.reset();
        if (graph.lock.acquisitions !== 0) {
          unexpected = unexpected + 1;
        }
      }
      logStep('CoreStress', 'unexpected lock totals ' + String(unexpected));
      expect(unexpected).assertEqual(0);
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.lock.rejections).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   lockResetDropsAllHoldersUnderRepetition
     * @tc.desc   Twenty noisy lock sessions all return to one clean state after reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('lockResetDropsAllHoldersUnderRepetition', 0, () => {
      const lock = new DependencyLock();
      let leaks = 0;
      for (let round = 0; round < 20; round++) {
        lock.acquireShared(TASK_A);
        lock.acquireShared(TASK_B);
        lock.acquireExclusive(TASK_C);
        lock.releaseShared(TASK_A);
        lock.reset();
        if (!lock.isUnlocked() || lock.acquisitions !== 0 || lock.rejections !== 0) {
          leaks = leaks + 1;
        }
      }
      logStep('CoreStress', 'lock leaks ' + String(leaks));
      expect(leaks).assertEqual(0);
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.waitingExclusive).assertFalse();
      expect(lock.sharedHolders.length).assertEqual(0);
      expect(lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   fingerprintsStableAcrossTenJourneys
     * @tc.desc   Ten identical journeys produce one distinct event fingerprint, so the trace has no hidden state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintsStableAcrossTenJourneys', 0, () => {
      const graph = createTaskGraph();
      const hashes: number[] = [];
      for (let cycle = 0; cycle < 10; cycle++) {
        graph.reset();
        graph.startAll();
        graph.completeTask(TASK_A);
        graph.completeTask(TASK_B);
        graph.pollTick(POLL_INTERVAL_MS);
        graph.completeTaskC(POLL_INTERVAL_MS);
        hashes.push(graph.events.fingerprint());
      }
      let distinct = 0;
      for (let index = 0; index < hashes.length; index++) {
        if (hashes.indexOf(hashes[index]) === index) {
          distinct = distinct + 1;
        }
      }
      logStep('CoreStress', 'distinct fingerprints ' + String(distinct));
      expect(hashes.length).assertEqual(10);
      expect(distinct).assertEqual(1);
      expect(hashes[0]).assertEqual(hashes[9]);
      expect(hashes[0]).assertEqual(textFingerprint(graph.eventTrace()));
      expect(graph.events.size()).assertEqual(11);
    });

    /**
     * @tc.name   fingerprintsDifferWhenCompletionOrderDiffers
     * @tc.desc   Swapping the A and B completion order yields a different hash, so the trace is order sensitive.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintsDifferWhenCompletionOrderDiffers', 0, () => {
      const forward = createTaskGraph();
      forward.startAll();
      forward.completeTask(TASK_A);
      forward.completeTask(TASK_B);
      forward.pollTick(POLL_INTERVAL_MS);
      const backward = createTaskGraph();
      backward.startAll();
      backward.completeTask(TASK_B);
      backward.completeTask(TASK_A);
      backward.pollTick(POLL_INTERVAL_MS);
      forward.completeTaskC(POLL_INTERVAL_MS);
      backward.completeTaskC(POLL_INTERVAL_MS);
      logStep('CoreStress', 'hashes ' + String(forward.events.fingerprint()) + '/' +
        String(backward.events.fingerprint()));
      expect(forward.events.size()).assertEqual(backward.events.size());
      expect(forward.events.fingerprint() === backward.events.fingerprint()).assertFalse();
      expect(forward.eventTrace() === backward.eventTrace()).assertFalse();
      expect(completionTrace(forward)).assertEqual('A|B|C');
      expect(completionTrace(backward)).assertEqual('B|A|C');
      expect(forward.events.countOf('unlocked')).assertEqual(backward.events.countOf('unlocked'));
    });

    /**
     * @tc.name   completionOrderLengthAlwaysThree
     * @tc.desc   Twenty journeys each record exactly three completions, never a duplicate or a missing row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completionOrderLengthAlwaysThree', 0, () => {
      const graph = createTaskGraph();
      let wrongLength = 0;
      let wrongHead = 0;
      for (let cycle = 0; cycle < 20; cycle++) {
        graph.reset();
        graph.startAll();
        graph.completeTask(TASK_B);
        graph.completeTask(TASK_A);
        graph.pollTick(POLL_INTERVAL_MS);
        graph.completeTaskC(POLL_INTERVAL_MS);
        if (graph.completionOrder.length !== 3) {
          wrongLength = wrongLength + 1;
        }
        if (graph.completionOrder[0] !== TASK_B) {
          wrongHead = wrongHead + 1;
        }
      }
      logStep('CoreStress', 'wrong lengths ' + String(wrongLength) + ' heads ' + String(wrongHead));
      expect(wrongLength).assertEqual(0);
      expect(wrongHead).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(graph.completionOrder[2]).assertEqual(TASK_C);
      expect(graph.allCompleted()).assertTrue();
    });

    /**
     * @tc.name   snapshotRowsGrowLinearlyWithCaptures
     * @tc.desc   Thirty captures over three tasks produce ninety rows and the growth is strictly linear.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotRowsGrowLinearlyWithCaptures', 0, () => {
      const graph = createTaskGraph();
      const log = new SnapshotLog();
      const steps: number[] = [];
      for (let capture = 0; capture < 30; capture++) {
        graph.pollTick(POLL_INTERVAL_MS);
        log.capture(graph.tasks);
        steps.push(log.size());
      }
      logStep('CoreStress', 'rows ' + String(steps[0]) + ' -> ' + String(steps[29]));
      expect(steps[0]).assertEqual(3);
      expect(steps[9]).assertEqual(30);
      expect(steps[19]).assertEqual(60);
      expect(steps[29]).assertEqual(90);
      expect(log.size()).assertEqual(90);
      expect(steps[29] - steps[28]).assertEqual(3);
    });

    /**
     * @tc.name   snapshotLogClearIsRepeatedlySafe
     * @tc.desc   Clearing the log twenty times in a row leaves it empty and ready for the next capture.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('snapshotLogClearIsRepeatedlySafe', 0, () => {
      const graph = createTaskGraph();
      const log = new SnapshotLog();
      log.capture(graph.tasks);
      for (let round = 0; round < 20; round++) {
        log.clear();
      }
      logStep('CoreStress', 'size after repeated clears ' + String(log.size()));
      expect(log.size()).assertEqual(0);
      expect(log.trace()).assertEqual('');
      expect(log.latest(TASK_A)).assertUndefined();
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(3);
      expect(log.trace()).assertEqual('A/idle/0|B/idle/0|C/idle/0');
    });

    /**
     * @tc.name   metricsAfterManyCyclesStayFull
     * @tc.desc   Every one of fifteen finished cycles reports three completed tasks and a full average.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsAfterManyCyclesStayFull', 0, () => {
      const graph = createTaskGraph();
      let wrong = 0;
      for (let cycle = 0; cycle < 15; cycle++) {
        graph.reset();
        graph.startAll();
        graph.completeTask(TASK_A);
        graph.completeTask(TASK_B);
        graph.pollTick(POLL_INTERVAL_MS);
        graph.completeTaskC(POLL_INTERVAL_MS);
        const metrics = NetworkMetrics.from(graph);
        if (metrics.completedTasks !== 3 || metrics.averageProgress() !== 100 || metrics.successRatio() !== 1) {
          wrong = wrong + 1;
        }
      }
      logStep('CoreStress', 'wrong metric cycles ' + String(wrong));
      expect(wrong).assertEqual(0);
      const finalMetrics = NetworkMetrics.from(graph);
      expect(finalMetrics.completedTasks).assertEqual(3);
      expect(finalMetrics.failedTasks).assertEqual(0);
      expect(finalMetrics.totalProgress).assertEqual(300);
      expect(finalMetrics.successRatio()).assertEqual(1);
    });

    /**
     * @tc.name   repeatedFailureAndRecoveryLeavesNoResidue
     * @tc.desc   Ten fail/reset cycles on one row never leave an error code or a full bar behind.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedFailureAndRecoveryLeavesNoResidue', 0, () => {
      const task = new DownloadTask(TASK_B, 'https://example.com/b.png');
      let residue = 0;
      for (let cycle = 0; cycle < 10; cycle++) {
        task.start(cycle * 100);
        task.reportProgress(20 + cycle);
        task.fail(ERROR_TIMEOUT);
        if (task.lastErrorCode !== ERROR_TIMEOUT) {
          residue = residue + 1;
        }
        task.reset();
        if (task.lastErrorCode !== 0 || task.progress !== 0 || task.status !== STATUS_IDLE) {
          residue = residue + 1;
        }
      }
      logStep('CoreStress', 'residue count ' + String(residue));
      expect(residue).assertEqual(0);
      expect(task.attempts).assertEqual(10);
      expect(task.progress).assertEqual(0);
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.lastErrorCode).assertEqual(0);
      expect(task.startedAt).assertEqual(0);
      expect(task.finishedAt).assertEqual(0);
    });

    /**
     * @tc.name   progressNeverExceedsHundredOverManyReports
     * @tc.desc   Two hundred mixed reports on a running row keep the value inside 0..100 at every step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('progressNeverExceedsHundredOverManyReports', 0, () => {
      const task = new DownloadTask(TASK_A, 'https://example.com/a.png');
      task.start(0);
      let outOfRange = 0;
      for (let step = 0; step < 200; step++) {
        const report = (step * 37) % 140 - 20;
        const value = task.reportProgress(report);
        if (value < 0 || value > PROGRESS_TOTAL) {
          outOfRange = outOfRange + 1;
        }
      }
      logStep('CoreStress', 'out of range reports ' + String(outOfRange));
      expect(outOfRange).assertEqual(0);
      expect(task.progress).assertEqual(PROGRESS_TOTAL);
      expect(task.progressRatio()).assertEqual(1);
      expect(task.label()).assertEqual('任务A当前进度 100%');
      expect(task.status).assertEqual(STATUS_RUNNING);
      expect(task.attempts).assertEqual(1);
    });

    /**
     * @tc.name   taskAttemptsGrowOnePerCycle
     * @tc.desc   Each start after a reset adds exactly one attempt, so the counter stays linear over twenty cycles.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('taskAttemptsGrowOnePerCycle', 0, () => {
      const task = new DownloadTask(TASK_C, 'https://example.com/c.png');
      for (let cycle = 0; cycle < 20; cycle++) {
        task.start(cycle);
        task.complete(cycle + 1);
        task.reset();
      }
      logStep('CoreStress', 'attempts after twenty cycles ' + String(task.attempts));
      expect(task.attempts).assertEqual(20);
      expect(task.attempts / 20).assertEqual(1);
      expect(task.status).assertEqual(STATUS_IDLE);
      expect(task.progress).assertEqual(0);
      expect(task.startedAt).assertEqual(0);
      expect(task.finishedAt).assertEqual(0);
    });

    /**
     * @tc.name   deepPollLoopStartsTaskCOnlyTime
     * @tc.desc   Thirty timer rounds after the gate opens start C on the first round and never again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deepPollLoopStartsTaskCOnlyTime', 0, () => {
      const graph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      let starts = 0;
      for (let round = 0; round < 30; round++) {
        if (graph.pollTick(POLL_INTERVAL_MS * (round + 1))) {
          starts = starts + 1;
        }
      }
      logStep('CoreStress', 'started rounds ' + String(starts) + ' of ' + String(graph.pollTicks));
      expect(starts).assertEqual(1);
      expect(graph.pollTicks).assertEqual(30);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTicks * POLL_INTERVAL_MS).assertEqual(6000);
    });

    /**
     * @tc.name   cycleTimestampsStayDeterministic
     * @tc.desc   Replaying the same timestamps in each cycle yields the same startedAt and finishedAt pair.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('cycleTimestampsStayDeterministic', 0, () => {
      const task = new DownloadTask(TASK_A, 'https://example.com/a.png');
      let mismatches = 0;
      for (let cycle = 0; cycle < 12; cycle++) {
        task.start(1000);
        task.complete(2000);
        if (task.startedAt !== 1000 || task.finishedAt !== 2000) {
          mismatches = mismatches + 1;
        }
        task.reset();
      }
      logStep('CoreStress', 'timestamp mismatches ' + String(mismatches));
      expect(mismatches).assertEqual(0);
      expect(task.startedAt).assertEqual(0);
      expect(task.finishedAt).assertEqual(0);
      expect(task.attempts).assertEqual(12);
      expect(task.status).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   totalProgressReturnsToZeroAfterEachReset
     * @tc.desc   Over twenty-five cycles the aggregate is 300 at the end of the journey and 0 right after reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('totalProgressReturnsToZeroAfterEachReset', 0, () => {
      const graph = createTaskGraph();
      let wrong = 0;
      for (let cycle = 0; cycle < 25; cycle++) {
        graph.startAll();
        graph.completeTask(TASK_A);
        graph.completeTask(TASK_B);
        graph.pollTick(POLL_INTERVAL_MS);
        graph.completeTaskC(POLL_INTERVAL_MS);
        if (graph.totalProgress() !== 300) {
          wrong = wrong + 1;
        }
        graph.reset();
        if (graph.totalProgress() !== 0) {
          wrong = wrong + 1;
        }
      }
      logStep('CoreStress', 'wrong totals ' + String(wrong));
      expect(wrong).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.averageProgress()).assertEqual(0);
      expect(graph.taskAt(0).progress).assertEqual(0);
      expect(graph.taskAt(1).progress).assertEqual(0);
      expect(graph.taskAt(2).progress).assertEqual(0);
    });

    /**
     * @tc.name   runningCountStaysTwoDuringManyStarts
     * @tc.desc   Across twenty starts the running count is two immediately after each accepted start.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('runningCountStaysTwoDuringManyStarts', 0, () => {
      const graph = createTaskGraph();
      let deviations = 0;
      for (let cycle = 0; cycle < 20; cycle++) {
        graph.reset();
        graph.startAll();
        if (graph.runningCount() !== 2) {
          deviations = deviations + 1;
        }
        if (graph.taskAt(2).status !== STATUS_IDLE) {
          deviations = deviations + 1;
        }
      }
      logStep('CoreStress', 'running deviations ' + String(deviations));
      expect(deviations).assertEqual(0);
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.taskAt(0).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(1).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.lock.sharedHolders.length).assertEqual(2);
    });

    /**
     * @tc.name   snapshotRowsStayConsistentUnderChurn
     * @tc.desc   Interleaving captures with state changes always yields whole triples, never a partial snapshot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('snapshotRowsStayConsistentUnderChurn', 0, () => {
      const graph = createTaskGraph();
      const log = new SnapshotLog();
      let ragged = 0;
      for (let cycle = 0; cycle < 8; cycle++) {
        graph.reset();
        graph.startAll();
        log.capture(graph.tasks);
        graph.completeTask(TASK_A);
        log.capture(graph.tasks);
        graph.completeTask(TASK_B);
        log.capture(graph.tasks);
        if (log.size() % 3 !== 0) {
          ragged = ragged + 1;
        }
      }
      logStep('CoreStress', 'ragged captures ' + String(ragged) + ' rows ' + String(log.size()));
      expect(ragged).assertEqual(0);
      expect(log.size()).assertEqual(72);
      expect(log.size() / 3).assertEqual(24);
      const latestC = log.latest(TASK_C) as RunSnapshot;
      expect(latestC.taskNo).assertEqual(TASK_C);
      expect(latestC.progress).assertEqual(0);
      expect(log.trace().split('|').length).assertEqual(72);
    });

    /**
     * @tc.name   pollClockCustomIntervalScalesLinearly
     * @tc.desc   A 50 ms clock reaches 2 000 ms after forty ticks, proving the interval is the only multiplier.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('pollClockCustomIntervalScalesLinearly', 0, () => {
      const clock = new PollClock(50);
      clock.start();
      for (let round = 0; round < 40; round++) {
        clock.tick();
      }
      logStep('CoreStress', 'custom clock ' + String(clock.elapsedMs));
      expect(clock.intervalMs).assertEqual(50);
      expect(clock.ticks).assertEqual(40);
      expect(clock.elapsedMs).assertEqual(2000);
      expect(clock.elapsedMs / clock.intervalMs).assertEqual(clock.ticks);
      expect(clock.isDueAfter(40)).assertTrue();
      expect(clock.isDueAfter(41)).assertFalse();
    });

    /**
     * @tc.name   largeRecorderFingerprintIsRepeatable
     * @tc.desc   A five hundred entry trace hashes to the same value on a rebuilt recorder with the same entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('largeRecorderFingerprintIsRepeatable', 0, () => {
      const first = new EventRecorder();
      const second = new EventRecorder();
      for (let index = 0; index < 500; index++) {
        const kind = index % 2 === 0 ? 'tick' : 'step';
        first.record(kind, String(index));
        second.record(kind, String(index));
      }
      logStep('CoreStress', 'large trace size ' + String(first.size()));
      expect(first.size()).assertEqual(500);
      expect(second.size()).assertEqual(500);
      expect(first.fingerprint()).assertEqual(second.fingerprint());
      expect(first.trace()).assertEqual(second.trace());
      expect(first.countOf('tick')).assertEqual(250);
      expect(first.countOf('step')).assertEqual(250);
      expect(first.last()).assertEqual('step:499');
    });

    /**
     * @tc.name   lockAlternatingAcquireReleaseStaysBalanced
     * @tc.desc   Fifty acquire/release pairs return the lock to unlocked without inflating the holder count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('lockAlternatingAcquireReleaseStaysBalanced', 0, () => {
      const lock = new DependencyLock();
      let unbalanced = 0;
      for (let round = 0; round < 50; round++) {
        lock.acquireShared(TASK_A);
        lock.acquireShared(TASK_B);
        lock.releaseShared(TASK_A);
        lock.releaseShared(TASK_B);
        if (!lock.isUnlocked() || lock.holderCount() !== 0) {
          unbalanced = unbalanced + 1;
        }
      }
      logStep('CoreStress', 'unbalanced rounds ' + String(unbalanced));
      expect(unbalanced).assertEqual(0);
      expect(lock.acquisitions).assertEqual(100);
      expect(lock.rejections).assertEqual(0);
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.isUnlocked()).assertTrue();
      expect(lock.sharedHolders.length).assertEqual(0);
    });

    /**
     * @tc.name   manyPollTicksDoNotMutateTaskState
     * @tc.desc   Calling sixty ticks in a row on an idle graph never starts anything or changes a row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreStress scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('manyPollTicksDoNotMutateTaskState', 0, () => {
      const graph = createTaskGraph();
      let starts = 0;
      for (let round = 0; round < 60; round++) {
        if (graph.pollTick(POLL_INTERVAL_MS * (round + 1))) {
          starts = starts + 1;
        }
      }
      logStep('CoreStress', 'idle polls started ' + String(starts) + ' after ' + String(graph.pollTicks));
      expect(starts).assertEqual(0);
      expect(graph.pollTicks).assertEqual(60);
      expect(graph.timerActive).assertFalse();
      expect(graph.runningCount()).assertEqual(0);
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.taskAt(0).progress).assertEqual(0);
    });
  });
}
