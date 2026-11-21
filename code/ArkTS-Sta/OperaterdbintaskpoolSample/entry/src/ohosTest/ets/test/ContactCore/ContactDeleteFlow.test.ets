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
 * ContactCore / ContactDeleteFlow suite.
 *
 * ContactManager.deleteContact filters by exact name, so every duplicate with
 * that name disappears while the surviving order is preserved. The suite pins
 * that contract, the oracle in expectedAfterDelete, the matching store
 * deleteByName result count and the parity between manager and store.
 *
 * Source anchors:
 *   ContactManager.ets:67-70        filter by item.name !== contact.name
 *   OperateRDBInTaskPool.ets:112-120 delete intent path
 *   SharedDriver.ets:591-604        StoreDouble.deleteByName
 *   SharedDriver.ets:737-746        expectedAfterDelete oracle
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  CATEGORY_B,
  CATEGORY_D,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  joined,
  sameStringArray,
  countOf,
  expectedAfterDelete,
  snapshotsOf,
  sameSnapshotArray,
  ContactMetrics,
  SearchEngine,
  StoreDouble,
  resetContactManager
} from '../Shared/SharedDriver';

export default function contactDeleteFlowTest(): void {
  describe('ContactDeleteFlow', () => {
    beforeAll(() => {
      logSuite('ContactDeleteFlow', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('ContactDeleteFlow', 'end');
    });

    /**
     * @tc.name   deleteExistingNameRemovesSingleRow
     * @tc.desc   Deleting the unique name 本 drops exactly one row and keeps fourteen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteExistingNameRemovesSingleRow', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('本', '', '', '', '', ''));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(14);
      expect(contactNames(loaded).indexOf('本')).assertEqual(-1);
      expect(contactNames(loaded).indexOf('本杰明') >= 0).assertTrue();
      expect(loaded[3].name).assertEqual('本杰明');
      expect(countOf(contactNames(loaded), '本')).assertEqual(0);
      logStep('deleteFlowTest', 'single row deleted by exact name');
    });

    /**
     * @tc.name   deleteRemovesEveryDuplicateNamedRow
     * @tc.desc   Three rows named 贝拉 all disappear in one delete call because the filter matches names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteRemovesEveryDuplicateNamedRow', 0, () => {
      const manager = ContactManager.getInstance();
      const rows = createSeedContacts();
      rows.push(contactOf('贝拉', '13900000001', 'bella2@example.com', '天津市和平区', '', 'B'));
      rows.push(contactOf('贝拉', '13900000002', 'bella3@example.com', '重庆市渝中区', '', 'B'));
      manager.setContacts(rows);
      expect(countOf(contactNames(manager.getContacts()), '贝拉')).assertEqual(3);
      manager.deleteContact(contactOf('贝拉', '11111111111', 'bella@example.com', '湖北省武汉市江汉区', '', 'B'));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(14);
      expect(countOf(contactNames(loaded), '贝拉')).assertEqual(0);
      expect(SearchEngine.countCategory(loaded, CATEGORY_B)).assertEqual(2);
      expect(contactNames(loaded).indexOf('本')).assertEqual(2);
    });

    /**
     * @tc.name   deleteUnknownNameLeavesListUnchanged
     * @tc.desc   Deleting a name that is absent keeps fifteen rows and every snapshot identical.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteUnknownNameLeavesListUnchanged', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const before = snapshotsOf(manager.getContacts());
      manager.deleteContact(contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'C'));
      const after = manager.getContacts();
      expect(after.length).assertEqual(15);
      expect(sameSnapshotArray(snapshotsOf(after), before)).assertTrue();
      expect(contactNames(after).indexOf('林岸')).assertEqual(-1);
      expect(contactNames(after)[14]).assertEqual('法里');
      expect(ContactMetrics.from(after).total).assertEqual(15);
      expect(SearchEngine.groupByCategory(after).length).assertEqual(6);
    });

    /**
     * @tc.name   deleteIsCaseSensitiveOnName
     * @tc.desc   A Latin name is removed only by its exact casing; lowercase leaves the row in place.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteIsCaseSensitiveOnName', 0, () => {
      const manager = ContactManager.getInstance();
      const rows = createSeedContacts();
      rows.push(contactOf('Alice', '13800138001', 'alice@example.com', '上海市静安区', '', 'C'));
      manager.setContacts(rows);
      manager.deleteContact(contactOf('alice', '', '', '', '', ''));
      expect(manager.getContacts().length).assertEqual(16);
      expect(contactNames(manager.getContacts()).indexOf('Alice') >= 0).assertTrue();
      manager.deleteContact(contactOf('ALICE', '', '', '', '', ''));
      expect(manager.getContacts().length).assertEqual(16);
      manager.deleteContact(contactOf('Alice', '', '', '', '', ''));
      expect(manager.getContacts().length).assertEqual(15);
      expect(contactNames(manager.getContacts()).indexOf('Alice')).assertEqual(-1);
    });

    /**
     * @tc.name   deleteRequiresWholeNameMatch
     * @tc.desc   Deleting the single character 艾 does not touch 艾德里安, 艾登, 艾拉 or 艾里.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteRequiresWholeNameMatch', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('艾', '', '', '', '', ''));
      expect(manager.getContacts().length).assertEqual(15);
      expect(contactNames(manager.getContacts()).indexOf('艾德里安') >= 0).assertTrue();
      expect(contactNames(manager.getContacts()).indexOf('艾登') >= 0).assertTrue();
      expect(contactNames(manager.getContacts()).indexOf('艾里') >= 0).assertTrue();
      expect(contactNames(manager.getContacts()).indexOf('艾')).assertEqual(-1);
      expect(SearchEngine.countCategory(manager.getContacts(), 'E')).assertEqual(3);
      expect(SearchEngine.countCategory(manager.getContacts(), 'A')).assertEqual(2);
    });

    /**
     * @tc.name   deletePreservesRemainingOrder
     * @tc.desc   Removing 卡特琳娜 keeps the other fourteen names in the exact seed order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deletePreservesRemainingOrder', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      manager.deleteContact(contactOf('卡特琳娜', '', '', '', '', ''));
      const names = contactNames(manager.getContacts());
      expect(joined(names, '>')).assertEqual('艾德里安>阿诺德>贝拉>本>本杰明>卡梅隆>康纳>丹尼尔>戴维维>艾登>艾拉>艾里>法比而>法里');
      expect(names.indexOf('康纳')).assertEqual(6);
      expect(names.indexOf('丹尼尔')).assertEqual(7);
      expect(names.length).assertEqual(14);
      expect(sameStringArray(names, contactNames(expectedAfterDelete(seed, '卡特琳娜')))).assertTrue();
    });

    /**
     * @tc.name   deleteKeepsSurvivorFieldsIntact
     * @tc.desc   After deleting 艾拉 every remaining row keeps its phone, mailbox and category values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteKeepsSurvivorFieldsIntact', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      manager.deleteContact(contactOf('艾拉', '', '', '', '', ''));
      const loaded = manager.getContacts();
      const expected = expectedAfterDelete(seed, '艾拉');
      expect(loaded.length).assertEqual(expected.length);
      let matched = 0;
      for (let index = 0; index < loaded.length; index++) {
        if (sameContact(loaded[index], expected[index])) {
          matched = matched + 1;
        }
      }
      expect(matched).assertEqual(14);
      expect(loaded[10].name).assertEqual('艾登');
      expect(loaded[11].name).assertEqual('艾里');
      expect(loaded[11].phone).assertEqual('11111111111');
    });

    /**
     * @tc.name   deleteFirstRowKeepsTailOrder
     * @tc.desc   Removing 艾德里安 moves 阿诺德 to the head without disturbing the rest of the tail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteFirstRowKeepsTailOrder', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('艾德里安', '', '', '', '', ''));
      const names = contactNames(manager.getContacts());
      expect(names.length).assertEqual(14);
      expect(names[0]).assertEqual('阿诺德');
      expect(names[1]).assertEqual('贝拉');
      expect(names[13]).assertEqual('法里');
      expect(names.indexOf('法比而')).assertEqual(12);
      expect(SearchEngine.countCategory(manager.getContacts(), 'A')).assertEqual(1);
      expect(manager.getContacts()[0].phone).assertEqual('16666666666');
    });

    /**
     * @tc.name   deleteLastRowKeepsHeadOrder
     * @tc.desc   Removing 法里 leaves the first fourteen names exactly as declared.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteLastRowKeepsHeadOrder', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('法里', '', '', '', '', ''));
      const names = contactNames(manager.getContacts());
      expect(names.length).assertEqual(14);
      expect(names[13]).assertEqual('法比而');
      expect(names[0]).assertEqual('艾德里安');
      expect(joined(names.slice(0, 3), '>')).assertEqual('艾德里安>阿诺德>贝拉');
      expect(SearchEngine.countCategory(manager.getContacts(), 'F')).assertEqual(1);
      expect(manager.getContacts()[13].email).assertEqual('connor@example.com');
      expect(names.indexOf('法里')).assertEqual(-1);
    });

    /**
     * @tc.name   deleteAllRowsOneByOneEmptiesManager
     * @tc.desc   Deleting each seeded name in order drains the manager, leaving zero rows and labels.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteAllRowsOneByOneEmptiesManager', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      for (let index = 0; index < seed.length; index++) {
        manager.deleteContact(seed[index]);
      }
      expect(manager.getContacts().length).assertEqual(0);
      expect(contactNames(manager.getContacts()).length).assertEqual(0);
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(0);
      expect(ContactMetrics.from(manager.getContacts()).total).assertEqual(0);
      expect(joined(contactNames(manager.getContacts()), ',')).assertEqual('');
      expect(manager.getContacts().find((row: Contact, index: int): boolean => index === 0) === undefined).assertTrue();
    });

    /**
     * @tc.name   deleteUsesNameOnlyFromArgument
     * @tc.desc   A delete argument with mismatched phone and mailbox still removes 卡梅隆 by name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteUsesNameOnlyFromArgument', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('卡梅隆', '00000000000', 'wrong@example.com', '未知地址', 'x', 'F'));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(14);
      expect(contactNames(loaded).indexOf('卡梅隆')).assertEqual(-1);
      expect(contactNames(loaded).indexOf('丹尼尔') >= 0).assertTrue();
      expect(SearchEngine.countCategory(loaded, 'D')).assertEqual(2);
      expect(SearchEngine.countCategory(loaded, 'C')).assertEqual(2);
      expect(loaded[7].phone).assertEqual('17777777777');
      expect(SearchEngine.countCategory(loaded, 'E')).assertEqual(3);
    });

    /**
     * @tc.name   deleteOracleMatchesManagerForSeedName
     * @tc.desc   expectedAfterDelete and the manager agree row for row when 本杰明 is removed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteOracleMatchesManagerForSeedName', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      manager.deleteContact(contactOf('本杰明', '', '', '', '', ''));
      const oracle = expectedAfterDelete(seed, '本杰明');
      const loaded = manager.getContacts();
      expect(sameStringArray(contactNames(loaded), contactNames(oracle))).assertTrue();
      expect(oracle.length).assertEqual(14);
      expect(oracle[3].name).assertEqual('本');
      expect(oracle[4].name).assertEqual('卡梅隆');
      expect(sameSnapshotArray(snapshotsOf(loaded), snapshotsOf(oracle))).assertTrue();
      expect(countOf(contactNames(oracle), '本杰明')).assertEqual(0);
    });

    /**
     * @tc.name   deleteOnEmptyManagerCountStaysZero
     * @tc.desc   Deleting from the reset manager keeps zero rows and zero category labels.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteOnEmptyManagerCountStaysZero', 0, () => {
      const manager = ContactManager.getInstance();
      manager.deleteContact(contactOf('艾登', '17777777777', 'cameron@example.com', '陕西省西安市雁塔区', '', 'E'));
      expect(manager.getContacts().length).assertEqual(0);
      manager.deleteContact(new Contact());
      expect(manager.getContacts().length).assertEqual(0);
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(0);
      expect(ContactMetrics.from(manager.getContacts()).fillRatio()).assertEqual(0);
      expect(manager.getContacts().indexOf(new Contact())).assertEqual(-1);
      expect(contactNames(manager.getContacts()).length).assertEqual(0);
    });

    /**
     * @tc.name   storeDeleteByNameReturnsRemovedCount
     * @tc.desc   The store reports how many rows the delete removed, here two B rows named 贝拉.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('storeDeleteByNameReturnsRemovedCount', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(true, createSeedContacts());
      store.rows.push(contactOf('贝拉', '13900000009', 'bella9@example.com', '浙江省杭州市西湖区', '', 'B'));
      expect(store.rowCount()).assertEqual(16);
      const removed = store.deleteByName('贝拉');
      expect(removed).assertEqual(2);
      expect(store.rowCount()).assertEqual(14);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.names().indexOf('贝拉')).assertEqual(-1);
      expect(countOf(store.names(), '本')).assertEqual(1);
    });

    /**
     * @tc.name   storeDeleteByNameRemovesEveryMatch
     * @tc.desc   A store holding three 艾里 rows loses all of them in a single deleteByName call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeDeleteByNameRemovesEveryMatch', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(true, createSeedContacts());
      store.rows.push(contactOf('艾里', '13900000010', 'eli2@example.com', '安徽省合肥市蜀山区', '', 'E'));
      store.rows.push(contactOf('艾里', '13900000011', 'eli3@example.com', '福建省福州市鼓楼区', '', 'E'));
      expect(countOf(store.names(), '艾里')).assertEqual(3);
      const removed = store.deleteByName('艾里');
      expect(removed).assertEqual(3);
      expect(store.rowCount()).assertEqual(14);
      expect(countOf(store.names(), '艾里')).assertEqual(0);
      expect(store.rows[12].name).assertEqual('法比而');
      expect(store.deleteCalls).assertEqual(1);
    });

    /**
     * @tc.name   storeDeleteByNameUnknownReturnsZero
     * @tc.desc   A missing name removes nothing but still records one delete call on the store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeDeleteByNameUnknownReturnsZero', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(true, createSeedContacts());
      const removed = store.deleteByName('林岸');
      expect(removed).assertEqual(0);
      expect(store.rowCount()).assertEqual(15);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.names()[14]).assertEqual('法里');
      expect(store.rows.length).assertEqual(15);
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   managerAndStoreDeleteAgreeOnRemainingNames
     * @tc.desc   Manager and store both remove 戴维维 and keep the same fourteen names in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerAndStoreDeleteAgreeOnRemainingNames', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const store = new StoreDouble();
      store.batchInsert(true, seed);
      const storeRemoved = store.deleteByName('戴维维');
      manager.deleteContact(contactOf('戴维维', '', '', '', '', ''));
      expect(storeRemoved).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(store.rowCount());
      expect(sameStringArray(contactNames(manager.getContacts()), store.names())).assertTrue();
      expect(joined(store.names(), '>').indexOf('戴维维')).assertEqual(-1);
      expect(SearchEngine.countCategory(store.rows, CATEGORY_D)).assertEqual(1);
      expect(SearchEngine.countCategory(manager.getContacts(), CATEGORY_D)).assertEqual(1);
    });

    /**
     * @tc.name   storeDeleteByNamePreservesRowOrder
     * @tc.desc   Removing 康纳 from the store keeps the remaining rows in their insertion order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeDeleteByNamePreservesRowOrder', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(true, createSeedContacts());
      store.deleteByName('康纳');
      const names = store.names();
      expect(names.length).assertEqual(14);
      expect(names[4]).assertEqual('本杰明');
      expect(names[5]).assertEqual('卡梅隆');
      expect(names[6]).assertEqual('卡特琳娜');
      expect(names[13]).assertEqual('法里');
      expect(joined(names.slice(0, 4), '>')).assertEqual('艾德里安>阿诺德>贝拉>本');
      expect(names.indexOf('康纳')).assertEqual(-1);
    });

    /**
     * @tc.name   deleteIncrementsStoreDeleteCalls
     * @tc.desc   Each deleteByName invocation bumps the store call counter, including a no-op call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteIncrementsStoreDeleteCalls', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(true, createSeedContacts());
      store.deleteByName('法比而');
      expect(store.deleteCalls).assertEqual(1);
      store.deleteByName('法比而');
      expect(store.deleteCalls).assertEqual(2);
      store.deleteByName('未知联系人');
      expect(store.deleteCalls).assertEqual(3);
      expect(store.rowCount()).assertEqual(14);
      expect(store.names().indexOf('法比而')).assertEqual(-1);
      expect(store.batchCalls).assertEqual(1);
    });

    /**
     * @tc.name   consecutiveDeletesAccumulateRemovals
     * @tc.desc   Two deletes of different names return their own counts and the totals add up.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('consecutiveDeletesAccumulateRemovals', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(true, createSeedContacts());
      const first = store.deleteByName('阿诺德');
      const second = store.deleteByName('丹尼尔');
      expect(first).assertEqual(1);
      expect(second).assertEqual(1);
      expect(first + second).assertEqual(2);
      expect(store.rowCount()).assertEqual(13);
      expect(store.names().indexOf('阿诺德')).assertEqual(-1);
      expect(store.names().indexOf('丹尼尔')).assertEqual(-1);
      expect(store.names()[6]).assertEqual('卡特琳娜');
    });

    /**
     * @tc.name   deleteByNameAfterInsertRemovesNewlyAddedRow
     * @tc.desc   A row inserted after the seed is deletable by the same name path.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteByNameAfterInsertRemovesNewlyAddedRow', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(true, createSeedContacts());
      const added = contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'C');
      store.insert(true, added, 'ON_CONFLICT_REPLACE');
      expect(store.rowCount()).assertEqual(16);
      expect(store.names()[15]).assertEqual('林岸');
      const removed = store.deleteByName('林岸');
      expect(removed).assertEqual(1);
      expect(store.rowCount()).assertEqual(15);
      expect(store.names().find((name: string, index: int): boolean => index === 15) === undefined).assertTrue();
      expect(store.insertCalls).assertEqual(1);
    });

    /**
     * @tc.name   deleteKeepsPreviouslyFetchedArrayPopulated
     * @tc.desc   getContacts returns a new array, so a copy fetched before the delete keeps its rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteKeepsPreviouslyFetchedArrayPopulated', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const before = manager.getContacts();
      expect(before.length).assertEqual(15);
      manager.deleteContact(contactOf('艾登', '', '', '', '', ''));
      expect(before.length).assertEqual(15);
      expect(contactNames(before).indexOf('艾登') >= 0).assertTrue();
      expect(manager.getContacts().length).assertEqual(14);
      expect(contactNames(manager.getContacts()).indexOf('艾登')).assertEqual(-1);
      expect(before === manager.getContacts()).assertFalse();
    });

    /**
     * @tc.name   deleteThenReaddRestoresCountAtTail
     * @tc.desc   Deleting 法里 and re-adding the same row restores fifteen rows with the row at the tail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteThenReaddRestoresCountAtTail', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      manager.deleteContact(seed[14]);
      expect(manager.getContacts().length).assertEqual(14);
      manager.addContact(cloneContact(seed[14]));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(loaded[14].name).assertEqual('法里');
      expect(loaded[13].name).assertEqual('法比而');
      expect(sameStringArray(contactNames(loaded), contactNames(seed))).assertTrue();
      expect(SearchEngine.countCategory(loaded, 'F')).assertEqual(2);
      expect(sameContact(loaded[14], seed[14])).assertTrue();
    });

    /**
     * @tc.name   deleteMiddleRowKeepsNeighbourOrder
     * @tc.desc   Removing 丹尼尔 pulls 戴维维 and 艾登 together without reversing them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteMiddleRowKeepsNeighbourOrder', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('丹尼尔', '', '', '', '', ''));
      const names = contactNames(manager.getContacts());
      expect(names.length).assertEqual(14);
      expect(names[8]).assertEqual('戴维维');
      expect(names[9]).assertEqual('艾登');
      expect(names[7]).assertEqual('卡特琳娜');
      expect(joined(names.slice(7, 10), '>')).assertEqual('卡特琳娜>戴维维>艾登');
      expect(SearchEngine.countCategory(manager.getContacts(), 'D')).assertEqual(1);
      expect(manager.getContacts()[9].phone).assertEqual('17777777777');
    });

    /**
     * @tc.name   deleteEmptyNamedDefaultRowsRemovesBoth
     * @tc.desc   Two default rows share the empty name, so one delete call clears both of them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteEmptyNamedDefaultRowsRemovesBoth', 0, () => {
      const manager = ContactManager.getInstance();
      const rows = createSeedContacts();
      rows.push(new Contact());
      rows.push(new Contact());
      manager.setContacts(rows);
      expect(manager.getContacts().length).assertEqual(17);
      manager.deleteContact(new Contact());
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(countOf(contactNames(loaded), '')).assertEqual(0);
      expect(SearchEngine.countCategory(loaded, '')).assertEqual(0);
      expect(SearchEngine.groupByCategory(loaded).length).assertEqual(6);
      expect(loaded[14].name).assertEqual('法里');
      expect(ContactMetrics.from(loaded).total).assertEqual(15);
    });

    /**
     * @tc.name   deleteAllBRowsEliminatesLabel
     * @tc.desc   Deleting 贝拉, 本 and 本杰明 drops the B label and leaves five labels.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteAllBRowsEliminatesLabel', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('贝拉', '', '', '', '', ''));
      manager.deleteContact(contactOf('本', '', '', '', '', ''));
      manager.deleteContact(contactOf('本杰明', '', '', '', '', ''));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(12);
      expect(SearchEngine.countCategory(loaded, CATEGORY_B)).assertEqual(0);
      expect(SearchEngine.groupByCategory(loaded).length).assertEqual(5);
      expect(joined(SearchEngine.groupByCategory(loaded), '')).assertEqual('ACDEF');
      expect(contactNames(loaded).indexOf('本')).assertEqual(-1);
      expect(contactNames(loaded).indexOf('本杰明')).assertEqual(-1);
      expect(SearchEngine.countCategory(loaded, 'C')).assertEqual(3);
    });

    /**
     * @tc.name   deleteOneCategoryKeepsOtherCounts
     * @tc.desc   Removing the two C rows leaves A, D, E and F counts untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteOneCategoryKeepsOtherCounts', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('卡梅隆', '', '', '', '', ''));
      manager.deleteContact(contactOf('康纳', '', '', '', '', ''));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(13);
      expect(SearchEngine.countCategory(loaded, 'C')).assertEqual(1);
      expect(SearchEngine.countCategory(loaded, 'A')).assertEqual(2);
      expect(SearchEngine.countCategory(loaded, 'D')).assertEqual(2);
      expect(SearchEngine.countCategory(loaded, 'E')).assertEqual(3);
      expect(SearchEngine.countCategory(loaded, 'F')).assertEqual(2);
      expect(SearchEngine.countCategory(loaded, 'B')).assertEqual(3);
    });

    /**
     * @tc.name   substringNameDoesNotDeleteRows
     * @tc.desc   Deleting the inner substring 德里 removes nothing because names match whole values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('substringNameDoesNotDeleteRows', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const before = snapshotsOf(manager.getContacts());
      manager.deleteContact(contactOf('德里', '', '', '', '', ''));
      expect(manager.getContacts().length).assertEqual(15);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), before)).assertTrue();
      expect(contactNames(manager.getContacts()).indexOf('艾德里安') >= 0).assertTrue();
      manager.deleteContact(contactOf('艾德里', '', '', '', '', ''));
      expect(manager.getContacts().length).assertEqual(15);
      manager.deleteContact(contactOf('艾德里安', '', '', '', '', ''));
      expect(manager.getContacts().length).assertEqual(14);
      logStep('deleteFlowTest', 'substring names leave the catalog untouched');
    });

    /**
     * @tc.name   deleteTwiceSameNameSecondIsNoOp
     * @tc.desc   Repeating a delete for an already removed name changes nothing the second time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteTwiceSameNameSecondIsNoOp', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('艾里', '', '', '', '', ''));
      const afterFirst = manager.getContacts();
      expect(afterFirst.length).assertEqual(14);
      const snapshot = snapshotsOf(afterFirst);
      manager.deleteContact(contactOf('艾里', '', '', '', '', ''));
      expect(manager.getContacts().length).assertEqual(14);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshot)).assertTrue();
      expect(contactNames(manager.getContacts()).indexOf('艾里')).assertEqual(-1);
      expect(SearchEngine.countCategory(manager.getContacts(), 'E')).assertEqual(2);
      expect(manager.getContacts()[11].name).assertEqual('艾拉');
    });

    /**
     * @tc.name   deleteSharedPhoneRowKeepsOtherOwners
     * @tc.desc   Deleting 丹尼尔 keeps 卡梅隆 and 艾登 even though all three share 17777777777.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteSharedPhoneRowKeepsOtherOwners', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('丹尼尔', '', '', '', '', ''));
      const loaded = manager.getContacts();
      const owners: string[] = [];
      for (let index = 0; index < loaded.length; index++) {
        if (loaded[index].phone === '17777777777') {
          owners.push(loaded[index].name);
        }
      }
      expect(joined(owners, '>')).assertEqual('卡梅隆>艾登');
      expect(owners.length).assertEqual(2);
      expect(loaded.length).assertEqual(14);
      expect(contactNames(loaded).indexOf('丹尼尔')).assertEqual(-1);
      expect(SearchEngine.countCategory(loaded, 'D')).assertEqual(1);
      expect(loaded[5].name).assertEqual('卡梅隆');
    });

    /**
     * @tc.name   deleteOracleMatchesForEverySeedName
     * @tc.desc   For each of the fifteen names expectedAfterDelete agrees with the manager result length.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteOracleMatchesForEverySeedName', 0, () => {
      const seed = createSeedContacts();
      const manager = ContactManager.getInstance();
      let checked = 0;
      for (let index = 0; index < seed.length; index++) {
        manager.setContacts(seed);
        manager.deleteContact(seed[index]);
        const oracle = expectedAfterDelete(seed, seed[index].name);
        expect(manager.getContacts().length).assertEqual(oracle.length);
        expect(sameStringArray(contactNames(manager.getContacts()), contactNames(oracle))).assertTrue();
        checked = checked + 1;
      }
      expect(checked).assertEqual(15);
      expect(expectedAfterDelete(seed, '法里的别名').length).assertEqual(15);
      expect(expectedAfterDelete(seed, '法里').length).assertEqual(14);
    });

    /**
     * @tc.name   managerAndStoreParityAfterThreeDeletes
     * @tc.desc   Three deletes leave manager and store with identical names and row counts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerAndStoreParityAfterThreeDeletes', 0, () => {
      const seed = createSeedContacts();
      const manager = ContactManager.getInstance();
      manager.setContacts(seed);
      const store = new StoreDouble();
      store.batchInsert(true, seed);
      const names = ['阿诺德', '卡梅隆', '法比而'];
      for (let index = 0; index < names.length; index++) {
        manager.deleteContact(contactOf(names[index], '', '', '', '', ''));
        store.deleteByName(names[index]);
      }
      expect(manager.getContacts().length).assertEqual(12);
      expect(store.rowCount()).assertEqual(12);
      expect(sameStringArray(contactNames(manager.getContacts()), store.names())).assertTrue();
      expect(store.deleteCalls).assertEqual(3);
      expect(joined(store.names(), '>').split('>').length).assertEqual(12);
      expect(SearchEngine.countCategory(store.rows, 'A')).assertEqual(1);
    });

    /**
     * @tc.name   deletingFromTailKeepsPrefixOrder
     * @tc.desc   Deleting the last three names one by one leaves the first twelve rows in place.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deletingFromTailKeepsPrefixOrder', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      manager.deleteContact(seed[14]);
      manager.deleteContact(seed[13]);
      manager.deleteContact(seed[12]);
      const names = contactNames(manager.getContacts());
      expect(names.length).assertEqual(12);
      expect(names[11]).assertEqual('艾拉');
      expect(names[0]).assertEqual('艾德里安');
      expect(sameStringArray(names, contactNames(seed.slice(0, 12)))).assertTrue();
      expect(SearchEngine.countCategory(manager.getContacts(), 'F')).assertEqual(0);
      expect(SearchEngine.countCategory(manager.getContacts(), 'E')).assertEqual(2);
      expect(names.indexOf('艾里')).assertEqual(-1);
    });

    /**
     * @tc.name   getContactsReturnsFreshArrayAfterDelete
     * @tc.desc   Two reads after a delete return distinct arrays with equal contents.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('getContactsReturnsFreshArrayAfterDelete', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('戴维维', '', '', '', '', ''));
      const first = manager.getContacts();
      const second = manager.getContacts();
      expect(first === second).assertFalse();
      expect(first.length).assertEqual(second.length);
      expect(sameStringArray(contactNames(first), contactNames(second))).assertTrue();
      expect(first.length).assertEqual(14);
      first.push(new Contact('林岸', '13800138000', 'lin@example.com', '上海市徐汇区'));
      expect(manager.getContacts().length).assertEqual(14);
      expect(second.length).assertEqual(14);
    });

    /**
     * @tc.name   remainingMetricsRecalculateAfterDelete
     * @tc.desc   After deleting three rows all four metric counters shrink or stay consistent.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('remainingMetricsRecalculateAfterDelete', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const before = ContactMetrics.from(manager.getContacts());
      manager.deleteContact(contactOf('艾德里安', '', '', '', '', ''));
      manager.deleteContact(contactOf('阿诺德', '', '', '', '', ''));
      manager.deleteContact(contactOf('艾登', '', '', '', '', ''));
      const after = ContactMetrics.from(manager.getContacts());
      expect(after.total).assertEqual(12);
      expect(after.total).assertEqual(before.total - 3);
      expect(after.uniqueNames).assertEqual(12);
      expect(after.duplicateNames).assertEqual(0);
      expect(after.categories).assertEqual(5);
      expect(after.totalPhoneDigits).assertEqual(before.totalPhoneDigits - 33);
      expect(after.fingerprint() === before.fingerprint()).assertFalse();
    });

    /**
     * @tc.name   deleteTripleDuplicateRemovesAllThree
     * @tc.desc   A store holding the seed plus three extra 艾拉 rows removes all four at once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteTripleDuplicateRemovesAllThree', 0, () => {
      const store = new StoreDouble();
      store.batchInsert(true, createSeedContacts());
      store.rows.push(contactOf('艾拉', '13900000021', 'ella2@example.com', '广东省广州市越秀区', '', 'E'));
      store.rows.push(contactOf('艾拉', '13900000022', 'ella3@example.com', '广西壮族自治区南宁市青秀区', '', 'E'));
      store.rows.push(contactOf('艾拉', '13900000023', 'ella4@example.com', '海南省海口市龙华区', '', 'E'));
      expect(countOf(store.names(), '艾拉')).assertEqual(4);
      const removed = store.deleteByName('艾拉');
      expect(removed).assertEqual(4);
      expect(store.rowCount()).assertEqual(14);
      expect(countOf(store.names(), '艾拉')).assertEqual(0);
      expect(store.names()[10]).assertEqual('艾登');
      expect(store.deleteCalls).assertEqual(1);
      expect(SearchEngine.countCategory(store.rows, 'E')).assertEqual(2);
    });
    /**
     * @tc.name   deleteTrailingSpaceNameDoesNotMatch
     * @tc.desc   A name with a trailing space is a different key, so the real 艾拉 row survives.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDeleteFlow scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteTrailingSpaceNameDoesNotMatch', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('艾拉 ', '', '', '', '', ''));
      expect(manager.getContacts().length).assertEqual(15);
      manager.deleteContact(contactOf(' 艾拉', '', '', '', '', ''));
      expect(manager.getContacts().length).assertEqual(15);
      expect(countOf(contactNames(manager.getContacts()), '艾拉')).assertEqual(1);
      manager.deleteContact(contactOf('艾拉', '', '', '', '', ''));
      expect(manager.getContacts().length).assertEqual(14);
      expect(countOf(contactNames(manager.getContacts()), '艾拉')).assertEqual(0);
    });
  });
}
