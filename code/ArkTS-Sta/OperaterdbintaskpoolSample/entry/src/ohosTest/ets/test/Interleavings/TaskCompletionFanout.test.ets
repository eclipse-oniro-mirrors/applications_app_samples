'use static';
import { CATEGORY_E, CATEGORY_F } from '../Shared/SharedDriver';
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
 * Interleavings / TaskCompletionFanout suite.
 *
 * One finished task changes several observable views at once: the store rows,
 * the list the page rebuilds from them, the category groups, the search hits and
 * the aggregate metrics. A task that fails must change none of them. The suite
 * checks the fan-out from a single completion against every view.
 *
 * Source anchors:
 *   TaskPool.ets:65-79              batch and query wrappers on one completion
 *   DatabaseConnection.ets:277-309  list rebuilt from the result set
 *   SharedDriver.ets:797-831        SearchEngine grouping helpers
 *   SharedDriver.ets:833-864        ContactMetrics aggregate
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  CATEGORY_A,
  CATEGORY_B,
  CATEGORY_C,
  CATEGORY_D,
  OperationCatalog,
  TaskPoolQueue,
  createSeedContacts,
  contactOf,
  contactNames,
  joined,
  countOf,
  uniqueStrings,
  snapshotsOf,
  sameSnapshotArray,
  CursorResultSet,
  readContactsFromResultSet,
  StoreDouble,
  ContactMetrics,
  SearchEngine,
  resetContactManager
} from '../Shared/SharedDriver';

export default function taskCompletionFanoutTest(): void {
  describe('TaskCompletionFanout', () => {
    beforeAll(() => {
      logSuite('TaskCompletionFanout', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('TaskCompletionFanout', 'end');
    });

    /**
     * @tc.name   batchCompletionFansOutToNames
     * @tc.desc   One five row batch completion is visible in the store names and its row count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchCompletionFansOutToNames', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const chunk = createSeedContacts().slice(0, 5);
      store.batchInsert(true, chunk);
      expect(store.names().length).assertEqual(5);
      expect(joined(store.names())).assertEqual(joined(contactNames(chunk)));
      expect(store.rowCount()).assertEqual(5);
      expect(countOf(store.names(), '贝拉')).assertEqual(1);
      logStep('taskCompletionFanoutTest', 'batch completion reaches the names view');
    });

    /**
     * @tc.name   batchCompletionFansOutToMetrics
     * @tc.desc   The metrics view reports five rows, five unique names and the categories of the chunk.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchCompletionFansOutToMetrics', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 5));
      const metrics = ContactMetrics.from(store.rows);
      expect(metrics.total).assertEqual(5);
      expect(metrics.uniqueNames).assertEqual(5);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.categories).assertEqual(2);
      expect(metrics.totalPhoneDigits).assertEqual(55);
      logStep('taskCompletionFanoutTest', 'metrics view follows the completion');
    });

    /**
     * @tc.name   batchCompletionFansOutToSearch
     * @tc.desc   A name filter over the completed batch returns the matching row only.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchCompletionFansOutToSearch', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      const hits = SearchEngine.filterByName(store.rows, '本');
      expect(hits.length).assertEqual(2);
      expect(hits[0].name).assertEqual('本');
      expect(hits[1].name).assertEqual('本杰明');
      expect(SearchEngine.filterByName(store.rows, '不存在').length).assertEqual(0);
      logStep('taskCompletionFanoutTest', 'search view follows the completion');
    });

    /**
     * @tc.name   batchCompletionFansOutToGroups
     * @tc.desc   The category view lists six groups in first appearance order after the seed batch.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchCompletionFansOutToGroups', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      const groups = SearchEngine.groupByCategory(store.rows);
      expect(groups.length).assertEqual(6);
      expect(joined(groups)).assertEqual('A,B,C,D,E,F');
      expect(SearchEngine.countCategory(store.rows, CATEGORY_A)).assertEqual(2);
      expect(SearchEngine.countCategory(store.rows, CATEGORY_F)).assertEqual(2);
      logStep('taskCompletionFanoutTest', 'category view follows the completion');
    });

    /**
     * @tc.name   batchCompletionFansOutToCursor
     * @tc.desc   A cursor over the completed batch exposes fourteen rows because the first is skipped.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchCompletionFansOutToCursor', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(visible.length).assertEqual(14);
      expect(visible[0].name).assertEqual('阿诺德');
      expect(visible[13].name).assertEqual('法里');
      expect(countOf(contactNames(visible), '艾德里安')).assertEqual(0);
      logStep('taskCompletionFanoutTest', 'cursor view follows the completion');
    });

    /**
     * @tc.name   queueCompletionFansOutToTrace
     * @tc.desc   One completion appends to completed, completion order and the trace at once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queueCompletionFansOutToTrace', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.BATCH_INSERT);
      queue.runNext();
      queue.complete(OperationCatalog.BATCH_INSERT);
      expect(queue.completed.length).assertEqual(1);
      expect(queue.completionOrder.length).assertEqual(1);
      expect(queue.trace()).assertEqual(OperationCatalog.BATCH_INSERT);
      expect(queue.running.length).assertEqual(0);
      logStep('taskCompletionFanoutTest', 'queue views share one completion');
    });

    /**
     * @tc.name   drainFansOutToEveryQueuedTask
     * @tc.desc   A single drain completes five queued tasks and produces a five entry trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('drainFansOutToEveryQueuedTask', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.CREATE_TABLE);
      queue.submit(OperationCatalog.INIT_STORE);
      queue.submit(OperationCatalog.BATCH_INSERT);
      queue.submit(OperationCatalog.QUERY_ALL);
      queue.submit(OperationCatalog.DEDUPE_ROWS);
      const drained = queue.drain();
      expect(drained).assertEqual(5);
      expect(queue.completed.length).assertEqual(5);
      expect(queue.trace().split('>').length).assertEqual(5);
      expect(queue.pending.length).assertEqual(0);
      logStep('taskCompletionFanoutTest', 'drain fans out to every task');
    });

    /**
     * @tc.name   queryCompletionFansOutToRowCount
     * @tc.desc   The row count returned by a query matches the store size at completion time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryCompletionFansOutToRowCount', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 7));
      const rows = store.query(true);
      expect(rows.length).assertEqual(store.rowCount());
      expect(rows.length).assertEqual(7);
      expect(rows[6].name).assertEqual('康纳');
      expect(store.queryCalls).assertEqual(1);
      logStep('taskCompletionFanoutTest', 'query fans out to the row count');
    });

    /**
     * @tc.name   deleteCompletionShrinksEveryView
     * @tc.desc   One delete completion lowers the row count, the unique count and the category count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteCompletionShrinksEveryView', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      const before = ContactMetrics.from(store.rows);
      expect(store.deleteByName('法比而')).assertEqual(1);
      const after = ContactMetrics.from(store.rows);
      expect(after.total).assertEqual(before.total - 1);
      expect(after.uniqueNames).assertEqual(before.uniqueNames - 1);
      expect(SearchEngine.countCategory(store.rows, CATEGORY_F)).assertEqual(1);
      expect(SearchEngine.groupByCategory(store.rows).length).assertEqual(6);
      logStep('taskCompletionFanoutTest', 'delete completion shrinks every view');
    });

    /**
     * @tc.name   updateCompletionFansOutToFields
     * @tc.desc   One update completion changes the phone, email and address while the name view is unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateCompletionFansOutToFields', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      const namesBefore = joined(store.names());
      expect(store.updateContact(contactOf('丹尼尔', '17700000061', 'daniel.one@example.com',
        '陕西省商洛市商州区', '', CATEGORY_D))).assertEqual(1);
      expect(store.rows[8].phone).assertEqual('17700000061');
      expect(store.rows[8].address).assertEqual('陕西省商洛市商州区');
      expect(joined(store.names())).assertEqual(namesBefore);
      expect(store.updateCalls).assertEqual(1);
      logStep('taskCompletionFanoutTest', 'update fans out to three fields only');
    });

    /**
     * @tc.name   insertCompletionIncrementsEveryView
     * @tc.desc   One insert raises the row count, row count and tail name views together.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('insertCompletionIncrementsEveryView', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      expect(store.insert(true, contactOf('裴雨', '13200000021', 'peiyu.fan@example.com', '山西省晋中市榆次区', '', CATEGORY_D),
        'ON_CONFLICT_REPLACE')).assertEqual(5);
      expect(store.rowCount()).assertEqual(5);
      expect(store.names()[4]).assertEqual('裴雨');
      expect(ContactMetrics.from(store.rows).uniqueNames).assertEqual(5);
      logStep('taskCompletionFanoutTest', 'insert fans out to every count');
    });

    /**
     * @tc.name   failedCompletionLeavesViewsUnchanged
     * @tc.desc   A failed task adds to failed only and none of the data views change.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedCompletionLeavesViewsUnchanged', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 5));
      const before = snapshotsOf(store.rows);
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.UPDATE_ONE);
      queue.runNext();
      queue.fail(OperationCatalog.UPDATE_ONE);
      expect(queue.failed.length).assertEqual(1);
      expect(queue.completed.length).assertEqual(0);
      expect(sameSnapshotArray(snapshotsOf(store.rows), before)).assertTrue();
      expect(store.rowCount()).assertEqual(5);
      logStep('taskCompletionFanoutTest', 'failure does not fan out to data views');
    });

    /**
     * @tc.name   resetThenRebuildFansOutAgain
     * @tc.desc   After a reset a new batch completion rebuilds every view from empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('resetThenRebuildFansOutAgain', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      store.reset();
      expect(ContactMetrics.from(store.rows).total).assertEqual(0);
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      expect(store.rowCount()).assertEqual(3);
      expect(ContactMetrics.from(store.rows).total).assertEqual(3);
      expect(SearchEngine.groupByCategory(store.rows).length).assertEqual(2);
      expect(store.initCalls).assertEqual(1);
      logStep('taskCompletionFanoutTest', 'rebuild fans out after reset');
    });

    /**
     * @tc.name   twoCompletionsShareOneStore
     * @tc.desc   A batch and an insert completion in a row reach the same store instance.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoCompletionsShareOneStore', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      store.insert(true, contactOf('裴风', '13200000031', 'peifeng.fan@example.com', '山西省运城市盐湖区', '', CATEGORY_E),
        'ON_CONFLICT_REPLACE');
      expect(store.batchCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(3);
      expect(store.names()[2]).assertEqual('裴风');
      expect(store.names()[0]).assertEqual('艾德里安');
      logStep('taskCompletionFanoutTest', 'two completions share the store');
    });

    /**
     * @tc.name   completionChainAdvancesTrace
     * @tc.desc   Four completions produce a four step trace in completion order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completionChainAdvancesTrace', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.INIT_STORE);
      queue.submit(OperationCatalog.BATCH_INSERT);
      queue.submit(OperationCatalog.QUERY_ALL);
      queue.submit(OperationCatalog.DEDUPE_ROWS);
      queue.runNext();
      queue.complete(OperationCatalog.INIT_STORE);
      queue.runNext();
      queue.complete(OperationCatalog.BATCH_INSERT);
      queue.runNext();
      queue.complete(OperationCatalog.QUERY_ALL);
      queue.runNext();
      queue.complete(OperationCatalog.DEDUPE_ROWS);
      expect(queue.trace()).assertEqual('init-store>batch-insert>query-all>dedupe-rows');
      expect(queue.completed.length).assertEqual(4);
      expect(queue.size()).assertEqual(0);
      logStep('taskCompletionFanoutTest', 'each completion extends the trace');
    });

    /**
     * @tc.name   repeatedQueryKeepsFanoutStable
     * @tc.desc   Two queries over unchanged rows return the same count and order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedQueryKeepsFanoutStable', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 9));
      const first = store.query(true);
      const second = store.query(true);
      expect(first.length).assertEqual(second.length);
      expect(joined(contactNames(first))).assertEqual(joined(contactNames(second)));
      expect(store.queryCalls).assertEqual(2);
      expect(store.names().length).assertEqual(9);
      logStep('taskCompletionFanoutTest', 'repeat queries are stable');
    });

    /**
     * @tc.name   managerAndStoreFanoutAgree
     * @tc.desc   A batch completion and a setContacts call produce the same names and metrics.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('managerAndStoreFanoutAgree', 0, () => {
      const manager = ContactManager.getInstance();
      const store = new StoreDouble();
      store.init(true);
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      expect(joined(contactNames(manager.getContacts()))).assertEqual(joined(store.names()));
      expect(ContactMetrics.from(manager.getContacts()).fingerprint())
        .assertEqual(ContactMetrics.from(store.rows).fingerprint());
      expect(manager.getContacts().length).assertEqual(store.rowCount());
      logStep('taskCompletionFanoutTest', 'manager and store fan out alike');
    });

    /**
     * @tc.name   snapshotCountMatchesRowCount
     * @tc.desc   The snapshot view has one entry per stored row after a batch completion.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotCountMatchesRowCount', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      const snapshot = snapshotsOf(store.rows);
      expect(snapshot.length).assertEqual(store.rowCount());
      expect(snapshot[0].name).assertEqual('艾德里安');
      expect(snapshot[14].category).assertEqual(CATEGORY_F);
      expect(snapshot[7].describe().indexOf('卡特琳娜')).assertEqual(0);
      logStep('taskCompletionFanoutTest', 'snapshot view matches the row count');
    });

    /**
     * @tc.name   twinInsertRaisesDuplicateCount
     * @tc.desc   Inserting a second 贝拉 raises duplicateNames to one and leaves uniqueNames at fifteen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twinInsertRaisesDuplicateCount', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      const before = ContactMetrics.from(store.rows);
      store.insert(true, contactOf('贝拉', '11111119999', 'bella.fan@example.com', '湖北省咸宁市咸安区', '', CATEGORY_B),
        'ON_CONFLICT_REPLACE');
      const after = ContactMetrics.from(store.rows);
      expect(after.total).assertEqual(before.total + 1);
      expect(after.uniqueNames).assertEqual(before.uniqueNames);
      expect(after.duplicateNames).assertEqual(1);
      expect(SearchEngine.countCategory(store.rows, CATEGORY_B)).assertEqual(4);
      logStep('taskCompletionFanoutTest', 'twin insert raises the duplicate count');
    });

    /**
     * @tc.name   partialDeleteKeepsRemainingOrder
     * @tc.desc   Deleting two separate names leaves the other thirteen rows in seed order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('partialDeleteKeepsRemainingOrder', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      store.deleteByName('阿诺德');
      store.deleteByName('艾登');
      expect(store.rowCount()).assertEqual(13);
      expect(store.names()[0]).assertEqual('艾德里安');
      expect(store.names()[1]).assertEqual('贝拉');
      expect(store.names()[12]).assertEqual('法里');
      expect(uniqueStrings(store.names()).length).assertEqual(13);
      logStep('taskCompletionFanoutTest', 'partial delete keeps the remaining order');
    });

    /**
     * @tc.name   deleteAllFansOutToEmptyViews
     * @tc.desc   Deleting every seed name empties the names, groups and metrics views together.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteAllFansOutToEmptyViews', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      for (let index = 0; index < seed.length; index++) {
        store.deleteByName(seed[index].name);
      }
      expect(store.rowCount()).assertEqual(0);
      expect(store.names().length).assertEqual(0);
      expect(SearchEngine.groupByCategory(store.rows).length).assertEqual(0);
      expect(ContactMetrics.from(store.rows).total).assertEqual(0);
      expect(store.deleteCalls).assertEqual(15);
      logStep('taskCompletionFanoutTest', 'deleting every row empties all views');
    });

    /**
     * @tc.name   initCompletionOwnsTheTableStep
     * @tc.desc   The init completion, not the query completion, is the only one that creates the table.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('initCompletionOwnsTheTableStep', 0, () => {
      const store = new StoreDouble();
      store.query(true);
      expect(store.createTableCalls).assertEqual(0);
      store.init(true);
      expect(store.createTableCalls).assertEqual(1);
      store.query(true);
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      expect(store.createTableCalls).assertEqual(1);
      expect(store.queryCalls).assertEqual(2);
      logStep('taskCompletionFanoutTest', 'only init creates the table');
    });

    /**
     * @tc.name   mixedCompletionTraceKeepsFailuresApart
     * @tc.desc   Two completions and one failure leave three separate records across the queue views.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the TaskCompletionFanout scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('mixedCompletionTraceKeepsFailuresApart', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.QUERY_ALL);
      queue.submit(OperationCatalog.INSERT_ONE);
      queue.submit(OperationCatalog.DELETE_ONE);
      queue.runNext();
      queue.complete(OperationCatalog.QUERY_ALL);
      queue.runNext();
      queue.fail(OperationCatalog.INSERT_ONE);
      queue.runNext();
      queue.complete(OperationCatalog.DELETE_ONE);
      expect(queue.completed.length).assertEqual(2);
      expect(queue.failed.length).assertEqual(1);
      expect(queue.trace()).assertEqual('query-all>delete-one');
      expect(queue.failed[0]).assertEqual(OperationCatalog.INSERT_ONE);
      logStep('taskCompletionFanoutTest', 'failures stay out of the completion trace');
    });
  });
}
