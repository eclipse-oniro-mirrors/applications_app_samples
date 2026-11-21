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
 * Full directory journey. Anchors:
 *   OperateRDBInTaskPool.ets:74-139  seed, insert, update, delete branches and list refresh
 *   AddressBookList.ets:56-91        list projection, detail tap and add button
 *   AddressBookDetail.ets:243-265    edit and delete buttons
 *   DatabaseConnection.ets:139-309   batch, insert, update, delete and cursor read
 *   ContactManager.ets:41-70         copy on read plus append, replace and filter
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  ACTION_ADD,
  ACTION_EDIT,
  ACTION_DELETE,
  ROUTE_EDIT,
  ROUTE_LIST,
  ContactValidation,
  ContactMapper,
  ContactMetrics,
  StoreDouble,
  TaskPoolQueue,
  OperationCatalog,
  CursorResultSet,
  readContactsFromResultSet,
  expectedAfterAdd,
  expectedAfterDelete,
  expectedAfterUpdate,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  sameStringArray,
  countOf,
  uniqueStrings,
  joined,
  resetContactManager,
  RouteIntent,
  SearchEngine,
  snapshotsOf,
  sameSnapshotArray
} from '../Shared/SharedDriver';
import { logSuite, logStep } from '../Shared/Support';

export default function fullDirectoryJourneyTest(): void {
  describe('FullDirectoryJourney', () => {
    const store: StoreDouble = new StoreDouble();
    const queue: TaskPoolQueue = new TaskPoolQueue();

    beforeAll(() => {
      logSuite('FullDirectoryJourney', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      store.reset();
      queue.reset();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('FullDirectoryJourney', 'end');
    });

    /**
     * @tc.name   journeyStartsEmpty
     * @tc.desc   A fresh journey has an empty manager, empty store and no queued task.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('journeyStartsEmpty', 0, () => {
      const manager = ContactManager.getInstance();
      expect(manager.getContacts().length).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(queue.size()).assertEqual(0);
      expect(ContactMetrics.from(manager.getContacts()).total).assertEqual(0);
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(0);
      expect(store.initialized).assertFalse();
    });

    /**
     * @tc.name   journeySeedLoadsFifteenRows
     * @tc.desc   The first stage loads the literal dataArray into the manager and the store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('journeySeedLoadsFifteenRows', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      logStep('journeySeedLoadsFifteenRows', String(store.rowCount()));
      expect(manager.getContacts().length).assertEqual(15);
      expect(store.rowCount()).assertEqual(15);
      expect(sameStringArray(contactNames(manager.getContacts()), store.names())).assertTrue();
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(6);
      expect(ContactMetrics.from(manager.getContacts()).uniqueNames).assertEqual(15);
    });

    /**
     * @tc.name   journeyAddGrowsTheDirectoryToSixteen
     * @tc.desc   The add stage appends one contact to both layers without reordering the seed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('journeyAddGrowsTheDirectoryToSixteen', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const added = contactOf('旅程新客', '13900001111', 'journey@example.com', '旅程地址', '', 'A');
      store.insert(true, added, 'ON_CONFLICT_REPLACE');
      manager.addContact(added);
      expect(manager.getContacts().length).assertEqual(16);
      expect(store.rowCount()).assertEqual(16);
      expect(manager.getContacts()[15].name).assertEqual('旅程新客');
      expect(store.names()[15]).assertEqual('旅程新客');
      expect(sameStringArray(contactNames(manager.getContacts()),
        contactNames(expectedAfterAdd(seed, added)))).assertTrue();
    });

    /**
     * @tc.name   journeySearchFindsTheAddedContact
     * @tc.desc   Typing part of the new name narrows the refreshed list to that single row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('journeySearchFindsTheAddedContact', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const added = contactOf('旅程新客', '13900001111', 'journey@example.com', '旅程地址', '', 'A');
      manager.addContact(added);
      const found = SearchEngine.filterByName(manager.getContacts(), '旅程');
      expect(found.length).assertEqual(1);
      expect(found[0].name).assertEqual('旅程新客');
      expect(found[0].phone).assertEqual('13900001111');
      expect(SearchEngine.filterByName(manager.getContacts(), '新客').length).assertEqual(1);
      expect(SearchEngine.filterByName(manager.getContacts(), '旅').length).assertEqual(1);
      expect(SearchEngine.filterByName(manager.getContacts(), '').length).assertEqual(16);
    });

    /**
     * @tc.name   journeySearchNarrowsTheWholeDirectoryToOneRow
     * @tc.desc   A seed name keyword returns one row, while a shared character returns the matching subset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeySearchNarrowsTheWholeDirectoryToOneRow', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      expect(SearchEngine.filterByName(manager.getContacts(), '阿诺德').length).assertEqual(1);
      expect(SearchEngine.filterByName(manager.getContacts(), '阿').length).assertEqual(1);
      expect(SearchEngine.filterByName(manager.getContacts(), '本').length).assertEqual(2);
      expect(SearchEngine.filterByName(manager.getContacts(), '法').length).assertEqual(2);
      expect(SearchEngine.filterByName(manager.getContacts(), '不存在').length).assertEqual(0);
    });

    /**
     * @tc.name   journeyEditChangesMutableFields
     * @tc.desc   The edit stage replaces phone, email and address on the manager and the store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('journeyEditChangesMutableFields', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const edited = cloneContact(seed[6]);
      edited.phone = '13900006666';
      edited.email = 'connor.edited@example.com';
      edited.address = '旅程改后地址';
      manager.updateContact(edited);
      store.updateContact(edited);
      expect(manager.getContacts()[6].phone).assertEqual('13900006666');
      expect(store.rows[6].email).assertEqual('connor.edited@example.com');
      expect(store.rows[6].address).assertEqual('旅程改后地址');
      expect(manager.getContacts()[6].name).assertEqual(seed[6].name);
      expect(store.rows[6].category).assertEqual(seed[6].category);
    });

    /**
     * @tc.name   journeyEditKeepsTheRowCount
     * @tc.desc   A replacement is not an insertion, so both layers remain at fifteen rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyEditKeepsTheRowCount', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const edited = cloneContact(seed[12]);
      edited.phone = '13900001212';
      manager.updateContact(edited);
      store.updateContact(edited);
      expect(manager.getContacts().length).assertEqual(15);
      expect(store.rowCount()).assertEqual(15);
      expect(uniqueStrings(contactNames(manager.getContacts())).length).assertEqual(15);
      expect(countOf(contactNames(manager.getContacts()), edited.name)).assertEqual(1);
      expect(store.updateCalls).assertEqual(1);
    });

    /**
     * @tc.name   journeyEditDetailRefreshShowsTheDraft
     * @tc.desc   The refreshed detail row carries the edited values and the untouched name and label.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyEditDetailRefreshShowsTheDraft', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const edited = cloneContact(seed[10]);
      edited.phone = '13900001010';
      edited.email = 'aideng.journey@example.com';
      edited.address = '旅程详情地址';
      manager.updateContact(edited);
      const detail = manager.getContacts()[10];
      expect(detail.phone).assertEqual('13900001010');
      expect(detail.email).assertEqual('aideng.journey@example.com');
      expect(detail.address).assertEqual('旅程详情地址');
      expect(detail.name).assertEqual(seed[10].name);
      expect(detail.category).assertEqual(seed[10].category);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(expectedAfterUpdate(seed, edited))))
        .assertTrue();
    });

    /**
     * @tc.name   journeyDeleteRemovesTheSelectedRow
     * @tc.desc   The delete stage removes the selected contact from both layers and from search.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('journeyDeleteRemovesTheSelectedRow', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const selected = seed[8];
      manager.deleteContact(selected);
      store.deleteByName(selected.name);
      expect(manager.getContacts().length).assertEqual(14);
      expect(store.rowCount()).assertEqual(14);
      expect(contactNames(manager.getContacts()).indexOf(selected.name)).assertEqual(-1);
      expect(store.names().indexOf(selected.name)).assertEqual(-1);
      expect(SearchEngine.filterByName(manager.getContacts(), selected.name).length).assertEqual(0);
    });

    /**
     * @tc.name   journeyDeleteRestoresTheSeedCount
     * @tc.desc   After deleting one row of a seed of fifteen, the directory is back to fourteen rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyDeleteRestoresTheSeedCount', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      manager.deleteContact(contactOf(seed[0].name, '', '', ''));
      const expected = expectedAfterDelete(seed, seed[0].name);
      expect(manager.getContacts().length).assertEqual(14);
      expect(sameStringArray(contactNames(manager.getContacts()), contactNames(expected))).assertTrue();
      expect(manager.getContacts()[0].name).assertEqual(seed[1].name);
      expect(ContactMetrics.from(manager.getContacts()).total).assertEqual(14);
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(6);
    });

    /**
     * @tc.name   journeyReAddAppendsTheContactAtTheEnd
     * @tc.desc   Re-adding a deleted contact puts it in slot fifteen, not back into its old slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyReAddAppendsTheContactAtTheEnd', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const removed = cloneContact(seed[2]);
      manager.deleteContact(removed);
      manager.addContact(removed);
      expect(manager.getContacts().length).assertEqual(15);
      expect(manager.getContacts()[14].name).assertEqual(seed[2].name);
      expect(manager.getContacts()[2].name).assertEqual(seed[3].name);
      expect(contactNames(manager.getContacts()).indexOf(seed[2].name)).assertEqual(14);
      expect(countOf(contactNames(manager.getContacts()), seed[2].name)).assertEqual(1);
    });

    /**
     * @tc.name   journeyReAddMayCarryANewPhone
     * @tc.desc   The re-added contact is a fresh draft, so it can hold a changed phone and email.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyReAddMayCarryANewPhone', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      manager.deleteContact(contactOf(seed[5].name, '', '', ''));
      const reAdded = contactOf(seed[5].name, '13900005555', 'cameron.journey@example.com', '回程地址', '', 'C');
      manager.addContact(reAdded);
      expect(manager.getContacts().length).assertEqual(15);
      expect(manager.getContacts()[14].phone).assertEqual('13900005555');
      expect(manager.getContacts()[14].email).assertEqual('cameron.journey@example.com');
      expect(manager.getContacts()[14].address).assertEqual('回程地址');
      expect(countOf(contactNames(manager.getContacts()), seed[5].name)).assertEqual(1);
      expect(store.rows.length).assertEqual(0);
    });

    /**
     * @tc.name   journeyCategoriesGrowWithTheNewLabel
     * @tc.desc   Adding a G contact creates a seventh group after the six seed labels.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyCategoriesGrowWithTheNewLabel', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('新分类', '13900001111', 'newcat@example.com', '新分类地址', '', 'G'));
      const groups = SearchEngine.groupByCategory(manager.getContacts());
      expect(groups.length).assertEqual(7);
      expect(groups[6]).assertEqual('G');
      expect(SearchEngine.countCategory(manager.getContacts(), 'G')).assertEqual(1);
      expect(SearchEngine.countCategory(manager.getContacts(), 'A')).assertEqual(2);
      expect(ContactMetrics.from(manager.getContacts()).categories).assertEqual(7);
    });

    /**
     * @tc.name   journeyCategoriesReturnToSixAfterDelete
     * @tc.desc   Deleting every G row removes the seventh group and restores the seed labels.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyCategoriesReturnToSixAfterDelete', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('新分类', '13900001111', 'newcat@example.com', '新分类地址', '', 'G'));
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(7);
      manager.deleteContact(contactOf('新分类', '', '', ''));
      const groups = SearchEngine.groupByCategory(manager.getContacts());
      expect(groups.length).assertEqual(6);
      expect(sameStringArray(groups, ['A', 'B', 'C', 'D', 'E', 'F'])).assertTrue();
      expect(manager.getContacts().length).assertEqual(15);
      expect(ContactMetrics.from(manager.getContacts()).categories).assertEqual(6);
    });

    /**
     * @tc.name   journeyMetricsAfterAddReportSixteenRows
     * @tc.desc   After the add the metrics count sixteen rows, sixteen names and six categories.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyMetricsAfterAddReportSixteenRows', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('旅程新客', '13900001111', 'journey@example.com', '旅程地址', '', 'A'));
      const metrics = ContactMetrics.from(manager.getContacts());
      expect(metrics.total).assertEqual(16);
      expect(metrics.uniqueNames).assertEqual(16);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.categories).assertEqual(6);
      expect(metrics.totalPhoneDigits).assertEqual(176);
      expect(metrics.fillRatio()).assertEqual(1);
    });

    /**
     * @tc.name   journeyMetricsAfterDeleteReportFifteenRows
     * @tc.desc   Deleting the added contact returns every metric to the seeded values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyMetricsAfterDeleteReportFifteenRows', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const added = contactOf('旅程新客', '13900001111', 'journey@example.com', '旅程地址');
      manager.addContact(added);
      manager.deleteContact(added);
      const metrics = ContactMetrics.from(manager.getContacts());
      expect(metrics.total).assertEqual(15);
      expect(metrics.totalPhoneDigits).assertEqual(165);
      expect(metrics.uniqueNames).assertEqual(15);
      expect(metrics.categories).assertEqual(6);
      expect(metrics.fillRatio()).assertEqual(1);
    });

    /**
     * @tc.name   journeyStoreAndManagerParityMidway
     * @tc.desc   At the halfway point both layers agree on names, categories and row totals.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyStoreAndManagerParityMidway', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const added = contactOf('中程', '13900001111', 'mid@example.com', '中程地址', '', 'E');
      manager.addContact(added);
      store.insert(true, added, 'ON_CONFLICT_REPLACE');
      expect(sameStringArray(contactNames(manager.getContacts()), store.names())).assertTrue();
      expect(SearchEngine.groupByCategory(manager.getContacts()).length)
        .assertEqual(SearchEngine.groupByCategory(store.rows).length);
      expect(manager.getContacts().length).assertEqual(store.rowCount());
      expect(ContactMetrics.from(manager.getContacts()).totalPhoneDigits)
        .assertEqual(ContactMetrics.from(store.rows).totalPhoneDigits);
      expect(store.names()[15]).assertEqual('中程');
    });

    /**
     * @tc.name   journeyFinalSnapshotMatchesExpectedOrder
     * @tc.desc   The final manager snapshot equals a rebuilt expected list after add, edit and delete.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('journeyFinalSnapshotMatchesExpectedOrder', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const added = contactOf('终程', '13900001111', 'final@example.com', '终程地址', '', 'A');
      manager.addContact(added);
      const edited = cloneContact(added);
      edited.phone = '13900002222';
      edited.address = '终程改后地址';
      manager.updateContact(edited);
      manager.deleteContact(contactOf(seed[13].name, '', '', ''));
      const expected = expectedAfterDelete(expectedAfterUpdate(expectedAfterAdd(seed, added), edited),
        seed[13].name);
      expect(manager.getContacts().length).assertEqual(15);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(expected))).assertTrue();
      expect(manager.getContacts()[14].name).assertEqual('终程');
      expect(manager.getContacts()[14].phone).assertEqual('13900002222');
      expect(contactNames(manager.getContacts()).indexOf(seed[13].name)).assertEqual(-1);
    });

    /**
     * @tc.name   journeyOperationTraceFollowsSubmissionOrder
     * @tc.desc   The task queue drains insert, query, update and delete in the submitted order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyOperationTraceFollowsSubmissionOrder', 0, () => {
      queue.submit(OperationCatalog.INSERT_ONE);
      queue.submit(OperationCatalog.QUERY_ALL);
      queue.submit(OperationCatalog.UPDATE_ONE);
      queue.submit(OperationCatalog.DELETE_ONE);
      expect(queue.size()).assertEqual(4);
      expect(queue.drain()).assertEqual(4);
      expect(queue.trace()).assertEqual('insert-one>query-all>update-one>delete-one');
      expect(queue.completionOrder.length).assertEqual(4);
      expect(queue.pending.length).assertEqual(0);
      expect(queue.failed.length).assertEqual(0);
    });

    /**
     * @tc.name   journeyDuplicateRejectedBeforeDeleteAndAllowedAfter
     * @tc.desc   Validation rejects a new draft with a seeded name until the seeded row is deleted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyDuplicateRejectedBeforeDeleteAndAllowedAfter', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const draft = contactOf('卡梅隆', '13900001111', 'newcameron@example.com', '新地址');
      expect(ContactValidation.validate(draft, manager.getContacts()).indexOf('name-duplicate') >= 0)
        .assertTrue();
      manager.deleteContact(contactOf('卡梅隆', '', '', ''));
      expect(ContactValidation.validate(draft, manager.getContacts()).length).assertEqual(0);
      expect(ContactValidation.canSubmit(draft, manager.getContacts())).assertTrue();
      manager.addContact(draft);
      expect(manager.getContacts().length).assertEqual(15);
      expect(manager.getContacts()[14].phone).assertEqual('13900001111');
    });

    /**
     * @tc.name   journeySearchIsEmptyAfterTheDelete
     * @tc.desc   Searching the deleted name after the delete stage returns an empty projection.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeySearchIsEmptyAfterTheDelete', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('法比而', '', '', ''));
      expect(SearchEngine.filterByName(manager.getContacts(), '法比而').length).assertEqual(0);
      expect(SearchEngine.filterByName(manager.getContacts(), '法比').length).assertEqual(0);
      expect(SearchEngine.filterByName(manager.getContacts(), '法').length).assertEqual(1);
      expect(SearchEngine.filterByName(manager.getContacts(), '法里').length).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(14);
    });

    /**
     * @tc.name   journeyCountsSumAfterMixedOperations
     * @tc.desc   After a mixed sequence the per-label counts sum to the surviving row count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyCountsSumAfterMixedOperations', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('混合甲', '13900001111', 'mix1@example.com', '混合一地'));
      manager.addContact(contactOf('混合乙', '13900002222', 'mix2@example.com', '混合二地', '', 'D'));
      manager.deleteContact(contactOf('贝拉', '', '', ''));
      const rows = manager.getContacts();
      const groups = SearchEngine.groupByCategory(rows);
      let total = 0;
      for (let index = 0; index < groups.length; index++) {
        total = total + SearchEngine.countCategory(rows, groups[index]);
      }
      expect(rows.length).assertEqual(16);
      expect(total).assertEqual(16);
      expect(groups.length).assertEqual(7);
      expect(SearchEngine.countCategory(rows, 'D')).assertEqual(3);
      expect(ContactMetrics.from(rows).total).assertEqual(16);
    });

    /**
     * @tc.name   journeyFingerprintChangesAtEachStage
     * @tc.desc   Seed, add, edit and delete each produce a different metrics fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyFingerprintChangesAtEachStage', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const seedPrint = ContactMetrics.from(manager.getContacts()).fingerprint();
      const added = contactOf('阶段', '13900001111', 'stage@example.com', '阶段地址');
      manager.addContact(added);
      const addedPrint = ContactMetrics.from(manager.getContacts()).fingerprint();
      const edited = cloneContact(added);
      edited.phone = '139000022220';
      manager.updateContact(edited);
      const editedPrint = ContactMetrics.from(manager.getContacts()).fingerprint();
      manager.deleteContact(edited);
      const deletedPrint = ContactMetrics.from(manager.getContacts()).fingerprint();
      expect(seedPrint === addedPrint).assertFalse();
      expect(addedPrint === editedPrint).assertFalse();
      expect(deletedPrint === addedPrint).assertFalse();
      expect(deletedPrint).assertEqual(seedPrint);
    });

    /**
     * @tc.name   journeyFinalFingerprintMatchesRebuiltDirectory
     * @tc.desc   A directory rebuilt from the final snapshot yields the same metrics fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('journeyFinalFingerprintMatchesRebuiltDirectory', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('重建', '13900001111', 'rebuild@example.com', '重建地址'));
      manager.deleteContact(contactOf('本', '', '', ''));
      const snapshots = snapshotsOf(manager.getContacts());
      const rebuilt: Contact[] = [];
      for (let index = 0; index < snapshots.length; index++) {
        rebuilt.push(contactOf(snapshots[index].name, snapshots[index].phone, snapshots[index].email,
          snapshots[index].address, '', snapshots[index].category));
      }
      expect(rebuilt.length).assertEqual(manager.getContacts().length);
      expect(ContactMetrics.from(rebuilt).fingerprint())
        .assertEqual(ContactMetrics.from(manager.getContacts()).fingerprint());
      expect(ContactMetrics.from(rebuilt).total).assertEqual(15);
      expect(sameSnapshotArray(snapshotsOf(rebuilt), snapshots)).assertTrue();
    });

    /**
     * @tc.name   journeyEditThenDeleteLeavesNoEditedCopy
     * @tc.desc   Editing and then deleting a contact leaves no edited row behind in any layer.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyEditThenDeleteLeavesNoEditedCopy', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const edited = cloneContact(seed[11]);
      edited.phone = '13900001111';
      manager.updateContact(edited);
      store.updateContact(edited);
      manager.deleteContact(edited);
      store.deleteByName(edited.name);
      expect(manager.getContacts().length).assertEqual(14);
      expect(store.rowCount()).assertEqual(14);
      expect(manager.getContacts().length).assertEqual(store.rowCount());
      expect(store.names().indexOf(edited.name)).assertEqual(-1);
      expect(SearchEngine.filterByName(manager.getContacts(), edited.name).length).assertEqual(0);
    });

    /**
     * @tc.name   journeyDeleteMissingNameChangesNothing
     * @tc.desc   Deleting a name the journey never added leaves all fifteen rows and six labels intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyDeleteMissingNameChangesNothing', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      manager.deleteContact(contactOf('从未存在', '13000000000', 'never@example.com', '从未地址'));
      expect(manager.getContacts().length).assertEqual(15);
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(6);
      expect(ContactMetrics.from(manager.getContacts()).totalPhoneDigits).assertEqual(165);
      expect(sameStringArray(contactNames(manager.getContacts()), contactNames(seed))).assertTrue();
      expect(ContactMetrics.from(manager.getContacts()).duplicateNames).assertEqual(0);
    });

    /**
     * @tc.name   journeyTwoAddsBothAppearInTheVisibleWindow
     * @tc.desc   Two inserts after a filler row both survive the first-row skip in the projection.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyTwoAddsBothAppearInTheVisibleWindow', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, [seed[0]]);
      const first = contactOf('双增甲', '13900001111', 'first@example.com', '双增一地');
      const second = contactOf('双增乙', '13900002222', 'second@example.com', '双增二地');
      store.insert(true, first, 'ON_CONFLICT_REPLACE');
      store.insert(true, second, 'ON_CONFLICT_REPLACE');
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(visible.length).assertEqual(2);
      expect(sameStringArray(contactNames(visible), ['双增甲', '双增乙'])).assertTrue();
      expect(store.rowCount()).assertEqual(3);
      expect(visible[0].phone).assertEqual('13900001111');
      expect(visible[1].phone).assertEqual('13900002222');
    });

    /**
     * @tc.name   journeyStoreRowsAfterTheFullJourney
     * @tc.desc   The store ends the journey with the exact rows implied by the mixed operations.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyStoreRowsAfterTheFullJourney', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const added = contactOf('尾声', '13900001111', 'coda@example.com', '尾声地址');
      store.insert(true, added, 'ON_CONFLICT_REPLACE');
      store.updateContact(added);
      store.deleteByName(seed[3].name);
      expect(store.rowCount()).assertEqual(15);
      expect(store.names()[14]).assertEqual('尾声');
      expect(store.names().indexOf(seed[3].name)).assertEqual(-1);
      expect(store.batchCalls).assertEqual(1);
      expect(store.insertCalls).assertEqual(1);
      expect(store.updateCalls).assertEqual(1);
      expect(store.deleteCalls).assertEqual(1);
    });

    /**
     * @tc.name   journeyCategoryTotalsAtTheEnd
     * @tc.desc   The final label totals still add up to the final row count after add and delete.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyCategoryTotalsAtTheEnd', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('末段', '13900001111', 'last@example.com', '末段地址', '', 'F'));
      manager.deleteContact(contactOf('阿诺德', '', '', ''));
      const rows = manager.getContacts();
      let total = 0;
      for (let index = 0; index < SearchEngine.groupByCategory(rows).length; index++) {
        total = total + SearchEngine.countCategory(rows, SearchEngine.groupByCategory(rows)[index]);
      }
      expect(total).assertEqual(15);
      expect(rows.length).assertEqual(15);
      expect(SearchEngine.countCategory(rows, 'A')).assertEqual(1);
      expect(SearchEngine.countCategory(rows, 'F')).assertEqual(3);
      expect(rows[14].category).assertEqual('F');
    });

    /**
     * @tc.name   journeySnapshotTailAfterReAdd
     * @tc.desc   The last snapshot after a delete and re-add belongs to the restart draft, not the seed tail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeySnapshotTailAfterReAdd', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      manager.deleteContact(contactOf(seed[14].name, '', '', ''));
      const restart = contactOf(seed[14].name, '13900001414', 'restart@example.com', '重启地址', '', 'F');
      manager.addContact(restart);
      const snapshots = snapshotsOf(manager.getContacts());
      expect(snapshots.length).assertEqual(15);
      expect(snapshots[14].name).assertEqual(seed[14].name);
      expect(snapshots[14].phone).assertEqual('13900001414');
      expect(snapshots[14].sameAs(snapshotsOf(seed)[14])).assertFalse();
      expect(snapshots[13].sameAs(snapshotsOf(seed)[13])).assertTrue();
    });

    /**
     * @tc.name   journeyLastEditWinsOnTheSameName
     * @tc.desc   Two edits of one name keep only the second phone in both layers.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyLastEditWinsOnTheSameName', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const firstEdit = cloneContact(seed[0]);
      firstEdit.phone = '13900000001';
      manager.updateContact(firstEdit);
      store.updateContact(firstEdit);
      const secondEdit = cloneContact(seed[0]);
      secondEdit.phone = '13900000002';
      manager.updateContact(secondEdit);
      store.updateContact(secondEdit);
      expect(manager.getContacts()[0].phone).assertEqual('13900000002');
      expect(store.rows[0].phone).assertEqual('13900000002');
      expect(countOf(contactNames(manager.getContacts()), seed[0].name)).assertEqual(1);
      expect(store.updateCalls).assertEqual(2);
      expect(store.rowCount()).assertEqual(15);
    });

    /**
     * @tc.name   journeySeedClearReseedKeepsBehaviour
     * @tc.desc   Clearing and reseeding the manager behaves like a page reload with fresh literal rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeySeedClearReseedKeepsBehaviour', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('可清', '13900001111', 'clear@example.com', '可清地址'));
      expect(manager.getContacts().length).assertEqual(16);
      manager.setContacts([]);
      expect(manager.getContacts().length).assertEqual(0);
      manager.setContacts(createSeedContacts());
      expect(manager.getContacts().length).assertEqual(15);
      expect(manager.getContacts()[0].name).assertEqual('艾德里安');
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(6);
    });

    /**
     * @tc.name   journeyRouteActionsRunInJourneyOrder
     * @tc.desc   The three journey actions resolve to editor, editor and list urls respectively.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyRouteActionsRunInJourneyOrder', 0, () => {
      const draft = contactOf('路由旅程', '13900001111', 'route@example.com', '路由旅程地址');
      const addUrl = new RouteIntent(ACTION_ADD, draft).url();
      const editUrl = new RouteIntent(ACTION_EDIT, draft).url();
      const deleteUrl = new RouteIntent(ACTION_DELETE, draft).url();
      expect(addUrl).assertEqual(ROUTE_EDIT);
      expect(editUrl).assertEqual(ROUTE_EDIT);
      expect(deleteUrl).assertEqual(ROUTE_LIST);
      expect(joined([addUrl, editUrl, deleteUrl], '>')).assertEqual(ROUTE_EDIT + '>' + ROUTE_EDIT +
        '>' + ROUTE_LIST);
      expect(RouteIntent.isKnownAction(ACTION_ADD) && RouteIntent.isKnownAction(ACTION_EDIT) &&
        RouteIntent.isKnownAction(ACTION_DELETE)).assertTrue();
    });

    /**
     * @tc.name   journeyFinalRowCountReflectsEveryStep
     * @tc.desc   Three adds, one delete and one update leave the directory at seventeen rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyFinalRowCountReflectsEveryStep', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const first = contactOf('三增甲', '13900001111', 'add1@example.com', '三增一地');
      const second = contactOf('三增乙', '13900002222', 'add2@example.com', '三增二地');
      const third = contactOf('三增丙', '13900003333', 'add3@example.com', '三增三地');
      manager.addContact(first);
      manager.addContact(second);
      manager.addContact(third);
      const edited = cloneContact(second);
      edited.phone = '13900004444';
      manager.updateContact(edited);
      manager.deleteContact(contactOf('本', '', '', ''));
      expect(manager.getContacts().length).assertEqual(17);
      expect(manager.getContacts()[16].name).assertEqual('三增丙');
      expect(countOf(contactNames(manager.getContacts()), '三增乙')).assertEqual(1);
      expect(manager.getContacts()[15].phone).assertEqual('13900004444');
    });

    /**
     * @tc.name   journeyManagerCopiesStayIndependentThroughout
     * @tc.desc   Every read during the journey returns an array whose edits do not reach the singleton.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyManagerCopiesStayIndependentThroughout', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const firstRead = manager.getContacts();
      firstRead.pop();
      firstRead.pop();
      expect(manager.getContacts().length).assertEqual(15);
      manager.addContact(contactOf('独立', '13900001111', 'independent@example.com', '独立地址'));
      const secondRead = manager.getContacts();
      secondRead.splice(0, 16);
      expect(manager.getContacts().length).assertEqual(16);
      expect(manager.getContacts()[15].name).assertEqual('独立');
      expect(manager.getContacts()[0].name).assertEqual('艾德里安');
    });

    /**
     * @tc.name   journeyStoreQueryCountsOneCallPerRefresh
     * @tc.desc   Each list refresh issues exactly one query, so three refreshes tick the counter three times.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the FullDirectoryJourney scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('journeyStoreQueryCountsOneCallPerRefresh', 0, () => {
      store.batchInsert(true, createSeedContacts());
      const first = store.query(true);
      const second = store.query(true);
      const third = store.query(true);
      expect(store.queryCalls).assertEqual(3);
      expect(first.length).assertEqual(15);
      expect(second.length).assertEqual(15);
      expect(third.length).assertEqual(15);
      expect(store.insertCalls).assertEqual(0);
      expect(store.rowCount()).assertEqual(15);
    });
  });
}
