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
 * ContactCore / ContactCategoryModel suite.
 *
 * The category column is written by the seed literal and read back through
 * SearchEngine.groupByCategory and SearchEngine.countCategory. The suite pins
 * label discovery, per-label counts, the distribution of the fifteen rows and
 * the stability of labels while rows are cloned, updated or removed.
 *
 * Source anchors:
 *   Contact.ets:37,45               category field and constructor slot
 *   OperateRDBInTaskPool.ets:53-69  per-row category literals A-F
 *   ContactManager.ets:56-65        update replaces the whole object
 *   SharedDriver.ets:78-81          CATEGORY_* constants
 *   SharedDriver.ets:812-831        groupByCategory and countCategory
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
  CATEGORIES,
  FIELD_CATEGORY,
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  joined,
  sameStringArray,
  countOf,
  uniqueStrings,
  SearchEngine,
  ContactMetrics,
  ContactMapper,
  resetContactManager
} from '../Shared/SharedDriver';

export default function contactCategoryModelTest(): void {
  describe('ContactCategoryModel', () => {
    beforeAll(() => {
      logSuite('ContactCategoryModel', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('ContactCategoryModel', 'end');
    });

    /**
     * @tc.name   categoryGroupingReturnsSixLabels
     * @tc.desc   The seed rows group into six labels even though fifteen rows are present.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryGroupingReturnsSixLabels', 0, () => {
      const labels = SearchEngine.groupByCategory(createSeedContacts());
      expect(labels.length).assertEqual(6);
      expect(uniqueStrings(labels).length).assertEqual(labels.length);
      expect(joined(labels, '')).assertEqual('ABCDEF');
      expect(labels[0]).assertEqual(CATEGORY_A);
      expect(labels[5]).assertEqual(CATEGORY_F);
      expect(labels.length < 15).assertTrue();
    });

    /**
     * @tc.name   categoryGroupingFollowsFirstEncounterOrder
     * @tc.desc   Labels are emitted the first time a row carries them, not sorted alphabetically.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryGroupingFollowsFirstEncounterOrder', 0, () => {
      const reordered = [
        contactOf('法里', '11111111111', 'katrina@example.com', '吉林省长春市朝阳区', '', 'F'),
        contactOf('贝拉', '11111111111', 'bella@example.com', '湖北省武汉市江汉区', '', 'B'),
        contactOf('艾德里安', '13333333333', 'aidelian@example.com', '江苏省南京市鼓楼区', '', 'A')
      ];
      const labels = SearchEngine.groupByCategory(reordered);
      expect(joined(labels, '')).assertEqual('FBA');
      expect(labels[0]).assertEqual('F');
      expect(labels[2]).assertEqual('A');
      expect(labels.length).assertEqual(3);
      expect(SearchEngine.groupByCategory(createSeedContacts())[0]).assertEqual('A');
    });

    /**
     * @tc.name   categoryGroupingCollapsesRepeatedLabels
     * @tc.desc   Fifteen rows with three B rows still contribute a single B entry to the label list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryGroupingCollapsesRepeatedLabels', 0, () => {
      const rows = createSeedContacts();
      const labels = SearchEngine.groupByCategory(rows);
      expect(countOf(labels, CATEGORY_B)).assertEqual(1);
      expect(countOf(labels, CATEGORY_C)).assertEqual(1);
      expect(SearchEngine.countCategory(rows, CATEGORY_B)).assertEqual(3);
      expect(SearchEngine.countCategory(rows, CATEGORY_C)).assertEqual(3);
      expect(labels.length).assertEqual(uniqueStrings(labels).length);
      expect(labels.indexOf('B')).assertEqual(1);
      expect(labels.indexOf('C')).assertEqual(2);
    });

    /**
     * @tc.name   categoryGroupingOfEmptyListIsEmpty
     * @tc.desc   No rows produce no labels and every concrete label counts zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryGroupingOfEmptyListIsEmpty', 0, () => {
      const empty: Contact[] = [];
      const labels = SearchEngine.groupByCategory(empty);
      expect(labels.length).assertEqual(0);
      expect(labels.indexOf('A')).assertEqual(-1);
      expect(SearchEngine.countCategory(empty, CATEGORY_A)).assertEqual(0);
      expect(SearchEngine.countCategory(empty, CATEGORY_F)).assertEqual(0);
      expect(SearchEngine.countCategory(empty, '')).assertEqual(0);
      expect(joined(labels, ',')).assertEqual('');
      expect(empty.length).assertEqual(0);
      expect(uniqueStrings(labels).length).assertEqual(0);
      expect(SearchEngine.countCategory(empty, '')).assertEqual(0);
    });

    /**
     * @tc.name   categoryGroupingOfSingleRowReturnsThatLabel
     * @tc.desc   A lone D row yields a one element label list and a D count of one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryGroupingOfSingleRowReturnsThatLabel', 0, () => {
      const rows = [createSeedContacts()[9]];
      const labels = SearchEngine.groupByCategory(rows);
      expect(labels.length).assertEqual(1);
      expect(labels[0]).assertEqual(CATEGORY_D);
      expect(SearchEngine.countCategory(rows, CATEGORY_D)).assertEqual(1);
      expect(SearchEngine.countCategory(rows, CATEGORY_C)).assertEqual(0);
      expect(rows[0].name).assertEqual('戴维维');
      expect(rows.length).assertEqual(1);
    });

    /**
     * @tc.name   categoryGroupingKeepsEmptyLabelForDefaultContact
     * @tc.desc   A default Contact carries the empty category, so '' becomes a discoverable label.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryGroupingKeepsEmptyLabelForDefaultContact', 0, () => {
      const rows = createSeedContacts();
      rows.push(new Contact());
      const labels = SearchEngine.groupByCategory(rows);
      expect(labels.length).assertEqual(7);
      expect(labels[6]).assertEqual('');
      expect(SearchEngine.countCategory(rows, '')).assertEqual(1);
      expect(SearchEngine.countCategory(rows, CATEGORY_E)).assertEqual(3);
      expect(labels.indexOf('')).assertEqual(6);
      expect(rows.length).assertEqual(16);
      logStep('categoryModelTest', 'empty category label appended after F');
    });

    /**
     * @tc.name   categoryACountMatchesCatalogGroup
     * @tc.desc   Label A owns two rows and the member names are 艾德里安 and 阿诺德.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryACountMatchesCatalogGroup', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, CATEGORY_A)).assertEqual(2);
      const members = rows.slice(0, 2);
      expect(joined(contactNames(members), '>')).assertEqual('艾德里安>阿诺德');
      expect(countOf(contactNames(rows), '阿诺德')).assertEqual(1);
      expect(members[1].category).assertEqual('A');
      expect(members[1].phone).assertEqual('16666666666');
      expect(CATEGORY_A).assertEqual('A');
    });

    /**
     * @tc.name   categoryBCountMatchesCatalogGroup
     * @tc.desc   Label B owns three rows ending with 本杰明, whose phone matches 阿诺德.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryBCountMatchesCatalogGroup', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, CATEGORY_B)).assertEqual(3);
      const members = rows.slice(2, 5);
      expect(joined(contactNames(members), '>')).assertEqual('贝拉>本>本杰明');
      expect(members[2].phone).assertEqual(rows[1].phone);
      expect(members[2].email).assertEqual('benjieiming@example.com');
      expect(members[0].email).assertEqual('bella@example.com');
      expect(CATEGORY_B).assertEqual('B');
      expect(members[2].category === CATEGORY_A).assertFalse();
    });

    /**
     * @tc.name   categoryCCountMatchesCatalogGroup
     * @tc.desc   Label C owns three rows and 卡特琳娜 closes the group with the katrina mailbox.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryCCountMatchesCatalogGroup', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, CATEGORY_C)).assertEqual(3);
      const members = rows.slice(5, 8);
      expect(joined(contactNames(members), '>')).assertEqual('卡梅隆>康纳>卡特琳娜');
      expect(members[0].email).assertEqual('cameron@example.com');
      expect(members[1].email).assertEqual('connor@example.com');
      expect(members[2].email).assertEqual('katrina@example.com');
      expect(members[2].name.length).assertEqual(4);
      expect(CATEGORY_C).assertEqual('C');
    });

    /**
     * @tc.name   categoryDCountMatchesCatalogGroup
     * @tc.desc   Label D owns two rows, both reusing a C profile with a different category letter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryDCountMatchesCatalogGroup', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, CATEGORY_D)).assertEqual(2);
      const members = rows.slice(8, 10);
      expect(joined(contactNames(members), '>')).assertEqual('丹尼尔>戴维维');
      expect(members[0].email).assertEqual(rows[5].email);
      expect(members[1].email).assertEqual(rows[7].email);
      expect(members[0].category).assertEqual('D');
      expect(members[0].category === rows[5].category).assertFalse();
      expect(CATEGORY_D).assertEqual('D');
    });

    /**
     * @tc.name   categoryECountMatchesCatalogGroup
     * @tc.desc   Label E owns three rows, all opening with the 艾 character and reusing old profiles.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryECountMatchesCatalogGroup', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, CATEGORY_E)).assertEqual(3);
      const members = rows.slice(10, 13);
      expect(joined(contactNames(members), '>')).assertEqual('艾登>艾拉>艾里');
      expect(members[0].name.substring(0, 1)).assertEqual('艾');
      expect(members[2].name.substring(0, 1)).assertEqual('艾');
      expect(members[0].email).assertEqual('cameron@example.com');
      expect(members[2].phone).assertEqual('11111111111');
      expect(CATEGORY_E).assertEqual('E');
    });

    /**
     * @tc.name   categoryFCountMatchesCatalogGroup
     * @tc.desc   Label F owns the final two rows, 法比而 and 法里, and closes the label order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryFCountMatchesCatalogGroup', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, CATEGORY_F)).assertEqual(2);
      const members = rows.slice(13, 15);
      expect(joined(contactNames(members), '>')).assertEqual('法比而>法里');
      expect(members[1].email).assertEqual('katrina@example.com');
      expect(members[0].address).assertEqual('辽宁省沈阳市沈河区');
      expect(members[1].address).assertEqual('吉林省长春市朝阳区');
      expect(SearchEngine.groupByCategory(rows)[5]).assertEqual('F');
      expect(CATEGORY_F).assertEqual('F');
    });

    /**
     * @tc.name   categoryUnknownLabelCountIsZero
     * @tc.desc   Labels outside A-F and the empty label never match a seed row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryUnknownLabelCountIsZero', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, 'G')).assertEqual(0);
      expect(SearchEngine.countCategory(rows, 'Z')).assertEqual(0);
      expect(SearchEngine.countCategory(rows, '')).assertEqual(0);
      expect(SearchEngine.countCategory(rows, 'AA')).assertEqual(0);
      expect(SearchEngine.groupByCategory(rows).indexOf('G')).assertEqual(-1);
      expect(SearchEngine.countCategory(rows, CATEGORY_A)).assertEqual(2);
    });

    /**
     * @tc.name   categoryCountIsCaseSensitive
     * @tc.desc   Lowercase labels never match the uppercase literals stored on the seed rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryCountIsCaseSensitive', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, 'a')).assertEqual(0);
      expect(SearchEngine.countCategory(rows, 'b')).assertEqual(0);
      expect(SearchEngine.countCategory(rows, 'c')).assertEqual(0);
      expect(SearchEngine.countCategory(rows, 'A')).assertEqual(2);
      expect(SearchEngine.countCategory(rows, 'B')).assertEqual(3);
      expect(SearchEngine.groupByCategory(rows).indexOf('a')).assertEqual(-1);
      expect(rows[0].category === rows[0].category.toLowerCase()).assertFalse();
    });

    /**
     * @tc.name   categoryDistributionCoversAllRows
     * @tc.desc   Summing the six label counts equals the row count, leaving no uncategorised row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryDistributionCoversAllRows', 0, () => {
      const rows = createSeedContacts();
      let covered = 0;
      for (let index = 0; index < CATEGORIES.length; index++) {
        covered = covered + SearchEngine.countCategory(rows, CATEGORIES[index]);
      }
      expect(covered).assertEqual(rows.length);
      expect(covered).assertEqual(15);
      expect(covered - SearchEngine.countCategory(rows, CATEGORY_A)).assertEqual(13);
      expect(covered - SearchEngine.countCategory(rows, CATEGORY_B)).assertEqual(12);
      expect(SearchEngine.countCategory(rows, '')).assertEqual(0);
      expect(covered + SearchEngine.countCategory(rows, 'G')).assertEqual(15);
    });

    /**
     * @tc.name   categoryDistributionMatchesMetricCategoryTotal
     * @tc.desc   ContactMetrics.categories agrees with the label count produced by groupByCategory.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryDistributionMatchesMetricCategoryTotal', 0, () => {
      const rows = createSeedContacts();
      const metrics = ContactMetrics.from(rows);
      expect(metrics.categories).assertEqual(SearchEngine.groupByCategory(rows).length);
      expect(metrics.categories).assertEqual(6);
      expect(metrics.total).assertEqual(15);
      const histogram = [2, 3, 3, 2, 3, 2];
      let sum = 0;
      for (let index = 0; index < histogram.length; index++) {
        sum = sum + histogram[index];
        expect(SearchEngine.countCategory(rows, CATEGORIES[index])).assertEqual(histogram[index]);
      }
      expect(sum).assertEqual(metrics.total);
    });

    /**
     * @tc.name   categoryConstantsHoldSixAlphabetLabels
     * @tc.desc   The exported CATEGORY_* values are the single letters A through F used by the page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryConstantsHoldSixAlphabetLabels', 0, () => {
      expect(CATEGORY_A).assertEqual('A');
      expect(CATEGORY_B).assertEqual('B');
      expect(CATEGORY_C).assertEqual('C');
      expect(CATEGORY_D).assertEqual('D');
      expect(CATEGORY_E).assertEqual('E');
      expect(CATEGORY_F).assertEqual('F');
      expect(CATEGORIES.length).assertEqual(6);
      expect(CATEGORY_A.length).assertEqual(1);
    });

    /**
     * @tc.name   categoryConstantsAreInAlphabetOrder
     * @tc.desc   CATEGORIES lists the labels in ascending alphabet order and matches the seed grouping.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryConstantsAreInAlphabetOrder', 0, () => {
      expect(joined(CATEGORIES, '')).assertEqual('ABCDEF');
      expect(CATEGORIES[0]).assertEqual('A');
      expect(CATEGORIES[2]).assertEqual('C');
      expect(CATEGORIES[5]).assertEqual('F');
      expect(sameStringArray(CATEGORIES, SearchEngine.groupByCategory(createSeedContacts()))).assertTrue();
      for (let index = 1; index < CATEGORIES.length; index++) {
        expect(CATEGORIES[index - 1] < CATEGORIES[index]).assertTrue();
      }
      expect(CATEGORIES.indexOf('E')).assertEqual(4);
    });

    /**
     * @tc.name   categoryUniqueLabelsEqualConstants
     * @tc.desc   Deduplicating the discovered labels reproduces the exported CATEGORIES array exactly.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryUniqueLabelsEqualConstants', 0, () => {
      const discovered = SearchEngine.groupByCategory(createSeedContacts());
      const unique = uniqueStrings(discovered);
      expect(unique.length).assertEqual(CATEGORIES.length);
      expect(sameStringArray(unique, CATEGORIES)).assertTrue();
      expect(joined(unique, '')).assertEqual(joined(CATEGORIES, ''));
      expect(unique[1]).assertEqual(CATEGORY_B);
      expect(unique[4]).assertEqual(CATEGORY_E);
      expect(countOf(unique, 'C')).assertEqual(1);
    });

    /**
     * @tc.name   categoryLabelSurvivesClone
     * @tc.desc   cloneContact copies the category verbatim for every seed row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryLabelSurvivesClone', 0, () => {
      const rows = createSeedContacts();
      let matched = 0;
      for (let index = 0; index < rows.length; index++) {
        const copy = cloneContact(rows[index]);
        if (copy.category === rows[index].category) {
          matched = matched + 1;
        }
      }
      expect(matched).assertEqual(15);
      expect(cloneContact(rows[0]).category).assertEqual('A');
      expect(cloneContact(rows[7]).category).assertEqual('C');
      expect(cloneContact(rows[14]).category).assertEqual('F');
      expect(cloneContact(rows[14]) === rows[14]).assertFalse();
      expect(sameContact(cloneContact(rows[9]), rows[9])).assertTrue();
    });

    /**
     * @tc.name   categoryLabelSurvivesPhoneMutationOnClone
     * @tc.desc   Editing phone, email or address on a clone leaves its category and the source intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryLabelSurvivesPhoneMutationOnClone', 0, () => {
      const source = createSeedContacts()[10];
      const copy = cloneContact(source);
      copy.phone = '13900000000';
      copy.email = 'edited@example.com';
      copy.address = '重庆市渝中区';
      expect(copy.category).assertEqual('E');
      expect(source.category).assertEqual('E');
      expect(source.phone).assertEqual('17777777777');
      expect(SearchEngine.countCategory([copy], 'E')).assertEqual(1);
      expect(SearchEngine.countCategory([source], 'E')).assertEqual(1);
      expect(copy.name).assertEqual('艾登');
    });

    /**
     * @tc.name   categoryLabelSurvivesManagerSetAndGet
     * @tc.desc   Storing the seed catalog in the manager and reading it back keeps all six labels.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryLabelSurvivesManagerSetAndGet', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const loaded = manager.getContacts();
      expect(SearchEngine.groupByCategory(loaded).length).assertEqual(6);
      expect(joined(SearchEngine.groupByCategory(loaded), '')).assertEqual('ABCDEF');
      expect(SearchEngine.countCategory(loaded, CATEGORY_D)).assertEqual(2);
      expect(loaded[13].category).assertEqual('F');
      expect(loaded.length).assertEqual(15);
      expect(SearchEngine.countCategory(loaded, CATEGORY_A)).assertEqual(2);
    });

    /**
     * @tc.name   categoryLabelSurvivesManagerUpdate
     * @tc.desc   Updating a row with the same category replaces the object but not the label grouping.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryLabelSurvivesManagerUpdate', 0, () => {
      const manager = ContactManager.getInstance();
      const rows = createSeedContacts();
      manager.setContacts(rows);
      const edited = contactOf('康纳', '10999999999', 'connor@example.com', '辽宁省沈阳市沈河区', '', 'C');
      manager.updateContact(edited);
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(SearchEngine.countCategory(loaded, CATEGORY_C)).assertEqual(3);
      expect(loaded[6].phone).assertEqual('10999999999');
      expect(SearchEngine.groupByCategory(loaded).length).assertEqual(6);
      expect(loaded[6].category).assertEqual('C');
      expect(sameContact(loaded[6], edited)).assertTrue();
    });

    /**
     * @tc.name   categoryLabelChangesWhenUpdateSuppliesNewCategory
     * @tc.desc   Replacing 贝拉 with a D row moves one row from B to D and shifts the counts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryLabelChangesWhenUpdateSuppliesNewCategory', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const moved = contactOf('贝拉', '11111111111', 'bella@example.com', '湖北省武汉市江汉区', '', 'D');
      manager.updateContact(moved);
      const loaded = manager.getContacts();
      expect(SearchEngine.countCategory(loaded, CATEGORY_B)).assertEqual(2);
      expect(SearchEngine.countCategory(loaded, CATEGORY_D)).assertEqual(3);
      expect(SearchEngine.countCategory(loaded, CATEGORY_C)).assertEqual(3);
      expect(SearchEngine.groupByCategory(loaded).length).assertEqual(6);
      expect(loaded[2].category).assertEqual('D');
      expect(sameStringArray(SearchEngine.groupByCategory(loaded), ['A', 'D', 'B', 'C', 'E', 'F'])).assertTrue();
    });

    /**
     * @tc.name   categoryGroupingAfterDeletingAllDRowsDropsD
     * @tc.desc   Removing 丹尼尔 and 戴维维 drops the D label while the other five survive in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryGroupingAfterDeletingAllDRowsDropsD', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('丹尼尔', '', '', '', '', ''));
      manager.deleteContact(contactOf('戴维维', '', '', '', '', ''));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(13);
      expect(SearchEngine.groupByCategory(loaded).length).assertEqual(5);
      expect(joined(SearchEngine.groupByCategory(loaded), '')).assertEqual('ABCEF');
      expect(SearchEngine.countCategory(loaded, CATEGORY_D)).assertEqual(0);
      expect(SearchEngine.countCategory(loaded, CATEGORY_C)).assertEqual(3);
      expect(loaded[8].name).assertEqual('艾登');
    });

    /**
     * @tc.name   categoryGroupingKeepsLabelWhenOneMemberRemoved
     * @tc.desc   Deleting only 艾里 lowers the E count to two and leaves the six label order intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryGroupingKeepsLabelWhenOneMemberRemoved', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const target = manager.getContacts()[12];
      manager.deleteContact(target);
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(14);
      expect(SearchEngine.countCategory(loaded, CATEGORY_E)).assertEqual(2);
      expect(SearchEngine.countCategory(loaded, CATEGORY_F)).assertEqual(2);
      expect(SearchEngine.groupByCategory(loaded).length).assertEqual(6);
      expect(joined(SearchEngine.groupByCategory(loaded), '')).assertEqual('ABCDEF');
      expect(contactNames(loaded).indexOf('艾里')).assertEqual(-1);
      expect(contactNames(loaded).indexOf('艾拉')).assertEqual(11);
    });

    /**
     * @tc.name   categoryGroupingAfterAddingDefaultRowIncludesEmptyLabel
     * @tc.desc   Adding a default contact through the manager adds the empty label after F.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryGroupingAfterAddingDefaultRowIncludesEmptyLabel', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(new Contact());
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(16);
      expect(SearchEngine.groupByCategory(loaded).length).assertEqual(7);
      expect(SearchEngine.groupByCategory(loaded)[6]).assertEqual('');
      expect(SearchEngine.countCategory(loaded, '')).assertEqual(1);
      expect(SearchEngine.countCategory(loaded, CATEGORY_A)).assertEqual(2);
      expect(loaded[15].name).assertEqual('');
      expect(loaded[15].category).assertEqual('');
    });

    /**
     * @tc.name   categoryCountDropsWhenDuplicateNameDeleted
     * @tc.desc   Deleting 贝拉 removes the seed row and the added duplicate, leaving fourteen rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryCountDropsWhenDuplicateNameDeleted', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(contactOf('贝拉', '13900000000', 'bella2@example.com', '天津市和平区', '', 'B'));
      expect(manager.getContacts().length).assertEqual(16);
      expect(SearchEngine.countCategory(manager.getContacts(), CATEGORY_B)).assertEqual(4);
      manager.deleteContact(contactOf('贝拉', '', '', '', '', ''));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(14);
      expect(SearchEngine.countCategory(loaded, CATEGORY_B)).assertEqual(2);
      expect(SearchEngine.groupByCategory(loaded).length).assertEqual(6);
      expect(countOf(contactNames(loaded), '贝拉')).assertEqual(0);
      expect(sameStringArray(contactNames(loaded), contactNames(createSeedContacts()))).assertFalse();
    });

    /**
     * @tc.name   categoryGroupingReflectsRowReversal
     * @tc.desc   Reversing the rows reverses the first-encounter label order but not the counts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryGroupingReflectsRowReversal', 0, () => {
      const rows = createSeedContacts();
      const reversed: Contact[] = [];
      for (let index = rows.length - 1; index >= 0; index--) {
        reversed.push(rows[index]);
      }
      const labels = SearchEngine.groupByCategory(reversed);
      expect(joined(labels, '')).assertEqual('FEDCBA');
      expect(labels.length).assertEqual(6);
      expect(SearchEngine.countCategory(reversed, CATEGORY_A)).assertEqual(2);
      expect(SearchEngine.countCategory(reversed, CATEGORY_B)).assertEqual(3);
      expect(SearchEngine.countCategory(rows, CATEGORY_F)).assertEqual(2);
      expect(reversed[0].name).assertEqual('法里');
      expect(labels[0]).assertEqual('F');
    });

    /**
     * @tc.name   categoryBucketCarriesCategoryColumn
     * @tc.desc   The mapper writes the category under the category key, keeping the value on round-trip.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryBucketCarriesCategoryColumn', 0, () => {
      const row = createSeedContacts()[5];
      const bucket = ContactMapper.toBucket(row);
      expect(bucket.get(FIELD_CATEGORY)).assertEqual('C');
      expect(bucket.has(FIELD_CATEGORY)).assertTrue();
      expect(bucket.keys[5]).assertEqual(FIELD_CATEGORY);
      expect(bucket.size()).assertEqual(6);
      const restored = ContactMapper.fromBucket(bucket);
      expect(restored.category).assertEqual('C');
      expect(SearchEngine.countCategory([restored], CATEGORY_C)).assertEqual(1);
    });

    /**
     * @tc.name   categoryBucketRoundTripKeepsLabelForEveryRow
     * @tc.desc   Mapping all fifteen rows to buckets and back preserves each row's category label.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryBucketRoundTripKeepsLabelForEveryRow', 0, () => {
      const rows = createSeedContacts();
      const buckets = ContactMapper.toBuckets(rows);
      expect(buckets.length).assertEqual(15);
      let matched = 0;
      for (let index = 0; index < buckets.length; index++) {
        const restored = ContactMapper.fromBucket(buckets[index]);
        if (restored.category === rows[index].category) {
          matched = matched + 1;
        }
      }
      expect(matched).assertEqual(15);
      expect(ContactMapper.fromBucket(buckets[0]).category).assertEqual('A');
      expect(ContactMapper.fromBucket(buckets[7]).category).assertEqual('C');
      expect(ContactMapper.fromBucket(buckets[14]).category).assertEqual('F');
      expect(joined(SearchEngine.groupByCategory(rows), '')).assertEqual('ABCDEF');
    });

    /**
     * @tc.name   categoryFilteredSearchKeepsOriginalLabels
     * @tc.desc   Searching the 艾 character returns four rows whose labels stay A, E, E and E.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryFilteredSearchKeepsOriginalLabels', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '艾');
      expect(hits.length).assertEqual(4);
      expect(joined(contactNames(hits), '>')).assertEqual('艾德里安>艾登>艾拉>艾里');
      expect(SearchEngine.groupByCategory(hits).length).assertEqual(2);
      expect(joined(SearchEngine.groupByCategory(hits), '')).assertEqual('AE');
      expect(SearchEngine.countCategory(hits, CATEGORY_E)).assertEqual(3);
      expect(SearchEngine.countCategory(hits, CATEGORY_A)).assertEqual(1);
      expect(SearchEngine.countCategory(rows, CATEGORY_E)).assertEqual(3);
    });

    /**
     * @tc.name   categoryDistributionCountsMatchManualScan
     * @tc.desc   A hand-written scan over the rows produces the same per-label totals as countCategory.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryDistributionCountsMatchManualScan', 0, () => {
      const rows = createSeedContacts();
      for (let index = 0; index < CATEGORIES.length; index++) {
        let scanned = 0;
        for (let inner = 0; inner < rows.length; inner++) {
          if (rows[inner].category === CATEGORIES[index]) {
            scanned = scanned + 1;
          }
        }
        expect(SearchEngine.countCategory(rows, CATEGORIES[index])).assertEqual(scanned);
        expect(scanned > 0).assertTrue();
      }
      expect(SearchEngine.countCategory(rows, CATEGORY_A)).assertEqual(2);
      expect(SearchEngine.countCategory(rows, CATEGORY_F)).assertEqual(2);
    });

    /**
     * @tc.name   categoryOrderStaysStableAfterAppendingKnownLabel
     * @tc.desc   A sixteenth B row raises the B count to four without changing the label order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryOrderStaysStableAfterAppendingKnownLabel', 0, () => {
      const rows = createSeedContacts();
      rows.push(contactOf('本恩', '12345678901', 'benn@example.com', '河北省石家庄市长安区', '', 'B'));
      const labels = SearchEngine.groupByCategory(rows);
      expect(rows.length).assertEqual(16);
      expect(joined(labels, '')).assertEqual('ABCDEF');
      expect(labels.length).assertEqual(6);
      expect(SearchEngine.countCategory(rows, CATEGORY_B)).assertEqual(4);
      expect(SearchEngine.countCategory(rows, CATEGORY_A)).assertEqual(2);
      expect(SearchEngine.countCategory(rows, '')).assertEqual(0);
      expect(rows[15].category).assertEqual('B');
    });

    /**
     * @tc.name   categoryMetricsCategoryCountMatchesDistinctLabels
     * @tc.desc   ContactMetrics.categories and uniqueStrings(groupByCategory) always agree on counts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryMetricsCategoryCountMatchesDistinctLabels', 0, () => {
      const rows = createSeedContacts();
      const metrics = ContactMetrics.from(rows);
      const distinct = uniqueStrings(SearchEngine.groupByCategory(rows));
      expect(metrics.categories).assertEqual(distinct.length);
      expect(metrics.categories).assertEqual(6);
      expect(distinct[0]).assertEqual('A');
      expect(distinct[5]).assertEqual('F');
      const single = ContactMetrics.from([rows[13]]);
      expect(single.categories).assertEqual(1);
      expect(single.total).assertEqual(1);
    });

    /**
     * @tc.name   categoryCountOfEmptyLabelOnSeedIsZero
     * @tc.desc   None of the fifteen seeded rows uses the empty label, so its count is zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('categoryCountOfEmptyLabelOnSeedIsZero', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, '')).assertEqual(0);
      expect(SearchEngine.groupByCategory(rows).indexOf('')).assertEqual(-1);
      let emptyRows = 0;
      for (let index = 0; index < rows.length; index++) {
        if (rows[index].category.length === 0) {
          emptyRows = emptyRows + 1;
        }
      }
      expect(emptyRows).assertEqual(0);
      expect(rows[0].category.length).assertEqual(1);
      expect(rows[14].category.length).assertEqual(1);
      expect(SearchEngine.countCategory(rows, ' ')).assertEqual(0);
    });
    /**
     * @tc.name   categoryCloneAddedThroughManagerCountsInSameBucket
     * @tc.desc   Appending a clone of 法里 raises the F count to three while keeping six labels.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryCloneAddedThroughManagerCountsInSameBucket', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.addContact(cloneContact(createSeedContacts()[14]));
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(16);
      expect(SearchEngine.countCategory(loaded, CATEGORY_F)).assertEqual(3);
      expect(SearchEngine.countCategory(loaded, CATEGORY_E)).assertEqual(3);
      expect(SearchEngine.groupByCategory(loaded).length).assertEqual(6);
      expect(loaded[15].name).assertEqual('法里');
      expect(loaded[15].category).assertEqual('F');
      expect(sameContact(loaded[15], loaded[14])).assertTrue();
    });

    /**
     * @tc.name   categoryDistributionWithEmptyLabelBalancesToRows
     * @tc.desc   After a default row is added the six letters plus the empty label cover all sixteen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('categoryDistributionWithEmptyLabelBalancesToRows', 0, () => {
      const rows = createSeedContacts();
      rows.push(new Contact());
      let covered = 0;
      for (let index = 0; index < CATEGORIES.length; index++) {
        covered = covered + SearchEngine.countCategory(rows, CATEGORIES[index]);
      }
      expect(covered).assertEqual(15);
      covered = covered + SearchEngine.countCategory(rows, '');
      expect(covered).assertEqual(rows.length);
      expect(covered).assertEqual(16);
      expect(SearchEngine.countCategory(rows, '')).assertEqual(1);
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(7);
    });

    /**
     * @tc.name   categoryGroupingDoesNotMutateItsInput
     * @tc.desc   Grouping and counting are read-only: names, order and labels are unchanged afterwards.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('categoryGroupingDoesNotMutateItsInput', 0, () => {
      const rows = createSeedContacts();
      const namesBefore = contactNames(rows);
      const labelsBefore = SearchEngine.groupByCategory(rows);
      SearchEngine.countCategory(rows, CATEGORY_C);
      SearchEngine.countCategory(rows, 'G');
      expect(sameStringArray(contactNames(rows), namesBefore)).assertTrue();
      expect(sameStringArray(SearchEngine.groupByCategory(rows), labelsBefore)).assertTrue();
      expect(rows.length).assertEqual(15);
      expect(rows[0].name).assertEqual('艾德里安');
      expect(rows[14].category).assertEqual('F');
      expect(joined(labelsBefore, '')).assertEqual('ABCDEF');
    });
    /**
     * @tc.name   categoryCountUsesWholeLabelEquality
     * @tc.desc   countCategory compares the whole cell, so prefixed, suffixed or doubled labels miss.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactCategoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('categoryCountUsesWholeLabelEquality', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, 'AB')).assertEqual(0);
      expect(SearchEngine.countCategory(rows, 'A ')).assertEqual(0);
      expect(SearchEngine.countCategory(rows, ' A')).assertEqual(0);
      expect(SearchEngine.countCategory(rows, 'AA')).assertEqual(0);
      expect(SearchEngine.countCategory(rows, 'A')).assertEqual(2);
      expect(rows[0].category.indexOf('A')).assertEqual(0);
      expect(rows[0].category.length).assertEqual(1);
      expect(rows[1].category).assertEqual(rows[0].category);
    });
  });
}
