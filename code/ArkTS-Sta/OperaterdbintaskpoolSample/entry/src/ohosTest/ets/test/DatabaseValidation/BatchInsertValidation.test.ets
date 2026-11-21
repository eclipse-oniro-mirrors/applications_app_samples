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
 * BatchInsertValidation pins the batch write path of the sample.
 *
 * Production anchors:
 *   DatabaseConnection.ets:139-148  batchInsertData logs a missing context and
 *                                   creates the store on demand
 *   DatabaseConnection.ets:150-171  one six column ValuesBucket per Contact
 *   DatabaseConnection.ets:173-180  relationalStore.batchInsert(TABLE_NAME, ...)
 *                                   resolves the row count, the catch branch
 *                                   falls back to 0
 *   TaskPool.ets:108-117            taskPoolExecuteBatchInsert keeps the count
 *                                   and returns 0 after a caught throw
 *   RdbConstant.ets:31-34           table name and the six contact columns
 *   OperateRDBInTaskPool.ets:74     the fifteen seeded rows
 *
 * StoreDouble reproduces the count contract: a successful call reports the
 * number of submitted rows, a rejected context reports -1 at the store layer
 * and 0 through the wrapper the page calls.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import {
  StoreDouble,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  joined,
  sameStringArray,
  countOf,
  uniqueStrings,
  wrappedBatchCount,
  expectedBatchCount,
  resetContactManager,
  ContactMetrics,
  SearchEngine,
  CATEGORIES,
  CONFLICT_REPLACE,
  INITIAL_STORE_VALUE,
  EXPECTED_INSERT_ROW,
  BUCKET_KEYS,
  FIELD_CATEGORY
} from '../Shared/SharedDriver';

export default function batchInsertValidationTest(): void {
  describe('BatchInsertValidation', () => {
    let store: StoreDouble = new StoreDouble();

    beforeAll(() => {
      logSuite('BatchInsertValidation', 'begin');
    });

    beforeEach(async () => {
      resetContactManager();
      store = new StoreDouble();
      store.reset();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });

    afterAll(() => {
      resetContactManager();
      logSuite('BatchInsertValidation', 'end');
    });

    /**
     * @tc.name   batchInsertWritePathStartsFromCleanStore
     * @tc.desc   A fresh store reports zero rows and zero calls, and the first batch insert
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            initializes the store and writes exactly one row.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchInsertWritePathStartsFromCleanStore', 0, () => {
      expect(store.rowCount()).assertEqual(INITIAL_STORE_VALUE);
      expect(store.batchCalls).assertEqual(0);
      expect(store.initialized).assertFalse();
      const source: Contact[] = [contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'No.1 River Road')];
      const written: number = store.batchInsert(true, source);
      expect(written).assertEqual(EXPECTED_INSERT_ROW);
      expect(store.rowCount()).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(store.createTableCalls).assertEqual(1);
      expect(store.queryCalls).assertEqual(0);
      expect(store.insertCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
      expect(store.updateCalls).assertEqual(0);
      expect(store.lastContextValid).assertTrue();
      logStep('BatchInsertValidation', 'first batch wrote ' + String(written) + ' row');
    });

    /**
     * @tc.name   batchInsertEmptyArrayReturnsZeroAndWritesNoRows
     * @tc.desc   An empty batch is accepted, reports a row count of zero and leaves the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            row array untouched.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchInsertEmptyArrayReturnsZeroAndWritesNoRows', 0, () => {
      const empty: Contact[] = [];
      const written: number = store.batchInsert(true, empty);
      expect(written).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.batchCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.rows.length).assertEqual(0);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.lastContextValid).assertTrue();
      expect(store.insertCalls).assertEqual(0);
      expect(store.names().length).assertEqual(0);
    });

    /**
     * @tc.name   batchInsertEmptyArrayStillInitializesStore
     * @tc.desc   The on-demand initialization runs even when the submitted array is empty,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            so the table creation counter advances exactly once.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertEmptyArrayStillInitializesStore', 0, () => {
      expect(store.initialized).assertFalse();
      store.batchInsert(true, []);
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.lastContextValid).assertTrue();
      expect(store.insertCalls).assertEqual(0);
    });

    /**
     * @tc.name   batchInsertSingleRowCopiesEveryField
     * @tc.desc   The single row stored by a one element batch carries the same six field
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            values as the submitted contact.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchInsertSingleRowCopiesEveryField', 0, () => {
      const source: Contact = contactOf('Grace Hopper', '13900139000', 'grace@example.com',
        'No.7 Compiler Lane', 'avatar.png', 'C');
      const written: number = store.batchInsert(true, [source]);
      expect(written).assertEqual(1);
      const stored: Contact = store.rows[0];
      expect(sameContact(stored, source)).assertTrue();
      expect(stored.name).assertEqual('Grace Hopper');
      expect(stored.phone).assertEqual('13900139000');
      expect(stored.email).assertEqual('grace@example.com');
      expect(stored.address).assertEqual('No.7 Compiler Lane');
      expect(store.rowCount()).assertEqual(1);
      expect(stored.avatar).assertEqual('avatar.png');
      expect(stored.category).assertEqual('C');
      expect(store.names()[0]).assertEqual('Grace Hopper');
    });

    /**
     * @tc.name   batchInsertFifteenSeedRowsKeepsProductionNames
     * @tc.desc   The fifteen rows seeded by the page round-trip through the batch path with
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            their production names in the original order.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchInsertFifteenSeedRowsKeepsProductionNames', 0, () => {
      const seed: Contact[] = createSeedContacts();
      const written: number = store.batchInsert(true, seed);
      expect(written).assertEqual(15);
      expect(store.rowCount()).assertEqual(15);
      expect(sameStringArray(store.names(), contactNames(seed))).assertTrue();
      expect(store.names()[0]).assertEqual('艾德里安');
      expect(store.names()[14]).assertEqual('法里');
      expect(store.batchCalls).assertEqual(1);
      expect(store.rows[0].phone).assertEqual('13333333333');
      expect(store.rows[1].email).assertEqual('arnold@example.com');
      expect(uniqueStrings(store.names()).length).assertEqual(15);
      expect(store.rows[0].address).assertEqual('江苏省南京市鼓楼区');
    });

    /**
     * @tc.name   batchInsertReturnsSubmittedLengthForSmallBatches
     * @tc.desc   Three consecutive batches of one, two and three rows each report their own
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            submitted length and accumulate to six stored rows.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertReturnsSubmittedLengthForSmallBatches', 0, () => {
      const first: Contact[] = [contactOf('Alan Turing', '13700137000', 'alan@example.com', 'Bletchley Park')];
      const second: Contact[] = [
        contactOf('Barbara Liskov', '13600136000', 'barbara@example.com', 'Data Street'),
        contactOf('Cecilia Payne', '13500135000', 'cecilia@example.com', 'Star Avenue')
      ];
      const third: Contact[] = [
        contactOf('Dorothy Vaughan', '13400134000', 'dorothy@example.com', 'Orbit Road'),
        contactOf('Edsger Dijkstra', '13300133000', 'edsger@example.com', 'Shortest Path'),
        contactOf('Frances Allen', '13200132000', 'frances@example.com', 'Compiler Square')
      ];
      expect(store.batchInsert(true, first)).assertEqual(1);
      expect(store.batchInsert(true, second)).assertEqual(2);
      expect(store.batchInsert(true, third)).assertEqual(3);
      expect(store.rowCount()).assertEqual(6);
      expect(store.batchCalls).assertEqual(3);
      expect(joined(store.names(), '|')).assertEqual(
        'Alan Turing|Barbara Liskov|Cecilia Payne|Dorothy Vaughan|Edsger Dijkstra|Frances Allen');
    });

    /**
     * @tc.name   batchInsertInvalidContextReturnsNegativeOne
     * @tc.desc   A rejected context makes the store layer report -1 and leaves the store
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            uninitialized with no stored rows.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchInsertInvalidContextReturnsNegativeOne', 0, () => {
      const source: Contact[] = [contactOf('Grace Hopper', '13900139000', 'grace@example.com', 'Compiler Lane')];
      const written: number = store.batchInsert(false, source);
      expect(written).assertEqual(-1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.batchCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.lastContextValid).assertFalse();
      expect(store.createTableCalls).assertEqual(0);
    });

    /**
     * @tc.name   batchInsertInvalidContextFallsBackThroughWrapper
     * @tc.desc   The page level wrapper converts the negative store count into the zero
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            fallback that taskPoolExecuteBatchInsert returns after a failure.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchInsertInvalidContextFallsBackThroughWrapper', 0, () => {
      const seed: Contact[] = createSeedContacts();
      const wrapped: number = wrappedBatchCount(false, store, seed);
      expect(wrapped).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.batchCalls).assertEqual(1);
      expect(store.initialized).assertFalse();
      expect(wrapped === expectedBatchCount(seed)).assertFalse();
    });

    /**
     * @tc.name   batchInsertInvalidContextLeavesOtherCountersUntouched
     * @tc.desc   A rejected batch attempt increments only the batch and init counters, not
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the insert, query, update or delete counters.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertInvalidContextLeavesOtherCountersUntouched', 0, () => {
      store.batchInsert(false, [contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road')]);
      expect(store.batchCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(0);
      expect(store.queryCalls).assertEqual(0);
      expect(store.updateCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
      expect(joined(store.names(), ',')).assertEqual('');
    });

    /**
     * @tc.name   batchInsertInitializesStoreExactlyOnceAcrossCalls
     * @tc.desc   Two successful batches share one initialization and one table creation while
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            both batch invocations are still counted.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchInsertInitializesStoreExactlyOnceAcrossCalls', 0, () => {
      const first: Contact[] = [contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road')];
      const second: Contact[] = [
        contactOf('Grace Hopper', '13900139000', 'grace@example.com', 'Compiler Lane'),
        contactOf('Alan Turing', '13700137000', 'alan@example.com', 'Bletchley Park')
      ];
      store.batchInsert(true, first);
      store.batchInsert(true, second);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(2);
      expect(store.rowCount()).assertEqual(3);
      expect(store.initialized).assertTrue();
    });

    /**
     * @tc.name   batchInsertInitializedStoreIgnoresInvalidContext
     * @tc.desc   Once initialized, a batch call with a rejected context still appends rows
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            because the store guard is evaluated before the context is consulted.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('batchInsertInitializedStoreIgnoresInvalidContext', 0, () => {
      store.batchInsert(true, [contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road')]);
      const written: number = store.batchInsert(false,
        [contactOf('Grace Hopper', '13900139000', 'grace@example.com', 'Compiler Lane')]);
      expect(written).assertEqual(1);
      expect(store.rowCount()).assertEqual(2);
      expect(store.initCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(2);
      expect(store.lastContextValid).assertTrue();
      expect(store.createTableCalls).assertEqual(1);
    });

    /**
     * @tc.name   batchInsertFirstInvalidThenValidSeedsRows
     * @tc.desc   The store recovers from a rejected first attempt: the second attempt with a
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            valid context creates the table and stores the submitted row.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertFirstInvalidThenValidSeedsRows', 0, () => {
      const source: Contact[] = [contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road')];
      expect(store.batchInsert(false, source)).assertEqual(-1);
      expect(store.initialized).assertFalse();
      const written: number = store.batchInsert(true, source);
      expect(written).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(2);
      expect(store.lastContextValid).assertTrue();
    });

    /**
     * @tc.name   batchInsertDuplicateRowsAreRetained
     * @tc.desc   Two identical contacts in one batch produce two stored rows because the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            bucket carries no id or unique constraint to collapse them.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertDuplicateRowsAreRetained', 0, () => {
      const row: Contact = contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road');
      const written: number = store.batchInsert(true, [row, cloneContact(row)]);
      expect(written).assertEqual(2);
      expect(store.rowCount()).assertEqual(2);
      expect(countOf(store.names(), 'Ada Lovelace')).assertEqual(2);
      expect(sameContact(store.rows[0], store.rows[1])).assertTrue();
      expect(uniqueStrings(store.names()).length).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   batchInsertPreservesSubmittedOrder
     * @tc.desc   Stored rows keep the submission order of the batch instead of being sorted
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            or reversed by the write path.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchInsertPreservesSubmittedOrder', 0, () => {
      const submitted: Contact[] = [
        contactOf('Zoe Quinn', '13100131000', 'zoe@example.com', 'Last Lane'),
        contactOf('Alan Turing', '13700137000', 'alan@example.com', 'Bletchley Park'),
        contactOf('Mira Patel', '13000130000', 'mira@example.com', 'Middle Road')
      ];
      store.batchInsert(true, submitted);
      expect(sameStringArray(store.names(), contactNames(submitted))).assertTrue();
      expect(store.names()[0]).assertEqual('Zoe Quinn');
      expect(store.names()[1]).assertEqual('Alan Turing');
      expect(store.names()[2]).assertEqual('Mira Patel');
      expect(store.names().indexOf('Alan Turing')).assertEqual(1);
    });

    /**
     * @tc.name   batchInsertClonesSourceRows
     * @tc.desc   Editing the submitted contact after the call does not change the stored row,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            because the batch path stores a copy of each field set.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertClonesSourceRows', 0, () => {
      const source: Contact = contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road');
      store.batchInsert(true, [source]);
      source.name = 'Changed Name';
      source.phone = '10000000000';
      source.email = 'changed@example.com';
      expect(store.rows[0].name).assertEqual('Ada Lovelace');
      expect(store.rows[0].phone).assertEqual('13800138000');
      expect(store.rows[0].email).assertEqual('ada@example.com');
      expect(sameContact(store.rows[0], source)).assertFalse();
      expect(store.rowCount()).assertEqual(1);
    });

    /**
     * @tc.name   batchInsertRowsAreIndependentFromStoreEdits
     * @tc.desc   Editing the stored row does not write back into the submitted contact, so
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            caller owned data stays untouched by later store mutations.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertRowsAreIndependentFromStoreEdits', 0, () => {
      const source: Contact = contactOf('Grace Hopper', '13900139000', 'grace@example.com', 'Compiler Lane');
      store.batchInsert(true, [source]);
      store.rows[0].phone = '11111111111';
      store.rows[0].category = 'F';
      expect(source.phone).assertEqual('13900139000');
      expect(source.category).assertEqual('');
      expect(store.rows[0].phone).assertEqual('11111111111');
      expect(store.rows[0].category).assertEqual('F');
      expect(source === store.rows[0]).assertFalse();
    });

    /**
     * @tc.name   batchInsertAccumulatesAcrossThreeCalls
     * @tc.desc   Batches of two, three and one row accumulate to six rows behind a single
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            initialization and three counted batch invocations.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertAccumulatesAcrossThreeCalls', 0, () => {
      store.batchInsert(true, [
        contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        contactOf('Alan Turing', '13700137000', 'alan@example.com', 'Bletchley Park')
      ]);
      store.batchInsert(true, [
        contactOf('Barbara Liskov', '13600136000', 'barbara@example.com', 'Data Street'),
        contactOf('Cecilia Payne', '13500135000', 'cecilia@example.com', 'Star Avenue'),
        contactOf('Dorothy Vaughan', '13400134000', 'dorothy@example.com', 'Orbit Road')
      ]);
      store.batchInsert(true, [contactOf('Edsger Dijkstra', '13300133000', 'edsger@example.com', 'Shortest Path')]);
      expect(store.rowCount()).assertEqual(6);
      expect(store.batchCalls).assertEqual(3);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.names()[5]).assertEqual('Edsger Dijkstra');
    });

    /**
     * @tc.name   batchInsertCountMatchesExpectedBatchCountOracle
     * @tc.desc   The reported count for the production seed equals the independent oracle
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            count of submitted rows.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchInsertCountMatchesExpectedBatchCountOracle', 0, () => {
      const seed: Contact[] = createSeedContacts();
      const written: number = store.batchInsert(true, seed);
      expect(written).assertEqual(expectedBatchCount(seed));
      expect(written).assertEqual(15);
      expect(store.rowCount()).assertEqual(expectedBatchCount(seed));
      expect(expectedBatchCount([])).assertEqual(0);
      expect(expectedBatchCount(seed) === seed.length).assertTrue();
    });

    /**
     * @tc.name   batchInsertSmallBatchCountMatchesOracleForEachSize
     * @tc.desc   For zero, one and two row batches the store count agrees with the oracle and
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the cumulative row total grows by exactly the submitted size.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertSmallBatchCountMatchesOracleForEachSize', 0, () => {
      const sizes: int[] = [0, 1, 2];
      const all: Contact[] = createSeedContacts();
      let expectedRows: number = 0;
      for (let index = 0; index < sizes.length; index++) {
        const size: int = sizes[index];
        const slice: Contact[] = all.slice(0, size);
        const written: number = store.batchInsert(true, slice);
        expect(written).assertEqual(size);
        expect(written).assertEqual(expectedBatchCount(slice));
        expectedRows = expectedRows + size;
        expect(store.rowCount()).assertEqual(expectedRows);
      }
      expect(store.batchCalls).assertEqual(3);
      expect(store.rowCount()).assertEqual(3);
    });

    /**
     * @tc.name   batchInsertKeepsEverySeedCategoryVisible
     * @tc.desc   The batch path preserves the category column, so all six production
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            categories survive the write and each keeps its seeded row count.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertKeepsEverySeedCategoryVisible', 0, () => {
      const seed: Contact[] = createSeedContacts();
      store.batchInsert(true, seed);
      const groups: string[] = SearchEngine.groupByCategory(store.rows);
      expect(groups.length).assertEqual(6);
      expect(sameStringArray(groups, CATEGORIES)).assertTrue();
      const expectedCounts: number[] = [2, 3, 3, 2, 3, 2];
      let total: number = 0;
      for (let index = 0; index < CATEGORIES.length; index++) {
        const category: string = CATEGORIES[index];
        const seen: number = SearchEngine.countCategory(store.rows, category);
        expect(seen).assertEqual(expectedCounts[index]);
        total = total + seen;
      }
      expect(total).assertEqual(15);
      logStep('BatchInsertValidation', 'categories kept: ' + joined(groups, ','));
    });

    /**
     * @tc.name   batchInsertMetricsReportFifteenUniqueNames
     * @tc.desc   Aggregating the stored rows yields fifteen distinct names, no duplicate
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            names, six categories and a full fill ratio.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertMetricsReportFifteenUniqueNames', 0, () => {
      store.batchInsert(true, createSeedContacts());
      const metrics: ContactMetrics = ContactMetrics.from(store.rows);
      expect(metrics.total).assertEqual(15);
      expect(metrics.uniqueNames).assertEqual(15);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.categories).assertEqual(6);
      expect(metrics.totalPhoneDigits).assertEqual(165);
      expect(metrics.fillRatio()).assertEqual(1);
      expect(metrics.fingerprint() === ContactMetrics.from([]).fingerprint()).assertFalse();
    });

    /**
     * @tc.name   batchInsertWithRepeatedPhonesKeepsAllRows
     * @tc.desc   Repeated phone numbers inside the seed do not merge rows, because the batch
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            path never inspects the phone column for uniqueness.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertWithRepeatedPhonesKeepsAllRows', 0, () => {
      store.batchInsert(true, createSeedContacts());
      const phones: string[] = [];
      for (let index = 0; index < store.rows.length; index++) {
        phones.push(store.rows[index].phone);
      }
      expect(store.rowCount()).assertEqual(15);
      expect(countOf(phones, '16666666666')).assertEqual(2);
      expect(countOf(phones, '11111111111')).assertEqual(5);
      expect(countOf(phones, '17777777777')).assertEqual(3);
      expect(uniqueStrings(phones).length).assertEqual(6);
      expect(store.names().length).assertEqual(phones.length);
    });

    /**
     * @tc.name   batchInsertAfterResetRestartsAccounting
     * @tc.desc   Resetting a populated store clears rows, initialization and every counter so
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            the next batch behaves like the first one on a fresh store.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertAfterResetRestartsAccounting', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 4));
      expect(store.rowCount()).assertEqual(4);
      expect(store.initialized).assertTrue();
      store.reset();
      expect(store.rowCount()).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.batchCalls).assertEqual(0);
      expect(store.initCalls).assertEqual(0);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.lastContextValid).assertFalse();
      const written: number = store.batchInsert(true, createSeedContacts().slice(0, 2));
      expect(written).assertEqual(2);
      expect(store.batchCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
    });

    /**
     * @tc.name   batchInsertThenQuerySeesSameRows
     * @tc.desc   After a batch seed the query path returns the same names in the same order
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            behind one counted query, while the batch counter stays at one.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertThenQuerySeesSameRows', 0, () => {
      const seed: Contact[] = createSeedContacts();
      store.batchInsert(true, seed);
      const readBack: Contact[] = store.query(true);
      expect(readBack.length).assertEqual(15);
      expect(sameStringArray(contactNames(readBack), contactNames(seed))).assertTrue();
      expect(store.queryCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(15);
      const second: Contact[] = store.query(true);
      expect(second.length).assertEqual(readBack.length);
      expect(store.queryCalls).assertEqual(2);
    });

    /**
     * @tc.name   batchInsertThenDeleteCountersStayIndependent
     * @tc.desc   A delete that follows a batch seed removes the matching name and advances
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            only the delete counter, leaving the batch accounting intact.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertThenDeleteCountersStayIndependent', 0, () => {
      store.batchInsert(true, createSeedContacts());
      const removed: number = store.deleteByName('本');
      expect(removed).assertEqual(1);
      expect(store.rowCount()).assertEqual(14);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(0);
      expect(store.names().indexOf('本')).assertEqual(-1);
      expect(store.names().indexOf('本杰明') >= 0).assertTrue();
      expect(store.initCalls).assertEqual(1);
    });

    /**
     * @tc.name   batchInsertRowsExposeSixBucketFields
     * @tc.desc   Every stored row exposes the six bucket columns in declaration order and the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            avatar column written by the seed is an empty string rather than a value.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertRowsExposeSixBucketFields', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 1));
      const row: Contact = store.rows[0];
      expect(BUCKET_KEYS.length).assertEqual(6);
      expect(BUCKET_KEYS[0]).assertEqual('name');
      expect(BUCKET_KEYS[4]).assertEqual('avatar');
      expect(BUCKET_KEYS[5]).assertEqual(FIELD_CATEGORY);
      expect(row.name.length > 0).assertTrue();
      expect(row.phone.length > 0).assertTrue();
      expect(row.email.indexOf('@') > 0).assertTrue();
      expect(row.address.length > 0).assertTrue();
      expect(row.avatar).assertEqual('');
      expect(row.category).assertEqual('A');
    });

    /**
     * @tc.name   batchInsertEmptyBatchAfterPopulatedStoreKeepsRows
     * @tc.desc   An empty batch submitted after a successful seed reports zero, does not clear
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            stored rows and does not re-run initialization.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('batchInsertEmptyBatchAfterPopulatedStoreKeepsRows', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      const written: number = store.batchInsert(true, []);
      expect(written).assertEqual(0);
      expect(store.rowCount()).assertEqual(3);
      expect(store.batchCalls).assertEqual(2);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.names()[2]).assertEqual('贝拉');
    });

    /**
     * @tc.name   batchInsertConflictConstantDoesNotAlterBatchCount
     * @tc.desc   The replace conflict strategy only belongs to single inserts; a batch call
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            made after such an insert still reports its own submitted row count.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('batchInsertConflictConstantDoesNotAlterBatchCount', 0, () => {
      expect(CONFLICT_REPLACE).assertEqual('ON_CONFLICT_REPLACE');
      expect(INITIAL_STORE_VALUE).assertEqual(0);
      expect(EXPECTED_INSERT_ROW).assertEqual(1);
      store.insert(true, contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        CONFLICT_REPLACE);
      const written: number = store.batchInsert(true, [
        contactOf('Grace Hopper', '13900139000', 'grace@example.com', 'Compiler Lane'),
        contactOf('Alan Turing', '13700137000', 'alan@example.com', 'Bletchley Park')
      ]);
      expect(written).assertEqual(2);
      expect(store.insertCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(3);
      expect(store.names()[0]).assertEqual('Ada Lovelace');
    });

    /**
     * @tc.name   batchInsertMixedPayloadKeepsNamesAndPhonesAligned
     * @tc.desc   For a mixed batch the stored name at each index still pairs with the phone
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            submitted at that index, so no column shifts during the bucket build.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertMixedPayloadKeepsNamesAndPhonesAligned', 0, () => {
      const batch: Contact[] = [
        contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'No.1 River Road', '', 'A'),
        contactOf('Grace Hopper', '13900139000', 'grace@example.com', 'No.7 Compiler Lane', '', 'B'),
        contactOf('Alan Turing', '13700137000', 'alan@example.com', 'Bletchley Park', '', 'C'),
        contactOf('Barbara Liskov', '13600136000', 'barbara@example.com', 'Data Street', '', 'D'),
        contactOf('Cecilia Payne', '13500135000', 'cecilia@example.com', 'Star Avenue', '', 'E'),
        contactOf('Dorothy Vaughan', '13400134000', 'dorothy@example.com', 'Orbit Road', '', 'F')
      ];
      const written: number = store.batchInsert(true, batch);
      expect(written).assertEqual(batch.length);
      expect(store.rowCount()).assertEqual(6);
      for (let index = 0; index < batch.length; index++) {
        expect(store.rows[index].name).assertEqual(batch[index].name);
        expect(store.rows[index].phone).assertEqual(batch[index].phone);
        expect(store.rows[index].email).assertEqual(batch[index].email);
        expect(store.rows[index].address).assertEqual(batch[index].address);
        expect(store.rows[index].category).assertEqual(batch[index].category);
      }
      expect(sameStringArray(store.names(), contactNames(batch))).assertTrue();
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   batchInsertAfterResetWithInvalidContextFailsAgain
     * @tc.desc   A store that was initialized, reset and then handed a rejected context
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            reports -1 again because reset clears the initialized guard.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('batchInsertAfterResetWithInvalidContextFailsAgain', 0, () => {
      const source: Contact[] = [contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road')];
      expect(store.batchInsert(true, source)).assertEqual(1);
      expect(store.initialized).assertTrue();
      store.reset();
      expect(store.initialized).assertFalse();
      expect(store.batchInsert(false, source)).assertEqual(-1);
      expect(store.initialized).assertFalse();
      expect(store.rowCount()).assertEqual(0);
      expect(store.batchCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(1);
      expect(store.lastContextValid).assertFalse();
      expect(store.createTableCalls).assertEqual(0);
      logStep('BatchInsertValidation', 'reset store rejected the context again');
    });

    /**
     * @tc.name   batchInsertSeedRowsCarryEmptyAvatarSoNoPathIsLost
     * @tc.desc   Every seeded row submitted through the batch keeps the empty avatar string
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            and a non-empty category, so both optional looking columns survive.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertSeedRowsCarryEmptyAvatarSoNoPathIsLost', 0, () => {
      store.batchInsert(true, createSeedContacts());
      let emptyAvatars: number = 0;
      let filledCategories: number = 0;
      for (let index = 0; index < store.rows.length; index++) {
        if (store.rows[index].avatar.length === 0) {
          emptyAvatars = emptyAvatars + 1;
        }
        if (store.rows[index].category.length === 1) {
          filledCategories = filledCategories + 1;
        }
      }
      expect(emptyAvatars).assertEqual(15);
      expect(filledCategories).assertEqual(15);
      expect(store.rows[0].avatar).assertEqual('');
      expect(store.rows[0].category).assertEqual('A');
      expect(store.rows[14].category).assertEqual('F');
      expect(store.rowCount()).assertEqual(emptyAvatars);
    });

    /**
     * @tc.name   batchInsertAndSingleInsertShareTheRowArray
     * @tc.desc   A single insert issued before a batch and one issued after it appear in the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            same row array in call order, while each counter records its own path.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('batchInsertAndSingleInsertShareTheRowArray', 0, () => {
      store.insert(true, contactOf('Zoe Quinn', '13100131000', 'zoe@example.com', 'Last Lane'), CONFLICT_REPLACE);
      store.batchInsert(true, [
        contactOf('Ada Lovelace', '13800138000', 'ada@example.com', 'River Road'),
        contactOf('Grace Hopper', '13900139000', 'grace@example.com', 'Compiler Lane')
      ]);
      store.insert(true, contactOf('Alan Turing', '13700137000', 'alan@example.com', 'Bletchley Park'),
        CONFLICT_REPLACE);
      expect(store.rowCount()).assertEqual(4);
      expect(store.insertCalls).assertEqual(2);
      expect(store.batchCalls).assertEqual(1);
      expect(store.names()[0]).assertEqual('Zoe Quinn');
      expect(store.names()[3]).assertEqual('Alan Turing');
      expect(sameStringArray(store.names(), ['Zoe Quinn', 'Ada Lovelace', 'Grace Hopper', 'Alan Turing']))
        .assertTrue();
    });

    /**
     * @tc.name   batchInsertCountersSurviveRejectedQueries
     * @tc.desc   Query attempts that return an empty array because of a rejected context do
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            not disturb the batch counter or the rows written by an earlier batch.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('batchInsertCountersSurviveRejectedQueries', 0, () => {
      store.batchInsert(true, createSeedContacts().slice(0, 5));
      const rejected: Contact[] = store.query(false);
      const accepted: Contact[] = store.query(true);
      expect(rejected.length).assertEqual(0);
      expect(accepted.length).assertEqual(5);
      expect(store.queryCalls).assertEqual(2);
      expect(store.batchCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(5);
      expect(store.insertCalls).assertEqual(0);
      expect(accepted[4].name).assertEqual('本杰明');
      expect(rejected === accepted).assertFalse();
    });

    /**
     * @tc.name   batchInsertSameNameRowsKeepDistinctPayloads
     * @tc.desc   Two rows sharing a name but differing in phone and category are both stored,
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            and the aggregate metrics see one unique name plus one duplicate.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('batchInsertSameNameRowsKeepDistinctPayloads', 0, () => {
      const batch: Contact[] = [
        contactOf('Mira Patel', '13000130000', 'mira@example.com', 'Middle Road', '', 'A'),
        contactOf('Mira Patel', '13000130001', 'mira.work@example.com', 'Middle Road', '', 'F')
      ];
      const written: number = store.batchInsert(true, batch);
      expect(written).assertEqual(2);
      expect(countOf(store.names(), 'Mira Patel')).assertEqual(2);
      expect(store.rows[0].phone === store.rows[1].phone).assertFalse();
      expect(store.rows[0].category).assertEqual('A');
      expect(store.rows[1].category).assertEqual('F');
      const metrics: ContactMetrics = ContactMetrics.from(store.rows);
      expect(metrics.total).assertEqual(2);
      expect(metrics.uniqueNames).assertEqual(1);
      expect(metrics.duplicateNames).assertEqual(1);
      expect(metrics.fillRatio()).assertEqual(0.5);
    });

    /**
     * @tc.name   batchInsertWrappedCountEqualsRawCountForValidContext
     * @tc.desc   With a valid context the wrapper forwards the store count unchanged, so the
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchInsertValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     *            value the taskpool returns matches the number of submitted contacts.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertWrappedCountEqualsRawCountForValidContext', 0, () => {
      const seed: Contact[] = createSeedContacts();
      const wrapped: number = wrappedBatchCount(true, store, seed);
      expect(wrapped).assertEqual(15);
      expect(wrapped).assertEqual(expectedBatchCount(seed));
      expect(store.batchCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(15);
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(1);
      expect(store.lastContextValid).assertTrue();
      expect(wrapped === INITIAL_STORE_VALUE).assertFalse();
    });
  });
}
