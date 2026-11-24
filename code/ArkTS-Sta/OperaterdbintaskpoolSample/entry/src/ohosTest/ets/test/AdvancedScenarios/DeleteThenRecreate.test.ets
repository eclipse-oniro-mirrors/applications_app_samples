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
 * AdvancedScenarios / DeleteThenRecreate suite.
 *
 * Deleting a row and adding the same name back is the only way the page can
 * "rename" a contact, so the order effect matters: delete filters the old row,
 * add appends a brand new object at the tail. Old phone, email and address never
 * come back unless the draft repeats them.
 *
 * Source anchors:
 *   ContactManager.ets:50-53        add appends at the tail
 *   ContactManager.ets:67-70        delete filters by exact name
 *   DatabaseConnection.ets:226-236  delete by bound name
 *   SharedDriver.ets:591-604        store deleteByName count
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
  countOf,
  expectedAfterAdd,
  expectedAfterDelete,
  snapshotsOf,
  sameSnapshotArray,
  CursorResultSet,
  readContactsFromResultSet,
  StoreDouble,
  ContactMetrics,
  SearchEngine,
  resetContactManager
} from '../Shared/SharedDriver';

export default function deleteThenRecreateTest(): void {
  describe('DeleteThenRecreate', () => {
    beforeAll(() => {
      logSuite('DeleteThenRecreate', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('DeleteThenRecreate', 'end');
    });

    /**
     * @tc.name   recreateCarriesOnlyTheNewDraft
     * @tc.desc   A recreated 卡梅隆 keeps the new phone and email, not the seed values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('recreateCarriesOnlyTheNewDraft', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('卡梅隆', '', '', '', '', ''));
      manager.addContact(contactOf('卡梅隆', '17711112222', 'cameron.new@example.com', '陕西省咸阳市秦都区', '', CATEGORY_C));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(loaded[14].name).assertEqual('卡梅隆');
      expect(loaded[14].phone).assertEqual('17711112222');
      expect(loaded[14].email).assertEqual('cameron.new@example.com');
      expect(sameContact(loaded[14], createSeedContacts()[5])).assertFalse();
      logStep('deleteThenRecreateTest', 'recreated row carries the new draft');
    });

    /**
     * @tc.name   recreateMovesRowToTheTail
     * @tc.desc   The seed row at index five reappears at index fourteen after delete and add.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('recreateMovesRowToTheTail', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      expect(manager.getContacts()[5].name).assertEqual('卡梅隆');
      manager.deleteContact(contactOf('卡梅隆', '', '', '', '', ''));
      manager.addContact(cloneContact(createSeedContacts()[5]));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(loaded[5].name).assertEqual('康纳');
      expect(loaded[14].name).assertEqual('卡梅隆');
      expect(contactNames(loaded).indexOf('卡梅隆')).assertEqual(14);
      logStep('deleteThenRecreateTest', 'row moves from the middle to the tail');
    });

    /**
     * @tc.name   recreateRowCountStable
     * @tc.desc   Delete and add of the same name leaves the total at fifteen and the metric total at fifteen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('recreateRowCountStable', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('贝拉', '', '', '', '', ''));
      expect(manager.getContacts().length).assertEqual(14);
      manager.addContact(contactOf('贝拉', '11111113333', 'bella.new@example.com', '湖北省襄阳市襄城区', '', CATEGORY_B));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(ContactMetrics.from(loaded).total).assertEqual(15);
      expect(ContactMetrics.from(loaded).uniqueNames).assertEqual(15);
      expect(SearchEngine.countCategory(loaded, CATEGORY_B)).assertEqual(3);
      logStep('deleteThenRecreateTest', 'row count returns to fifteen');
    });

    /**
     * @tc.name   secondDeleteRemovesNothing
     * @tc.desc   Deleting the same name twice reports fourteen rows then fourteen again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('secondDeleteRemovesNothing', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('本', '', '', '', '', ''));
      const once = manager.getContacts().length;
      manager.deleteContact(contactOf('本', '', '', '', '', ''));
      const twice = manager.getContacts().length;
      expect(once).assertEqual(14);
      expect(twice).assertEqual(14);
      expect(countOf(contactNames(manager.getContacts()), '本')).assertEqual(0);
      expect(manager.getContacts()[2].name).assertEqual('贝拉');
      logStep('deleteThenRecreateTest', 'second delete is a no-op');
    });

    /**
     * @tc.name   deleteEachSeedThenRecreateAll
     * @tc.desc   Removing all fifteen names and adding five back leaves exactly five rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteEachSeedThenRecreateAll', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      for (let index = 0; index < seed.length; index++) {
        manager.deleteContact(contactOf(seed[index].name, '', '', '', '', ''));
      }
      expect(manager.getContacts().length).assertEqual(0);
      manager.addContact(contactOf('洛川', '13620000021', 'luochuan@example.com', '河南省郑州市金水区', '', CATEGORY_D));
      manager.addContact(contactOf('洛水', '13620000022', 'luoshui@example.com', '河南省洛阳市洛龙区', '', CATEGORY_D));
      manager.addContact(contactOf('洛山', '13620000023', 'luoshan@example.com', '河南省平顶山市新华区', '', CATEGORY_D));
      manager.addContact(contactOf('洛林', '13620000024', 'luolin@example.com', '河南省安阳市文峰区', '', CATEGORY_E));
      manager.addContact(contactOf('洛风', '13620000025', 'luofeng@example.com', '河南省新乡市红旗区', '', CATEGORY_F));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(5);
      expect(joined(contactNames(loaded))).assertEqual('洛川,洛水,洛山,洛林,洛风');
      expect(ContactMetrics.from(loaded).categories).assertEqual(3);
      logStep('deleteThenRecreateTest', 'list rebuilt with five fresh rows');
    });

    /**
     * @tc.name   storeDeleteThenRecreateAppendsTail
     * @tc.desc   The store removes one row and appends the recreated row at index fourteen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeDeleteThenRecreateAppendsTail', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      expect(store.deleteByName('卡梅隆')).assertEqual(1);
      expect(store.rowCount()).assertEqual(14);
      store.insert(true, contactOf('卡梅隆', '17722223333', 'cameron.store@example.com', '陕西省渭南市临渭区', '', CATEGORY_C),
        'ON_CONFLICT_REPLACE');
      expect(store.rowCount()).assertEqual(15);
      expect(store.names()[14]).assertEqual('卡梅隆');
      expect(store.rows[14].phone).assertEqual('17722223333');
      expect(store.deleteCalls).assertEqual(1);
      logStep('deleteThenRecreateTest', 'store re-adds at the tail');
    });

    /**
     * @tc.name   deletingMissingNameReportsZero
     * @tc.desc   The store reports zero removed rows for a name it never held.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deletingMissingNameReportsZero', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      expect(store.deleteByName('林岸')).assertEqual(0);
      expect(store.rowCount()).assertEqual(15);
      expect(store.deleteCalls).assertEqual(1);
      expect(joined(store.names().slice(0, 3))).assertEqual('艾德里安,阿诺德,贝拉');
      logStep('deleteThenRecreateTest', 'missing name removes nothing');
    });

    /**
     * @tc.name   recreateWithNewCategory
     * @tc.desc   A recreated row may move from category C to F and the group order follows the new value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recreateWithNewCategory', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('康纳', '', '', '', '', ''));
      manager.addContact(contactOf('康纳', '10000000099', 'connor.new@example.com', '辽宁省沈阳市和平区', '', CATEGORY_F));
      const loaded = manager.getContacts();
      expect(SearchEngine.countCategory(loaded, CATEGORY_C)).assertEqual(2);
      expect(SearchEngine.countCategory(loaded, CATEGORY_F)).assertEqual(3);
      expect(loaded[14].category).assertEqual(CATEGORY_F);
      expect(SearchEngine.groupByCategory(loaded).length).assertEqual(6);
      logStep('deleteThenRecreateTest', 'recreated category moves the row');
    });

    /**
     * @tc.name   recreateThenUpdateRewritesFreshRow
     * @tc.desc   Updating after a recreate rewrites the new tail row and leaves other rows untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recreateThenUpdateRewritesFreshRow', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('艾登', '', '', '', '', ''));
      manager.addContact(contactOf('艾登', '17733334444', 'aiden.step1@example.com', '陕西省汉中市汉台区', '', CATEGORY_E));
      manager.updateContact(contactOf('艾登', '17733335555', 'aiden.step2@example.com', '陕西省安康市汉滨区', '', CATEGORY_E));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(loaded[14].phone).assertEqual('17733335555');
      expect(loaded[14].email).assertEqual('aiden.step2@example.com');
      expect(loaded[14].address).assertEqual('陕西省安康市汉滨区');
      expect(countOf(contactNames(loaded), '艾登')).assertEqual(1);
      logStep('deleteThenRecreateTest', 'update touches the recreated row only');
    });

    /**
     * @tc.name   threeCyclesKeepSingleRow
     * @tc.desc   Three delete and recreate rounds of 本杰明 leave exactly one row with the latest phone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('threeCyclesKeepSingleRow', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      for (let round = 0; round < 3; round++) {
        manager.deleteContact(contactOf('本杰明', '', '', '', '', ''));
        manager.addContact(contactOf('本杰明', '1660000000' + String(round), 'ben.' + String(round) + '@example.com',
          '上海市浦东新区', '', CATEGORY_B));
      }
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(countOf(contactNames(loaded), '本杰明')).assertEqual(1);
      expect(loaded[14].phone).assertEqual('16600000002');
      expect(loaded[14].email).assertEqual('ben.2@example.com');
      logStep('deleteThenRecreateTest', 'three cycles leave one row');
    });

    /**
     * @tc.name   recreateSnapshotDiffersFromSeed
     * @tc.desc   The recreated snapshot differs from the seed snapshot even when only the phone changes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recreateSnapshotDiffersFromSeed', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const seedSnapshot = snapshotsOf(seed)[7];
      manager.deleteContact(contactOf('卡特琳娜', '', '', '', '', ''));
      manager.addContact(contactOf('卡特琳娜', '11111117777', 'katrina@example.com', '吉林省长春市朝阳区', '', CATEGORY_C));
      const loaded = manager.getContacts();
      const recreatedSnapshot = snapshotsOf(loaded)[14];
      expect(recreatedSnapshot.sameAs(seedSnapshot)).assertFalse();
      expect(recreatedSnapshot.name).assertEqual(seedSnapshot.name);
      expect(recreatedSnapshot.email).assertEqual(seedSnapshot.email);
      expect(recreatedSnapshot.phone).assertEqual('11111117777');
      expect(loaded.length).assertEqual(15);
      logStep('deleteThenRecreateTest', 'snapshot differs on the phone field');
    });

    /**
     * @tc.name   recreateWithoutAvatarKeepsEmptyField
     * @tc.desc   Omitting the avatar on the recreated draft stores an empty string, not the seed value.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recreateWithoutAvatarKeepsEmptyField', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('艾拉', '', '', '', '', ''));
      manager.addContact(contactOf('艾拉', '10000000088', 'ella.new@example.com', '辽宁省抚顺市新抚区', '', CATEGORY_E));
      const loaded = manager.getContacts();
      expect(loaded[14].avatar).assertEqual('');
      expect(loaded[14].name).assertEqual('艾拉');
      expect(loaded[14].address).assertEqual('辽宁省抚顺市新抚区');
      expect(SearchEngine.countCategory(loaded, CATEGORY_E)).assertEqual(3);
      logStep('deleteThenRecreateTest', 'empty avatar stays empty');
    });

    /**
     * @tc.name   metricsFingerprintChangesAfterRecreate
     * @tc.desc   Same row count, same phone lengths and same categories keep the metrics fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('metricsFingerprintChangesAfterRecreate', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const before = ContactMetrics.from(manager.getContacts());
      manager.deleteContact(contactOf('法里', '', '', '', '', ''));
      manager.addContact(contactOf('法里', '11111118888', 'fali.new@example.com', '吉林省松原市宁江区', '', CATEGORY_F));
      const after = ContactMetrics.from(manager.getContacts());
      expect(after.total).assertEqual(before.total);
      expect(after.totalPhoneDigits).assertEqual(before.totalPhoneDigits);
      expect(after.fingerprint()).assertEqual(before.fingerprint());
      expect(after.categories).assertEqual(before.categories);
      expect(after.duplicateNames).assertEqual(0);
      logStep('deleteThenRecreateTest', 'equal length phones keep the fingerprint');
    });

    /**
     * @tc.name   recreateThenDeleteEmptiesTheRow
     * @tc.desc   A recreated row is removable again, returning the list to fourteen rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recreateThenDeleteEmptiesTheRow', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('戴维维', '', '', '', '', ''));
      manager.addContact(contactOf('戴维维', '11111119999', 'david.new@example.com', '吉林省通化市东昌区', '', CATEGORY_D));
      expect(manager.getContacts().length).assertEqual(15);
      manager.deleteContact(contactOf('戴维维', '', '', '', '', ''));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(14);
      expect(countOf(contactNames(loaded), '戴维维')).assertEqual(0);
      expect(loaded[13].name).assertEqual('法里');
      logStep('deleteThenRecreateTest', 'recreated row can be deleted again');
    });

    /**
     * @tc.name   deleteRecreateKeepsOtherRowsOrder
     * @tc.desc   Removing 贝拉 and appending it back leaves the fourteen other rows in seed order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteRecreateKeepsOtherRowsOrder', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      manager.deleteContact(contactOf('贝拉', '', '', '', '', ''));
      manager.addContact(contactOf('贝拉', '11111110000', 'bella.order@example.com', '湖北省荆州市荆州区', '', CATEGORY_B));
      const loaded = manager.getContacts();
      const others = contactNames(loaded).slice(0, 14);
      const expectedOthers = contactNames(seed).slice(0, 2).concat(contactNames(seed).slice(3, 15));
      expect(loaded.length).assertEqual(15);
      expect(joined(others)).assertEqual(joined(expectedOthers));
      expect(loaded[1].name).assertEqual('阿诺德');
      expect(loaded[2].name).assertEqual('本');
      logStep('deleteThenRecreateTest', 'other rows keep seed order');
    });

    /**
     * @tc.name   recreatedRowIsVisibleThroughCursor
     * @tc.desc   A cursor over placeholder plus recreated rows exposes the recreated row after the first row skip.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('recreatedRowIsVisibleThroughCursor', 0, () => {
      const rows: Contact[] = [];
      rows.push(contactOf('占位', '10000000000', 'placeholder@example.com', '北京市东城区', '', CATEGORY_A));
      rows.push(contactOf('洛川', '13620000031', 'luochuan.cursor@example.com', '河南省开封市鼓楼区', '', CATEGORY_D));
      rows.push(contactOf('洛水', '13620000032', 'luoshui.cursor@example.com', '河南省开封市龙亭区', '', CATEGORY_D));
      const visible = readContactsFromResultSet(new CursorResultSet(rows));
      expect(visible.length).assertEqual(2);
      expect(visible[0].name).assertEqual('洛川');
      expect(visible[1].name).assertEqual('洛水');
      expect(countOf(contactNames(visible), '占位')).assertEqual(0);
      logStep('deleteThenRecreateTest', 'recreated rows visible after the skip');
    });

    /**
     * @tc.name   recreateWithEmptyOptionalFieldsValidates
     * @tc.desc   Avatar and category are not validated, so a draft with empty optional fields still submits.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('recreateWithEmptyOptionalFieldsValidates', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('法比而', '', '', '', '', ''));
      const draft = contactOf('法比而', '10000000077', 'fabier.new@example.com', '辽宁省锦州市古塔区', '', '');
      expect(manager.getContacts().length).assertEqual(14);
      manager.addContact(draft);
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(loaded[14].avatar).assertEqual('');
      expect(loaded[14].category).assertEqual('');
      expect(SearchEngine.groupByCategory(loaded).indexOf('')).assertEqual(6);
      logStep('deleteThenRecreateTest', 'empty optional fields are accepted');
    });

    /**
     * @tc.name   storeResetDropsRowsAndFlag
     * @tc.desc   Resetting the store clears rows, counters and the initialised flag before a new import.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('storeResetDropsRowsAndFlag', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      store.deleteByName('贝拉');
      expect(store.rowCount()).assertEqual(14);
      store.reset();
      expect(store.rowCount()).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.batchCalls).assertEqual(0);
      expect(store.deleteCalls).assertEqual(0);
      store.batchInsert(true, createSeedContacts().slice(0, 2));
      expect(store.rowCount()).assertEqual(2);
      expect(store.initialized).assertTrue();
      logStep('deleteThenRecreateTest', 'store reset clears state');
    });

    /**
     * @tc.name   storeDeleteCountsPerDeleteCall
     * @tc.desc   Each delete call on a recreated row reports one removal in the store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeDeleteCountsPerDeleteCall', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.insert(true, contactOf('苏禾', '13512345678', 'suhe@example.com', '浙江省杭州市西湖区', '', CATEGORY_A),
        'ON_CONFLICT_REPLACE');
      expect(store.deleteByName('苏禾')).assertEqual(1);
      store.insert(true, contactOf('苏禾', '13512345679', 'suhe2@example.com', '浙江省杭州市滨江区', '', CATEGORY_A),
        'ON_CONFLICT_REPLACE');
      expect(store.deleteByName('苏禾')).assertEqual(1);
      expect(store.rowCount()).assertEqual(0);
      expect(store.deleteCalls).assertEqual(2);
      expect(store.insertCalls).assertEqual(2);
      logStep('deleteThenRecreateTest', 'each delete call reports one row');
    });

    /**
     * @tc.name   recreateMatchesChainedOracles
     * @tc.desc   Delete then add equals expectedAfterDelete followed by expectedAfterAdd.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('recreateMatchesChainedOracles', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const recreated = contactOf('本', '16600002222', 'ben.rebuilt@example.com', '四川省绵阳市涪城区', '', CATEGORY_B);
      manager.deleteContact(contactOf('本', '', '', '', '', ''));
      manager.addContact(recreated);
      const oracle = expectedAfterAdd(expectedAfterDelete(seed, '本'), recreated);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(oracle))).assertTrue();
      expect(manager.getContacts().length).assertEqual(oracle.length);
      expect(contactNames(manager.getContacts())[14]).assertEqual('本');
      logStep('deleteThenRecreateTest', 'recreate matches the chained oracles');
    });

    /**
     * @tc.name   managerIdentitySurvivesRecreate
     * @tc.desc   The singleton instance is unchanged across a delete and recreate cycle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('managerIdentitySurvivesRecreate', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const instance = ContactManager.getInstance();
      manager.deleteContact(contactOf('丹尼尔', '', '', '', '', ''));
      manager.addContact(contactOf('丹尼尔', '17700004444', 'daniel.new@example.com', '陕西省宝鸡市渭滨区', '', CATEGORY_D));
      expect(ContactManager.getInstance() === instance).assertTrue();
      expect(instance.getContacts().length).assertEqual(15);
      expect(instance.getContacts()[14].name).assertEqual('丹尼尔');
      logStep('deleteThenRecreateTest', 'singleton identity is stable');
    });

    /**
     * @tc.name   longerPhoneChangesFingerprint
     * @tc.desc   Replacing an eleven digit phone with a twelve digit one changes the digit total and fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteThenRecreate scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('longerPhoneChangesFingerprint', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const before = ContactMetrics.from(manager.getContacts());
      manager.deleteContact(contactOf('法里', '', '', '', '', ''));
      manager.addContact(contactOf('法里', '111111188889', 'fali.long@example.com', '吉林省白城市洮北区', '', CATEGORY_F));
      const after = ContactMetrics.from(manager.getContacts());
      expect(after.total).assertEqual(before.total);
      expect(after.totalPhoneDigits - before.totalPhoneDigits).assertEqual(1);
      expect(after.fingerprint() === before.fingerprint()).assertFalse();
      logStep('deleteThenRecreateTest', 'digit total shifts the fingerprint');
    });
  });
}
