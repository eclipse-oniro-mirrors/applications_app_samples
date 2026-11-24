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
 * AdvancedScenarios / BatchImportIncremental suite.
 *
 * The page seeds fifteen contacts with one batch insert, then imports further
 * chunks as the user works. batchInsertData lazily initialises the store, builds
 * one bucket per row and reports the row count from the promise; on failure it
 * reports zero. This suite pins the incremental accumulation, the bucket shape
 * and the two fallback paths without touching a real relational store.
 *
 * Source anchors:
 *   DatabaseConnection.ets:139-181  bucket mapping and row count promise
 *   DatabaseConnection.ets:69-89    initRdbStore early return and store reuse
 *   SharedDriver.ets:561-573        StoreDouble.batchInsert
 *   SharedDriver.ets:715-718        wrappedBatchCount zero fallback
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import {
  BUCKET_KEYS,
  FIELD_ADDRESS,
  FIELD_AVATAR,
  FIELD_CATEGORY,
  FIELD_EMAIL,
  FIELD_NAME,
  FIELD_PHONE,
  CATEGORIES,
  CATEGORY_A,
  CATEGORY_B,
  CATEGORY_C,
  CATEGORY_D,
  CATEGORY_E,
  CATEGORY_F,
  createSeedContacts,
  contactOf,
  contactNames,
  joined,
  countOf,
  expectedBatchCount,
  wrappedBatchCount,
  expectedVisibleCount,
  ContactMapper,
  Bucket,
  StoreDouble,
  ContactMetrics,
  SearchEngine,
  resetContactManager
} from '../Shared/SharedDriver';

export default function batchImportIncrementalTest(): void {
  describe('BatchImportIncremental', () => {
    beforeAll(() => {
      logSuite('BatchImportIncremental', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('BatchImportIncremental', 'end');
    });

    /**
     * @tc.name   firstBatchWritesSeedRows
     * @tc.desc   A fifteen row seed batch initialises the store, creates the table once and reports fifteen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('firstBatchWritesSeedRows', 0, () => {
      const store = new StoreDouble();
      const seed = createSeedContacts();
      const written = wrappedBatchCount(true, store, seed);
      expect(written).assertEqual(15);
      expect(store.rowCount()).assertEqual(15);
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.initialized).assertTrue();
      logStep('batchImportIncrementalTest', 'seed batch writes fifteen rows');
    });

    /**
     * @tc.name   wrappedCountMatchesOracle
     * @tc.desc   The reported count equals expectedBatchCount for a five row chunk.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('wrappedCountMatchesOracle', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const chunk: Contact[] = [];
      chunk.push(contactOf('纪一', '13610000001', 'jiyi@example.com', '安徽省合肥市蜀山区', '', CATEGORY_A));
      chunk.push(contactOf('纪二', '13610000002', 'jier@example.com', '安徽省合肥市包河区', '', CATEGORY_B));
      chunk.push(contactOf('纪三', '13610000003', 'jisan@example.com', '安徽省芜湖市镜湖区', '', CATEGORY_C));
      chunk.push(contactOf('纪四', '13610000004', 'jisi@example.com', '安徽省蚌埠市蚌山区', '', CATEGORY_D));
      chunk.push(contactOf('纪五', '13610000005', 'jiwu@example.com', '安徽省淮南市田家庵区', '', CATEGORY_E));
      const written = wrappedBatchCount(true, store, chunk);
      expect(written).assertEqual(expectedBatchCount(chunk));
      expect(written).assertEqual(5);
      expect(store.rowCount()).assertEqual(5);
      logStep('batchImportIncrementalTest', 'wrapped count matches the oracle');
    });

    /**
     * @tc.name   incrementalChunksAccumulate
     * @tc.desc   Three chunks of four rows accumulate to twelve without clearing earlier rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('incrementalChunksAccumulate', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      let first: Contact[] = [];
      let second: Contact[] = [];
      let third: Contact[] = [];
      for (let index = 0; index < 4; index++) {
        first.push(contactOf('段甲' + String(index), '1363000000' + String(index), 'duana' + String(index) + '@example.com',
          '湖南省长沙市岳麓区', '', CATEGORY_A));
        second.push(contactOf('段乙' + String(index), '1363000001' + String(index), 'duanb' + String(index) + '@example.com',
          '湖南省长沙市天心区', '', CATEGORY_B));
        third.push(contactOf('段丙' + String(index), '1363000002' + String(index), 'duanc' + String(index) + '@example.com',
          '湖南省长沙市开福区', '', CATEGORY_C));
      }
      expect(wrappedBatchCount(true, store, first)).assertEqual(4);
      expect(wrappedBatchCount(true, store, second)).assertEqual(4);
      expect(store.rowCount()).assertEqual(8);
      expect(wrappedBatchCount(true, store, third)).assertEqual(4);
      expect(store.rowCount()).assertEqual(12);
      expect(store.batchCalls).assertEqual(3);
      logStep('batchImportIncrementalTest', 'three chunks accumulate to twelve');
    });

    /**
     * @tc.name   emptyBatchWritesNothing
     * @tc.desc   An empty chunk still counts one call but writes no rows and reports zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyBatchWritesNothing', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const empty: Contact[] = [];
      const written = store.batchInsert(true, empty);
      expect(written).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.batchCalls).assertEqual(1);
      expect(store.names().length).assertEqual(0);
      logStep('batchImportIncrementalTest', 'empty chunk is a counted no-op');
    });

    /**
     * @tc.name   singleRowChunkReportsOne
     * @tc.desc   A one row chunk appends exactly one row and reports one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('singleRowChunkReportsOne', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const one: Contact[] = [];
      one.push(contactOf('尹川', '13900001111', 'yinchuan@example.com', '山东省济南市历下区', 'avatar_a.png', CATEGORY_F));
      expect(wrappedBatchCount(true, store, one)).assertEqual(1);
      expect(store.rowCount()).assertEqual(1);
      expect(store.rows[0].avatar).assertEqual('avatar_a.png');
      expect(store.rows[0].category).assertEqual(CATEGORY_F);
      logStep('batchImportIncrementalTest', 'single row chunk appends one');
    });

    /**
     * @tc.name   batchBuildsSixFieldBuckets
     * @tc.desc   ContactMapper emits one bucket with the six production keys in declaration order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchBuildsSixFieldBuckets', 0, () => {
      const chunk = createSeedContacts().slice(0, 2);
      const buckets = ContactMapper.toBuckets(chunk);
      expect(buckets.length).assertEqual(2);
      expect(buckets[0].size()).assertEqual(6);
      expect(buckets[0].keyAt(0)).assertEqual(FIELD_NAME);
      expect(buckets[0].keyAt(3)).assertEqual(FIELD_ADDRESS);
      expect(buckets[1].get(FIELD_PHONE)).assertEqual('16666666666');
      expect(buckets[1].get(FIELD_CATEGORY)).assertEqual(CATEGORY_A);
      expect(joined(buckets[0].keys)).assertEqual(joined(BUCKET_KEYS));
      logStep('batchImportIncrementalTest', 'buckets keep the six production keys');
    });

    /**
     * @tc.name   uninitializedStoreInitialisesOnFirstBatch
     * @tc.desc   A batch on a fresh store performs the init and the create-table step before appending.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('uninitializedStoreInitialisesOnFirstBatch', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      expect(store.initialized).assertTrue();
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      expect(store.lastContextValid).assertTrue();
      expect(store.rowCount()).assertEqual(3);
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      expect(store.initCalls).assertEqual(1);
      expect(store.createTableCalls).assertEqual(1);
      logStep('batchImportIncrementalTest', 'init happens once even across batches');
    });

    /**
     * @tc.name   invalidContextBatchFallsBackToZero
     * @tc.desc   A batch with no usable context reports zero rows and leaves the store empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('invalidContextBatchFallsBackToZero', 0, () => {
      const store = new StoreDouble();
      const written = wrappedBatchCount(false, store, createSeedContacts());
      expect(written).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.initCalls).assertEqual(1);
      expect(store.lastContextValid).assertFalse();
      logStep('batchImportIncrementalTest', 'invalid context reports zero rows');
    });

    /**
     * @tc.name   chunkOrderIsPreservedAfterImport
     * @tc.desc   Appending chunk B after chunk A leaves the A names ahead of the B names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('chunkOrderIsPreservedAfterImport', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const a: Contact[] = [];
      a.push(contactOf('甲一', '13500000001', 'jiay@example.com', '湖北省宜昌市西陵区', '', CATEGORY_A));
      a.push(contactOf('甲二', '13500000002', 'jiaer@example.com', '湖北省宜昌市伍家岗区', '', CATEGORY_A));
      const b: Contact[] = [];
      b.push(contactOf('乙一', '13500000003', 'yiyi@example.com', '湖北省襄阳市襄城区', '', CATEGORY_B));
      b.push(contactOf('乙二', '13500000004', 'yier@example.com', '湖北省襄阳市樊城区', '', CATEGORY_B));
      store.batchInsert(true, a);
      store.batchInsert(true, b);
      expect(joined(store.names())).assertEqual('甲一,甲二,乙一,乙二');
      expect(store.names()[1]).assertEqual('甲二');
      expect(store.names()[2]).assertEqual('乙一');
      expect(store.rowCount()).assertEqual(4);
      logStep('batchImportIncrementalTest', 'chunk order survives appends');
    });

    /**
     * @tc.name   seedSplitIntoThreeChunks
     * @tc.desc   The fifteen seed rows imported as three five row chunks equal one fifteen row import.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('seedSplitIntoThreeChunks', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const seed = createSeedContacts();
      expect(wrappedBatchCount(true, store, seed.slice(0, 5))).assertEqual(5);
      expect(wrappedBatchCount(true, store, seed.slice(5, 10))).assertEqual(5);
      expect(wrappedBatchCount(true, store, seed.slice(10, 15))).assertEqual(5);
      expect(store.rowCount()).assertEqual(15);
      expect(joined(store.names())).assertEqual(joined(contactNames(seed)));
      expect(store.batchCalls).assertEqual(3);
      logStep('batchImportIncrementalTest', 'three chunks rebuild the seed exactly');
    });

    /**
     * @tc.name   batchCallsCountedPerChunk
     * @tc.desc   Four imports of three rows each leave batchCalls at four and twelve stored rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchCallsCountedPerChunk', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      for (let round = 0; round < 4; round++) {
        const chunk: Contact[] = [];
        for (let index = 0; index < 3; index++) {
          chunk.push(contactOf('曲' + String(round) + String(index), '1340000' + String(round) + String(index) + '000',
            'qu' + String(round) + String(index) + '@example.com', '江西省南昌市东湖区', '', CATEGORIES[round]));
        }
        store.batchInsert(true, chunk);
      }
      expect(store.batchCalls).assertEqual(4);
      expect(store.rowCount()).assertEqual(12);
      expect(store.initCalls).assertEqual(1);
      expect(countOf(store.names(), '曲00')).assertEqual(1);
      logStep('batchImportIncrementalTest', 'one call counted per chunk');
    });

    /**
     * @tc.name   batchAfterDeleteAppendsFreshRows
     * @tc.desc   Deleting a name and importing a replacement keeps the row count stable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchAfterDeleteAppendsFreshRows', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      expect(store.deleteByName('贝拉')).assertEqual(1);
      expect(store.rowCount()).assertEqual(14);
      const replacement: Contact[] = [];
      replacement.push(contactOf('贝拉', '11111119999', 'bella.reborn@example.com', '湖北省宜昌市西陵区', '', CATEGORY_B));
      expect(wrappedBatchCount(true, store, replacement)).assertEqual(1);
      expect(store.rowCount()).assertEqual(15);
      expect(store.names()[14]).assertEqual('贝拉');
      expect(store.rows[14].phone).assertEqual('11111119999');
      expect(store.deleteCalls).assertEqual(1);
      logStep('batchImportIncrementalTest', 'replacement batch appends at the tail');
    });

    /**
     * @tc.name   duplicateNamesSurviveBatchImport
     * @tc.desc   A chunk holding two 贝拉 rows writes both because the batch path never dedupes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateNamesSurviveBatchImport', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const chunk: Contact[] = [];
      chunk.push(contactOf('贝拉', '11111111111', 'bella@example.com', '湖北省武汉市江汉区', '', CATEGORY_B));
      chunk.push(contactOf('贝拉', '11111112222', 'bella.twin@example.com', '湖北省武汉市武昌区', '', CATEGORY_B));
      const written = store.batchInsert(true, chunk);
      expect(written).assertEqual(2);
      expect(store.rowCount()).assertEqual(2);
      expect(countOf(store.names(), '贝拉')).assertEqual(2);
      expect(SearchEngine.countCategory(store.rows, CATEGORY_B)).assertEqual(2);
      logStep('batchImportIncrementalTest', 'duplicates inside one batch are kept');
    });

    /**
     * @tc.name   metricsGrowWithEachChunk
     * @tc.desc   Total and unique counts rise by the chunk size after every import.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsGrowWithEachChunk', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 5));
      const first = ContactMetrics.from(store.rows);
      store.batchInsert(true, seed.slice(5, 10));
      const second = ContactMetrics.from(store.rows);
      store.batchInsert(true, seed.slice(10, 15));
      const third = ContactMetrics.from(store.rows);
      expect(first.total).assertEqual(5);
      expect(second.total).assertEqual(10);
      expect(third.total).assertEqual(15);
      expect(third.uniqueNames - second.uniqueNames).assertEqual(5);
      expect(third.categories).assertEqual(6);
      logStep('batchImportIncrementalTest', 'metrics track each chunk');
    });

    /**
     * @tc.name   visibleCountSkipsFirstImportedRow
     * @tc.desc   A seeded cursor exposes fourteen rows after the first row skip and dedupe.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('visibleCountSkipsFirstImportedRow', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      expect(expectedVisibleCount(seed)).assertEqual(14);
      expect(expectedVisibleCount(seed.slice(0, 1))).assertEqual(0);
      expect(expectedVisibleCount(seed.slice(0, 2))).assertEqual(1);
      expect(store.rowCount()).assertEqual(15);
      logStep('batchImportIncrementalTest', 'visible count honours the skip');
    });

    /**
     * @tc.name   initializedStoreIgnoresInvalidContext
     * @tc.desc   Once the store is open, a chunk with a missing context flag still appends rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('initializedStoreIgnoresInvalidContext', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const chunk: Contact[] = [];
      chunk.push(contactOf('阮一', '13300000001', 'ruanyi@example.com', '广西南宁市青秀区', '', CATEGORY_C));
      chunk.push(contactOf('阮二', '13300000002', 'ruaner@example.com', '广西南宁市兴宁区', '', CATEGORY_C));
      chunk.push(contactOf('阮三', '13300000003', 'ruansan@example.com', '广西南宁市江南区', '', CATEGORY_C));
      const written = wrappedBatchCount(false, store, chunk);
      expect(written).assertEqual(3);
      expect(store.rowCount()).assertEqual(3);
      expect(store.initCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      logStep('batchImportIncrementalTest', 'open store accepts a flagged chunk');
    });

    /**
     * @tc.name   avatarAndCategoryPreservedByBatch
     * @tc.desc   Non-default avatar paths and category letters survive the bucket round trip.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('avatarAndCategoryPreservedByBatch', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const chunk: Contact[] = [];
      chunk.push(contactOf('裴照', '13200000001', 'peizhao@example.com', '山西省太原市小店区', 'avatar/p1.png', CATEGORY_D));
      chunk.push(contactOf('裴云', '13200000002', 'peiyun@example.com', '山西省太原市迎泽区', 'avatar/p2.png', CATEGORY_E));
      store.batchInsert(true, chunk);
      expect(store.rows[0].avatar).assertEqual('avatar/p1.png');
      expect(store.rows[1].avatar).assertEqual('avatar/p2.png');
      expect(store.rows[0].category).assertEqual(CATEGORY_D);
      expect(store.rows[1].category).assertEqual(CATEGORY_E);
      expect(ContactMapper.fromBucket(ContactMapper.toBucket(chunk[0])).avatar).assertEqual('avatar/p1.png');
      logStep('batchImportIncrementalTest', 'avatar and category survive the batch');
    });

    /**
     * @tc.name   bucketDescribeMatchesProductionOrder
     * @tc.desc   The serialised bucket lists name, phone, email, address, avatar and category in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('bucketDescribeMatchesProductionOrder', 0, () => {
      const row = contactOf('莫川', '13100000001', 'mochuan@example.com', '贵州省贵阳市南明区', 'avatar/m.png', CATEGORY_F);
      const bucket: Bucket = ContactMapper.toBucket(row);
      expect(bucket.describe()).assertEqual(
        'name=莫川;phone=13100000001;email=mochuan@example.com;address=贵州省贵阳市南明区;avatar=avatar/m.png;category=F');
      expect(bucket.size()).assertEqual(6);
      expect(bucket.has(FIELD_AVATAR)).assertTrue();
      expect(bucket.get(FIELD_EMAIL)).assertEqual('mochuan@example.com');
      expect(ContactMapper.fromBucket(bucket).name).assertEqual('莫川');
      logStep('batchImportIncrementalTest', 'bucket order pinned to production');
    });

    /**
     * @tc.name   failedImportThenRetrySucceeds
     * @tc.desc   A chunk rejected for a missing context is written once the context flag is restored.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failedImportThenRetrySucceeds', 0, () => {
      const store = new StoreDouble();
      const chunk = createSeedContacts().slice(0, 4);
      expect(wrappedBatchCount(false, store, chunk)).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.initCalls).assertEqual(1);
      expect(wrappedBatchCount(true, store, chunk)).assertEqual(4);
      expect(store.rowCount()).assertEqual(4);
      expect(store.initCalls).assertEqual(2);
      expect(store.createTableCalls).assertEqual(1);
      logStep('batchImportIncrementalTest', 'retry after a rejected chunk succeeds');
    });

    /**
     * @tc.name   chunkCountsSumToTotalRows
     * @tc.desc   Reported counts three, four and five sum to the twelve rows the store holds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('chunkCountsSumToTotalRows', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const seed = createSeedContacts();
      const a = store.batchInsert(true, seed.slice(0, 3));
      const b = store.batchInsert(true, seed.slice(3, 7));
      const c = store.batchInsert(true, seed.slice(7, 12));
      expect(a).assertEqual(3);
      expect(b).assertEqual(4);
      expect(c).assertEqual(5);
      expect(a + b + c).assertEqual(store.rowCount());
      expect(store.rowCount()).assertEqual(12);
      expect(store.names()[11]).assertEqual('艾拉');
      logStep('batchImportIncrementalTest', 'chunk counts sum to the store total');
    });

    /**
     * @tc.name   reimportingSeedDoublesRows
     * @tc.desc   Importing the same fifteen rows twice yields thirty rows and fifteen duplicate names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('reimportingSeedDoublesRows', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      store.batchInsert(true, seed);
      expect(store.rowCount()).assertEqual(30);
      expect(ContactMetrics.from(store.rows).duplicateNames).assertEqual(15);
      expect(ContactMetrics.from(store.rows).uniqueNames).assertEqual(15);
      expect(store.names()[15]).assertEqual('艾德里安');
      logStep('batchImportIncrementalTest', 're-import duplicates the seed');
    });

    /**
     * @tc.name   emptyStoreMetricsAreZero
     * @tc.desc   Before any import the metrics report zero totals and a zero fill ratio.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the BatchImportIncremental scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyStoreMetricsAreZero', 0, () => {
      const store = new StoreDouble();
      const metrics = ContactMetrics.from(store.rows);
      expect(metrics.total).assertEqual(0);
      expect(metrics.uniqueNames).assertEqual(0);
      expect(metrics.fillRatio()).assertEqual(0);
      expect(store.batchCalls).assertEqual(0);
      logStep('batchImportIncrementalTest', 'empty store metrics are zero');
    });
  });
}
