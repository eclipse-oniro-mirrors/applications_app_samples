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
 * The delete path end to end. Anchors:
 *   AddressBookDetail.ets:252-265   delete button sends "删除联系人" back to the list page
 *   OperateRDBInTaskPool.ets:111-120 task pool delete then manager delete then dataArray refresh
 *   DatabaseConnection.ets:226-236   DELETE FROM contact WHERE name = ?
 *   ContactManager.ets:67-70         filter every row whose name matches
 *   AddressBookEdit.ets:96-110       duplicate name toast, reused here after deletion
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  ACTION_DELETE,
  ROUTE_LIST,
  DUPLICATE_NAME_TOAST,
  ContactValidation,
  StoreDouble,
  CursorResultSet,
  readContactsFromResultSet,
  expectedVisibleRows,
  expectedAfterDelete,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  sameStringArray,
  countOf,
  joined,
  textFingerprint,
  resetContactManager,
  RouteRequest,
  SearchEngine,
  ContactMetrics,
  snapshotsOf,
  sameSnapshotArray
} from '../Shared/SharedDriver';
import { logSuite, logStep } from '../Shared/Support';

export default function deleteContactEndToEndTest(): void {
  describe('DeleteContactEndToEnd', () => {
    const store: StoreDouble = new StoreDouble();

    beforeAll(() => {
      logSuite('DeleteContactEndToEnd', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      store.reset();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('DeleteContactEndToEnd', 'end');
    });

    /**
     * @tc.name   deleteRouteTargetsTheListPage
     * @tc.desc   The detail delete button routes back to the list page rather than the editor.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteRouteTargetsTheListPage', 0, () => {
      const request = new RouteRequest(ACTION_DELETE, contactOf('卡梅隆', '17777777777', 'cameron@example.com',
        '陕西省西安市雁塔区'));
      const params = request.toParams();
      logStep('deleteRouteTargetsTheListPage', request.url());
      expect(request.url()).assertEqual(ROUTE_LIST);
      expect(request.url() === 'pages/view/AddressBookEdit').assertFalse();
      expect(params.text).assertEqual(ACTION_DELETE);
      expect(params.data !== undefined).assertTrue();
      expect(RouteRequest.isKnownAction(ACTION_DELETE)).assertTrue();
    });

    /**
     * @tc.name   deleteRequestCarriesTheSelectedName
     * @tc.desc   The route parameter keeps the exact contact selected on the detail page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteRequestCarriesTheSelectedName', 0, () => {
      const seed = createSeedContacts();
      const selected = seed[7];
      const params = new RouteRequest(ACTION_DELETE, selected).toParams();
      expect((params.data as Contact).name).assertEqual('卡特琳娜');
      expect((params.data as Contact).name).assertEqual(selected.name);
      expect((params.data as Contact).phone).assertEqual(selected.phone);
      expect((params.data as Contact).category).assertEqual('C');
      expect(params.text).assertEqual(ACTION_DELETE);
      expect((params.data as Contact) === selected).assertTrue();
    });

    /**
     * @tc.name   deleteRequestDescriptionKeepsActionAndListUrl
     * @tc.desc   The descriptor joins the Chinese action literal with the selected name and list url.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteRequestDescriptionKeepsActionAndListUrl', 0, () => {
      const request = new RouteRequest(ACTION_DELETE, contactOf('贝拉', '11111111111', 'bella@example.com',
        '湖北省武汉市江汉区'));
      expect(request.describe()).assertEqual('删除联系人:贝拉:' + ROUTE_LIST);
      expect(request.describe().startsWith(ACTION_DELETE)).assertTrue();
      expect(request.describe().endsWith(ROUTE_LIST)).assertTrue();
      expect(request.describe().split(':').length).assertEqual(3);
      expect(request.toParams().text).assertEqual(request.action);
    });

    /**
     * @tc.name   deleteStoreRemovesSingleRow
     * @tc.desc   Removing one unique seed name leaves fourteen rows and reports one removal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteStoreRemovesSingleRow', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const removed = store.deleteByName('卡梅隆');
      expect(removed).assertEqual(1);
      expect(store.rowCount()).assertEqual(14);
      expect(store.names().indexOf('卡梅隆')).assertEqual(-1);
      expect(store.names()[5]).assertEqual('康纳');
      expect(store.deleteCalls).assertEqual(1);
    });

    /**
     * @tc.name   deleteStoreReturnsTheRemovedRowCount
     * @tc.desc   Two physically duplicated names are both deleted and the count reports two.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteStoreReturnsTheRemovedRowCount', 0, () => {
      const twin = contactOf('双份', '13500001111', 'twin@example.com', '双份地', '', 'B');
      store.batchInsert(true, [twin, contactOf('旁观', '13500002222', 'watch@example.com', '旁观地'),
        cloneContact(twin)]);
      const removed = store.deleteByName('双份');
      expect(removed).assertEqual(2);
      expect(store.rowCount()).assertEqual(1);
      expect(store.names()[0]).assertEqual('旁观');
      expect(countOf(store.names(), '双份')).assertEqual(0);
      expect(store.deleteCalls).assertEqual(1);
    });

    /**
     * @tc.name   deleteMissingNameIsANoOp
     * @tc.desc   Deleting a name absent from the table returns zero and leaves every stored row intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteMissingNameIsANoOp', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const removed = store.deleteByName('查无此名');
      expect(removed).assertEqual(0);
      expect(store.rowCount()).assertEqual(15);
      expect(store.deleteCalls).assertEqual(1);
      expect(sameStringArray(store.names(), contactNames(seed))).assertTrue();
      expect(sameContact(store.rows[0], seed[0])).assertTrue();
    });

    /**
     * @tc.name   deleteEverySeedNameEmptiesTheTable
     * @tc.desc   Deleting each of the fifteen seed names in order removes exactly fifteen rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteEverySeedNameEmptiesTheTable', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      let total = 0;
      for (let index = 0; index < seed.length; index++) {
        total = total + store.deleteByName(seed[index].name);
      }
      expect(total).assertEqual(15);
      expect(store.rowCount()).assertEqual(0);
      expect(store.deleteCalls).assertEqual(15);
      expect(store.query(true).length).assertEqual(0);
      expect(store.names().length).assertEqual(0);
    });

    /**
     * @tc.name   deleteBeforeInitLeavesTheStoreUntouched
     * @tc.desc   A delete on a fresh store is a row filter only and never triggers table creation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteBeforeInitLeavesTheStoreUntouched', 0, () => {
      expect(store.deleteByName('空表')).assertEqual(0);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.initCalls).assertEqual(0);
      expect(store.createTableCalls).assertEqual(0);
      expect(store.initialized).assertFalse();
      expect(store.rowCount()).assertEqual(0);
    });

    /**
     * @tc.name   deleteManagerRemovesSingleRow
     * @tc.desc   The singleton filter removes one row and keeps the remaining order unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteManagerRemovesSingleRow', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      manager.deleteContact(contactOf('康纳', '', '', ''));
      const actual = manager.getContacts();
      expect(actual.length).assertEqual(14);
      expect(sameStringArray(contactNames(actual), contactNames(expectedAfterDelete(seed, '康纳'))))
        .assertTrue();
      expect(actual[6].name).assertEqual('卡特琳娜');
      expect(contactNames(actual).indexOf('康纳')).assertEqual(-1);
      expect(manager.getContacts().length).assertEqual(14);
    });

    /**
     * @tc.name   deleteManagerRemovesEveryDuplicate
     * @tc.desc   The manager filter by name removes all rows sharing the name, not only the first.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteManagerRemovesEveryDuplicate', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      const doubled = seed.concat([cloneContact(seed[3]), cloneContact(seed[3])]);
      manager.setContacts(doubled);
      expect(countOf(contactNames(manager.getContacts()), seed[3].name)).assertEqual(3);
      manager.deleteContact(contactOf(seed[3].name, '', '', ''));
      expect(manager.getContacts().length).assertEqual(14);
      expect(countOf(contactNames(manager.getContacts()), seed[3].name)).assertEqual(0);
      expect(sameStringArray(contactNames(manager.getContacts()),
        contactNames(expectedAfterDelete(doubled, seed[3].name)))).assertTrue();
    });

    /**
     * @tc.name   deleteListRefreshShrinksByOne
     * @tc.desc   After the manager delete the refreshed data array holds one row fewer for the list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteListRefreshShrinksByOne', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const before = manager.getContacts().length;
      manager.deleteContact(contactOf('艾登', '', '', ''));
      const refreshed = manager.getContacts();
      expect(refreshed.length).assertEqual(before - 1);
      expect(refreshed.length).assertEqual(14);
      expect(SearchEngine.filterByName(refreshed, '艾登').length).assertEqual(0);
      expect(SearchEngine.filterByName(refreshed, '艾拉').length).assertEqual(1);
      expect(SearchEngine.groupByCategory(refreshed).length).assertEqual(6);
    });

    /**
     * @tc.name   deleteStoreQueryReflectsRemovalImmediately
     * @tc.desc   A query issued right after the delete no longer returns the removed row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteStoreQueryReflectsRemovalImmediately', 0, () => {
      store.batchInsert(true, createSeedContacts());
      store.deleteByName('法里');
      const rows = store.query(true);
      expect(rows.length).assertEqual(14);
      expect(contactNames(rows).indexOf('法里')).assertEqual(-1);
      expect(rows[13].name).assertEqual('法比而');
      expect(store.queryCalls).assertEqual(1);
      expect(store.rowCount()).assertEqual(14);
    });

    /**
     * @tc.name   deleteCategoryCountsOfOtherLabelsStayStable
     * @tc.desc   Removing one C row leaves A, B, D, E and F counts exactly as seeded.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteCategoryCountsOfOtherLabelsStayStable', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('康纳', '', '', ''));
      const rows = manager.getContacts();
      expect(SearchEngine.countCategory(rows, 'A')).assertEqual(2);
      expect(SearchEngine.countCategory(rows, 'B')).assertEqual(3);
      expect(SearchEngine.countCategory(rows, 'C')).assertEqual(2);
      expect(SearchEngine.countCategory(rows, 'D')).assertEqual(2);
      expect(SearchEngine.countCategory(rows, 'E')).assertEqual(3);
      expect(SearchEngine.countCategory(rows, 'F')).assertEqual(2);
    });

    /**
     * @tc.name   deleteCategoryGroupDisappearsWhenEmptied
     * @tc.desc   Deleting all three C rows removes that label from the grouping and metrics.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteCategoryGroupDisappearsWhenEmptied', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('卡梅隆', '', '', ''));
      manager.deleteContact(contactOf('康纳', '', '', ''));
      manager.deleteContact(contactOf('卡特琳娜', '', '', ''));
      const rows = manager.getContacts();
      expect(rows.length).assertEqual(12);
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(5);
      expect(SearchEngine.groupByCategory(rows).indexOf('C')).assertEqual(-1);
      expect(SearchEngine.countCategory(rows, 'C')).assertEqual(0);
      expect(ContactMetrics.from(rows).categories).assertEqual(5);
    });

    /**
     * @tc.name   deleteReinsertAppendsAtTheEnd
     * @tc.desc   Re-adding a deleted contact appends it after the survivors rather than restoring its index.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteReinsertAppendsAtTheEnd', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const removed = cloneContact(seed[2]);
      manager.deleteContact(removed);
      expect(manager.getContacts().length).assertEqual(14);
      manager.addContact(removed);
      const rows = manager.getContacts();
      expect(rows.length).assertEqual(15);
      expect(rows[14].name).assertEqual('贝拉');
      expect(rows[2].name).assertEqual('本');
      expect(contactNames(rows).indexOf('贝拉')).assertEqual(14);
      expect(contactNames(rows).indexOf('本')).assertEqual(2);
    });

    /**
     * @tc.name   deleteThenDuplicateNameBecomesValid
     * @tc.desc   A name rejected as duplicate before the delete passes validation afterwards.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteThenDuplicateNameBecomesValid', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const draft = contactOf('贝拉', '13900001111', 'newbella@example.com', '浙江省杭州市西湖区');
      expect(ContactValidation.validate(draft, manager.getContacts()).indexOf('name-duplicate') >= 0)
        .assertTrue();
      manager.deleteContact(contactOf('贝拉', '', '', ''));
      expect(ContactValidation.validate(draft, manager.getContacts()).length).assertEqual(0);
      expect(ContactValidation.canSubmit(draft, manager.getContacts())).assertTrue();
      expect(DUPLICATE_NAME_TOAST.length > 0).assertTrue();
    });

    /**
     * @tc.name   deleteSearchAfterRemovalReturnsNothing
     * @tc.desc   The detail page search for the removed contact finds no row in the refreshed list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteSearchAfterRemovalReturnsNothing', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      expect(SearchEngine.filterByName(manager.getContacts(), '戴维维').length).assertEqual(1);
      manager.deleteContact(contactOf('戴维维', '', '', ''));
      expect(SearchEngine.filterByName(manager.getContacts(), '戴维维').length).assertEqual(0);
      expect(SearchEngine.filterByName(manager.getContacts(), '戴').length).assertEqual(0);
      expect(SearchEngine.filterByName(manager.getContacts(), '丹尼尔').length).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(14);
    });

    /**
     * @tc.name   deleteMetricsDropOneRow
     * @tc.desc   Removing one row lowers totals, keeps category count and changes the fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteMetricsDropOneRow', 0, () => {
      const before = ContactMetrics.from(createSeedContacts());
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('本杰明', '', '', ''));
      const after = ContactMetrics.from(manager.getContacts());
      expect(after.total).assertEqual(14);
      expect(after.totalPhoneDigits).assertEqual(154);
      expect(after.categories).assertEqual(6);
      expect(after.fingerprint() === before.fingerprint()).assertFalse();
      expect(after.fillRatio()).assertEqual(1);
    });

    /**
     * @tc.name   deleteCaseSensitiveMismatchKeepsTheRow
     * @tc.desc   Name comparison is exact, so a differently cased or partial name deletes nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteCaseSensitiveMismatchKeepsTheRow', 0, () => {
      const rows = [contactOf('Alice', '13500001111', 'alice@example.com', '甲地')];
      store.batchInsert(true, rows);
      const manager = ContactManager.getInstance();
      manager.setContacts(rows);
      expect(store.deleteByName('alice')).assertEqual(0);
      expect(store.deleteByName('Alic')).assertEqual(0);
      expect(store.deleteByName('Alice ')).assertEqual(0);
      expect(store.rowCount()).assertEqual(1);
      manager.deleteContact(contactOf('ALICE', '', '', ''));
      expect(manager.getContacts().length).assertEqual(1);
      expect(manager.getContacts()[0].name).assertEqual('Alice');
    });

    /**
     * @tc.name   deleteBlankNameRowsRemovedTogether
     * @tc.desc   Two blank name rows are removed by a single blank name delete in both layers.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteBlankNameRowsRemovedTogether', 0, () => {
      const rows = [contactOf('', '13500001111', 'b1@example.com', '空名一地'),
        contactOf('', '13500002222', 'b2@example.com', '空名二地'),
        contactOf('正常', '13500003333', 'ok@example.com', '正常地')];
      store.batchInsert(true, rows);
      const manager = ContactManager.getInstance();
      manager.setContacts(rows);
      expect(store.deleteByName('')).assertEqual(2);
      manager.deleteContact(contactOf('', '', '', ''));
      expect(store.rowCount()).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(1);
      expect(manager.getContacts()[0].name).assertEqual('正常');
      expect(store.names()[0]).assertEqual('正常');
    });

    /**
     * @tc.name   deleteOnEmptyLayersIsSafe
     * @tc.desc   Deleting from an empty manager and an empty store changes nothing and reports zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteOnEmptyLayersIsSafe', 0, () => {
      const manager = ContactManager.getInstance();
      expect(manager.getContacts().length).assertEqual(0);
      manager.deleteContact(contactOf('无人', '', '', ''));
      expect(manager.getContacts().length).assertEqual(0);
      expect(store.deleteByName('无人')).assertEqual(0);
      expect(store.rowCount()).assertEqual(0);
      expect(store.deleteCalls).assertEqual(1);
      expect(store.query(true).length).assertEqual(0);
    });

    /**
     * @tc.name   deleteSnapshotMatchesTheExpectedOracle
     * @tc.desc   The manager snapshot after a delete equals the expectedAfterDelete oracle row for row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteSnapshotMatchesTheExpectedOracle', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      manager.deleteContact(contactOf(seed[9].name, '', '', ''));
      const expected = expectedAfterDelete(seed, seed[9].name);
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(expected))).assertTrue();
      expect(snapshotsOf(manager.getContacts()).length).assertEqual(14);
      expect(snapshotsOf(manager.getContacts())[9].sameAs(snapshotsOf(expected)[9])).assertTrue();
      expect(snapshotsOf(manager.getContacts())[9].name).assertEqual(seed[10].name);
    });

    /**
     * @tc.name   deleteManagerAndStoreParityAfterDelete
     * @tc.desc   The manager and the store report the same names after the same delete is applied.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteManagerAndStoreParityAfterDelete', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      manager.deleteContact(contactOf('阿诺德', '', '', ''));
      const removed = store.deleteByName('阿诺德');
      expect(removed).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(store.rowCount());
      expect(sameStringArray(contactNames(manager.getContacts()), store.names())).assertTrue();
      expect(ContactMetrics.from(manager.getContacts()).total)
        .assertEqual(ContactMetrics.from(store.rows).total);
      expect(store.names()[0]).assertEqual('艾德里安');
    });

    /**
     * @tc.name   deleteProjectionSkipsFirstSurvivor
     * @tc.desc   After a delete the cursor projection starts at the second surviving store row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteProjectionSkipsFirstSurvivor', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      store.deleteByName(seed[0].name);
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(store.rowCount()).assertEqual(14);
      expect(visible.length).assertEqual(13);
      expect(visible[0].name).assertEqual(seed[2].name);
      expect(contactNames(visible).indexOf(seed[0].name)).assertEqual(-1);
      expect(expectedVisibleRows(store.query(true)).length).assertEqual(13);
    });

    /**
     * @tc.name   deleteAllSeedNamesLeavesAnEmptyQuery
     * @tc.desc   Deleting every name empties the store, so the query and the projection both return nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteAllSeedNamesLeavesAnEmptyQuery', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      for (let index = 0; index < seed.length; index++) {
        store.deleteByName(seed[index].name);
      }
      expect(store.rowCount()).assertEqual(0);
      expect(store.query(true).length).assertEqual(0);
      expect(readContactsFromResultSet(new CursorResultSet(store.query(true))).length).assertEqual(0);
      expect(store.names().length).assertEqual(0);
      expect(store.deleteCalls).assertEqual(15);
    });

    /**
     * @tc.name   deleteDuplicateCountDropsAfterFirstRemoval
     * @tc.desc   The first delete removes both duplicate rows and the second delete of the same name reports zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteDuplicateCountDropsAfterFirstRemoval', 0, () => {
      const twin = contactOf('三连', '13500001111', 'triple@example.com', '三连地');
      store.batchInsert(true, [twin, cloneContact(twin)]);
      expect(store.deleteByName('三连')).assertEqual(2);
      expect(store.deleteByName('三连')).assertEqual(0);
      expect(store.deleteCalls).assertEqual(2);
      expect(store.rowCount()).assertEqual(0);
      expect(store.names().length).assertEqual(0);
    });

    /**
     * @tc.name   deleteRouteParamsStillDescribeTheRemovedContact
     * @tc.desc   The router payload is a value carrier; removing the row does not rewrite the request strings.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteRouteParamsStillDescribeTheRemovedContact', 0, () => {
      const seed = createSeedContacts();
      const manager = ContactManager.getInstance();
      manager.setContacts(seed);
      const request = new RouteRequest(ACTION_DELETE, seed[11]);
      manager.deleteContact(seed[11]);
      expect(request.describe()).assertEqual('删除联系人:艾拉:' + ROUTE_LIST);
      expect(request.toParams().text).assertEqual(ACTION_DELETE);
      expect(manager.getContacts().length).assertEqual(14);
      expect(SearchEngine.filterByName(manager.getContacts(), seed[11].name).length).assertEqual(0);
      expect(request.url()).assertEqual(ROUTE_LIST);
    });

    /**
     * @tc.name   deleteTwoNamesLeavesThirteenNamesInOrder
     * @tc.desc   Deleting two seed names preserves the relative order of the thirteen survivors.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteTwoNamesLeavesThirteenNamesInOrder', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      manager.deleteContact(contactOf(seed[1].name, '', '', ''));
      manager.deleteContact(contactOf(seed[12].name, '', '', ''));
      const expected = expectedAfterDelete(expectedAfterDelete(seed, seed[1].name), seed[12].name);
      expect(manager.getContacts().length).assertEqual(13);
      expect(sameStringArray(contactNames(manager.getContacts()), contactNames(expected))).assertTrue();
      expect(manager.getContacts()[0].name).assertEqual(seed[0].name);
      expect(manager.getContacts()[12].name).assertEqual(seed[14].name);
      expect(countOf(contactNames(manager.getContacts()), seed[1].name)).assertEqual(0);
    });

    /**
     * @tc.name   deleteCategoryTotalsRecomputeFromSurvivors
     * @tc.desc   After two deletions the six label counts sum to thirteen and match the survivor list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteCategoryTotalsRecomputeFromSurvivors', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('康纳', '', '', ''));
      manager.deleteContact(contactOf('法比而', '', '', ''));
      const rows = manager.getContacts();
      let total = 0;
      for (let index = 0; index < SearchEngine.groupByCategory(rows).length; index++) {
        total = total + SearchEngine.countCategory(rows, SearchEngine.groupByCategory(rows)[index]);
      }
      expect(rows.length).assertEqual(13);
      expect(total).assertEqual(13);
      expect(SearchEngine.countCategory(rows, 'C')).assertEqual(2);
      expect(SearchEngine.countCategory(rows, 'F')).assertEqual(1);
      expect(ContactMetrics.from(rows).total).assertEqual(13);
    });

    /**
     * @tc.name   deleteLeavesValidationRulesIntact
     * @tc.desc   Deleting a row does not relax the field rules; a malformed email draft is still rejected.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteLeavesValidationRulesIntact', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('贝拉', '', '', ''));
      const draft = contactOf('新贝拉', '13900001111', 'broken-email', '浙江省杭州市西湖区');
      const errors = ContactValidation.validate(draft, manager.getContacts());
      expect(errors.indexOf('email-malformed') >= 0).assertTrue();
      expect(errors.indexOf('name-duplicate')).assertEqual(-1);
      draft.email = 'newbella@example.com';
      expect(ContactValidation.validate(draft, manager.getContacts()).length).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(14);
    });

    /**
     * @tc.name   deleteManagerDeleteReturnsNoValueAndKeepsDraftReference
     * @tc.desc   deleteContact is void; the removed draft object itself is untouched by the filter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteManagerDeleteReturnsNoValueAndKeepsDraftReference', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const removed = cloneContact(seed[6]);
      manager.deleteContact(removed);
      expect(removed.name).assertEqual(seed[6].name);
      expect(removed.phone).assertEqual(seed[6].phone);
      expect(removed.category).assertEqual(seed[6].category);
      expect(manager.getContacts().length).assertEqual(14);
      expect(sameContact(removed, seed[6])).assertTrue();
    });

    /**
     * @tc.name   deleteFullJourneyAddThenDeleteReturnsToSeed
     * @tc.desc   Adding a draft and then deleting it leaves the seed count, names and snapshots unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteFullJourneyAddThenDeleteReturnsToSeed', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const draft = contactOf('过客', '13900001111', 'guest@example.com', '过客地址');
      store.insert(true, draft, 'ON_CONFLICT_REPLACE');
      manager.addContact(draft);
      expect(manager.getContacts().length).assertEqual(16);
      expect(store.rowCount()).assertEqual(16);
      manager.deleteContact(draft);
      store.deleteByName(draft.name);
      expect(manager.getContacts().length).assertEqual(15);
      expect(store.rowCount()).assertEqual(15);
      expect(sameStringArray(contactNames(manager.getContacts()), contactNames(seed))).assertTrue();
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(seed))).assertTrue();
    });

    /**
     * @tc.name   deleteRemovedNameAbsentFromSnapshotArray
     * @tc.desc   No snapshot in the survivor array carries the removed name, and the tail shifts left.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteRemovedNameAbsentFromSnapshotArray', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      manager.deleteContact(contactOf(seed[13].name, '', '', ''));
      const snapshots = snapshotsOf(manager.getContacts());
      let matches = 0;
      for (let index = 0; index < snapshots.length; index++) {
        if (snapshots[index].name === seed[13].name) {
          matches = matches + 1;
        }
      }
      expect(matches).assertEqual(0);
      expect(snapshots.length).assertEqual(14);
      expect(snapshots[13].name).assertEqual(seed[14].name);
      expect(snapshots[12].name).assertEqual(seed[12].name);
      expect(snapshots[13].sameAs(snapshotsOf(seed)[13])).assertFalse();
    });

    /**
     * @tc.name   deleteRawAndVisibleCountsAfterTwoRemovals
     * @tc.desc   Two row removals leave thirteen physical rows and twelve visible rows after the skip.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteRawAndVisibleCountsAfterTwoRemovals', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      store.deleteByName(seed[4].name);
      store.deleteByName(seed[9].name);
      expect(store.rowCount()).assertEqual(13);
      expect(store.query(true).length).assertEqual(13);
      expect(expectedVisibleRows(store.query(true)).length).assertEqual(12);
      expect(readContactsFromResultSet(new CursorResultSet(store.query(true))).length).assertEqual(12);
      expect(store.deleteCalls).assertEqual(2);
    });

    /**
     * @tc.name   deleteUpdateAfterDeleteAffectsNoRows
     * @tc.desc   Updating the removed name after the delete affects zero rows and leaves survivors intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteUpdateAfterDeleteAffectsNoRows', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      store.deleteByName(seed[2].name);
      const stale = contactOf(seed[2].name, '13900002222', 'stale@example.com', '过期地址');
      expect(store.updateContact(stale)).assertEqual(0);
      expect(store.rowCount()).assertEqual(14);
      expect(store.names().indexOf(seed[2].name)).assertEqual(-1);
      expect(store.updateCalls).assertEqual(1);
      expect(sameContact(store.rows[1], seed[1])).assertTrue();
    });

    /**
     * @tc.name   deleteInsertAfterDeleteRestoresCount
     * @tc.desc   Re-inserting a deleted name grows the store back to fifteen with the row at the end.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteInsertAfterDeleteRestoresCount', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      store.deleteByName(seed[0].name);
      expect(store.rowCount()).assertEqual(14);
      store.insert(true, cloneContact(seed[0]), 'ON_CONFLICT_REPLACE');
      expect(store.rowCount()).assertEqual(15);
      expect(store.names()[14]).assertEqual(seed[0].name);
      expect(countOf(store.names(), seed[0].name)).assertEqual(1);
      expect(store.names()[0]).assertEqual(seed[1].name);
    });

    /**
     * @tc.name   deleteCategoryOrderAfterTheOnlyDLabelRowsGo
     * @tc.desc   Removing both D rows keeps the A, B, C, E, F first-seen order with no gap.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteCategoryOrderAfterTheOnlyDLabelRowsGo', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('丹尼尔', '', '', ''));
      manager.deleteContact(contactOf('戴维维', '', '', ''));
      const groups = SearchEngine.groupByCategory(manager.getContacts());
      expect(groups.length).assertEqual(5);
      expect(sameStringArray(groups, ['A', 'B', 'C', 'E', 'F'])).assertTrue();
      expect(groups.indexOf('D')).assertEqual(-1);
      expect(SearchEngine.countCategory(manager.getContacts(), 'D')).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(13);
    });

    /**
     * @tc.name   deleteFingerprintDiffersPerRemovedRow
     * @tc.desc   Removing different rows changes the name fingerprint even when aggregate metrics match.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteFingerprintDiffersPerRemovedRow', 0, () => {
      const seed = createSeedContacts();
      const withoutFirst = expectedAfterDelete(seed, seed[0].name);
      const withoutLast = expectedAfterDelete(seed, seed[14].name);
      const firstMetrics = ContactMetrics.from(withoutFirst);
      const lastMetrics = ContactMetrics.from(withoutLast);
      expect(firstMetrics.total).assertEqual(lastMetrics.total);
      expect(textFingerprint(joined(contactNames(withoutFirst))) === textFingerprint(joined(contactNames(withoutLast)))).assertFalse();
      expect(firstMetrics.totalPhoneDigits).assertEqual(lastMetrics.totalPhoneDigits);
      expect(firstMetrics.uniqueNames).assertEqual(14);
      expect(lastMetrics.uniqueNames).assertEqual(14);
    });

    /**
     * @tc.name   deleteRepeatedDeletesKeepCounterMonotonic
     * @tc.desc   Each delete attempt counts once even when the name is already gone from the table.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteRepeatedDeletesKeepCounterMonotonic', 0, () => {
      const seed = createSeedContacts().slice(0, 3);
      store.batchInsert(true, seed);
      expect(store.deleteByName(seed[0].name)).assertEqual(1);
      expect(store.deleteByName(seed[0].name)).assertEqual(0);
      expect(store.deleteByName(seed[2].name)).assertEqual(1);
      expect(store.deleteCalls).assertEqual(3);
      expect(store.rowCount()).assertEqual(1);
      expect(store.names()[0]).assertEqual(seed[1].name);
    });

    /**
     * @tc.name   deleteManagerReadsAFreshArrayEachTime
     * @tc.desc   Two getContacts calls after a delete return equal content in distinct array instances.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteManagerReadsAFreshArrayEachTime', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('本', '', '', ''));
      const first = manager.getContacts();
      const second = manager.getContacts();
      expect(first === second).assertFalse();
      expect(sameStringArray(contactNames(first), contactNames(second))).assertTrue();
      expect(first.length).assertEqual(14);
      expect(first[3].name).assertEqual('本杰明');
      expect(contactNames(first).indexOf('本')).assertEqual(-1);
    });

    /**
     * @tc.name   deleteStoreAndManagerBothDropTheFinalRow
     * @tc.desc   Deleting the last seeded row leaves fourteen rows in each layer with a matching tail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DeleteContactEndToEnd scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteStoreAndManagerBothDropTheFinalRow', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      manager.deleteContact(contactOf(seed[14].name, '', '', ''));
      store.deleteByName(seed[14].name);
      expect(manager.getContacts().length).assertEqual(14);
      expect(store.rowCount()).assertEqual(14);
      expect(manager.getContacts()[13].name).assertEqual(seed[13].name);
      expect(store.names()[13]).assertEqual(seed[13].name);
      expect(store.names().indexOf(seed[14].name)).assertEqual(-1);
    });
  });
}
