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

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  EventRecorder,
  TaskGraph,
  createTaskGraph,
  textFingerprint,
  joined,
  completionTrace,
  countOf,
  sameStringArray,
  TASK_A,
  TASK_B,
  TASK_C
} from '../Shared/SharedDriver';

/**
 * Event ordering suite for the callbacks attached in download().
 *
 * Source anchors (entry/src/main/ets/pages/Index.ets):
 *   117-147  create().then(onCompleted, onProgress, start).catch wiring
 *   174-198  startAllTasks ordering: A shared, B shared, C queued, 200 ms poll
 *   79-102   completion handlers and checkAndUnlock
 *
 * The recorder stores "kind:detail" strings, so every case here can assert the
 * exact order of the callbacks the page would observe at runtime.
 */
export default function transferEventsTest(): void {
  describe('TransferEvents', () => {
    beforeAll(() => {
      logSuite('TransferEvents', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('TransferEvents', 'end');
    });

    /**
     * @tc.name   freshRecorderIsEmpty
     * @tc.desc   A new recorder has no entries, an empty last value and an empty trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('freshRecorderIsEmpty', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      expect(recorder.size()).assertEqual(0);
      expect(recorder.entries.length).assertEqual(0);
      expect(recorder.last()).assertEqual('');
      expect(recorder.trace()).assertEqual('');
      expect(recorder.countOf('started')).assertEqual(0);
      expect(recorder.fingerprint()).assertEqual(textFingerprint(''));
      expect(recorder.trace().length).assertEqual(0);
    });

    /**
     * @tc.name   recordAppendsKindAndDetail
     * @tc.desc   One record stores the kind and the detail joined by a single colon.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('recordAppendsKindAndDetail', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('started', TASK_A);
      expect(recorder.size()).assertEqual(1);
      expect(recorder.entries[0]).assertEqual('started:A');
      expect(recorder.last()).assertEqual('started:A');
      expect(recorder.trace()).assertEqual('started:A');
      expect(recorder.entries[0].indexOf(':')).assertEqual(7);
      expect(recorder.entries[0].split(':').length).assertEqual(2);
    });

    /**
     * @tc.name   recordKeepsInsertionOrder
     * @tc.desc   Entries are stored in call order without sorting or de-duplication.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('recordKeepsInsertionOrder', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('zeta', '1');
      recorder.record('alpha', '2');
      recorder.record('mid', '3');
      expect(recorder.entries[0]).assertEqual('zeta:1');
      expect(recorder.entries[1]).assertEqual('alpha:2');
      expect(recorder.entries[2]).assertEqual('mid:3');
      expect(recorder.trace()).assertEqual('zeta:1|alpha:2|mid:3');
      expect(recorder.trace().split('|').length).assertEqual(3);
      expect(recorder.size()).assertEqual(3);
    });

    /**
     * @tc.name   sizeCountsEveryRecord
     * @tc.desc   size() equals the number of record calls, including repeated kinds and details.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('sizeCountsEveryRecord', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      for (let index = 0; index < 7; index++) {
        recorder.record('tick', String(index));
      }
      expect(recorder.size()).assertEqual(7);
      expect(recorder.entries.length).assertEqual(7);
      expect(recorder.last()).assertEqual('tick:6');
      expect(recorder.countOf('tick')).assertEqual(7);
      expect(recorder.trace().split('|').length).assertEqual(7);
      expect(recorder.trace().indexOf('tick:0|tick:1')).assertEqual(0);
    });

    /**
     * @tc.name   countOfCountsMatchingKindOnly
     * @tc.desc   countOf returns the number of entries whose kind matches exactly.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('countOfCountsMatchingKindOnly', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('started', TASK_A);
      recorder.record('started', TASK_B);
      recorder.record('completed', TASK_A);
      recorder.record('queued', TASK_C);
      expect(recorder.countOf('started')).assertEqual(2);
      expect(recorder.countOf('completed')).assertEqual(1);
      expect(recorder.countOf('queued')).assertEqual(1);
      expect(recorder.countOf('failed')).assertEqual(0);
      expect(recorder.size()).assertEqual(4);
      expect(recorder.countOf('started') + recorder.countOf('completed')).assertEqual(3);
    });

    /**
     * @tc.name   countOfIsZeroForAbsentKind
     * @tc.desc   A kind that was never recorded yields zero rather than a partial match.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('countOfIsZeroForAbsentKind', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('start-all', 'begin');
      recorder.record('started', TASK_A);
      expect(recorder.countOf('failed')).assertEqual(0);
      expect(recorder.countOf('started-down')).assertEqual(0);
      expect(recorder.countOf('sta')).assertEqual(0);
      expect(recorder.countOf('STARTED')).assertEqual(0);
      expect(recorder.size()).assertEqual(2);
      expect(recorder.countOf('start-all')).assertEqual(1);
    });

    /**
     * @tc.name   countOfDistinguishesPrefixKinds
     * @tc.desc   A kind that is a text prefix of another kind is counted separately.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('countOfDistinguishesPrefixKinds', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('started', TASK_A);
      recorder.record('start', TASK_B);
      recorder.record('started', TASK_C);
      expect(recorder.countOf('start')).assertEqual(1);
      expect(recorder.countOf('started')).assertEqual(2);
      expect(recorder.countOf('star')).assertEqual(0);
      expect(recorder.countOf('started-extra')).assertEqual(0);
      expect(recorder.size()).assertEqual(3);
      expect(recorder.trace()).assertEqual('started:A|start:B|started:C');
    });

    /**
     * @tc.name   countOfHandlesEmptyKind
     * @tc.desc   Only entries recorded with an empty kind are counted under the empty kind.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('countOfHandlesEmptyKind', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('', 'anonymous');
      recorder.record('started', TASK_A);
      expect(recorder.countOf('')).assertEqual(1);
      expect(recorder.countOf('started')).assertEqual(1);
      expect(recorder.entries[0]).assertEqual(':anonymous');
      expect(recorder.entries[0].startsWith(':')).assertTrue();
      expect(recorder.size()).assertEqual(2);
      expect(recorder.last()).assertEqual('started:A');
    });

    /**
     * @tc.name   lastReturnsMostRecentEntry
     * @tc.desc   last() follows the newest record and never returns an older entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('lastReturnsMostRecentEntry', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('start-all', 'begin');
      expect(recorder.last()).assertEqual('start-all:begin');
      recorder.record('started', TASK_A);
      expect(recorder.last()).assertEqual('started:A');
      recorder.record('completed', TASK_B);
      expect(recorder.last()).assertEqual('completed:B');
      expect(recorder.last()).assertEqual(recorder.entries[recorder.size() - 1]);
      expect(recorder.last() === 'started:A').assertFalse();
    });

    /**
     * @tc.name   lastOfEmptyRecorderIsEmptyString
     * @tc.desc   The empty recorder reports an empty string rather than undefined or a throw.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lastOfEmptyRecorderIsEmptyString', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      expect(recorder.last()).assertEqual('');
      expect(recorder.last().length).assertEqual(0);
      expect(recorder.last() === '').assertTrue();
      recorder.record('started', TASK_A);
      expect(recorder.last()).assertEqual('started:A');
      recorder.clear();
      expect(recorder.last()).assertEqual('');
      expect(recorder.size()).assertEqual(0);
    });

    /**
     * @tc.name   traceJoinsEntriesWithPipe
     * @tc.desc   The trace concatenates every entry with a single pipe between neighbours.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('traceJoinsEntriesWithPipe', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('started', TASK_A);
      recorder.record('started', TASK_B);
      recorder.record('queued', TASK_C);
      expect(recorder.trace()).assertEqual('started:A|started:B|queued:C');
      expect(recorder.trace()).assertEqual(joined(recorder.entries, '|'));
      expect(recorder.trace().split('|').length).assertEqual(3);
      expect(recorder.trace().indexOf('started:A')).assertEqual(0);
      expect(recorder.trace().endsWith('queued:C')).assertTrue();
      expect(countOf(recorder.trace().split('|'), 'queued:C')).assertEqual(1);
    });

    /**
     * @tc.name   singleEntryTraceHasNoSeparator
     * @tc.desc   With one entry the trace is the entry itself, without a trailing or leading pipe.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('singleEntryTraceHasNoSeparator', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('unlocked', TASK_C);
      expect(recorder.trace()).assertEqual('unlocked:C');
      expect(recorder.trace().indexOf('|')).assertEqual(-1);
      expect(recorder.trace().startsWith('|')).assertFalse();
      expect(recorder.trace().endsWith('|')).assertFalse();
      expect(recorder.trace().length).assertEqual(10);
      expect(recorder.trace()).assertEqual(recorder.last());
    });

    /**
     * @tc.name   traceDoesNotEndWithSeparator
     * @tc.desc   A multi-entry trace terminates on the last detail and both ends stay clean.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('traceDoesNotEndWithSeparator', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('start-all', 'begin');
      recorder.record('started', TASK_A);
      recorder.record('started', TASK_B);
      const trace: string = recorder.trace();
      expect(trace.endsWith('|')).assertFalse();
      expect(trace.startsWith('start-all')).assertTrue();
      expect(trace.indexOf('||')).assertEqual(-1);
      expect(countOf(trace.split('|'), 'started:A')).assertEqual(1);
      expect(trace.split('|')[2]).assertEqual('started:B');
      expect(trace.length).assertLarger(20);
    });

    /**
     * @tc.name   fingerprintIsStableForSameSequence
     * @tc.desc   Two recorders fed the same sequence produce the same fingerprint and trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintIsStableForSameSequence', 0, () => {
      const left: EventRecorder = new EventRecorder();
      const right: EventRecorder = new EventRecorder();
      left.record('started', TASK_A);
      left.record('completed', TASK_A);
      right.record('started', TASK_A);
      right.record('completed', TASK_A);
      expect(left.trace()).assertEqual(right.trace());
      expect(left.fingerprint()).assertEqual(right.fingerprint());
      expect(left.fingerprint()).assertEqual(textFingerprint(left.trace()));
      expect(left.size()).assertEqual(right.size());
      expect(left.fingerprint()).assertLarger(0);
      expect(left.fingerprint()).assertLess(1000003);
    });

    /**
     * @tc.name   fingerprintIsSensitiveToOrder
     * @tc.desc   Swapping two entries leaves the same members but changes the fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintIsSensitiveToOrder', 0, () => {
      const left: EventRecorder = new EventRecorder();
      const right: EventRecorder = new EventRecorder();
      left.record('started', TASK_A);
      left.record('started', TASK_B);
      right.record('started', TASK_B);
      right.record('started', TASK_A);
      expect(left.size()).assertEqual(right.size());
      expect(left.countOf('started')).assertEqual(right.countOf('started'));
      expect(left.trace() === right.trace()).assertFalse();
      expect(left.fingerprint() === right.fingerprint()).assertFalse();
      expect(left.trace().split('|')[0]).assertEqual('started:A');
      expect(right.trace().split('|')[0]).assertEqual('started:B');
    });

    /**
     * @tc.name   fingerprintIsSensitiveToDetail
     * @tc.desc   A different detail under the same kind changes both the trace and the fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintIsSensitiveToDetail', 0, () => {
      const left: EventRecorder = new EventRecorder();
      const right: EventRecorder = new EventRecorder();
      left.record('completed', TASK_A);
      right.record('completed', TASK_C);
      expect(left.size()).assertEqual(1);
      expect(right.size()).assertEqual(1);
      expect(left.countOf('completed')).assertEqual(right.countOf('completed'));
      expect(left.trace() === right.trace()).assertFalse();
      expect(left.fingerprint() === right.fingerprint()).assertFalse();
      expect(left.last()).assertEqual('completed:A');
      expect(right.last()).assertEqual('completed:C');
    });

    /**
     * @tc.name   fingerprintOfEmptyTraceMatchesHelper
     * @tc.desc   The empty recorder fingerprints the empty string through the shared hash.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fingerprintOfEmptyTraceMatchesHelper', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      expect(recorder.fingerprint()).assertEqual(textFingerprint(''));
      expect(recorder.trace()).assertEqual('');
      expect(recorder.fingerprint()).assertEqual(216613);
      expect(recorder.fingerprint()).assertLarger(0);
      recorder.record('tick', '0');
      expect(recorder.fingerprint() === 216613).assertFalse();
      expect(recorder.fingerprint()).assertEqual(textFingerprint('tick:0'));
      expect(recorder.fingerprint()).assertLess(1000003);
    });

    /**
     * @tc.name   fingerprintOfSingleEntryMatchesTextHash
     * @tc.desc   A one-entry recorder fingerprints exactly its trace text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fingerprintOfSingleEntryMatchesTextHash', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('queued', TASK_C);
      expect(recorder.trace()).assertEqual('queued:C');
      expect(recorder.fingerprint()).assertEqual(textFingerprint('queued:C'));
      expect(recorder.fingerprint()).assertEqual(textFingerprint(recorder.last()));
      expect(recorder.fingerprint() === textFingerprint('queued:A')).assertFalse();
      expect(recorder.fingerprint() >= 0).assertTrue();
      expect(recorder.fingerprint()).assertLess(1000003);
    });

    /**
     * @tc.name   clearResetsAllViews
     * @tc.desc   clear() empties entries, size, last, trace and restores the empty fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('clearResetsAllViews', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('started', TASK_A);
      recorder.record('completed', TASK_A);
      expect(recorder.size()).assertEqual(2);
      recorder.clear();
      expect(recorder.size()).assertEqual(0);
      expect(recorder.entries.length).assertEqual(0);
      expect(recorder.last()).assertEqual('');
      expect(recorder.trace()).assertEqual('');
      expect(recorder.countOf('started')).assertEqual(0);
      expect(recorder.fingerprint()).assertEqual(textFingerprint(''));
    });

    /**
     * @tc.name   recorderIsReusableAfterClear
     * @tc.desc   After a clear the recorder starts a fresh sequence that is indistinguishable from new.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recorderIsReusableAfterClear', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('started', TASK_A);
      recorder.clear();
      recorder.record('queued', TASK_C);
      expect(recorder.size()).assertEqual(1);
      expect(recorder.entries[0]).assertEqual('queued:C');
      expect(recorder.last()).assertEqual('queued:C');
      expect(recorder.trace()).assertEqual('queued:C');
      expect(recorder.countOf('started')).assertEqual(0);
      expect(recorder.countOf('queued')).assertEqual(1);
      expect(recorder.fingerprint()).assertEqual(textFingerprint('queued:C'));
    });

    /**
     * @tc.name   clearDoesNotAffectOtherRecorder
     * @tc.desc   The recorder owns its entries, so clearing one instance leaves another untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clearDoesNotAffectOtherRecorder', 0, () => {
      const left: EventRecorder = new EventRecorder();
      const right: EventRecorder = new EventRecorder();
      left.record('started', TASK_A);
      right.record('started', TASK_A);
      right.record('completed', TASK_A);
      left.clear();
      expect(left.size()).assertEqual(0);
      expect(right.size()).assertEqual(2);
      expect(right.trace()).assertEqual('started:A|completed:A');
      expect(right.countOf('started')).assertEqual(1);
      expect(left.trace() === right.trace()).assertFalse();
      expect(left.fingerprint() === right.fingerprint()).assertFalse();
    });

    /**
     * @tc.name   startAllRecordsBeginThenStartedPair
     * @tc.desc   Starting every task records the begin marker, both shared starts and the queued C task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('startAllRecordsBeginThenStartedPair', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.startAll()).assertTrue();
      expect(graph.events.size()).assertEqual(4);
      expect(graph.events.entries[0]).assertEqual('start-all:begin');
      expect(graph.events.entries[1]).assertEqual('started:A');
      expect(graph.events.entries[2]).assertEqual('started:B');
      expect(graph.events.entries[3]).assertEqual('queued:C');
      expect(graph.eventTrace()).assertEqual('start-all:begin|started:A|started:B|queued:C');
      expect(graph.events.countOf('started')).assertEqual(2);
    });

    /**
     * @tc.name   secondStartAllIsRejectedAndRecorded
     * @tc.desc   While the previous run is unfinished a second startAll records a rejection and returns false.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('secondStartAllIsRejectedAndRecorded', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.startAll()).assertFalse();
      expect(graph.events.size()).assertEqual(5);
      expect(graph.events.last()).assertEqual('start-rejected:0');
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.isTaskFinished).assertFalse();
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   startRejectionRecordsCurrentPollTicks
     * @tc.desc   The rejection detail carries the poll tick counter at the moment of the rejected call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startRejectionRecordsCurrentPollTicks', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.pollTick();
      graph.pollTick();
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.startAll()).assertFalse();
      expect(graph.events.last()).assertEqual('start-rejected:2');
      expect(graph.events.last().endsWith(':2')).assertTrue();
      expect(graph.events.countOf('start-rejected')).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(2);
    });

    /**
     * @tc.name   completionsFollowCallOrder
     * @tc.desc   Completion events appear in the same order the completion calls were made.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completionsFollowCallOrder', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_A);
      expect(graph.events.entries[4]).assertEqual('completed:B');
      expect(graph.events.entries[5]).assertEqual('completed:A');
      expect(graph.completionOrder[0]).assertEqual(TASK_B);
      expect(graph.completionOrder[1]).assertEqual(TASK_A);
      expect(graph.events.countOf('completed')).assertEqual(2);
      expect(graph.events.trace().indexOf('completed:B')).assertLess(graph.events.trace().indexOf('completed:A'));
    });

    /**
     * @tc.name   unlockedEventOnlyAfterSecondDependency
     * @tc.desc   The unlock marker is recorded only when the second of A and B finishes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('unlockedEventOnlyAfterSecondDependency', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.events.last()).assertEqual('completed:A');
      graph.completeTask(TASK_B);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.events.last()).assertEqual('unlocked:C');
      expect(graph.canRunTaskC()).assertTrue();
      expect(graph.events.countOf('completed')).assertEqual(2);
      expect(graph.events.size()).assertEqual(7);
    });

    /**
     * @tc.name   completingTaskCBeforeGateRecordsNoUnlock
     * @tc.desc   Completing C while A and B are still pending records only the completion event.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completingTaskCBeforeGateRecordsNoUnlock', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.completeTask(TASK_C)).assertTrue();
      expect(graph.events.last()).assertEqual('completed:C');
      expect(graph.events.countOf('unlocked')).assertEqual(0);
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.canRunTaskC()).assertFalse();
      expect(graph.events.size()).assertEqual(5);
      expect(graph.completionOrder[0]).assertEqual(TASK_C);
    });

    /**
     * @tc.name   pollBeforeGateRecordsNothing
     * @tc.desc   A poll that fires before A and B finish starts nothing and logs no start event.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollBeforeGateRecordsNothing', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.pollTick()).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.events.countOf('timer-cleared')).assertEqual(0);
      expect(graph.events.size()).assertEqual(4);
      expect(graph.events.last()).assertEqual('queued:C');
      expect(graph.timerActive).assertTrue();
    });

    /**
     * @tc.name   pollAfterGateStartsCAndClearsTimer
     * @tc.desc   The first poll after the gate opens starts C, logs the start and clears the timer.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('pollAfterGateStartsCAndClearsTimer', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      const before: int = graph.events.size();
      expect(graph.pollTick()).assertTrue();
      expect(graph.events.size()).assertEqual(before + 2);
      expect(graph.events.entries[before]).assertEqual('started:C');
      expect(graph.events.last()).assertEqual('timer-cleared:C');
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.timerActive).assertFalse();
      expect(graph.taskAt(2).isRunning()).assertTrue();
    });

    /**
     * @tc.name   duplicateCompletionAddsNoEvent
     * @tc.desc   A second completion of the same task returns false and appends no event.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('duplicateCompletionAddsNoEvent', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      expect(graph.completeTask(TASK_A)).assertTrue();
      const size: number = graph.events.size();
      expect(graph.completeTask(TASK_A)).assertFalse();
      expect(graph.events.size()).assertEqual(size);
      expect(graph.events.countOf('completed')).assertEqual(1);
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.events.last()).assertEqual('completed:A');
      expect(graph.taskAt(0).progress).assertEqual(100);
    });

    /**
     * @tc.name   duplicateCompletionLeavesTraceUnchanged
     * @tc.desc   The trace and its fingerprint after a rejected duplicate are byte identical.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateCompletionLeavesTraceUnchanged', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_B);
      const trace: string = graph.eventTrace();
      const fingerprint: number = graph.events.fingerprint();
      expect(graph.completeTask(TASK_B)).assertFalse();
      expect(graph.eventTrace()).assertEqual(trace);
      expect(graph.events.fingerprint()).assertEqual(fingerprint);
      expect(graph.events.size()).assertEqual(5);
      expect(graph.completionOrder.length).assertEqual(1);
      expect(graph.events.countOf('completed')).assertEqual(1);
    });

    /**
     * @tc.name   repeatedStartedKindsAreCounted
     * @tc.desc   Repeating one kind with distinct details increases both size and its count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('repeatedStartedKindsAreCounted', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('started', TASK_A);
      recorder.record('started', TASK_B);
      recorder.record('started', TASK_C);
      expect(recorder.countOf('started')).assertEqual(3);
      expect(recorder.size()).assertEqual(3);
      expect(recorder.trace()).assertEqual('started:A|started:B|started:C');
      expect(recorder.trace().split('|').length).assertEqual(3);
      expect(recorder.last()).assertEqual('started:C');
      expect(countOf(recorder.entries, 'started:B')).assertEqual(1);
    });

    /**
     * @tc.name   sameDetailDifferentKindsAreSeparate
     * @tc.desc   The same detail recorded under two kinds yields two independent events.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sameDetailDifferentKindsAreSeparate', 0, () => {
      const recorder: EventRecorder = new EventRecorder();
      recorder.record('started', TASK_C);
      recorder.record('completed', TASK_C);
      expect(recorder.size()).assertEqual(2);
      expect(recorder.countOf('started')).assertEqual(1);
      expect(recorder.countOf('completed')).assertEqual(1);
      expect(recorder.countOf(TASK_C)).assertEqual(0);
      expect(recorder.trace()).assertEqual('started:C|completed:C');
      expect(recorder.entries[0] === recorder.entries[1]).assertFalse();
      expect(recorder.last()).assertEqual('completed:C');
    });

    /**
     * @tc.name   differentCompletionOrdersProduceDifferentTraces
     * @tc.desc   Two graphs that finish A then B versus B then A record different traces.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('differentCompletionOrdersProduceDifferentTraces', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.startAll();
      second.startAll();
      first.completeTask(TASK_A);
      first.completeTask(TASK_B);
      second.completeTask(TASK_B);
      second.completeTask(TASK_A);
      expect(first.eventTrace() === second.eventTrace()).assertFalse();
      expect(first.events.fingerprint() === second.events.fingerprint()).assertFalse();
      expect(first.events.size()).assertEqual(second.events.size());
      expect(first.events.countOf('completed')).assertEqual(2);
      expect(second.events.countOf('completed')).assertEqual(2);
      expect(first.eventTrace().indexOf('completed:A')).assertLess(first.eventTrace().indexOf('completed:B'));
      expect(second.eventTrace().indexOf('completed:B')).assertLess(second.eventTrace().indexOf('completed:A'));
    });

    /**
     * @tc.name   resetClearsGraphEvents
     * @tc.desc   Resetting the graph empties the recorder together with the task and timer state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetClearsGraphEvents', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      expect(graph.events.size()).assertLarger(0);
      graph.reset();
      expect(graph.events.size()).assertEqual(0);
      expect(graph.eventTrace()).assertEqual('');
      expect(graph.pollTicks).assertEqual(0);
      expect(graph.timerActive).assertFalse();
      expect(graph.completionOrder.length).assertEqual(0);
      expect(graph.taskAt(0).progress).assertEqual(0);
    });

    /**
     * @tc.name   fullRunProducesElevenEvents
     * @tc.desc   The complete A/B/C run records eleven events with the expected kind distribution.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fullRunProducesElevenEvents', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick();
      graph.completeTaskC();
      expect(graph.events.size()).assertEqual(11);
      expect(graph.events.countOf('started')).assertEqual(3);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(graph.events.countOf('unlocked')).assertEqual(2);
      expect(graph.events.countOf('queued')).assertEqual(1);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.events.countOf('start-all')).assertEqual(1);
      expect(graph.events.trace().split('|').length).assertEqual(11);
    });

    /**
     * @tc.name   fullRunFingerprintMatchesTrace
     * @tc.desc   After a full run the fingerprint still equals the hash of the recorded trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fullRunFingerprintMatchesTrace', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick();
      graph.completeTaskC();
      expect(graph.events.fingerprint()).assertEqual(textFingerprint(graph.eventTrace()));
      expect(graph.eventTrace().endsWith('unlocked:C')).assertTrue();
      expect(graph.eventTrace().startsWith('start-all:begin')).assertTrue();
      expect(graph.events.last()).assertEqual('unlocked:C');
      expect(graph.events.fingerprint()).assertLarger(0);
      expect(graph.eventTrace().indexOf('timer-cleared:C')).assertLarger(0);
    });

    /**
     * @tc.name   fullRunFingerprintStableAcrossGraphs
     * @tc.desc   Two identical full runs produce the same trace and the same fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fullRunFingerprintStableAcrossGraphs', 0, () => {
      const first: TaskGraph = createTaskGraph();
      const second: TaskGraph = createTaskGraph();
      first.startAll();
      first.completeTask(TASK_A);
      first.completeTask(TASK_B);
      first.pollTick();
      first.completeTaskC();
      second.startAll();
      second.completeTask(TASK_A);
      second.completeTask(TASK_B);
      second.pollTick();
      second.completeTaskC();
      expect(first.eventTrace()).assertEqual(second.eventTrace());
      expect(first.events.fingerprint()).assertEqual(second.events.fingerprint());
      expect(first.events.size()).assertEqual(second.events.size());
      expect(first.completionOrder.length).assertEqual(3);
      expect(second.completionOrder.length).assertEqual(3);
      logStep('transferEvents', 'identical full runs share a fingerprint');
    });

    /**
     * @tc.name   pollWithoutTimerOnlyAdvancesCounter
     * @tc.desc   Polling a timer that was never started increments the counter and records nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pollWithoutTimerOnlyAdvancesCounter', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      expect(graph.timerActive).assertFalse();
      expect(graph.pollTick()).assertFalse();
      expect(graph.pollTicks).assertEqual(1);
      expect(graph.events.size()).assertEqual(0);
      expect(graph.pollTick()).assertFalse();
      expect(graph.pollTicks).assertEqual(2);
      expect(graph.eventTrace()).assertEqual('');
      expect(graph.runningCount()).assertEqual(0);
    });

    /**
     * @tc.name   unlockMarkerPrecedesCStart
     * @tc.desc   The unlock event is recorded before C starts, and the timer clear closes the sequence.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unlockMarkerPrecedesCStart', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.pollTick();
      const trace: string = graph.eventTrace();
      const unlockAt: number = trace.indexOf('unlocked:C');
      const startAt: number = trace.indexOf('started:C');
      const clearAt: number = trace.indexOf('timer-cleared:C');
      expect(unlockAt).assertLarger(0);
      expect(startAt).assertLarger(unlockAt);
      expect(clearAt).assertLarger(startAt);
      expect(graph.events.countOf('unlocked')).assertEqual(1);
      expect(graph.events.countOf('timer-cleared')).assertEqual(1);
      expect(graph.taskAt(2).isRunning()).assertTrue();
      expect(graph.taskAt(2).attempts).assertEqual(1);
    });

    /**
     * @tc.name   startPrefixIsStableAfterReset
     * @tc.desc   After a reset, startAll reproduces exactly the same four event prefix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('startPrefixIsStableAfterReset', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      const prefix: string[] = graph.events.entries.slice();
      graph.reset();
      expect(graph.startAll()).assertTrue();
      expect(sameStringArray(graph.events.entries, prefix)).assertTrue();
      expect(prefix.length).assertEqual(4);
      expect(graph.events.entries[3]).assertEqual('queued:C');
      expect(graph.events.countOf('started')).assertEqual(2);
      expect(graph.events.fingerprint()).assertEqual(textFingerprint('start-all:begin|started:A|started:B|queued:C'));
    });

    /**
     * @tc.name   completionTraceAgreesWithCompletedEvents
     * @tc.desc   The completion order and the count of completion events describe the same sequence.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TransferEvents scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completionTraceAgreesWithCompletedEvents', 0, () => {
      const graph: TaskGraph = createTaskGraph();
      graph.startAll();
      graph.completeTask(TASK_A);
      graph.completeTask(TASK_B);
      graph.completeTask(TASK_C);
      expect(graph.completionOrder.length).assertEqual(3);
      expect(graph.events.countOf('completed')).assertEqual(3);
      expect(joined(graph.completionOrder, '|')).assertEqual(completionTrace(graph));
      expect(graph.events.trace().split('completed:').length).assertEqual(4);
      expect(graph.events.countOf('completed')).assertEqual(graph.completionOrder.length);
      expect(completionTrace(graph)).assertEqual('A|B|C');
      expect(graph.events.trace().indexOf('completed:C')).assertLarger(0);
    });

  });
}
