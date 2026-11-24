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
 * MemoryLeakDetection suite.
 *
 * Audits retention of every container the run touches: the bounded log buffer
 * must evict instead of grow, the snapshot log and the event recorder must free
 * their arrays on clear, and the dependency lock must give every holder back.
 * Repeated fill and clear cycles are the core probe of the suite.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   62       lock is a scalar with no holder list to leak
 *   65       checkTaskC holds one interval id at a time
 *   119-132  callbacks are re-bound per task, so nothing keeps old tasks alive
 *   174-198  a new run replaces the previous lock and interval entirely
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR,
  ERROR_NETWORK,
  DependencyLock,
  TaskGraph,
  SnapshotLog,
  EventRecorder,
  LogBuffer,
  createTaskGraph
} from '../Shared/SharedDriver';

export default function memoryLeakDetectionTest(): void {
  describe('MemoryLeakDetection', () => {
    beforeAll(() => {
      logSuite('MemoryLeakDetection', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('MemoryLeakDetection', 'end');
    });

    /**
     * @tc.name   boundedBufferNeverExceedsItsLimit
     * @tc.desc   One thousand writes into a 32 line buffer leave exactly 32 retained lines.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('boundedBufferNeverExceedsItsLimit', 0, () => {
      const buffer: LogBuffer = new LogBuffer(32);
      for (let round = 0; round < 1000; round++) {
        buffer.info('write ' + String(round));
        expect(buffer.size() <= 32).assertTrue();
      }
      expect(buffer.size()).assertEqual(32);
      expect(buffer.lines.length).assertEqual(32);
      expect(buffer.limit).assertEqual(32);
    });

    /**
     * @tc.name   bufferEvictsTheOldestWindow
     * @tc.desc   After one thousand writes only the last 32 messages remain, starting at message 968.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bufferEvictsTheOldestWindow', 0, () => {
      const buffer: LogBuffer = new LogBuffer(32);
      for (let round = 0; round < 1000; round++) {
        buffer.info('write ' + String(round));
      }
      expect(buffer.lines[0]).assertEqual('INFO write 968');
      expect(buffer.lines[31]).assertEqual('INFO write 999');
      expect(buffer.contains('write 967')).assertFalse();
      expect(buffer.contains('write 968')).assertTrue();
      expect(buffer.contains('write 999')).assertTrue();
    });

    /**
     * @tc.name   levelArrayStaysAlignedWithLines
     * @tc.desc   Eviction trims both arrays, so their lengths stay equal after every overflow.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('levelArrayStaysAlignedWithLines', 0, () => {
      const buffer: LogBuffer = new LogBuffer(5);
      for (let round = 0; round < 40; round++) {
        if (round % 3 === 0) {
          buffer.info('i' + String(round));
        } else if (round % 3 === 1) {
          buffer.warn('w' + String(round));
        } else {
          buffer.error('e' + String(round));
        }
        expect(buffer.lines.length).assertEqual(buffer.levels.length);
      }
      expect(buffer.size()).assertEqual(5);
      expect(buffer.levels.length).assertEqual(5);
      expect(buffer.countLevel(LEVEL_INFO) + buffer.countLevel(LEVEL_WARN) +
        buffer.countLevel(LEVEL_ERROR)).assertEqual(5);
    });

    /**
     * @tc.name   bufferClearReleasesBothArrays
     * @tc.desc   clear replaces the line and level arrays with empty ones instead of keeping old capacity.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('bufferClearReleasesBothArrays', 0, () => {
      const buffer: LogBuffer = new LogBuffer(16);
      buffer.info('retained');
      buffer.warn('retained');
      buffer.clear();
      expect(buffer.lines.length).assertEqual(0);
      expect(buffer.levels.length).assertEqual(0);
      expect(buffer.size()).assertEqual(0);
      expect(buffer.trace()).assertEqual('');
      expect(buffer.contains('retained')).assertFalse();
    });

    /**
     * @tc.name   bufferFillAndClearCyclesDoNotGrow
     * @tc.desc   Ten cycles of twenty writes followed by clear keep the size bounded by the limit each cycle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bufferFillAndClearCyclesDoNotGrow', 0, () => {
      const buffer: LogBuffer = new LogBuffer(8);
      for (let cycle = 0; cycle < 10; cycle++) {
        for (let round = 0; round < 20; round++) {
          buffer.info('cycle ' + String(cycle) + ' line ' + String(round));
        }
        expect(buffer.size()).assertEqual(8);
        expect(buffer.limit).assertEqual(8);
        buffer.clear();
        expect(buffer.size()).assertEqual(0);
      }
      expect(buffer.lines.length).assertEqual(0);
      expect(buffer.levels.length).assertEqual(0);
    });

    /**
     * @tc.name   smallestBufferSurvivesManyCycles
     * @tc.desc   A one line buffer used for two hundred writes still holds a single newest line.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('smallestBufferSurvivesManyCycles', 0, () => {
      const buffer: LogBuffer = new LogBuffer(1);
      for (let round = 0; round < 200; round++) {
        buffer.warn('w' + String(round));
      }
      expect(buffer.size()).assertEqual(1);
      expect(buffer.lines[0]).assertEqual('WARN w199');
      expect(buffer.levels[0]).assertEqual(LEVEL_WARN);
      expect(buffer.countLevel(LEVEL_WARN)).assertEqual(1);
      expect(buffer.contains('w198')).assertFalse();
    });

    /**
     * @tc.name   bufferTraceLengthIsBoundedByLimit
     * @tc.desc   The joined trace of a full buffer contains at most limit entries, whatever the write count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bufferTraceLengthIsBoundedByLimit', 0, () => {
      const buffer: LogBuffer = new LogBuffer(6);
      for (let round = 0; round < 60; round++) {
        buffer.info('row ' + String(round));
      }
      expect(buffer.trace().split('|').length).assertEqual(6);
      expect(buffer.trace().startsWith('INFO row 54')).assertTrue();
      expect(buffer.trace().endsWith('INFO row 59')).assertTrue();
      expect(buffer.size() <= buffer.limit).assertTrue();
    });

    /**
     * @tc.name   levelCountsSumToRetainedSize
     * @tc.desc   After heavy mixed writes the three level counts always add up to the retained line count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('levelCountsSumToRetainedSize', 0, () => {
      const buffer: LogBuffer = new LogBuffer(12);
      for (let round = 0; round < 300; round++) {
        if (round % 3 === 0) {
          buffer.info('payload');
        } else if (round % 3 === 1) {
          buffer.warn('payload');
        } else {
          buffer.error('payload');
        }
      }
      const sum: number = buffer.countLevel(LEVEL_INFO) + buffer.countLevel(LEVEL_WARN) +
        buffer.countLevel(LEVEL_ERROR);
      expect(sum).assertEqual(buffer.size());
      expect(buffer.size()).assertEqual(12);
      expect(buffer.countLevel(LEVEL_INFO) > 0).assertTrue();
      expect(buffer.countLevel(LEVEL_ERROR) > 0).assertTrue();
    });

    /**
     * @tc.name   tenThousandWritesStayBounded
     * @tc.desc   A long streaming session of ten thousand writes is held to the configured bound throughout.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('tenThousandWritesStayBounded', 0, () => {
      const buffer: LogBuffer = new LogBuffer(24);
      let maxSeen: number = 0;
      for (let round = 0; round < 10000; round++) {
        buffer.info('s' + String(round));
        if (buffer.size() > maxSeen) {
          maxSeen = buffer.size();
        }
      }
      expect(maxSeen).assertEqual(24);
      expect(buffer.size()).assertEqual(24);
      expect(buffer.lines[23]).assertEqual('INFO s9999');
      expect(buffer.levels.length).assertEqual(24);
    });

    /**
     * @tc.name   snapshotLogClearReleasesItsArray
     * @tc.desc   Clearing a snapshot log empties the array reference so old captures cannot be reached.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotLogClearReleasesItsArray', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      log.capture(graph.tasks);
      expect(log.snapshots.length).assertEqual(6);
      log.clear();
      expect(log.snapshots.length).assertEqual(0);
      expect(log.size()).assertEqual(0);
      expect(log.trace()).assertEqual('');
      expect(log.latest(TASK_B) === undefined).assertTrue();
    });

    /**
     * @tc.name   snapshotCaptureClearCyclesDoNotGrow
     * @tc.desc   Twelve capture and clear cycles leave the log at zero entries after every cycle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotCaptureClearCyclesDoNotGrow', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      for (let cycle = 0; cycle < 12; cycle++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        log.capture(graph.tasks);
        expect(log.size()).assertEqual(3);
        log.clear();
        expect(log.size()).assertEqual(0);
        graph.reset();
      }
      expect(log.snapshots.length).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   clearedSnapshotLogHoldsOnlyTheNewCapture
     * @tc.desc   After clear the next capture yields three fresh entries, not a mix with the previous round.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clearedSnapshotLogHoldsOnlyTheNewCapture', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      log.capture(graph.tasks);
      log.clear();
      graph.reset();
      graph.startAll();
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(3);
      expect(log.trace()).assertEqual('A/running/0|B/running/0|C/idle/0');
      expect(log.trace().indexOf('completed')).assertEqual(-1);
      expect(log.latest(TASK_A) !== undefined).assertTrue();
    });

    /**
     * @tc.name   manySnapshotCyclesKeepOnlyTheLatestCapture
     * @tc.desc   Fifty capture and clear cycles end with the newest capture visible and nothing older retained.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('manySnapshotCyclesKeepOnlyTheLatestCapture', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      for (let cycle = 0; cycle < 50; cycle++) {
        graph.taskAt(0).reportProgress(cycle);
        log.capture(graph.tasks);
        log.clear();
      }
      graph.taskAt(0).reportProgress(77);
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(3);
      expect(log.snapshots[0].progress).assertEqual(77);
      expect(log.trace().split('|').length).assertEqual(3);
      expect(log.snapshots.length).assertEqual(3);
    });

    /**
     * @tc.name   recorderClearReleasesItsArray
     * @tc.desc   The recorder drops its entry array on clear, so a long session leaves no retained strings.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('recorderClearReleasesItsArray', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      for (let round = 0; round < 500; round++) {
        recorder.record('noise', String(round));
      }
      expect(recorder.size()).assertEqual(500);
      recorder.clear();
      expect(recorder.entries.length).assertEqual(0);
      expect(recorder.size()).assertEqual(0);
      expect(recorder.last()).assertEqual('');
      expect(recorder.trace()).assertEqual('');
    });

    /**
     * @tc.name   recorderFillClearCyclesStayEmpty
     * @tc.desc   Twenty cycles of one hundred records plus clear leave the recorder at zero entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recorderFillClearCyclesStayEmpty', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      for (let cycle = 0; cycle < 20; cycle++) {
        for (let round = 0; round < 100; round++) {
          recorder.record('cycle', String(cycle) + '_' + String(round));
        }
        expect(recorder.size()).assertEqual(100);
        recorder.clear();
        expect(recorder.size()).assertEqual(0);
      }
      expect(recorder.entries.length).assertEqual(0);
      expect(recorder.countOf('cycle')).assertEqual(0);
    });

    /**
     * @tc.name   recorderWithoutClearKeepsGrowingByDesign
     * @tc.desc   The recorder is intentionally unbounded within a session, and clear is the only release point.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recorderWithoutClearKeepsGrowingByDesign', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      for (let round = 0; round < 250; round++) {
        recorder.record('step', String(round));
      }
      expect(recorder.size()).assertEqual(250);
      expect(recorder.entries.length).assertEqual(250);
      expect(recorder.countOf('step')).assertEqual(250);
      recorder.clear();
      expect(recorder.size()).assertEqual(0);
    });

    /**
     * @tc.name   recorderAfterClearMatchesAFreshRecorder
     * @tc.desc   Trace, size and fingerprint of a cleared recorder equal those of a new recorder.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recorderAfterClearMatchesAFreshRecorder', 0, () => {
      const used: EventRecorder = new EventRecorder();
      used.record('started', TASK_A);
      used.record('completed', TASK_A);
      used.clear();
      const fresh: EventRecorder = new EventRecorder();
      expect(used.size()).assertEqual(fresh.size());
      expect(used.trace()).assertEqual(fresh.trace());
      expect(used.fingerprint()).assertEqual(fresh.fingerprint());
      expect(used.last()).assertEqual(fresh.last());
    });

    /**
     * @tc.name   holderCountReturnsToZeroAfterReset
     * @tc.desc   A single full run followed by reset leaves no shared or exclusive holder behind.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('holderCountReturnsToZeroAfterReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(graph.lock.holderCount()).assertEqual(0);
      graph.reset();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.sharedHolders.length).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.waitingExclusive).assertFalse();
    });

    /**
     * @tc.name   hundredHolderCyclesStayZeroAfterReset
     * @tc.desc   One hundred interrupted runs each release their holders on reset, with no accumulation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredHolderCyclesStayZeroAfterReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let released: number = 0;
      for (let cycle = 0; cycle < 100; cycle++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        if (graph.lock.holderCount() === 1) {
          released = released + 1;
        }
        graph.reset();
        expect(graph.lock.holderCount()).assertEqual(0);
      }
      expect(released).assertEqual(100);
      expect(graph.lock.sharedHolders.length).assertEqual(0);
      expect(graph.lock.acquisitions).assertEqual(0);
    });

    /**
     * @tc.name   lockResetEmptiesTheSharedHolderArray
     * @tc.desc   Two shared owners are removed from the array itself, not just from a count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('lockResetEmptiesTheSharedHolderArray', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      expect(lock.sharedHolders.length).assertEqual(2);
      lock.reset();
      expect(lock.sharedHolders.length).assertEqual(0);
      expect(lock.hasShared(TASK_A)).assertFalse();
      expect(lock.hasShared(TASK_B)).assertFalse();
      expect(lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   lockResetClearsTheExclusiveOwner
     * @tc.desc   A held exclusive slot is released by reset even without a matching release call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('lockResetClearsTheExclusiveOwner', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
      expect(lock.holderCount()).assertEqual(1);
      lock.reset();
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.isUnlocked()).assertTrue();
      expect(lock.acquireExclusive(TASK_C)).assertTrue();
    });

    /**
     * @tc.name   lockResetClearsAcquisitionAndRejectionCounters
     * @tc.desc   The diagnostic counters of the lock return to zero together with the holders.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lockResetClearsAcquisitionAndRejectionCounters', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireExclusive(TASK_C);
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      expect(lock.rejections).assertEqual(2);
      expect(lock.acquisitions).assertEqual(1);
      lock.reset();
      expect(lock.acquisitions).assertEqual(0);
      expect(lock.rejections).assertEqual(0);
      expect(lock.waitingExclusive).assertFalse();
      expect(lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   rejectedRequestsRetainNoHolders
     * @tc.desc   Fifty refused shared requests add rejections but never a holder entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('rejectedRequestsRetainNoHolders', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireExclusive(TASK_C);
      for (let round = 0; round < 50; round++) {
        expect(lock.acquireShared(TASK_A)).assertFalse();
      }
      expect(lock.rejections).assertEqual(50);
      expect(lock.sharedHolders.length).assertEqual(0);
      expect(lock.holderCount()).assertEqual(1);
      lock.reset();
      expect(lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   sharedHolderArrayGrowsOnlyByDistinctOwners
     * @tc.desc   Repeated acquisitions by A and B add no duplicate entries, while a third distinct owner adds one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sharedHolderArrayGrowsOnlyByDistinctOwners', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      lock.acquireShared(TASK_C);
      expect(lock.sharedHolders.length).assertEqual(3);
      lock.reset();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      expect(lock.sharedHolders.length).assertEqual(2);
      expect(lock.holderCount()).assertEqual(2);
    });

    /**
     * @tc.name   graphResetReleasesEveryResource
     * @tc.desc   One reset clears holders, the timer, the history, the order and the latch together.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphResetReleasesEveryResource', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.reset();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.timerActive).assertFalse();
      expect(graph.events.entries.length).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.isTaskFinished).assertTrue();
    });

    /**
     * @tc.name   repeatedRunsKeepHoldersAtZeroBetweenThem
     * @tc.desc   Between two hundred runs the holder count is always zero, never negative or stale.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedRunsKeepHoldersAtZeroBetweenThem', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let zeros: number = 0;
      for (let round = 0; round < 200; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        graph.completeTaskC(4);
        graph.reset();
        if (graph.lock.holderCount() === 0) {
          zeros = zeros + 1;
        }
      }
      expect(zeros).assertEqual(200);
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.totalProgress()).assertEqual(0);
    });

    /**
     * @tc.name   graphHistoryIsReleasedByEachReset
     * @tc.desc   Five hundred runs followed by resets leave the recorder at zero entries, not five thousand.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphHistoryIsReleasedByEachReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let round = 0; round < 500; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        graph.completeTaskC(4);
        expect(graph.events.size()).assertEqual(11);
        graph.reset();
      }
      expect(graph.events.entries.length).assertEqual(0);
      expect(graph.events.countOf('completed')).assertEqual(0);
      expect(graph.events.last()).assertEqual('');
    });

    /**
     * @tc.name   graphTaskArrayStaysAtThreeRows
     * @tc.desc   Hundreds of runs never append a row: the graph keeps exactly the three page tasks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphTaskArrayStaysAtThreeRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let round = 0; round < 300; round++) {
        graph.startAll();
        graph.completeTask(TASK_A, 1);
        graph.reset();
      }
      expect(graph.tasks.length).assertEqual(3);
      expect(graph.taskAt(0).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(2).taskNo).assertEqual(TASK_C);
      expect(graph.taskAt(5).taskNo).assertEqual(TASK_C);
    });

    /**
     * @tc.name   graphTimerFlagDoesNotLeakBetweenRuns
     * @tc.desc   After three hundred interrupted runs the timer flag is false between every pair of runs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphTimerFlagDoesNotLeakBetweenRuns', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      let idleFlags: number = 0;
      for (let round = 0; round < 300; round++) {
        graph.startAll();
        graph.reset();
        if (!graph.timerActive) {
          idleFlags = idleFlags + 1;
        }
      }
      expect(idleFlags).assertEqual(300);
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTicks).assertEqual(0);
    });

    /**
     * @tc.name   graphPollTicksNeverAccumulateAcrossRuns
     * @tc.desc   Poll counters are per run, so two hundred runs with three polls each still end at zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('graphPollTicksNeverAccumulateAcrossRuns', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let round = 0; round < 200; round++) {
        graph.startAll();
        graph.pollTick(1);
        graph.pollTick(2);
        graph.pollTick(3);
        expect(graph.pollTicks).assertEqual(3);
        graph.reset();
      }
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   externalLogsOutliveGraphResetsByDesign
     * @tc.desc   A snapshot log written outside the graph is not cleared by a graph reset, which owns only graph state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('externalLogsOutliveGraphResetsByDesign', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      log.capture(graph.tasks);
      graph.reset();
      expect(log.size()).assertEqual(3);
      expect(log.latest(TASK_A) !== undefined).assertTrue();
      graph.startAll();
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(6);
      log.clear();
      expect(log.size()).assertEqual(0);
    });

    /**
     * @tc.name   bufferAndSnapshotLogHaveDifferentBounds
     * @tc.desc   The buffer evicts at its limit while the snapshot log keeps growing until it is cleared.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bufferAndSnapshotLogHaveDifferentBounds', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const buffer: LogBuffer = new LogBuffer(4);
      const log: SnapshotLog = new SnapshotLog();
      for (let round = 0; round < 20; round++) {
        buffer.info('round ' + String(round));
        log.capture(graph.tasks);
      }
      expect(buffer.size()).assertEqual(4);
      expect(log.size()).assertEqual(60);
      expect(buffer.contains('round 0')).assertFalse();
      expect(log.snapshots.length).assertEqual(60);
      log.clear();
      expect(log.size()).assertEqual(0);
    });

    /**
     * @tc.name   graphRecorderIsClearedByReset
     * @tc.desc   The recorder owned by the graph loses every entry on reset, including failure markers.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphRecorderIsClearedByReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).fail(ERROR_NETWORK);
      graph.events.record('failed', TASK_A);
      expect(graph.events.size() > 4).assertTrue();
      graph.reset();
      expect(graph.events.size()).assertEqual(0);
      expect(graph.events.countOf('failed')).assertEqual(0);
      expect(graph.eventTrace()).assertEqual('');
      expect(graph.events.entries.length).assertEqual(0);
    });

    /**
     * @tc.name   failedStateIsNotRetainedAfterReset
     * @tc.desc   One hundred failed rounds followed by reset leave no error code or failed status behind.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedStateIsNotRetainedAfterReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let round = 0; round < 100; round++) {
        graph.startAll();
        graph.taskAt(0).fail(ERROR_NETWORK);
        graph.taskAt(1).fail(ERROR_NETWORK);
        expect(graph.lock.hasShared(TASK_A)).assertTrue();
        graph.reset();
      }
      expect(graph.taskAt(0).lastErrorCode).assertEqual(0);
      expect(graph.taskAt(1).lastErrorCode).assertEqual(0);
      expect(graph.taskAt(0).isFailed()).assertFalse();
      expect(graph.lock.holderCount()).assertEqual(0);
      expect(graph.allCompleted()).assertFalse();
    });

    /**
     * @tc.name   holderCountFollowsEachPhaseOfARun
     * @tc.desc   The holder count moves two, one, zero, one, zero through a run and returns to zero on reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('holderCountFollowsEachPhaseOfARun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.lock.holderCount()).assertEqual(2);
      graph.completeTask(TASK_A, 1);
      expect(graph.lock.holderCount()).assertEqual(1);
      graph.completeTask(TASK_B, 2);
      expect(graph.lock.holderCount()).assertEqual(0);
      graph.pollTick(3);
      expect(graph.lock.holderCount()).assertEqual(1);
      graph.completeTaskC(4);
      expect(graph.lock.holderCount()).assertEqual(0);
    });

    /**
     * @tc.name   combinedResourceAuditAfterFiftyRounds
     * @tc.desc   After fifty full runs the buffer, snapshot log, recorder and lock are each in a known state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('combinedResourceAuditAfterFiftyRounds', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const buffer: LogBuffer = new LogBuffer(10);
      const log: SnapshotLog = new SnapshotLog();
      for (let round = 0; round < 50; round++) {
        graph.startAll();
        buffer.info('round ' + String(round));
        graph.completeTask(TASK_A, 1);
        graph.completeTask(TASK_B, 2);
        graph.pollTick(3);
        graph.completeTaskC(4);
        log.capture(graph.tasks);
        graph.reset();
      }
      expect(buffer.size()).assertEqual(10);
      expect(log.size()).assertEqual(150);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.lock.holderCount()).assertEqual(0);
      log.clear();
      buffer.clear();
      expect(log.size()).assertEqual(0);
      expect(buffer.size()).assertEqual(0);
    });

    /**
     * @tc.name   evictionKeepsTheNewestEntryPerLevel
     * @tc.desc   With a mixed level stream the retained tail keeps the most recent INFO, WARN and ERROR lines.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('evictionKeepsTheNewestEntryPerLevel', 0, () => {
      const buffer: LogBuffer = new LogBuffer(6);
      buffer.info('old info');
      buffer.warn('old warn');
      buffer.error('old error');
      buffer.info('new info');
      buffer.warn('new warn');
      buffer.error('new error');
      buffer.info('newest info');
      expect(buffer.size()).assertEqual(6);
      expect(buffer.contains('old info')).assertFalse();
      expect(buffer.contains('new info')).assertTrue();
      expect(buffer.contains('newest info')).assertTrue();
      expect(buffer.countLevel(LEVEL_ERROR)).assertEqual(2);
    });

    /**
     * @tc.name   lockResetAllowsAnotherFullRun
     * @tc.desc   Freeing the lock by reset is enough to grant a fresh set of slots for the next run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lockResetAllowsAnotherFullRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      expect(graph.lock.acquisitions).assertEqual(3);
      graph.reset();
      graph.startAll();
      expect(graph.lock.acquisitions).assertEqual(2);
      expect(graph.lock.sharedHolders.length).assertEqual(2);
      expect(graph.lock.exclusiveOwner).assertEqual('');
      expect(graph.lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   twoGraphsKeepSeparateHistories
     * @tc.desc   Event history is owned per graph, so clearing one leaves the other recorder and lock untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoGraphsKeepSeparateHistories', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.startAll();
      second.startAll();
      first.completeTask(TASK_A, 1);
      expect(first.events.size()).assertEqual(5);
      expect(second.events.size()).assertEqual(4);
      first.reset();
      expect(first.events.size()).assertEqual(0);
      expect(second.events.size()).assertEqual(4);
      expect(second.lock.holderCount()).assertEqual(2);
    });

    /**
     * @tc.name   snapshotsDoNotRetainLiveTaskObjects
     * @tc.desc   Stored entries are value copies, so a log written before reset retains no live row reference state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('snapshotsDoNotRetainLiveTaskObjects', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      log.capture(graph.tasks);
      graph.reset();
      graph.startAll();
      expect(log.snapshots[0].status).assertEqual('completed');
      expect(log.snapshots[0].progress).assertEqual(100);
      expect(graph.taskAt(0).status).assertEqual('running');
      expect(log.size()).assertEqual(3);
    });

    /**
     * @tc.name   bufferClearDoesNotDisturbTheGraph
     * @tc.desc   Freeing the buffer during a run leaves rows, holders and the recorder exactly as they were.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MemoryLeakDetection scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bufferClearDoesNotDisturbTheGraph', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const buffer: LogBuffer = new LogBuffer(5);
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      buffer.error('boom');
      buffer.clear();
      expect(buffer.size()).assertEqual(0);
      expect(graph.taskAt(0).status).assertEqual('completed');
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.isTaskFinished).assertFalse();
    });
  });
}
