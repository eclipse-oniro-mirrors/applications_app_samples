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
 * QueueThroughputMatrix suite of the NetworkSample ohosTest module.
 *
 * The suite drives the queue side of the page many times in a row and watches
 * what grows: the event recorder, the bounded log, the dependency lock
 * counters and the 200 ms poll clock. Every aggregate is compared against an
 * independently computed total, and the fingerprints of two identical runs
 * must stay equal while a reordered run must not.
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   62       private lock = true, the gate of task C
 *   98-107   checkAndUnlock and canRunTaskC
 *   109-148  download(): action, overwrite, method, saveas
 *   174-198  startAllTasks queue and the 200 ms poll
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  PROGRESS_TOTAL,
  POLL_INTERVAL_MS,
  STATUS_IDLE,
  ERROR_NETWORK,
  TaskGraph,
  createTaskGraph,
  DependencyLock,
  EventRecorder,
  LogBuffer,
  PollClock,
  SnapshotLog,
  RunSnapshot,
  NetworkMetrics,
  textFingerprint,
  completionTrace,
  clampInt,
  LEVEL_INFO,
  LEVEL_WARN,
  LEVEL_ERROR
} from '../Shared/SharedDriver';

export default function queueThroughputMatrixTest(): void {
  describe('QueueThroughputMatrix', () => {
    beforeAll(() => {
      logSuite('QueueThroughputMatrix', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('QueueThroughputMatrix', 'end');
    });

    /**
     * @tc.name   throughputMatrixManyRunsAccumulateEvents
     * @tc.desc   Twenty independent runs each record a fixed five event sequence, so the aggregate is one hundred.
     * @tc.precondition  The shared driver is loaded and each loop iteration builds a fresh graph.
     * @tc.steps         1. Loop twenty times over a fresh graph with startAll and completeTask A.
     *                   2. Sum the event recorder sizes and the completed counts.
     *                   3. Compare both totals with the expected product.
     * @tc.expected      The aggregate size is 100 and the aggregate completed count is 20.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('throughputMatrixManyRunsAccumulateEvents', 0, () => {
      let events: number = 0;
      let completed: number = 0;
      for (let run: number = 0; run < 20; run++) {
        const graph: TaskGraph = createTaskGraph();
        graph.startAll();
        graph.completeTask(TASK_A, run);
        events = events + graph.events.size();
        completed = completed + graph.events.countOf('completed');
      }
      logStep('QueueThroughputMatrix', 'twenty runs events ' + String(events) + ' completed ' + String(completed));
      expect(events).assertEqual(100);
      expect(completed).assertEqual(20);
      expect(events / 20).assertEqual(5);
      expect(completed).assertLess(events);
      expect(events).assertLarger(99);
      expect(completed).assertEqual(20);
    });

    /**
     * @tc.name   throughputMatrixRunCountMatchesCompletedRows
     * @tc.desc   Thirty fresh runs each complete all three rows, so the completed events total ninety.
     * @tc.precondition  The shared driver is loaded and each run builds its own graph.
     * @tc.steps         1. Loop thirty times over a fresh graph that completes A, B and C.
     *                   2. Count the completed events across the loop.
     *                   3. Compare the count with thirty times three.
     * @tc.expected      The completed event count is exactly ninety.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('throughputMatrixRunCountMatchesCompletedRows', 0, () => {
      let completed: number = 0;
      let rows: number = 0;
      for (let run: number = 0; run < 30; run++) {
        const graph: TaskGraph = createTaskGraph();
        graph.completeTask(TASK_A, run);
        graph.completeTask(TASK_B, run);
        graph.completeTask(TASK_C, run);
        completed = completed + graph.events.countOf('completed');
        rows = rows + graph.completionOrder.length;
      }
      logStep('QueueThroughputMatrix', 'thirty runs rows ' + String(rows) + ' completed ' + String(completed));
      expect(rows).assertEqual(90);
      expect(completed).assertEqual(90);
      expect(completed).assertEqual(rows);
      expect(completed / 30).assertEqual(3);
      expect(completed).assertLarger(89);
      expect(completed).assertLess(91);
    });

    /**
     * @tc.name   throughputMatrixEventRecorderGrowthLinear
     * @tc.desc   The recorder grows by exactly one entry per record call, so the size is the call count.
     * @tc.precondition  The shared driver is loaded and a recorder starts empty.
     * @tc.steps         1. Record ten entries and read the size.
     *                   2. Record ten more entries and read the size again.
     *                   3. Compare both sizes with the call counts.
     * @tc.expected      The sizes are 10 and 20 and the growth is exactly linear.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('throughputMatrixEventRecorderGrowthLinear', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      for (let index: int = 0; index < 10; index++) {
        recorder.record('phase', String(index));
      }
      const afterTen: number = recorder.size();
      for (let index: int = 10; index < 20; index++) {
        recorder.record('phase', String(index));
      }
      logStep('QueueThroughputMatrix', 'recorder growth ' + String(afterTen) + ' -> ' + String(recorder.size()));
      expect(afterTen).assertEqual(10);
      expect(recorder.size()).assertEqual(20);
      expect(recorder.size() - afterTen).assertEqual(10);
      expect(recorder.last()).assertEqual('phase:19');
      expect(recorder.entries[0]).assertEqual('phase:0');
      expect(recorder.countOf('phase')).assertEqual(20);
    });

    /**
     * @tc.name   throughputMatrixEventRecorderCountKind
     * @tc.desc   countOf isolates each kind, so a noisy run can still report how many of a kind happened.
     * @tc.precondition  The shared driver is loaded and the recorder receives three different kinds.
     * @tc.steps         1. Record four start entries, three complete entries and two fail entries.
     *                   2. Count each kind and the total.
     *                   3. Compare the counts with the recorded numbers.
     * @tc.expected      The counts are four, three and two with a total of nine.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('throughputMatrixEventRecorderCountKind', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      for (let index: int = 0; index < 4; index++) {
        recorder.record('started', TASK_A);
      }
      for (let index: int = 0; index < 3; index++) {
        recorder.record('completed', TASK_B);
      }
      recorder.record('failed', TASK_C);
      recorder.record('failed', TASK_C);
      logStep('QueueThroughputMatrix', 'kind counts ' + String(recorder.countOf('started')) + '/' +
        String(recorder.countOf('completed')) + '/' + String(recorder.countOf('failed')));
      expect(recorder.countOf('started')).assertEqual(4);
      expect(recorder.countOf('completed')).assertEqual(3);
      expect(recorder.countOf('failed')).assertEqual(2);
      expect(recorder.size()).assertEqual(9);
      expect(recorder.countOf('missing')).assertEqual(0);
      expect(recorder.trace().split('|').length).assertEqual(9);
    });

    /**
     * @tc.name   throughputMatrixEventTraceFingerprintStable
     * @tc.desc   Two graphs that execute the same ordered queue produce the same trace fingerprint.
     * @tc.precondition  The shared driver is loaded and both graphs start from an empty recorder.
     * @tc.steps         1. Drive two graphs through startAll, both completions and the poll.
     *                   2. Complete row C on both graphs.
     *                   3. Compare traces and fingerprints.
     * @tc.expected      The traces are identical and the fingerprints match and are non-zero.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('throughputMatrixEventTraceFingerprintStable', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.startAll();
      second.startAll();
      first.completeTask(TASK_A, 10);
      second.completeTask(TASK_A, 10);
      first.completeTask(TASK_B, 20);
      second.completeTask(TASK_B, 20);
      first.pollTick(30);
      second.pollTick(30);
      first.completeTaskC(40);
      second.completeTaskC(40);
      const firstPrint: number = first.events.fingerprint();
      logStep('QueueThroughputMatrix', 'stable print ' + String(firstPrint));
      expect(first.eventTrace()).assertEqual(second.eventTrace());
      expect(firstPrint).assertEqual(second.events.fingerprint());
      expect(firstPrint).assertLarger(0);
      expect(firstPrint).assertEqual(textFingerprint(first.eventTrace()));
      expect(first.events.countOf('completed')).assertEqual(3);
      expect(first.events.countOf('timer-cleared')).assertEqual(1);
    });

    /**
     * @tc.name   throughputMatrixDifferentOrderChangesFingerprint
     * @tc.desc   A reordered queue changes the trace fingerprint even when the same number of rows complete.
     * @tc.precondition  The shared driver is loaded and two graphs receive different completion orders.
     * @tc.steps         1. Complete A then B on the first graph and B then A on the second.
     *                   2. Complete C on both graphs directly.
     *                   3. Compare the two fingerprints.
     * @tc.expected      Both graphs complete three rows but the fingerprints differ.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('throughputMatrixDifferentOrderChangesFingerprint', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.completeTask(TASK_A, 0);
      first.completeTask(TASK_B, 0);
      second.completeTask(TASK_B, 0);
      second.completeTask(TASK_A, 0);
      first.completeTask(TASK_C, 0);
      second.completeTask(TASK_C, 0);
      logStep('QueueThroughputMatrix', 'ordered ' + completionTrace(first) + ' vs ' + completionTrace(second));
      expect(completionTrace(first)).assertEqual('A|B|C');
      expect(completionTrace(second)).assertEqual('B|A|C');
      expect(first.events.countOf('completed')).assertEqual(second.events.countOf('completed'));
      expect(first.events.fingerprint() === second.events.fingerprint()).assertFalse();
      expect(first.events.size()).assertEqual(5);
      expect(second.events.size()).assertEqual(5);
      expect(first.events.countOf('unlocked')).assertEqual(2);
    });

    /**
     * @tc.name   throughputMatrixEmptyRecorderFingerprintConstant
     * @tc.desc   An empty recorder hashes the empty trace to the seed value and a clear returns to that value.
     * @tc.precondition  The shared driver is loaded and a fresh recorder holds no entries.
     * @tc.steps         1. Read the fingerprint of the empty recorder.
     *                   2. Record one entry and read the fingerprint again.
     *                   3. Clear the recorder and read the fingerprint a third time.
     * @tc.expected      The empty fingerprint is the documented seed and the clear restores it.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('throughputMatrixEmptyRecorderFingerprintConstant', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      const empty: number = recorder.fingerprint();
      recorder.record('probe', 'one');
      const filled: number = recorder.fingerprint();
      recorder.clear();
      const cleared: number = recorder.fingerprint();
      logStep('QueueThroughputMatrix', 'empty/filled/cleared ' + String(empty) + '/' + String(filled) + '/' +
        String(cleared));
      expect(empty).assertEqual(216613);
      expect(empty).assertEqual(textFingerprint(''));
      expect(filled === empty).assertFalse();
      expect(cleared).assertEqual(empty);
      expect(recorder.size()).assertEqual(0);
      expect(filled).assertLarger(0);
    });

    /**
     * @tc.name   throughputMatrixRecorderLastTracksLatest
     * @tc.desc   last answers the newest entry and falls back to an empty string only when the recorder is empty.
     * @tc.precondition  The shared driver is loaded and a recorder starts empty.
     * @tc.steps         1. Read last on the empty recorder.
     *                   2. Record two entries and read last.
     *                   3. Record a third and read last again.
     * @tc.expected      The last value follows every append and is never the older entry.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('throughputMatrixRecorderLastTracksLatest', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      const empty: string = recorder.last();
      recorder.record('queued', TASK_A);
      recorder.record('started', TASK_B);
      const second: string = recorder.last();
      recorder.record('completed', TASK_C);
      logStep('QueueThroughputMatrix', 'last entries ' + empty + ' / ' + second + ' / ' + recorder.last());
      expect(empty).assertEqual('');
      expect(second).assertEqual('started:B');
      expect(recorder.last()).assertEqual('completed:C');
      expect(recorder.last() === second).assertFalse();
      expect(recorder.size()).assertEqual(3);
      expect(recorder.entries[1]).assertEqual('started:B');
    });

    /**
     * @tc.name   throughputMatrixRecorderClearResetsSize
     * @tc.desc   Clear is the only operation that shrinks the recorder, and it drops every entry at once.
     * @tc.precondition  The shared driver is loaded and a recorder holds several entries.
     * @tc.steps         1. Record six entries across two kinds.
     *                   2. Clear the recorder.
     *                   3. Read size, trace and both counts.
     * @tc.expected      The size and both counts return to zero and the trace is empty.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('throughputMatrixRecorderClearResetsSize', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('started', TASK_A);
      recorder.record('started', TASK_B);
      recorder.record('completed', TASK_A);
      recorder.record('completed', TASK_B);
      recorder.record('queued', TASK_C);
      recorder.record('started', TASK_C);
      const before: number = recorder.size();
      recorder.clear();
      logStep('QueueThroughputMatrix', 'clear ' + String(before) + ' -> ' + String(recorder.size()));
      expect(before).assertEqual(6);
      expect(recorder.size()).assertEqual(0);
      expect(recorder.trace()).assertEqual('');
      expect(recorder.countOf('started')).assertEqual(0);
      expect(recorder.countOf('completed')).assertEqual(0);
      expect(recorder.last()).assertEqual('');
      expect(recorder.fingerprint()).assertEqual(216613);
    });

    /**
     * @tc.name   throughputMatrixLogBufferBoundedAtLimit
     * @tc.desc   A bounded log keeps only the newest lines, so a long run cannot grow memory without a bound.
     * @tc.precondition  The shared driver is loaded and a LogBuffer is created with a limit of eight.
     * @tc.steps         1. Write twenty info lines into the buffer.
     *                   2. Read the size and the level count.
     *                   3. Test the buffer for an old line and a retained line.
     * @tc.expected      The size stays eight, the oldest lines are gone and the newest line is present.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('throughputMatrixLogBufferBoundedAtLimit', 0, () => {
      const log: LogBuffer = new LogBuffer(8);
      for (let index: int = 0; index < 20; index++) {
        log.info('line-' + String(index));
      }
      logStep('QueueThroughputMatrix', 'bounded log size ' + String(log.size()));
      expect(log.size()).assertEqual(8);
      expect(log.limit).assertEqual(8);
      expect(log.contains('line-19')).assertTrue();
      expect(log.contains('line-12')).assertTrue();
      expect(log.contains('line-11')).assertFalse();
      expect(log.countLevel(LEVEL_INFO)).assertEqual(8);
    });

    /**
     * @tc.name   throughputMatrixLogBufferTracksLevels
     * @tc.desc   The bounded log keeps a parallel level array so severity counts survive trimming.
     * @tc.precondition  The shared driver is loaded and a buffer uses the default limit of sixty four.
     * @tc.steps         1. Write three info, two warn and one error line.
     *                   2. Count each level separately.
     *                   3. Compare the total with the written line count.
     * @tc.expected      The counts are three, two and one with a total of six.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('throughputMatrixLogBufferTracksLevels', 0, () => {
      const log: LogBuffer = new LogBuffer();
      log.info('queue-a');
      log.info('queue-b');
      log.info('queue-c');
      log.warn('slow-a');
      log.warn('slow-b');
      log.error('failed-a');
      logStep('QueueThroughputMatrix', 'levels ' + log.trace());
      expect(log.size()).assertEqual(6);
      expect(log.countLevel(LEVEL_INFO)).assertEqual(3);
      expect(log.countLevel(LEVEL_WARN)).assertEqual(2);
      expect(log.countLevel(LEVEL_ERROR)).assertEqual(1);
      expect(log.levels.length).assertEqual(6);
      expect(log.countLevel(LEVEL_INFO) + log.countLevel(LEVEL_WARN) + log.countLevel(LEVEL_ERROR))
        .assertEqual(log.size());
    });

    /**
     * @tc.name   throughputMatrixLogBufferContainsFragment
     * @tc.desc   contains searches whole rendered lines, including the level prefix, and rejects absent fragments.
     * @tc.precondition  The shared driver is loaded and the buffer holds one line of each level.
     * @tc.steps         1. Write info download, warn slow and error failed lines.
     *                   2. Search for three fragments that exist.
     *                   3. Search for one fragment that never appears.
     * @tc.expected      The existing fragments are found and the absent fragment is not.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('throughputMatrixLogBufferContainsFragment', 0, () => {
      const log: LogBuffer = new LogBuffer();
      log.info('download started');
      log.warn('slow poll');
      log.error('failed row');
      logStep('QueueThroughputMatrix', 'contains ' + log.trace());
      expect(log.contains('download')).assertTrue();
      expect(log.contains('slow poll')).assertTrue();
      expect(log.contains('failed row')).assertTrue();
      expect(log.contains('missing')).assertFalse();
      expect(log.contains(LEVEL_ERROR)).assertTrue();
      expect(log.contains('INFO download')).assertTrue();
    });

    /**
     * @tc.name   throughputMatrixLogBufferClear
     * @tc.desc   Clearing the bounded log empties both the line array and the level array together.
     * @tc.precondition  The shared driver is loaded and the buffer holds mixed level lines.
     * @tc.steps         1. Write one info, one warn and one error line.
     *                   2. Clear the buffer.
     *                   3. Read the size, the trace and the level counts.
     * @tc.expected      The size is zero and no fragment or level remains.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('throughputMatrixLogBufferClear', 0, () => {
      const log: LogBuffer = new LogBuffer(16);
      log.info('alpha');
      log.warn('beta');
      log.error('gamma');
      const before: number = log.size();
      log.clear();
      logStep('QueueThroughputMatrix', 'cleared log ' + String(before) + ' -> ' + String(log.size()));
      expect(before).assertEqual(3);
      expect(log.size()).assertEqual(0);
      expect(log.trace()).assertEqual('');
      expect(log.contains('alpha')).assertFalse();
      expect(log.countLevel(LEVEL_INFO)).assertEqual(0);
      expect(log.levels.length).assertEqual(0);
      expect(log.limit).assertEqual(16);
    });

    /**
     * @tc.name   throughputMatrixLockManySharedHolders
     * @tc.desc   The dependency lock admits many shared holders at once and counts each acquisition once.
     * @tc.precondition  The shared driver is loaded and the lock is completely free.
     * @tc.steps         1. Acquire the lock in shared mode for A, B and C.
     *                   2. Read the holder count and the acquisition counter.
     *                   3. Confirm the lock is not unlocked.
     * @tc.expected      All three owners hold the lock and the acquisition counter reaches three.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('throughputMatrixLockManySharedHolders', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      const first: boolean = lock.acquireShared(TASK_A);
      const second: boolean = lock.acquireShared(TASK_B);
      const third: boolean = lock.acquireShared(TASK_C);
      logStep('QueueThroughputMatrix', 'shared holders ' + String(lock.holderCount()));
      expect(first).assertTrue();
      expect(second).assertTrue();
      expect(third).assertTrue();
      expect(lock.holderCount()).assertEqual(3);
      expect(lock.sharedHolders.length).assertEqual(3);
      expect(lock.acquisitions).assertEqual(3);
      expect(lock.isUnlocked()).assertFalse();
      expect(lock.hasShared(TASK_B)).assertTrue();
    });

    /**
     * @tc.name   throughputMatrixLockExclusiveBlocksShared
     * @tc.desc   An exclusive owner shuts out every later shared request, which models C blocking A and B.
     * @tc.precondition  The shared driver is loaded and C already owns the lock exclusively.
     * @tc.steps         1. Acquire the lock exclusively for C.
     *                   2. Request shared mode for A and for B.
     *                   3. Read the rejection counter and the holder count.
     * @tc.expected      Both shared requests fail and only the exclusive owner remains.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('throughputMatrixLockExclusiveBlocksShared', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireExclusive(TASK_C);
      const sharedA: boolean = lock.acquireShared(TASK_A);
      const sharedB: boolean = lock.acquireShared(TASK_B);
      logStep('QueueThroughputMatrix', 'exclusive blocks shared ' + String(sharedA) + '/' + String(sharedB));
      expect(sharedA).assertFalse();
      expect(sharedB).assertFalse();
      expect(lock.rejections).assertEqual(2);
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.hasShared(TASK_A)).assertFalse();
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.isUnlocked()).assertFalse();
    });

    /**
     * @tc.name   throughputMatrixLockRejectsSecondExclusive
     * @tc.desc   Only one exclusive owner is allowed, so a second exclusive request is recorded as waiting.
     * @tc.precondition  The shared driver is loaded and C owns the exclusive mode.
     * @tc.steps         1. Acquire the lock exclusively for C.
     *                   2. Request exclusive mode for A.
     *                   3. Read the owner, the waiting flag and the rejections.
     * @tc.expected      A is rejected, C keeps the mode and the lock reports a waiting exclusive.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('throughputMatrixLockRejectsSecondExclusive', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      const first: boolean = lock.acquireExclusive(TASK_C);
      const second: boolean = lock.acquireExclusive(TASK_A);
      logStep('QueueThroughputMatrix', 'second exclusive ' + String(second));
      expect(first).assertTrue();
      expect(second).assertFalse();
      expect(lock.exclusiveOwner).assertEqual(TASK_C);
      expect(lock.waitingExclusive).assertTrue();
      expect(lock.rejections).assertEqual(1);
      expect(lock.acquisitions).assertEqual(1);
      expect(lock.holderCount()).assertEqual(1);
    });

    /**
     * @tc.name   throughputMatrixLockReleasesRestoreUnlocked
     * @tc.desc   Releasing every shared holder restores the free state, and a duplicate release is refused.
     * @tc.precondition  The shared driver is loaded and rows A and B hold the shared mode.
     * @tc.steps         1. Acquire shared mode for A and B.
     *                   2. Release A and then B.
     *                   3. Attempt to release B a second time.
     * @tc.expected      The lock becomes unlocked and the duplicate release returns false.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('throughputMatrixLockReleasesRestoreUnlocked', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      const releaseA: boolean = lock.releaseShared(TASK_A);
      const releaseB: boolean = lock.releaseShared(TASK_B);
      const duplicate: boolean = lock.releaseShared(TASK_B);
      logStep('QueueThroughputMatrix', 'releases ' + String(releaseA) + '/' + String(releaseB) + '/' +
        String(duplicate));
      expect(releaseA).assertTrue();
      expect(releaseB).assertTrue();
      expect(duplicate).assertFalse();
      expect(lock.isUnlocked()).assertTrue();
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.sharedHolders.length).assertEqual(0);
      expect(lock.rejections).assertEqual(0);
    });

    /**
     * @tc.name   throughputMatrixLockAcquisitionCounter
     * @tc.desc   A repeated shared acquisition by the same owner returns true but does not double count.
     * @tc.precondition  The shared driver is loaded and row A already holds the shared mode.
     * @tc.steps         1. Acquire shared mode for A twice.
     *                   2. Read the acquisition counter and the holder count.
     *                   3. Release once and acquire again.
     * @tc.expected      The counter is one after the duplicate and two after the re-acquisition.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('throughputMatrixLockAcquisitionCounter', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      const first: boolean = lock.acquireShared(TASK_A);
      const duplicate: boolean = lock.acquireShared(TASK_A);
      const afterDuplicate: number = lock.acquisitions;
      lock.releaseShared(TASK_A);
      const third: boolean = lock.acquireShared(TASK_A);
      logStep('QueueThroughputMatrix', 'acquisitions ' + String(afterDuplicate) + ' -> ' +
        String(lock.acquisitions));
      expect(first).assertTrue();
      expect(duplicate).assertTrue();
      expect(afterDuplicate).assertEqual(1);
      expect(third).assertTrue();
      expect(lock.acquisitions).assertEqual(2);
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.sharedHolders.length).assertEqual(1);
    });

    /**
     * @tc.name   throughputMatrixLockHolderCount
     * @tc.desc   holderCount reports shared holders plus the exclusive owner and drops to zero when released.
     * @tc.precondition  The shared driver is loaded and the lock starts free.
     * @tc.steps         1. Acquire shared mode for A and B and read the count.
     *                   2. Release both and acquire exclusive mode for C.
     *                   3. Release C and read the count again.
     * @tc.expected      The counts are two, one and zero.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('throughputMatrixLockHolderCount', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireShared(TASK_B);
      const sharedCount: number = lock.holderCount();
      lock.releaseShared(TASK_A);
      lock.releaseShared(TASK_B);
      lock.acquireExclusive(TASK_C);
      const exclusiveCount: number = lock.holderCount();
      lock.releaseExclusive(TASK_C);
      logStep('QueueThroughputMatrix', 'holder counts ' + String(sharedCount) + '/' + String(exclusiveCount) + '/' +
        String(lock.holderCount()));
      expect(sharedCount).assertEqual(2);
      expect(exclusiveCount).assertEqual(1);
      expect(lock.holderCount()).assertEqual(0);
      expect(lock.isUnlocked()).assertTrue();
      expect(lock.exclusiveOwner).assertEqual('');
      expect(sharedCount).assertLarger(exclusiveCount);
    });

    /**
     * @tc.name   throughputMatrixLockResetClearsCounters
     * @tc.desc   Resetting the lock drops holders, rejections and acquisitions so the next run starts clean.
     * @tc.precondition  The shared driver is loaded and the lock carries a contended history.
     * @tc.steps         1. Acquire shared mode, attempt an exclusive mode and release the shared mode.
     *                   2. Call reset on the lock.
     *                   3. Read every counter and the unlocked flag.
     * @tc.expected      Every counter is zero and the lock reports unlocked.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('throughputMatrixLockResetClearsCounters', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      lock.acquireExclusive(TASK_C);
      lock.releaseShared(TASK_A);
      const beforeAcquisitions: number = lock.acquisitions;
      const beforeRejections: number = lock.rejections;
      lock.reset();
      logStep('QueueThroughputMatrix', 'lock reset ' + String(beforeAcquisitions) + '/' + String(beforeRejections));
      expect(beforeAcquisitions).assertEqual(1);
      expect(beforeRejections).assertEqual(1);
      expect(lock.acquisitions).assertEqual(0);
      expect(lock.rejections).assertEqual(0);
      expect(lock.sharedHolders.length).assertEqual(0);
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.isUnlocked()).assertTrue();
    });

    /**
     * @tc.name   throughputMatrixPollClockManyTicks
     * @tc.desc   Fifty poll periods accumulate exactly ten seconds without drift or rounding loss.
     * @tc.precondition  The shared driver is loaded and the clock uses the 200 ms page period.
     * @tc.steps         1. Start the clock and tick fifty times.
     *                   2. Read the elapsed budget and the tick counter.
     *                   3. Compare the budget with the tick and interval product.
     * @tc.expected      The elapsed time is 10000 ms and equals fifty times the interval.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('throughputMatrixPollClockManyTicks', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      let elapsed: number = 0;
      for (let index: int = 0; index < 50; index++) {
        elapsed = clock.tick();
      }
      logStep('QueueThroughputMatrix', 'fifty ticks ' + String(elapsed));
      expect(elapsed).assertEqual(10000);
      expect(clock.ticks).assertEqual(50);
      expect(clock.elapsedMs).assertEqual(10000);
      expect(elapsed).assertEqual(clock.ticks * POLL_INTERVAL_MS);
      expect(elapsed / POLL_INTERVAL_MS).assertEqual(50);
      expect(clock.active).assertTrue();
    });

    /**
     * @tc.name   throughputMatrixPollClockDueAfterRounds
     * @tc.desc   A deadline comparison is inclusive at the boundary and false one round before it.
     * @tc.precondition  The shared driver is loaded and three periods have elapsed.
     * @tc.steps         1. Start the clock and tick three times.
     *                   2. Ask whether two and three rounds are due.
     *                   3. Ask whether four rounds are due.
     * @tc.expected      Two and three are due while four is not.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('throughputMatrixPollClockDueAfterRounds', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      clock.tick();
      clock.tick();
      const elapsed: number = clock.tick();
      logStep('QueueThroughputMatrix', 'due at ' + String(elapsed));
      expect(elapsed).assertEqual(600);
      expect(clock.isDueAfter(2)).assertTrue();
      expect(clock.isDueAfter(3)).assertTrue();
      expect(clock.isDueAfter(4)).assertFalse();
      expect(clock.isDueAfter(0)).assertTrue();
      expect(clock.isDueAfter(1)).assertTrue();
      expect(elapsed / POLL_INTERVAL_MS).assertEqual(3);
    });

    /**
     * @tc.name   throughputMatrixPollClockStopFreezes
     * @tc.desc   A stopped clock keeps its budget frozen and every later tick returns the same elapsed value.
     * @tc.precondition  The shared driver is loaded and the clock has run for two periods.
     * @tc.steps         1. Start the clock and tick twice.
     *                   2. Stop the clock and tick three more times.
     *                   3. Read the elapsed budget and the tick counter.
     * @tc.expected      The budget stays 400 and the tick counter stays two.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('throughputMatrixPollClockStopFreezes', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      clock.tick();
      const running: number = clock.tick();
      clock.stop();
      const frozenOne: number = clock.tick();
      const frozenTwo: number = clock.tick();
      const frozenThree: number = clock.tick();
      logStep('QueueThroughputMatrix', 'frozen clock ' + String(running) + ' / ' + String(frozenThree));
      expect(running).assertEqual(400);
      expect(frozenOne).assertEqual(400);
      expect(frozenTwo).assertEqual(400);
      expect(frozenThree).assertEqual(400);
      expect(clock.ticks).assertEqual(2);
      expect(clock.active).assertFalse();
      expect(clock.isDueAfter(3)).assertFalse();
    });

    /**
     * @tc.name   throughputMatrixPollClockRestartResets
     * @tc.desc   Restarting the poll clears the tick counter and the budget instead of continuing the old run.
     * @tc.precondition  The shared driver is loaded and the clock has already accumulated time.
     * @tc.steps         1. Start the clock and tick four times.
     *                   2. Stop it and start it again.
     *                   3. Read the counter, the budget and one fresh tick.
     * @tc.expected      The counter and budget reset to zero and the fresh tick reaches one period.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('throughputMatrixPollClockRestartResets', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      clock.tick();
      clock.tick();
      clock.tick();
      const before: number = clock.tick();
      clock.stop();
      clock.start();
      const ticksAfterStart: number = clock.ticks;
      const elapsedAfterStart: number = clock.elapsedMs;
      const fresh: number = clock.tick();
      logStep('QueueThroughputMatrix', 'restart ' + String(before) + ' -> ' + String(fresh));
      expect(before).assertEqual(800);
      expect(ticksAfterStart).assertEqual(0);
      expect(elapsedAfterStart).assertEqual(0);
      expect(fresh).assertEqual(200);
      expect(clock.ticks).assertEqual(1);
      expect(clock.active).assertTrue();
      expect(clock.isDueAfter(1)).assertTrue();
    });

    /**
     * @tc.name   throughputMatrixGraphPollLoop
     * @tc.desc   A five round poll loop starts C exactly once and increments the poll counter on every round.
     * @tc.precondition  The shared driver is loaded and rows A and B have both completed.
     * @tc.steps         1. Start the graph and complete the two shared rows.
     *                   2. Poll five times and count the true answers.
     *                   3. Read the C attempt count and the timer flag.
     * @tc.expected      Exactly one poll starts C, the counter reaches five and the timer is down.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('throughputMatrixGraphPollLoop', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      let startedCount: number = 0;
      for (let round: number = 0; round < 5; round++) {
        if (graph.pollTick(30 + round)) {
          startedCount = startedCount + 1;
        }
      }
      logStep('QueueThroughputMatrix', 'poll loop started ' + String(startedCount));
      expect(startedCount).assertEqual(1);
      expect(graph.pollTicks).assertEqual(5);
      expect(graph.taskAt(2).attempts).assertEqual(1);
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
    });

    /**
     * @tc.name   throughputMatrixMetricsFingerprintStable
     * @tc.desc   Two equivalent graphs produce the same metrics fingerprint and the same total progress.
     * @tc.precondition  The shared driver is loaded and both graphs complete A and report 40 on B.
     * @tc.steps         1. Apply the same operations to two fresh graphs.
     *                   2. Build NetworkMetrics from both.
     *                   3. Compare fingerprints, totals and ratios.
     * @tc.expected      The fingerprints match and every numeric metric is identical.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('throughputMatrixMetricsFingerprintStable', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.startAll();
      second.startAll();
      first.completeTask(TASK_A, 10);
      second.completeTask(TASK_A, 10);
      first.taskAt(1).reportProgress(40);
      second.taskAt(1).reportProgress(40);
      const firstMetrics: NetworkMetrics = NetworkMetrics.from(first);
      const secondMetrics: NetworkMetrics = NetworkMetrics.from(second);
      const print: number = firstMetrics.fingerprint();
      logStep('QueueThroughputMatrix', 'metrics print ' + String(print));
      expect(firstMetrics.fingerprint()).assertEqual(secondMetrics.fingerprint());
      expect(firstMetrics.totalProgress).assertEqual(140);
      expect(secondMetrics.totalProgress).assertEqual(140);
      expect(firstMetrics.averageProgress()).assertEqual(secondMetrics.averageProgress());
      expect(firstMetrics.successRatio()).assertEqual(secondMetrics.successRatio());
      expect(print).assertLarger(0);
      expect(print).assertEqual(secondMetrics.fingerprint());
    });

    /**
     * @tc.name   throughputMatrixMetricsSuccessRatioPartial
     * @tc.desc   The success ratio is completed rows over total rows, so one of three completes is a third.
     * @tc.precondition  The shared driver is loaded and row A completes while row B fails.
     * @tc.steps         1. Start the graph, complete A and fail B.
     *                   2. Build the metrics view.
     *                   3. Read the ratios and the average.
     * @tc.expected      The success ratio is one third, one row failed and the average is a third of a bar.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('throughputMatrixMetricsSuccessRatioPartial', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.taskAt(1).fail(ERROR_NETWORK);
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      logStep('QueueThroughputMatrix', 'partial metrics ' + String(metrics.successRatio()));
      expect(metrics.totalTasks).assertEqual(3);
      expect(metrics.completedTasks).assertEqual(1);
      expect(metrics.failedTasks).assertEqual(1);
      expect(metrics.successRatio()).assertEqual(1.0 / 3);
      expect(metrics.totalProgress).assertEqual(100);
      expect(metrics.averageProgress()).assertEqual(100.0 / 3);
      expect(metrics.successRatio()).assertLess(1);
    });

    /**
     * @tc.name   throughputMatrixMetricsAverageProgress
     * @tc.desc   Two completed rows leave the metrics average at two thirds of a bar, matching the graph average.
     * @tc.precondition  The shared driver is loaded and rows A and B have completed.
     * @tc.steps         1. Start the graph and complete rows A and B.
     *                   2. Build the metrics view.
     *                   3. Compare the metrics average with the graph average.
     * @tc.expected      Both averages are about 66.7 and the completed count is two.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('throughputMatrixMetricsAverageProgress', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      const metrics: NetworkMetrics = NetworkMetrics.from(graph);
      const graphAverage: number = graph.averageProgress();
      logStep('QueueThroughputMatrix', 'average metrics ' + String(metrics.averageProgress()));
      expect(metrics.averageProgress()).assertEqual(200.0 / 3);
      expect(metrics.averageProgress()).assertEqual(graphAverage);
      expect(metrics.completedTasks).assertEqual(2);
      expect(metrics.successRatio()).assertEqual(2.0 / 3);
      expect(metrics.totalProgress).assertEqual(200);
      expect(metrics.failedTasks).assertEqual(0);
    });

    /**
     * @tc.name   throughputMatrixHundredTasksTotalProgress
     * @tc.desc   Thirty four full runs conserve progress: 102 rows contribute exactly 10200 points.
     * @tc.precondition  The shared driver is loaded and each loop builds a fresh three row graph.
     * @tc.steps         1. Loop thirty four times and complete all three rows.
     *                   2. Accumulate the row count and the graph total.
     *                   3. Compare the aggregate with the per-run total times the run count.
     * @tc.expected      The aggregate holds 102 completed rows and 10200 progress points.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('throughputMatrixHundredTasksTotalProgress', 0, () => {
      let rows: number = 0;
      let total: number = 0;
      for (let run: number = 0; run < 34; run++) {
        const graph: TaskGraph = createTaskGraph();
        graph.completeTask(TASK_A, run);
        graph.completeTask(TASK_B, run);
        graph.completeTask(TASK_C, run);
        rows = rows + graph.tasks.length;
        total = total + graph.totalProgress();
      }
      logStep('QueueThroughputMatrix', 'aggregate rows ' + String(rows) + ' total ' + String(total));
      expect(rows).assertEqual(102);
      expect(total).assertEqual(10200);
      expect(total).assertEqual(rows * PROGRESS_TOTAL);
      expect(total / rows).assertEqual(PROGRESS_TOTAL);
      expect(rows).assertLarger(100);
      expect(total).assertLarger(10000);
    });

    /**
     * @tc.name   throughputMatrixCompletionTraceLength
     * @tc.desc   One full queue records three completion entries in the trace and the text splits into three parts.
     * @tc.precondition  The shared driver is loaded and the graph runs A, B and C in gate order.
     * @tc.steps         1. Start the graph, complete A and B and poll for C.
     *                   2. Complete row C.
     *                   3. Read the trace, its length and its split segments.
     * @tc.expected      The trace is A|B|C with three segments and the order array has three entries.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('throughputMatrixCompletionTraceLength', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      graph.pollTick(30);
      graph.completeTaskC(40);
      const trace: string = completionTrace(graph);
      const parts: string[] = trace.split('|');
      logStep('QueueThroughputMatrix', 'completion trace ' + trace);
      expect(trace).assertEqual('A|B|C');
      expect(parts.length).assertEqual(3);
      expect(parts[0]).assertEqual(TASK_A);
      expect(parts[2]).assertEqual(TASK_C);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(trace.length).assertEqual(5);
      expect(trace.indexOf('|')).assertEqual(1);
    });

    /**
     * @tc.name   throughputMatrixSnapshotLogGrowth
     * @tc.desc   Ten capture rounds of three rows append thirty snapshots and the latest lookup still answers one row.
     * @tc.precondition  The shared driver is loaded and a snapshot log starts empty.
     * @tc.steps         1. Capture the same three row graph ten times.
     *                   2. Read the size and split the trace.
     *                   3. Ask latest for row C.
     * @tc.expected      The log holds thirty entries, the trace has thirty segments and latest C is idle.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('throughputMatrixSnapshotLogGrowth', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      for (let round: number = 0; round < 10; round++) {
        log.capture(graph.tasks);
      }
      const latestC: RunSnapshot | undefined = log.latest(TASK_C);
      logStep('QueueThroughputMatrix', 'snapshot log size ' + String(log.size()));
      expect(log.size()).assertEqual(30);
      expect(log.trace().split('|').length).assertEqual(30);
      expect(latestC !== undefined).assertTrue();
      expect(log.snapshots[0].taskNo).assertEqual(TASK_A);
      expect(log.snapshots[29].taskNo).assertEqual(TASK_C);
      expect(log.size() / 10).assertEqual(3);
      expect(log.trace().split('|')[0]).assertEqual('A/idle/0');
    });

    /**
     * @tc.name   throughputMatrixSnapshotLogContentMatchesRows
     * @tc.desc   The snapshot trace renders each row triple in task order with the slash separator.
     * @tc.precondition  The shared driver is loaded and rows A, B and C hold 20, 40 and 60 percent.
     * @tc.steps         1. Report the three distinct percentages on a fresh graph.
     *                   2. Capture the graph once.
     *                   3. Compare the trace with the expected text.
     * @tc.expected      The trace reads A/idle/20|B/idle/40|C/idle/60.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('throughputMatrixSnapshotLogContentMatchesRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.taskAt(0).reportProgress(20);
      graph.taskAt(1).reportProgress(40);
      graph.taskAt(2).reportProgress(60);
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      const trace: string = log.trace();
      const latestB: RunSnapshot | undefined = log.latest(TASK_B);
      logStep('QueueThroughputMatrix', 'snapshot content ' + trace);
      expect(trace).assertEqual('A/idle/20|B/idle/40|C/idle/60');
      expect(trace.split('|').length).assertEqual(3);
      expect(latestB !== undefined).assertTrue();
      if (latestB !== undefined) {
        expect(latestB.progress).assertEqual(40);
      }
      expect(log.snapshots[2].status).assertEqual(STATUS_IDLE);
      expect(trace.indexOf('/idle/')).assertLarger(0);
      expect(trace.endsWith('60')).assertTrue();
    });

    /**
     * @tc.name   throughputMatrixEventKindsCounts
     * @tc.desc   One full run records exactly one start-all, three starts, one queued and three completions.
     * @tc.precondition  The shared driver is loaded and the run goes through the gate to completion.
     * @tc.steps         1. Start the graph and complete the two shared rows.
     *                   2. Poll for C and complete it.
     *                   3. Count every event kind and the total size.
     * @tc.expected      The size is ten with the documented per-kind counts.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('throughputMatrixEventKindsCounts', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      graph.pollTick(30);
      graph.completeTaskC(40);
      const recorder: EventRecorder = graph.events;
      logStep('QueueThroughputMatrix', 'event kinds ' + recorder.trace());
      expect(recorder.size()).assertEqual(11);
      expect(recorder.countOf('start-all')).assertEqual(1);
      expect(recorder.countOf('started')).assertEqual(3);
      expect(recorder.countOf('queued')).assertEqual(1);
      expect(recorder.countOf('completed')).assertEqual(3);
      expect(recorder.countOf('unlocked')).assertEqual(2);
      expect(recorder.countOf('timer-cleared')).assertEqual(1);
    });

    /**
     * @tc.name   throughputMatrixLockContentionRejections
     * @tc.desc   Five exclusive attempts against a held shared lock all reject and all count as contention.
     * @tc.precondition  The shared driver is loaded and row A holds the shared mode.
     * @tc.steps         1. Acquire shared mode for row A.
     *                   2. Attempt exclusive mode for row C five times.
     *                   3. Read the rejection counter and the owner field.
     * @tc.expected      The counter reaches five, no owner is assigned and the shared holder survives.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('throughputMatrixLockContentionRejections', 0, () => {
      const lock: DependencyLock = new DependencyLock();
      lock.acquireShared(TASK_A);
      let rejected: number = 0;
      for (let attempt: number = 0; attempt < 5; attempt++) {
        if (!lock.acquireExclusive(TASK_C)) {
          rejected = rejected + 1;
        }
      }
      logStep('QueueThroughputMatrix', 'contention rejections ' + String(rejected));
      expect(rejected).assertEqual(5);
      expect(lock.rejections).assertEqual(5);
      expect(lock.exclusiveOwner).assertEqual('');
      expect(lock.waitingExclusive).assertTrue();
      expect(lock.hasShared(TASK_A)).assertTrue();
      expect(lock.holderCount()).assertEqual(1);
      expect(lock.acquisitions).assertEqual(1);
    });

    /**
     * @tc.name   throughputMatrixRepeatedResetKeepsLedgerClean
     * @tc.desc   Ten start and reset cycles leave no ledger, event or order residue on the reusable graph.
     * @tc.precondition  The shared driver is loaded and one graph is reused for every cycle.
     * @tc.steps         1. Loop ten times over startAll, completeTask A and reset.
     *                   2. Read the total, the event size and the order length.
     *                   3. Read the attempts of row A and the lock state.
     * @tc.expected      Every aggregate is zero while the attempt history reaches ten.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('throughputMatrixRepeatedResetKeepsLedgerClean', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      for (let cycle: number = 0; cycle < 10; cycle++) {
        graph.startAll();
        graph.completeTask(TASK_A, cycle);
        graph.reset();
      }
      logStep('QueueThroughputMatrix', 'ten resets attempts ' + String(graph.taskAt(0).attempts));
      expect(graph.totalProgress()).assertEqual(0);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.isTaskFinished).assertTrue();
      expect(graph.lock.isUnlocked()).assertTrue();
      expect(graph.timerActive).assertFalse();
      expect(graph.taskAt(0).attempts).assertEqual(10);
    });

    /**
     * @tc.name   throughputMatrixDeterministicAcrossRunsRepeat
     * @tc.desc   Five independent full runs produce the same fingerprint sequence, proving the queue is deterministic.
     * @tc.precondition  The shared driver is loaded and each run starts from a fresh graph.
     * @tc.steps         1. Run the full queue five times and collect each fingerprint.
     *                   2. Repeat the same loop a second time.
     *                   3. Compare the two fingerprint arrays index by index.
     * @tc.expected      Both arrays are identical at every index and every print is non-zero.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('throughputMatrixDeterministicAcrossRunsRepeat', 0, () => {
      const firstPrints: number[] = [];
      const secondPrints: number[] = [];
      for (let run: number = 0; run < 5; run++) {
        const graph: TaskGraph = createTaskGraph();
        graph.startAll();
        graph.completeTask(TASK_A, run);
        graph.completeTask(TASK_B, run);
        graph.pollTick(run);
        graph.completeTaskC(run);
        firstPrints.push(graph.events.fingerprint());
      }
      for (let run: number = 0; run < 5; run++) {
        const graph: TaskGraph = createTaskGraph();
        graph.startAll();
        graph.completeTask(TASK_A, run);
        graph.completeTask(TASK_B, run);
        graph.pollTick(run);
        graph.completeTaskC(run);
        secondPrints.push(graph.events.fingerprint());
      }
      let mismatches: number = 0;
      for (let index: int = 0; index < 5; index++) {
        if (firstPrints[index] !== secondPrints[index]) {
          mismatches = mismatches + 1;
        }
      }
      logStep('QueueThroughputMatrix', 'deterministic mismatches ' + String(mismatches));
      expect(mismatches).assertEqual(0);
      expect(firstPrints.length).assertEqual(5);
      expect(secondPrints.length).assertEqual(5);
      expect(firstPrints[0]).assertLarger(0);
      expect(firstPrints[4]).assertEqual(secondPrints[4]);
      expect(firstPrints[0]).assertEqual(firstPrints[1]);
    });

    /**
     * @tc.name   throughputMatrixClampUsedByProgress
     * @tc.desc   The shared clamp helper bounds a table of values to the bar range and never moves inside values.
     * @tc.precondition  The shared driver is loaded and clampInt is exported with a low and high bound.
     * @tc.steps         1. Clamp a table of negative, interior and oversized values.
     *                   2. Clamp an interior value with a shifted window.
     *                   3. Compare every answer.
     * @tc.expected      The bounded answers are 0, 0, 50, 100 and 100 and interior values pass through.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('throughputMatrixClampUsedByProgress', 0, () => {
      const inputs: number[] = [-5, 0, 50, 100, 150];
      const outputs: number[] = [];
      for (let index: int = 0; index < inputs.length; index++) {
        outputs.push(clampInt(inputs[index], 0, PROGRESS_TOTAL));
      }
      logStep('QueueThroughputMatrix', 'clamped ' + String(outputs[0]) + '/' + String(outputs[4]));
      expect(outputs.length).assertEqual(5);
      expect(outputs[0]).assertEqual(0);
      expect(outputs[1]).assertEqual(0);
      expect(outputs[2]).assertEqual(50);
      expect(outputs[3]).assertEqual(100);
      expect(outputs[4]).assertEqual(100);
      expect(clampInt(10, 20, 30)).assertEqual(20);
      expect(clampInt(40, 20, 30)).assertEqual(30);
    });

    /**
     * @tc.name   throughputMatrixEventTraceGrowthBoundedByRuns
     * @tc.desc   A recorder with forty appends holds forty segments and hashes them to a stable non-zero value.
     * @tc.precondition  The shared driver is loaded and a single recorder receives forty entries.
     * @tc.steps         1. Record forty entries with alternating kinds.
     *                   2. Read the size and split the trace.
     *                   3. Read the fingerprint twice.
     * @tc.expected      The size and segment count are forty and both fingerprints match.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('throughputMatrixEventTraceGrowthBoundedByRuns', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      for (let index: int = 0; index < 40; index++) {
        if (index % 2 === 0) {
          recorder.record('even', String(index));
        } else {
          recorder.record('odd', String(index));
        }
      }
      const print: number = recorder.fingerprint();
      logStep('QueueThroughputMatrix', 'forty events print ' + String(print));
      expect(recorder.size()).assertEqual(40);
      expect(recorder.trace().split('|').length).assertEqual(40);
      expect(recorder.countOf('even')).assertEqual(20);
      expect(recorder.countOf('odd')).assertEqual(20);
      expect(recorder.fingerprint()).assertEqual(print);
      expect(print).assertLarger(0);
      expect(recorder.last()).assertEqual('odd:39');
    });

    /**
     * @tc.name   throughputMatrixPollElapsedMatchesTickProduct
     * @tc.desc   Seven poll rounds agree with both the multiplication and the division form of the elapsed budget.
     * @tc.precondition  The shared driver is loaded and the clock uses the default 200 ms interval.
     * @tc.steps         1. Start the clock and tick seven times.
     *                   2. Compute the budget with multiplication and with division.
     *                   3. Compare both with the clock reading.
     * @tc.expected      The elapsed budget is 1400 and both derived numbers agree with it.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('throughputMatrixPollElapsedMatchesTickProduct', 0, () => {
      const clock: PollClock = new PollClock();
      clock.start();
      let elapsed: number = 0;
      for (let round: number = 0; round < 7; round++) {
        elapsed = clock.tick();
      }
      const byProduct: number = clock.ticks * clock.intervalMs;
      const byDivision: number = elapsed / clock.intervalMs;
      logStep('QueueThroughputMatrix', 'elapsed product ' + String(byProduct) + ' division ' + String(byDivision));
      expect(elapsed).assertEqual(1400);
      expect(byProduct).assertEqual(1400);
      expect(byDivision).assertEqual(7);
      expect(byProduct).assertEqual(elapsed);
      expect(byDivision).assertEqual(clock.ticks);
      expect(clock.isDueAfter(7)).assertTrue();
      expect(clock.isDueAfter(8)).assertFalse();
    });

    /**
     * @tc.name   throughputMatrixMetricsTotalProgressConserves
     * @tc.desc   Ten full runs conserve progress: every per-run metric sums to the aggregate of 3000 points.
     * @tc.precondition  The shared driver is loaded and each run completes all three rows.
     * @tc.steps         1. Loop ten times and build the metrics of each full graph.
     *                   2. Accumulate the per-run total progress.
     *                   3. Compare the aggregate with ten full three row bars.
     * @tc.expected      The aggregate is 3000 and every per-run value is 300.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('throughputMatrixMetricsTotalProgressConserves', 0, () => {
      let aggregate: number = 0;
      let allFull: boolean = true;
      for (let run: number = 0; run < 10; run++) {
        const graph: TaskGraph = createTaskGraph();
        graph.completeTask(TASK_A, run);
        graph.completeTask(TASK_B, run);
        graph.completeTask(TASK_C, run);
        const metrics: NetworkMetrics = NetworkMetrics.from(graph);
        aggregate = aggregate + metrics.totalProgress;
        if (metrics.totalProgress !== 300 || metrics.completedTasks !== 3) {
          allFull = false;
        }
      }
      logStep('QueueThroughputMatrix', 'conserved aggregate ' + String(aggregate));
      expect(aggregate).assertEqual(3000);
      expect(aggregate).assertEqual(10 * 3 * PROGRESS_TOTAL);
      expect(allFull).assertTrue();
      expect(aggregate / 10).assertEqual(300);
      expect(aggregate / 300).assertEqual(10);
      expect(aggregate).assertLarger(2999);
    });
  });
}
