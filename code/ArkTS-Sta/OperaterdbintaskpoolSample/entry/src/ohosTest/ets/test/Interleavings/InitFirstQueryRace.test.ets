'use static';
import { countOf } from '../Shared/SharedDriver';
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
 * Interleavings / InitFirstQueryRace suite.
 *
 * aboutToAppear calls initRdbStore before the first query, but query itself also
 * calls getRdbStore on every invocation. The suite separates the two paths: init
 * owns the create-table step and rejects a second successful open, while query
 * never creates a table and never rejects an attempt. Ordering the pair wrongly
 * is observable as a missing table or an empty first list.
 *
 * Source anchors:
 *   DatabaseConnection.ets:69-89    init early return when context or store exists
 *   DatabaseConnection.ets:116-134  query re-fetches the store each call
 *   DatabaseConnection.ets:277-309  first-row skip in the result walk
 *   SharedDriver.ets:535-559        StoreDouble init and query
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import {
  CATEGORY_A,
  CATEGORY_B,
  CATEGORY_C,
  createSeedContacts,
  contactOf,
  cloneContact,
  contactNames,
  joined,
  expectedVisibleCount,
  CursorResultSet,
  readContactsFromResultSet,
  wrappedQueryResult,
  StoreDouble,
  resetContactManager
} from '../Shared/SharedDriver';

export default function initFirstQueryRaceTest(): void {
  describe('InitFirstQueryRace', () => {
    beforeAll(() => {
      logSuite('InitFirstQueryRace', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('InitFirstQueryRace', 'end');
    });

    /**
     * @tc.name   queryBeforeInitReturnsEmpty
     * @tc.desc   A query issued before any init opens the store lazily and sees no rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryBeforeInitReturnsEmpty', 0, () => {
      const store = new StoreDouble();
      const rows = store.query(true);
      expect(rows.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      logStep('initFirstQueryRaceTest', 'query before init sees an empty list');
    });

    /**
     * @tc.name   queryDoesNotInitialiseStore
     * @tc.desc   Querying leaves initialized false and createTableCalls at zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryDoesNotInitialiseStore', 0, () => {
      const store = new StoreDouble();
      store.query(false);
      store.query(true);
      expect(store.initialized).assertFalse();
      expect(store.createTableCalls).assertEqual(0);
      expect(store.initCalls).assertEqual(0);
      expect(store.queryCalls).assertEqual(2);
      logStep('initFirstQueryRaceTest', 'query never opens the store');
    });

    /**
     * @tc.name   secondInitReturnsFalse
     * @tc.desc   A second successful init attempt is rejected and does not recreate the table.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('secondInitReturnsFalse', 0, () => {
      const store = new StoreDouble();
      expect(store.init(true)).assertTrue();
      expect(store.init(true)).assertFalse();
      expect(store.initCalls).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(store.lastContextValid).assertTrue();
      logStep('initFirstQueryRaceTest', 'second init is rejected');
    });

    /**
     * @tc.name   invalidContextCtorLeavesStoreClosed
     * @tc.desc   The context check runs before the reuse check, so an invalid context closes nothing but writes the flag.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('invalidContextCtorLeavesStoreClosed', 0, () => {
      const store = new StoreDouble();
      expect(store.init(false)).assertFalse();
      expect(store.initialized).assertFalse();
      expect(store.initCalls).assertEqual(1);
      expect(store.lastContextValid).assertFalse();
      expect(store.createTableCalls).assertEqual(0);
      logStep('initFirstQueryRaceTest', 'invalid context leaves the store closed');
    });

    /**
     * @tc.name   batchInitialisesBeforeQuery
     * @tc.desc   The batch path opens the store, so a later query sees the written rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchInitialisesBeforeQuery', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts().slice(0, 6);
      store.batchInsert(true, seed);
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(1);
      expect(store.queryCalls).assertEqual(0);
      const rows = store.query(true);
      expect(rows.length).assertEqual(6);
      expect(joined(contactNames(rows))).assertEqual(joined(contactNames(seed)));
      logStep('initFirstQueryRaceTest', 'batch init makes rows queryable');
    });

    /**
     * @tc.name   queryAfterInitSeesSeedRows
     * @tc.desc   Init then batch then query returns all fifteen seed rows in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryAfterInitSeesSeedRows', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      const rows = store.query(true);
      expect(rows.length).assertEqual(15);
      expect(store.queryCalls).assertEqual(1);
      expect(rows[0].name).assertEqual('艾德里安');
      expect(rows[14].name).assertEqual('法里');
      logStep('initFirstQueryRaceTest', 'query after init sees every row');
    });

    /**
     * @tc.name   initFailureThenQueryEmpty
     * @tc.desc   After a failed init a query still returns empty and the store stays closed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('initFailureThenQueryEmpty', 0, () => {
      const store = new StoreDouble();
      store.init(false);
      const rows = store.query(true);
      expect(rows.length).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.initCalls).assertEqual(1);
      expect(store.queryCalls).assertEqual(1);
      logStep('initFirstQueryRaceTest', 'failed init keeps the query empty');
    });

    /**
     * @tc.name   queryCountsEveryCall
     * @tc.desc   Five queries increment queryCalls five times without touching initCalls.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryCountsEveryCall', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      store.query(true);
      store.query(true);
      store.query(false);
      store.query(true);
      store.query(true);
      expect(store.queryCalls).assertEqual(5);
      expect(store.initCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(2);
      logStep('initFirstQueryRaceTest', 'each query is counted');
    });

    /**
     * @tc.name   firstVisibleRowIsSkipped
     * @tc.desc   The cursor walk over three stored rows exposes only the last two.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('firstVisibleRowIsSkipped', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(visible.length).assertEqual(2);
      expect(visible[0].name).assertEqual('阿诺德');
      expect(visible[1].name).assertEqual('贝拉');
      expect(countOf(contactNames(visible), '艾德里安')).assertEqual(0);
      expect(expectedVisibleCount(createSeedContacts().slice(0, 3))).assertEqual(2);
      logStep('initFirstQueryRaceTest', 'cursor skip drops the first stored row');
    });

    /**
     * @tc.name   queryBeforeAndAfterBatchDiffer
     * @tc.desc   The same store answers zero rows before the batch and four rows after it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryBeforeAndAfterBatchDiffer', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const before = store.query(true);
      expect(before.length).assertEqual(0);
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      const after = store.query(true);
      expect(after.length).assertEqual(4);
      expect(store.queryCalls).assertEqual(2);
      expect(joined(contactNames(after))).assertEqual('艾德里安,阿诺德,贝拉,本');
      logStep('initFirstQueryRaceTest', 'query result follows the batch');
    });

    /**
     * @tc.name   invalidInitAfterSuccessKeepsStoreOpen
     * @tc.desc   A late init with an invalid context returns false but the earlier open store keeps working.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('invalidInitAfterSuccessKeepsStoreOpen', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      expect(store.init(false)).assertFalse();
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      const rows = store.query(true);
      expect(rows.length).assertEqual(2);
      logStep('initFirstQueryRaceTest', 'failed late init keeps the store open');
    });

    /**
     * @tc.name   createTableOnlyOnceAcrossAttempts
     * @tc.desc   Three init attempts produce one table creation regardless of the context flags.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('createTableOnlyOnceAcrossAttempts', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.init(false);
      store.init(true);
      expect(store.initCalls).assertEqual(3);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(store.lastContextValid).assertTrue();
      logStep('initFirstQueryRaceTest', 'table creation is idempotent');
    });

    /**
     * @tc.name   initCounterGrowsWithAttempts
     * @tc.desc   Every init attempt is counted even when it is rejected for an existing store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('initCounterGrowsWithAttempts', 0, () => {
      const store = new StoreDouble();
      expect(store.initCalls).assertEqual(0);
      store.init(true);
      expect(store.initCalls).assertEqual(1);
      store.init(true);
      expect(store.initCalls).assertEqual(2);
      store.init(true);
      expect(store.initCalls).assertEqual(3);
      expect(store.createTableCalls).assertEqual(1);
      logStep('initFirstQueryRaceTest', 'init attempts are counted');
    });

    /**
     * @tc.name   queryReturnsClonedRows
     * @tc.desc   Mutating a queried row does not change the row stored in the double.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryReturnsClonedRows', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      const rows = store.query(true);
      rows[0].phone = '13999998888';
      rows[0].email = 'mutated@example.com';
      expect(store.rows[0].phone).assertEqual('13333333333');
      expect(store.rows[0].email).assertEqual('aidelian@example.com');
      expect(store.rowCount()).assertEqual(3);
      logStep('initFirstQueryRaceTest', 'query returns clones');
    });

    /**
     * @tc.name   queryWithInvalidContextReturnsEmpty
     * @tc.desc   An invalid context on query short-circuits to the empty array without touching stored rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryWithInvalidContextReturnsEmpty', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 5));
      const rows = store.query(false);
      expect(rows.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(5);
      expect(wrappedQueryResult(false, store).length).assertEqual(0);
      logStep('initFirstQueryRaceTest', 'invalid query context returns empty');
    });

    /**
     * @tc.name   batchAfterInitDoesNotReinit
     * @tc.desc   A batch issued after a successful init keeps initCalls at one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchAfterInitDoesNotReinit', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      store.batchInsert(true, createSeedContacts().slice(3, 6));
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(2);
      expect(store.rowCount()).assertEqual(6);
      logStep('initFirstQueryRaceTest', 'batches reuse the open store');
    });

    /**
     * @tc.name   querySeesLatestInsert
     * @tc.desc   A query issued after an insert includes the newly inserted name at the tail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('querySeesLatestInsert', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      store.insert(true, contactOf('莫川', '13100000031', 'mochuan.late@example.com', '贵州省贵阳市云岩区', '', CATEGORY_C),
        'ON_CONFLICT_REPLACE');
      const rows = store.query(true);
      expect(rows.length).assertEqual(3);
      expect(rows[2].name).assertEqual('莫川');
      expect(rows[2].email).assertEqual('mochuan.late@example.com');
      expect(rows[2].category).assertEqual(CATEGORY_C);
      logStep('initFirstQueryRaceTest', 'query reads the latest insert');
    });

    /**
     * @tc.name   failedInitCanBeRetried
     * @tc.desc   Two failed attempts followed by a valid one finally open the store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('failedInitCanBeRetried', 0, () => {
      const store = new StoreDouble();
      expect(store.init(false)).assertFalse();
      expect(store.init(false)).assertFalse();
      expect(store.initialized).assertFalse();
      expect(store.init(true)).assertTrue();
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(3);
      expect(store.createTableCalls).assertEqual(1);
      logStep('initFirstQueryRaceTest', 'failed inits can be retried');
    });

    /**
     * @tc.name   emptyQueryThenInsertThenQuery
     * @tc.desc   The first query is empty, inserting one row makes the next query return that row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyQueryThenInsertThenQuery', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      expect(store.query(true).length).assertEqual(0);
      store.insert(true, contactOf('阮一', '13300000021', 'ruanyi.race@example.com', '广西桂林市秀峰区', '', CATEGORY_A),
        'ON_CONFLICT_REPLACE');
      const rows = store.query(true);
      expect(rows.length).assertEqual(1);
      expect(rows[0].name).assertEqual('阮一');
      expect(store.queryCalls).assertEqual(2);
      expect(store.insertCalls).assertEqual(1);
      logStep('initFirstQueryRaceTest', 'insert between queries is visible');
    });

    /**
     * @tc.name   wrappedQueryOnFreshStoreIsEmpty
     * @tc.desc   The wrapper over a store that was never opened returns the empty array fallback shape.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('wrappedQueryOnFreshStoreIsEmpty', 0, () => {
      const store = new StoreDouble();
      const rows = wrappedQueryResult(true, store);
      expect(rows.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(store.initialized).assertFalse();
      expect(joined(contactNames(rows))).assertEqual('');
      logStep('initFirstQueryRaceTest', 'wrapper on a fresh store is empty');
    });

    /**
     * @tc.name   initBatchQueryTrail
     * @tc.desc   The canonical init, batch, query order produces a fifteen row read with one init call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('initBatchQueryTrail', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      const rows = store.query(true);
      expect(store.initCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.queryCalls).assertEqual(1);
      expect(rows.length).assertEqual(15);
      expect(store.createTableCalls).assertEqual(1);
      logStep('initFirstQueryRaceTest', 'init batch query trail is one pass');
    });

    /**
     * @tc.name   queryAfterRejectedBatchStaysEmpty
     * @tc.desc   A batch rejected for a missing context leaves the store closed and the query empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('queryAfterRejectedBatchStaysEmpty', 0, () => {
      const store = new StoreDouble();
      const written = store.batchInsert(false, createSeedContacts().slice(0, 5));
      expect(written).assertEqual(-1);
      expect(store.initialized).assertFalse();
      const rows = store.query(true);
      expect(rows.length).assertEqual(0);
      expect(store.batchCalls).assertEqual(1);
      expect(store.queryCalls).assertEqual(1);
      logStep('initFirstQueryRaceTest', 'rejected batch leaves the query empty');
    });

    /**
     * @tc.name   resetRequiresFreshInit
     * @tc.desc   After a reset the store is closed again, so a query is empty until the next init.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('resetRequiresFreshInit', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      expect(store.query(true).length).assertEqual(4);
      store.reset();
      expect(store.query(true).length).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.createTableCalls).assertEqual(0);
      expect(store.init(true)).assertTrue();
      logStep('initFirstQueryRaceTest', 'reset requires a fresh init');
    });

    /**
     * @tc.name   deleteBeforeInitIsCountedAndEmpty
     * @tc.desc   deleteByName is allowed on a closed store, removes nothing and still increments its counter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteBeforeInitIsCountedAndEmpty', 0, () => {
      const store = new StoreDouble();
      const removed = store.deleteByName('贝拉');
      expect(removed).assertEqual(0);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.initialized).assertFalse();
      expect(store.rowCount()).assertEqual(0);
      logStep('initFirstQueryRaceTest', 'delete before init is a counted no-op');
    });

    /**
     * @tc.name   initThenQueryThenInitRejects
     * @tc.desc   A second init after a query is still rejected because the store object already exists.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('initThenQueryThenInitRejects', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.query(true);
      expect(store.init(true)).assertFalse();
      expect(store.initCalls).assertEqual(2);
      expect(store.queryCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      logStep('initFirstQueryRaceTest', 'query does not make the store re-initialisable');
    });

    /**
     * @tc.name   threeBatchesThenSingleQuery
     * @tc.desc   Three batches followed by one query read nine rows with one query call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the InitFirstQueryRace scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('threeBatchesThenSingleQuery', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 3));
      store.batchInsert(true, seed.slice(3, 6));
      store.batchInsert(true, seed.slice(6, 9));
      expect(store.queryCalls).assertEqual(0);
      const rows = store.query(true);
      expect(rows.length).assertEqual(9);
      expect(store.queryCalls).assertEqual(1);
      expect(rows[8].name).assertEqual('丹尼尔');
      expect(store.initCalls).assertEqual(1);
      logStep('initFirstQueryRaceTest', 'one query covers three batches');
    });
  });
}
