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
 * Interleavings / SubmitCompleteDecoupling suite.
 *
 * TaskPool.ets wraps each database call in its own task: submitting a task and
 * completing it are separate events. The queue double keeps pending, running and
 * completed apart so the suite can prove that submit never executes, runNext
 * never completes, and complete never pulls the next pending item.
 *
 * Source anchors:
 *   TaskPool.ets:69-117              taskpool wrappers per operation
 *   TaskPool.ets:75-78               query catch returns []
 *   TaskPool.ets:113-116             batch catch returns 0
 *   SharedDriver.ets:642-705         TaskPoolQueue model
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import {
  CATEGORY_A,
  CATEGORY_B,
  OperationCatalog,
  TaskPoolQueue,
  createSeedContacts,
  contactOf,
  contactNames,
  joined,
  expectedBatchCount,
  wrappedQueryResult,
  wrappedBatchCount,
  fallbackForOperation,
  ERROR_SQL_EXECUTION,
  ERROR_NONE,
  StoreDouble,
  resetContactManager
} from '../Shared/SharedDriver';

export default function submitCompleteDecouplingTest(): void {
  describe('SubmitCompleteDecoupling', () => {
    beforeAll(() => {
      logSuite('SubmitCompleteDecoupling', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('SubmitCompleteDecoupling', 'end');
    });

    /**
     * @tc.name   submitDoesNotExecutePendingWork
     * @tc.desc   Submitting three operations leaves all three pending with nothing running or complete.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('submitDoesNotExecutePendingWork', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.QUERY_ALL);
      queue.submit(OperationCatalog.INSERT_ONE);
      queue.submit(OperationCatalog.BATCH_INSERT);
      expect(queue.pending.length).assertEqual(3);
      expect(queue.running.length).assertEqual(0);
      expect(queue.completed.length).assertEqual(0);
      expect(queue.size()).assertEqual(3);
      expect(queue.trace()).assertEqual('');
      logStep('submitCompleteDecouplingTest', 'submit only enqueues');
    });

    /**
     * @tc.name   submitOrderIsFifo
     * @tc.desc   runNext returns the operations in the order they were submitted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('submitOrderIsFifo', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.INIT_STORE);
      queue.submit(OperationCatalog.CREATE_TABLE);
      queue.submit(OperationCatalog.QUERY_ALL);
      expect(queue.runNext()).assertEqual(OperationCatalog.INIT_STORE);
      expect(queue.runNext()).assertEqual(OperationCatalog.CREATE_TABLE);
      expect(queue.runNext()).assertEqual(OperationCatalog.QUERY_ALL);
      expect(queue.pending.length).assertEqual(0);
      logStep('submitCompleteDecouplingTest', 'pending drains in FIFO order');
    });

    /**
     * @tc.name   runNextMovesOneTask
     * @tc.desc   One runNext shifts exactly one item from pending into running.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runNextMovesOneTask', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.INSERT_ONE);
      queue.submit(OperationCatalog.UPDATE_ONE);
      expect(queue.runNext()).assertEqual(OperationCatalog.INSERT_ONE);
      expect(queue.pending.length).assertEqual(1);
      expect(queue.running.length).assertEqual(1);
      expect(queue.running[0]).assertEqual(OperationCatalog.INSERT_ONE);
      expect(queue.completed.length).assertEqual(0);
      logStep('submitCompleteDecouplingTest', 'runNext moves a single item');
    });

    /**
     * @tc.name   completeDropsRunningTask
     * @tc.desc   complete removes the running task and records it once in the completion order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completeDropsRunningTask', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.DELETE_ONE);
      queue.runNext();
      queue.complete(OperationCatalog.DELETE_ONE);
      expect(queue.running.length).assertEqual(0);
      expect(queue.completed.length).assertEqual(1);
      expect(queue.completed[0]).assertEqual(OperationCatalog.DELETE_ONE);
      expect(queue.completionOrder.length).assertEqual(1);
      expect(queue.pending.length).assertEqual(0);
      logStep('submitCompleteDecouplingTest', 'complete retires the running item');
    });

    /**
     * @tc.name   completionOrderIndependentOfSubmit
     * @tc.desc   Two running tasks complete in reverse order and the trace follows completion, not submission.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completionOrderIndependentOfSubmit', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.QUERY_ALL);
      queue.submit(OperationCatalog.BATCH_INSERT);
      queue.runNext();
      queue.runNext();
      expect(queue.running.length).assertEqual(2);
      queue.complete(OperationCatalog.BATCH_INSERT);
      queue.complete(OperationCatalog.QUERY_ALL);
      expect(queue.trace()).assertEqual(OperationCatalog.BATCH_INSERT + '>' + OperationCatalog.QUERY_ALL);
      expect(queue.completed[0]).assertEqual(OperationCatalog.BATCH_INSERT);
      expect(queue.completed[1]).assertEqual(OperationCatalog.QUERY_ALL);
      expect(queue.running.length).assertEqual(0);
      logStep('submitCompleteDecouplingTest', 'completion order is free of submit order');
    });

    /**
     * @tc.name   drainCompletesEveryPendingTask
     * @tc.desc   drain returns four and leaves four completed entries with an empty pending queue.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('drainCompletesEveryPendingTask', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.CREATE_TABLE);
      queue.submit(OperationCatalog.INIT_STORE);
      queue.submit(OperationCatalog.QUERY_ALL);
      queue.submit(OperationCatalog.DEDUPE_ROWS);
      const drained = queue.drain();
      expect(drained).assertEqual(4);
      expect(queue.pending.length).assertEqual(0);
      expect(queue.running.length).assertEqual(0);
      expect(queue.completed.length).assertEqual(4);
      expect(queue.completionOrder[3]).assertEqual(OperationCatalog.DEDUPE_ROWS);
      logStep('submitCompleteDecouplingTest', 'drain retires every pending task');
    });

    /**
     * @tc.name   submitAfterDrainStartsEmptyAgain
     * @tc.desc   A new submit after a drain sits alone in pending and does not reuse completed entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('submitAfterDrainStartsEmptyAgain', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.QUERY_ALL);
      queue.drain();
      queue.submit(OperationCatalog.INSERT_ONE);
      expect(queue.pending.length).assertEqual(1);
      expect(queue.completed.length).assertEqual(1);
      expect(queue.completionOrder.length).assertEqual(1);
      expect(queue.size()).assertEqual(1);
      queue.drain();
      expect(queue.completionOrder.length).assertEqual(2);
      logStep('submitCompleteDecouplingTest', 'drain leaves a reusable queue');
    });

    /**
     * @tc.name   completionTraceUsesArrow
     * @tc.desc   The trace joins completion order with a single arrow and keeps duplicates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completionTraceUsesArrow', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.INSERT_ONE);
      queue.submit(OperationCatalog.INSERT_ONE);
      queue.submit(OperationCatalog.DELETE_ONE);
      queue.drain();
      expect(queue.trace()).assertEqual('insert-one>insert-one>delete-one');
      expect(queue.completed.length).assertEqual(3);
      expect(queue.trace().split('>').length).assertEqual(3);
      expect(queue.completionOrder[1]).assertEqual(OperationCatalog.INSERT_ONE);
      logStep('submitCompleteDecouplingTest', 'trace keeps the duplicate completion');
    });

    /**
     * @tc.name   failMovesTaskOutOfRunning
     * @tc.desc   fail removes the running item, records it in failed and leaves the completed list empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failMovesTaskOutOfRunning', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.BATCH_INSERT);
      queue.runNext();
      queue.fail(OperationCatalog.BATCH_INSERT);
      expect(queue.running.length).assertEqual(0);
      expect(queue.failed.length).assertEqual(1);
      expect(queue.failed[0]).assertEqual(OperationCatalog.BATCH_INSERT);
      expect(queue.completed.length).assertEqual(0);
      expect(queue.trace()).assertEqual('');
      logStep('submitCompleteDecouplingTest', 'fail is not a completion');
    });

    /**
     * @tc.name   duplicateSubmitsAreQueuedSeparately
     * @tc.desc   Three submits of the same operation occupy three pending slots and run three times.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateSubmitsAreQueuedSeparately', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.QUERY_ALL);
      queue.submit(OperationCatalog.QUERY_ALL);
      queue.submit(OperationCatalog.QUERY_ALL);
      expect(queue.pending.length).assertEqual(3);
      expect(queue.drain()).assertEqual(3);
      expect(queue.completed.length).assertEqual(3);
      expect(queue.trace()).assertEqual('query-all>query-all>query-all');
      logStep('submitCompleteDecouplingTest', 'identical operations queue separately');
    });

    /**
     * @tc.name   queueSizeCombinesPendingAndRunning
     * @tc.desc   size counts pending plus running but never completed entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queueSizeCombinesPendingAndRunning', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.QUERY_ALL);
      queue.submit(OperationCatalog.INSERT_ONE);
      queue.submit(OperationCatalog.UPDATE_ONE);
      queue.runNext();
      expect(queue.size()).assertEqual(3);
      expect(queue.pending.length).assertEqual(2);
      expect(queue.running.length).assertEqual(1);
      queue.complete(OperationCatalog.QUERY_ALL);
      expect(queue.size()).assertEqual(2);
      expect(queue.completed.length).assertEqual(1);
      logStep('submitCompleteDecouplingTest', 'size excludes completed work');
    });

    /**
     * @tc.name   runNextOnEmptyReturnsBlank
     * @tc.desc   An empty queue returns the empty string and leaves every state array empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('runNextOnEmptyReturnsBlank', 0, () => {
      const queue = new TaskPoolQueue();
      expect(queue.runNext()).assertEqual('');
      expect(queue.pending.length).assertEqual(0);
      expect(queue.running.length).assertEqual(0);
      expect(queue.completed.length).assertEqual(0);
      expect(queue.drain()).assertEqual(0);
      logStep('submitCompleteDecouplingTest', 'empty queue yields a blank task');
    });

    /**
     * @tc.name   completeUnknownTaskStillRecords
     * @tc.desc   Completing a name that is not running records the completion but does not shrink running.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('completeUnknownTaskStillRecords', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.QUERY_ALL);
      queue.runNext();
      queue.complete(OperationCatalog.DELETE_ONE);
      expect(queue.running.length).assertEqual(1);
      expect(queue.running[0]).assertEqual(OperationCatalog.QUERY_ALL);
      expect(queue.completed.length).assertEqual(1);
      expect(queue.completed[0]).assertEqual(OperationCatalog.DELETE_ONE);
      logStep('submitCompleteDecouplingTest', 'unknown completion is still recorded');
    });

    /**
     * @tc.name   failUnknownTaskStillRecords
     * @tc.desc   Failing a task that never ran records the failure and keeps the running item.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failUnknownTaskStillRecords', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.INSERT_ONE);
      queue.runNext();
      queue.fail(OperationCatalog.BATCH_INSERT);
      expect(queue.failed.length).assertEqual(1);
      expect(queue.failed[0]).assertEqual(OperationCatalog.BATCH_INSERT);
      expect(queue.running.length).assertEqual(1);
      expect(queue.completed.length).assertEqual(0);
      logStep('submitCompleteDecouplingTest', 'unknown failure is recorded separately');
    });

    /**
     * @tc.name   interleavedSubmitRunCompleteSequence
     * @tc.desc   Submitting between runs and completes keeps the pending order intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('interleavedSubmitRunCompleteSequence', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.INIT_STORE);
      queue.submit(OperationCatalog.CREATE_TABLE);
      expect(queue.runNext()).assertEqual(OperationCatalog.INIT_STORE);
      queue.submit(OperationCatalog.BATCH_INSERT);
      queue.complete(OperationCatalog.INIT_STORE);
      expect(queue.runNext()).assertEqual(OperationCatalog.CREATE_TABLE);
      queue.complete(OperationCatalog.CREATE_TABLE);
      expect(queue.pending[0]).assertEqual(OperationCatalog.BATCH_INSERT);
      expect(queue.trace()).assertEqual('init-store>create-table');
      expect(queue.size()).assertEqual(1);
      logStep('submitCompleteDecouplingTest', 'interleaving keeps the pending tail');
    });

    /**
     * @tc.name   completingTwiceRecordsTwoEntries
     * @tc.desc   A second complete of the same name appends another completed entry without touching running.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('completingTwiceRecordsTwoEntries', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.UPDATE_ONE);
      queue.runNext();
      queue.complete(OperationCatalog.UPDATE_ONE);
      queue.complete(OperationCatalog.UPDATE_ONE);
      expect(queue.completed.length).assertEqual(2);
      expect(queue.completionOrder.length).assertEqual(2);
      expect(queue.running.length).assertEqual(0);
      expect(queue.trace()).assertEqual('update-one>update-one');
      logStep('submitCompleteDecouplingTest', 'double completion is recorded twice');
    });

    /**
     * @tc.name   queryWrapperReturnsStoreRows
     * @tc.desc   A wrapped query with a usable context returns the three stored rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryWrapperReturnsStoreRows', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const rows: Contact[] = [];
      rows.push(contactOf('闻笛', '13700000041', 'wendi.q1@example.com', '广东省佛山市禅城区', '', CATEGORY_A));
      rows.push(contactOf('闻舟', '13700000042', 'wenzhou.q2@example.com', '广东省佛山市南海区', '', CATEGORY_B));
      rows.push(contactOf('闻溪', '13700000043', 'wenxi.q3@example.com', '广东省佛山市顺德区', '', CATEGORY_A));
      store.batchInsert(true, rows);
      const result = wrappedQueryResult(true, store);
      expect(result.length).assertEqual(3);
      expect(joined(contactNames(result))).assertEqual('闻笛,闻舟,闻溪');
      expect(store.queryCalls).assertEqual(1);
      expect(result[2].email).assertEqual('wenxi.q3@example.com');
      logStep('submitCompleteDecouplingTest', 'query wrapper returns rows');
    });

    /**
     * @tc.name   queryWrapperEmptyWithoutContext
     * @tc.desc   A query with no usable context returns the empty array fallback from TaskPool.ets.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryWrapperEmptyWithoutContext', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      const result = wrappedQueryResult(false, store);
      expect(result.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(0);
      expect(store.rowCount()).assertEqual(4);
      expect(joined(contactNames(result))).assertEqual('');
      logStep('submitCompleteDecouplingTest', 'query fallback is an empty array');
    });

    /**
     * @tc.name   batchWrapperReportsCountThenZero
     * @tc.desc   A valid batch reports its size, while a missing context reports the zero fallback.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchWrapperReportsCountThenZero', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const chunk = createSeedContacts().slice(0, 5);
      expect(wrappedBatchCount(true, store, chunk)).assertEqual(expectedBatchCount(chunk));
      expect(wrappedBatchCount(true, store, chunk)).assertEqual(5);
      const closed = new StoreDouble();
      expect(wrappedBatchCount(false, closed, chunk)).assertEqual(0);
      expect(store.rowCount()).assertEqual(10);
      logStep('submitCompleteDecouplingTest', 'batch wrapper maps failure to zero');
    });

    /**
     * @tc.name   fallbackForOperationUsesErrorCode
     * @tc.desc   The fallback helper returns zero for no error, zero for batch insert and minus one otherwise.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('fallbackForOperationUsesErrorCode', 0, () => {
      expect(fallbackForOperation(OperationCatalog.QUERY_ALL, ERROR_NONE)).assertEqual(0);
      expect(fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_SQL_EXECUTION)).assertEqual(0);
      expect(fallbackForOperation(OperationCatalog.QUERY_ALL, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.DELETE_ONE, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(OperationCatalog.all().length).assertEqual(8);
      logStep('submitCompleteDecouplingTest', 'fallback codes follow the operation');
    });

    /**
     * @tc.name   queueResetClearsEveryList
     * @tc.desc   Reset empties pending, running, completed, failed and the trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('queueResetClearsEveryList', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.QUERY_ALL);
      queue.submit(OperationCatalog.INSERT_ONE);
      queue.runNext();
      queue.fail(OperationCatalog.QUERY_ALL);
      expect(queue.size()).assertEqual(1);
      expect(queue.failed.length).assertEqual(1);
      queue.reset();
      expect(queue.size()).assertEqual(0);
      expect(queue.completed.length).assertEqual(0);
      expect(queue.failed.length).assertEqual(0);
      expect(queue.trace()).assertEqual('');
      logStep('submitCompleteDecouplingTest', 'reset clears the whole queue');
    });

    /**
     * @tc.name   completeDoesNotStartNextTask
     * @tc.desc   Completing the only running task leaves the next pending task pending rather than running it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completeDoesNotStartNextTask', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.QUERY_ALL);
      queue.submit(OperationCatalog.INSERT_ONE);
      queue.runNext();
      queue.complete(OperationCatalog.QUERY_ALL);
      expect(queue.pending.length).assertEqual(1);
      expect(queue.pending[0]).assertEqual(OperationCatalog.INSERT_ONE);
      expect(queue.running.length).assertEqual(0);
      expect(queue.completed.length).assertEqual(1);
      logStep('submitCompleteDecouplingTest', 'completion never auto-starts the next task');
    });

    /**
     * @tc.name   failAfterDrainRecordsSeparately
     * @tc.desc   A failure reported after a drain lands in failed and leaves the completed trace unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failAfterDrainRecordsSeparately', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.CREATE_TABLE);
      queue.submit(OperationCatalog.DEDUPE_ROWS);
      queue.drain();
      const traceBefore = queue.trace();
      queue.fail(OperationCatalog.DEDUPE_ROWS);
      expect(queue.failed.length).assertEqual(1);
      expect(queue.completed.length).assertEqual(2);
      expect(queue.trace()).assertEqual(traceBefore);
      expect(queue.pending.length).assertEqual(0);
      logStep('submitCompleteDecouplingTest', 'late failure does not rewrite the trace');
    });

    /**
     * @tc.name   emptyChunkWrapperReportsZero
     * @tc.desc   An empty chunk through the batch wrapper reports zero and writes nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyChunkWrapperReportsZero', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const empty: Contact[] = [];
      expect(wrappedBatchCount(true, store, empty)).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.batchCalls).assertEqual(1);
      expect(expectedBatchCount(empty)).assertEqual(0);
      logStep('submitCompleteDecouplingTest', 'empty chunk reports zero through the wrapper');
    });

    /**
     * @tc.name   pendingAfterRunKeepsRemainingOrder
     * @tc.desc   Running the head twice preserves the order of the two items still pending.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SubmitCompleteDecoupling scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pendingAfterRunKeepsRemainingOrder', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.INIT_STORE);
      queue.submit(OperationCatalog.BATCH_INSERT);
      queue.submit(OperationCatalog.QUERY_ALL);
      queue.submit(OperationCatalog.DEDUPE_ROWS);
      queue.runNext();
      queue.runNext();
      expect(queue.pending.length).assertEqual(2);
      expect(queue.pending[0]).assertEqual(OperationCatalog.QUERY_ALL);
      expect(queue.pending[1]).assertEqual(OperationCatalog.DEDUPE_ROWS);
      expect(queue.running.length).assertEqual(2);
      logStep('submitCompleteDecouplingTest', 'pending keeps its remaining order');
    });
  });
}
