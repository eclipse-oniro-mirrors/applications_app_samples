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
 * ConnectionLifecycleValidation pins the initialization contract of the store.
 *
 * Production anchors:
 *   DatabaseConnection.ets:57-62    getInstance keeps one connection object
 *   DatabaseConnection.ets:69-74    initRdbStore returns early without a context
 *   DatabaseConnection.ets:76-79    a second initRdbStore returns early because the
 *                                   store already exists
 *   DatabaseConnection.ets:81-88    getRdbStore then createTable, catch returns
 *   DatabaseConnection.ets:94-107   createTable executes SQL_CREATE_TABLE once
 *   DatabaseConnection.ets:145-148  batchInsertData initializes on demand
 *   DatabaseConnection.ets:247-250  updateData initializes on demand
 *   RdbConstant.ets:31-38           table, database file and ability literals
 *
 * StoreDouble exposes the same early returns as observable counters: initCalls
 * counts attempts, createTableCalls counts successful table creation and the
 * initialized flag mirrors "rdbStore is exist".
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import {
  StoreDouble,
  createSeedContacts,
  contactOf,
  contactNames,
  sameStringArray,
  joined,
  resetContactManager,
  STORE_NAME,
  STORE_ABILITY,
  TABLE_CONTACT,
  INITIAL_STORE_VALUE,
  wrappedQueryResult
} from '../Shared/SharedDriver';

export default function connectionLifecycleValidationTest(): void {
  describe('ConnectionLifecycleValidation', () => {
    let store: StoreDouble = new StoreDouble();

    beforeAll(() => {
      logSuite('ConnectionLifecycleValidation', 'begin');
    });

    beforeEach(async () => {
      resetContactManager();
      store = new StoreDouble();
      store.reset();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      logSuite('ConnectionLifecycleValidation', 'end');
    });

    /**
     * @tc.name   freshStoreStartsUninitialized
     * @tc.desc   A newly constructed store reports no initialization, no rows and zero for
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            every lifecycle counter.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('freshStoreStartsUninitialized', 0, () => {
      expect(store.initialized).assertFalse();
      expect(store.initCalls).assertEqual(INITIAL_STORE_VALUE);
      expect(store.createTableCalls).assertEqual(INITIAL_STORE_VALUE);
      expect(store.queryCalls).assertEqual(0);
      expect(store.insertCalls).assertEqual(0);
      expect(store.batchCalls).assertEqual(0);
      expect(store.updateCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.lastContextValid).assertFalse();
      expect(store.rows.length).assertEqual(0);
      expect(store.names().length).assertEqual(0);
      expect(store.initialized === false).assertTrue();
    });

    /**
     * @tc.name   initWithValidContextReturnsTrue
     * @tc.desc   The first initialization with a valid context reports success, flips the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            initialized flag and performs the table creation step.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('initWithValidContextReturnsTrue', 0, () => {
      const created: boolean = store.init(true);
      expect(created).assertTrue();
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.lastContextValid).assertTrue();
      expect(store.rowCount()).assertEqual(0);
      expect(store.queryCalls).assertEqual(0);
      expect(store.batchCalls).assertEqual(0);
      expect(store.names().length).assertEqual(0);
      expect(store.initialized === true).assertTrue();
      logStep('ConnectionLifecycleValidation', 'valid init created the table');
    });

    /**
     * @tc.name   initWithInvalidContextReturnsFalse
     * @tc.desc   A rejected context makes initialization report false and leaves the store
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            uninitialized without creating the table.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('initWithInvalidContextReturnsFalse', 0, () => {
      const created: boolean = store.init(false);
      expect(created).assertFalse();
      expect(store.initialized).assertFalse();
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.lastContextValid).assertFalse();
      expect(store.rowCount()).assertEqual(0);
      expect(store.rows.length).assertEqual(0);
      expect(store.initialized === false).assertTrue();
      expect(store.names().length).assertEqual(0);
    });

    /**
     * @tc.name   initIncrementsInitCallsForEveryAttempt
     * @tc.desc   Three initialization attempts, valid or not, are each counted even though
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            only the first valid one performs work.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('initIncrementsInitCallsForEveryAttempt', 0, () => {
      store.init(false);
      store.init(true);
      store.init(true);
      expect(store.initCalls).assertEqual(3);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(joined(store.names(), ',')).assertEqual('');
    });

    /**
     * @tc.name   initSecondCallIsNoOp
     * @tc.desc   The second init call reports false because the store already exists, matching
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the "rdbStore is exist" early return in the production method.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('initSecondCallIsNoOp', 0, () => {
      expect(store.init(true)).assertTrue();
      const second: boolean = store.init(true);
      expect(second).assertFalse();
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.lastContextValid).assertTrue();
      expect(store.insertCalls).assertEqual(0);
      expect(store.updateCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
      expect(store.queryCalls).assertEqual(0);
    });

    /**
     * @tc.name   initCreatesTableExactlyOnce
     * @tc.desc   No matter how many initialization calls arrive, the table creation counter
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            stays at one because creation is only reached after a successful store open.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('initCreatesTableExactlyOnce', 0, () => {
      for (let attempt = 0; attempt < 5; attempt++) {
        store.init(true);
      }
      expect(store.initCalls).assertEqual(5);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(store.rows.length).assertEqual(0);
      expect(store.initCalls > store.createTableCalls).assertTrue();
      expect(store.initialized === true).assertTrue();
      expect(store.lastContextValid).assertTrue();
      expect(store.names().length).assertEqual(0);
    });

    /**
     * @tc.name   initRecordsLastContextValidity
     * @tc.desc   The last context flag follows the most recent attempt: a rejected attempt
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            after a valid one records false without dropping the initialized state.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('initRecordsLastContextValidity', 0, () => {
      const other: StoreDouble = new StoreDouble();
      store.init(false);
      expect(store.lastContextValid).assertFalse();
      store.init(true);
      expect(store.lastContextValid).assertTrue();
      other.init(true);
      expect(other.lastContextValid).assertTrue();
      other.init(false);
      expect(other.lastContextValid).assertFalse();
      expect(store.initialized).assertTrue();
      expect(other.initialized).assertTrue();
    });

    /**
     * @tc.name   invalidInitDoesNotCreateTable
     * @tc.desc   Three rejected attempts never reach table creation, so the counter stays at
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            zero and the store remains closed for business.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('invalidInitDoesNotCreateTable', 0, () => {
      store.init(false);
      store.init(false);
      store.init(false);
      expect(store.initCalls).assertEqual(3);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.lastContextValid).assertFalse();
      expect(store.query(true).length).assertEqual(0);
      expect(store.initCalls).assertEqual(3);
    });

    /**
     * @tc.name   invalidInitAfterValidInitKeepsInitializedFlag
     * @tc.desc   A rejected attempt after the store is open reports false but the store stays
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            usable and no second table creation happens.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('invalidInitAfterValidInitKeepsInitializedFlag', 0, () => {
      store.init(true);
      const second: boolean = store.init(false);
      expect(second).assertFalse();
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.lastContextValid).assertFalse();
      expect(store.batchInsert(true, createSeedContacts().slice(0, 2))).assertEqual(2);
      expect(store.rowCount()).assertEqual(2);
    });

    /**
     * @tc.name   initReturnSequenceMarksOnlyTheFirstSuccess
     * @tc.desc   Four initialization calls return true once and false afterwards, so callers
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            can tell who actually opened the store.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('initReturnSequenceMarksOnlyTheFirstSuccess', 0, () => {
      const results: boolean[] = [];
      for (let attempt = 0; attempt < 4; attempt++) {
        results.push(store.init(true));
      }
      expect(results.length).assertEqual(4);
      expect(results[0]).assertTrue();
      expect(results[1]).assertFalse();
      expect(results[2]).assertFalse();
      expect(results[3]).assertFalse();
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(4);
    });

    /**
     * @tc.name   firstInitAfterTwoRejectionsSucceeds
     * @tc.desc   Rejected attempts do not poison the store: a later valid attempt opens it,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            creates the table once and reports success.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('firstInitAfterTwoRejectionsSucceeds', 0, () => {
      const first: boolean = store.init(false);
      const second: boolean = store.init(false);
      expect(first).assertFalse();
      expect(second).assertFalse();
      expect(store.initialized).assertFalse();
      const third: boolean = store.init(true);
      expect(third).assertTrue();
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(3);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.lastContextValid).assertTrue();
    });

    /**
     * @tc.name   queryBeforeInitCountsCallAndReturnsEmpty
     * @tc.desc   The query path counts its call but returns an empty array on a store that was
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            never initialized, because there are no rows to copy.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryBeforeInitCountsCallAndReturnsEmpty', 0, () => {
      const rows: Contact[] = store.query(true);
      expect(rows.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(store.initialized).assertFalse();
      expect(store.initCalls).assertEqual(0);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.names().length).assertEqual(0);
      expect(store.rows.length).assertEqual(0);
    });

    /**
     * @tc.name   queryInvalidContextReturnsEmptyArray
     * @tc.desc   With stored rows present, a rejected query context still yields an empty
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            array and does not modify the stored rows.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryInvalidContextReturnsEmptyArray', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      const rows: Contact[] = store.query(false);
      expect(rows.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(3);
      expect(store.initialized).assertTrue();
      expect(store.batchCalls).assertEqual(1);
      expect(rows === store.rows).assertFalse();
    });

    /**
     * @tc.name   queryValidContextReturnsStoredRows
     * @tc.desc   A valid query context returns every stored row in insertion order and leaves
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the batch accounting untouched.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryValidContextReturnsStoredRows', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 3);
      store.batchInsert(true, seed);
      const rows: Contact[] = store.query(true);
      expect(rows.length).assertEqual(3);
      expect(sameStringArray(contactNames(rows), contactNames(seed))).assertTrue();
      expect(rows[2].name).assertEqual('贝拉');
      expect(store.queryCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(3);
    });

    /**
     * @tc.name   queryCallsAccumulateAcrossMixedContexts
     * @tc.desc   Four queries alternating valid and rejected contexts are all counted while
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            only the valid ones return the stored rows.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryCallsAccumulateAcrossMixedContexts', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 4);
      store.batchInsert(true, seed);
      expect(store.query(true).length).assertEqual(4);
      expect(store.query(false).length).assertEqual(0);
      expect(store.query(true).length).assertEqual(4);
      expect(store.query(false).length).assertEqual(0);
      expect(store.queryCalls).assertEqual(4);
      expect(store.rowCount()).assertEqual(4);
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   batchInsertTriggersInitAndCountsBothPaths
     * @tc.desc   The on-demand initialization inside batchInsertData shows up as one init and
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            one create-table step on a fresh store, alongside the batch counter.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertTriggersInitAndCountsBothPaths', 0, () => {
      expect(store.initialized).assertFalse();
      const written: number = store.batchInsert(true, createSeedContacts().slice(0, 2));
      expect(written).assertEqual(2);
      expect(store.initCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(store.insertCalls).assertEqual(0);
      expect(store.rowCount()).assertEqual(2);
    });

    /**
     * @tc.name   insertOnUninitializedStoreInitializes
     * @tc.desc   A single insert on a fresh store runs the same on-demand initialization and
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            then reports the current row total as its row identifier.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('insertOnUninitializedStoreInitializes', 0, () => {
      const rowId: number = store.insert(true,
        contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'), 'ON_CONFLICT_REPLACE');
      expect(rowId).assertEqual(1);
      expect(store.insertCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(store.rowCount()).assertEqual(1);
      expect(store.names()[0]).assertEqual('Ada Lovelace');
    });

    /**
     * @tc.name   updateOnUninitializedStoreRecordsUpdateCall
     * @tc.desc   Updating an empty store counts the update call and reports zero affected rows
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            without creating a table, because the update path has no initialization.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('updateOnUninitializedStoreRecordsUpdateCall', 0, () => {
      const affected: number = store.updateContact(
        contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'));
      expect(affected).assertEqual(0);
      expect(store.updateCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(0);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.rowCount()).assertEqual(0);
      expect(store.names().length).assertEqual(0);
    });

    /**
     * @tc.name   deleteOnUninitializedStoreRemovesNothing
     * @tc.desc   Deleting by name on a store with no rows counts the delete call, removes
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            nothing and reports zero removed rows.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteOnUninitializedStoreRemovesNothing', 0, () => {
      const removed: number = store.deleteByName('Ada Lovelace');
      expect(removed).assertEqual(0);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.initCalls).assertEqual(0);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.batchCalls).assertEqual(0);
    });

    /**
     * @tc.name   storeReuseKeepsRowsAcrossAllOperations
     * @tc.desc   One initialized store serves a batch, a query, an update and a delete without
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            a second initialization and keeps the surviving row order.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeReuseKeepsRowsAcrossAllOperations', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 5);
      store.batchInsert(true, seed);
      expect(store.query(true).length).assertEqual(5);
      expect(store.updateContact(contactOf(seed[0].name, '19999999999', 'moved@example.com', 'New Address')))
        .assertEqual(1);
      expect(store.deleteByName(seed[4].name)).assertEqual(1);
      expect(store.rowCount()).assertEqual(4);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.queryCalls).assertEqual(1);
      expect(store.updateCalls).assertEqual(1);
      expect(store.deleteCalls).assertEqual(1);
    });

    /**
     * @tc.name   reuseAfterQueryKeepsInitialization
     * @tc.desc   Querying does not disturb the initialized flag or the table creation counter,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            even when the query is repeated with a rejected context.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('reuseAfterQueryKeepsInitialization', 0, () => {
      store.init(true);
      store.query(true);
      store.query(false);
      store.query(true);
      expect(store.initialized).assertTrue();
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.queryCalls).assertEqual(3);
      expect(store.lastContextValid).assertTrue();
      expect(store.rowCount()).assertEqual(0);
    });

    /**
     * @tc.name   resetClearsInitializationAndCounters
     * @tc.desc   Reset returns the store to the exact state of a new instance: no rows, no
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            initialization and every counter back to zero.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('resetClearsInitializationAndCounters', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      store.query(true);
      store.insert(true, createSeedContacts()[2], 'ON_CONFLICT_REPLACE');
      store.deleteByName(createSeedContacts()[0].name);
      expect(store.rowCount()).assertEqual(2);
      store.reset();
      expect(store.initialized).assertFalse();
      expect(store.lastContextValid).assertFalse();
      expect(store.rowCount()).assertEqual(0);
      expect(store.initCalls).assertEqual(0);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.queryCalls).assertEqual(0);
      expect(store.insertCalls).assertEqual(0);
      expect(store.batchCalls).assertEqual(0);
      expect(store.updateCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
    });

    /**
     * @tc.name   resetThenValidInitCreatesTableAgain
     * @tc.desc   After a reset the store behaves like a new instance, so a valid init opens it
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            again and performs a fresh table creation.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('resetThenValidInitCreatesTableAgain', 0, () => {
      expect(store.init(true)).assertTrue();
      store.reset();
      const created: boolean = store.init(true);
      expect(created).assertTrue();
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.batchCalls).assertEqual(0);
    });

    /**
     * @tc.name   wrappedQueryResultSkipsStoreCallForInvalidContext
     * @tc.desc   The wrapper short-circuits a rejected context, so the store query counter is
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            not advanced and the page still receives an empty array.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('wrappedQueryResultSkipsStoreCallForInvalidContext', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      const rows: Contact[] = wrappedQueryResult(false, store);
      expect(rows.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(0);
      expect(store.rowCount()).assertEqual(2);
      expect(store.initialized).assertTrue();
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   wrappedQueryResultDelegatesForValidContext
     * @tc.desc   With a valid context the wrapper performs exactly one store query and returns
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            its rows, so wrapper and store counters advance together.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('wrappedQueryResultDelegatesForValidContext', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      const rows: Contact[] = wrappedQueryResult(true, store);
      expect(rows.length).assertEqual(3);
      expect(store.queryCalls).assertEqual(1);
      expect(rows[0].name).assertEqual('艾德里安');
      expect(rows[1].name).assertEqual('阿诺德');
      expect(rows[2].name).assertEqual('贝拉');
      expect(store.rowCount()).assertEqual(3);
    });

    /**
     * @tc.name   storeIdentityConstantsMatchProductionLiterals
     * @tc.desc   The table name, database file and ability name reused by the lifecycle suite
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            are the literals declared in RdbConstant.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('storeIdentityConstantsMatchProductionLiterals', 0, () => {
      expect(TABLE_CONTACT).assertEqual('contact');
      expect(STORE_NAME).assertEqual('contact.db');
      expect(STORE_ABILITY).assertEqual('EntryAbility');
      expect(TABLE_CONTACT.length).assertEqual(7);
      expect(STORE_NAME.endsWith('.db')).assertTrue();
      expect(store.initialized).assertFalse();
      expect(store.initCalls).assertEqual(0);
    });

    /**
     * @tc.name   queryDoesNotCreateTableOrInit
     * @tc.desc   Two queries on a store that was never initialized leave both the init and the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            create table counters at zero because query only copies rows.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('queryDoesNotCreateTableOrInit', 0, () => {
      expect(store.query(true).length).assertEqual(0);
      expect(store.query(true).length).assertEqual(0);
      expect(store.queryCalls).assertEqual(2);
      expect(store.initCalls).assertEqual(0);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.lastContextValid).assertFalse();
    });

    /**
     * @tc.name   repeatedReuseGrowsCountersLinearly
     * @tc.desc   Five consecutive queries on a reused store count one query each while the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            initialization counters are frozen after the first batch insert.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedReuseGrowsCountersLinearly', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 1));
      for (let round = 0; round < 5; round++) {
        const rows: Contact[] = store.query(true);
        expect(rows.length).assertEqual(1);
        expect(store.queryCalls).assertEqual(round + 1);
      }
      expect(store.queryCalls).assertEqual(5);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   batchInsertAfterValidInitSkipsSecondInit
     * @tc.desc   When the store is already open, a batch insert does not call init again, so
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the init counter stays at one and only the batch counter moves.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertAfterValidInitSkipsSecondInit', 0, () => {
      store.init(true);
      const written: number = store.batchInsert(true, createSeedContacts().slice(0, 2));
      expect(written).assertEqual(2);
      expect(store.initCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(2);
      expect(store.initialized).assertTrue();
      expect(store.lastContextValid).assertTrue();
    });

    /**
     * @tc.name   insertAfterBatchSharesInitialization
     * @tc.desc   A single insert that follows a batch on the same store reuses the open handle
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            and only the insert counter changes.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('insertAfterBatchSharesInitialization', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      const rowId: number = store.insert(true,
        contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'), 'ON_CONFLICT_REPLACE');
      expect(rowId).assertEqual(3);
      expect(store.insertCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(3);
      expect(store.names()[2]).assertEqual('Ada Lovelace');
    });

    /**
     * @tc.name   lifecycleCountersAreIndependentPerStore
     * @tc.desc   Initializing one store leaves a second store untouched, so each instance owns
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            its own lifecycle counters and rows.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lifecycleCountersAreIndependentPerStore', 0, () => {
      const second: StoreDouble = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      expect(store.initCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(2);
      expect(second.initialized).assertFalse();
      expect(second.initCalls).assertEqual(0);
      expect(second.batchCalls).assertEqual(0);
      expect(second.rowCount()).assertEqual(0);
      expect(second.lastContextValid).assertFalse();
    });

    /**
     * @tc.name   deleteKeepsStoreInitialized
     * @tc.desc   Deleting a missing name still counts the delete call but never closes or
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            reinitializes the store.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteKeepsStoreInitialized', 0, () => {
      store.init(true);
      const removed: number = store.deleteByName('Nobody Here');
      expect(removed).assertEqual(0);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.lastContextValid).assertTrue();
    });

    /**
     * @tc.name   initializedFlagIsNotDerivedFromRowCount
     * @tc.desc   An empty batch opens the store, so the initialized flag stays true while the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            row count remains zero and a later delete changes nothing.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('initializedFlagIsNotDerivedFromRowCount', 0, () => {
      store.batchInsert(true, []);
      expect(store.initialized).assertTrue();
      expect(store.rowCount()).assertEqual(0);
      store.deleteByName('Anything');
      expect(store.initialized).assertTrue();
      expect(store.rowCount()).assertEqual(0);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.deleteCalls).assertEqual(1);
    });

    /**
     * @tc.name   updateAfterBatchInitializationKeepsCounters
     * @tc.desc   An update on an initialized store copies only the three mutable columns and
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            leaves the lifecycle counters unchanged.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateAfterBatchInitializationKeepsCounters', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 2);
      store.batchInsert(true, seed);
      const affected: number = store.updateContact(
        contactOf(seed[1].name, '19999999999', 'updated@example.com', 'Updated Address', 'avatar.png', 'F'));
      expect(affected).assertEqual(1);
      expect(store.updateCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rows[1].phone).assertEqual('19999999999');
      expect(store.rows[1].avatar).assertEqual('');
      expect(store.rowCount()).assertEqual(2);
    });

    /**
     * @tc.name   invalidBatchContextAfterInitSkipsCreateTable
     * @tc.desc   Once open, a batch submitted with a rejected context still appends rows and
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            does not repeat the table creation step.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('invalidBatchContextAfterInitSkipsCreateTable', 0, () => {
      store.init(true);
      const written: number = store.batchInsert(false, createSeedContacts().slice(0, 2));
      expect(written).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.lastContextValid).assertTrue();
      expect(store.rowCount()).assertEqual(2);
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   operationCountersSumEveryTouchedPath
     * @tc.desc   A full sequence of batch, query, update and delete touches each counter once
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            and keeps the lifecycle pair at one init and one table creation.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('operationCountersSumEveryTouchedPath', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 3);
      store.batchInsert(true, seed);
      store.query(true);
      store.updateContact(contactOf(seed[0].name, '19888888888', 'sum@example.com', 'Sum Road'));
      store.deleteByName(seed[2].name);
      const operations: number = store.batchCalls + store.queryCalls + store.updateCalls + store.deleteCalls;
      expect(operations).assertEqual(4);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(2);
      expect(store.insertCalls).assertEqual(0);
      expect(store.initialized).assertTrue();
      expect(store.rows[0].phone).assertEqual('19888888888');
    });

    /**
     * @tc.name   secondStoreInitializesAfterTheFirstOneIsOpen
     * @tc.desc   Two stores of the same shape each require their own initialization, so the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            second store creates its own table and keeps its own rows.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('secondStoreInitializesAfterTheFirstOneIsOpen', 0, () => {
      const second: StoreDouble = new StoreDouble();
      store.init(true);
      expect(store.createTableCalls).assertEqual(1);
      expect(second.createTableCalls).assertEqual(0);
      expect(second.init(true)).assertTrue();
      expect(second.createTableCalls).assertEqual(1);
      expect(second.initCalls).assertEqual(1);
      second.batchInsert(true, createSeedContacts().slice(0, 4));
      expect(second.rowCount()).assertEqual(4);
      expect(store.rowCount()).assertEqual(0);
      expect(store.createTableCalls).assertEqual(1);
    });

    /**
     * @tc.name   initializationDoesNotSeedContactsByItself
     * @tc.desc   Opening the store performs no data writes, so a store right after init holds
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            zero rows and the batch and insert counters remain zero.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('initializationDoesNotSeedContactsByItself', 0, () => {
      store.init(true);
      expect(store.rowCount()).assertEqual(0);
      expect(store.rows.length).assertEqual(0);
      expect(store.batchCalls).assertEqual(0);
      expect(store.insertCalls).assertEqual(0);
      expect(store.names().length).assertEqual(0);
      expect(store.query(true).length).assertEqual(0);
      expect(store.initCalls).assertEqual(1);
    });

    /**
     * @tc.name   reinitAfterDeleteFromEmptiedStoreStaysSingle
     * @tc.desc   Emptying the store through deletes keeps the handle open, so a later init call
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConnectionLifecycleValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            is still refused and no extra table creation happens.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('reinitAfterDeleteFromEmptiedStoreStaysSingle', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 2);
      store.batchInsert(true, seed);
      store.deleteByName(seed[0].name);
      store.deleteByName(seed[1].name);
      expect(store.rowCount()).assertEqual(0);
      expect(store.deleteCalls).assertEqual(2);
      const reopened: boolean = store.init(true);
      expect(reopened).assertFalse();
      expect(store.initCalls).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
    });
  });
}
