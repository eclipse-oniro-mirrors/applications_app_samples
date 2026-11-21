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
 * AdvancedScenarios / AddEditDeleteInterleaving suite.
 *
 * The contact list is mutated through three independent entry points: add
 * appends, update replaces only the first matching name, delete filters every
 * row carrying that name. Interleaving the three must stay predictable, so each
 * case compares the manager against the oracles exported by SharedDriver
 * instead of re-deriving the rule inside the test.
 *
 * Source anchors:
 *   ContactManager.ets:50-53        addContact appends
 *   ContactManager.ets:55-65        updateContact replaces first match only
 *   ContactManager.ets:67-70        deleteContact filters by name
 *   SharedDriver.ets:727-761        add / delete / update oracles
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
  CATEGORY_E,
  CATEGORY_F,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  joined,
  sameStringArray,
  countOf,
  expectedAfterAdd,
  expectedAfterDelete,
  expectedAfterUpdate,
  snapshotsOf,
  sameSnapshotArray,
  ContactMetrics,
  SearchEngine,
  StoreDouble,
  resetContactManager
} from '../Shared/SharedDriver';

export default function addEditDeleteInterleavingTest(): void {
  describe('AddEditDeleteInterleaving', () => {
    beforeAll(() => {
      logSuite('AddEditDeleteInterleaving', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('AddEditDeleteInterleaving', 'end');
    });

    /**
     * @tc.name   addThenEditKeepsTailPosition
     * @tc.desc   An appended contact keeps the tail slot after an edit that matches its name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddEditDeleteInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addThenEditKeepsTailPosition', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const added = contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', CATEGORY_C);
      manager.addContact(added);
      expect(manager.getContacts().length).assertEqual(16);
      const edited = contactOf('林岸', '13800138001', 'lin2@example.com', '上海市静安区', '', CATEGORY_A);
      manager.updateContact(edited);
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(16);
      expect(loaded[15].name).assertEqual('林岸');
      expect(loaded[15].phone).assertEqual('13800138001');
      expect(loaded[15].address).assertEqual('上海市静安区');
      expect(contactNames(loaded)[14]).assertEqual('法里');
      logStep('addEditDeleteInterleavingTest', 'tail position preserved across add then edit');
    });

    /**
     * @tc.name   editUnknownNameLeavesListUntouched
     * @tc.desc   Updating a name that is absent changes nothing and keeps every snapshot identical.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddEditDeleteInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('editUnknownNameLeavesListUntouched', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const before = snapshotsOf(manager.getContacts());
      manager.updateContact(contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', CATEGORY_C));
      const after = manager.getContacts();
      expect(after.length).assertEqual(15);
      expect(sameSnapshotArray(snapshotsOf(after), before)).assertTrue();
      expect(contactNames(after).indexOf('林岸')).assertEqual(-1);
      expect(ContactMetrics.from(after).total).assertEqual(15);
      logStep('addEditDeleteInterleavingTest', 'edit without a name match is a no-op');
    });

    /**
     * @tc.name   deleteThenReAddAppendsTail
     * @tc.desc   A deleted seed contact returns at the tail instead of its original index.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddEditDeleteInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteThenReAddAppendsTail', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('卡梅隆', '', '', '', '', ''));
      expect(countOf(contactNames(manager.getContacts()), '卡梅隆')).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(14);
      manager.addContact(contactOf('卡梅隆', '17700000000', 'cameron.new@example.com', '陕西省西安市碑林区', '', CATEGORY_C));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(loaded[14].name).assertEqual('卡梅隆');
      expect(loaded[14].email).assertEqual('cameron.new@example.com');
      expect(contactNames(loaded).indexOf('卡梅隆')).assertEqual(14);
      logStep('addEditDeleteInterleavingTest', 're-added contact lands at the tail');
    });

    /**
     * @tc.name   addEditDeleteCycleMatchesOracles
     * @tc.desc   One full add, edit and delete cycle equals the chained driver oracles step by step.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddEditDeleteInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addEditDeleteCycleMatchesOracles', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const added = contactOf('苏禾', '13512345678', 'suhe@example.com', '浙江省杭州市西湖区', '', CATEGORY_B);
      manager.addContact(added);
      let oracle = expectedAfterAdd(seed, added);
      expect(sameStringArray(contactNames(manager.getContacts()), contactNames(oracle))).assertTrue();
      const edited = contactOf('苏禾', '13512345679', 'suhe2@example.com', '浙江省杭州市滨江区', '', CATEGORY_B);
      manager.updateContact(edited);
      oracle = expectedAfterUpdate(oracle, edited);
      expect(sameStringArray(contactNames(manager.getContacts()), contactNames(oracle))).assertTrue();
      manager.deleteContact(contactOf('本', '', '', '', '', ''));
      oracle = expectedAfterDelete(oracle, '本');
      expect(manager.getContacts().length).assertEqual(oracle.length);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(oracle))).assertTrue();
      logStep('addEditDeleteInterleavingTest', 'cycle matches the oracle at every step');
    });

    /**
     * @tc.name   sharedPhoneContactsStayIndependent
     * @tc.desc   Two contacts sharing the phone 16666666666 are addressed by name and never merged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddEditDeleteInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sharedPhoneContactsStayIndependent', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const twin = contactOf('阿诺德二号', '16666666666', 'arnold2@example.com', '上海市黄浦区', '', CATEGORY_A);
      manager.addContact(twin);
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(16);
      expect(countOf(contactNames(loaded), '阿诺德')).assertEqual(1);
      expect(countOf(contactNames(loaded), '阿诺德二号')).assertEqual(1);
      manager.deleteContact(contactOf('阿诺德', '', '', '', '', ''));
      const remaining = manager.getContacts();
      expect(countOf(contactNames(remaining), '阿诺德二号')).assertEqual(1);
      expect(remaining[remaining.length - 1].name).assertEqual('阿诺德二号');
      expect(remaining.length).assertEqual(15);
      logStep('addEditDeleteInterleavingTest', 'shared phone does not merge rows');
    });

    /**
     * @tc.name   editAfterDeleteIsNoOp
     * @tc.desc   Updating a name that was just deleted must not resurrect the row or grow the list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddEditDeleteInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('editAfterDeleteIsNoOp', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('艾登', '', '', '', '', ''));
      expect(manager.getContacts().length).assertEqual(14);
      manager.updateContact(contactOf('艾登', '17700000009', 'aiden.new@example.com', '陕西省西安市未央区', '', CATEGORY_C));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(14);
      expect(countOf(contactNames(loaded), '艾登')).assertEqual(0);
      expect(ContactMetrics.from(loaded).total).assertEqual(14);
      expect(loaded[10].name).assertEqual('艾拉');
      logStep('addEditDeleteInterleavingTest', 'edit after delete stays empty');
    });

    /**
     * @tc.name   deleteMiddleThenAppendPreservesOrder
     * @tc.desc   Removing index five and appending a new row keeps the remaining ten seed names in place.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddEditDeleteInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteMiddleThenAppendPreservesOrder', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('卡梅隆', '', '', '', '', ''));
      manager.addContact(contactOf('顾青', '13600000001', 'guqing@example.com', '江苏省苏州市姑苏区', '', CATEGORY_D));
      const names = contactNames(manager.getContacts());
      expect(names.length).assertEqual(15);
      expect(names[5]).assertEqual('康纳');
      expect(names[6]).assertEqual('卡特琳娜');
      expect(names[14]).assertEqual('顾青');
      expect(names.indexOf('卡梅隆')).assertEqual(-1);
      expect(joined(names.slice(0, 3))).assertEqual('艾德里安,阿诺德,贝拉');
      logStep('addEditDeleteInterleavingTest', 'order preserved after middle delete');
    });

    /**
     * @tc.name   repeatedEditTouchesFirstMatchOnly
     * @tc.desc   Two rows named 贝拉 exist; two edits rewrite only the first one each time.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddEditDeleteInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedEditTouchesFirstMatchOnly', 0, () => {
      const manager = ContactManager.getInstance();
      const rows = createSeedContacts();
      rows.push(contactOf('贝拉', '13900000001', 'bella2@example.com', '天津市和平区', '', CATEGORY_B));
      manager.setContacts(rows);
      expect(countOf(contactNames(manager.getContacts()), '贝拉')).assertEqual(2);
      manager.updateContact(contactOf('贝拉', '13900000011', 'bella.first@example.com', '天津市河西区', '', CATEGORY_B));
      const loaded = manager.getContacts();
      expect(loaded[2].phone).assertEqual('13900000011');
      expect(loaded[15].phone).assertEqual('13900000001');
      expect(loaded[15].email).assertEqual('bella2@example.com');
      manager.updateContact(contactOf('贝拉', '13900000012', 'bella.first2@example.com', '天津市南开区', '', CATEGORY_B));
      const twice = manager.getContacts();
      expect(twice[2].email).assertEqual('bella.first2@example.com');
      expect(twice[15].phone).assertEqual('13900000001');
      logStep('addEditDeleteInterleavingTest', 'only the first duplicate name is rewritten');
    });

    /**
     * @tc.name   addFourThenEditInReverse
     * @tc.desc   Four appended contacts edited in reverse order all keep their original index slots.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddEditDeleteInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addFourThenEditInReverse', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('纪一', '13610000001', 'jiyi@example.com', '安徽省合肥市蜀山区', '', CATEGORY_A));
      manager.addContact(contactOf('纪二', '13610000002', 'jier@example.com', '安徽省合肥市包河区', '', CATEGORY_B));
      manager.addContact(contactOf('纪三', '13610000003', 'jisan@example.com', '安徽省芜湖市镜湖区', '', CATEGORY_C));
      manager.addContact(contactOf('纪四', '13610000004', 'jisi@example.com', '安徽省蚌埠市蚌山区', '', CATEGORY_D));
      expect(manager.getContacts().length).assertEqual(19);
      manager.updateContact(contactOf('纪四', '13610000014', 'jisi2@example.com', '安徽省蚌埠市龙子湖区', '', CATEGORY_D));
      manager.updateContact(contactOf('纪三', '13610000013', 'jisan2@example.com', '安徽省芜湖市弋江区', '', CATEGORY_C));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(19);
      expect(loaded[18].name).assertEqual('纪四');
      expect(loaded[18].phone).assertEqual('13610000014');
      expect(loaded[17].name).assertEqual('纪三');
      expect(loaded[17].phone).assertEqual('13610000013');
      expect(loaded[16].name).assertEqual('纪二');
      logStep('addEditDeleteInterleavingTest', 'reverse edits keep append order');
    });

    /**
     * @tc.name   deleteAllSeedsThenRebuild
     * @tc.desc   Deleting every seed name one by one empties the list, and three adds rebuild it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddEditDeleteInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteAllSeedsThenRebuild', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      for (let index = 0; index < seed.length; index++) {
        manager.deleteContact(contactOf(seed[index].name, '', '', '', '', ''));
      }
      expect(manager.getContacts().length).assertEqual(0);
      expect(ContactMetrics.from(manager.getContacts()).total).assertEqual(0);
      manager.addContact(contactOf('沈川', '13700000001', 'shenchuan@example.com', '福建省福州市鼓楼区', '', CATEGORY_E));
      manager.addContact(contactOf('沈舟', '13700000002', 'shenzhou@example.com', '福建省福州市台江区', '', CATEGORY_E));
      manager.addContact(contactOf('沈溪', '13700000003', 'shenxi@example.com', '福建省福州市仓山区', '', CATEGORY_F));
      const rebuilt = manager.getContacts();
      expect(rebuilt.length).assertEqual(3);
      expect(joined(contactNames(rebuilt))).assertEqual('沈川,沈舟,沈溪');
      expect(SearchEngine.groupByCategory(rebuilt).length).assertEqual(2);
      expect(ContactMetrics.from(rebuilt).categories).assertEqual(2);
      logStep('addEditDeleteInterleavingTest', 'list emptied and rebuilt');
    });

    /**
     * @tc.name   phoneRotationKeepsRowCount
     * @tc.desc   Rotating phone numbers through three edits never changes the row count or the name order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddEditDeleteInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('phoneRotationKeepsRowCount', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const firstNames = contactNames(manager.getContacts());
      manager.updateContact(contactOf('丹尼尔', '17700000031', 'daniel.a@example.com', '陕西省西安市雁塔区', '', CATEGORY_D));
      manager.updateContact(contactOf('丹尼尔', '17700000032', 'daniel.b@example.com', '陕西省西安市碑林区', '', CATEGORY_D));
      manager.updateContact(contactOf('丹尼尔', '17700000033', 'daniel.c@example.com', '陕西省西安市莲湖区', '', CATEGORY_D));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(sameStringArray(contactNames(loaded), firstNames)).assertTrue();
      expect(loaded[8].phone).assertEqual('17700000033');
      expect(loaded[8].email).assertEqual('daniel.c@example.com');
      expect(countOf(contactNames(loaded), '丹尼尔')).assertEqual(1);
      logStep('addEditDeleteInterleavingTest', 'phone rotation is count neutral');
    });

    /**
     * @tc.name   addSameNameTwiceKeepsBothRows
     * @tc.desc   The manager does not deduplicate on add, so two adds of 林岸 produce two rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddEditDeleteInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addSameNameTwiceKeepsBothRows', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', CATEGORY_C));
      manager.addContact(contactOf('林岸', '13800138002', 'lin3@example.com', '上海市长宁区', '', CATEGORY_C));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(17);
      expect(countOf(contactNames(loaded), '林岸')).assertEqual(2);
      expect(loaded[15].phone).assertEqual('13800138000');
      expect(loaded[16].phone).assertEqual('13800138002');
      expect(SearchEngine.countCategory(loaded, CATEGORY_C)).assertEqual(5);
      logStep('addEditDeleteInterleavingTest', 'append keeps duplicate names');
    });

    /**
     * @tc.name   deleteDuplicateNameRemovesEveryCopy
     * @tc.desc   One delete after two same-name adds removes both rows, then a single add restores one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddEditDeleteInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteDuplicateNameRemovesEveryCopy', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', CATEGORY_C));
      manager.addContact(contactOf('林岸', '13800138002', 'lin3@example.com', '上海市长宁区', '', CATEGORY_C));
      manager.deleteContact(contactOf('林岸', '', '', '', '', ''));
      expect(manager.getContacts().length).assertEqual(15);
      expect(countOf(contactNames(manager.getContacts()), '林岸')).assertEqual(0);
      manager.addContact(contactOf('林岸', '13800138004', 'lin5@example.com', '上海市普陀区', '', CATEGORY_C));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(16);
      expect(countOf(contactNames(loaded), '林岸')).assertEqual(1);
      expect(loaded[15].phone).assertEqual('13800138004');
      logStep('addEditDeleteInterleavingTest', 'delete collapses every duplicate');
    });

    /**
     * @tc.name   managerStoreParityAfterInterleaving
     * @tc.desc   The same add, edit and delete sequence applied to StoreDouble matches the manager counts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddEditDeleteInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerStoreParityAfterInterleaving', 0, () => {
      const manager = ContactManager.getInstance();
      const store = new StoreDouble();
      store.init(true);
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const added = contactOf('闻笛', '13700000011', 'wendi@example.com', '广东省广州市越秀区', '', CATEGORY_E);
      manager.addContact(added);
      store.insert(true, added, 'ON_CONFLICT_REPLACE');
      const edited = contactOf('闻笛', '13700000012', 'wendi2@example.com', '广东省广州市天河区', '', CATEGORY_E);
      manager.updateContact(edited);
      store.updateContact(edited);
      manager.deleteContact(contactOf('贝拉', '', '', '', '', ''));
      const removed = store.deleteByName('贝拉');
      expect(manager.getContacts().length).assertEqual(store.rowCount());
      expect(removed).assertEqual(1);
      expect(store.rowCount()).assertEqual(15);
      expect(store.names()[14]).assertEqual('闻笛');
      expect(store.rows[14].email).assertEqual('wendi2@example.com');
      logStep('addEditDeleteInterleavingTest', 'manager and store stay in step');
    });

    /**
     * @tc.name   storeUpdateRewritesEveryDuplicate
     * @tc.desc   Unlike the manager, the SQL update band touches all duplicate names; the store mirrors that.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddEditDeleteInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeUpdateRewritesEveryDuplicate', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const affected = store.updateContact(contactOf('贝拉', '13911112222', 'bella.updated@example.com',
        '天津市红桥区', '', CATEGORY_B));
      expect(affected).assertEqual(1);
      const dup = contactOf('贝拉', '13933334444', 'bella.dup@example.com', '天津市河北区', '', CATEGORY_B);
      store.insert(true, dup, 'ON_CONFLICT_REPLACE');
      const affectedAgain = store.updateContact(contactOf('贝拉', '13955556666', 'bella.all@example.com',
        '天津市河东区', '', CATEGORY_B));
      expect(affectedAgain).assertEqual(2);
      expect(countOf(store.names(), '贝拉')).assertEqual(2);
      expect(store.rows[2].email).assertEqual('bella.all@example.com');
      expect(store.rows[15].email).assertEqual('bella.all@example.com');
      expect(store.updateCalls).assertEqual(2);
      logStep('addEditDeleteInterleavingTest', 'store update fans out over duplicates');
    });

    /**
     * @tc.name   editMiddleRowDoesNotReorder
     * @tc.desc   Rewriting 卡特琳娜 in place leaves all fifteen names in the seed order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddEditDeleteInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editMiddleRowDoesNotReorder', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      manager.updateContact(contactOf('卡特琳娜', '11100001111', 'katrina.new@example.com',
        '吉林省吉林市船营区', '', CATEGORY_C));
      const loaded = manager.getContacts();
      expect(sameStringArray(contactNames(loaded), contactNames(seed))).assertTrue();
      expect(loaded[7].name).assertEqual('卡特琳娜');
      expect(loaded[7].phone).assertEqual('11100001111');
      expect(loaded[7].category).assertEqual(CATEGORY_C);
      expect(loaded[6].name).assertEqual('康纳');
      expect(loaded[8].name).assertEqual('丹尼尔');
      logStep('addEditDeleteInterleavingTest', 'in-place edit keeps neighbours');
    });

    /**
     * @tc.name   deleteUnknownThenAddKeepsSeedOrder
     * @tc.desc   A failed delete followed by an append leaves the fifteen seed rows untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddEditDeleteInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteUnknownThenAddKeepsSeedOrder', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      manager.deleteContact(contactOf('闻笛', '', '', '', '', ''));
      manager.addContact(contactOf('闻笛', '13700000021', 'wendi.seed@example.com', '广东省深圳市南山区', '', CATEGORY_E));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(16);
      expect(sameStringArray(contactNames(loaded).slice(0, 15), contactNames(seed))).assertTrue();
      expect(loaded[15].name).assertEqual('闻笛');
      expect(ContactMetrics.from(loaded).duplicateNames).assertEqual(0);
      logStep('addEditDeleteInterleavingTest', 'unknown delete leaves the prefix intact');
    });

    /**
     * @tc.name   metricsAfterInterleavedSequence
     * @tc.desc   After two adds, one delete and one edit the aggregate metrics report sixteen rows and six categories.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddEditDeleteInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsAfterInterleavedSequence', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('闻笛', '13700000031', 'wendi.a@example.com', '广东省深圳市福田区', '', CATEGORY_E));
      manager.addContact(contactOf('闻舟', '13700000032', 'wenzhou@example.com', '广东省深圳市罗湖区', '', CATEGORY_E));
      manager.deleteContact(contactOf('本', '', '', '', '', ''));
      manager.updateContact(contactOf('闻舟', '13700000033', 'wenzhou2@example.com', '广东省深圳市盐田区', '', CATEGORY_F));
      const loaded = manager.getContacts();
      const metrics = ContactMetrics.from(loaded);
      expect(loaded.length).assertEqual(16);
      expect(metrics.total).assertEqual(16);
      expect(metrics.categories).assertEqual(6);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.totalPhoneDigits).assertEqual(176);
      logStep('addEditDeleteInterleavingTest', 'aggregate metrics after mixed sequence');
    });

    /**
     * @tc.name   cloneIsolatesEditedContact
     * @tc.desc   Editing a clone of a seed row leaves the manager's stored instance untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddEditDeleteInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('cloneIsolatesEditedContact', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const draft = cloneContact(manager.getContacts()[0]);
      draft.phone = '13999999999';
      draft.email = 'draft@example.com';
      const stored = manager.getContacts()[0];
      expect(stored.phone).assertEqual('13333333333');
      expect(stored.email).assertEqual('aidelian@example.com');
      expect(sameContact(stored, draft)).assertFalse();
      expect(manager.getContacts().length).assertEqual(15);
      logStep('addEditDeleteInterleavingTest', 'clone edits stay local');
    });

    /**
     * @tc.name   addedRowCanBeDeletedBySameName
     * @tc.desc   A row appended in this case is removable by name, after which the seed prefix is intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddEditDeleteInterleaving scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('addedRowCanBeDeletedBySameName', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      manager.addContact(contactOf('洛川', '13620000001', 'luochuan@example.com', '河南省郑州市金水区', '', CATEGORY_D));
      expect(manager.getContacts().length).assertEqual(16);
      manager.deleteContact(contactOf('洛川', '', '', '', '', ''));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(sameStringArray(contactNames(loaded), contactNames(seed))).assertTrue();
      expect(countOf(contactNames(loaded), '洛川')).assertEqual(0);
      expect(loaded[14].name).assertEqual('法里');
      logStep('addEditDeleteInterleavingTest', 'appended row deleted by name');
    });
  });
}
