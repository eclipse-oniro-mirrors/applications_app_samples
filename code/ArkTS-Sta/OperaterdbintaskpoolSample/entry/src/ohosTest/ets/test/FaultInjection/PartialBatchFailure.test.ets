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
 * FaultInjection / PartialBatchFailure suite.
 *
 * batchInsertData reports one number for one chunk. When a multi chunk import
 * fails in the middle, the chunks that already returned stay committed and only
 * the failing chunk reports zero. The suite pins that partial progress so the
 * page never assumes an all-or-nothing import.
 *
 * Source anchors:
 *   DatabaseConnection.ets:139-181  per chunk batchInsert promise with catch 0
 *   DatabaseConnection.ets:150-171  bucket list built for one chunk
 *   SharedDriver.ets:715-718        wrapper turns a negative count into zero
 *   SharedDriver.ets:960-963        expectedBatchCount oracle
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import {
  CATEGORY_A,
  CATEGORY_B,
  CATEGORY_C,
  CATEGORY_D,
  CATEGORY_F,
  ERROR_SQL_EXECUTION,
  OperationCatalog,
  createSeedContacts,
  contactOf,
  contactNames,
  joined,
  countOf,
  uniqueStrings,
  snapshotsOf,
  sameSnapshotArray,
  expectedBatchCount,
  expectedVisibleCount,
  wrappedBatchCount,
  fallbackForOperation,
  CursorResultSet,
  readContactsFromResultSet,
  StoreDouble,
  ContactMetrics,
  SearchEngine,
  resetContactManager
} from '../Shared/SharedDriver';

export default function partialBatchFailureTest(): void {
  describe('PartialBatchFailure', () => {
    beforeAll(() => {
      logSuite('PartialBatchFailure', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('PartialBatchFailure', 'end');
    });

    /**
     * @tc.name   firstChunkCommitsBeforeSecondFails
     * @tc.desc   A six row chunk followed by a failed chunk leaves the first six rows stored.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('firstChunkCommitsBeforeSecondFails', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      expect(wrappedBatchCount(true, store, seed.slice(0, 6))).assertEqual(6);
      expect(store.rowCount()).assertEqual(6);
      store.failNextBatch = true;
      const failed = store.batchInsert(true, seed.slice(6, 12));
      expect(failed).assertEqual(-1);
      expect(store.rowCount()).assertEqual(6);
      expect(store.batchCalls).assertEqual(2);
      logStep('partialBatchFailureTest', 'first chunk stays committed');
    });

    /**
     * @tc.name   failedChunkWrapperReportsZero
     * @tc.desc   The failing chunk is reported as zero through the wrapper while the store keeps six rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failedChunkWrapperReportsZero', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 6));
      store.failNextBatch = true;
      expect(wrappedBatchCount(true, store, seed.slice(6, 12))).assertEqual(0);
      expect(store.rowCount()).assertEqual(6);
      expect(store.initialized).assertTrue();
      expect(store.batchCalls).assertEqual(2);
      logStep('partialBatchFailureTest', 'failed chunk reports zero');
    });

    /**
     * @tc.name   committedRowsStayQueryable
     * @tc.desc   A query after the partial failure returns the committed six rows in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('committedRowsStayQueryable', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 6));
      store.failNextBatch = true;
      store.batchInsert(true, seed.slice(6, 12));
      const rows = store.query(true);
      expect(rows.length).assertEqual(6);
      expect(joined(contactNames(rows))).assertEqual(joined(contactNames(seed.slice(0, 6))));
      expect(rows[5].name).assertEqual('卡梅隆');
      expect(store.queryCalls).assertEqual(1);
      logStep('partialBatchFailureTest', 'committed rows remain queryable');
    });

    /**
     * @tc.name   failureDoesNotRollBack
     * @tc.desc   The committed chunk is byte for byte identical after the failed chunk.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failureDoesNotRollBack', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 5));
      const before = snapshotsOf(store.rows);
      store.failNextBatch = true;
      store.batchInsert(true, seed.slice(5, 10));
      expect(sameSnapshotArray(snapshotsOf(store.rows), before)).assertTrue();
      expect(store.rowCount()).assertEqual(5);
      expect(store.deleteCalls).assertEqual(0);
      logStep('partialBatchFailureTest', 'failure performs no rollback');
    });

    /**
     * @tc.name   retryWholeBatchWritesAll
     * @tc.desc   Retrying the full fifteen row batch after a failure writes fifteen more rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryWholeBatchWritesAll', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.failNextBatch = true;
      expect(wrappedBatchCount(true, store, seed)).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(wrappedBatchCount(true, store, seed)).assertEqual(15);
      expect(store.rowCount()).assertEqual(15);
      expect(expectedBatchCount(seed)).assertEqual(15);
      logStep('partialBatchFailureTest', 'full batch retry writes every row');
    });

    /**
     * @tc.name   retryOnlyFailedChunk
     * @tc.desc   Retrying only the failed tail chunk completes the import to fifteen rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('retryOnlyFailedChunk', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 10));
      store.failNextBatch = true;
      expect(wrappedBatchCount(true, store, seed.slice(10, 15))).assertEqual(0);
      expect(store.rowCount()).assertEqual(10);
      expect(wrappedBatchCount(true, store, seed.slice(10, 15))).assertEqual(5);
      expect(store.rowCount()).assertEqual(15);
      expect(store.names()[14]).assertEqual('法里');
      logStep('partialBatchFailureTest', 'tail chunk retry completes the import');
    });

    /**
     * @tc.name   failedChunkAddsNoNames
     * @tc.desc   None of the names in the failed chunk appear in the store name view.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedChunkAddsNoNames', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 4));
      store.failNextBatch = true;
      store.batchInsert(true, seed.slice(4, 9));
      expect(store.names().length).assertEqual(4);
      expect(countOf(store.names(), '本杰明')).assertEqual(0);
      expect(countOf(store.names(), '卡梅隆')).assertEqual(0);
      expect(countOf(store.names(), '本')).assertEqual(1);
      logStep('partialBatchFailureTest', 'failed chunk contributes no names');
    });

    /**
     * @tc.name   batchCallsCountBothChunks
     * @tc.desc   One success and one failure increment batchCalls twice.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchCallsCountBothChunks', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 3));
      store.failNextBatch = true;
      store.batchInsert(true, seed.slice(3, 6));
      expect(store.batchCalls).assertEqual(2);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(3);
      logStep('partialBatchFailureTest', 'both chunks are counted');
    });

    /**
     * @tc.name   storeStaysInitialisedAfterFailure
     * @tc.desc   A failed chunk on an open store keeps it open for a later successful chunk.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeStaysInitialisedAfterFailure', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 2));
      store.failNextBatch = true;
      store.batchInsert(true, seed.slice(2, 4));
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(1);
      expect(wrappedBatchCount(true, store, seed.slice(4, 7))).assertEqual(3);
      expect(store.rowCount()).assertEqual(5);
      expect(store.initCalls).assertEqual(1);
      logStep('partialBatchFailureTest', 'store stays open after a failed chunk');
    });

    /**
     * @tc.name   partialMetricsCoverCommittedRows
     * @tc.desc   Metrics after a partial failure report only the committed rows and their categories.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('partialMetricsCoverCommittedRows', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 5));
      store.failNextBatch = true;
      store.batchInsert(true, seed.slice(5, 15));
      const metrics = ContactMetrics.from(store.rows);
      expect(metrics.total).assertEqual(5);
      expect(metrics.uniqueNames).assertEqual(5);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.categories).assertEqual(2);
      logStep('partialBatchFailureTest', 'metrics cover committed rows only');
    });

    /**
     * @tc.name   partialGroupCountMatchesCommitted
     * @tc.desc   The category groups after a partial import are the two groups of the committed chunk.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('partialGroupCountMatchesCommitted', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 5));
      store.failNextBatch = true;
      store.batchInsert(true, seed.slice(5, 15));
      const groups = SearchEngine.groupByCategory(store.rows);
      expect(groups.length).assertEqual(2);
      expect(joined(groups)).assertEqual('A,B');
      expect(SearchEngine.countCategory(store.rows, CATEGORY_C)).assertEqual(0);
      expect(SearchEngine.countCategory(store.rows, CATEGORY_A)).assertEqual(2);
      logStep('partialBatchFailureTest', 'group count follows the committed chunk');
    });

    /**
     * @tc.name   partialSnapshotCountMatchesRows
     * @tc.desc   The snapshot view holds one entry per committed row after the partial failure.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('partialSnapshotCountMatchesRows', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 7));
      store.failNextBatch = true;
      store.batchInsert(true, seed.slice(7, 15));
      const snapshot = snapshotsOf(store.rows);
      expect(snapshot.length).assertEqual(7);
      expect(snapshot.length).assertEqual(store.rowCount());
      expect(snapshot[6].name).assertEqual('康纳');
      expect(snapshot[6].category).assertEqual(CATEGORY_C);
      logStep('partialBatchFailureTest', 'snapshot matches committed rows');
    });

    /**
     * @tc.name   twoFailuresThenOneSuccess
     * @tc.desc   Two failed chunks followed by a successful one leave only the successful rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoFailuresThenOneSuccess', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.failNextBatch = true;
      expect(wrappedBatchCount(true, store, seed.slice(0, 3))).assertEqual(0);
      store.failNextBatch = true;
      expect(wrappedBatchCount(true, store, seed.slice(3, 6))).assertEqual(0);
      expect(wrappedBatchCount(true, store, seed.slice(6, 9))).assertEqual(3);
      expect(store.rowCount()).assertEqual(3);
      expect(store.names()[0]).assertEqual('康纳');
      expect(store.batchCalls).assertEqual(3);
      logStep('partialBatchFailureTest', 'two failures then one success');
    });

    /**
     * @tc.name   deleteAfterPartialThenRebatch
     * @tc.desc   Deleting from the committed prefix then importing again keeps totals coherent.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteAfterPartialThenRebatch', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 5));
      store.failNextBatch = true;
      store.batchInsert(true, seed.slice(5, 10));
      expect(store.deleteByName('贝拉')).assertEqual(1);
      expect(store.rowCount()).assertEqual(4);
      expect(wrappedBatchCount(true, store, seed.slice(10, 13))).assertEqual(3);
      expect(store.rowCount()).assertEqual(7);
      expect(countOf(store.names(), '艾登')).assertEqual(1);
      logStep('partialBatchFailureTest', 'delete then rebatch after a partial');
    });

    /**
     * @tc.name   failureOnEmptyStoreKeepsZero
     * @tc.desc   The very first chunk failing leaves an empty store that a query reports as empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failureOnEmptyStoreKeepsZero', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.failNextBatch = true;
      expect(wrappedBatchCount(true, store, seed)).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.query(true).length).assertEqual(0);
      expect(ContactMetrics.from(store.rows).total).assertEqual(0);
      expect(store.initialized).assertFalse();
      logStep('partialBatchFailureTest', 'first chunk failure keeps zero rows');
    });

    /**
     * @tc.name   recoveryChunkAppendsAfterCommitted
     * @tc.desc   The recovery chunk lands after the committed prefix rather than replacing it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recoveryChunkAppendsAfterCommitted', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 3));
      store.failNextBatch = true;
      store.batchInsert(true, seed.slice(3, 6));
      store.batchInsert(true, seed.slice(6, 8));
      expect(joined(store.names())).assertEqual('艾德里安,阿诺德,贝拉,康纳,卡特琳娜');
      expect(store.rowCount()).assertEqual(5);
      expect(store.names()[2]).assertEqual('贝拉');
      expect(store.names()[3]).assertEqual('康纳');
      logStep('partialBatchFailureTest', 'recovery chunk appends at the tail');
    });

    /**
     * @tc.name   partialCursorVisibleCount
     * @tc.desc   A cursor over the committed prefix exposes one row fewer than the stored rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('partialCursorVisibleCount', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 6));
      store.failNextBatch = true;
      store.batchInsert(true, seed.slice(6, 15));
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(visible.length).assertEqual(5);
      expect(visible.length).assertEqual(expectedVisibleCount(seed.slice(0, 6)));
      expect(visible[0].name).assertEqual('阿诺德');
      expect(countOf(contactNames(visible), '艾德里安')).assertEqual(0);
      logStep('partialBatchFailureTest', 'cursor over the committed prefix');
    });

    /**
     * @tc.name   partialUniqueNames
     * @tc.desc   The unique name count after a partial import equals the committed prefix length.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('partialUniqueNames', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 8));
      store.failNextBatch = true;
      store.batchInsert(true, seed.slice(8, 15));
      const names = store.names();
      expect(names.length).assertEqual(8);
      expect(uniqueStrings(names).length).assertEqual(8);
      expect(ContactMetrics.from(store.rows).uniqueNames).assertEqual(8);
      logStep('partialBatchFailureTest', 'unique names match the committed prefix');
    });

    /**
     * @tc.name   failureFallbackIsPerOperation
     * @tc.desc   The same SQL error yields zero for a batch but minus one for a query.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failureFallbackIsPerOperation', 0, () => {
      expect(fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_SQL_EXECUTION)).assertEqual(0);
      expect(fallbackForOperation(OperationCatalog.QUERY_ALL, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.INSERT_ONE, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(OperationCatalog.all().length).assertEqual(8);
      logStep('partialBatchFailureTest', 'fallback depends on the operation');
    });

    /**
     * @tc.name   insertAfterPartialAppendsOne
     * @tc.desc   A single insert after the partial failure extends the committed prefix by one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('insertAfterPartialAppendsOne', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 4));
      store.failNextBatch = true;
      store.batchInsert(true, seed.slice(4, 9));
      expect(store.insert(true, contactOf('裴照', '13200000081', 'peizhao.partial@example.com',
        '山西省太原市杏花岭区', '', CATEGORY_D), 'ON_CONFLICT_REPLACE')).assertEqual(5);
      expect(store.rowCount()).assertEqual(5);
      expect(store.names()[4]).assertEqual('裴照');
      expect(store.insertCalls).assertEqual(1);
      logStep('partialBatchFailureTest', 'insert after a partial appends one');
    });

    /**
     * @tc.name   partialThenDeleteAllEmpties
     * @tc.desc   Deleting every committed name after a partial failure empties the store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('partialThenDeleteAllEmpties', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 3));
      store.failNextBatch = true;
      store.batchInsert(true, seed.slice(3, 9));
      store.deleteByName('艾德里安');
      store.deleteByName('阿诺德');
      store.deleteByName('贝拉');
      expect(store.rowCount()).assertEqual(0);
      expect(store.names().length).assertEqual(0);
      expect(store.deleteCalls).assertEqual(3);
      expect(ContactMetrics.from(store.rows).total).assertEqual(0);
      logStep('partialBatchFailureTest', 'partial prefix can be emptied');
    });

    /**
     * @tc.name   failureDoesNotChangeOracle
     * @tc.desc   The per chunk oracle stays the chunk length even after another chunk failed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failureDoesNotChangeOracle', 0, () => {
      const seed = createSeedContacts();
      const chunk = seed.slice(7, 11);
      expect(expectedBatchCount(chunk)).assertEqual(4);
      expect(fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_SQL_EXECUTION)).assertEqual(0);
      expect(expectedBatchCount(chunk) - fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_SQL_EXECUTION))
        .assertEqual(4);
      expect(chunk[0].name).assertEqual('卡特琳娜');
      logStep('partialBatchFailureTest', 'oracle is independent of the failure');
    });

    /**
     * @tc.name   partialCategoryFStillAbsent
     * @tc.desc   When the import failed before category F, the F group has no rows at all.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('partialCategoryFStillAbsent', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 10));
      store.failNextBatch = true;
      store.batchInsert(true, seed.slice(10, 15));
      expect(SearchEngine.countCategory(store.rows, CATEGORY_F)).assertEqual(0);
      expect(SearchEngine.countCategory(store.rows, CATEGORY_D)).assertEqual(2);
      expect(SearchEngine.groupByCategory(store.rows).indexOf(CATEGORY_F)).assertEqual(-1);
      expect(store.rowCount()).assertEqual(10);
      logStep('partialBatchFailureTest', 'category F stays absent');
    });

    /**
     * @tc.name   repeatedPartialImportsKeepPrefixOrder
     * @tc.desc   Three successful prefixes interleaved with failures keep the committed order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('repeatedPartialImportsKeepPrefixOrder', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 2));
      store.failNextBatch = true;
      store.batchInsert(true, seed.slice(2, 5));
      store.batchInsert(true, seed.slice(5, 7));
      store.failNextBatch = true;
      store.batchInsert(true, seed.slice(7, 10));
      store.batchInsert(true, seed.slice(10, 12));
      expect(joined(store.names())).assertEqual('艾德里安,阿诺德,卡梅隆,康纳,艾登,艾拉');
      expect(store.rowCount()).assertEqual(6);
      expect(store.batchCalls).assertEqual(5);
      logStep('partialBatchFailureTest', 'repeated partials keep prefix order');
    });

    /**
     * @tc.name   failedChunkAfterCommittedHasNoOverlap
     * @tc.desc   The failed chunk shares no name with the committed prefix, so no row is written twice.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PartialBatchFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failedChunkAfterCommittedHasNoOverlap', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 9));
      store.failNextBatch = true;
      store.batchInsert(true, seed.slice(9, 15));
      const names = store.names();
      expect(names.length).assertEqual(9);
      expect(uniqueStrings(names).length).assertEqual(9);
      expect(countOf(names, '丹尼尔')).assertEqual(1);
      expect(countOf(names, '艾登')).assertEqual(0);
      logStep('partialBatchFailureTest', 'no overlap between committed and failed rows');
    });
  });
}
