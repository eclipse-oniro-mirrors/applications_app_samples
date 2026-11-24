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
 * FaultInjection / MissingContextFaults suite.
 *
 * Every production entry point logs a null context and keeps going. Query and
 * batch insert then return their empty fallbacks, while delete and update still
 * run because they never guard the context. The suite injects the missing
 * context at each entry point and checks the exact fallback the page observes.
 *
 * Source anchors:
 *   DatabaseConnection.ets:69-74    init returns on a missing context
 *   DatabaseConnection.ets:116-122  query returns [] on a missing context
 *   DatabaseConnection.ets:139-148  batch insert logs and retries init
 *   DatabaseConnection.ets:226-236  delete has no context guard
 *   SharedDriver.ets:955-958        continuesWithoutContext oracle
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  CATEGORY_A,
  CATEGORY_B,
  CATEGORY_C,
  OperationCatalog,
  TaskPoolQueue,
  ERROR_CONTEXT_MISSING,
  ERROR_NONE,
  ERROR_SQL_EXECUTION,
  createSeedContacts,
  contactOf,
  contactNames,
  joined,
  snapshotsOf,
  sameSnapshotArray,
  continuesWithoutContext,
  fallbackForOperation,
  wrappedQueryResult,
  wrappedBatchCount,
  StoreDouble,
  ContactMetrics,
  resetContactManager
} from '../Shared/SharedDriver';

export default function missingContextFaultsTest(): void {
  describe('MissingContextFaults', () => {
    beforeAll(() => {
      logSuite('MissingContextFaults', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('MissingContextFaults', 'end');
    });

    /**
     * @tc.name   missingContextQueryReturnsEmpty
     * @tc.desc   A query without a usable context returns the empty array and stores no rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('missingContextQueryReturnsEmpty', 0, () => {
      const store = new StoreDouble();
      const rows = store.query(false);
      expect(rows.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.initialized).assertFalse();
      logStep('missingContextFaultsTest', 'missing context yields an empty query');
    });

    /**
     * @tc.name   missingContextBatchReturnsMinusOne
     * @tc.desc   A batch insert without a context reports the negative count the wrapper turns into zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('missingContextBatchReturnsMinusOne', 0, () => {
      const store = new StoreDouble();
      const written = store.batchInsert(false, createSeedContacts().slice(0, 5));
      expect(written).assertEqual(-1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.batchCalls).assertEqual(1);
      expect(wrappedBatchCount(false, store, createSeedContacts().slice(0, 5))).assertEqual(0);
      logStep('missingContextFaultsTest', 'missing context batch reports minus one');
    });

    /**
     * @tc.name   continuesWithoutContextIsTrue
     * @tc.desc   The oracle says a missing context keeps the page running.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('continuesWithoutContextIsTrue', 0, () => {
      expect(continuesWithoutContext(false)).assertTrue();
      expect(continuesWithoutContext(true)).assertFalse();
      expect(continuesWithoutContext(false) === continuesWithoutContext(true)).assertFalse();
      expect(OperationCatalog.all().length).assertEqual(8);
      logStep('missingContextFaultsTest', 'page continues without a context');
    });

    /**
     * @tc.name   initWithoutContextFails
     * @tc.desc   Init with a missing context returns false and never creates the table.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('initWithoutContextFails', 0, () => {
      const store = new StoreDouble();
      expect(store.init(false)).assertFalse();
      expect(store.createTableCalls).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.lastContextValid).assertFalse();
      logStep('missingContextFaultsTest', 'init fails without a context');
    });

    /**
     * @tc.name   openStoreQueryIgnoresMissingFlag
     * @tc.desc   Once opened, a query flagged with a missing context still short-circuits to empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('openStoreQueryIgnoresMissingFlag', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      const rows = store.query(false);
      expect(rows.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(4);
      expect(store.names()[0]).assertEqual('艾德里安');
      logStep('missingContextFaultsTest', 'open store still rejects a flagged query');
    });

    /**
     * @tc.name   openStoreBatchAcceptsRows
     * @tc.desc   The batch path only needs the context for init, so an open store writes the chunk anyway.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('openStoreBatchAcceptsRows', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const written = store.batchInsert(false, createSeedContacts().slice(0, 3));
      expect(written).assertEqual(3);
      expect(store.rowCount()).assertEqual(3);
      expect(store.initCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      logStep('missingContextFaultsTest', 'open store batch ignores the flag');
    });

    /**
     * @tc.name   deletePathHasNoContextGuard
     * @tc.desc   Delete by name removes the row because the delete path never reads the context.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deletePathHasNoContextGuard', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 5));
      expect(store.deleteByName('贝拉')).assertEqual(1);
      expect(store.rowCount()).assertEqual(4);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.names().indexOf('贝拉')).assertEqual(-1);
      logStep('missingContextFaultsTest', 'delete path ignores the context');
    });

    /**
     * @tc.name   updatePathHasNoContextGuard
     * @tc.desc   Update by name rewrites the row even though no context flag is supplied.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updatePathHasNoContextGuard', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      expect(store.updateContact(contactOf('卡梅隆', '17700000071', 'cameron.ctx@example.com',
        '陕西省榆林市榆阳区', '', CATEGORY_C))).assertEqual(1);
      expect(store.rows[5].phone).assertEqual('17700000071');
      expect(store.updateCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(15);
      logStep('missingContextFaultsTest', 'update path ignores the context');
    });

    /**
     * @tc.name   repeatedMissingContextStaysClosed
     * @tc.desc   Three failed inits leave the store closed and the table step at zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedMissingContextStaysClosed', 0, () => {
      const store = new StoreDouble();
      store.init(false);
      store.init(false);
      store.init(false);
      expect(store.initCalls).assertEqual(3);
      expect(store.initialized).assertFalse();
      expect(store.createTableCalls).assertEqual(0);
      expect(store.query(true).length).assertEqual(0);
      logStep('missingContextFaultsTest', 'repeated failures keep the store closed');
    });

    /**
     * @tc.name   missingContextDoesNotCallQuery
     * @tc.desc   The query wrapper returns before the store query, so queryCalls stays at zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('missingContextDoesNotCallQuery', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      const rows = wrappedQueryResult(false, store);
      expect(rows.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(0);
      expect(store.rowCount()).assertEqual(2);
      expect(joined(contactNames(rows))).assertEqual('');
      logStep('missingContextFaultsTest', 'wrapper short-circuits before the store');
    });

    /**
     * @tc.name   missingContextBatchCountedOnce
     * @tc.desc   A rejected batch still increments batchCalls exactly once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('missingContextBatchCountedOnce', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(false, createSeedContacts().slice(0, 2));
      expect(store.batchCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.lastContextValid).assertFalse();
      logStep('missingContextFaultsTest', 'rejected batch is counted once');
    });

    /**
     * @tc.name   queryFallbackIsMinusOne
     * @tc.desc   The fallback helper maps a query error to minus one while no error maps to zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryFallbackIsMinusOne', 0, () => {
      expect(fallbackForOperation(OperationCatalog.QUERY_ALL, ERROR_CONTEXT_MISSING)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.QUERY_ALL, ERROR_SQL_EXECUTION)).assertEqual(-1);
      expect(fallbackForOperation(OperationCatalog.QUERY_ALL, ERROR_NONE)).assertEqual(0);
      expect(ERROR_CONTEXT_MISSING).assertEqual(401);
      logStep('missingContextFaultsTest', 'query fallback is minus one');
    });

    /**
     * @tc.name   missingContextThenValidRecovers
     * @tc.desc   A rejected batch followed by a valid retry writes the same chunk once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('missingContextThenValidRecovers', 0, () => {
      const store = new StoreDouble();
      const chunk = createSeedContacts().slice(0, 6);
      expect(wrappedBatchCount(false, store, chunk)).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(wrappedBatchCount(true, store, chunk)).assertEqual(6);
      expect(store.rowCount()).assertEqual(6);
      expect(store.initCalls).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      logStep('missingContextFaultsTest', 'valid retry recovers the chunk');
    });

    /**
     * @tc.name   managerUnaffectedByMissingContext
     * @tc.desc   The singleton keeps its rows while every store call fails for a missing context.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('managerUnaffectedByMissingContext', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const before = snapshotsOf(manager.getContacts());
      const store = new StoreDouble();
      store.init(false);
      store.batchInsert(false, createSeedContacts());
      store.query(false);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), before)).assertTrue();
      expect(manager.getContacts().length).assertEqual(15);
      expect(store.rowCount()).assertEqual(0);
      logStep('missingContextFaultsTest', 'manager state is independent of the store');
    });

    /**
     * @tc.name   snapshotUnchangedAfterFaults
     * @tc.desc   An opened store keeps its rows byte for byte after a flagged query.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('snapshotUnchangedAfterFaults', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      const before = snapshotsOf(store.rows);
      store.query(false);
      store.query(false);
      expect(sameSnapshotArray(snapshotsOf(store.rows), before)).assertTrue();
      expect(store.queryCalls).assertEqual(2);
      expect(ContactMetrics.from(store.rows).total).assertEqual(15);
      logStep('missingContextFaultsTest', 'faulty queries leave rows intact');
    });

    /**
     * @tc.name   missingContextDoesNotCreateTable
     * @tc.desc   A rejected batch after a rejected init never reaches the table step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('missingContextDoesNotCreateTable', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(false, createSeedContacts().slice(0, 3));
      expect(store.createTableCalls).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.initCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      logStep('missingContextFaultsTest', 'table step is skipped on a fault');
    });

    /**
     * @tc.name   missingContextInitCanBeRetried
     * @tc.desc   A failed init followed by a valid init opens the store and creates the table once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('missingContextInitCanBeRetried', 0, () => {
      const store = new StoreDouble();
      expect(store.init(false)).assertFalse();
      expect(store.init(true)).assertTrue();
      expect(store.initialized).assertTrue();
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(2);
      logStep('missingContextFaultsTest', 'init retry after a fault succeeds');
    });

    /**
     * @tc.name   missingContextBatchKeepsNamesEmpty
     * @tc.desc   After a rejected chunk the store name view stays empty and no row is appended.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('missingContextBatchKeepsNamesEmpty', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(false, createSeedContacts());
      expect(store.names().length).assertEqual(0);
      expect(joined(store.names())).assertEqual('');
      expect(store.rowCount()).assertEqual(0);
      expect(store.batchCalls).assertEqual(1);
      logStep('missingContextFaultsTest', 'rejected chunk leaves no names');
    });

    /**
     * @tc.name   deleteMissingNameReportsZeroWithoutContext
     * @tc.desc   The unguarded delete path reports zero for an absent name and leaves the rows alone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteMissingNameReportsZeroWithoutContext', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      expect(store.deleteByName('林岸')).assertEqual(0);
      expect(store.rowCount()).assertEqual(4);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.names()[3]).assertEqual('本');
      logStep('missingContextFaultsTest', 'unguarded delete of a missing name is zero');
    });

    /**
     * @tc.name   missingContextBatchFallbackIsZero
     * @tc.desc   The batch wrapper turns the negative store count into the documented zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('missingContextBatchFallbackIsZero', 0, () => {
      const store = new StoreDouble();
      const chunk = createSeedContacts().slice(0, 7);
      expect(store.batchInsert(false, chunk)).assertEqual(-1);
      expect(wrappedBatchCount(false, store, chunk)).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.batchCalls).assertEqual(2);
      logStep('missingContextFaultsTest', 'batch fallback is zero not minus one');
    });

    /**
     * @tc.name   missingContextMetricsStayZero
     * @tc.desc   After a rejected chunk the metrics view reports zero for every aggregate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('missingContextMetricsStayZero', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(false, createSeedContacts());
      const metrics = ContactMetrics.from(store.rows);
      expect(metrics.total).assertEqual(0);
      expect(metrics.uniqueNames).assertEqual(0);
      expect(metrics.categories).assertEqual(0);
      expect(metrics.fillRatio()).assertEqual(0);
      logStep('missingContextFaultsTest', 'rejected chunk keeps metrics at zero');
    });

    /**
     * @tc.name   updateAfterFaultStillCounts
     * @tc.desc   A failed init does not block the update path, which counts its call and touches no rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('updateAfterFaultStillCounts', 0, () => {
      const store = new StoreDouble();
      store.init(false);
      const affected = store.updateContact(contactOf('贝拉', '11111110001', 'bella.fault@example.com',
        '湖北省鄂州市鄂城区', '', CATEGORY_B));
      expect(affected).assertEqual(0);
      expect(store.updateCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.initialized).assertFalse();
      logStep('missingContextFaultsTest', 'update after a fault counts but matches nothing');
    });

    /**
     * @tc.name   twoFlaggedQueriesKeepStoreOpen
     * @tc.desc   Flagged queries leave the store open so a later valid query returns the rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('twoFlaggedQueriesKeepStoreOpen', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      expect(store.query(false).length).assertEqual(0);
      expect(store.query(false).length).assertEqual(0);
      expect(store.initialized).assertTrue();
      expect(store.query(true).length).assertEqual(3);
      expect(store.queryCalls).assertEqual(3);
      logStep('missingContextFaultsTest', 'flagged queries do not close the store');
    });

    /**
     * @tc.name   flaggedQueryThenInsertOrder
     * @tc.desc   A flagged query between two inserts still reports empty while the rows accumulate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('flaggedQueryThenInsertOrder', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.insert(true, contactOf('裴照', '13200000041', 'peizhao.ctx@example.com', '山西省忻州市忻府区', '', CATEGORY_A),
        'ON_CONFLICT_REPLACE');
      expect(store.query(false).length).assertEqual(0);
      store.insert(true, contactOf('裴云', '13200000042', 'peiyun.ctx@example.com', '山西省临汾市尧都区', '', CATEGORY_B),
        'ON_CONFLICT_REPLACE');
      expect(store.rowCount()).assertEqual(2);
      expect(store.query(true).length).assertEqual(2);
      expect(store.insertCalls).assertEqual(2);
      logStep('missingContextFaultsTest', 'flagged query does not disturb inserts');
    });

    /**
     * @tc.name   missingContextTraceAddsFailedEntry
     * @tc.desc   A task that fails for a missing context is listed under failed and not under completed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('missingContextTraceAddsFailedEntry', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.QUERY_ALL);
      queue.runNext();
      queue.fail(OperationCatalog.QUERY_ALL);
      expect(queue.failed.length).assertEqual(1);
      expect(queue.completed.length).assertEqual(0);
      expect(queue.trace()).assertEqual('');
      expect(queue.size()).assertEqual(0);
      logStep('missingContextFaultsTest', 'missing context failure stays off the trace');
    });

    /**
     * @tc.name   missingContextBatchAfterOpenKeepsTail
     * @tc.desc   A flagged chunk on an open store appends at the tail like any other chunk.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('missingContextBatchAfterOpenKeepsTail', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      store.batchInsert(false, createSeedContacts().slice(2, 4));
      expect(store.rowCount()).assertEqual(4);
      expect(store.names()[2]).assertEqual('贝拉');
      expect(store.names()[3]).assertEqual('本');
      expect(store.batchCalls).assertEqual(2);
      logStep('missingContextFaultsTest', 'flagged chunk appends on an open store');
    });

    /**
     * @tc.name   missingContextFallbackCountIsStable
     * @tc.desc   Two rejected chunks both report the zero fallback and leave the store empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the MissingContextFaults scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('missingContextFallbackCountIsStable', 0, () => {
      const store = new StoreDouble();
      const chunk = createSeedContacts().slice(0, 6);
      expect(wrappedBatchCount(false, store, chunk)).assertEqual(0);
      expect(wrappedBatchCount(false, store, chunk)).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.batchCalls).assertEqual(2);
      logStep('missingContextFaultsTest', 'repeated fallbacks are stable');
    });
  });
}
