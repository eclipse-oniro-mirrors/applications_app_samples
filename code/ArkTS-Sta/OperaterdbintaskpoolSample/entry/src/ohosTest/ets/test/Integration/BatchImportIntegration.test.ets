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

/*
 * Batch import integration. Anchors:
 *   OperateRDBInTaskPool.ets:53-69   fifteen literal Contact rows
 *   OperateRDBInTaskPool.ets:74-80   one-time seed through syncAddressBookListData and setContacts
 *   OperateRDBInTaskPool.ets:124-139 batch insert then query chain
 *   DatabaseConnection.ets:139-181   bucket build per row and row count return
 *   DatabaseConnection.ets:277-309   first row skip plus name+phone dedupe
 *   ContactManager.ets:45-48         setContacts copies the incoming array
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  BUCKET_KEYS,
  FIELD_NAME,
  FIELD_PHONE,
  FIELD_EMAIL,
  FIELD_ADDRESS,
  FIELD_AVATAR,
  FIELD_CATEGORY,
  CATEGORIES,
  ContactMapper,
  StoreDouble,
  CursorResultSet,
  readContactsFromResultSet,
  expectedVisibleRows,
  expectedVisibleCount,
  expectedBatchCount,
  wrappedBatchCount,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  joined,
  sameStringArray,
  countOf,
  uniqueStrings,
  textFingerprint,
  resetContactManager,
  SearchEngine,
  ContactMetrics,
  snapshotsOf,
  sameSnapshotArray
} from '../Shared/SharedDriver';
import { logSuite, logStep } from '../Shared/Support';

export default function batchImportIntegrationTest(): void {
  describe('BatchImportIntegration', () => {
    const store: StoreDouble = new StoreDouble();

    beforeAll(() => {
      logSuite('BatchImportIntegration', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      store.reset();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('BatchImportIntegration', 'end');
    });

    /**
     * @tc.name   batchSeedFactoryReturnsFifteenRows
     * @tc.desc   The seed builder reproduces the fifteen literal rows declared by the list page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchSeedFactoryReturnsFifteenRows', 0, () => {
      const seed = createSeedContacts();
      logStep('batchSeedFactoryReturnsFifteenRows', String(seed.length));
      expect(seed.length).assertEqual(15);
      expect(seed[0].name).assertEqual('艾德里安');
      expect(seed[14].name).assertEqual('法里');
      expect(seed[0].category).assertEqual('A');
      expect(seed[14].category).assertEqual('F');
      expect(expectedBatchCount(seed)).assertEqual(15);
    });

    /**
     * @tc.name   batchSeedNamesAreAllDistinct
     * @tc.desc   None of the fifteen seeded display names repeat, which keeps manager counts simple.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchSeedNamesAreAllDistinct', 0, () => {
      const seed = createSeedContacts();
      const names = contactNames(seed);
      const unique = uniqueStrings(names);
      expect(names.length).assertEqual(15);
      expect(unique.length).assertEqual(15);
      expect(countOf(names, '本')).assertEqual(1);
      expect(countOf(names, '本杰明')).assertEqual(1);
      expect(names.indexOf('本杰明') > names.indexOf('本')).assertTrue();
    });

    /**
     * @tc.name   batchSeedCategoriesSpanSixLabels
     * @tc.desc   Grouping the seed rows yields A through F in first appearance order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchSeedCategoriesSpanSixLabels', 0, () => {
      const seed = createSeedContacts();
      const groups = SearchEngine.groupByCategory(seed);
      expect(groups.length).assertEqual(6);
      expect(sameStringArray(groups, CATEGORIES)).assertTrue();
      expect(SearchEngine.countCategory(seed, 'A')).assertEqual(2);
      expect(SearchEngine.countCategory(seed, 'B')).assertEqual(3);
      expect(SearchEngine.countCategory(seed, 'F')).assertEqual(2);
      expect(textFingerprint(joined(groups, '')) > 0).assertTrue();
    });

    /**
     * @tc.name   batchInsertWritesFifteenRowsInOneCall
     * @tc.desc   One batch call appends the whole seed array and reports a single batch counter tick.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchInsertWritesFifteenRowsInOneCall', 0, () => {
      const seed = createSeedContacts();
      const written = store.batchInsert(true, seed);
      expect(written).assertEqual(15);
      expect(store.rowCount()).assertEqual(15);
      expect(store.batchCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(0);
      expect(store.names()[0]).assertEqual('艾德里安');
      expect(store.names()[14]).assertEqual('法里');
    });

    /**
     * @tc.name   batchInsertReturnsTheSubmittedRowCount
     * @tc.desc   The wrapper forwards the batch row count unchanged under a valid ability context.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertReturnsTheSubmittedRowCount', 0, () => {
      const seed = createSeedContacts();
      expect(wrappedBatchCount(true, store, seed)).assertEqual(15);
      expect(wrappedBatchCount(true, store, seed.slice(0, 4))).assertEqual(4);
      expect(store.rowCount()).assertEqual(19);
      expect(store.batchCalls).assertEqual(2);
      expect(store.initialized).assertTrue();
      expect(store.createTableCalls).assertEqual(1);
    });

    /**
     * @tc.name   batchInsertInitializesAnUninitializedStore
     * @tc.desc   A batch on the raw store triggers init, creates the table once and then writes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertInitializesAnUninitializedStore', 0, () => {
      expect(store.initialized).assertFalse();
      expect(store.initCalls).assertEqual(0);
      const written = store.batchInsert(true, createSeedContacts());
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      expect(written).assertEqual(15);
      expect(store.lastContextValid).assertTrue();
    });

    /**
     * @tc.name   batchInsertUsesFallbackZeroWithoutContext
     * @tc.desc   Without a host context the batch cannot initialize, and the wrapper reports the zero fallback.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchInsertUsesFallbackZeroWithoutContext', 0, () => {
      const seed = createSeedContacts();
      expect(store.batchInsert(false, seed)).assertEqual(-1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.lastContextValid).assertFalse();
      expect(wrappedBatchCount(false, store, seed)).assertEqual(0);
      expect(store.batchCalls).assertEqual(2);
    });

    /**
     * @tc.name   batchTwoCallsAccumulateThirtyRows
     * @tc.desc   Importing the same seed twice leaves thirty physical rows because no id is supplied.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchTwoCallsAccumulateThirtyRows', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      store.batchInsert(true, seed);
      expect(store.rowCount()).assertEqual(30);
      expect(store.batchCalls).assertEqual(2);
      expect(countOf(store.names(), '艾德里安')).assertEqual(2);
      expect(store.names()[15]).assertEqual('艾德里安');
      expect(expectedVisibleCount(store.query(true))).assertEqual(15);
    });

    /**
     * @tc.name   batchQueryCopiesRowsOutOfTheStore
     * @tc.desc   Query returns cloned contacts, so editing the returned row cannot corrupt the import.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchQueryCopiesRowsOutOfTheStore', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const rows = store.query(true);
      expect(rows.length).assertEqual(15);
      rows[3].phone = '00000000000';
      rows.splice(0, 5);
      const again = store.query(true);
      expect(again.length).assertEqual(15);
      expect(again[3].phone).assertEqual('12222222222');
      expect(store.rowCount()).assertEqual(15);
      expect(sameContact(again[3], seed[3])).assertTrue();
    });

    /**
     * @tc.name   batchQueryBeforeImportIsEmpty
     * @tc.desc   The list page queries before seeding only in the empty test path; the result is an empty array.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchQueryBeforeImportIsEmpty', 0, () => {
      const rows = store.query(true);
      expect(rows.length).assertEqual(0);
      expect(store.queryCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      expect(readContactsFromResultSet(new CursorResultSet(rows)).length).assertEqual(0);
      expect(expectedVisibleRows(rows).length).assertEqual(0);
    });

    /**
     * @tc.name   batchCursorWalkDropsTheFirstSeedRow
     * @tc.desc   readContactsFromResultSet advances twice before reading, hiding the first stored row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchCursorWalkDropsTheFirstSeedRow', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const cursor = new CursorResultSet(store.query(true));
      expect(cursor.rowCount()).assertEqual(15);
      const visible = readContactsFromResultSet(cursor);
      expect(visible.length).assertEqual(14);
      expect(visible[0].name).assertEqual(seed[1].name);
      expect(contactNames(visible).indexOf(seed[0].name)).assertEqual(-1);
      expect(cursor.closed).assertTrue();
      expect(cursor.isAfterLast()).assertTrue();
    });

    /**
     * @tc.name   batchCursorProjectionHasFourteenRows
     * @tc.desc   The projected names are exactly the seed tail, not the full fifteen row seed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchCursorProjectionHasFourteenRows', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      const expectedNames = contactNames(seed).slice(1);
      expect(visible.length).assertEqual(14);
      expect(sameStringArray(contactNames(visible), expectedNames)).assertTrue();
      expect(visible[13].name).assertEqual('法里');
      expect(visible[0].category).assertEqual('A');
      expect(SearchEngine.groupByCategory(visible).length).assertEqual(6);
    });

    /**
     * @tc.name   batchProjectionMatchesIndependentOracle
     * @tc.desc   The driver cursor and the independent expectedVisibleRows oracle agree row by row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchProjectionMatchesIndependentOracle', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      const oracle = expectedVisibleRows(store.query(true));
      expect(oracle.length).assertEqual(visible.length);
      expect(sameSnapshotArray(snapshotsOf(visible), snapshotsOf(oracle))).assertTrue();
      expect(expectedVisibleCount(store.query(true))).assertEqual(14);
      expect(oracle[13].email).assertEqual('katrina@example.com');
      expect(joined(contactNames(oracle), '|')).assertEqual(joined(contactNames(visible), '|'));
    });

    /**
     * @tc.name   batchDuplicateNameAndPhoneCollapseOnRead
     * @tc.desc   Two rows sharing both name and phone survive the store but collapse in the projection.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchDuplicateNameAndPhoneCollapseOnRead', 0, () => {
      const first = contactOf('重复联系人', '13500001111', 'dup@example.com', '天津市和平区');
      const second = contactOf('重复联系人', '13500001111', 'other@example.com', '重庆市渝中区');
      const filler = contactOf('前哨', '13600002222', 'front@example.com', '河北省石家庄市');
      store.batchInsert(true, [filler, first, second]);
      expect(store.rowCount()).assertEqual(3);
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(visible.length).assertEqual(1);
      expect(visible[0].name).assertEqual('重复联系人');
      expect(visible[0].email).assertEqual('dup@example.com');
      expect(countOf(contactNames(visible), '重复联系人')).assertEqual(1);
    });

    /**
     * @tc.name   batchDuplicateEmailDoesNotCollapseRows
     * @tc.desc   The dedupe key is name plus phone, so a shared email or address keeps both rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchDuplicateEmailDoesNotCollapseRows', 0, () => {
      const first = contactOf('甲', '13500001111', 'shared@example.com', '同一地址');
      const second = contactOf('乙', '13500002222', 'shared@example.com', '同一地址');
      const third = contactOf('丙', '13500003333', 'shared@example.com', '同一地址');
      store.batchInsert(true, [first, second, third]);
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(visible.length).assertEqual(2);
      expect(sameStringArray(contactNames(visible), ['乙', '丙'])).assertTrue();
      expect(visible[0].email).assertEqual(visible[1].email);
      expect(store.query(true).length).assertEqual(3);
    });

    /**
     * @tc.name   batchFirstRowSkipHidesOnlyTheFirstCopy
     * @tc.desc   Only slot zero is skipped; a later row with the same name and phone is still projected.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchFirstRowSkipHidesOnlyTheFirstCopy', 0, () => {
      const twin = contactOf('双生', '13500001111', 'twin@example.com', '黑龙江省哈尔滨市');
      const middle = contactOf('中间', '13600002222', 'middle@example.com', '山东省济南市');
      store.batchInsert(true, [twin, middle, cloneContact(twin)]);
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(visible.length).assertEqual(2);
      expect(visible[0].name).assertEqual('中间');
      expect(visible[1].name).assertEqual('双生');
      expect(countOf(contactNames(visible), '双生')).assertEqual(1);
      expect(expectedVisibleRows(store.query(true)).length).assertEqual(2);
    });

    /**
     * @tc.name   batchSingleRowImportProjectsNothing
     * @tc.desc   With exactly one physical row the cursor pre-advance leaves no row for the list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchSingleRowImportProjectsNothing', 0, () => {
      store.batchInsert(true, [contactOf('独行', '13500001111', 'single@example.com', '甘肃省兰州市')]);
      expect(store.rowCount()).assertEqual(1);
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(visible.length).assertEqual(0);
      expect(contactNames(visible).length).assertEqual(0);
      expect(expectedVisibleCount(store.query(true))).assertEqual(0);
      expect(store.query(true).length).assertEqual(1);
    });

    /**
     * @tc.name   batchTwoRowImportProjectsTheSecondOnly
     * @tc.desc   Two imported rows yield one visible contact, pinned to the second submitted row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchTwoRowImportProjectsTheSecondOnly', 0, () => {
      const first = contactOf('第一', '13500001111', 'first@example.com', '云南省昆明市');
      const second = contactOf('第二', '13600002222', 'second@example.com', '贵州省贵阳市');
      store.batchInsert(true, [first, second]);
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(visible.length).assertEqual(1);
      expect(visible[0].name).assertEqual('第二');
      expect(visible[0].phone).assertEqual('13600002222');
      expect(visible[0].address).assertEqual('贵州省贵阳市');
      expect(visible[0].name).assertEqual(store.names()[1]);
    });

    /**
     * @tc.name   batchZeroRowsInitializesButWritesNothing
     * @tc.desc   An empty seed still initializes the store and creates the table exactly once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('batchZeroRowsInitializesButWritesNothing', 0, () => {
      const written = store.batchInsert(true, []);
      expect(written).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.initialized).assertTrue();
      expect(store.createTableCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.names().length).assertEqual(0);
    });

    /**
     * @tc.name   batchManagerSeedMirrorsTheDataArray
     * @tc.desc   After the seed the page reads the singleton and sees the same order and count as dataArray.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchManagerSeedMirrorsTheDataArray', 0, () => {
      const manager = ContactManager.getInstance();
      const dataArray = createSeedContacts();
      manager.setContacts(dataArray);
      const contacts = manager.getContacts();
      expect(contacts.length).assertEqual(dataArray.length);
      expect(contacts.length).assertEqual(15);
      expect(contacts[0].name).assertEqual(dataArray[0].name);
      expect(contacts[7].name).assertEqual('卡特琳娜');
      expect(contacts[14].name).assertEqual(dataArray[14].name);
      expect(sameSnapshotArray(snapshotsOf(contacts), snapshotsOf(dataArray))).assertTrue();
    });

    /**
     * @tc.name   batchManagerSeedIsDefensiveAgainstLaterBatch
     * @tc.desc   The manager copy is independent from the array later handed to the batch insert.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchManagerSeedIsDefensiveAgainstLaterBatch', 0, () => {
      const manager = ContactManager.getInstance();
      const dataArray = createSeedContacts();
      manager.setContacts(dataArray);
      store.batchInsert(true, dataArray);
      dataArray.splice(0, 13);
      expect(manager.getContacts().length).assertEqual(15);
      expect(manager.getContacts()[0].name).assertEqual('艾德里安');
      expect(store.rowCount()).assertEqual(15);
      expect(store.names()[0]).assertEqual('艾德里安');
      expect(dataArray.length).assertEqual(2);
    });

    /**
     * @tc.name   batchListProjectionUsesManagerOrderNotCursorOrder
     * @tc.desc   The refreshed list starts at the first seeded name while the store projection starts at the second.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchListProjectionUsesManagerOrderNotCursorOrder', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const list = manager.getContacts();
      const projection = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(list[0].name).assertEqual('艾德里安');
      expect(projection[0].name).assertEqual('阿诺德');
      expect(list.length).assertEqual(15);
      expect(projection.length).assertEqual(14);
      expect(contactNames(list).indexOf(projection[0].name)).assertEqual(1);
    });

    /**
     * @tc.name   batchBucketsCarrySixKeysForEveryRow
     * @tc.desc   ContactMapper.toBuckets produces one six key bucket per seed row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchBucketsCarrySixKeysForEveryRow', 0, () => {
      const seed = createSeedContacts();
      const buckets = ContactMapper.toBuckets(seed);
      expect(buckets.length).assertEqual(15);
      for (let index = 0; index < buckets.length; index++) {
        expect(buckets[index].size()).assertEqual(6);
        expect(buckets[index].get(FIELD_NAME)).assertEqual(seed[index].name);
        expect(buckets[index].has(FIELD_AVATAR)).assertTrue();
      }
      expect(buckets[0].get(FIELD_CATEGORY)).assertEqual('A');
      expect(buckets[14].get(FIELD_PHONE)).assertEqual('11111111111');
    });

    /**
     * @tc.name   batchBucketColumnOrderIsStable
     * @tc.desc   Every generated bucket lists the columns in the CREATE TABLE order used by production.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchBucketColumnOrderIsStable', 0, () => {
      const buckets = ContactMapper.toBuckets(createSeedContacts());
      const expectedOrder = joined(BUCKET_KEYS, ',');
      expect(expectedOrder).assertEqual('name,phone,email,address,avatar,category');
      expect(joined(buckets[0].keys, ',')).assertEqual(expectedOrder);
      expect(joined(buckets[9].keys, ',')).assertEqual(expectedOrder);
      expect(buckets[9].keyAt(0)).assertEqual(FIELD_NAME);
      expect(buckets[9].keyAt(5)).assertEqual(FIELD_CATEGORY);
      expect(buckets[9].valueAt(2)).assertEqual(createSeedContacts()[9].email);
    });

    /**
     * @tc.name   batchMetricsOfSeedRows
     * @tc.desc   The seed metrics report fifteen rows, fifteen names, six categories and 165 phone characters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchMetricsOfSeedRows', 0, () => {
      const metrics = ContactMetrics.from(createSeedContacts());
      logStep('batchMetricsOfSeedRows', String(metrics.fingerprint()));
      expect(metrics.total).assertEqual(15);
      expect(metrics.uniqueNames).assertEqual(15);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.categories).assertEqual(6);
      expect(metrics.totalPhoneDigits).assertEqual(165);
      expect(metrics.fillRatio()).assertEqual(1);
      expect(metrics.fingerprint() > 0).assertTrue();
    });

    /**
     * @tc.name   batchMetricsAfterProjectionDropsFirstRow
     * @tc.desc   Projecting the store removes one row, lowering totals but keeping all six categories.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchMetricsAfterProjectionDropsFirstRow', 0, () => {
      store.batchInsert(true, createSeedContacts());
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      const metrics = ContactMetrics.from(visible);
      expect(metrics.total).assertEqual(14);
      expect(metrics.uniqueNames).assertEqual(14);
      expect(metrics.categories).assertEqual(6);
      expect(metrics.totalPhoneDigits).assertEqual(154);
      expect(metrics.fingerprint() === ContactMetrics.from(createSeedContacts()).fingerprint()).assertFalse();
    });

    /**
     * @tc.name   batchSecondIdenticalImportProjectsFifteenNames
     * @tc.desc   Thirty physical rows hold each seed twice, yet the skip plus dedupe leaves fifteen unique names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchSecondIdenticalImportProjectsFifteenNames', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      store.batchInsert(true, seed);
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(store.rowCount()).assertEqual(30);
      expect(visible.length).assertEqual(15);
      expect(uniqueStrings(contactNames(visible)).length).assertEqual(15);
      expect(countOf(contactNames(visible), '艾德里安')).assertEqual(1);
      expect(countOf(contactNames(visible), '阿诺德')).assertEqual(1);
      expect(visible[0].name).assertEqual(seed[1].name);
      expect(visible[14].name).assertEqual(seed[0].name);
    });

    /**
     * @tc.name   batchSeedRowValuesMatchTheDeclaredLiterals
     * @tc.desc   Spot checks confirm name, phone, email, address and category follow the page literals.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('batchSeedRowValuesMatchTheDeclaredLiterals', 0, () => {
      const seed = createSeedContacts();
      expect(seed[0].phone).assertEqual('13333333333');
      expect(seed[0].email).assertEqual('aidelian@example.com');
      expect(seed[1].address).assertEqual('上海市浦东新区');
      expect(seed[5].name).assertEqual('卡梅隆');
      expect(seed[5].category).assertEqual('C');
      expect(seed[10].phone).assertEqual('17777777777');
      expect(seed[14].email).assertEqual('katrina@example.com');
    });

    /**
     * @tc.name   batchSeedPhoneDigitsAreElevenEach
     * @tc.desc   Every seeded phone string has eleven characters, matching the literal data array.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchSeedPhoneDigitsAreElevenEach', 0, () => {
      const seed = createSeedContacts();
      let shortRows = 0;
      for (let index = 0; index < seed.length; index++) {
        if (seed[index].phone.length !== 11) {
          shortRows = shortRows + 1;
        }
      }
      expect(shortRows).assertEqual(0);
      expect(seed[4].phone.length).assertEqual(11);
      expect(ContactMetrics.from(seed).totalPhoneDigits).assertEqual(seed.length * 11);
      expect(uniqueStrings(contactNames(seed)).length).assertEqual(15);
    });

    /**
     * @tc.name   batchExpectedBatchCountFollowsContentLength
     * @tc.desc   The batch row count oracle tracks the submitted array length, including the empty case.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('batchExpectedBatchCountFollowsContentLength', 0, () => {
      expect(expectedBatchCount([])).assertEqual(0);
      expect(expectedBatchCount(createSeedContacts().slice(0, 1))).assertEqual(1);
      expect(expectedBatchCount(createSeedContacts().slice(0, 7))).assertEqual(7);
      expect(expectedBatchCount(createSeedContacts())).assertEqual(15);
      expect(expectedBatchCount(createSeedContacts().concat(createSeedContacts()))).assertEqual(30);
    });

    /**
     * @tc.name   batchCategoryTotalsSumToFifteen
     * @tc.desc   Counting A through F one by one adds back to the total seed size.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchCategoryTotalsSumToFifteen', 0, () => {
      const seed = createSeedContacts();
      let total = 0;
      for (let index = 0; index < CATEGORIES.length; index++) {
        const count = SearchEngine.countCategory(seed, CATEGORIES[index]);
        expect(count > 0).assertTrue();
        total = total + count;
      }
      expect(total).assertEqual(15);
      expect(SearchEngine.countCategory(seed, 'G')).assertEqual(0);
      expect(SearchEngine.countCategory(createSeedContacts().slice(0, 5), 'C')).assertEqual(0);
    });

    /**
     * @tc.name   batchProjectionKeepsAvatarEmptyForSeed
     * @tc.desc   The seed leaves avatar blank, and the cursor reader copies that empty column through.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchProjectionKeepsAvatarEmptyForSeed', 0, () => {
      store.batchInsert(true, createSeedContacts());
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      let nonEmpty = 0;
      for (let index = 0; index < visible.length; index++) {
        if (visible[index].avatar.length > 0) {
          nonEmpty = nonEmpty + 1;
        }
      }
      expect(nonEmpty).assertEqual(0);
      expect(visible[0].avatar).assertEqual('');
      expect(visible[13].avatar).assertEqual('');
      expect(BUCKET_KEYS[4]).assertEqual(FIELD_AVATAR);
      expect(FIELD_ADDRESS).assertEqual('address');
    });

    /**
     * @tc.name   batchStoreCountersTrackOnlyBatchCalls
     * @tc.desc   Batch inserts never touch the single insert, update or delete counters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchStoreCountersTrackOnlyBatchCalls', 0, () => {
      store.batchInsert(true, createSeedContacts());
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      expect(store.batchCalls).assertEqual(2);
      expect(store.insertCalls).assertEqual(0);
      expect(store.updateCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
      expect(store.queryCalls).assertEqual(0);
      expect(store.rowCount()).assertEqual(18);
      expect(store.initCalls).assertEqual(1);
    });

    /**
     * @tc.name   batchAppendOrderMatchesSubmittedOrder
     * @tc.desc   The store appends rows in array order without sorting by name or category.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchAppendOrderMatchesSubmittedOrder', 0, () => {
      const submitted = [
        contactOf('丙', '13500003333', 'c@example.com', '丙地'),
        contactOf('甲', '13500001111', 'a@example.com', '甲地'),
        contactOf('乙', '13500002222', 'b@example.com', '乙地')
      ];
      store.batchInsert(true, submitted);
      expect(sameStringArray(store.names(), ['丙', '甲', '乙'])).assertTrue();
      expect(store.names()[0]).assertEqual('丙');
      expect(store.names()[2]).assertEqual('乙');
      expect(sameContact(store.query(true)[1], submitted[1])).assertTrue();
    });

    /**
     * @tc.name   batchResetClearsRowsAndCounters
     * @tc.desc   The local store reset clears every row and every accounting counter for the next case.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchResetClearsRowsAndCounters', 0, () => {
      store.batchInsert(true, createSeedContacts());
      store.query(true);
      expect(store.rowCount()).assertEqual(15);
      store.reset();
      expect(store.rowCount()).assertEqual(0);
      expect(store.batchCalls).assertEqual(0);
      expect(store.queryCalls).assertEqual(0);
      expect(store.initCalls).assertEqual(0);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.initialized).assertFalse();
    });

    /**
     * @tc.name   batchResetStoreCanBeSeededAgain
     * @tc.desc   After a reset the batch insert initializes a brand new table generation and writes again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchResetStoreCanBeSeededAgain', 0, () => {
      store.batchInsert(true, createSeedContacts());
      store.reset();
      const written = store.batchInsert(true, createSeedContacts().slice(0, 2));
      expect(written).assertEqual(2);
      expect(store.rowCount()).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.names()[1]).assertEqual('阿诺德');
    });

    /**
     * @tc.name   batchSnapshotParityBetweenStoreAndSeed
     * @tc.desc   Every stored row snapshot equals the submitted seed snapshot before any projection.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchSnapshotParityBetweenStoreAndSeed', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      expect(sameSnapshotArray(snapshotsOf(store.query(true)), snapshotsOf(seed))).assertTrue();
      expect(snapshotsOf(store.query(true))[6].describe()).assertEqual(seed[6].name + '/' + seed[6].phone +
        '/' + seed[6].email + '/' + seed[6].address + '/' + seed[6].category);
      expect(snapshotsOf(seed)[6].sameAs(snapshotsOf(store.query(true))[6])).assertTrue();
      expect(snapshotsOf(seed)[6].sameAs(snapshotsOf(seed)[7])).assertFalse();
    });

    /**
     * @tc.name   batchManagerSearchFindsSeedByPartialName
     * @tc.desc   The list search matches two seeded names sharing the character for card.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchManagerSearchFindsSeedByPartialName', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const found = SearchEngine.filterByName(manager.getContacts(), '卡');
      expect(found.length).assertEqual(2);
      expect(found[0].name).assertEqual('卡梅隆');
      expect(found[1].name).assertEqual('卡特琳娜');
      expect(SearchEngine.filterByName(manager.getContacts(), '卡特').length).assertEqual(1);
      expect(SearchEngine.filterByName(manager.getContacts(), '艾').length).assertEqual(4);
    });

    /**
     * @tc.name   batchManagerClearLeavesAnEmptySingleton
     * @tc.desc   A second setContacts with an empty array replaces the seed rather than appending to it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchManagerClearLeavesAnEmptySingleton', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      expect(manager.getContacts().length).assertEqual(15);
      manager.setContacts([]);
      expect(manager.getContacts().length).assertEqual(0);
      expect(contactNames(manager.getContacts()).length).assertEqual(0);
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(0);
      expect(ContactMetrics.from(manager.getContacts()).total).assertEqual(0);
    });

    /**
     * @tc.name   batchCategoryCountsAfterManagerAdd
     * @tc.desc   Appending a seventh label row grows the group list but leaves the six seed counts intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchCategoryCountsAfterManagerAdd', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('新类别', '13500001111', 'new@example.com', '新地址', '', 'G'));
      const rows = manager.getContacts();
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(7);
      expect(SearchEngine.countCategory(rows, 'A')).assertEqual(2);
      expect(SearchEngine.countCategory(rows, 'G')).assertEqual(1);
      expect(ContactMetrics.from(rows).duplicateNames).assertEqual(0);
      expect(rows[15].category).assertEqual('G');
    });

    /**
     * @tc.name   batchProjectionSnapshotDiffersAtTheFirstElement
     * @tc.desc   The visible snapshot array is the seed snapshot array without its first element.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('batchProjectionSnapshotDiffersAtTheFirstElement', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      const seedSnapshots = snapshotsOf(seed);
      const visibleSnapshots = snapshotsOf(visible);
      expect(visibleSnapshots.length).assertEqual(14);
      expect(seedSnapshots.length).assertEqual(15);
      expect(visibleSnapshots[0].sameAs(seedSnapshots[0])).assertFalse();
      expect(visibleSnapshots[0].sameAs(seedSnapshots[1])).assertTrue();
      expect(visibleSnapshots[13].sameAs(seedSnapshots[14])).assertTrue();
      expect(sameSnapshotArray(visibleSnapshots, seedSnapshots.slice(1))).assertTrue();
    });

    /**
     * @tc.name   batchSeedEmailsShareDomainsAcrossRows
     * @tc.desc   The literal seed reuses example.com addresses while keeping distinct names and phones.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchSeedEmailsShareDomainsAcrossRows', 0, () => {
      const seed = createSeedContacts();
      let exampleCount = 0;
      for (let index = 0; index < seed.length; index++) {
        if (seed[index].email.endsWith('@example.com')) {
          exampleCount = exampleCount + 1;
        }
      }
      expect(exampleCount).assertEqual(15);
      expect(countOf(seed.map((item: Contact) => item.email), 'cameron@example.com')).assertEqual(3);
      expect(countOf(seed.map((item: Contact) => item.email), 'katrina@example.com')).assertEqual(4);
      expect(uniqueStrings(seed.map((item: Contact) => item.email)).length).assertEqual(8);
    });

    /**
     * @tc.name   batchImportKeepsSevenDistinctVisibleEmails
     * @tc.desc   Although email repeats, seven distinct values remain visible after the cursor skip and dedupe.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchImportKeepsSevenDistinctVisibleEmails', 0, () => {
      store.batchInsert(true, createSeedContacts());
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      const emails = uniqueStrings(visible.map((item: Contact) => item.email));
      expect(emails.length).assertEqual(7);
      expect(emails.indexOf('aidelian@example.com')).assertEqual(-1);
      expect(emails.indexOf('arnold@example.com')).assertEqual(0);
      expect(visible.length).assertEqual(14);
      expect(visible[0].email).assertEqual('arnold@example.com');
    });
  });
}