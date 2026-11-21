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
 * Accessibility / ListSemanticOrder suite.
 *
 * A screen reader announces the list in index order, so the order the manager
 * and the cursor expose is itself the accessibility contract. The suite pins the
 * first and last row, the relative order after add, edit and delete, and the
 * alphabetical grouping that the indexer announces.
 *
 * Source anchors:
 *   OperateRDBInTaskPool.ets:74      seed order used by the list
 *   DatabaseConnection.ets:277-309  visible order after the cursor walk
 *   SharedDriver.ets:122-128        contactNames preserves index order
 *   SharedDriver.ets:812-820        groupByCategory first appearance order
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
  createSeedContacts,
  contactOf,
  cloneContact,
  contactNames,
  joined,
  countOf,
  uniqueStrings,
  snapshotsOf,
  sameSnapshotArray,
  CursorResultSet,
  readContactsFromResultSet,
  SearchEngine,
  ContactMetrics,
  StoreDouble,
  resetContactManager
} from '../Shared/SharedDriver';

export default function listSemanticOrderTest(): void {
  describe('ListSemanticOrder', () => {
    beforeAll(() => {
      logSuite('ListSemanticOrder', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('ListSemanticOrder', 'end');
    });

    /**
     * @tc.name   seedOrderIsStable
     * @tc.desc   Reading the seed names twice returns the same fifteen name sequence.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('seedOrderIsStable', 0, () => {
      const seed = createSeedContacts();
      const first = joined(contactNames(seed));
      const second = joined(contactNames(cloneContactArray(seed)));
      expect(first).assertEqual(second);
      expect(contactNames(seed).length).assertEqual(15);
      expect(first.split(',').length).assertEqual(15);
      logStep('listSemanticOrderTest', 'seed order is stable');
    });

    /**
     * @tc.name   firstRowIsFirstSeedContact
     * @tc.desc   The first announced row is 艾德里安 with its full detail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('firstRowIsFirstSeedContact', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      const rows = manager.getContacts();
      expect(rows[0].name).assertEqual('艾德里安');
      expect(rows[0].phone).assertEqual('13333333333');
      expect(rows[0].category).assertEqual(CATEGORY_A);
      expect(contactNames(rows)[0]).assertEqual('艾德里安');
      logStep('listSemanticOrderTest', 'first row is the first seed contact');
    });

    /**
     * @tc.name   lastRowIsLastSeedContact
     * @tc.desc   The last announced row is 法里 at index fourteen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('lastRowIsLastSeedContact', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      const rows = manager.getContacts();
      expect(rows[14].name).assertEqual('法里');
      expect(rows[rows.length - 1].name).assertEqual('法里');
      expect(contactNames(rows).indexOf('法里')).assertEqual(14);
      expect(rows[14].category).assertEqual('F');
      logStep('listSemanticOrderTest', 'last row is the last seed contact');
    });

    /**
     * @tc.name   everySeedNameHasFixedIndex
     * @tc.desc   Five spot checked seed names sit at their documented indices.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('everySeedNameHasFixedIndex', 0, () => {
      const names = contactNames(createSeedContacts());
      expect(names.indexOf('艾德里安')).assertEqual(0);
      expect(names.indexOf('贝拉')).assertEqual(2);
      expect(names.indexOf('卡梅隆')).assertEqual(5);
      expect(names.indexOf('丹尼尔')).assertEqual(8);
      expect(names.indexOf('艾拉')).assertEqual(11);
      expect(names.indexOf('法比而')).assertEqual(13);
      logStep('listSemanticOrderTest', 'seed names keep fixed indices');
    });

    /**
     * @tc.name   addAnnouncesAfterTheLastRow
     * @tc.desc   A new contact is announced after 法里, never in the middle.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addAnnouncesAfterTheLastRow', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      manager.addContact(contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', CATEGORY_A));
      const names = contactNames(manager.getContacts());
      expect(names.length).assertEqual(16);
      expect(names[14]).assertEqual('法里');
      expect(names[15]).assertEqual('林岸');
      expect(names.indexOf('林岸')).assertEqual(15);
      logStep('listSemanticOrderTest', 'add announces after the last row');
    });

    /**
     * @tc.name   deletePreservesRelativeOrder
     * @tc.desc   Removing 卡梅隆 leaves the other fourteen names in their original relative order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deletePreservesRelativeOrder', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      const before = contactNames(manager.getContacts());
      manager.deleteContact(contactOf('卡梅隆', '', '', '', '', ''));
      const after = contactNames(manager.getContacts());
      expect(after.length).assertEqual(14);
      expect(joined(after)).assertEqual(joined(before.slice(0, 5).concat(before.slice(6))));
      expect(after[5]).assertEqual('康纳');
      expect(after.indexOf('卡梅隆')).assertEqual(-1);
      logStep('listSemanticOrderTest', 'delete preserves relative order');
    });

    /**
     * @tc.name   updateKeepsAnnouncedPosition
     * @tc.desc   Rewriting 贝拉 does not move it from index two.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateKeepsAnnouncedPosition', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      const before = contactNames(manager.getContacts());
      manager.updateContact(contactOf('贝拉', '11111110044', 'bella.new@example.com', '湖北省宜昌市伍家岗区', '', CATEGORY_B));
      const after = contactNames(manager.getContacts());
      expect(after[2]).assertEqual('贝拉');
      expect(manager.getContacts()[2].phone).assertEqual('11111110044');
      expect(SearchEngine.countCategory(manager.getContacts(), CATEGORY_B)).assertEqual(3);
      expect(joined(after)).assertEqual(joined(before));
      expect(after.length).assertEqual(15);
      logStep('listSemanticOrderTest', 'update keeps the announced position');
    });

    /**
     * @tc.name   groupsAreContiguousInList
     * @tc.desc   Every category appears in one contiguous run so the indexer has one header per letter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('groupsAreContiguousInList', 0, () => {
      const seed = createSeedContacts();
      let runs = 0;
      for (let index = 0; index < seed.length; index++) {
        if (index === 0 || seed[index].category !== seed[index - 1].category) {
          runs = runs + 1;
        }
      }
      expect(runs).assertEqual(6);
      expect(SearchEngine.groupByCategory(seed).length).assertEqual(runs);
      expect(seed[0].category).assertEqual(CATEGORY_A);
      logStep('listSemanticOrderTest', 'groups are contiguous in the list');
    });

    /**
     * @tc.name   groupOrderIsAlphabetical
     * @tc.desc   The six headers are announced in alphabetical order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('groupOrderIsAlphabetical', 0, () => {
      const groups = SearchEngine.groupByCategory(createSeedContacts());
      expect(joined(groups)).assertEqual('A,B,C,D,E,F');
      expect(joined(groups)).assertEqual(joined(CATEGORIES));
      expect(groups[0]).assertEqual(CATEGORY_A);
      expect(groups[5]).assertEqual('F');
      logStep('listSemanticOrderTest', 'group order is alphabetical');
    });

    /**
     * @tc.name   indexLettersMatchGroups
     * @tc.desc   The letters used by the alphabet indexer equal the group headers.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('indexLettersMatchGroups', 0, () => {
      const groups = SearchEngine.groupByCategory(createSeedContacts());
      expect(uniqueStrings(groups).length).assertEqual(6);
      expect(groups.indexOf(CATEGORY_C)).assertEqual(2);
      expect(groups.indexOf('D')).assertEqual(3);
      expect(CATEGORIES.indexOf('E')).assertEqual(4);
      expect(joined(groups)).assertEqual(joined(CATEGORIES));
      logStep('listSemanticOrderTest', 'index letters match the groups');
    });

    /**
     * @tc.name   cursorAnnouncesFromSecondRow
     * @tc.desc   The cursor walk starts at 阿诺德 because the first row is skipped.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('cursorAnnouncesFromSecondRow', 0, () => {
      const seed = createSeedContacts();
      const visible = readContactsFromResultSet(new CursorResultSet(seed));
      expect(visible.length).assertEqual(14);
      expect(visible[0].name).assertEqual('阿诺德');
      expect(visible[13].name).assertEqual('法里');
      expect(countOf(contactNames(visible), '艾德里安')).assertEqual(0);
      logStep('listSemanticOrderTest', 'cursor starts at the second row');
    });

    /**
     * @tc.name   filteredGroupPreservesOrder
     * @tc.desc   Selecting category E keeps 艾登, 艾拉 and 艾里 in seed order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('filteredGroupPreservesOrder', 0, () => {
      const seed = createSeedContacts();
      const picked: string[] = [];
      for (let index = 0; index < seed.length; index++) {
        if (seed[index].category === 'E') {
          picked.push(seed[index].name);
        }
      }
      expect(picked.length).assertEqual(3);
      expect(joined(picked)).assertEqual('艾登,艾拉,艾里');
      expect(picked[1]).assertEqual('艾拉');
      logStep('listSemanticOrderTest', 'filtered group keeps order');
    });

    /**
     * @tc.name   searchKeepsListOrder
     * @tc.desc   A name search returns hits in list order rather than match order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('searchKeepsListOrder', 0, () => {
      const hits = SearchEngine.filterByName(createSeedContacts(), '本');
      expect(hits.length).assertEqual(2);
      expect(hits[0].name).assertEqual('本');
      expect(hits[1].name).assertEqual('本杰明');
      expect(joined(contactNames(hits))).assertEqual('本,本杰明');
      logStep('listSemanticOrderTest', 'search keeps list order');
    });

    /**
     * @tc.name   deleteThenReAddAnnouncesLast
     * @tc.desc   A recreated 本 is announced last even though it used to be fourth.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteThenReAddAnnouncesLast', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      manager.deleteContact(contactOf('本', '', '', '', '', ''));
      manager.addContact(contactOf('本', '16600001111', 'ben.last@example.com', '四川省德阳市旌阳区', '', CATEGORY_B));
      const names = contactNames(manager.getContacts());
      expect(names.length).assertEqual(15);
      expect(names[14]).assertEqual('本');
      expect(names[3]).assertEqual('本杰明');
      expect(names.indexOf('本')).assertEqual(14);
      logStep('listSemanticOrderTest', 'recreated row is announced last');
    });

    /**
     * @tc.name   duplicateRowsAreAdjacentAtTail
     * @tc.desc   Two appended 贝拉 rows are adjacent at the end of the list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateRowsAreAdjacentAtTail', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      manager.addContact(contactOf('贝拉', '11111110055', 'bella.tail1@example.com', '湖北省荆州市沙市区', '', CATEGORY_B));
      manager.addContact(contactOf('贝拉', '11111110056', 'bella.tail2@example.com', '湖北省荆州市荆州区', '', CATEGORY_B));
      const names = contactNames(manager.getContacts());
      expect(names.length).assertEqual(17);
      expect(names[15]).assertEqual('贝拉');
      expect(names[16]).assertEqual('贝拉');
      expect(names.indexOf('贝拉')).assertEqual(2);
      logStep('listSemanticOrderTest', 'duplicates are adjacent at the tail');
    });

    /**
     * @tc.name   categoryChangeDoesNotResort
     * @tc.desc   The list keeps insertion order when a category changes, so position is unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('categoryChangeDoesNotResort', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      manager.updateContact(contactOf('艾德里安', '13333333333', 'aidelian@example.com', '江苏省南京市鼓楼区', '', CATEGORY_C));
      const rows = manager.getContacts();
      expect(rows[0].name).assertEqual('艾德里安');
      expect(rows[0].category).assertEqual(CATEGORY_C);
      expect(SearchEngine.countCategory(rows, CATEGORY_A)).assertEqual(1);
      expect(SearchEngine.groupByCategory(rows)[0]).assertEqual(CATEGORY_C);
      logStep('listSemanticOrderTest', 'category change does not resort the list');
    });

    /**
     * @tc.name   snapshotOrderMatchesNameOrder
     * @tc.desc   The snapshot list is index aligned with the name list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotOrderMatchesNameOrder', 0, () => {
      const seed = createSeedContacts();
      const names = contactNames(seed);
      const snapshot = snapshotsOf(seed);
      expect(snapshot.length).assertEqual(names.length);
      expect(snapshot[0].name).assertEqual(names[0]);
      expect(snapshot[7].name).assertEqual(names[7]);
      expect(snapshot[14].name).assertEqual(names[14]);
      logStep('listSemanticOrderTest', 'snapshots are index aligned');
    });

    /**
     * @tc.name   managerAndStoreOrderAgree
     * @tc.desc   A batch into the store and a setContacts into the manager expose the same order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerAndStoreOrderAgree', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      expect(joined(contactNames(manager.getContacts()))).assertEqual(joined(store.names()));
      expect(store.names()[0]).assertEqual('艾德里安');
      expect(store.names()[14]).assertEqual('法里');
      logStep('listSemanticOrderTest', 'manager and store order agree');
    });

    /**
     * @tc.name   emptyListAnnouncesNothing
     * @tc.desc   An empty manager has no first row, no groups and zero metrics.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyListAnnouncesNothing', 0, () => {
      const manager = resetContactManager();
      expect(manager.getContacts().length).assertEqual(0);
      expect(contactNames(manager.getContacts()).length).assertEqual(0);
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(0);
      expect(ContactMetrics.from(manager.getContacts()).total).assertEqual(0);
      logStep('listSemanticOrderTest', 'empty list announces nothing');
    });

    /**
     * @tc.name   singleRowListSemantics
     * @tc.desc   A one row list announces the same name as first and last.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('singleRowListSemantics', 0, () => {
      const manager = resetContactManager();
      manager.addContact(contactOf('龙川', '13900001011', 'longchuan3@example.com', '云南省昆明市五华区', '', CATEGORY_A));
      const rows = manager.getContacts();
      expect(rows.length).assertEqual(1);
      expect(rows[0].name).assertEqual('龙川');
      expect(rows[rows.length - 1].name).assertEqual('龙川');
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(1);
      logStep('listSemanticOrderTest', 'single row is first and last');
    });

    /**
     * @tc.name   reverseWalkIsReverseOrder
     * @tc.desc   Walking the list backwards yields 法里 first and 艾德里安 last.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('reverseWalkIsReverseOrder', 0, () => {
      const names = contactNames(createSeedContacts());
      const reversed: string[] = [];
      for (let index = names.length - 1; index >= 0; index--) {
        reversed.push(names[index]);
      }
      expect(reversed.length).assertEqual(15);
      expect(reversed[0]).assertEqual('法里');
      expect(reversed[14]).assertEqual('艾德里安');
      expect(reversed[13]).assertEqual('阿诺德');
      logStep('listSemanticOrderTest', 'reverse walk is reverse order');
    });

    /**
     * @tc.name   batchOrderMatchesChunkOrder
     * @tc.desc   Two chunks appear in list order chunk A then chunk B.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('batchOrderMatchesChunkOrder', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const seed = createSeedContacts();
      store.batchInsert(true, seed.slice(0, 3));
      store.batchInsert(true, seed.slice(3, 6));
      expect(joined(store.names())).assertEqual('艾德里安,阿诺德,贝拉,本,本杰明,卡梅隆');
      expect(store.names()[2]).assertEqual('贝拉');
      expect(store.names()[3]).assertEqual('本');
      logStep('listSemanticOrderTest', 'batch order matches the chunk order');
    });

    /**
     * @tc.name   rowCountMatchesMetricsTotal
     * @tc.desc   The announced row count equals the metrics total for the same list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('rowCountMatchesMetricsTotal', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      const rows = manager.getContacts();
      expect(rows.length).assertEqual(ContactMetrics.from(rows).total);
      expect(ContactMetrics.from(rows).total).assertEqual(15);
      expect(ContactMetrics.from(rows).uniqueNames).assertEqual(rows.length);
      logStep('listSemanticOrderTest', 'row count matches the metrics total');
    });

    /**
     * @tc.name   seedNamesAreUnique
     * @tc.desc   No seed name repeats, so every announcement is a distinct label.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('seedNamesAreUnique', 0, () => {
      const names = contactNames(createSeedContacts());
      expect(uniqueStrings(names).length).assertEqual(15);
      expect(ContactMetrics.from(createSeedContacts()).duplicateNames).assertEqual(0);
      expect(countOf(names, '贝拉')).assertEqual(1);
      logStep('listSemanticOrderTest', 'seed names are unique');
    });

    /**
     * @tc.name   addThenDeleteRestoresOrder
     * @tc.desc   Appending and deleting the same name returns the exact seed order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addThenDeleteRestoresOrder', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      manager.addContact(contactOf('龙水', '13900001012', 'longshui3@example.com', '云南省昆明市西山区', '', CATEGORY_A));
      manager.deleteContact(contactOf('龙水', '', '', '', '', ''));
      const rows = manager.getContacts();
      expect(sameSnapshotArray(snapshotsOf(rows), snapshotsOf(createSeedContacts()))).assertTrue();
      expect(rows.length).assertEqual(15);
      expect(rows[14].name).assertEqual('法里');
      logStep('listSemanticOrderTest', 'add then delete restores the order');
    });

    /**
     * @tc.name   removingLastOfGroupDropsHeader
     * @tc.desc   Deleting both D rows removes the D header and keeps the five other headers in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('removingLastOfGroupDropsHeader', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      store.deleteByName('丹尼尔');
      store.deleteByName('戴维维');
      const groups = SearchEngine.groupByCategory(store.rows);
      expect(groups.length).assertEqual(5);
      expect(groups.indexOf('D')).assertEqual(-1);
      expect(store.rowCount()).assertEqual(13);
      expect(joined(groups)).assertEqual('A,B,C,E,F');
      expect(SearchEngine.countCategory(store.rows, 'D')).assertEqual(0);
      logStep('listSemanticOrderTest', 'empty group header disappears');
    });

    /**
     * @tc.name   announcedCountAfterTwoDeletes
     * @tc.desc   Two deletes reduce the announced count by two and keep the remainder ordered.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ListSemanticOrder scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('announcedCountAfterTwoDeletes', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      manager.deleteContact(contactOf('阿诺德', '', '', '', '', ''));
      manager.deleteContact(contactOf('艾里', '', '', '', '', ''));
      const rows = manager.getContacts();
      expect(rows.length).assertEqual(13);
      expect(rows[0].name).assertEqual('艾德里安');
      expect(rows[1].name).assertEqual('贝拉');
      expect(rows[12].name).assertEqual('法里');
      logStep('listSemanticOrderTest', 'announced count after two deletes');
    });
  });
}

function cloneContactArray(source: Contact[]): Contact[] {
  const result: Contact[] = [];
  for (let index = 0; index < source.length; index++) {
    result.push(cloneContact(source[index]));
  }
  return result;
}
