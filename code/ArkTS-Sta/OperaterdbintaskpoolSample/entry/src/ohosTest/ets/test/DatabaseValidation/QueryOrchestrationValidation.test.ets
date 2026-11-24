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
 * QueryOrchestrationValidation covers the read path of the sample.
 *
 * Production anchors:
 *   DatabaseConnection.ets:116-122  query returns an empty array when no context is
 *                                   supplied
 *   DatabaseConnection.ets:124-133  the store is opened, select * from contact runs
 *                                   and the result set is mapped, catch returns []
 *   DatabaseConnection.ets:277-309  getListFromResultSet copies rows and dedupes
 *   TaskPool.ets:69-79              taskPoolExecuteQuery returns [] after a throw
 *   RdbConstant.ets:31-34           the contact table every query targets
 *
 * StoreDouble.query counts every invocation, returns an empty array for a rejected
 * context and hands out clones for a valid one, which is what the page observes
 * when it receives the array back from the taskpool.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import {
  StoreDouble,
  createSeedContacts,
  contactOf,
  sameContact,
  sameStringArray,
  contactNames,
  joined,
  countOf,
  uniqueStrings,
  resetContactManager,
  wrappedQueryResult,
  snapshotsOf,
  ContactSnapshot,
  sameSnapshotArray,
  INITIAL_STORE_VALUE
} from '../Shared/SharedDriver';

export default function queryOrchestrationValidationTest(): void {
  describe('QueryOrchestrationValidation', () => {
    let store: StoreDouble = new StoreDouble();

    beforeAll(() => {
      logSuite('QueryOrchestrationValidation', 'begin');
    });

    beforeEach(async () => {
      resetContactManager();
      store = new StoreDouble();
      store.reset();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      logSuite('QueryOrchestrationValidation', 'end');
    });

    /**
     * @tc.name   queryEmptyStoreReturnsEmptyArray
     * @tc.desc   A query against a store with no rows returns an empty array rather than null
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            and still counts one invocation.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryEmptyStoreReturnsEmptyArray', 0, () => {
      const rows: Contact[] = store.query(true);
      expect(rows.length).assertEqual(INITIAL_STORE_VALUE);
      expect(rows.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      expect(rows === store.rows).assertFalse();
      expect(sameStringArray(contactNames(rows), [])).assertTrue();
      expect(store.initialized).assertFalse();
      expect(store.initCalls).assertEqual(0);
      expect(store.batchCalls).assertEqual(0);
    });

    /**
     * @tc.name   queryInvalidContextReturnsEmptyEvenWithRows
     * @tc.desc   A rejected context returns an empty array even though the store already holds
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            rows, mirroring the early return in the production query method.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryInvalidContextReturnsEmptyEvenWithRows', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 5));
      const rows: Contact[] = store.query(false);
      expect(rows.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(5);
      expect(store.batchCalls).assertEqual(1);
      expect(joined(contactNames(rows), ',')).assertEqual('');
      expect(store.rows[0].name).assertEqual('艾德里安');
    });

    /**
     * @tc.name   queryValidContextReturnsEveryRow
     * @tc.desc   A valid context returns one element per stored row, each carrying the stored
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            field values.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryValidContextReturnsEveryRow', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 4);
      store.batchInsert(true, seed);
      const rows: Contact[] = store.query(true);
      expect(rows.length).assertEqual(4);
      expect(rows.length).assertEqual(store.rowCount());
      expect(rows[0].name).assertEqual('艾德里安');
      expect(rows[3].name).assertEqual('本');
      expect(rows[2].phone).assertEqual('11111111111');
      expect(rows[1].category).assertEqual('A');
      logStep('QueryOrchestrationValidation', 'valid query returned ' + String(rows.length) + ' rows');
    });

    /**
     * @tc.name   queryReturnsCopyNotInnerArray
     * @tc.desc   The returned array is a different array object than the store row list, so a
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            caller cannot mutate store bookkeeping through it.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryReturnsCopyNotInnerArray', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      const first: Contact[] = store.query(true);
      const second: Contact[] = store.query(true);
      expect(first === store.rows).assertFalse();
      expect(second === store.rows).assertFalse();
      expect(first === second).assertFalse();
      first.push(contactOf('Injected Row', '1', 'injected@example.com', 'Nowhere'));
      expect(first.length).assertEqual(3);
      expect(second.length).assertEqual(2);
      expect(store.rowCount()).assertEqual(2);
      expect(store.queryCalls).assertEqual(2);
    });

    /**
     * @tc.name   queryReturnedRowEditDoesNotTouchStore
     * @tc.desc   Renaming a row inside the returned array leaves the stored row untouched
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            because every element is a clone.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryReturnedRowEditDoesNotTouchStore', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      const rows: Contact[] = store.query(true);
      rows[0].name = 'Overwritten Name';
      rows[0].phone = '10000000000';
      rows.splice(1, 1);
      expect(rows.length).assertEqual(2);
      expect(store.rowCount()).assertEqual(3);
      expect(store.rows[0].name).assertEqual('艾德里安');
      expect(store.rows[0].phone).assertEqual('13333333333');
      expect(store.rows[1].name).assertEqual('阿诺德');
      expect(store.names().indexOf('Overwritten Name')).assertEqual(-1);
    });

    /**
     * @tc.name   queryDoesNotShareRowIdentity
     * @tc.desc   No returned contact is the same object as the stored contact at that index,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            while all fields still compare equal.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryDoesNotShareRowIdentity', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 3);
      store.batchInsert(true, seed);
      const rows: Contact[] = store.query(true);
      for (let index = 0; index < rows.length; index++) {
        expect(rows[index] === store.rows[index]).assertFalse();
        expect(sameContact(rows[index], store.rows[index])).assertTrue();
        expect(sameContact(rows[index], seed[index])).assertTrue();
      }
      expect(rows.length).assertEqual(3);
      expect(store.queryCalls).assertEqual(1);
    });

    /**
     * @tc.name   queryCounterCountsValidCalls
     * @tc.desc   Three valid queries each advance the query counter by one and return the same
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            number of rows every time.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryCounterCountsValidCalls', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      expect(store.query(true).length).assertEqual(4);
      expect(store.queryCalls).assertEqual(1);
      expect(store.query(true).length).assertEqual(4);
      expect(store.queryCalls).assertEqual(2);
      expect(store.query(true).length).assertEqual(4);
      expect(store.queryCalls).assertEqual(3);
      expect(store.rowCount()).assertEqual(4);
      expect(store.initCalls).assertEqual(1);
    });

    /**
     * @tc.name   queryCounterCountsRejectedCalls
     * @tc.desc   Rejected queries also advance the counter, so the metric tracks attempts rather
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            than successful reads.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryCounterCountsRejectedCalls', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      expect(store.query(false).length).assertEqual(0);
      expect(store.query(false).length).assertEqual(0);
      expect(store.query(false).length).assertEqual(0);
      expect(store.queryCalls).assertEqual(3);
      expect(store.rowCount()).assertEqual(2);
      expect(store.batchCalls).assertEqual(1);
      expect(store.queryCalls === 0).assertFalse();
    });

    /**
     * @tc.name   wrappedQueryResultShortCircuitsInvalidContext
     * @tc.desc   The taskpool wrapper returns an empty array without calling the store when the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            context is rejected.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('wrappedQueryResultShortCircuitsInvalidContext', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 6));
      const rows: Contact[] = wrappedQueryResult(false, store);
      expect(rows.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(0);
      expect(store.rowCount()).assertEqual(6);
      expect(store.batchCalls).assertEqual(1);
      expect(sameStringArray(contactNames(rows), [])).assertTrue();
    });

    /**
     * @tc.name   wrappedQueryResultDelegatesValidContext
     * @tc.desc   A valid wrappered query performs exactly one store query and forwards its rows
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            unchanged.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('wrappedQueryResultDelegatesValidContext', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 3);
      store.batchInsert(true, seed);
      const rows: Contact[] = wrappedQueryResult(true, store);
      expect(rows.length).assertEqual(3);
      expect(store.queryCalls).assertEqual(1);
      expect(sameStringArray(contactNames(rows), contactNames(seed))).assertTrue();
      expect(rows[2].name).assertEqual('贝拉');
      expect(store.rowCount()).assertEqual(3);
      expect(store.initCalls).assertEqual(1);
    });

    /**
     * @tc.name   queryPreservesInsertionOrder
     * @tc.desc   Rows come back in the order they were inserted, including a later single insert
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            after a batch.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryPreservesInsertionOrder', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        'ON_CONFLICT_REPLACE');
      const rows: Contact[] = store.query(true);
      expect(rows.length).assertEqual(4);
      expect(sameStringArray(contactNames(rows), ['艾德里安', '阿诺德', '贝拉', 'Ada Lovelace'])).assertTrue();
      expect(rows[3].name).assertEqual('Ada Lovelace');
      expect(rows[0].name).assertEqual('艾德里安');
      expect(rows[1].name).assertEqual('阿诺德');
      expect(rows[2].name).assertEqual('贝拉');
    });

    /**
     * @tc.name   queryAfterInsertShowsAppendedRow
     * @tc.desc   A query issued after an insert reports one more row and exposes the appended
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            payload at the tail.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryAfterInsertShowsAppendedRow', 0, () => {
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        'ON_CONFLICT_REPLACE');
      expect(store.query(true).length).assertEqual(1);
      store.insert(true, contactOf('Grace Hopper', '13900139000', 'grace@example.com', 'Compiler Lane'),
        'ON_CONFLICT_REPLACE');
      const rows: Contact[] = store.query(true);
      expect(rows.length).assertEqual(2);
      expect(rows[1].name).assertEqual('Grace Hopper');
      expect(rows[1].email).assertEqual('grace@example.com');
      expect(store.queryCalls).assertEqual(2);
      expect(store.insertCalls).assertEqual(2);
      expect(store.rowCount()).assertEqual(2);
    });

    /**
     * @tc.name   queryAfterUpdateShowsEditedFields
     * @tc.desc   The row returned after an update carries the new phone, email and address while
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the untouched rows keep their seeded values.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryAfterUpdateShowsEditedFields', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      store.updateContact(contactOf('阿诺德', '19999999999', 'arnold.edited@example.com', '上海市静安区'));
      const rows: Contact[] = store.query(true);
      expect(rows[1].phone).assertEqual('19999999999');
      expect(rows[1].email).assertEqual('arnold.edited@example.com');
      expect(rows[1].address).assertEqual('上海市静安区');
      expect(rows[0].phone).assertEqual('13333333333');
      expect(rows[2].email).assertEqual('bella@example.com');
      expect(store.updateCalls).assertEqual(1);
      expect(store.queryCalls).assertEqual(1);
    });

    /**
     * @tc.name   queryAfterDeleteOmitsDeletedName
     * @tc.desc   After a delete the query result contains one fewer row and the deleted name is
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            absent from the returned names.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryAfterDeleteOmitsDeletedName', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      store.deleteByName('阿诺德');
      const rows: Contact[] = store.query(true);
      expect(rows.length).assertEqual(3);
      expect(countOf(contactNames(rows), '阿诺德')).assertEqual(0);
      expect(rows[0].name).assertEqual('艾德里安');
      expect(rows[1].name).assertEqual('贝拉');
      expect(store.deleteCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(3);
    });

    /**
     * @tc.name   queryKeepsDuplicateRows
     * @tc.desc   Duplicate rows inserted under the same name are all returned by the store query;
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            deduplication belongs to the result set reader, not the store.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryKeepsDuplicateRows', 0, () => {
      store.insert(true, contactOf('Twin Row', '13800138000', 'twin.one@example.com', 'First Road'),
        'ON_CONFLICT_REPLACE');
      store.insert(true, contactOf('Twin Row', '13800138000', 'twin.two@example.com', 'Second Road'),
        'ON_CONFLICT_REPLACE');
      const rows: Contact[] = store.query(true);
      expect(rows.length).assertEqual(2);
      expect(countOf(contactNames(rows), 'Twin Row')).assertEqual(2);
      expect(rows[0].email).assertEqual('twin.one@example.com');
      expect(rows[1].email).assertEqual('twin.two@example.com');
      expect(uniqueStrings(contactNames(rows)).length).assertEqual(1);
      expect(store.queryCalls).assertEqual(1);
    });

    /**
     * @tc.name   queryResultLengthEqualsRowCount
     * @tc.desc   The length of the returned array always equals the store row count for a valid
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            context, whatever the batch size.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryResultLengthEqualsRowCount', 0, () => {
      const sizes: int[] = [1, 3, 5];
      let expected: int = 0;
      for (let index = 0; index < sizes.length; index++) {
        expected = expected + sizes[index];
        store.batchInsert(true, createSeedContacts().slice(expected - sizes[index], expected));
        expect(store.rowCount()).assertEqual(expected);
        expect(store.query(true).length).assertEqual(store.rowCount());
      }
      expect(store.queryCalls).assertEqual(3);
      expect(store.rowCount()).assertEqual(9);
      expect(store.batchCalls).assertEqual(3);
    });

    /**
     * @tc.name   repeatedQueriesAreStable
     * @tc.desc   Four consecutive queries on an unchanged store return identical name sequences
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            and identical snapshot sequences.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedQueriesAreStable', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 5));
      const first: Contact[] = store.query(true);
      const firstNames: string[] = contactNames(first);
      const firstSnapshots: ContactSnapshot[] = snapshotsOf(first);
      for (let round = 0; round < 3; round++) {
        const again: Contact[] = store.query(true);
        expect(sameStringArray(contactNames(again), firstNames)).assertTrue();
        expect(sameSnapshotArray(snapshotsOf(again), firstSnapshots)).assertTrue();
        expect(again.length).assertEqual(5);
      }
      expect(store.queryCalls).assertEqual(4);
      expect(store.rowCount()).assertEqual(5);
    });

    /**
     * @tc.name   queryMixedContextsAccumulateCounters
     * @tc.desc   Alternating valid and rejected queries counts every call while only the valid
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            ones carry rows.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryMixedContextsAccumulateCounters', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      expect(store.query(true).length).assertEqual(2);
      expect(store.query(false).length).assertEqual(0);
      expect(store.query(true).length).assertEqual(2);
      expect(store.query(false).length).assertEqual(0);
      expect(store.query(true).length).assertEqual(2);
      expect(store.queryCalls).assertEqual(5);
      expect(store.rowCount()).assertEqual(2);
      expect(store.batchCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
    });

    /**
     * @tc.name   capturedResultSurvivesStoreReset
     * @tc.desc   A result array captured before a reset keeps its rows, so the caller is not
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            affected by later store bookkeeping.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('capturedResultSurvivesStoreReset', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      const captured: Contact[] = store.query(true);
      store.reset();
      expect(captured.length).assertEqual(3);
      expect(captured[0].name).assertEqual('艾德里安');
      expect(store.rowCount()).assertEqual(0);
      expect(store.queryCalls).assertEqual(0);
      expect(store.query(true).length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(captured[2].name).assertEqual('贝拉');
    });

    /**
     * @tc.name   querySeesBatchAndInsertRows
     * @tc.desc   Rows written by a batch and by a single insert appear in one query result in
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            write order.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('querySeesBatchAndInsertRows', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        'ON_CONFLICT_REPLACE');
      store.batchInsert(true, createSeedContacts().slice(2, 4));
      const rows: Contact[] = store.query(true);
      expect(rows.length).assertEqual(5);
      expect(rows[0].name).assertEqual('艾德里安');
      expect(rows[2].name).assertEqual('Ada Lovelace');
      expect(rows[3].name).assertEqual('贝拉');
      expect(rows[4].name).assertEqual('本');
      expect(store.batchCalls).assertEqual(2);
      expect(store.insertCalls).assertEqual(1);
    });

    /**
     * @tc.name   queryNamesAreUniqueForSeed
     * @tc.desc   The fifteen seeded names stay distinct through the read path, so the query does
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            not introduce accidental duplication.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryNamesAreUniqueForSeed', 0, () => {
      const seed: Contact[] = createSeedContacts();
      store.batchInsert(true, seed);
      const names: string[] = contactNames(store.query(true));
      expect(names.length).assertEqual(15);
      expect(uniqueStrings(names).length).assertEqual(15);
      expect(names[0]).assertEqual('艾德里安');
      expect(names[14]).assertEqual('法里');
      expect(countOf(names, '本')).assertEqual(1);
      expect(joined(names, ',').indexOf('艾德里安')).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
    });

    /**
     * @tc.name   mergingTwoStoreQueriesKeepsOrder
     * @tc.desc   Concatenating query results from two stores keeps each store's order, which is
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the shape a merged page list would use.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('mergingTwoStoreQueriesKeepsOrder', 0, () => {
      const second: StoreDouble = new StoreDouble();
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      second.batchInsert(true, createSeedContacts().slice(2, 4));
      const left: Contact[] = store.query(true);
      const right: Contact[] = second.query(true);
      const merged: Contact[] = left.slice();
      for (let index = 0; index < right.length; index++) {
        merged.push(right[index]);
      }
      expect(merged.length).assertEqual(4);
      expect(sameStringArray(contactNames(merged), ['艾德里安', '阿诺德', '贝拉', '本'])).assertTrue();
      expect(store.queryCalls).assertEqual(1);
      expect(second.queryCalls).assertEqual(1);
      expect(merged[3].name).assertEqual('本');
      expect(merged[2].category).assertEqual('B');
    });

    /**
     * @tc.name   queryAfterDeletingAllRowsIsEmpty
     * @tc.desc   After every row is deleted the query returns an empty array while the query
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            counter still advances.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryAfterDeletingAllRowsIsEmpty', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 3);
      store.batchInsert(true, seed);
      for (let index = 0; index < seed.length; index++) {
        expect(store.deleteByName(seed[index].name)).assertEqual(1);
      }
      const rows: Contact[] = store.query(true);
      expect(rows.length).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(store.deleteCalls).assertEqual(3);
      expect(store.initialized).assertTrue();
      expect(sameStringArray(contactNames(rows), [])).assertTrue();
    });

    /**
     * @tc.name   queryReturnsNonEmptyFieldsForSeed
     * @tc.desc   Every seeded row read back has non-empty name, phone, email and address plus its
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            one character category, so no column is dropped on read.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryReturnsNonEmptyFieldsForSeed', 0, () => {
      store.batchInsert(true, createSeedContacts());
      const rows: Contact[] = store.query(true);
      expect(rows.length).assertEqual(15);
      for (let index = 0; index < rows.length; index++) {
        expect(rows[index].name.length > 0).assertTrue();
        expect(rows[index].phone.length).assertEqual(11);
        expect(rows[index].email.indexOf('@') > 0).assertTrue();
        expect(rows[index].address.length > 0).assertTrue();
        expect(rows[index].category.length).assertEqual(1);
        expect(rows[index].avatar).assertEqual('');
      }
      expect(store.rowCount()).assertEqual(15);
    });

    /**
     * @tc.name   queryAfterEmptyBatchIsEmpty
     * @tc.desc   A batch that submits no rows leaves the query result empty even though the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            store was initialized by that batch.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryAfterEmptyBatchIsEmpty', 0, () => {
      const written: number = store.batchInsert(true, []);
      expect(written).assertEqual(0);
      const rows: Contact[] = store.query(true);
      expect(rows.length).assertEqual(0);
      expect(store.initialized).assertTrue();
      expect(store.queryCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(joined(contactNames(rows), ',')).assertEqual('');
      expect(store.lastContextValid).assertTrue();
      expect(store.rowCount()).assertEqual(0);
      expect(store.initCalls).assertEqual(1);
    });

    /**
     * @tc.name   queryInvalidAfterValidKeepsRows
     * @tc.desc   A rejected query issued after a valid one does not remove or damage the stored
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            rows, and the next valid query still sees them.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryInvalidAfterValidKeepsRows', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      expect(store.query(true).length).assertEqual(4);
      expect(store.query(false).length).assertEqual(0);
      const again: Contact[] = store.query(true);
      expect(again.length).assertEqual(4);
      expect(again[3].name).assertEqual('本');
      expect(store.rowCount()).assertEqual(4);
      expect(store.queryCalls).assertEqual(3);
      expect(store.rows[0].email).assertEqual('aidelian@example.com');
    });

    /**
     * @tc.name   querySnapshotMatchesStoreSnapshot
     * @tc.desc   The snapshot sequence of a query result equals the snapshot sequence of the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            stored rows for a multi row store.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('querySnapshotMatchesStoreSnapshot', 0, () => {
      store.batchInsert(true, createSeedContacts());
      const readBack: Contact[] = store.query(true);
      expect(readBack.length).assertEqual(15);
      expect(sameSnapshotArray(snapshotsOf(readBack), snapshotsOf(store.rows))).assertTrue();
      expect(readBack[0] === store.rows[0]).assertFalse();
      expect(snapshotsOf(readBack)[14].describe()).assertEqual(snapshotsOf(store.rows)[14].describe());
      expect(store.queryCalls).assertEqual(1);
    });

    /**
     * @tc.name   queryBeforeInitReturnsEmptyAndStaysUninitialized
     * @tc.desc   Reading from a store that was never initialized returns an empty array without
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            opening the store or creating the table.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryBeforeInitReturnsEmptyAndStaysUninitialized', 0, () => {
      expect(store.initialized).assertFalse();
      const rows: Contact[] = store.query(true);
      expect(rows.length).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.initCalls).assertEqual(0);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(store.lastContextValid).assertFalse();
    });

    /**
     * @tc.name   wrappedQueryCounterParityAcrossMixedContexts
     * @tc.desc   Only the wrappered calls with a valid context reach the store counter, so two
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            valid and two rejected calls leave the query counter at two.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('wrappedQueryCounterParityAcrossMixedContexts', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      expect(wrappedQueryResult(true, store).length).assertEqual(3);
      expect(wrappedQueryResult(false, store).length).assertEqual(0);
      expect(wrappedQueryResult(true, store).length).assertEqual(3);
      expect(wrappedQueryResult(false, store).length).assertEqual(0);
      expect(store.queryCalls).assertEqual(2);
      expect(store.rowCount()).assertEqual(3);
      expect(store.batchCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
    });

    /**
     * @tc.name   queryAfterUpdatingAllRowsShowsSinglePhone
     * @tc.desc   When every row is updated to one phone, a single query reports that phone on all
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            fifteen rows while names stay in place.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('queryAfterUpdatingAllRowsShowsSinglePhone', 0, () => {
      const seed: Contact[] = createSeedContacts();
      store.batchInsert(true, seed);
      for (let index = 0; index < seed.length; index++) {
        store.updateContact(contactOf(seed[index].name, '19999999999', 'all@example.com', 'All Road'));
      }
      const rows: Contact[] = store.query(true);
      expect(rows.length).assertEqual(15);
      for (let index = 0; index < rows.length; index++) {
        expect(rows[index].phone).assertEqual('19999999999');
        expect(rows[index].email).assertEqual('all@example.com');
      }
      expect(sameStringArray(contactNames(rows), contactNames(seed))).assertTrue();
      expect(store.updateCalls).assertEqual(15);
      expect(store.queryCalls).assertEqual(1);
    });

    /**
     * @tc.name   queryStaysConfinedToItsOwnStore
     * @tc.desc   A query on one store never returns rows written to another store instance.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('queryStaysConfinedToItsOwnStore', 0, () => {
      const second: StoreDouble = new StoreDouble();
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      second.batchInsert(true, createSeedContacts().slice(2, 5));
      expect(store.query(true).length).assertEqual(2);
      expect(second.query(true).length).assertEqual(3);
      expect(countOf(contactNames(store.query(true)), '贝拉')).assertEqual(0);
      expect(countOf(contactNames(second.query(true)), '艾德里安')).assertEqual(0);
      expect(store.queryCalls).assertEqual(2);
      expect(second.queryCalls).assertEqual(2);
      expect(store.rowCount()).assertEqual(2);
      expect(second.rowCount()).assertEqual(3);
    });

    /**
     * @tc.name   queryEveryRowMatchesSeedPayload
     * @tc.desc   Each row returned by the query equals the seeded contact at the same index in
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            every field, which is the round trip guarantee of the read path.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('queryEveryRowMatchesSeedPayload', 0, () => {
      const seed: Contact[] = createSeedContacts();
      store.batchInsert(true, seed);
      const rows: Contact[] = store.query(true);
      let matched: number = 0;
      for (let index = 0; index < seed.length; index++) {
        if (sameContact(rows[index], seed[index])) {
          matched = matched + 1;
        }
      }
      expect(matched).assertEqual(15);
      expect(matched).assertEqual(rows.length);
      expect(sameContact(rows[6], seed[6])).assertTrue();
      expect(rows[6].name).assertEqual('康纳');
      expect(rows[6].phone).assertEqual('10000000000');
      expect(store.queryCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(15);
    });

    /**
     * @tc.name   queryResultNamesJoinRoundTrip
     * @tc.desc   Joining the query names with a comma reproduces the joined seed names exactly,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            so no row is reordered by the read path.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryResultNamesJoinRoundTrip', 0, () => {
      const seed: Contact[] = createSeedContacts().slice(0, 5);
      store.batchInsert(true, seed);
      const readNames: string[] = contactNames(store.query(true));
      expect(joined(readNames, ',')).assertEqual(joined(contactNames(seed), ','));
      expect(joined(readNames, '>')).assertEqual('艾德里安>阿诺德>贝拉>本>本杰明');
      expect(readNames.length).assertEqual(5);
      expect(joined(readNames, ',').split(',').length).assertEqual(5);
      expect(store.queryCalls).assertEqual(1);
    });
    /**
     * @tc.name   queryKeepsAvatarAndCategoryColumns
     * @tc.desc   A row inserted with a non-empty avatar is read back with both the avatar and the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            category intact, proving the projection covers all six columns.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryKeepsAvatarAndCategoryColumns', 0, () => {
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road',
        'ada.png', 'F'), 'ON_CONFLICT_REPLACE');
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      const rows: Contact[] = store.query(true);
      expect(rows.length).assertEqual(3);
      expect(rows[0].avatar).assertEqual('ada.png');
      expect(rows[0].category).assertEqual('F');
      expect(rows[1].avatar).assertEqual('');
      expect(rows[1].category).assertEqual('A');
      expect(rows[2].category).assertEqual('A');
      expect(store.queryCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(3);
    });

    /**
     * @tc.name   queryAfterDeletingOneDuplicateKeepsTheOther
     * @tc.desc   Deleting a name removes both duplicate rows, so the query afterwards returns
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            none of that name while other names remain readable.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('queryAfterDeletingOneDuplicateKeepsTheOther', 0, () => {
      store.insert(true, contactOf('Twin Row', '13800138000', 'twin.one@example.com', 'First Road'),
        'ON_CONFLICT_REPLACE');
      store.insert(true, contactOf('Twin Row', '13800138001', 'twin.two@example.com', 'Second Road'),
        'ON_CONFLICT_REPLACE');
      store.insert(true, contactOf('Solo Row', '13900139000', 'solo@example.com', 'Solo Road'),
        'ON_CONFLICT_REPLACE');
      expect(store.query(true).length).assertEqual(3);
      const removed: number = store.deleteByName('Twin Row');
      expect(removed).assertEqual(2);
      const rows: Contact[] = store.query(true);
      expect(rows.length).assertEqual(1);
      expect(rows[0].name).assertEqual('Solo Row');
      expect(countOf(contactNames(rows), 'Twin Row')).assertEqual(0);
      expect(store.queryCalls).assertEqual(2);
      expect(store.deleteCalls).assertEqual(1);
    });

    /**
     * @tc.name   querySecondCallSeesInsertMadeBetweenCalls
     * @tc.desc   The first query result is a snapshot; a row inserted after it appears only in
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the second query, so cached arrays are not refreshed in place.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('querySecondCallSeesInsertMadeBetweenCalls', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      const before: Contact[] = store.query(true);
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        'ON_CONFLICT_REPLACE');
      const after: Contact[] = store.query(true);
      expect(before.length).assertEqual(2);
      expect(after.length).assertEqual(3);
      expect(before.length === after.length).assertFalse();
      expect(after[2].name).assertEqual('Ada Lovelace');
      expect(before.indexOf(after[2])).assertEqual(-1);
      expect(store.queryCalls).assertEqual(2);
      expect(store.rowCount()).assertEqual(3);
    });
    /**
     * @tc.name   queryOnStorePopulatedByInsertPath
     * @tc.desc   A store filled only through single inserts still serves a complete ordered
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the QueryOrchestrationValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            query result with its batch counter at zero.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queryOnStorePopulatedByInsertPath', 0, () => {
      const contacts: Contact[] = [
        contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        contactOf('Grace Hopper', '13900139000', 'grace@example.com', 'Compiler Lane'),
        contactOf('Alan Turing', '13700137000', 'alan@example.com', 'Bletchley Park'),
        contactOf('Mira Patel', '13000130000', 'mira@example.com', 'Middle Road')
      ];
      for (let index = 0; index < contacts.length; index++) {
        store.insert(true, contacts[index], 'ON_CONFLICT_REPLACE');
      }
      const rows: Contact[] = store.query(true);
      expect(rows.length).assertEqual(4);
      expect(sameStringArray(contactNames(rows), contactNames(contacts))).assertTrue();
      expect(sameSnapshotArray(snapshotsOf(rows), snapshotsOf(contacts))).assertTrue();
      expect(store.insertCalls).assertEqual(4);
      expect(store.batchCalls).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(rows[3].phone).assertEqual('13000130000');
      expect(rows[0].address).assertEqual('River Road');
    });
  });
}
