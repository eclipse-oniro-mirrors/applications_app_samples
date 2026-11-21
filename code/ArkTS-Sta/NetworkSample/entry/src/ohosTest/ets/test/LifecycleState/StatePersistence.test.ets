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
 * StatePersistence suite.
 *
 * Proves that captured state stays truthful after the live rows move on: a
 * snapshot keeps the values of the moment, the snapshot log keeps insertion
 * order, the event trace is append only and fingerprints are stable for equal
 * history and different for changed history.
 *
 * Production anchors (entry/src/main/ets/pages/Index.ets):
 *   57-60    the four @State members are the persisted view of one run
 *   68-76    updateProgress overwrites a member rather than accumulating
 *   119-132  callbacks may arrive long after the UI last rendered
 *   174-198  a run rebuilds its bookkeeping from scratch on every press
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  TASK_A,
  TASK_B,
  TASK_C,
  PROGRESS_TOTAL,
  STATUS_IDLE,
  STATUS_RUNNING,
  STATUS_COMPLETED,
  ERROR_NETWORK,
  DownloadTask,
  RunSnapshot,
  SnapshotLog,
  TaskGraph,
  EventRecorder,
  createTaskGraph,
  textFingerprint
} from '../Shared/SharedDriver';

export default function statePersistenceTest(): void {
  describe('StatePersistence', () => {
    beforeAll(() => {
      logSuite('StatePersistence', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('StatePersistence', 'end');
    });

    /**
     * @tc.name   captureRetainsValuesAcrossLaterOperations
     * @tc.desc   A snapshot taken before a completion keeps its status and progress after the row finishes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('captureRetainsValuesAcrossLaterOperations', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      log.capture(graph.tasks);
      graph.completeTask(TASK_A, 10);
      graph.completeTask(TASK_B, 20);
      const stored: RunSnapshot | undefined = log.latest(TASK_A);
      expect(stored !== undefined).assertTrue();
      if (stored !== undefined) {
        expect(stored.status).assertEqual(STATUS_RUNNING);
        expect(stored.progress).assertEqual(0);
      }
      expect(graph.taskAt(0).status).assertEqual(STATUS_COMPLETED);
    });

    /**
     * @tc.name   captureRetainsStatusWhenRowFailsLater
     * @tc.desc   A row that fails after a capture does not rewrite the stored running entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('captureRetainsStatusWhenRowFailsLater', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.taskAt(1).reportProgress(44);
      log.capture(graph.tasks);
      graph.taskAt(1).fail(ERROR_NETWORK);
      const stored: RunSnapshot | undefined = log.latest(TASK_B);
      expect(stored !== undefined).assertTrue();
      if (stored !== undefined) {
        expect(stored.status).assertEqual(STATUS_RUNNING);
        expect(stored.progress).assertEqual(44);
      }
      expect(graph.taskAt(1).progressRatio()).assertEqual(0.44);
    });

    /**
     * @tc.name   captureRetainsProgressWhenRowCompletesLater
     * @tc.desc   Intermediate progress stored in a capture is not rounded up by the later completion.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('captureRetainsProgressWhenRowCompletesLater', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick();
      graph.taskAt(2).reportProgress(35);
      log.capture(graph.tasks);
      graph.taskAt(2).complete(70);
      const stored: RunSnapshot | undefined = log.latest(TASK_C);
      expect(stored !== undefined).assertTrue();
      if (stored !== undefined) {
        expect(stored.progress).assertEqual(35);
        expect(stored.status).assertEqual(STATUS_RUNNING);
      }
      expect(graph.taskAt(2).progress).assertEqual(PROGRESS_TOTAL);
      expect(log.trace().indexOf('C/running/35')).assertLarger(0);
    });

    /**
     * @tc.name   snapshotCopiesDoNotShareReferenceState
     * @tc.desc   Two snapshots of the same row hold independent values when the live row advances between them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotCopiesDoNotShareReferenceState', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const a: DownloadTask = graph.taskAt(0);
      const early: RunSnapshot = a.snapshot();
      a.reportProgress(80);
      const late: RunSnapshot = a.snapshot();
      expect(early.sameAs(late)).assertFalse();
      expect(early.progress).assertEqual(0);
      expect(late.progress).assertEqual(80);
      expect(early.taskNo).assertEqual(late.taskNo);
      expect(early.status).assertEqual(late.status);
    });

    /**
     * @tc.name   snapshotLogPreservesInsertionOrder
     * @tc.desc   The stored array keeps the exact order in which captures were made.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotLogPreservesInsertionOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      graph.startAll();
      log.capture(graph.tasks);
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(9);
      expect(log.snapshots[0].status).assertEqual(STATUS_IDLE);
      expect(log.snapshots[3].status).assertEqual(STATUS_RUNNING);
      expect(log.snapshots[6].status).assertEqual(STATUS_COMPLETED);
      expect(log.snapshots[6].progress).assertEqual(100);
    });

    /**
     * @tc.name   latestScansBackwardsToTheNewestEntry
     * @tc.desc   When the same task appears several times latest returns the final stored entry, not the first.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('latestScansBackwardsToTheNewestEntry', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      graph.startAll();
      graph.completeTask(TASK_C, 5);
      log.capture(graph.tasks);
      const newest: RunSnapshot | undefined = log.latest(TASK_C);
      expect(newest !== undefined).assertTrue();
      if (newest !== undefined) {
        expect(newest.status).assertEqual(STATUS_COMPLETED);
        expect(newest.progress).assertEqual(PROGRESS_TOTAL);
      }
      expect(log.snapshots[2].status).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   latestReturnsTheStoredEntryObject
     * @tc.desc   latest does not build a copy; it hands back the same entry that was inserted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('latestReturnsTheStoredEntryObject', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      const stored: RunSnapshot | undefined = log.latest(TASK_A);
      expect(stored !== undefined).assertTrue();
      expect(stored === log.snapshots[0]).assertTrue();
      expect(log.snapshots.length).assertEqual(3);
      if (stored !== undefined) {
        expect(stored.taskNo).assertEqual(TASK_A);
      }
    });

    /**
     * @tc.name   traceIsStableAcrossRepeatedReads
     * @tc.desc   Reading the trace twice without any mutation yields identical strings.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('traceIsStableAcrossRepeatedReads', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      log.capture(graph.tasks);
      const first: string = log.trace();
      const second: string = log.trace();
      expect(first).assertEqual(second);
      expect(first.length > 0).assertTrue();
      expect(log.size()).assertEqual(3);
      expect(textFingerprint(first)).assertEqual(textFingerprint(second));
    });

    /**
     * @tc.name   traceIncludesEveryCaptureRound
     * @tc.desc   A two round trace contains the idle rows first and the advanced rows afterwards.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('traceIncludesEveryCaptureRound', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      graph.startAll();
      log.capture(graph.tasks);
      const trace: string = log.trace();
      expect(trace).assertEqual('A/idle/0|B/idle/0|C/idle/0|A/running/0|B/running/0|C/idle/0');
      expect(trace.split('|').length).assertEqual(6);
      expect(trace.indexOf('A/idle/0')).assertEqual(0);
      expect(trace.endsWith('C/idle/0')).assertTrue();
    });

    /**
     * @tc.name   traceGrowsThreeEntriesPerCapture
     * @tc.desc   Five captures of the three rows produce a trace with fifteen pipe separated entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('traceGrowsThreeEntriesPerCapture', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      for (let round = 0; round < 5; round++) {
        log.capture(graph.tasks);
        expect(log.size()).assertEqual((round + 1) * 3);
      }
      expect(log.trace().split('|').length).assertEqual(15);
      expect(log.snapshots.length).assertEqual(15);
      expect(log.size()).assertEqual(15);
    });

    /**
     * @tc.name   clearDropsEntriesAndKeepsTheLogUsable
     * @tc.desc   After clear the log reports zero entries and still accepts a fresh capture.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('clearDropsEntriesAndKeepsTheLogUsable', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      log.clear();
      expect(log.size()).assertEqual(0);
      expect(log.trace()).assertEqual('');
      graph.startAll();
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(3);
      expect(log.trace().startsWith('A/running/0')).assertTrue();
      expect(log.latest(TASK_B) !== undefined).assertTrue();
    });

    /**
     * @tc.name   clearThenCaptureStartsANewHistory
     * @tc.desc   A capture after clear behaves like the first capture, with no residue from the old rounds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clearThenCaptureStartsANewHistory', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(6);
      log.clear();
      log.capture(graph.tasks);
      expect(log.size()).assertEqual(3);
      expect(log.snapshots[0].status).assertEqual(STATUS_IDLE);
      expect(log.trace().split('|').length).assertEqual(3);
      expect(log.trace().indexOf('running')).assertEqual(-1);
    });

    /**
     * @tc.name   latestAfterClearIsUndefinedUntilRecapture
     * @tc.desc   Between clear and the next capture every lookup returns undefined.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('latestAfterClearIsUndefinedUntilRecapture', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      log.capture(graph.tasks);
      log.clear();
      expect(log.latest(TASK_A) === undefined).assertTrue();
      expect(log.latest(TASK_C) === undefined).assertTrue();
      log.capture(graph.tasks);
      expect(log.latest(TASK_A) === undefined).assertFalse();
      expect(log.size()).assertEqual(3);
    });

    /**
     * @tc.name   eventTraceIsStableAcrossRepeatedReads
     * @tc.desc   The recorder trace does not change when it is read several times in a row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('eventTraceIsStableAcrossRepeatedReads', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      const first: string = graph.eventTrace();
      const second: string = graph.eventTrace();
      expect(first).assertEqual(second);
      expect(first.startsWith('start-all:begin')).assertTrue();
      expect(graph.events.size()).assertEqual(5);
      expect(first.split('|').length).assertEqual(5);
    });

    /**
     * @tc.name   eventTraceGrowsOneEntryPerRecord
     * @tc.desc   Each record call appends exactly one entry and never rewrites the existing prefix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventTraceGrowsOneEntryPerRecord', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('alpha', 'one');
      const first: string = recorder.trace();
      recorder.record('beta', 'two');
      const second: string = recorder.trace();
      expect(second.startsWith(first)).assertTrue();
      expect(second).assertEqual('alpha:one|beta:two');
      expect(recorder.size()).assertEqual(2);
      expect(second.length > first.length).assertTrue();
    });

    /**
     * @tc.name   eventFingerprintIsStableAcrossReads
     * @tc.desc   Reading the fingerprint three times on unchanged history yields one value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('eventFingerprintIsStableAcrossReads', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      const one: number = graph.events.fingerprint();
      const two: number = graph.events.fingerprint();
      const three: number = graph.events.fingerprint();
      expect(one).assertEqual(two);
      expect(two).assertEqual(three);
      expect(one > 0).assertTrue();
      expect(one < 1000003).assertTrue();
    });

    /**
     * @tc.name   eventFingerprintChangesWhenEntryAppended
     * @tc.desc   Appending one more completion changes the fingerprint of the whole trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventFingerprintChangesWhenEntryAppended', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      const before: number = graph.events.fingerprint();
      graph.completeTask(TASK_B, 2);
      const after: number = graph.events.fingerprint();
      expect(before === after).assertFalse();
      expect(after).assertEqual(textFingerprint(graph.eventTrace()));
      expect(graph.events.size()).assertEqual(7);
      expect(graph.events.last()).assertEqual('unlocked:C');
    });

    /**
     * @tc.name   eventFingerprintReturnsToEmptyValueAfterClear
     * @tc.desc   A cleared recorder reports the same fingerprint as a freshly constructed recorder.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventFingerprintReturnsToEmptyValueAfterClear', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('completed', TASK_A);
      recorder.record('unlocked', TASK_C);
      recorder.clear();
      const empty: EventRecorder = new EventRecorder();
      expect(recorder.fingerprint()).assertEqual(empty.fingerprint());
      expect(recorder.trace()).assertEqual(empty.trace());
      expect(recorder.size()).assertEqual(0);
      expect(recorder.last()).assertEqual('');
    });

    /**
     * @tc.name   recorderEntryFormatIsKindColonDetail
     * @tc.desc   A recorded pair is stored as kind followed by a colon and the detail text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('recorderEntryFormatIsKindColonDetail', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('started', TASK_A);
      recorder.record('timer-cleared', TASK_C);
      expect(recorder.entries[0]).assertEqual('started:A');
      expect(recorder.entries[1]).assertEqual('timer-cleared:C');
      expect(recorder.entries[0].indexOf(':')).assertEqual(7);
      expect(recorder.countOf('timer-cleared')).assertEqual(1);
    });

    /**
     * @tc.name   recorderDetailMayContainAColon
     * @tc.desc   A detail string with its own colon is preserved and still counted under its kind.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('recorderDetailMayContainAColon', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('note', 'code:13400003');
      recorder.record('note', 'retry:1');
      expect(recorder.size()).assertEqual(2);
      expect(recorder.entries[0]).assertEqual('note:code:13400003');
      expect(recorder.countOf('note')).assertEqual(2);
      expect(recorder.countOf('code')).assertEqual(0);
      expect(recorder.trace().endsWith('note:retry:1')).assertTrue();
    });

    /**
     * @tc.name   resetPersistsTaskIdentityAndUrls
     * @tc.desc   Clearing run state keeps the stable identity of every row available to the next run.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetPersistsTaskIdentityAndUrls', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const urls: string[] = [graph.taskAt(0).url, graph.taskAt(1).url, graph.taskAt(2).url];
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      graph.reset();
      expect(graph.taskAt(0).taskNo).assertEqual(TASK_A);
      expect(graph.taskAt(1).url).assertEqual(urls[1]);
      expect(graph.taskAt(2).url).assertEqual(urls[2]);
      expect(urls[0].endsWith('.png')).assertTrue();
      expect(graph.tasks.length).assertEqual(3);
    });

    /**
     * @tc.name   snapshotOfResetRowIsIdleAgain
     * @tc.desc   A capture taken after reset stores idle rows even though the log already holds completed ones.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotOfResetRowIsIdleAgain', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      log.capture(graph.tasks);
      graph.reset();
      log.capture(graph.tasks);
      const newest: RunSnapshot | undefined = log.latest(TASK_A);
      expect(newest !== undefined).assertTrue();
      if (newest !== undefined) {
        expect(newest.status).assertEqual(STATUS_IDLE);
        expect(newest.progress).assertEqual(0);
      }
      expect(log.snapshots[0].status).assertEqual(STATUS_COMPLETED);
      expect(log.size()).assertEqual(6);
    });

    /**
     * @tc.name   snapshotLogHoldsThirtyRounds
     * @tc.desc   Thirty captures accumulate ninety entries without dropping any of them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotLogHoldsThirtyRounds', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      for (let round = 0; round < 30; round++) {
        graph.taskAt(0).reportProgress(round + 1);
        log.capture(graph.tasks);
      }
      expect(log.size()).assertEqual(90);
      expect(log.snapshots.length).assertEqual(90);
      expect(log.snapshots[87].progress).assertEqual(30);
      expect(log.trace().split('|').length).assertEqual(90);
    });

    /**
     * @tc.name   captureDoesNotMutateTheLiveRows
     * @tc.desc   Reading state through a capture leaves statuses, progress and the event log untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('captureDoesNotMutateTheLiveRows', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      const eventsBefore: number = graph.events.size();
      log.capture(graph.tasks);
      log.capture(graph.tasks);
      expect(graph.taskAt(0).status).assertEqual(STATUS_COMPLETED);
      expect(graph.taskAt(1).status).assertEqual(STATUS_RUNNING);
      expect(graph.taskAt(2).progress).assertEqual(0);
      expect(graph.events.size()).assertEqual(eventsBefore);
      expect(log.size()).assertEqual(6);
    });

    /**
     * @tc.name   snapshotDescribeIsStableAcrossCalls
     * @tc.desc   describe() of one snapshot returns the same text on every call and matches the stored trace fragment.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('snapshotDescribeIsStableAcrossCalls', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.taskAt(1).reportProgress(60);
      log.capture(graph.tasks);
      const snapshot: RunSnapshot | undefined = log.latest(TASK_B);
      expect(snapshot !== undefined).assertTrue();
      if (snapshot !== undefined) {
        expect(snapshot.describe()).assertEqual('B/running/60');
        expect(snapshot.describe()).assertEqual(snapshot.describe());
      }
      expect(log.trace().indexOf('B/running/60')).assertLarger(0);
      expect(log.size()).assertEqual(3);
    });

    /**
     * @tc.name   twoSnapshotLogsAreIndependent
     * @tc.desc   Captures written to one log never appear in a second log created at the same time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoSnapshotLogsAreIndependent', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const first: SnapshotLog = new SnapshotLog();
      const second: SnapshotLog = new SnapshotLog();
      graph.startAll();
      first.capture(graph.tasks);
      graph.completeTask(TASK_A, 1);
      second.capture(graph.tasks);
      expect(first.size()).assertEqual(3);
      expect(second.size()).assertEqual(3);
      expect(first.snapshots[0].progress).assertEqual(0);
      expect(second.snapshots[0].progress).assertEqual(PROGRESS_TOTAL);
      first.clear();
      expect(first.size()).assertEqual(0);
      expect(second.size()).assertEqual(3);
    });

    /**
     * @tc.name   twoRecordersAreIndependent
     * @tc.desc   Two recorders hold separate histories even when they observe the same graph at different times.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoRecordersAreIndependent', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const seen: EventRecorder = new EventRecorder();
      const other: EventRecorder = new EventRecorder();
      graph.startAll();
      seen.record('start-all', 'begin');
      graph.completeTask(TASK_A, 1);
      seen.record('completed', TASK_A);
      other.record('completed', TASK_B);
      expect(seen.size()).assertEqual(2);
      expect(other.size()).assertEqual(1);
      expect(seen.countOf('completed')).assertEqual(1);
      expect(other.countOf('completed')).assertEqual(1);
      expect(seen.trace() === other.trace()).assertFalse();
    });

    /**
     * @tc.name   textFingerprintIsStableForEqualText
     * @tc.desc   The shared text hash returns one value for equal strings, whatever the caller.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('textFingerprintIsStableForEqualText', 0, () => {
      const text: string = 'A|B|C|unlocked';
      const first: number = textFingerprint(text);
      const second: number = textFingerprint('A|B|C|unlocked');
      expect(first).assertEqual(second);
      expect(first > 0).assertTrue();
      expect(first < 1000003).assertTrue();
      expect(textFingerprint(text + '')).assertEqual(first);
    });

    /**
     * @tc.name   textFingerprintDiffersForDifferentText
     * @tc.desc   A single changed character produces a different fingerprint of the same text length.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('textFingerprintDiffersForDifferentText', 0, () => {
      const left: string = 'completed:A|completed:B';
      const right: string = 'completed:A|completed:C';
      expect(left.length).assertEqual(right.length);
      expect(left === right).assertFalse();
      expect(textFingerprint(left) === textFingerprint(right)).assertFalse();
      expect(textFingerprint(left) > 0).assertTrue();
      expect(textFingerprint(right) > 0).assertTrue();
    });

    /**
     * @tc.name   fingerprintOfEmptyTextIsConstant
     * @tc.desc   An empty history always hashes to the same base value, which matches an empty recorder.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintOfEmptyTextIsConstant', 0, () => {
      const empty: EventRecorder = new EventRecorder();
      const base: number = textFingerprint('');
      expect(empty.fingerprint()).assertEqual(base);
      expect(textFingerprint('')).assertEqual(base);
      empty.record('x', 'y');
      empty.clear();
      expect(empty.fingerprint()).assertEqual(base);
      expect(base).assertEqual(216613);
    });

    /**
     * @tc.name   graphSnapshotTextIsStableBetweenReads
     * @tc.desc   The graph snapshot string is a pure read of the rows and repeats exactly.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('graphSnapshotTextIsStableBetweenReads', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.taskAt(0).reportProgress(12);
      const first: string = graph.snapshotText();
      const second: string = graph.snapshotText();
      expect(first).assertEqual(second);
      expect(first).assertEqual('A:running:12|B:running:0|C:idle:0');
      expect(first.split('|').length).assertEqual(3);
      expect(textFingerprint(first)).assertEqual(textFingerprint(second));
    });

    /**
     * @tc.name   terminalCapturePersistsAfterRun
     * @tc.desc   A capture of the completed run still reports completion after extra polls and rejections.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('terminalCapturePersistsAfterRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      graph.completeTask(TASK_B, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      log.capture(graph.tasks);
      graph.pollTick(5);
      graph.startAll();
      const stored: RunSnapshot | undefined = log.latest(TASK_C);
      expect(stored !== undefined).assertTrue();
      if (stored !== undefined) {
        expect(stored.status).assertEqual(STATUS_COMPLETED);
        expect(stored.progress).assertEqual(PROGRESS_TOTAL);
      }
      expect(log.trace()).assertEqual('A/completed/100|B/completed/100|C/completed/100');
    });

    /**
     * @tc.name   clearingTheLogLeavesTheGraphUntouched
     * @tc.desc   Clearing a snapshot log does not change any live row, the lock or the recorder.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clearingTheLogLeavesTheGraphUntouched', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.completeTask(TASK_A, 1);
      log.capture(graph.tasks);
      log.clear();
      expect(graph.taskAt(0).status).assertEqual(STATUS_COMPLETED);
      expect(graph.taskAt(1).status).assertEqual(STATUS_RUNNING);
      expect(graph.lock.holderCount()).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.isTaskFinished).assertFalse();
    });

    /**
     * @tc.name   latestAcrossManyCapturesReturnsTheFinalRound
     * @tc.desc   Twenty capture rounds end with the last stored values winning every lookup.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('latestAcrossManyCapturesReturnsTheFinalRound', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      for (let round = 0; round < 20; round++) {
        graph.taskAt(0).reportProgress(round * 3);
        log.capture(graph.tasks);
      }
      const stored: RunSnapshot | undefined = log.latest(TASK_A);
      expect(stored !== undefined).assertTrue();
      if (stored !== undefined) {
        expect(stored.progress).assertEqual(57);
        expect(stored.status).assertEqual(STATUS_RUNNING);
      }
      expect(log.size()).assertEqual(60);
      expect(log.snapshots[57].progress).assertEqual(57);
    });

    /**
     * @tc.name   captureDuringFailurePersistsFailedStatus
     * @tc.desc   A capture taken after a failure stores the failed status and the frozen error-time progress.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('captureDuringFailurePersistsFailedStatus', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.taskAt(0).reportProgress(70);
      graph.taskAt(0).fail(ERROR_NETWORK);
      log.capture(graph.tasks);
      graph.reset();
      const stored: RunSnapshot | undefined = log.latest(TASK_A);
      expect(stored !== undefined).assertTrue();
      if (stored !== undefined) {
        expect(stored.status).assertEqual('failed');
        expect(stored.progress).assertEqual(70);
      }
      expect(graph.taskAt(0).status).assertEqual(STATUS_IDLE);
    });

    /**
     * @tc.name   eventTracePrefixIsAppendOnly
     * @tc.desc   The trace after each accepted completion keeps all earlier entries as an unchanged prefix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('eventTracePrefixIsAppendOnly', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const empty: string = graph.eventTrace();
      graph.startAll();
      const started: string = graph.eventTrace();
      graph.completeTask(TASK_A, 1);
      const afterA: string = graph.eventTrace();
      graph.completeTask(TASK_B, 2);
      const afterB: string = graph.eventTrace();
      expect(empty).assertEqual('');
      expect(started.startsWith(empty)).assertTrue();
      expect(afterA.startsWith(started)).assertTrue();
      expect(afterB.startsWith(afterA)).assertTrue();
      expect(afterB.length > afterA.length).assertTrue();
    });

    /**
     * @tc.name   sizeCountsEntriesNotDistinctTasks
     * @tc.desc   Two captures of one single row produce a size of two, because size counts stored entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sizeCountsEntriesNotDistinctTasks', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      const single: DownloadTask[] = [graph.taskAt(0)];
      log.capture(single);
      expect(log.size()).assertEqual(1);
      graph.startAll();
      log.capture(single);
      expect(log.size()).assertEqual(2);
      expect(log.latest(TASK_A) !== undefined).assertTrue();
      expect(log.trace().split('|').length).assertEqual(2);
    });

    /**
     * @tc.name   snapshotSurvivesTaskReset
     * @tc.desc   Stored terminal values remain readable after the live row has been reset to idle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotSurvivesTaskReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const log: SnapshotLog = new SnapshotLog();
      graph.startAll();
      graph.completeTask(TASK_B, 25);
      log.capture(graph.tasks);
      graph.reset();
      const stored: RunSnapshot | undefined = log.latest(TASK_B);
      expect(stored !== undefined).assertTrue();
      if (stored !== undefined) {
        expect(stored.status).assertEqual(STATUS_COMPLETED);
        expect(stored.progress).assertEqual(PROGRESS_TOTAL);
      }
      expect(graph.taskAt(1).status).assertEqual(STATUS_IDLE);
      expect(log.trace().indexOf('B/completed/100')).assertLarger(0);
    });

    /**
     * @tc.name   fingerprintsSeparateEveryPhaseOfTheRun
     * @tc.desc   Hashing the snapshot text at five phases yields five distinct values in a row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('fingerprintsSeparateEveryPhaseOfTheRun', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      const prints: number[] = [];
      prints.push(textFingerprint(graph.snapshotText()));
      graph.startAll();
      prints.push(textFingerprint(graph.snapshotText()));
      graph.completeTask(TASK_A, 1);
      prints.push(textFingerprint(graph.snapshotText()));
      graph.completeTask(TASK_B, 2);
      prints.push(textFingerprint(graph.snapshotText()));
      graph.pollTick(3);
      graph.completeTaskC(4);
      prints.push(textFingerprint(graph.snapshotText()));
      expect(prints.length).assertEqual(5);
      expect(prints[0] === prints[1]).assertFalse();
      expect(prints[1] === prints[2]).assertFalse();
      expect(prints[2] === prints[3]).assertFalse();
      expect(prints[3] === prints[4]).assertFalse();
    });

    /**
     * @tc.name   recorderKeepsOrderAcrossMixedKinds
     * @tc.desc   Mixed event kinds remain in insertion order and countOf still isolates each kind.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StatePersistence scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recorderKeepsOrderAcrossMixedKinds', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B, 1);
      graph.completeTask(TASK_A, 2);
      graph.pollTick(3);
      graph.completeTaskC(4);
      expect(graph.events.entries[4]).assertEqual('completed:B');
      expect(graph.events.entries[5]).assertEqual('completed:A');
      expect(graph.events.entries[6]).assertEqual('unlocked:C');
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.events.countOf('unlocked')).assertEqual(2);
    });
  });
}
