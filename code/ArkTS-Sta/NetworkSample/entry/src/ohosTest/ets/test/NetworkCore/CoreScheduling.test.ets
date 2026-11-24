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
 * CoreScheduling suite.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   65       checkTaskC holds the setInterval id
 *   188-197  setInterval(..., 200) and both clearInterval sites
 *   174-198  startAllTasks arms the check after A and B are started
 *
 * The suite pins the scheduling side of the sample: PollClock interval
 * accumulation, stop and restart semantics, isDueAfter, the timerActive
 * lifecycle of the graph, poll ticks on both sides of the gate, and the
 * integration of a clock with a TaskGraph.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  PollClock,
  TaskGraph,
  DownloadTask,
  createTaskGraph,
  POLL_INTERVAL_MS,
  TASK_A,
  TASK_B,
  TASK_C,
  countOf,
  joined
} from '../Shared/SharedDriver';

export default function networkCoreSchedulingTest(): void {
  describe('CoreScheduling', () => {
    beforeAll(() => {
      logSuite('CoreScheduling', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CoreScheduling', 'end');
    });

    /**
     * @tc.name   clockDefaultsToThePageInterval
     * @tc.desc   A new PollClock uses the 200 ms interval and starts stopped.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('clockDefaultsToThePageInterval', 0, () => {
      const clock: PollClock = new PollClock();
      expect(clock.intervalMs).assertEqual(POLL_INTERVAL_MS);
      expect(clock.intervalMs).assertEqual(200);
      expect(clock.active).assertFalse();
      expect(clock.ticks).assertEqual(0);
      expect(clock.elapsedMs).assertEqual(0);
    });

    /**
     * @tc.name   clockStartArmsAndZeroesTheCounters
     * @tc.desc   start() activates the clock and resets ticks and elapsed time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('clockStartArmsAndZeroesTheCounters', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      expect(clock.active).assertTrue();
      expect(clock.ticks).assertEqual(0);
      expect(clock.elapsedMs).assertEqual(0);
      expect(clock.isDueAfter(0)).assertTrue();
      expect(clock.isDueAfter(1)).assertFalse();
    });

    /**
     * @tc.name   clockTickAccumulatesTheInterval
     * @tc.desc   Each tick adds exactly one interval and returns the new elapsed time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('clockTickAccumulatesTheInterval', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      expect(clock.tick()).assertEqual(200);
      expect(clock.tick()).assertEqual(400);
      expect(clock.tick()).assertEqual(600);
      expect(clock.ticks).assertEqual(3);
      expect(clock.elapsedMs).assertEqual(600);
    });

    /**
     * @tc.name   clockTickIsInertWhileStopped
     * @tc.desc   A stopped clock returns its frozen elapsed time and never counts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clockTickIsInertWhileStopped', 0, () => {
      const clock: PollClock = new PollClock();
      expect(clock.tick()).assertEqual(0);
      expect(clock.ticks).assertEqual(0);
      clock.start();
      clock.tick();
      clock.stop();
      const frozen: number = clock.elapsedMs;
      expect(clock.tick()).assertEqual(frozen);
      expect(clock.ticks).assertEqual(1);
    });

    /**
     * @tc.name   clockStopFreezesWithoutClearing
     * @tc.desc   stop() only flips the flag; ticks and elapsed keep their values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clockStopFreezesWithoutClearing', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      clock.tick();
      clock.tick();
      clock.stop();
      expect(clock.active).assertFalse();
      expect(clock.ticks).assertEqual(2);
      expect(clock.elapsedMs).assertEqual(400);
      expect(clock.isDueAfter(2)).assertTrue();
    });

    /**
     * @tc.name   clockRestartResetsTheSchedule
     * @tc.desc   start() after a stop begins a fresh 200 ms schedule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clockRestartResetsTheSchedule', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      clock.tick();
      clock.tick();
      clock.stop();
      clock.start();
      expect(clock.ticks).assertEqual(0);
      expect(clock.elapsedMs).assertEqual(0);
      expect(clock.tick()).assertEqual(200);
      expect(clock.active).assertTrue();
    });
    /**
     * @tc.name   clockDueAfterComparesIntervalsWithElapsed
     * @tc.desc   isDueAfter is true exactly when interval times rounds is at most elapsed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clockDueAfterComparesIntervalsWithElapsed', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      clock.tick();
      expect(clock.isDueAfter(1)).assertTrue();
      expect(clock.isDueAfter(2)).assertFalse();
      clock.tick();
      expect(clock.isDueAfter(2)).assertTrue();
      expect(clock.isDueAfter(3)).assertFalse();
      expect(clock.isDueAfter(0)).assertTrue();
    });

    /**
     * @tc.name   clockDueBoundaryIsInclusive
     * @tc.desc   At exactly the boundary the predicate is true, one millisecond short it is false.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('clockDueBoundaryIsInclusive', 0, () => {
      const clock: PollClock = new PollClock(50);
      clock.start();
      clock.tick();
      clock.tick();
      expect(clock.elapsedMs).assertEqual(100);
      expect(clock.isDueAfter(2)).assertTrue();
      expect(clock.isDueAfter(3)).assertFalse();
      clock.stop();
      expect(clock.isDueAfter(2)).assertTrue();
      expect(clock.elapsedMs).assertEqual(100);
    });

    /**
     * @tc.name   clockHonoursACustomInterval
     * @tc.desc   A clock built with 500 ms counts in 500 ms steps.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clockHonoursACustomInterval', 0, () => {
      const clock: PollClock = new PollClock(500);
      clock.start();
      expect(clock.tick()).assertEqual(500);
      expect(clock.tick()).assertEqual(1000);
      expect(clock.ticks).assertEqual(2);
      expect(clock.isDueAfter(2)).assertTrue();
      expect(clock.isDueAfter(3)).assertFalse();
    });

    /**
     * @tc.name   clockElapsedIsTheProductOfTicksAndInterval
     * @tc.desc   After N ticks elapsed equals N times the interval for several N.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clockElapsedIsTheProductOfTicksAndInterval', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      const marks: number[] = [1, 2, 4, 8];
      for (let index = 0; index < marks.length; index++) {
        while (clock.ticks < marks[index]) {
          clock.tick();
        }
        expect(clock.elapsedMs).assertEqual(marks[index] * clock.intervalMs);
      }
      expect(clock.isDueAfter(8)).assertTrue();
      expect(clock.ticks).assertEqual(8);
    });

    /**
     * @tc.name   clockStartAfterStopResumesFromZero
     * @tc.desc   The restart does not carry the previous elapsed time into the new schedule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('clockStartAfterStopResumesFromZero', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      for (let index = 0; index < 5; index++) {
        clock.tick();
      }
      const before: number = clock.elapsedMs;
      clock.stop();
      clock.start();
      expect(before).assertEqual(1000);
      expect(clock.elapsedMs).assertEqual(0);
      expect(clock.ticks).assertEqual(0);
      clock.tick();
      expect(clock.elapsedMs).assertEqual(200);
      expect(clock.elapsedMs < before).assertTrue();
    });

    /**
     * @tc.name   clockDoubleStartResetsAgain
     * @tc.desc   Calling start() on an active clock is still a full reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('clockDoubleStartResetsAgain', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      clock.tick();
      clock.tick();
      clock.start();
      expect(clock.active).assertTrue();
      expect(clock.ticks).assertEqual(0);
      expect(clock.elapsedMs).assertEqual(0);
      expect(clock.isDueAfter(1)).assertFalse();
    });

    /**
     * @tc.name   clockDoubleStopIsHarmless
     * @tc.desc   Stopping an already stopped clock keeps the frozen counters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clockDoubleStopIsHarmless', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      clock.tick();
      clock.stop();
      clock.stop();
      expect(clock.active).assertFalse();
      expect(clock.ticks).assertEqual(1);
      expect(clock.elapsedMs).assertEqual(200);
      expect(clock.tick()).assertEqual(200);
    });

    /**
     * @tc.name   clockLargeIntervalNeedsFewerTicks
     * @tc.desc   A 1000 ms clock is due after one tick while the page clock needs five.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('clockLargeIntervalNeedsFewerTicks', 0, () => {
      const slow: PollClock = new PollClock(1000);
      const page: PollClock = new PollClock();
      slow.start();
      page.start();
      slow.tick();
      for (let index = 0; index < 5; index++) {
        page.tick();
      }
      expect(slow.isDueAfter(1)).assertTrue();
      expect(page.isDueAfter(5)).assertTrue();
      expect(slow.elapsedMs).assertEqual(page.elapsedMs);
      expect(slow.ticks < page.ticks).assertTrue();
    });

    /**
     * @tc.name   clockZeroRoundsIsAlwaysDue
     * @tc.desc   A schedule of zero rounds is due even before the first tick.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('clockZeroRoundsIsAlwaysDue', 0, () => {
      const clock: PollClock = new PollClock();
      expect(clock.isDueAfter(0)).assertTrue();
      clock.start();
      expect(clock.isDueAfter(0)).assertTrue();
      clock.stop();
      expect(clock.isDueAfter(0)).assertTrue();
      expect(clock.isDueAfter(1)).assertFalse();
    });

    /**
     * @tc.name   graphStartsWithAnIdleTimer
     * @tc.desc   No timer is armed before the user taps start.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphStartsWithAnIdleTimer', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.pollTick(200)).assertFalse();
      expect(graph.timerActive).assertFalse();
    });

    /**
     * @tc.name   graphStartArmsTheTimerWithoutTicking
     * @tc.desc   startAll sets timerActive but leaves pollTicks at zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphStartArmsTheTimerWithoutTicking', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.timerActive).assertTrue();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect((graph.taskByNo(TASK_C) as DownloadTask).isIdle()).assertTrue();
      expect(graph.lock.waitingExclusive).assertTrue();
    });

    /**
     * @tc.name   graphPollCountsTicksWithAClosedGate
     * @tc.desc   Each quiet tick increments pollTicks and records no event.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphPollCountsTicksWithAClosedGate', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const events: number = graph.events.size();
      for (let round = 1; round <= 5; round++) {
        expect(graph.pollTick(round * POLL_INTERVAL_MS)).assertFalse();
      }
      expect(graph.pollTicks).assertEqual(5);
      expect(graph.events.size()).assertEqual(events);
      expect(graph.timerActive).assertTrue();
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
    });

    /**
     * @tc.name   graphTimerClearsOnTheSuccessfulTick
     * @tc.desc   The tick that starts C is also the tick that clears the interval.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphTimerClearsOnTheSuccessfulTick', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      expect(graph.timerActive).assertTrue();
      expect(graph.pollTick(200)).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.events.last()).assertEqual('timer-cleared:C');
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
    });

    /**
     * @tc.name   graphTimerStaysOffAfterTheClear
     * @tc.desc   Later ticks still count but cannot start anything nor re-clear the timer.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphTimerStaysOffAfterTheClear', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      const attempts: number = (graph.taskByNo(TASK_C) as DownloadTask).attempts;
      expect(graph.pollTick(400)).assertFalse();
      expect(graph.pollTick(600)).assertFalse();
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTicks).assertEqual(3);
      expect((graph.taskByNo(TASK_C) as DownloadTask).attempts).assertEqual(attempts);
    });

    /**
     * @tc.name   graphResetDisarmsTheTimer
     * @tc.desc   reset() sets timerActive false and pollTicks zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphResetDisarmsTheTimer', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.pollTick(200);
      expect(graph.timerActive).assertTrue();
      graph.reset();
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.pollTick(400)).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
    });

    /**
     * @tc.name   graphRejectsStartWhileTheTimerRuns
     * @tc.desc   The timer state is a run marker: a second start is refused mid-run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphRejectsStartWhileTheTimerRuns', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.pollTick(200);
      expect(graph.startAll()).assertFalse();
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      expect(graph.events.last()).assertEqual('start-rejected:1');
      expect(graph.timerActive).assertTrue();
      expect((graph.taskByNo(TASK_A) as DownloadTask).attempts).assertEqual(1);
    });

    /**
     * @tc.name   graphTimerDoesNotBlockACompletedRunRestart
     * @tc.desc   Once the run is reset the timer can be armed again from scratch.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphTimerDoesNotBlockACompletedRunRestart', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      graph.completeTaskC(400);
      expect(graph.timerActive).assertFalse();
      graph.reset();
      expect(graph.startAll()).assertTrue();
      expect(graph.timerActive).assertTrue();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.events.countOf('start-all')).assertEqual(1);
    });
    /**
     * @tc.name   clockAndGraphAdvanceOneTickAtATime
     * @tc.desc   Driving the clock and the graph together keeps the two counters equal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clockAndGraphAdvanceOneTickAtATime', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const clock: PollClock = new PollClock();
      graph.startAll();
      clock.start();
      expect(graph.pollTick(clock.tick())).assertFalse();
      expect(graph.pollTick(clock.tick())).assertFalse();
      expect(clock.ticks).assertEqual(2);
      expect(graph.pollTicks).assertEqual(2);
      expect(clock.elapsedMs).assertEqual(400);
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   clockDrivesGateChecksUntilTheUnlock
     * @tc.desc   With both dependencies done the next scheduled tick starts C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clockDrivesGateChecksUntilTheUnlock', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const clock: PollClock = new PollClock();
      graph.startAll();
      clock.start();
      graph.completeTask(TASK_A);
      while (clock.ticks < 3) {
        expect(graph.pollTick(clock.tick())).assertFalse();
      }
      graph.completeTask(TASK_B);
      const elapsed: number = clock.tick();
      expect(graph.pollTick(elapsed)).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect((graph.taskByNo(TASK_C) as DownloadTask).startedAt).assertEqual(elapsed);
      expect(clock.ticks).assertEqual(4);
    });

    /**
     * @tc.name   clockStopsWhenTheGraphClearsTheTimer
     * @tc.desc   The clearInterval site maps to a clock stop once timerActive is false.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clockStopsWhenTheGraphClearsTheTimer', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const clock: PollClock = new PollClock();
      graph.startAll();
      clock.start();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      clock.tick();
      expect(graph.pollTick(clock.elapsedMs)).assertTrue();
      if (!graph.timerActive) {
        clock.stop();
      }
      expect(clock.active).assertFalse();
      expect(clock.elapsedMs).assertEqual(200);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
    });

    /**
     * @tc.name   clockTicksBeforeTheUnlockNeverStartTheTask
     * @tc.desc   Only a gate check after the second completion can succeed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('clockTicksBeforeTheUnlockNeverStartTheTask', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const clock: PollClock = new PollClock();
      graph.startAll();
      clock.start();
      graph.completeTask(TASK_B);
      for (let round = 0; round < 4; round++) {
        expect(graph.pollTick(clock.tick())).assertFalse();
        expect((graph.taskByNo(TASK_C) as DownloadTask).isIdle()).assertTrue();
      }
      expect(clock.ticks).assertEqual(4);
      expect(graph.pollTicks).assertEqual(4);
      expect(graph.timerActive).assertTrue();
      expect(graph.events.countOf('started')).assertEqual(2);
    });

    /**
     * @tc.name   clockElapsedAtUnlockIsAnIntervalMultiple
     * @tc.desc   The caller clock handed to the successful tick is a multiple of 200.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('clockElapsedAtUnlockIsAnIntervalMultiple', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const clock: PollClock = new PollClock();
      graph.startAll();
      clock.start();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      clock.tick();
      clock.tick();
      clock.tick();
      expect(graph.pollTick(clock.elapsedMs)).assertTrue();
      expect(clock.elapsedMs).assertEqual(600);
      expect(clock.elapsedMs % POLL_INTERVAL_MS).assertEqual(0);
      expect(clock.isDueAfter(3)).assertTrue();
      expect(clock.isDueAfter(4)).assertFalse();
    });

    /**
     * @tc.name   clockRestartMatchesTheSecondRunCycle
     * @tc.desc   After a reset the clock is restarted, so its counters start at zero again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clockRestartMatchesTheSecondRunCycle', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const clock: PollClock = new PollClock();
      graph.startAll();
      clock.start();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      clock.tick();
      graph.pollTick(clock.elapsedMs);
      clock.stop();
      expect(clock.ticks).assertEqual(1);
      graph.reset();
      graph.startAll();
      clock.start();
      expect(clock.ticks).assertEqual(0);
      expect(clock.elapsedMs).assertEqual(0);
      expect(clock.active).assertTrue();
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   clockDueAfterTracksEveryAccumulatedInterval
     * @tc.desc   After N ticks the predicate holds for N rounds and fails for N plus one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clockDueAfterTracksEveryAccumulatedInterval', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      expect(clock.isDueAfter(1)).assertFalse();
      clock.tick();
      expect(clock.isDueAfter(1)).assertTrue();
      expect(clock.isDueAfter(2)).assertFalse();
      clock.tick();
      clock.tick();
      expect(clock.isDueAfter(3)).assertTrue();
      expect(clock.isDueAfter(4)).assertFalse();
      expect(clock.ticks).assertEqual(3);
    });

    /**
     * @tc.name   clockLongRunKeepsTheArithmeticExact
     * @tc.desc   Fifty ticks of the page clock total exactly ten seconds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('clockLongRunKeepsTheArithmeticExact', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      for (let index = 0; index < 50; index++) {
        clock.tick();
      }
      expect(clock.ticks).assertEqual(50);
      expect(clock.elapsedMs).assertEqual(10000);
      expect(clock.isDueAfter(50)).assertTrue();
      expect(clock.isDueAfter(51)).assertFalse();
      expect(clock.elapsedMs / clock.intervalMs).assertEqual(clock.ticks);
    });

    /**
     * @tc.name   clockStoppedBeforeTheGateOpensCannotTick
     * @tc.desc   A stopped clock keeps its elapsed time, so the graph sees a stale tick.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('clockStoppedBeforeTheGateOpensCannotTick', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const clock: PollClock = new PollClock();
      graph.startAll();
      clock.start();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      clock.stop();
      const stale: number = clock.tick();
      expect(stale).assertEqual(0);
      expect(clock.ticks).assertEqual(0);
      expect(graph.pollTick(stale)).assertTrue();
      expect((graph.taskByNo(TASK_C) as DownloadTask).startedAt).assertEqual(0);
      expect(graph.timerActive).assertFalse();
    });

    /**
     * @tc.name   clockIntervalMatchesThePollConstant
     * @tc.desc   The default clock interval is the same 200 ms the page passes to setInterval.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('clockIntervalMatchesThePollConstant', 0, () => {
      const clock: PollClock = new PollClock();
      expect(clock.intervalMs).assertEqual(POLL_INTERVAL_MS);
      clock.start();
      expect(clock.tick()).assertEqual(POLL_INTERVAL_MS);
      expect(clock.elapsedMs).assertEqual(POLL_INTERVAL_MS);
      expect(clock.intervalMs * 5).assertEqual(1000);
    });

    /**
     * @tc.name   timerLifecycleCoversStartWaitClearStop
     * @tc.desc   The graph timer flag follows armed, armed, cleared, off states.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timerLifecycleCoversStartWaitClearStop', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const states: boolean[] = [];
      states.push(graph.timerActive);
      graph.startAll();
      states.push(graph.timerActive);
      graph.pollTick(200);
      states.push(graph.timerActive);
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(400);
      states.push(graph.timerActive);
      graph.reset();
      states.push(graph.timerActive);
      const rendered: string[] = [];
      for (let index = 0; index < states.length; index++) {
        rendered.push(String(states[index]));
      }
      expect(joined(rendered, ',')).assertEqual('false,true,true,false,false');
      expect(states.length).assertEqual(5);
    });

    /**
     * @tc.name   clockStateIsIndependentOfTheGraphTimer
     * @tc.desc   The model clock keeps running even after the graph has cleared its timer.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('clockStateIsIndependentOfTheGraphTimer', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const clock: PollClock = new PollClock();
      graph.startAll();
      clock.start();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      clock.tick();
      graph.pollTick(clock.elapsedMs);
      expect(graph.timerActive).assertFalse();
      expect(clock.active).assertTrue();
      expect(clock.tick()).assertEqual(400);
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
    });

    /**
     * @tc.name   graphTickClockIsMonotoneThroughAWaitedRun
     * @tc.desc   Tick timestamps passed to pollTick strictly increase.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphTickClockIsMonotoneThroughAWaitedRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const clock: PollClock = new PollClock();
      const stamps: number[] = [];
      graph.startAll();
      clock.start();
      graph.completeTask(TASK_A);
      for (let round = 0; round < 3; round++) {
        stamps.push(clock.tick());
        graph.pollTick(stamps[stamps.length - 1]);
      }
      graph.completeTask(TASK_B);
      stamps.push(clock.tick());
      expect(graph.pollTick(stamps[stamps.length - 1])).assertTrue();
      expect(stamps[0]).assertEqual(200);
      expect(stamps[3]).assertEqual(800);
      expect(stamps[2] < stamps[3]).assertTrue();
    });

    /**
     * @tc.name   clockRestartAfterClearReplaysTheSameIntervalSequence
     * @tc.desc   A restarted clock produces 200, 400, 600 again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clockRestartAfterClearReplaysTheSameIntervalSequence', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      clock.tick();
      clock.tick();
      clock.stop();
      clock.start();
      const replay: number[] = [];
      replay.push(clock.tick());
      replay.push(clock.tick());
      replay.push(clock.tick());
      const rendered: string[] = [];
      for (let index = 0; index < replay.length; index++) {
        rendered.push(String(replay[index]));
      }
      expect(joined(rendered, ',')).assertEqual('200,400,600');
      expect(replay[2]).assertEqual(3 * POLL_INTERVAL_MS);
      expect(clock.active).assertTrue();
    });

    /**
     * @tc.name   graphPollAfterTheClearIsCheapButCounted
     * @tc.desc   A tick on a cleared timer still advances pollTicks by one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphPollAfterTheClearIsCheapButCounted', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick(200);
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.pollTick(400)).assertFalse();
      expect(graph.pollTick(600)).assertFalse();
      expect(graph.pollTicks).assertEqual(3);
      expect(graph.events.countOf('started')).assertEqual(3);
    });

    /**
     * @tc.name   scheduledUnlockUsesTheLastQuietTickPlusOne
     * @tc.desc   The first tick after the second completion is the one that starts C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('scheduledUnlockUsesTheLastQuietTickPlusOne', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const clock: PollClock = new PollClock();
      graph.startAll();
      clock.start();
      graph.completeTask(TASK_A);
      clock.tick();
      graph.pollTick(clock.elapsedMs);
      graph.completeTask(TASK_B);
      const quietTicks: number = graph.pollTicks;
      clock.tick();
      expect(graph.pollTick(clock.elapsedMs)).assertTrue();
      expect(graph.pollTicks).assertEqual(quietTicks + 1);
      expect(clock.elapsedMs).assertEqual(2 * POLL_INTERVAL_MS);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      logStep('CoreScheduling', joined(graph.events.entries, '|'));
    });
    /**
     * @tc.name   clockAndGraphTrackSeparateCounters
     * @tc.desc   Clock ticks and graph pollTicks only match when the run starts them together.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CoreScheduling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('clockAndGraphTrackSeparateCounters', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const clock: PollClock = new PollClock();
      clock.start();
      clock.tick();
      clock.tick();
      expect(clock.ticks).assertEqual(2);
      expect(graph.pollTicks).assertEqual(0);
      graph.pollTick(clock.elapsedMs);
      expect(graph.pollTicks).assertEqual(1);
      expect(clock.ticks).assertEqual(2);
      expect(graph.timerActive).assertFalse();
      expect(graph.events.size()).assertEqual(0);
      expect(graph.eventTrace()).assertEqual('');
      expect(graph.eventTrace().length).assertEqual(0);
    });
  });
}
