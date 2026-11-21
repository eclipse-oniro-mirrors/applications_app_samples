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
 * ResourceManagement suite.
 *
 * Covers the resources one run owns: the 200 ms interval, the dependency lock
 * slots, the bounded log buffer, the unbounded snapshot log and the event
 * recorder. Each resource must be released on completion or reset, and the
 * bounded buffer must evict oldest first without corrupting its level array.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   65       checkTaskC is the interval handle owned by a run
 *   174-198  startAllTasks arms one interval per press and clears it when C runs
 *   177-197  one AsyncLock instance guards A, B and C for that run
 *   188-196  the interval also stops for a finished C row
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  POLL_INTERVAL_MS,
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR,
  TaskGraph,
  SnapshotLog,
  EventRecorder,
  LogBuffer,
  PollClock,
  createTaskGraph
} from '../Shared/SharedDriver';

export default function resourceManagementTest(): void {
  describe('ResourceManagement', () => {
    beforeAll(() => {
      logSuite('ResourceManagement', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('ResourceManagement', 'end');
    });

    /**
     * @tc.name   pollClockStartsInactive
     * @tc.desc   A fresh clock owns no interval time: inactive, zero ticks and zero elapsed milliseconds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollClockStartsInactive', 0, () => {
      const clock: PollClock = new PollClock();
      expect(clock.active).assertFalse();
      expect(clock.ticks).assertEqual(0);
      expect(clock.elapsedMs).assertEqual(0);
      expect(clock.intervalMs).assertEqual(POLL_INTERVAL_MS);
      expect(clock.intervalMs).assertEqual(200);
      expect(clock.tick()).assertEqual(0);
      expect(clock.isDueAfter(1)).assertFalse();
    });

    /**
     * @tc.name   clockStartRearmsFromZero
     * @tc.desc   start resets both counters so a restarted interval does not inherit the previous budget.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clockStartRearmsFromZero', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      clock.tick();
      clock.tick();
      expect(clock.ticks).assertEqual(2);
      expect(clock.elapsedMs).assertEqual(400);
      clock.stop();
      clock.start();
      expect(clock.active).assertTrue();
      expect(clock.ticks).assertEqual(0);
      expect(clock.elapsedMs).assertEqual(0);
    });

    /**
     * @tc.name   clockTickAddsOneInterval
     * @tc.desc   Each tick of the 200 ms clock adds exactly one interval to the elapsed budget.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('clockTickAddsOneInterval', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      expect(clock.tick()).assertEqual(200);
      expect(clock.tick()).assertEqual(400);
      expect(clock.tick()).assertEqual(600);
      expect(clock.ticks).assertEqual(3);
      expect(clock.tick() - clock.tick()).assertEqual(-200);
    });

    /**
     * @tc.name   clockStopFreezesElapsedBudget
     * @tc.desc   Ticks after stop return the frozen budget and add neither time nor a tick.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clockStopFreezesElapsedBudget', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      clock.tick();
      clock.tick();
      clock.stop();
      expect(clock.tick()).assertEqual(400);
      expect(clock.tick()).assertEqual(400);
      expect(clock.ticks).assertEqual(2);
      expect(clock.elapsedMs).assertEqual(400);
      expect(clock.active).assertFalse();
    });

    /**
     * @tc.name   clockDueCheckUsesElapsedBudget
     * @tc.desc   isDueAfter compares interval times rounds with the accumulated elapsed time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clockDueCheckUsesElapsedBudget', 0, () => {
      const clock: PollClock = new PollClock(200);
      clock.start();
      expect(clock.isDueAfter(1)).assertFalse();
      clock.tick();
      expect(clock.isDueAfter(1)).assertTrue();
      expect(clock.isDueAfter(2)).assertFalse();
      clock.tick();
      expect(clock.isDueAfter(2)).assertTrue();
      expect(clock.isDueAfter(3)).assertFalse();
    });

    /**
     * @tc.name   clockWithCustomIntervalScalesTicks
     * @tc.desc   A 500 ms clock needs fewer ticks to reach the same elapsed budget.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clockWithCustomIntervalScalesTicks', 0, () => {
      const slow: PollClock = new PollClock(500);
      slow.start();
      expect(slow.tick()).assertEqual(500);
      expect(slow.ticks).assertEqual(1);
      expect(slow.intervalMs).assertEqual(500);
      expect(slow.isDueAfter(1)).assertTrue();
      const fast: PollClock = new PollClock(50);
      fast.start();
      for (let round = 0; round < 8; round++) {
        fast.tick();
      }
      expect(fast.elapsedMs).assertEqual(400);
      expect(fast.ticks).assertEqual(8);
    });

    /**
     * @tc.name   graphArmsItsIntervalOnStart
     * @tc.desc   startAll marks the run timer active, which represents one armed interval handle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphArmsItsIntervalOnStart', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.timerActive).assertFalse();
      graph.startAll();
      expect(graph.timerActive).assertTrue();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.taskAt(2).status).assertEqual('idle');
    });

    /**
     * @tc.name   graphTimerClearsWhenTaskCStarts
     * @tc.desc   The successful poll that starts C records the timer release and stops further ticks from working.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphTimerClearsWhenTaskCStarts', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      expect(graph.pollTick(3)).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.pollTick(4)).assertFalse();
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
    });

    /**
     * @tc.name   resetClearsTheRunTimer
     * @tc.desc   Reset disarms the interval so the next run starts with a clean timer resource.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetClearsTheRunTimer', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.timerActive).assertTrue();
      graph.reset();
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
    });

    /**
     * @tc.name   timerStaysArmedWhileTheGateIsOpen
     * @tc.desc   Between the second completion and the next poll the interval resource is still held.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timerStaysArmedWhileTheGateIsOpen', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.timerActive).assertTrue();
      expect(graph.pollTicks).assertEqual(0);
      graph.pollTick(200);
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
    });

    /**
     * @tc.name   rejectedStartDoesNotArmASecondInterval
     * @tc.desc   A rejected press keeps the single interval of the active run and adds no clear event.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('rejectedStartDoesNotArmASecondInterval', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.startAll()).assertFalse();
      expect(graph.timerActive).assertTrue();
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
    });

    /**
     * @tc.name   sharedSlotIsReleasedByItsOwnerOnly
     * @tc.desc   Completing A frees only the A slot while B keeps its own holder and the lock stays busy.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sharedSlotIsReleasedByItsOwnerOnly', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.lock.holderCount()).assertEqual(2);
      graph.completeTask(TASK_A, 1);
      expect(graph.lock.hasShared(TASK_A)).assertFalse();
      expect(graph.lock.hasShared(TASK_B)).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.lock.acquisitions).assertEqual(2);
    });

    /**
     * @tc.name   exclusiveSlotIsReleasedOnTaskCCompletion
     * @tc.desc   Finishing C returns the exclusive slot and leaves the lock fully free.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('exclusiveSlotIsReleasedOnTaskCCompletion', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      graph.completeTaskC(4);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   logBufferStartsEmpty
     * @tc.desc   A new bounded buffer holds no lines or levels and keeps the requested limit.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logBufferStartsEmpty', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      expect(buffer.size()).assertEqual(0);
      expect(buffer.lines.length).assertEqual(0);
      expect(buffer.levels.length).assertEqual(0);
      expect(buffer.limit).assertEqual(64);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.contains('anything')).assertFalse();
      expect(buffer.trace()).assertEqual('');
    });

    /**
     * @tc.name   logBufferInfoStoresLevelAndLine
     * @tc.desc   An info call appends one INFO level and a line prefixed by that level.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logBufferInfoStoresLevelAndLine', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('start-all begin');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('INFO start-all begin');
      expect(buffer.levels[0]).assertEqual(LEVEL_INFO);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.contains('start-all')).assertTrue();
    });

    /**
     * @tc.name   logBufferKeepsWarnAndErrorLevels
     * @tc.desc   Warn and error calls keep their own levels and do not overwrite the info count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logBufferKeepsWarnAndErrorLevels', 0, () => {
      const buffer: LogBuffer = new LogBuffer();
      buffer.info('created');
      buffer.warn('slow poll');
      buffer.error('start failed');
      expect(buffer.size()).assertEqual(3);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.lines[2]).assertEqual('ERROR start failed');
    });

    /**
     * @tc.name   logBufferTrimsOldestLinesBeyondLimit
     * @tc.desc   A limit of three keeps only the three most recent lines of five writes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logBufferTrimsOldestLinesBeyondLimit', 0, () => {
      const buffer: LogBuffer = new LogBuffer(3);
      for (let round = 1; round <= 5; round++) {
        buffer.info('line ' + String(round));
      }
      expect(buffer.size()).assertEqual(3);
      expect(buffer.lines[0]).assertEqual('INFO line 3');
      expect(buffer.lines[2]).assertEqual('INFO line 5');
      expect(buffer.levels.length).assertEqual(3);
      expect(buffer.trace().split('|').length).assertEqual(3);
    });

    /**
     * @tc.name   evictedTextIsNoLongerContained
     * @tc.desc   After eviction the buffer cannot find the oldest fragment but still finds the newest.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('evictedTextIsNoLongerContained', 0, () => {
      const buffer: LogBuffer = new LogBuffer(2);
      buffer.info('alpha first');
      buffer.warn('beta second');
      buffer.error('gamma third');
      expect(buffer.contains('alpha')).assertFalse();
      expect(buffer.contains('beta')).assertTrue();
      expect(buffer.contains('gamma')).assertTrue();
      expect(buffer.size()).assertEqual(2);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
    });

    /**
     * @tc.name   levelCountsFollowEvictions
     * @tc.desc   Evicting the only INFO line drops the INFO count while the ERROR count survives.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('levelCountsFollowEvictions', 0, () => {
      const buffer: LogBuffer = new LogBuffer(2);
      buffer.info('one');
      buffer.error('two');
      buffer.error('three');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(0);
      expect(buffer.levels.length).assertEqual(buffer.lines.length);
      expect(buffer.size()).assertEqual(2);
    });

    /**
     * @tc.name   logBufferClearDropsLinesAndLevels
     * @tc.desc   Clearing the buffer empties both arrays so counts and trace restart from zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('logBufferClearDropsLinesAndLevels', 0, () => {
      const buffer: LogBuffer = new LogBuffer(8);
      buffer.info('a');
      buffer.warn('b');
      buffer.clear();
      expect(buffer.size()).assertEqual(0);
      expect(buffer.levels.length).assertEqual(0);
      expect(buffer.trace()).assertEqual('');
      expect(buffer.contains('a')).assertFalse();
      buffer.info('c');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
    });

    /**
     * @tc.name   logBufferLimitOfOneKeepsOnlyTheNewest
     * @tc.desc   The smallest useful limit is one, and every write replaces the single retained line.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('logBufferLimitOfOneKeepsOnlyTheNewest', 0, () => {
      const buffer: LogBuffer = new LogBuffer(1);
      buffer.info('first');
      buffer.info('second');
      buffer.info('third');
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('INFO third');
      expect(buffer.levels[0]).assertEqual(LEVEL_INFO);
      expect(buffer.contains('first')).assertFalse();
      expect(buffer.contains('third')).assertTrue();
    });

    /**
     * @tc.name   resourceLifecycleLogBufferTraceJoinsWithPipe
     * @tc.desc   The trace of the buffer is a pipe join of its retained lines in insertion order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resourceLifecycleLogBufferTraceJoinsWithPipe', 0, () => {
      const buffer: LogBuffer = new LogBuffer(10);
      buffer.info('start');
      buffer.warn('wait');
      buffer.error('stop');
      expect(buffer.trace()).assertEqual('INFO start|WARN wait|ERROR stop');
      expect(buffer.trace().split('|').length).assertEqual(3);
      expect(buffer.trace().startsWith('INFO start')).assertTrue();
      expect(buffer.trace().endsWith('ERROR stop')).assertTrue();
    });

    /**
     * @tc.name   logBufferHonoursACustomLimit
     * @tc.desc   A limit of ten retains ten writes and evicts the first five of fifteen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('logBufferHonoursACustomLimit', 0, () => {
      const buffer: LogBuffer = new LogBuffer(10);
      for (let round = 1; round <= 15; round++) {
        buffer.info('entry ' + String(round));
      }
      expect(buffer.size()).assertEqual(10);
      expect(buffer.limit).assertEqual(10);
      expect(buffer.lines[0]).assertEqual('INFO entry 6');
      expect(buffer.lines[9]).assertEqual('INFO entry 15');
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(10);
    });

    /**
     * @tc.name   snapshotLogGrowsWithoutItsOwnLimit
     * @tc.desc   Unlike the log buffer, the snapshot log keeps every capture and reaches one hundred entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotLogGrowsWithoutItsOwnLimit', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      for (let round = 0; round < 34; round++) {
        log.capture(graph.tasks);
      }
      expect(log.size()).assertEqual(102);
      expect(log.snapshots.length).assertEqual(102);
      expect(log.snapshots[0].taskNo).assertEqual(TASK_A);
      expect(log.snapshots[101].taskNo).assertEqual(TASK_C);
      expect(log.trace().split('|').length).assertEqual(102);
    });

    /**
     * @tc.name   snapshotLogClearFreesTheWholeHistory
     * @tc.desc   Clearing the snapshot log releases its array, so memory for old captures is no longer referenced.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotLogClearFreesTheWholeHistory', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(6);
      log.clear();
      expect(log.size()).assertEqual(0);
      expect(log.snapshots.length).assertEqual(0);
      expect(log.trace()).assertEqual('');
      expect(log.latest(TASK_A) === undefined).assertTrue();
    });

    /**
     * @tc.name   graphResetLeavesExternalBuffersIntact
     * @tc.desc   Reset only owns graph resources; a buffer or snapshot log outside the graph keeps its data.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('graphResetLeavesExternalBuffersIntact', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const buffer: LogBuffer = new LogBuffer(16);
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      buffer.info('run started');
      log.capture(graph.tasks);
      graph.reset();
      expect(buffer.size()).assertEqual(1);
      expect(buffer.contains('run started')).assertTrue();
      expect(log.size()).assertEqual(3);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   eventRecorderGrowsOneEntryPerOperation
     * @tc.desc   The recorder has no limit: each accepted graph operation adds a single entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventRecorderGrowsOneEntryPerOperation', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.events.size()).assertEqual(4);
      graph.completeTask(TASK_A, 1);
      expect(graph.events.size()).assertEqual(5);
      graph.completeTask(TASK_B, 2);
      expect(graph.events.size()).assertEqual(7);
      graph.pollTick(3);
      expect(graph.events.size()).assertEqual(9);
      graph.completeTaskC(4);
      expect(graph.events.size()).assertEqual(11);
    });

    /**
     * @tc.name   clearedBufferKeepsItsConfiguredLimit
     * @tc.desc   clear() drops rows but preserves the limit, so the next burst evicts at the same threshold.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clearedBufferKeepsItsConfiguredLimit', 0, () => {
      const buffer: LogBuffer = new LogBuffer(4);
      buffer.info('a');
      buffer.clear();
      expect(buffer.limit).assertEqual(4);
      for (let round = 1; round <= 6; round++) {
        buffer.info('r' + String(round));
      }
      expect(buffer.size()).assertEqual(4);
      expect(buffer.lines[0]).assertEqual('INFO r3');
      expect(buffer.lines[3]).assertEqual('INFO r6');
      expect(buffer.levels.length).assertEqual(4);
    });

    /**
     * @tc.name   bufferAtExactLimitDoesNotEvict
     * @tc.desc   Writing exactly limit lines retains all of them, while one extra write drops the first.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bufferAtExactLimitDoesNotEvict', 0, () => {
      const buffer: LogBuffer = new LogBuffer(3);
      buffer.info('one');
      buffer.info('two');
      buffer.info('three');
      expect(buffer.size()).assertEqual(3);
      expect(buffer.lines[0]).assertEqual('INFO one');
      buffer.info('four');
      expect(buffer.size()).assertEqual(3);
      expect(buffer.lines[0]).assertEqual('INFO two');
      expect(buffer.contains('one')).assertFalse();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(3);
    });

    /**
     * @tc.name   zeroLimitBufferRetainsNothing
     * @tc.desc   A zero limit evicts each line immediately, so size stays zero and the trace is empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('zeroLimitBufferRetainsNothing', 0, () => {
      const buffer: LogBuffer = new LogBuffer(0);
      buffer.info('dropped');
      expect(buffer.size()).assertEqual(0);
      expect(buffer.lines.length).assertEqual(0);
      expect(buffer.levels.length).assertEqual(0);
      expect(buffer.trace()).assertEqual('');
      expect(buffer.contains('dropped')).assertFalse();
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(0);
    });

    /**
     * @tc.name   stoppedClockStillAnswersDueQueries
     * @tc.desc   The due predicate only reads elapsed time, so a stopped clock can still report a past deadline.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('stoppedClockStillAnswersDueQueries', 0, () => {
      const clock: PollClock = new PollClock(200);
      clock.start();
      clock.tick();
      clock.tick();
      clock.stop();
      expect(clock.isDueAfter(1)).assertTrue();
      expect(clock.isDueAfter(2)).assertTrue();
      expect(clock.isDueAfter(3)).assertFalse();
      expect(clock.active).assertFalse();
      expect(clock.ticks).assertEqual(2);
    });

    /**
     * @tc.name   restartingTheClockClearsOldDeadlines
     * @tc.desc   After a restart the previous elapsed budget is gone, so every due check starts false again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('restartingTheClockClearsOldDeadlines', 0, () => {
      const clock: PollClock = new PollClock(200);
      clock.start();
      clock.tick();
      clock.tick();
      expect(clock.isDueAfter(2)).assertTrue();
      clock.stop();
      clock.start();
      expect(clock.isDueAfter(1)).assertFalse();
      expect(clock.elapsedMs).assertEqual(0);
      clock.tick();
      expect(clock.isDueAfter(1)).assertTrue();
      expect(clock.isDueAfter(2)).assertFalse();
    });

    /**
     * @tc.name   elapsedIsTheProductOfTicksAndInterval
     * @tc.desc   For any number of ticks the elapsed budget equals ticks times the configured interval.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('elapsedIsTheProductOfTicksAndInterval', 0, () => {
      const clock: PollClock = new PollClock(250);
      clock.start();
      for (let round = 1; round <= 6; round++) {
        clock.tick();
        expect(clock.elapsedMs).assertEqual(clock.ticks * 250);
      }
      expect(clock.ticks).assertEqual(6);
      expect(clock.elapsedMs).assertEqual(1500);
      expect(clock.isDueAfter(6)).assertTrue();
      expect(clock.isDueAfter(7)).assertFalse();
    });

    /**
     * @tc.name   midRunResetFreesTheExclusiveOwner
     * @tc.desc   A reset while C holds the exclusive slot releases that slot immediately, without a C completion.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('midRunResetFreesTheExclusiveOwner', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.lock.exclusiveOwner).assertEqual(TASK_C);
      graph.reset();
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.lock.acquisitions).assertEqual(0);
    });

    /**
     * @tc.name   noHolderLeakAcrossThreeRuns
     * @tc.desc   Three complete runs each finish with an empty lock, so no slot accumulates across runs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('noHolderLeakAcrossThreeRuns', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let round = 0; round < 3; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        graph.completeTaskC(4);
        expect(graph.lock.holderCount()).assertEqual(0);
        expect(graph.lock.isUnlocked()).assertTrue();
        graph.reset();
      }
      expect(graph.lock.acquisitions).assertEqual(0);
      expect(graph.lock.rejections).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
    });

    /**
     * @tc.name   intervalIsReleasedExactlyOncePerRun
     * @tc.desc   Extra stale ticks cannot add a second timer release marker to the run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('intervalIsReleasedExactlyOncePerRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.pollTick(203);
      graph.pollTick(403);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.pollTicks).assertEqual(3);
      expect(graph.timerActive).assertFalse();
      expect(graph.events.countOf('started')).assertEqual(3);
    });

    /**
     * @tc.name   recorderClearReleasesItsEntryArray
     * @tc.desc   Clearing the recorder drops the backing array rather than only its length.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recorderClearReleasesItsEntryArray', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('started', TASK_A);
      recorder.record('completed', TASK_A);
      expect(recorder.entries.length).assertEqual(2);
      recorder.clear();
      expect(recorder.entries.length).assertEqual(0);
      expect(recorder.size()).assertEqual(0);
      expect(recorder.trace()).assertEqual('');
      expect(recorder.fingerprint()).assertEqual(new EventRecorder().fingerprint());
    });

    /**
     * @tc.name   bufferIsBoundedWhileSnapshotLogIsNot
     * @tc.desc   The same number of writes fills a bounded buffer but leaves every snapshot entry in place.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bufferIsBoundedWhileSnapshotLogIsNot', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const buffer: LogBuffer = new LogBuffer(5);
      const log: SnapshotLog = new SnapshotLog();
      for (let round = 0; round < 9; round++) {
        buffer.info('capture ' + String(round));
        log.capture(graph.tasks);
      }
      expect(buffer.size()).assertEqual(5);
      expect(log.size()).assertEqual(27);
      expect(buffer.lines[4]).assertEqual('INFO capture 8');
      expect(log.snapshots.length).assertEqual(27);
    });

    /**
     * @tc.name   waitingExclusiveRequestIsNotAHolder
     * @tc.desc   A queued exclusive request does not inflate the holder count before it is granted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('waitingExclusiveRequestIsNotAHolder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(2);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      expect(graph.lock.waitingExclusive).assertTrue();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   timerAndLockAreReleasedTogetherAtTheEnd
     * @tc.desc   The successful poll stops the interval, and the final completion frees the last holder in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('timerAndLockAreReleasedTogetherAtTheEnd', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      expect(graph.timerActive).assertFalse();
      expect(graph.lock.holderCount()).assertEqual(1);
      graph.completeTaskC(4);
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(graph.allCompleted()).assertTrue();
    });

    /**
     * @tc.name   snapshotGrowthIsOneEntryPerTaskPerCapture
     * @tc.desc   The snapshot log grows by exactly three entries per capture of the whole graph.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotGrowthIsOneEntryPerTaskPerCapture', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      let previous: number = log.size();
      for (let round = 0; round < 6; round++) {
        log.capture(graph.tasks);
        expect(log.size() - previous).assertEqual(3);
        previous = log.size();
      }
      expect(log.size()).assertEqual(18);
      expect(log.latest(TASK_B) !== undefined).assertTrue();
      expect(log.trace().split('|').length).assertEqual(18);
    });

    /**
     * @tc.name   mixedLevelsSurviveEvictionCorrectly
     * @tc.desc   After eviction warn and error counts still describe only the retained lines.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ResourceManagement scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mixedLevelsSurviveEvictionCorrectly', 0, () => {
      const buffer: LogBuffer = new LogBuffer(4);
      buffer.info('i1');
      buffer.warn('w1');
      buffer.error('e1');
      buffer.info('i2');
      buffer.warn('w2');
      expect(buffer.size()).assertEqual(4);
      expect(buffer.countLevel(LEVEL_INFO)).assertEqual(1);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(2);
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(buffer.levels[0]).assertEqual(LEVEL_WARN);
    });
  });
}
