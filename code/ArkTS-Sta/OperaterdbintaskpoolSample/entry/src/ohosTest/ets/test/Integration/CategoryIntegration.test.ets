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
 * Category behaviour across the seed, grouping, search, manager and store. Anchors:
 *   OperateRDBInTaskPool.ets:53-69   category column A through F per seed row
 *   AddressBookEdit.ets:161-179      only name changes mark the draft dirty for duplicates
 *   DatabaseConnection.ets:241-272   update replaces phone, email and address only
 *   DatabaseConnection.ets:277-309   category read back through column index five
 *   ContactManager.ets:55-65         update replaces the whole object, category included
 *   RdbConstant.ets:33-34            category is a NOT NULL column
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  CATEGORIES,
  CATEGORY_A,
  CATEGORY_F,
  ContactMapper,
  ContactMetrics,
  SearchEngine,
  StoreDouble,
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
  expectedAfterDelete,
  expectedAfterUpdate,
  snapshotsOf,
  sameSnapshotArray,
  CursorResultSet,
  readContactsFromResultSet
} from '../Shared/SharedDriver';
import { logSuite, logStep } from '../Shared/Support';

export default function categoryIntegrationTest(): void {
  describe('CategoryIntegration', () => {
    const store: StoreDouble = new StoreDouble();

    beforeAll(() => {
      logSuite('CategoryIntegration', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      store.reset();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('CategoryIntegration', 'end');
    });

    /**
     * @tc.name   categorySeedCoversSixLabels
     * @tc.desc   The fifteen literal rows use exactly the six category labels A through F.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categorySeedCoversSixLabels', 0, () => {
      const groups = SearchEngine.groupByCategory(createSeedContacts());
      logStep('categorySeedCoversSixLabels', joined(groups, ','));
      expect(groups.length).assertEqual(6);
      expect(sameStringArray(groups, CATEGORIES)).assertTrue();
      expect(groups[0]).assertEqual('A');
      expect(groups[5]).assertEqual('F');
      expect(groups.indexOf('G')).assertEqual(-1);
    });

    /**
     * @tc.name   categoryGroupingPreservesFirstSeenOrder
     * @tc.desc   groupByCategory emits labels in row order, not alphabetical order of a map.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryGroupingPreservesFirstSeenOrder', 0, () => {
      const rows = [
        contactOf('丙', '13500003333', 'c@example.com', '丙地', '', 'C'),
        contactOf('甲', '13500001111', 'a@example.com', '甲地', '', 'A'),
        contactOf('乙', '13500002222', 'b@example.com', '乙地', '', 'B')
      ];
      const groups = SearchEngine.groupByCategory(rows);
      expect(sameStringArray(groups, ['C', 'A', 'B'])).assertTrue();
      expect(groups[0]).assertEqual('C');
      expect(groups[2]).assertEqual('B');
      expect(SearchEngine.groupByCategory(createSeedContacts())[1]).assertEqual('B');
    });

    /**
     * @tc.name   categoryCountsMatchHandCountedSeed
     * @tc.desc   A has two rows, B and C have three, D has two, E and F have three.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryCountsMatchHandCountedSeed', 0, () => {
      const seed = createSeedContacts();
      expect(SearchEngine.countCategory(seed, CATEGORY_A)).assertEqual(2);
      expect(SearchEngine.countCategory(seed, 'B')).assertEqual(3);
      expect(SearchEngine.countCategory(seed, 'C')).assertEqual(3);
      expect(SearchEngine.countCategory(seed, 'D')).assertEqual(2);
      expect(SearchEngine.countCategory(seed, 'E')).assertEqual(3);
      expect(SearchEngine.countCategory(seed, CATEGORY_F)).assertEqual(2);
    });

    /**
     * @tc.name   categoryCountsSumToSeedSize
     * @tc.desc   Summing the six label counts returns the fifteen seed rows with no leftovers.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryCountsSumToSeedSize', 0, () => {
      const seed = createSeedContacts();
      let total = 0;
      for (let index = 0; index < CATEGORIES.length; index++) {
        total = total + SearchEngine.countCategory(seed, CATEGORIES[index]);
      }
      expect(total).assertEqual(seed.length);
      expect(total).assertEqual(15);
      expect(total - SearchEngine.countCategory(seed, 'A')).assertEqual(13);
      expect(uniqueStrings(seed.map((item: Contact) => item.category)).length).assertEqual(6);
    });

    /**
     * @tc.name   categoryLabelsAreSingleUppercaseLetters
     * @tc.desc   Every seed label has length one and sits between A and F in the alphabet.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryLabelsAreSingleUppercaseLetters', 0, () => {
      const seed = createSeedContacts();
      let valid = 0;
      for (let index = 0; index < seed.length; index++) {
        const label = seed[index].category;
        if (label.length === 1 && label >= 'A' && label <= 'F') {
          valid = valid + 1;
        }
      }
      expect(valid).assertEqual(15);
      expect(seed[0].category.length).assertEqual(1);
      expect(seed[9].category >= 'A').assertTrue();
      expect(seed[9].category <= 'F').assertTrue();
      expect(CATEGORIES.length).assertEqual(6);
    });

    /**
     * @tc.name   categoryIntegrationEmptyGroupingIsEmpty
     * @tc.desc   An empty directory yields no category groups and zero counts for every label.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryIntegrationEmptyGroupingIsEmpty', 0, () => {
      const rows: Contact[] = [];
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(0);
      expect(SearchEngine.countCategory(rows, CATEGORY_A)).assertEqual(0);
      expect(SearchEngine.countCategory(rows, CATEGORY_F)).assertEqual(0);
      expect(ContactMetrics.from(rows).categories).assertEqual(0);
      expect(joined(SearchEngine.groupByCategory(rows), ',')).assertEqual('');
    });

    /**
     * @tc.name   categoryCountForUnknownLabelIsZero
     * @tc.desc   Labels outside A through F score zero against the seed without mutating it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryCountForUnknownLabelIsZero', 0, () => {
      const seed = createSeedContacts();
      expect(SearchEngine.countCategory(seed, 'G')).assertEqual(0);
      expect(SearchEngine.countCategory(seed, 'a')).assertEqual(0);
      expect(SearchEngine.countCategory(seed, ' A')).assertEqual(0);
      expect(SearchEngine.countCategory(seed, '')).assertEqual(0);
      expect(SearchEngine.countCategory(seed, 'AB')).assertEqual(0);
      expect(seed.length).assertEqual(15);
    });

    /**
     * @tc.name   categoryBlankLabelFormsSeventhGroup
     * @tc.desc   A contact with an empty category is grouped under the blank label after F.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryBlankLabelFormsSeventhGroup', 0, () => {
      const rows = createSeedContacts();
      rows.push(contactOf('无类别', '13500001111', 'none@example.com', '未分类地址'));
      const groups = SearchEngine.groupByCategory(rows);
      expect(groups.length).assertEqual(7);
      expect(groups[6]).assertEqual('');
      expect(SearchEngine.countCategory(rows, '')).assertEqual(1);
      expect(SearchEngine.countCategory(rows, 'A')).assertEqual(2);
      expect(ContactMetrics.from(rows).categories).assertEqual(7);
    });

    /**
     * @tc.name   categorySearchByPrefixKeepsLabels
     * @tc.desc   Filtering by the card prefix returns two rows whose labels are C and C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categorySearchByPrefixKeepsLabels', 0, () => {
      const seed = createSeedContacts();
      const found = SearchEngine.filterByName(seed, '卡');
      expect(found.length).assertEqual(2);
      expect(found[0].category).assertEqual('C');
      expect(found[1].category).assertEqual('C');
      expect(SearchEngine.countCategory(found, 'C')).assertEqual(2);
      expect(SearchEngine.groupByCategory(found).length).assertEqual(1);
    });

    /**
     * @tc.name   categorySearchNarrowsCountsPerLabel
     * @tc.desc   Searching the letter for Ai returns five rows spread over A, C and E.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categorySearchNarrowsCountsPerLabel', 0, () => {
      const found = SearchEngine.filterByName(createSeedContacts(), '艾');
      expect(found.length).assertEqual(4);
      expect(SearchEngine.countCategory(found, 'A')).assertEqual(1);
      expect(SearchEngine.countCategory(found, 'C')).assertEqual(0);
      expect(SearchEngine.countCategory(found, 'E')).assertEqual(3);
      expect(SearchEngine.groupByCategory(found).length).assertEqual(2);
      expect(ContactMetrics.from(found).total).assertEqual(4);
    });

    /**
     * @tc.name   categoryEmptyKeywordReturnsDefensiveCopy
     * @tc.desc   Clearing the search field returns every row in a new array that can be mutated safely.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryEmptyKeywordReturnsDefensiveCopy', 0, () => {
      const seed = createSeedContacts();
      const all = SearchEngine.filterByName(seed, '');
      expect(all.length).assertEqual(15);
      all.splice(0, 10);
      expect(all.length).assertEqual(5);
      expect(seed.length).assertEqual(15);
      expect(SearchEngine.filterByName(seed, '').length).assertEqual(15);
      expect(SearchEngine.groupByCategory(seed).length).assertEqual(6);
    });

    /**
     * @tc.name   categorySearchNoMatchReturnsEmpty
     * @tc.desc   A keyword absent from the seed yields an empty projection with no category labels.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categorySearchNoMatchReturnsEmpty', 0, () => {
      const seed = createSeedContacts();
      const found = SearchEngine.filterByName(seed, '不存在');
      expect(found.length).assertEqual(0);
      expect(SearchEngine.groupByCategory(found).length).assertEqual(0);
      expect(ContactMetrics.from(found).categories).assertEqual(0);
      expect(SearchEngine.countCategory(found, 'A')).assertEqual(0);
      expect(seed.length).assertEqual(15);
    });

    /**
     * @tc.name   categorySearchIsLiteralAndCaseSensitive
     * @tc.desc   Latin names match only the same case, because the search uses indexOf on the raw text.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categorySearchIsLiteralAndCaseSensitive', 0, () => {
      const rows = [
        contactOf('Alice', '13500001111', 'alice@example.com', '甲地', '', 'A'),
        contactOf('alice', '13500002222', 'lower@example.com', '乙地', '', 'B')
      ];
      expect(SearchEngine.filterByName(rows, 'Alice').length).assertEqual(1);
      expect(SearchEngine.filterByName(rows, 'alice').length).assertEqual(1);
      expect(SearchEngine.filterByName(rows, 'ALICE').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, 'lic').length).assertEqual(2);
      expect(SearchEngine.filterByName(rows, 'Alice')[0].category).assertEqual('A');
    });

    /**
     * @tc.name   categoryManagerStoresLabelsUnchanged
     * @tc.desc   Seeding the singleton keeps every row category byte for byte equal to the literal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryManagerStoresLabelsUnchanged', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const contacts = manager.getContacts();
      let mismatches = 0;
      for (let index = 0; index < contacts.length; index++) {
        if (contacts[index].category !== seed[index].category) {
          mismatches = mismatches + 1;
        }
      }
      expect(mismatches).assertEqual(0);
      expect(contacts[2].category).assertEqual('B');
      expect(SearchEngine.groupByCategory(contacts).length).assertEqual(6);
      expect(SearchEngine.countCategory(contacts, 'D')).assertEqual(2);
    });

    /**
     * @tc.name   categoryManagerAndStoreParityAfterSeed
     * @tc.desc   After a batch seed the manager and store report identical names and category counts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryManagerAndStoreParityAfterSeed', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      expect(sameStringArray(contactNames(manager.getContacts()), store.names())).assertTrue();
      for (let index = 0; index < CATEGORIES.length; index++) {
        expect(SearchEngine.countCategory(manager.getContacts(), CATEGORIES[index]))
          .assertEqual(SearchEngine.countCategory(store.rows, CATEGORIES[index]));
      }
      expect(store.rowCount()).assertEqual(15);
      expect(manager.getContacts().length).assertEqual(15);
    });

    /**
     * @tc.name   categorySurvivesBucketRoundTrip
     * @tc.desc   Mapping every seed row through a bucket and back preserves the category label.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categorySurvivesBucketRoundTrip', 0, () => {
      const seed = createSeedContacts();
      const restored: Contact[] = [];
      for (let index = 0; index < seed.length; index++) {
        restored.push(ContactMapper.fromBucket(ContactMapper.toBucket(seed[index])));
      }
      expect(sameSnapshotArray(snapshotsOf(restored), snapshotsOf(seed))).assertTrue();
      expect(restored[5].category).assertEqual('C');
      expect(restored[14].category).assertEqual('F');
      expect(SearchEngine.groupByCategory(restored).length).assertEqual(6);
    });

    /**
     * @tc.name   categoryStoreUpdateIgnoresCategoryChange
     * @tc.desc   The UPDATE statement binds phone, email and address only, so the stored label stays.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryStoreUpdateIgnoresCategoryChange', 0, () => {
      store.batchInsert(true, createSeedContacts());
      const edited = cloneContact(createSeedContacts()[0]);
      edited.phone = '13900001111';
      edited.email = 'edited@example.com';
      edited.address = '改后的地址';
      edited.category = 'F';
      const affected = store.updateContact(edited);
      expect(affected).assertEqual(1);
      expect(store.rows[0].phone).assertEqual('13900001111');
      expect(store.rows[0].email).assertEqual('edited@example.com');
      expect(store.rows[0].address).assertEqual('改后的地址');
      expect(store.rows[0].category).assertEqual('A');
      expect(SearchEngine.countCategory(store.rows, 'F')).assertEqual(2);
    });

    /**
     * @tc.name   categoryManagerUpdateReplacesTheLabel
     * @tc.desc   The singleton replaces the whole first match, so its category follows the edited draft.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryManagerUpdateReplacesTheLabel', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const edited = cloneContact(seed[0]);
      edited.category = 'F';
      edited.phone = '13900001111';
      manager.updateContact(edited);
      const actual = manager.getContacts();
      const expected = expectedAfterUpdate(seed, edited);
      expect(actual[0].category).assertEqual('F');
      expect(sameSnapshotArray(snapshotsOf(actual), snapshotsOf(expected))).assertTrue();
      expect(SearchEngine.countCategory(actual, 'A')).assertEqual(1);
      expect(SearchEngine.countCategory(actual, 'F')).assertEqual(3);
    });

    /**
     * @tc.name   categoryDeleteRemovesAllRowsWithTheName
     * @tc.desc   Deleting the duplicated card name removes one C row and leaves the other five C counts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryDeleteRemovesAllRowsWithTheName', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      manager.deleteContact(contactOf('卡梅隆', '', '', ''));
      const actual = manager.getContacts();
      expect(actual.length).assertEqual(14);
      expect(sameStringArray(contactNames(actual), contactNames(expectedAfterDelete(seed, '卡梅隆'))))
        .assertTrue();
      expect(SearchEngine.countCategory(actual, 'C')).assertEqual(2);
      expect(SearchEngine.countCategory(actual, 'A')).assertEqual(2);
      expect(SearchEngine.groupByCategory(actual).length).assertEqual(6);
    });

    /**
     * @tc.name   categoryMetricsReportSixGroups
     * @tc.desc   Metrics read the grouped label count directly from the rows, independent of phone totals.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryMetricsReportSixGroups', 0, () => {
      const metrics = ContactMetrics.from(createSeedContacts());
      expect(metrics.categories).assertEqual(6);
      expect(metrics.total).assertEqual(15);
      expect(metrics.uniqueNames).assertEqual(15);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(ContactMetrics.from(createSeedContacts().slice(0, 2)).categories).assertEqual(1);
      expect(ContactMetrics.from([]).categories).assertEqual(0);
    });

    /**
     * @tc.name   categoryProjectionKeepsLabelsAfterSkip
     * @tc.desc   The cursor projection drops row one but every remaining category label comes through.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryProjectionKeepsLabelsAfterSkip', 0, () => {
      store.batchInsert(true, createSeedContacts());
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(visible.length).assertEqual(14);
      expect(visible[0].category).assertEqual('A');
      expect(visible[13].category).assertEqual('F');
      expect(SearchEngine.groupByCategory(visible).length).assertEqual(6);
      expect(SearchEngine.countCategory(visible, 'A')).assertEqual(1);
      expect(SearchEngine.countCategory(visible, 'B')).assertEqual(3);
    });

    /**
     * @tc.name   categoryAddIntroducesSeventhLabelAtEnd
     * @tc.desc   A new G row appends one group after the six seed labels without reordering them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryAddIntroducesSeventhLabelAtEnd', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('新标签', '13500001111', 'new@example.com', '新地址', '', 'G'));
      const groups = SearchEngine.groupByCategory(manager.getContacts());
      expect(groups.length).assertEqual(7);
      expect(groups[6]).assertEqual('G');
      expect(sameStringArray(groups.slice(0, 6), CATEGORIES)).assertTrue();
      expect(SearchEngine.countCategory(manager.getContacts(), 'G')).assertEqual(1);
    });

    /**
     * @tc.name   categoryDeletingLastOfALabelRemovesTheGroup
     * @tc.desc   Removing the only G row restores the six seed labels in their original order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryDeletingLastOfALabelRemovesTheGroup', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('新标签', '13500001111', 'new@example.com', '新地址', '', 'G'));
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(7);
      manager.deleteContact(contactOf('新标签', '', '', ''));
      const groups = SearchEngine.groupByCategory(manager.getContacts());
      expect(groups.length).assertEqual(6);
      expect(sameStringArray(groups, CATEGORIES)).assertTrue();
      expect(SearchEngine.countCategory(manager.getContacts(), 'G')).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(15);
    });

    /**
     * @tc.name   categorySnapshotCarriesTheLabel
     * @tc.desc   ContactSnapshot copies category and compares it, so labels participate in equality.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categorySnapshotCarriesTheLabel', 0, () => {
      const seed = createSeedContacts();
      const left = snapshotsOf(seed)[0];
      const right = snapshotsOf(seed)[1];
      expect(left.category).assertEqual('A');
      expect(right.category).assertEqual('A');
      expect(left.sameAs(right)).assertFalse();
      expect(left.describe().endsWith('/A')).assertTrue();
      const edited = cloneContact(seed[0]);
      edited.category = 'B';
      expect(snapshotsOf([edited])[0].sameAs(left)).assertFalse();
      expect(snapshotsOf([edited])[0].category).assertEqual('B');
    });

    /**
     * @tc.name   categoryTwoAddsKeepInsertionOrder
     * @tc.desc   Appending H then G keeps H before G because grouping preserves first appearance.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryTwoAddsKeepInsertionOrder', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('八类', '13500001111', 'h@example.com', '八地', '', 'H'));
      manager.addContact(contactOf('七类', '13500002222', 'g@example.com', '七地', '', 'G'));
      const groups = SearchEngine.groupByCategory(manager.getContacts());
      expect(groups.length).assertEqual(8);
      expect(groups[6]).assertEqual('H');
      expect(groups[7]).assertEqual('G');
      expect(SearchEngine.countCategory(manager.getContacts(), 'H')).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(17);
    });

    /**
     * @tc.name   categoryCountsDropToZeroAfterClear
     * @tc.desc   Clearing the singleton zeroes every per-label count and empties the group list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryCountsDropToZeroAfterClear', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      expect(SearchEngine.countCategory(manager.getContacts(), 'B')).assertEqual(3);
      manager.setContacts([]);
      for (let index = 0; index < CATEGORIES.length; index++) {
        expect(SearchEngine.countCategory(manager.getContacts(), CATEGORIES[index])).assertEqual(0);
      }
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(0);
      expect(ContactMetrics.from(manager.getContacts()).fingerprint() > 0).assertTrue();
    });

    /**
     * @tc.name   categoryFilteredSearchNeverInventsLabels
     * @tc.desc   A search that finds only B rows reports one group, not the six seed labels.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryFilteredSearchNeverInventsLabels', 0, () => {
      const found = SearchEngine.filterByName(createSeedContacts(), '贝');
      expect(found.length).assertEqual(1);
      expect(SearchEngine.groupByCategory(found).length).assertEqual(1);
      expect(SearchEngine.countCategory(found, 'B')).assertEqual(1);
      expect(SearchEngine.countCategory(found, 'A')).assertEqual(0);
      expect(SearchEngine.countCategory(found, 'F')).assertEqual(0);
      expect(SearchEngine.groupByCategory(found)[0]).assertEqual('B');
    });

    /**
     * @tc.name   categorySharedPhoneDoesNotMergeGroups
     * @tc.desc   Rows sharing a phone number but differing in label remain in separate groups.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categorySharedPhoneDoesNotMergeGroups', 0, () => {
      const rows = [
        contactOf('同号甲', '13500001111', 'a@example.com', '甲地', '', 'A'),
        contactOf('同号乙', '13500001111', 'b@example.com', '乙地', '', 'B'),
        contactOf('同号丙', '13500001111', 'c@example.com', '丙地', '', 'A')
      ];
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(2);
      expect(SearchEngine.countCategory(rows, 'A')).assertEqual(2);
      expect(SearchEngine.countCategory(rows, 'B')).assertEqual(1);
      expect(ContactMetrics.from(rows).categories).assertEqual(2);
      expect(ContactMetrics.from(rows).total).assertEqual(3);
    });

    /**
     * @tc.name   categorySharedAddressDoesNotMergeGroups
     * @tc.desc   Duplicate addresses across labels stay in their own groups; only name plus phone dedupes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categorySharedAddressDoesNotMergeGroups', 0, () => {
      const rows = [createSeedContacts()[5], createSeedContacts()[8]];
      expect(rows[0].address).assertEqual(rows[1].address);
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(2);
      expect(SearchEngine.countCategory(rows, 'C')).assertEqual(1);
      expect(SearchEngine.countCategory(rows, 'D')).assertEqual(1);
      rows.push(contactOf('另类', '13500004444', 'other@example.com', rows[0].address, '', 'F'));
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(3);
      expect(SearchEngine.countCategory(rows, 'F')).assertEqual(1);
      expect(rows.length).assertEqual(3);
    });

    /**
     * @tc.name   categoryBlankRowsAreCountedApartFromSeed
     * @tc.desc   Two uncategorised rows form one blank bucket of size two while A keeps its two rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryBlankRowsAreCountedApartFromSeed', 0, () => {
      const rows = createSeedContacts();
      rows.push(contactOf('未填甲', '13500001111', 'u1@example.com', '未填地'));
      rows.push(contactOf('未填乙', '13500002222', 'u2@example.com', '未填地'));
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(7);
      expect(SearchEngine.groupByCategory(rows)[6]).assertEqual('');
      expect(SearchEngine.countCategory(rows, '')).assertEqual(2);
      expect(SearchEngine.countCategory(rows, 'A')).assertEqual(2);
      expect(ContactMetrics.from(rows).categories).assertEqual(7);
    });

    /**
     * @tc.name   categoryStoreUpdateKeepsEveryLabelCount
     * @tc.desc   Updating mutable fields through the store leaves all six seed label counts unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryStoreUpdateKeepsEveryLabelCount', 0, () => {
      const seed = createSeedContacts();
      store.batchInsert(true, seed);
      const edited = cloneContact(seed[8]);
      edited.phone = '13900002222';
      edited.email = 'daniel.edited@example.com';
      edited.address = '改后地址';
      expect(store.updateContact(edited)).assertEqual(1);
      for (let index = 0; index < CATEGORIES.length; index++) {
        expect(SearchEngine.countCategory(store.rows, CATEGORIES[index]))
          .assertEqual(SearchEngine.countCategory(seed, CATEGORIES[index]));
      }
      expect(store.rows[0].category).assertEqual('A');
      expect(store.rows[8].category).assertEqual('D');
    });

    /**
     * @tc.name   categoryGroupingIsStableAcrossRepeatedCalls
     * @tc.desc   Calling groupByCategory twice on the same rows returns identical label order and size.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryGroupingIsStableAcrossRepeatedCalls', 0, () => {
      const seed = createSeedContacts();
      const first = SearchEngine.groupByCategory(seed);
      const second = SearchEngine.groupByCategory(seed);
      expect(sameStringArray(first, second)).assertTrue();
      expect(first.length).assertEqual(second.length);
      expect(joined(first, '-')).assertEqual(joined(second, '-'));
      expect(seed.length).assertEqual(15);
      expect(first.length).assertEqual(6);
    });

    /**
     * @tc.name   categoryMetricsAfterDeletingOneLabel
     * @tc.desc   Deleting the only row of a pushed label drops the category count back to six.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryMetricsAfterDeletingOneLabel', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('单行标签', '13500001111', 'only@example.com', '单行地址', '', 'Z'));
      expect(ContactMetrics.from(manager.getContacts()).categories).assertEqual(7);
      manager.deleteContact(contactOf('单行标签', '', '', ''));
      expect(ContactMetrics.from(manager.getContacts()).categories).assertEqual(6);
      expect(SearchEngine.countCategory(manager.getContacts(), 'Z')).assertEqual(0);
      expect(ContactMetrics.from(manager.getContacts()).total).assertEqual(15);
    });

    /**
     * @tc.name   categoryProjectionAfterFrontExtraKeepsSixSeedGroups
     * @tc.desc   Adding a Z row before the batch still yields the six seed labels after the first-row skip.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('categoryProjectionAfterFrontExtraKeepsSixSeedGroups', 0, () => {
      const extra = contactOf('前置', '13500009999', 'front@example.com', '前置地址', '', 'Z');
      store.batchInsert(true, [extra].concat(createSeedContacts()));
      const visible = readContactsFromResultSet(new CursorResultSet(store.query(true)));
      expect(visible.length).assertEqual(15);
      expect(SearchEngine.groupByCategory(visible).length).assertEqual(6);
      expect(SearchEngine.countCategory(visible, 'Z')).assertEqual(0);
      expect(visible[0].category).assertEqual('A');
      expect(SearchEngine.countCategory(visible, 'B')).assertEqual(3);
    });

    /**
     * @tc.name   categoryCustomRowsOverrideSeedCounts
     * @tc.desc   Replacing the seed with three custom rows recalculates every count from scratch.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryCustomRowsOverrideSeedCounts', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const custom = [
        contactOf('甲', '13500001111', 'a@example.com', '甲地', '', 'D'),
        contactOf('乙', '13500002222', 'b@example.com', '乙地', '', 'D'),
        contactOf('丙', '13500003333', 'c@example.com', '丙地', '', 'F')
      ];
      manager.setContacts(custom);
      const groups = SearchEngine.groupByCategory(manager.getContacts());
      expect(groups.length).assertEqual(2);
      expect(sameStringArray(groups, ['D', 'F'])).assertTrue();
      expect(SearchEngine.countCategory(manager.getContacts(), 'D')).assertEqual(2);
      expect(SearchEngine.countCategory(manager.getContacts(), 'A')).assertEqual(0);
    });

    /**
     * @tc.name   categorySeedGroupSizesAreTwoOrThree
     * @tc.desc   Every seed group holds two or three rows, never one and never more than three.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('categorySeedGroupSizesAreTwoOrThree', 0, () => {
      const seed = createSeedContacts();
      let withinBand = 0;
      for (let index = 0; index < CATEGORIES.length; index++) {
        const count = SearchEngine.countCategory(seed, CATEGORIES[index]);
        if (count >= 2 && count <= 3) {
          withinBand = withinBand + 1;
        }
      }
      expect(withinBand).assertEqual(6);
      expect(SearchEngine.countCategory(seed, 'D')).assertEqual(2);
      expect(SearchEngine.countCategory(seed, 'E')).assertEqual(3);
      expect(ContactMetrics.from(seed).categories).assertEqual(6);
    });

    /**
     * @tc.name   categorySingleRowFormsSingleGroup
     * @tc.desc   One contact with a label produces one group, one count and metric category one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categorySingleRowFormsSingleGroup', 0, () => {
      const rows = [contactOf('孤例', '13500001111', 'only@example.com', '孤例地址', '', 'E')];
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(1);
      expect(SearchEngine.groupByCategory(rows)[0]).assertEqual('E');
      expect(SearchEngine.countCategory(rows, 'E')).assertEqual(1);
      expect(SearchEngine.countCategory(rows, 'A')).assertEqual(0);
      expect(ContactMetrics.from(rows).categories).assertEqual(1);
    });

    /**
     * @tc.name   categoryBlankRowsAreRemovedByName
     * @tc.desc   A blank name delete removes only blank rows and leaves the six seed groups intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryBlankRowsAreRemovedByName', 0, () => {
      const manager = ContactManager.getInstance();
      const rows = createSeedContacts();
      rows.push(contactOf('', '13500001111', 'blank@example.com', '空名地址'));
      manager.setContacts(rows);
      expect(SearchEngine.countCategory(manager.getContacts(), '')).assertEqual(1);
      manager.deleteContact(contactOf('', '', '', ''));
      expect(manager.getContacts().length).assertEqual(15);
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(6);
      expect(SearchEngine.countCategory(manager.getContacts(), '')).assertEqual(0);
      expect(sameStringArray(SearchEngine.groupByCategory(manager.getContacts()), CATEGORIES)).assertTrue();
    });

    /**
     * @tc.name   categoryManagerAndStoreDivergeAfterCategoryEdit
     * @tc.desc   The same edit changes the manager label but not the store label, a documented layer difference.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('categoryManagerAndStoreDivergeAfterCategoryEdit', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      store.batchInsert(true, seed);
      const edited = cloneContact(seed[0]);
      edited.category = 'E';
      manager.updateContact(edited);
      store.updateContact(edited);
      expect(manager.getContacts()[0].category).assertEqual('E');
      expect(store.rows[0].category).assertEqual('A');
      expect(SearchEngine.countCategory(manager.getContacts(), 'E')).assertEqual(4);
      expect(SearchEngine.countCategory(store.rows, 'E')).assertEqual(3);
      expect(sameContact(manager.getContacts()[0], store.rows[0])).assertFalse();
    });

    /**
     * @tc.name   categorySnapshotOrderFollowsRowOrder
     * @tc.desc   Snapshot arrays keep row order, so their labels follow the seed order exactly.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categorySnapshotOrderFollowsRowOrder', 0, () => {
      const snapshots = snapshotsOf(createSeedContacts());
      expect(snapshots.length).assertEqual(15);
      expect(snapshots[0].category).assertEqual('A');
      expect(snapshots[1].category).assertEqual('A');
      expect(snapshots[2].category).assertEqual('B');
      expect(snapshots[9].category).assertEqual('D');
      expect(snapshots[14].category).assertEqual('F');
      expect(snapshots[4].sameAs(snapshots[2])).assertFalse();
    });

    /**
     * @tc.name   categoryManagerDeleteDropsRowCountToFourteen
     * @tc.desc   Deleting a C row reduces the directory to fourteen rows while every label still appears.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryManagerDeleteDropsRowCountToFourteen', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('康纳', '', '', ''));
      expect(manager.getContacts().length).assertEqual(14);
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(6);
      expect(SearchEngine.countCategory(manager.getContacts(), 'C')).assertEqual(2);
      expect(SearchEngine.countCategory(manager.getContacts(), 'A')).assertEqual(2);
      expect(ContactMetrics.from(manager.getContacts()).total).assertEqual(14);
    });

    /**
     * @tc.name   categoryDeleteMissingNameLeavesCountsUntouched
     * @tc.desc   Deleting a name absent from the directory changes neither the rows nor any label count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryDeleteMissingNameLeavesCountsUntouched', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('不存在的人', '13000000000', 'none@example.com', '某地'));
      expect(manager.getContacts().length).assertEqual(15);
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(6);
      expect(SearchEngine.countCategory(manager.getContacts(), 'A')).assertEqual(2);
      expect(SearchEngine.countCategory(manager.getContacts(), 'F')).assertEqual(2);
      expect(uniqueStrings(manager.getContacts().map((item: Contact) => item.category)).length)
        .assertEqual(6);
    });

    /**
     * @tc.name   categorySeedLastGroupHoldsTwoRows
     * @tc.desc   The F group closes the seed with two rows, and the final row is the last literal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIntegration scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categorySeedLastGroupHoldsTwoRows', 0, () => {
      const seed = createSeedContacts();
      expect(SearchEngine.countCategory(seed, 'F')).assertEqual(2);
      expect(seed[14].name).assertEqual('法里');
      expect(seed[13].category).assertEqual('F');
      expect(SearchEngine.groupByCategory(seed)[5]).assertEqual('F');
      expect(ContactMetrics.from(seed).total).assertEqual(15);
    });
  });
}
