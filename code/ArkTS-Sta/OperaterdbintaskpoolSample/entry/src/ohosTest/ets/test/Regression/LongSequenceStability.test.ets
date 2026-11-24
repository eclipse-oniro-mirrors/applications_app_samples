'use static';
import { CATEGORY_D } from '../Shared/SharedDriver';
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
 * Regression / LongSequenceStability suite.
 *
 * The page is expected to stay usable after many edits, so the suite runs long
 * sequences of adds, updates and deletes and checks that the row count, the
 * category groups and the metrics never drift from the closed form expectation.
 *
 * Source anchors:
 *   ContactManager.ets:41-70        copy on read, append on add, filter on delete
 *   OperateRDBInTaskPool.ets:74      seed used as the starting point
 *   SharedDriver.ets:833-864        metrics used as the drift detector
 *   SharedDriver.ets:642-705        queue used for long submit drain cycles
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  CATEGORY_A,
  CATEGORY_B,
  CATEGORY_C,
  CATEGORIES,
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
  StoreDouble,
  ContactMetrics,
  SearchEngine,
  resetContactManager
} from '../Shared/SharedDriver';

export default function longSequenceStabilityTest(): void {
  describe('LongSequenceStability', () => {
    beforeAll(() => {
      logSuite('LongSequenceStability', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('LongSequenceStability', 'end');
    });

    /**
     * @tc.name   fiftyAddsGrowLinearly
     * @tc.desc   Fifty appends raise the row count from fifteen to sixty five.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('fiftyAddsGrowLinearly', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      for (let round = 0; round < 50; round++) {
        manager.addContact(contactOf('批量' + String(round), '1340000' + String(1000 + round),
          'batch' + String(round) + '@example.com', '安徽省合肥市蜀山区', '', CATEGORIES[round % 6]));
      }
      const rows = manager.getContacts();
      expect(rows.length).assertEqual(65);
      expect(ContactMetrics.from(rows).total).assertEqual(65);
      expect(rows[15].name).assertEqual('批量0');
      expect(rows[64].name).assertEqual('批量49');
      logStep('longSequenceStabilityTest', 'fifty adds grow linearly');
    });

    /**
     * @tc.name   fiftyAddsKeepSeedPrefix
     * @tc.desc   The first fifteen names after fifty appends are still the seed names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fiftyAddsKeepSeedPrefix', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      for (let round = 0; round < 50; round++) {
        manager.addContact(contactOf('追加' + String(round), '1341000' + String(1000 + round),
          'append' + String(round) + '@example.com', '安徽省合肥市包河区', '', CATEGORY_A));
      }
      const names = contactNames(manager.getContacts());
      expect(joined(names.slice(0, 15))).assertEqual(joined(contactNames(createSeedContacts())));
      expect(names.length).assertEqual(65);
      expect(names[15]).assertEqual('追加0');
      logStep('longSequenceStabilityTest', 'seed prefix survives fifty appends');
    });

    /**
     * @tc.name   addRepeatedUpdateCycle
     * @tc.desc   A single row edited fifty times keeps one row and the last phone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addRepeatedUpdateCycle', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      for (let round = 0; round < 50; round++) {
        manager.updateContact(contactOf('贝拉', '1110000' + String(1000 + round),
          'bella' + String(round) + '@example.com', '湖北省武汉市汉阳区', '', CATEGORY_B));
      }
      const rows = manager.getContacts();
      expect(rows.length).assertEqual(15);
      expect(rows[2].phone).assertEqual('11100001049');
      expect(countOf(contactNames(rows), '贝拉')).assertEqual(1);
      logStep('longSequenceStabilityTest', 'fifty updates keep one row');
    });

    /**
     * @tc.name   addDeletePairsReturnToSeed
     * @tc.desc   Ten add and delete pairs restore the exact seed snapshot array.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addDeletePairsReturnToSeed', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      for (let round = 0; round < 10; round++) {
        manager.addContact(contactOf('临时' + String(round), '1350000' + String(1000 + round),
          'temp' + String(round) + '@example.com', '江西省南昌市西湖区', '', CATEGORY_C));
        manager.deleteContact(contactOf('临时' + String(round), '', '', '', '', ''));
      }
      const rows = manager.getContacts();
      expect(rows.length).assertEqual(15);
      expect(sameSnapshotArray(snapshotsOf(rows), snapshotsOf(createSeedContacts()))).assertTrue();
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(6);
      logStep('longSequenceStabilityTest', 'add delete pairs restore the seed');
    });

    /**
     * @tc.name   hundredQueueCyclesDrainCleanly
     * @tc.desc   One hundred submit and drain cycles leave an empty queue with one hundred completions.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredQueueCyclesDrainCleanly', 0, () => {
      const queue = new TaskPoolQueue();
      let drained = 0;
      for (let round = 0; round < 100; round++) {
        queue.submit(OperationCatalog.QUERY_ALL);
        drained = drained + queue.drain();
      }
      expect(drained).assertEqual(100);
      expect(queue.completed.length).assertEqual(100);
      expect(queue.pending.length).assertEqual(0);
      expect(queue.running.length).assertEqual(0);
      logStep('longSequenceStabilityTest', 'hundred queue cycles drain cleanly');
    });

    /**
     * @tc.name   hundredQueueCyclesKeepTraceOrder
     * @tc.desc   The completion trace after one hundred drains has one hundred arrow separated entries.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('hundredQueueCyclesKeepTraceOrder', 0, () => {
      const queue = new TaskPoolQueue();
      for (let round = 0; round < 100; round++) {
        queue.submit(OperationCatalog.INSERT_ONE);
        queue.drain();
      }
      const trace = queue.trace();
      expect(trace.split('>').length).assertEqual(100);
      expect(trace.startsWith('insert-one>')).assertTrue();
      expect(trace.endsWith('insert-one')).assertTrue();
      expect(queue.completionOrder.length).assertEqual(100);
      logStep('longSequenceStabilityTest', 'trace keeps its hundred entries');
    });

    /**
     * @tc.name   longBatchImportKeepsCount
     * @tc.desc   Ten batches of fifteen rows each end with one hundred and fifty stored rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longBatchImportKeepsCount', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const seed = createSeedContacts();
      for (let round = 0; round < 10; round++) {
        store.batchInsert(true, seed);
      }
      expect(store.rowCount()).assertEqual(150);
      expect(store.batchCalls).assertEqual(10);
      expect(store.initCalls).assertEqual(1);
      expect(store.query(true).length).assertEqual(150);
      logStep('longSequenceStabilityTest', 'long batch import keeps the count');
    });

    /**
     * @tc.name   longImportCategoryDistribution
     * @tc.desc   Ten identical seed batches scale each category count by ten.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('longImportCategoryDistribution', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const seed = createSeedContacts();
      for (let round = 0; round < 10; round++) {
        store.batchInsert(true, seed);
      }
      expect(SearchEngine.countCategory(store.rows, CATEGORY_A)).assertEqual(20);
      expect(SearchEngine.countCategory(store.rows, CATEGORY_B)).assertEqual(30);
      expect(SearchEngine.countCategory(store.rows, CATEGORY_C)).assertEqual(30);
      expect(ContactMetrics.from(store.rows).duplicateNames).assertEqual(135);
      logStep('longSequenceStabilityTest', 'category distribution scales');
    });

    /**
     * @tc.name   longDeleteSequenceEmptiesStore
     * @tc.desc   Deleting each of the ten imported seed names empties a hundred and fifty row store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('longDeleteSequenceEmptiesStore', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const seed = createSeedContacts();
      for (let round = 0; round < 10; round++) {
        store.batchInsert(true, seed);
      }
      for (let index = 0; index < seed.length; index++) {
        store.deleteByName(seed[index].name);
      }
      expect(store.rowCount()).assertEqual(0);
      expect(store.deleteCalls).assertEqual(15);
      expect(store.names().length).assertEqual(0);
      expect(ContactMetrics.from(store.rows).total).assertEqual(0);
      logStep('longSequenceStabilityTest', 'long delete sequence empties the store');
    });

    /**
     * @tc.name   alternatingCategoriesStayBalanced
     * @tc.desc   Sixty appends cycling through six categories give ten rows per category.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('alternatingCategoriesStayBalanced', 0, () => {
      const rows = createSeedContacts();
      for (let round = 0; round < 60; round++) {
        rows.push(contactOf('循环' + String(round), '1330000' + String(1000 + round),
          'cycle' + String(round) + '@example.com', '浙江省宁波市江北区', '', CATEGORIES[round % 6]));
      }
      expect(rows.length).assertEqual(75);
      expect(SearchEngine.countCategory(rows, CATEGORY_A)).assertEqual(12);
      expect(SearchEngine.countCategory(rows, CATEGORY_B)).assertEqual(13);
      expect(ContactMetrics.from(rows).categories).assertEqual(6);
      logStep('longSequenceStabilityTest', 'alternating categories stay balanced');
    });

    /**
     * @tc.name   hundredUpdatesDoNotGrowTheList
     * @tc.desc   Two hundred updates of one name leave the row count at fifteen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('hundredUpdatesDoNotGrowTheList', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      for (let round = 0; round < 200; round++) {
        manager.updateContact(contactOf('艾德里安', '1330000' + String(1000 + round),
          'aidelian' + String(round) + '@example.com', '江苏省南京市秦淮区', '', CATEGORY_A));
      }
      const rows = manager.getContacts();
      expect(rows.length).assertEqual(15);
      expect(rows[0].phone).assertEqual('13300001199');
      expect(uniqueStrings(contactNames(rows)).length).assertEqual(15);
      logStep('longSequenceStabilityTest', 'two hundred updates keep the size');
    });

    /**
     * @tc.name   addDeleteSameNameAlternates
     * @tc.desc   Alternating add and delete of the same name ends on delete with fifteen rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addDeleteSameNameAlternates', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      for (let round = 0; round < 25; round++) {
        manager.addContact(contactOf('季节', '1360000' + String(1000 + round),
          'jijie' + String(round) + '@example.com', '山东省青岛市市南区', '', CATEGORY_D));
        manager.deleteContact(contactOf('季节', '', '', '', '', ''));
      }
      const rows = manager.getContacts();
      expect(rows.length).assertEqual(15);
      expect(countOf(contactNames(rows), '季节')).assertEqual(0);
      expect(rows[14].name).assertEqual('法里');
      logStep('longSequenceStabilityTest', 'add delete alternation is neutral');
    });

    /**
     * @tc.name   longSearchStaysCorrect
     * @tc.desc   A search over sixty five rows still returns only the two matching names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longSearchStaysCorrect', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      for (let round = 0; round < 50; round++) {
        manager.addContact(contactOf('搜索' + String(round), '1370000' + String(1000 + round),
          'search' + String(round) + '@example.com', '福建省厦门市思明区', '', CATEGORY_C));
      }
      const rows = manager.getContacts();
      expect(SearchEngine.filterByName(rows, '本').length).assertEqual(2);
      expect(SearchEngine.filterByName(rows, '搜索4').length).assertEqual(11);
      expect(SearchEngine.filterByName(rows, '不存在').length).assertEqual(0);
      logStep('longSequenceStabilityTest', 'search stays correct over a long list');
    });

    /**
     * @tc.name   identicalSequencesShareFingerprint
     * @tc.desc   Running the same mutation sequence twice produces the same metrics fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('identicalSequencesShareFingerprint', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      for (let round = 0; round < 20; round++) {
        manager.addContact(contactOf('指纹' + String(round), '1380000' + String(1000 + round),
          'fp' + String(round) + '@example.com', '广东省珠海市香洲区', '', CATEGORIES[round % 6]));
      }
      const firstFingerprint = ContactMetrics.from(manager.getContacts()).fingerprint();
      resetContactManager(createSeedContacts());
      for (let round = 0; round < 20; round++) {
        manager.addContact(contactOf('指纹' + String(round), '1380000' + String(1000 + round),
          'fp' + String(round) + '@example.com', '广东省珠海市香洲区', '', CATEGORIES[round % 6]));
      }
      const secondFingerprint = ContactMetrics.from(manager.getContacts()).fingerprint();
      expect(secondFingerprint).assertEqual(firstFingerprint);
      expect(manager.getContacts().length).assertEqual(35);
      logStep('longSequenceStabilityTest', 'identical sequences share a fingerprint');
    });

    /**
     * @tc.name   longSequenceSnapshotCount
     * @tc.desc   The snapshot array length tracks the row count after sixty five rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longSequenceSnapshotCount', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      for (let round = 0; round < 50; round++) {
        manager.addContact(contactOf('快照' + String(round), '1361000' + String(1000 + round),
          'snap' + String(round) + '@example.com', '重庆市渝北区', '', CATEGORY_A));
      }
      const rows = manager.getContacts();
      expect(snapshotsOf(rows).length).assertEqual(65);
      expect(snapshotsOf(rows).length).assertEqual(rows.length);
      expect(snapshotsOf(rows)[64].name).assertEqual('快照49');
      logStep('longSequenceStabilityTest', 'snapshot count tracks the row count');
    });

    /**
     * @tc.name   twoHundredStoreInserts
     * @tc.desc   Two hundred inserts leave two hundred rows and two hundred counted calls.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('twoHundredStoreInserts', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      for (let round = 0; round < 200; round++) {
        store.insert(true, contactOf('插' + String(round), '1390000' + String(1000 + round),
          'ins' + String(round) + '@example.com', '天津市滨海新区', '', CATEGORIES[round % 6]),
          'ON_CONFLICT_REPLACE');
      }
      expect(store.rowCount()).assertEqual(200);
      expect(store.insertCalls).assertEqual(200);
      expect(store.initCalls).assertEqual(1);
      expect(ContactMetrics.from(store.rows).total).assertEqual(200);
      logStep('longSequenceStabilityTest', 'two hundred store inserts');
    });

    /**
     * @tc.name   longCategoryUpdateDistribution
     * @tc.desc   Rotating the category of one row sixty times returns it to category A.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('longCategoryUpdateDistribution', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      for (let round = 0; round < 61; round++) {
        manager.updateContact(contactOf('艾德里安', '13333333333', 'aidelian@example.com',
          '江苏省南京市鼓楼区', '', CATEGORIES[round % 6]));
      }
      const rows = manager.getContacts();
      expect(rows[0].category).assertEqual(CATEGORY_A);
      expect(SearchEngine.countCategory(rows, CATEGORY_A)).assertEqual(2);
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(6);
      expect(rows.length).assertEqual(15);
      logStep('longSequenceStabilityTest', 'category rotation returns home');
    });

    /**
     * @tc.name   emptyThenRebuildLongList
     * @tc.desc   Emptying the manager and adding forty rows leaves exactly forty fresh rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyThenRebuildLongList', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      const seed = createSeedContacts();
      for (let index = 0; index < seed.length; index++) {
        manager.deleteContact(contactOf(seed[index].name, '', '', '', '', ''));
      }
      expect(manager.getContacts().length).assertEqual(0);
      for (let round = 0; round < 40; round++) {
        manager.addContact(contactOf('重建' + String(round), '1352000' + String(1000 + round),
          'rebuild' + String(round) + '@example.com', '四川省成都市武侯区', '', CATEGORIES[round % 6]));
      }
      const rows = manager.getContacts();
      expect(rows.length).assertEqual(40);
      expect(rows[0].name).assertEqual('重建0');
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(6);
      logStep('longSequenceStabilityTest', 'empty then rebuild a long list');
    });

    /**
     * @tc.name   longUnknownDeletesAreNoOps
     * @tc.desc   Fifty deletes of absent names leave the seed untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longUnknownDeletesAreNoOps', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      for (let round = 0; round < 50; round++) {
        manager.deleteContact(contactOf('幽灵' + String(round), '', '', '', '', ''));
      }
      const rows = manager.getContacts();
      expect(rows.length).assertEqual(15);
      expect(sameSnapshotArray(snapshotsOf(rows), snapshotsOf(createSeedContacts()))).assertTrue();
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(6);
      logStep('longSequenceStabilityTest', 'unknown deletes are no-ops');
    });

    /**
     * @tc.name   storeNamesAlwaysMatchRows
     * @tc.desc   After a long mixed store sequence the name view length equals the row count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('storeNamesAlwaysMatchRows', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const seed = createSeedContacts();
      for (let round = 0; round < 30; round++) {
        store.batchInsert(true, seed.slice(0, 5));
        store.deleteByName('贝拉');
        store.insert(true, contactOf('混合' + String(round), '1342000' + String(1000 + round),
          'mixed' + String(round) + '@example.com', '山东省烟台市芝罘区', '', CATEGORY_B), 'ON_CONFLICT_REPLACE');
      }
      expect(store.names().length).assertEqual(store.rowCount());
      expect(store.rowCount()).assertEqual(150);
      expect(store.deleteCalls).assertEqual(30);
      expect(store.batchCalls).assertEqual(30);
      logStep('longSequenceStabilityTest', 'names always match the rows');
    });

    /**
     * @tc.name   longMixedTrailKeepsTail
     * @tc.desc   A long add, update and delete trail leaves the documented rows at both ends.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('longMixedTrailKeepsTail', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      for (let round = 0; round < 30; round++) {
        manager.addContact(contactOf('轨迹' + String(round), '1364000' + String(1000 + round),
          'trail' + String(round) + '@example.com', '辽宁省大连市中山区', '', CATEGORY_C));
        if (round % 3 === 0) {
          manager.updateContact(contactOf('轨迹' + String(round), '1364001' + String(1000 + round),
            'trail' + String(round) + '@example.com', '辽宁省大连市西岗区', '', CATEGORY_C));
        }
        if (round % 5 === 0) {
          manager.deleteContact(contactOf('轨迹' + String(round), '', '', '', '', ''));
        }
      }
      const rows = manager.getContacts();
      expect(rows.length).assertEqual(39);
      expect(rows[0].name).assertEqual('艾德里安');
      expect(rows[15].name).assertEqual('轨迹1');
      expect(countOf(contactNames(rows), '轨迹0')).assertEqual(0);
      logStep('longSequenceStabilityTest', 'long mixed trail keeps both ends');
    });

    /**
     * @tc.name   repeatedSeedResetsAreIdempotent
     * @tc.desc   Setting the seed five times always yields the same fifteen row fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the LongSequenceStability scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedSeedResetsAreIdempotent', 0, () => {
      const manager = resetContactManager();
      let fingerprint = 0;
      for (let round = 0; round < 5; round++) {
        manager.setContacts(createSeedContacts());
        const current = ContactMetrics.from(manager.getContacts()).fingerprint();
        if (round === 0) {
          fingerprint = current;
        } else {
          expect(current).assertEqual(fingerprint);
        }
      }
      expect(manager.getContacts().length).assertEqual(15);
      expect(fingerprint > 0).assertTrue();
      logStep('longSequenceStabilityTest', 'repeated seed resets are idempotent');
    });
  });
}
