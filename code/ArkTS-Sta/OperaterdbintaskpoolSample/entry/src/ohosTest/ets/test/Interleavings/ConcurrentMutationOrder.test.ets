'use static';
import { CATEGORY_E, CATEGORY_F } from '../Shared/SharedDriver';
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
 * Interleavings / ConcurrentMutationOrder suite.
 *
 * Two operations on the same name do not commute: update then delete leaves no
 * row, delete then update leaves no row either, but two updates keep the last
 * writer. The store widens the difference because SQL touches every duplicate
 * while the manager touches the first. The suite pins those orders explicitly.
 *
 * Source anchors:
 *   ContactManager.ets:41-48        getContacts and setContacts copy the array
 *   ContactManager.ets:55-65        first-match update
 *   DatabaseConnection.ets:241-272  update by name with three bound fields
 *   SharedDriver.ets:606-618        StoreDouble.updateContact fans out
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  CATEGORY_A,
  CATEGORY_B,
  CATEGORY_C,
  CATEGORY_D,
  OperationCatalog,
  TaskPoolQueue,
  createSeedContacts,
  contactOf,
  cloneContact,
  contactNames,
  joined,
  countOf,
  snapshotsOf,
  sameSnapshotArray,
  StoreDouble,
  ContactMetrics,
  SearchEngine,
  resetContactManager
} from '../Shared/SharedDriver';

export default function concurrentMutationOrderTest(): void {
  describe('ConcurrentMutationOrder', () => {
    beforeAll(() => {
      logSuite('ConcurrentMutationOrder', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('ConcurrentMutationOrder', 'end');
    });

    /**
     * @tc.name   addOrderSetsTailOrder
     * @tc.desc   Two appends keep the order in which they were issued.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addOrderSetsTailOrder', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('甲一', '13600000001', 'jiayi@example.com', '江苏省无锡市梁溪区', '', CATEGORY_A));
      manager.addContact(contactOf('甲二', '13600000002', 'jiaer@example.com', '江苏省无锡市滨湖区', '', CATEGORY_A));
      const names = contactNames(manager.getContacts());
      expect(names.length).assertEqual(17);
      expect(names[15]).assertEqual('甲一');
      expect(names[16]).assertEqual('甲二');
      expect(names.indexOf('甲二') - names.indexOf('甲一')).assertEqual(1);
      logStep('concurrentMutationOrderTest', 'appends keep issue order');
    });

    /**
     * @tc.name   lastUpdateWinsForSameName
     * @tc.desc   Two updates of 苏禾 leave the second phone and email on the single row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('lastUpdateWinsForSameName', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('苏禾', '13512345670', 'suhe.first@example.com', '浙江省宁波市海曙区', '', CATEGORY_B));
      manager.updateContact(contactOf('苏禾', '13512345671', 'suhe.second@example.com', '浙江省宁波市江北区', '', CATEGORY_B));
      manager.updateContact(contactOf('苏禾', '13512345672', 'suhe.third@example.com', '浙江省宁波市鄞州区', '', CATEGORY_B));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(16);
      expect(loaded[15].phone).assertEqual('13512345672');
      expect(loaded[15].email).assertEqual('suhe.third@example.com');
      expect(loaded[15].address).assertEqual('浙江省宁波市鄞州区');
      logStep('concurrentMutationOrderTest', 'last update wins');
    });

    /**
     * @tc.name   updateThenDeleteLeavesNoRow
     * @tc.desc   Rewriting 洛川 and then deleting it leaves the name absent and the list at fifteen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('updateThenDeleteLeavesNoRow', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('洛川', '13620000041', 'luochuan@example.com', '河南省许昌市魏都区', '', CATEGORY_D));
      manager.updateContact(contactOf('洛川', '13620000042', 'luochuan.new@example.com', '河南省漯河市郾城区', '', CATEGORY_D));
      expect(countOf(contactNames(manager.getContacts()), '洛川')).assertEqual(1);
      manager.deleteContact(contactOf('洛川', '', '', '', '', ''));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(countOf(contactNames(loaded), '洛川')).assertEqual(0);
      expect(SearchEngine.countCategory(loaded, CATEGORY_D)).assertEqual(2);
      logStep('concurrentMutationOrderTest', 'update then delete removes the row');
    });

    /**
     * @tc.name   deleteThenAddLeavesOneFreshRow
     * @tc.desc   Deleting a seed name before appending that name leaves a single fresh tail row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteThenAddLeavesOneFreshRow', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('本', '', '', '', '', ''));
      manager.addContact(contactOf('本', '16600003333', 'ben.fresh@example.com', '四川省自贡市自流井区', '', CATEGORY_B));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(countOf(contactNames(loaded), '本')).assertEqual(1);
      expect(loaded[14].name).assertEqual('本');
      expect(loaded[14].phone).assertEqual('16600003333');
      expect(loaded[3].name).assertEqual('本杰明');
      logStep('concurrentMutationOrderTest', 'delete then add is a single fresh row');
    });

    /**
     * @tc.name   addTwinThenUpdateFirstOnly
     * @tc.desc   Appending a 贝拉 twin before an update keeps the twin's original phone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addTwinThenUpdateFirstOnly', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('贝拉', '11111114444', 'bella.twin@example.com', '湖北省十堰市茅箭区', '', CATEGORY_B));
      manager.updateContact(contactOf('贝拉', '11111115555', 'bella.lead@example.com', '湖北省十堰市张湾区', '', CATEGORY_B));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(16);
      expect(loaded[2].phone).assertEqual('11111115555');
      expect(loaded[15].phone).assertEqual('11111114444');
      expect(loaded[15].email).assertEqual('bella.twin@example.com');
      expect(countOf(contactNames(loaded), '贝拉')).assertEqual(2);
      logStep('concurrentMutationOrderTest', 'update after twin add hits the first row');
    });

    /**
     * @tc.name   storeInsertOrderSurvivesCalls
     * @tc.desc   Four insert calls preserve the call order in the store row list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeInsertOrderSurvivesCalls', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.insert(true, contactOf('裴照', '13200000011', 'peizhao@example.com', '山西省大同市平城区', '', CATEGORY_D),
        'ON_CONFLICT_REPLACE');
      store.insert(true, contactOf('裴云', '13200000012', 'peiyun@example.com', '山西省大同市云冈区', '', CATEGORY_E),
        'ON_CONFLICT_REPLACE');
      store.insert(true, contactOf('裴雨', '13200000013', 'peiyu@example.com', '山西省阳泉市城区', '', CATEGORY_F),
        'ON_CONFLICT_REPLACE');
      store.insert(true, contactOf('裴风', '13200000014', 'peifeng@example.com', '山西省长治市潞州区', '', CATEGORY_A),
        'ON_CONFLICT_REPLACE');
      expect(joined(store.names())).assertEqual('裴照,裴云,裴雨,裴风');
      expect(store.rowCount()).assertEqual(4);
      expect(store.insertCalls).assertEqual(4);
      expect(store.names()[3]).assertEqual('裴风');
      logStep('concurrentMutationOrderTest', 'store inserts keep call order');
    });

    /**
     * @tc.name   storeUpdateLastWriteWins
     * @tc.desc   Successive store updates of one name end with the last phone and all rows rewritten.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeUpdateLastWriteWins', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      expect(store.updateContact(contactOf('卡梅隆', '17700000051', 'cameron.a@example.com',
        '陕西省铜川市王益区', '', CATEGORY_C))).assertEqual(1);
      expect(store.updateContact(contactOf('卡梅隆', '17700000052', 'cameron.b@example.com',
        '陕西省延安市宝塔区', '', CATEGORY_C))).assertEqual(1);
      expect(store.rows[5].phone).assertEqual('17700000052');
      expect(store.rows[5].email).assertEqual('cameron.b@example.com');
      expect(store.updateCalls).assertEqual(2);
      logStep('concurrentMutationOrderTest', 'store last write wins');
    });

    /**
     * @tc.name   storeDeleteBetweenBatchesCounts
     * @tc.desc   A delete between two batches removes only the rows present at that moment.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeDeleteBetweenBatchesCounts', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 5));
      expect(store.deleteByName('贝拉')).assertEqual(1);
      store.batchInsert(true, createSeedContacts().slice(5, 10));
      expect(store.rowCount()).assertEqual(9);
      expect(countOf(store.names(), '贝拉')).assertEqual(0);
      expect(store.deleteByName('卡梅隆')).assertEqual(1);
      expect(store.rowCount()).assertEqual(8);
      logStep('concurrentMutationOrderTest', 'delete between batches removes only present rows');
    });

    /**
     * @tc.name   managerAndStoreDivergeOnTwins
     * @tc.desc   One duplicate update touches the first manager row but both store rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerAndStoreDivergeOnTwins', 0, () => {
      const manager = ContactManager.getInstance();
      const store = new StoreDouble();
      store.init(true);
      const rows = createSeedContacts();
      manager.setContacts(rows);
      store.batchInsert(true, rows);
      const twin = contactOf('贝拉', '11111116666', 'bella.store@example.com', '湖北省荆门市东宝区', '', CATEGORY_B);
      manager.addContact(twin);
      store.insert(true, twin, 'ON_CONFLICT_REPLACE');
      const edit = contactOf('贝拉', '11111117777', 'bella.merge@example.com', '湖北省荆门市掇刀区', '', CATEGORY_B);
      manager.updateContact(edit);
      const storeAffected = store.updateContact(edit);
      expect(storeAffected).assertEqual(2);
      expect(manager.getContacts()[2].phone).assertEqual('11111117777');
      expect(manager.getContacts()[15].phone).assertEqual('11111116666');
      expect(store.rows[2].phone).assertEqual('11111117777');
      expect(store.rows[15].phone).assertEqual('11111117777');
      logStep('concurrentMutationOrderTest', 'manager and store diverge on duplicates');
    });

    /**
     * @tc.name   setContactsReplacesPreviousRows
     * @tc.desc   A second setContacts swaps the whole list, so earlier rows are gone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('setContactsReplacesPreviousRows', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      expect(manager.getContacts().length).assertEqual(15);
      const replacement: Contact[] = [];
      replacement.push(contactOf('莫川', '13100000011', 'mochuan@example.com', '贵州省遵义市红花岗区', '', CATEGORY_A));
      replacement.push(contactOf('莫水', '13100000012', 'moshui@example.com', '贵州省遵义市汇川区', '', CATEGORY_A));
      manager.setContacts(replacement);
      expect(manager.getContacts().length).assertEqual(2);
      expect(contactNames(manager.getContacts()).indexOf('贝拉')).assertEqual(-1);
      expect(ContactMetrics.from(manager.getContacts()).total).assertEqual(2);
      logStep('concurrentMutationOrderTest', 'setContacts swaps the list');
    });

    /**
     * @tc.name   setContactsCopiesInputArray
     * @tc.desc   Pushing onto the caller's array after setContacts does not grow the manager list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('setContactsCopiesInputArray', 0, () => {
      const manager = ContactManager.getInstance();
      const rows = createSeedContacts();
      manager.setContacts(rows);
      rows.push(contactOf('洛水', '13620000051', 'luoshui@example.com', '河南省商丘市梁园区', '', CATEGORY_D));
      expect(rows.length).assertEqual(16);
      expect(manager.getContacts().length).assertEqual(15);
      expect(countOf(contactNames(manager.getContacts()), '洛水')).assertEqual(0);
      logStep('concurrentMutationOrderTest', 'setContacts copies the input array');
    });

    /**
     * @tc.name   getContactsReturnsCopy
     * @tc.desc   Pushing onto the array returned by getContacts does not mutate the manager.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('getContactsReturnsCopy', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const view = manager.getContacts();
      view.push(contactOf('洛山', '13620000052', 'luoshan@example.com', '河南省周口市川汇区', '', CATEGORY_D));
      expect(view.length).assertEqual(16);
      expect(manager.getContacts().length).assertEqual(15);
      expect(countOf(contactNames(manager.getContacts()), '洛山')).assertEqual(0);
      expect(view === manager.getContacts()).assertFalse();
      logStep('concurrentMutationOrderTest', 'getContacts returns a copy');
    });

    /**
     * @tc.name   twoStoresStayIndependent
     * @tc.desc   A delete in one store does not touch a second store holding the same seed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoStoresStayIndependent', 0, () => {
      const first = new StoreDouble();
      const second = new StoreDouble();
      first.init(true);
      second.init(true);
      first.batchInsert(true, createSeedContacts());
      second.batchInsert(true, createSeedContacts());
      first.deleteByName('贝拉');
      expect(first.rowCount()).assertEqual(14);
      expect(second.rowCount()).assertEqual(15);
      expect(countOf(second.names(), '贝拉')).assertEqual(1);
      expect(second.deleteCalls).assertEqual(0);
      logStep('concurrentMutationOrderTest', 'two stores do not share state');
    });

    /**
     * @tc.name   completionOrderCanBeReversed
     * @tc.desc   Three running tasks completed in reverse order produce a reversed trace.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completionOrderCanBeReversed', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.CREATE_TABLE);
      queue.submit(OperationCatalog.QUERY_ALL);
      queue.submit(OperationCatalog.INSERT_ONE);
      queue.runNext();
      queue.runNext();
      queue.runNext();
      queue.complete(OperationCatalog.INSERT_ONE);
      queue.complete(OperationCatalog.QUERY_ALL);
      queue.complete(OperationCatalog.CREATE_TABLE);
      expect(queue.trace()).assertEqual('insert-one>query-all>create-table');
      expect(queue.running.length).assertEqual(0);
      expect(queue.completed.length).assertEqual(3);
      expect(queue.completionOrder[1]).assertEqual(OperationCatalog.QUERY_ALL);
      logStep('concurrentMutationOrderTest', 'reverse completion order is recorded');
    });

    /**
     * @tc.name   submitMidFlightJoinsPendingTail
     * @tc.desc   A submit issued while one task runs lands behind the existing pending item.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('submitMidFlightJoinsPendingTail', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.INIT_STORE);
      queue.submit(OperationCatalog.CREATE_TABLE);
      queue.runNext();
      queue.submit(OperationCatalog.DEDUPE_ROWS);
      expect(queue.pending.length).assertEqual(2);
      expect(queue.pending[0]).assertEqual(OperationCatalog.CREATE_TABLE);
      expect(queue.pending[1]).assertEqual(OperationCatalog.DEDUPE_ROWS);
      queue.complete(OperationCatalog.INIT_STORE);
      expect(queue.runNext()).assertEqual(OperationCatalog.CREATE_TABLE);
      logStep('concurrentMutationOrderTest', 'mid-flight submit joins the tail');
    });

    /**
     * @tc.name   failAfterCompleteKeepsBothLists
     * @tc.desc   A completion then a failure of the same operation appears in both state lists.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('failAfterCompleteKeepsBothLists', 0, () => {
      const queue = new TaskPoolQueue();
      queue.submit(OperationCatalog.BATCH_INSERT);
      queue.runNext();
      queue.complete(OperationCatalog.BATCH_INSERT);
      queue.fail(OperationCatalog.BATCH_INSERT);
      expect(queue.completed.length).assertEqual(1);
      expect(queue.failed.length).assertEqual(1);
      expect(queue.completed[0]).assertEqual(OperationCatalog.BATCH_INSERT);
      expect(queue.failed[0]).assertEqual(OperationCatalog.BATCH_INSERT);
      expect(queue.running.length).assertEqual(0);
      logStep('concurrentMutationOrderTest', 'complete and fail are independent lists');
    });

    /**
     * @tc.name   batchThenInsertKeepsBatchFirst
     * @tc.desc   A five row batch followed by a single insert leaves the single row at index five.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchThenInsertKeepsBatchFirst', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 5));
      store.insert(true, contactOf('闻溪', '13700000051', 'wenxi.tail@example.com', '广东省珠海市香洲区', '', CATEGORY_C),
        'ON_CONFLICT_REPLACE');
      expect(store.rowCount()).assertEqual(6);
      expect(store.names()[4]).assertEqual('本杰明');
      expect(store.names()[5]).assertEqual('闻溪');
      expect(store.batchCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(1);
      logStep('concurrentMutationOrderTest', 'batch rows stay ahead of the insert');
    });

    /**
     * @tc.name   insertThenDeleteThenBatchOrder
     * @tc.desc   Insert, delete and batch in that order leaves the batch rows after the surviving insert.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('insertThenDeleteThenBatchOrder', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.insert(true, contactOf('阮一', '13300000011', 'ruanyi@example.com', '广西柳州市城中区', '', CATEGORY_C),
        'ON_CONFLICT_REPLACE');
      store.insert(true, contactOf('阮二', '13300000012', 'ruaner@example.com', '广西柳州市鱼峰区', '', CATEGORY_C),
        'ON_CONFLICT_REPLACE');
      expect(store.deleteByName('阮一')).assertEqual(1);
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      expect(store.rowCount()).assertEqual(3);
      expect(store.names()[0]).assertEqual('阮二');
      expect(store.names()[1]).assertEqual('艾德里安');
      expect(store.names()[2]).assertEqual('阿诺德');
      logStep('concurrentMutationOrderTest', 'insert delete batch order pinned');
    });

    /**
     * @tc.name   mixedSequenceSnapshotTrail
     * @tc.desc   Add, edit, delete and re-add leave the snapshot trail equal to a hand built expectation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('mixedSequenceSnapshotTrail', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts().slice(0, 4));
      manager.addContact(contactOf('段甲', '13630000011', 'duanjia@example.com', '湖南省株洲市荷塘区', '', CATEGORY_A));
      manager.updateContact(contactOf('段甲', '13630000012', 'duanjia.new@example.com', '湖南省株洲市芦淞区', '', CATEGORY_A));
      manager.deleteContact(contactOf('本', '', '', '', '', ''));
      const expected: Contact[] = [];
      expected.push(cloneContact(createSeedContacts()[0]));
      expected.push(cloneContact(createSeedContacts()[1]));
      expected.push(cloneContact(createSeedContacts()[2]));
      expected.push(contactOf('段甲', '13630000012', 'duanjia.new@example.com', '湖南省株洲市芦淞区', '', CATEGORY_A));
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(expected))).assertTrue();
      expect(manager.getContacts().length).assertEqual(4);
      expect(contactNames(manager.getContacts())[3]).assertEqual('段甲');
      logStep('concurrentMutationOrderTest', 'mixed sequence matches the expectation');
    });

    /**
     * @tc.name   reseedingDoesNotLeakPreviousDuplicates
     * @tc.desc   A duplicate rich list replaced by the clean seed reports zero duplicate names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('reseedingDoesNotLeakPreviousDuplicates', 0, () => {
      const manager = ContactManager.getInstance();
      const rows = createSeedContacts();
      rows.push(contactOf('贝拉', '11111118888', 'bella.leak@example.com', '湖北省黄石市黄石港区', '', CATEGORY_B));
      manager.setContacts(rows);
      expect(ContactMetrics.from(manager.getContacts()).duplicateNames).assertEqual(1);
      manager.setContacts(createSeedContacts());
      const metrics = ContactMetrics.from(manager.getContacts());
      expect(metrics.total).assertEqual(15);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.uniqueNames).assertEqual(15);
      logStep('concurrentMutationOrderTest', 'reseeding drops earlier duplicates');
    });

    /**
     * @tc.name   mutationCountersTrackEachCall
     * @tc.desc   The store counters record one insert, one update, one delete and one batch call each.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('mutationCountersTrackEachCall', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts().slice(0, 3));
      store.insert(true, contactOf('莫水', '13100000021', 'moshui.one@example.com', '贵州省六盘水市钟山区', '', CATEGORY_A),
        'ON_CONFLICT_REPLACE');
      store.updateContact(contactOf('莫水', '13100000022', 'moshui.two@example.com', '贵州省六盘水市水城区', '', CATEGORY_A));
      store.deleteByName('贝拉');
      expect(store.initCalls).assertEqual(1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(1);
      expect(store.updateCalls).assertEqual(1);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(3);
      logStep('concurrentMutationOrderTest', 'counters track each mutation call');
    });

    /**
     * @tc.name   drainOrderEqualsSubmitOrder
     * @tc.desc   Draining a queue built from the operation catalog returns the catalog order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ConcurrentMutationOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('drainOrderEqualsSubmitOrder', 0, () => {
      const queue = new TaskPoolQueue();
      const catalog = OperationCatalog.all();
      for (let index = 0; index < catalog.length; index++) {
        queue.submit(catalog[index]);
      }
      expect(queue.pending.length).assertEqual(8);
      expect(queue.drain()).assertEqual(8);
      expect(queue.trace()).assertEqual(joined(catalog, '>'));
      expect(queue.completed.length).assertEqual(8);
      logStep('concurrentMutationOrderTest', 'drain preserves catalog order');
    });
  });
}
