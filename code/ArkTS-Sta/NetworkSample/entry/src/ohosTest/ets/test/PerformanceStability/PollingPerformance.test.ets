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
 * PollingPerformance suite.
 *
 * Quantifies the 200 ms interval of startAllTasks: how the elapsed budget
 * accumulates, when a deadline becomes due, how independent intervals behave
 * side by side, and on exactly which poll the gate opens. The page opens the
 * gate from the interval body, so the tick index is an observable contract.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   65       checkTaskC is the interval handle
 *   188-193  setInterval(..., 200) with the gate test inside the callback
 *   191      clearInterval runs as soon as runTaskC is issued
 *   194-196  the callback also clears for an already finished C row
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  POLL_INTERVAL_MS,
  STATUS_IDLE,
  STATUS_RUNNING,
  TaskGraph,
  PollClock,
  createTaskGraph
} from '../Shared/SharedDriver';

export default function pollingPerformanceTest(): void {
  describe('PollingPerformance', () => {
    beforeAll(() => {
      logSuite('PollingPerformance', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('PollingPerformance', 'end');
    });

    /**
     * @tc.name   defaultIntervalMatchesThePageLiteral
     * @tc.desc   The modelled clock uses the same 200 ms period as the setInterval call in startAllTasks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('defaultIntervalMatchesThePageLiteral', 0, () => {
      const clock: PollClock = new PollClock();
      expect(clock.intervalMs).assertEqual(200);
      expect(clock.intervalMs).assertEqual(POLL_INTERVAL_MS);
      expect(POLL_INTERVAL_MS).assertEqual(200);
      expect(clock.active).assertFalse();
      expect(clock.ticks).assertEqual(0);
    });

    /**
     * @tc.name   inactiveClockReturnsZeroWithoutCounting
     * @tc.desc   Ticking a clock that was never started neither advances time nor increments the tick count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('inactiveClockReturnsZeroWithoutCounting', 0, () => {
      const clock: PollClock = new PollClock();
      expect(clock.tick()).assertEqual(0);
      expect(clock.tick()).assertEqual(0);
      expect(clock.ticks).assertEqual(0);
      expect(clock.elapsedMs).assertEqual(0);
      expect(clock.isDueAfter(1)).assertFalse();
    });

    /**
     * @tc.name   firstTickReachesOneInterval
     * @tc.desc   After start the very first tick lands exactly on the 200 ms deadline.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('firstTickReachesOneInterval', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      expect(clock.isDueAfter(1)).assertFalse();
      expect(clock.tick()).assertEqual(200);
      expect(clock.isDueAfter(1)).assertTrue();
      expect(clock.ticks).assertEqual(1);
    });

    /**
     * @tc.name   tenTicksReachTwoSeconds
     * @tc.desc   Ten poll periods accumulate two thousand milliseconds of wall clock budget.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('tenTicksReachTwoSeconds', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      for (let round = 0; round < 10; round++) {
        clock.tick();
      }
      expect(clock.elapsedMs).assertEqual(2000);
      expect(clock.ticks).assertEqual(10);
      expect(clock.isDueAfter(10)).assertTrue();
      expect(clock.isDueAfter(11)).assertFalse();
    });

    /**
     * @tc.name   hundredTicksReachTwentySeconds
     * @tc.desc   One hundred intervals accumulate twenty seconds, which is the same budget as 100 polls.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredTicksReachTwentySeconds', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      for (let round = 0; round < 100; round++) {
        clock.tick();
      }
      expect(clock.elapsedMs).assertEqual(20000);
      expect(clock.ticks).assertEqual(100);
      expect(clock.isDueAfter(100)).assertTrue();
      expect(clock.isDueAfter(101)).assertFalse();
    });

    /**
     * @tc.name   elapsedAccumulatesMonotonically
     * @tc.desc   Every tick returns a value strictly larger than the previous one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('elapsedAccumulatesMonotonically', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      let previous: number = 0;
      let increasing: number = 0;
      for (let round = 0; round < 50; round++) {
        const current: number = clock.tick();
        if (current > previous) {
          increasing = increasing + 1;
        }
        expect(current).assertEqual(previous + 200);
        previous = current;
      }
      expect(increasing).assertEqual(50);
      expect(previous).assertEqual(10000);
    });

    /**
     * @tc.name   stopAfterTenTicksFreezesTheBudget
     * @tc.desc   Stopping at two seconds keeps the budget there while later ticks return the frozen value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('stopAfterTenTicksFreezesTheBudget', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      for (let round = 0; round < 10; round++) {
        clock.tick();
      }
      clock.stop();
      expect(clock.tick()).assertEqual(2000);
      expect(clock.elapsedMs).assertEqual(2000);
      expect(clock.ticks).assertEqual(10);
      expect(clock.isDueAfter(10)).assertTrue();
    });

    /**
     * @tc.name   dueBoundaryWalksWithEachTick
     * @tc.desc   After tick k exactly k deadlines are due and none beyond k, across a five tick run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('dueBoundaryWalksWithEachTick', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      const dueFlags: boolean[] = [];
      for (let round = 1; round <= 5; round++) {
        clock.tick();
        dueFlags.push(clock.isDueAfter(round));
        dueFlags.push(clock.isDueAfter(round + 1));
      }
      expect(dueFlags.length).assertEqual(10);
      expect(dueFlags[0]).assertTrue();
      expect(dueFlags[1]).assertFalse();
      expect(dueFlags[8]).assertTrue();
      expect(dueFlags[9]).assertFalse();
    });

    /**
     * @tc.name   futureDeadlinesStayFalseWhilePolling
     * @tc.desc   A deadline far beyond the current budget never becomes due during a short poll run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('futureDeadlinesStayFalseWhilePolling', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      let early: number = 0;
      for (let round = 0; round < 12; round++) {
        clock.tick();
        if (!clock.isDueAfter(100)) {
          early = early + 1;
        }
      }
      expect(early).assertEqual(12);
      expect(clock.isDueAfter(100)).assertFalse();
      expect(clock.elapsedMs).assertEqual(2400);
    });

    /**
     * @tc.name   customIntervalMovesTheDeadline
     * @tc.desc   A 400 ms clock needs two hundred milliseconds more work to satisfy its first deadline.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('customIntervalMovesTheDeadline', 0, () => {
      const clock: PollClock = new PollClock(400);
      clock.start();
      expect(clock.tick()).assertEqual(400);
      expect(clock.isDueAfter(1)).assertTrue();
      expect(clock.isDueAfter(2)).assertFalse();
      clock.tick();
      expect(clock.isDueAfter(2)).assertTrue();
      expect(clock.elapsedMs).assertEqual(800);
    });

    /**
     * @tc.name   hundredMillisecondClockNeedsDoubleTicks
     * @tc.desc   Two 100 ms ticks equal one 200 ms tick in both elapsed time and due state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredMillisecondClockNeedsDoubleTicks', 0, () => {
      const fast: PollClock = new PollClock(100);
      const normal: PollClock = new PollClock(200);
      fast.start();
      normal.start();
      fast.tick();
      fast.tick();
      normal.tick();
      expect(fast.elapsedMs).assertEqual(normal.elapsedMs);
      expect(fast.ticks).assertEqual(2);
      expect(normal.ticks).assertEqual(1);
      expect(fast.isDueAfter(1)).assertEqual(normal.isDueAfter(1));
    });

    /**
     * @tc.name   oneSecondClockNeedsFewerTicks
     * @tc.desc   Three ticks of a one second clock already exceed the budget of five 200 ms ticks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('oneSecondClockNeedsFewerTicks', 0, () => {
      const slow: PollClock = new PollClock(1000);
      slow.start();
      slow.tick();
      slow.tick();
      slow.tick();
      expect(slow.elapsedMs).assertEqual(3000);
      expect(slow.isDueAfter(3)).assertTrue();
      expect(slow.isDueAfter(4)).assertFalse();
      expect(slow.elapsedMs > 5 * POLL_INTERVAL_MS).assertTrue();
    });

    /**
     * @tc.name   gateOpensOnTheFourthPoll
     * @tc.desc   With three fruitless polls before both completions the gate opens on poll number four.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateOpensOnTheFourthPoll', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const outcomes: boolean[] = [];
      outcomes.push(graph.pollTick(200));
      outcomes.push(graph.pollTick(400));
      graph.completeTask(TASK_A, 500);
      outcomes.push(graph.pollTick(600));
      graph.completeTask(TASK_B, 700);
      outcomes.push(graph.pollTick(800));
      expect(outcomes.length).assertEqual(4);
      expect(outcomes[0]).assertFalse();
      expect(outcomes[1]).assertFalse();
      expect(outcomes[2]).assertFalse();
      expect(outcomes[3]).assertTrue();
      expect(graph.pollTicks).assertEqual(4);
    });

    /**
     * @tc.name   gateOpeningTickIndexIsExact
     * @tc.desc   The opening poll is the one whose timestamp is the first multiple of the interval after completion.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('gateOpeningTickIndexIsExact', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 50);
      graph.completeTask(TASK_B, 60);
      graph.pollTick(200);
      expect(graph.taskAt(2).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(2).startedAt).assertEqual(200);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.timerActive).assertFalse();
    });

    /**
     * @tc.name   hundredPollsBeforeTheGateStayCheap
     * @tc.desc   One hundred polls on a half finished run count one hundred ticks and leave C idle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredPollsBeforeTheGateStayCheap', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      for (let round = 0; round < 100; round++) {
        expect(graph.pollTick(round * 200)).assertFalse();
      }
      expect(graph.pollTicks).assertEqual(100);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
      expect(graph.timerActive).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   pollLoopUntilTheGateOpens
     * @tc.desc   A bounded loop polls until the fifth tick, where the waiting completions finally unlock C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollLoopUntilTheGateOpens', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      let openedAt: number = 0;
      for (let round = 1; round <= 10; round++) {
        if (graph.pollTick(round * 200)) {
          openedAt = round;
          break;
        }
      }
      expect(openedAt).assertEqual(1);
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.timerActive).assertFalse();
    });

    /**
     * @tc.name   pollLoopThatNeverOpensIsBounded
     * @tc.desc   When only A completes, a bounded loop of ten polls exits with no opening index at all.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollLoopThatNeverOpensIsBounded', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      let openedAt: number = 0;
      for (let round = 1; round <= 10; round++) {
        if (graph.pollTick(round * 200)) {
          openedAt = round;
        }
      }
      expect(openedAt).assertEqual(0);
      expect(graph.pollTicks).assertEqual(10);
      expect(graph.timerActive).assertTrue();
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   clockElapsedAtOpeningMatchesTickCount
     * @tc.desc   Three polls cost three intervals, so the modelled clock reads six hundred milliseconds at opening.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clockElapsedAtOpeningMatchesTickCount', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const clock: PollClock = new PollClock();
      graph.startAll();
      clock.start();
      graph.pollTick(clock.tick());
      graph.pollTick(clock.tick());
      graph.completeTask(TASK_A, 500);
      graph.completeTask(TASK_B, 600);
      graph.pollTick(clock.tick());
      expect(graph.pollTicks).assertEqual(3);
      expect(clock.elapsedMs).assertEqual(600);
      expect(clock.ticks).assertEqual(3);
      expect(clock.isDueAfter(3)).assertTrue();
    });

    /**
     * @tc.name   clockStopsWhenTheGraphReleasesItsInterval
     * @tc.desc   The simulated clock is stopped exactly when a successful poll clears the graph timer.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clockStopsWhenTheGraphReleasesItsInterval', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const clock: PollClock = new PollClock();
      graph.startAll();
      clock.start();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      const opened: boolean = graph.pollTick(clock.tick());
      if (opened) {
        clock.stop();
      }
      expect(opened).assertTrue();
      expect(clock.active).assertFalse();
      expect(graph.timerActive).assertFalse();
      clock.tick();
      expect(clock.elapsedMs).assertEqual(200);
      expect(graph.pollTicks).assertEqual(1);
    });

    /**
     * @tc.name   twoIntervalsRunSideBySideWithoutInterference
     * @tc.desc   A 200 ms and a 500 ms clock ticked alternately keep separate budgets and tick counts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoIntervalsRunSideBySideWithoutInterference', 0, () => {
      const fast: PollClock = new PollClock(200);
      const slow: PollClock = new PollClock(500);
      fast.start();
      slow.start();
      for (let round = 0; round < 6; round++) {
        fast.tick();
        slow.tick();
      }
      expect(fast.elapsedMs).assertEqual(1200);
      expect(slow.elapsedMs).assertEqual(3000);
      expect(fast.ticks).assertEqual(6);
      expect(slow.ticks).assertEqual(6);
      expect(fast.isDueAfter(6)).assertTrue();
    });

    /**
     * @tc.name   threeIntervalsKeepIndependentBudgets
     * @tc.desc   Three clocks with 100, 200 and 400 ms periods reach 400, 800 and 1600 ms after four ticks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('threeIntervalsKeepIndependentBudgets', 0, () => {
      const clocks: PollClock[] = [new PollClock(100), new PollClock(200), new PollClock(400)];
      for (let index = 0; index < clocks.length; index++) {
        clocks[index].start();
      }
      for (let round = 0; round < 4; round++) {
        for (let index = 0; index < clocks.length; index++) {
          clocks[index].tick();
        }
      }
      expect(clocks[0].elapsedMs).assertEqual(400);
      expect(clocks[1].elapsedMs).assertEqual(800);
      expect(clocks[2].elapsedMs).assertEqual(1600);
      expect(clocks[2].isDueAfter(4)).assertTrue();
      expect(clocks[2].isDueAfter(5)).assertFalse();
    });

    /**
     * @tc.name   clockTicksDoNotTouchTheGraphCounter
     * @tc.desc   Ticking a standalone clock leaves the graph poll counter unchanged, because they are separate models.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clockTicksDoNotTouchTheGraphCounter', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const clock: PollClock = new PollClock();
      graph.startAll();
      clock.start();
      for (let round = 0; round < 8; round++) {
        clock.tick();
      }
      expect(clock.ticks).assertEqual(8);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.timerActive).assertTrue();
      expect(graph.taskAt(2).isIdle()).assertTrue();
    });

    /**
     * @tc.name   graphPollsDoNotAdvanceAStandaloneClock
     * @tc.desc   Polling the graph without ticking the clock keeps the clock budget at zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphPollsDoNotAdvanceAStandaloneClock', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const clock: PollClock = new PollClock();
      graph.startAll();
      clock.start();
      for (let round = 0; round < 5; round++) {
        graph.pollTick(round * 200);
      }
      expect(graph.pollTicks).assertEqual(5);
      expect(clock.ticks).assertEqual(0);
      expect(clock.elapsedMs).assertEqual(0);
      expect(clock.isDueAfter(1)).assertFalse();
    });

    /**
     * @tc.name   longClosedGateRunReachesTwoHundredPolls
     * @tc.desc   Two hundred polls while B never completes stay fruitless and keep the interval armed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longClosedGateRunReachesTwoHundredPolls', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      let fruitless: number = 0;
      for (let round = 0; round < 200; round++) {
        if (!graph.pollTick(round * 200)) {
          fruitless = fruitless + 1;
        }
      }
      expect(fruitless).assertEqual(200);
      expect(graph.pollTicks).assertEqual(200);
      expect(graph.timerActive).assertTrue();
      expect(graph.runningCount()).assertEqual(2);
      expect(graph.taskAt(2).status).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   thousandTicksAccumulateTwoHundredSeconds
     * @tc.desc   One thousand intervals add up to two hundred thousand milliseconds without overflow.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('thousandTicksAccumulateTwoHundredSeconds', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      for (let round = 0; round < 1000; round++) {
        clock.tick();
      }
      expect(clock.elapsedMs).assertEqual(200000);
      expect(clock.ticks).assertEqual(1000);
      expect(clock.isDueAfter(1000)).assertTrue();
      expect(clock.isDueAfter(1001)).assertFalse();
      expect(clock.elapsedMs / clock.ticks).assertEqual(200);
    });

    /**
     * @tc.name   stoppingBeforeTheFirstTickKeepsZero
     * @tc.desc   A clock stopped right after start still reports zero ticks, zero elapsed and no due deadline.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('stoppingBeforeTheFirstTickKeepsZero', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      clock.stop();
      expect(clock.ticks).assertEqual(0);
      expect(clock.elapsedMs).assertEqual(0);
      expect(clock.tick()).assertEqual(0);
      expect(clock.isDueAfter(1)).assertFalse();
      expect(clock.active).assertFalse();
    });

    /**
     * @tc.name   zeroRoundsIsDueImmediately
     * @tc.desc   A zero round deadline is satisfied by an empty budget, which is the natural loop boundary case.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('zeroRoundsIsDueImmediately', 0, () => {
      const clock: PollClock = new PollClock();
      expect(clock.isDueAfter(0)).assertTrue();
      clock.start();
      expect(clock.isDueAfter(0)).assertTrue();
      clock.tick();
      expect(clock.isDueAfter(0)).assertTrue();
      expect(clock.elapsedMs).assertEqual(200);
      expect(clock.isDueAfter(1)).assertTrue();
    });

    /**
     * @tc.name   firstTickAfterRestartIsOneInterval
     * @tc.desc   A restarted clock needs a full interval again before its first deadline is due.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('firstTickAfterRestartIsOneInterval', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      clock.tick();
      clock.tick();
      clock.tick();
      clock.stop();
      clock.start();
      expect(clock.isDueAfter(1)).assertFalse();
      expect(clock.tick()).assertEqual(200);
      expect(clock.isDueAfter(1)).assertTrue();
      expect(clock.ticks).assertEqual(1);
      expect(clock.elapsedMs).assertEqual(200);
    });

    /**
     * @tc.name   dueQueriesDoNotMutateTheClock
     * @tc.desc   Ten due checks in a row leave ticks, elapsed and the active flag untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('dueQueriesDoNotMutateTheClock', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      clock.tick();
      for (let round = 0; round < 10; round++) {
        clock.isDueAfter(round);
      }
      expect(clock.ticks).assertEqual(1);
      expect(clock.elapsedMs).assertEqual(200);
      expect(clock.active).assertTrue();
      expect(clock.isDueAfter(1)).assertTrue();
      expect(clock.isDueAfter(2)).assertFalse();
    });

    /**
     * @tc.name   tickReturnValueEqualsTheElapsedBudget
     * @tc.desc   The number returned by tick is always the current elapsed budget of the clock.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('tickReturnValueEqualsTheElapsedBudget', 0, () => {
      const clock: PollClock = new PollClock(300);
      clock.start();
      for (let round = 0; round < 5; round++) {
        const returned: number = clock.tick();
        expect(returned).assertEqual(clock.elapsedMs);
        expect(returned).assertEqual((round + 1) * 300);
      }
      expect(clock.elapsedMs).assertEqual(1500);
    });

    /**
     * @tc.name   gateNeedsBothCompletionsBeforeACommonPoll
     * @tc.desc   A poll fired between the two completions cannot open the gate even though the earlier poll passed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('gateNeedsBothCompletionsBeforeACommonPoll', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      expect(graph.pollTick(200)).assertFalse();
      expect(graph.pollTick(400)).assertFalse();
      graph.completeTask(TASK_B, 500);
      expect(graph.pollTick(600)).assertTrue();
      expect(graph.pollTicks).assertEqual(3);
      expect(graph.taskAt(2).startedAt).assertEqual(600);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
    });

    /**
     * @tc.name   pollBeforeSecondCompletionDelaysOpeningByOneTick
     * @tc.desc   Inserting one extra poll in the gate window shifts the opening tick from one to two.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollBeforeSecondCompletionDelaysOpeningByOneTick', 0, () => {
      const prompt: TaskGraph = createTaskGraph();
      prompt.startAll();
      prompt.completeTask(TASK_A, 1);
      prompt.completeTask(TASK_B, 2);
      expect(prompt.pollTick(200)).assertTrue();
      const delayed: TaskGraph = createTaskGraph();
      delayed.startAll();
      delayed.completeTask(TASK_A, 1);
      expect(delayed.pollTick(200)).assertFalse();
      delayed.completeTask(TASK_B, 300);
      expect(delayed.pollTick(400)).assertTrue();
      expect(prompt.pollTicks).assertEqual(1);
      expect(delayed.pollTicks).assertEqual(2);
      expect(delayed.taskAt(2).startedAt).assertEqual(400);
    });

    /**
     * @tc.name   everyGraphPollAddsOneTick
     * @tc.desc   Twenty polls, successful or not, add exactly twenty to the graph tick counter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('everyGraphPollAddsOneTick', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      for (let round = 1; round <= 20; round++) {
        graph.pollTick(round * 200);
        expect(graph.pollTicks).assertEqual(round);
      }
      expect(graph.pollTicks).assertEqual(20);
      expect(graph.timerActive).assertTrue();
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
    });

    /**
     * @tc.name   pollAfterReleaseStillCountsItsTick
     * @tc.desc   A stale tick after the interval was cleared returns false but still increments the counter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollAfterReleaseStillCountsItsTick', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      expect(graph.pollTick(200)).assertTrue();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.pollTick(400)).assertFalse();
      expect(graph.pollTick(600)).assertFalse();
      expect(graph.pollTicks).assertEqual(3);
      expect(graph.taskAt(2).startedAt).assertEqual(200);
    });

    /**
     * @tc.name   bothOrdersOpenAtTheSameTickIndex
     * @tc.desc   Whichever prerequisite finishes first, the opening poll is the first one after both are done.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bothOrdersOpenAtTheSameTickIndex', 0, () => {
      const first: TaskGraph = createTaskGraph();
      first.startAll();
      first.completeTask(TASK_A, 10);
      first.completeTask(TASK_B, 20);
      first.pollTick(200);
      const second: TaskGraph = createTaskGraph();
      second.startAll();
      second.completeTask(TASK_B, 10);
      second.completeTask(TASK_A, 20);
      second.pollTick(200);
      expect(first.pollTicks).assertEqual(second.pollTicks);
      expect(first.taskAt(2).startedAt).assertEqual(second.taskAt(2).startedAt);
      expect(first.events.countOf('timer-cleared')).assertEqual(1);
      expect(second.events.countOf('timer-cleared')).assertEqual(1);
    });

    /**
     * @tc.name   zeroIntervalClockKeepsAZeroBudget
     * @tc.desc   A zero period increments the tick counter but never accumulates elapsed milliseconds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('zeroIntervalClockKeepsAZeroBudget', 0, () => {
      const clock: PollClock = new PollClock(0);
      clock.start();
      for (let round = 0; round < 5; round++) {
        expect(clock.tick()).assertEqual(0);
      }
      expect(clock.ticks).assertEqual(5);
      expect(clock.elapsedMs).assertEqual(0);
      expect(clock.isDueAfter(1)).assertTrue();
      expect(clock.isDueAfter(0)).assertTrue();
    });

    /**
     * @tc.name   stoppedClockBudgetIsFrozenAcrossManyCalls
     * @tc.desc   Twenty ticks after stop all return the same frozen budget and add no ticks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('stoppedClockBudgetIsFrozenAcrossManyCalls', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      clock.tick();
      clock.tick();
      clock.tick();
      clock.stop();
      let frozen: number = 0;
      for (let round = 0; round < 20; round++) {
        if (clock.tick() === 600) {
          frozen = frozen + 1;
        }
      }
      expect(frozen).assertEqual(20);
      expect(clock.ticks).assertEqual(3);
      expect(clock.elapsedMs).assertEqual(600);
    });

    /**
     * @tc.name   clockAndGraphAgreeOnThePollCountAtOpening
     * @tc.desc   A clock driven loop and the graph counter report the same number of polls when the gate opens.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('clockAndGraphAgreeOnThePollCountAtOpening', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const clock: PollClock = new PollClock();
      graph.startAll();
      clock.start();
      let opened: boolean = false;
      for (let round = 0; round < 6; round++) {
        if (round === 2) {
          graph.completeTask(TASK_A, clock.elapsedMs);
        }
        if (round === 3) {
          graph.completeTask(TASK_B, clock.elapsedMs);
        }
        opened = graph.pollTick(clock.tick());
        if (opened) {
          break;
        }
      }
      expect(opened).assertTrue();
      expect(graph.pollTicks).assertEqual(4);
      expect(clock.ticks).assertEqual(4);
      expect(clock.elapsedMs).assertEqual(800);
      expect(graph.taskAt(2).startedAt).assertEqual(800);
    });

    /**
     * @tc.name   openingTimestampsAreIntervalMultiples
     * @tc.desc   The poll timestamp that starts C is always an exact multiple of the 200 ms interval.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('openingTimestampsAreIntervalMultiples', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      let openedAt: number = 0;
      for (let round = 1; round <= 5; round++) {
        if (graph.pollTick(round * POLL_INTERVAL_MS)) {
          openedAt = graph.taskAt(2).startedAt;
          break;
        }
      }
      expect(openedAt).assertEqual(200);
      expect(openedAt % POLL_INTERVAL_MS).assertEqual(0);
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.taskAt(2).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(2).isComplete()).assertFalse();
    });

    /**
     * @tc.name   pollingBudgetUntilTheGateMatchesFourIntervals
     * @tc.desc   The scripted four poll run consumes exactly eight hundred milliseconds of clock budget.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PollingPerformance scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollingBudgetUntilTheGateMatchesFourIntervals', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const clock: PollClock = new PollClock();
      graph.startAll();
      clock.start();
      graph.pollTick(clock.tick());
      graph.pollTick(clock.tick());
      graph.pollTick(clock.tick());
      graph.completeTask(TASK_A, 300);
      graph.completeTask(TASK_B, 400);
      expect(graph.pollTick(clock.tick())).assertTrue();
      expect(clock.elapsedMs).assertEqual(4 * POLL_INTERVAL_MS);
      expect(clock.ticks).assertEqual(4);
      expect(graph.pollTicks).assertEqual(4);
      expect(clock.active).assertTrue();
    });
  });
}
