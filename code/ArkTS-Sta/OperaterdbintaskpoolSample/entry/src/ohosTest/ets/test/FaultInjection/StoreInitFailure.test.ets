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
 * FaultInjection / StoreInitFailure suite.
 *
 * getRdbStore can reject before the table exists. initRdbStore logs and returns,
 * every later wrapper then takes its fallback, and the first retry with a valid
 * context must open the store and create the table exactly once. The suite keeps
 * the failure and the recovery in the same case so the counters cannot drift.
 *
 * Source anchors:
 *   DatabaseConnection.ets:81-88    getRdbStore catch returns early
 *   DatabaseConnection.ets:94-107   createTable only after a successful open
 *   SharedDriver.ets:535-547        StoreDouble.init contract
 *   SharedDriver.ets:561-573        batch insert retries init
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import {
  CATEGORY_A,
  CATEGORY_B,
  CATEGORY_C,
  ERROR_STORE_INIT,
  ERROR_TABLE_MISSING,
  ERROR_NONE,
  OperationCatalog,
  createSeedContacts,
  contactOf,
  contactNames,
  joined,
  fallbackForOperation,
  wrappedQueryResult,
  wrappedBatchCount,
  snapshotsOf,
  StoreDouble,
  ContactMetrics,
  resetContactManager
} from '../Shared/SharedDriver';

export default function storeInitFailureTest(): void {
  describe('StoreInitFailure', () => {
    beforeAll(() => {
      logSuite('StoreInitFailure', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('StoreInitFailure', 'end');
    });

    /**
     * @tc.name   failedInitReturnsFalse
     * @tc.desc   The first init with a bad context reports false and leaves the store closed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failedInitReturnsFalse', 0, () => {
      const store = new StoreDouble();
      expect(store.init(false)).assertFalse();
      expect(store.initialized).assertFalse();
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(0);
      logStep('storeInitFailureTest', 'failed init reports false');
    });

    /**
     * @tc.name   failedBatchReturnsMinusOne
     * @tc.desc   A batch on a never opened store reports minus one and writes no rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failedBatchReturnsMinusOne', 0, () => {
      const store = new StoreDouble();
      const written = store.batchInsert(false, createSeedContacts().slice(0, 4));
      expect(written).assertEqual(-1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(0);
      logStep('storeInitFailureTest', 'failed batch reports minus one');
    });

    /**
     * @tc.name   wrapperTurnsFailureIntoZero
     * @tc.desc   The batch wrapper maps the negative count to the zero fallback from TaskPool.ets.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('wrapperTurnsFailureIntoZero', 0, () => {
      const store = new StoreDouble();
      expect(wrappedBatchCount(false, store, createSeedContacts())).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.batchCalls).assertEqual(1);
      expect(store.initialized).assertFalse();
      logStep('storeInitFailureTest', 'wrapper maps failure to zero');
    });

    /**
     * @tc.name   retryAfterFailureSucceeds
     * @tc.desc   A valid init after one failure opens the store and creates the table once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('retryAfterFailureSucceeds', 0, () => {
      const store = new StoreDouble();
      expect(store.init(false)).assertFalse();
      expect(store.init(true)).assertTrue();
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      logStep('storeInitFailureTest', 'retry after failure opens the store');
    });

    /**
     * @tc.name   failedInitThenQueryEmpty
     * @tc.desc   A query after a failed init returns the empty fallback and is counted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('failedInitThenQueryEmpty', 0, () => {
      const store = new StoreDouble();
      store.init(false);
      const rows = store.query(true);
      expect(rows.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(store.initialized).assertFalse();
      expect(joined(contactNames(rows))).assertEqual('');
      logStep('storeInitFailureTest', 'query after failure is empty');
    });

    /**
     * @tc.name   tableStepSkippedOnFailure
     * @tc.desc   Three failed attempts never reach the create-table step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('tableStepSkippedOnFailure', 0, () => {
      const store = new StoreDouble();
      store.init(false);
      store.init(false);
      store.init(false);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.initCalls).assertEqual(3);
      expect(store.initialized).assertFalse();
      expect(store.lastContextValid).assertFalse();
      logStep('storeInitFailureTest', 'table step is skipped on failure');
    });

    /**
     * @tc.name   openStoreSurvivesLaterFailure
     * @tc.desc   A failed re-init after a successful open does not close the store or drop its rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('openStoreSurvivesLaterFailure', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 5));
      expect(store.init(false)).assertFalse();
      expect(store.initialized).assertTrue();
      expect(store.rowCount()).assertEqual(5);
      expect(store.query(true).length).assertEqual(5);
      logStep('storeInitFailureTest', 'open store survives a later failure');
    });

    /**
     * @tc.name   failedInsertReportsMinusOne
     * @tc.desc   An insert on a closed store reports minus one and records the call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedInsertReportsMinusOne', 0, () => {
      const store = new StoreDouble();
      const written = store.insert(false, contactOf('莫川', '13100000041', 'mochuan.fail@example.com',
        '贵州省毕节市七星关区', '', CATEGORY_A), 'ON_CONFLICT_REPLACE');
      expect(written).assertEqual(-1);
      expect(store.insertCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.initCalls).assertEqual(1);
      logStep('storeInitFailureTest', 'failed insert reports minus one');
    });

    /**
     * @tc.name   insertRetrySucceedsAfterFailure
     * @tc.desc   The same insert succeeds on the retry with a valid context and appends one row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('insertRetrySucceedsAfterFailure', 0, () => {
      const store = new StoreDouble();
      const row = contactOf('莫水', '13100000042', 'moshui.fail@example.com', '贵州省安顺市西秀区', '', CATEGORY_B);
      expect(store.insert(false, row, 'ON_CONFLICT_REPLACE')).assertEqual(-1);
      expect(store.insert(true, row, 'ON_CONFLICT_REPLACE')).assertEqual(1);
      expect(store.rowCount()).assertEqual(1);
      expect(store.rows[0].name).assertEqual('莫水');
      expect(store.insertCalls).assertEqual(2);
      logStep('storeInitFailureTest', 'insert retry succeeds');
    });

    /**
     * @tc.name   failedStoreMetricsAreZero
     * @tc.desc   A closed store reports zero totals through the metrics view.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedStoreMetricsAreZero', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(false, createSeedContacts());
      const metrics = ContactMetrics.from(store.rows);
      expect(metrics.total).assertEqual(0);
      expect(metrics.uniqueNames).assertEqual(0);
      expect(metrics.categories).assertEqual(0);
      expect(metrics.fingerprint() === ContactMetrics.from(createSeedContacts()).fingerprint()).assertFalse();
      logStep('storeInitFailureTest', 'failed store reports zero metrics');
    });

    /**
     * @tc.name   deleteOnClosedStoreIsNoOp
     * @tc.desc   deleteByName on a closed store removes nothing and increments its counter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteOnClosedStoreIsNoOp', 0, () => {
      const store = new StoreDouble();
      store.init(false);
      expect(store.deleteByName('贝拉')).assertEqual(0);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.initialized).assertFalse();
      logStep('storeInitFailureTest', 'delete on a closed store is a no-op');
    });

    /**
     * @tc.name   initAfterResetReopensOnce
     * @tc.desc   Reset closes the store, and the next init opens it and creates the table again once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('initAfterResetReopensOnce', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      store.reset();
      expect(store.initCalls).assertEqual(0);
      expect(store.init(true)).assertTrue();
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      logStep('storeInitFailureTest', 'reset then init reopens once');
    });

    /**
     * @tc.name   createTableNeverRunsTwice
     * @tc.desc   No mix of valid and invalid attempts creates the table more than once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('createTableNeverRunsTwice', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.init(false);
      store.init(true);
      store.init(false);
      store.init(true);
      expect(store.initCalls).assertEqual(5);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(store.lastContextValid).assertTrue();
      logStep('storeInitFailureTest', 'table creation never repeats');
    });

    /**
     * @tc.name   lastContextFlagTracksLatestAttempt
     * @tc.desc   The stored context flag reflects the most recent attempt, not the successful one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('lastContextFlagTracksLatestAttempt', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      expect(store.lastContextValid).assertTrue();
      store.init(false);
      expect(store.lastContextValid).assertFalse();
      store.init(true);
      expect(store.lastContextValid).assertTrue();
      expect(store.initialized).assertTrue();
      logStep('storeInitFailureTest', 'context flag follows the latest attempt');
    });

    /**
     * @tc.name   failedInitFallbackCodes
     * @tc.desc   The error helpers distinguish a store init failure from a missing table.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failedInitFallbackCodes', 0, () => {
      expect(ERROR_STORE_INIT).assertEqual(14800011);
      expect(ERROR_TABLE_MISSING).assertEqual(14800001);
      expect(fallbackForOperation(OperationCatalog.INIT_STORE, ERROR_STORE_INIT)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.BATCH_INSERT, ERROR_TABLE_MISSING)).assertEqual(0);
      expect(fallbackForOperation(OperationCatalog.INIT_STORE, ERROR_NONE)).assertEqual(0);
      logStep('storeInitFailureTest', 'error codes map to fallbacks');
    });

    /**
     * @tc.name   batchRecoversAfterFailedInit
     * @tc.desc   A rejected batch and a successful retry leave exactly the chunk rows in the store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchRecoversAfterFailedInit', 0, () => {
      const store = new StoreDouble();
      const chunk = createSeedContacts().slice(0, 8);
      expect(wrappedBatchCount(false, store, chunk)).assertEqual(0);
      expect(wrappedBatchCount(true, store, chunk)).assertEqual(8);
      expect(store.rowCount()).assertEqual(8);
      expect(joined(contactNames(store.rows))).assertEqual(joined(contactNames(chunk)));
      expect(store.createTableCalls).assertEqual(1);
      logStep('storeInitFailureTest', 'batch recovers after a failed init');
    });

    /**
     * @tc.name   failedThenSuccessfulQueryTrail
     * @tc.desc   The query trail records empty, empty, then the recovered rows after the retry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failedThenSuccessfulQueryTrail', 0, () => {
      const store = new StoreDouble();
      store.init(false);
      expect(store.query(true).length).assertEqual(0);
      expect(wrappedBatchCount(true, store, createSeedContacts().slice(0, 2))).assertEqual(2);
      expect(store.query(true).length).assertEqual(2);
      expect(store.queryCalls).assertEqual(2);
      expect(store.rows[1].name).assertEqual('阿诺德');
      logStep('storeInitFailureTest', 'query trail recovers after the retry');
    });

    /**
     * @tc.name   closedStoreUpdateCountsOnly
     * @tc.desc   An update on a closed store counts the call and matches no row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('closedStoreUpdateCountsOnly', 0, () => {
      const store = new StoreDouble();
      const affected = store.updateContact(contactOf('裴照', '13200000051', 'peizhao.closed@example.com',
        '山西省晋城市城区', '', CATEGORY_C));
      expect(affected).assertEqual(0);
      expect(store.updateCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.initialized).assertFalse();
      logStep('storeInitFailureTest', 'closed store update counts only');
    });

    /**
     * @tc.name   insertAutoInitRecoversClosedStore
     * @tc.desc   The first insert with a valid context initialises the store and appends the row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('insertAutoInitRecoversClosedStore', 0, () => {
      const store = new StoreDouble();
      expect(store.initialized).assertFalse();
      expect(store.insert(true, contactOf('裴云', '13200000052', 'peiyun.closed@example.com',
        '山西省朔州市朔城区', '', CATEGORY_C), 'ON_CONFLICT_REPLACE')).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(1);
      logStep('storeInitFailureTest', 'insert auto-init recovers the store');
    });

    /**
     * @tc.name   resetStoreMetricsAreZero
     * @tc.desc   After a reset the metrics view is empty even though the store object survives.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetStoreMetricsAreZero', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      store.reset();
      const metrics = ContactMetrics.from(store.rows);
      expect(metrics.total).assertEqual(0);
      expect(metrics.uniqueNames).assertEqual(0);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.categories).assertEqual(0);
      logStep('storeInitFailureTest', 'reset store metrics are zero');
    });

    /**
     * @tc.name   failedInitThenDeleteThenBatch
     * @tc.desc   A failed init, a no-op delete and a successful batch leave two rows in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failedInitThenDeleteThenBatch', 0, () => {
      const store = new StoreDouble();
      expect(store.init(false)).assertFalse();
      expect(store.deleteByName('贝拉')).assertEqual(0);
      expect(wrappedBatchCount(true, store, createSeedContacts().slice(0, 2))).assertEqual(2);
      expect(store.rowCount()).assertEqual(2);
      expect(store.names()[0]).assertEqual('艾德里安');
      expect(store.deleteCalls).assertEqual(1);
      logStep('storeInitFailureTest', 'failed init then delete then batch');
    });

    /**
     * @tc.name   reopenAfterResetQueriesEmpty
     * @tc.desc   Reopening a reset store gives an open store with zero rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('reopenAfterResetQueriesEmpty', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 5));
      store.reset();
      expect(store.init(true)).assertTrue();
      expect(store.query(true).length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      logStep('storeInitFailureTest', 'reopened store has no rows');
    });

    /**
     * @tc.name   recoveryKeepsCountersConsistent
     * @tc.desc   After one failure and one success the counters show two inits, one batch and one table.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('recoveryKeepsCountersConsistent', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(false, createSeedContacts().slice(0, 3));
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      expect(store.initCalls).assertEqual(2);
      expect(store.batchCalls).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(3);
      logStep('storeInitFailureTest', 'recovery keeps counters consistent');
    });

    /**
     * @tc.name   failedStoreQueryWrapperEmpty
     * @tc.desc   The query wrapper over a closed store returns the empty array, not an exception.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failedStoreQueryWrapperEmpty', 0, () => {
      const store = new StoreDouble();
      store.init(false);
      const rows = wrappedQueryResult(true, store);
      expect(rows.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(store.initialized).assertFalse();
      expect(store.rowCount()).assertEqual(0);
      logStep('storeInitFailureTest', 'wrapper over a closed store is empty');
    });

    /**
     * @tc.name   closedStoreSnapshotIsEmpty
     * @tc.desc   A store that never opened has an empty snapshot and no names to describe.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('closedStoreSnapshotIsEmpty', 0, () => {
      const store = new StoreDouble();
      store.init(false);
      expect(snapshotsOf(store.rows).length).assertEqual(0);
      expect(store.names().length).assertEqual(0);
      expect(joined(store.names())).assertEqual('');
      expect(store.rowCount()).assertEqual(0);
      logStep('storeInitFailureTest', 'closed store snapshot is empty');
    });

    /**
     * @tc.name   failedInitFollowedByInsertTrail
     * @tc.desc   A failed init, a failed insert and a successful insert leave one row and two insert calls.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failedInitFollowedByInsertTrail', 0, () => {
      const store = new StoreDouble();
      store.init(false);
      const row = contactOf('裴风', '13200000071', 'peifeng.init@example.com', '山西省吕梁市离石区', '', CATEGORY_B);
      expect(store.insert(false, row, 'ON_CONFLICT_REPLACE')).assertEqual(-1);
      expect(store.insert(true, row, 'ON_CONFLICT_REPLACE')).assertEqual(1);
      expect(store.insertCalls).assertEqual(2);
      expect(store.rowCount()).assertEqual(1);
      expect(store.rows[0].email).assertEqual('peifeng.init@example.com');
      logStep('storeInitFailureTest', 'failed init then insert trail');
    });

    /**
     * @tc.name   failedResetInitQueryOrder
     * @tc.desc   Reset, failed init, then a valid init opens the store with the table created once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the StoreInitFailure scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failedResetInitQueryOrder', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.reset();
      expect(store.init(false)).assertFalse();
      expect(store.init(true)).assertTrue();
      expect(store.initCalls).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.query(true).length).assertEqual(0);
      logStep('storeInitFailureTest', 'reset then failed then valid init');
    });
  });
}
