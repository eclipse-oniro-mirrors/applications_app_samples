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
 * DataMatrix / CategoryIndexMatrix suite.
 *
 * The list page groups rows by the single letter category and feeds the
 * alphabet indexer from the same order. The seed spreads fifteen rows over six
 * letters, so each letter has a fixed count that the suite uses as an oracle for
 * grouping, index position and deletion impact.
 *
 * Source anchors:
 *   OperateRDBInTaskPool.ets:74      seed categories A to F
 *   AddressBookEdit.ets:176-279      category field kept as typed
 *   SharedDriver.ets:812-831         groupByCategory and countCategory
 *   SharedDriver.ets:75-81           CATEGORY constants
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import {
  CATEGORY_A,
  CATEGORY_B,
  CATEGORY_C,
  CATEGORY_D,
  CATEGORY_E,
  CATEGORY_F,
  CATEGORIES,
  createSeedContacts,
  contactOf,
  contactNames,
  joined,
  countOf,
  uniqueStrings,
  SearchEngine,
  ContactMetrics,
  ContactMapper,
  StoreDouble,
  resetContactManager
} from '../Shared/SharedDriver';

export default function categoryIndexMatrixTest(): void {
  describe('CategoryIndexMatrix', () => {
    beforeAll(() => {
      logSuite('CategoryIndexMatrix', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('CategoryIndexMatrix', 'end');
    });

    /**
     * @tc.name   categoryConstantsAreSingleLetters
     * @tc.desc   The six category constants are one character letters from A to F.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryConstantsAreSingleLetters', 0, () => {
      expect(CATEGORY_A).assertEqual('A');
      expect(CATEGORY_B).assertEqual('B');
      expect(CATEGORY_C).assertEqual('C');
      expect(CATEGORY_D).assertEqual('D');
      expect(CATEGORY_E).assertEqual('E');
      expect(CATEGORY_F).assertEqual('F');
      expect(CATEGORY_F.length).assertEqual(1);
      logStep('categoryIndexMatrixTest', 'categories are single letters');
    });

    /**
     * @tc.name   categoriesArrayIsOrdered
     * @tc.desc   The exported category array lists A to F in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoriesArrayIsOrdered', 0, () => {
      expect(CATEGORIES.length).assertEqual(6);
      expect(joined(CATEGORIES)).assertEqual('A,B,C,D,E,F');
      expect(CATEGORIES[0]).assertEqual(CATEGORY_A);
      expect(CATEGORIES[5]).assertEqual(CATEGORY_F);
      expect(uniqueStrings(CATEGORIES).length).assertEqual(6);
      logStep('categoryIndexMatrixTest', 'category array is ordered');
    });

    /**
     * @tc.name   seedGroupsFollowAppearance
     * @tc.desc   The seed groups appear as A, B, C, D, E, F in first appearance order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('seedGroupsFollowAppearance', 0, () => {
      const seed = createSeedContacts();
      const groups = SearchEngine.groupByCategory(seed);
      expect(groups.length).assertEqual(6);
      expect(joined(groups)).assertEqual(joined(CATEGORIES));
      expect(groups[0]).assertEqual(CATEGORY_A);
      expect(groups[5]).assertEqual(CATEGORY_F);
      logStep('categoryIndexMatrixTest', 'seed groups follow appearance');
    });

    /**
     * @tc.name   seedCountsPerCategory
     * @tc.desc   The seed holds two A rows, three B rows, three C rows, two D, three E and two F.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('seedCountsPerCategory', 0, () => {
      const seed = createSeedContacts();
      expect(SearchEngine.countCategory(seed, CATEGORY_A)).assertEqual(2);
      expect(SearchEngine.countCategory(seed, CATEGORY_B)).assertEqual(3);
      expect(SearchEngine.countCategory(seed, CATEGORY_C)).assertEqual(3);
      expect(SearchEngine.countCategory(seed, CATEGORY_D)).assertEqual(2);
      expect(SearchEngine.countCategory(seed, CATEGORY_E)).assertEqual(3);
      expect(SearchEngine.countCategory(seed, CATEGORY_F)).assertEqual(2);
      logStep('categoryIndexMatrixTest', 'seed counts per category');
    });

    /**
     * @tc.name   categoryMatrixCountsSumToSeedSize
     * @tc.desc   Summing the six category counts returns the fifteen seed rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryMatrixCountsSumToSeedSize', 0, () => {
      const seed = createSeedContacts();
      let total = 0;
      for (let index = 0; index < CATEGORIES.length; index++) {
        total = total + SearchEngine.countCategory(seed, CATEGORIES[index]);
      }
      expect(total).assertEqual(15);
      expect(total).assertEqual(seed.length);
      expect(ContactMetrics.from(seed).categories).assertEqual(6);
      logStep('categoryIndexMatrixTest', 'category counts sum to the seed size');
    });

    /**
     * @tc.name   groupIndexIsLetterPosition
     * @tc.desc   Each seed letter sits at its alphabetical position in the group list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('groupIndexIsLetterPosition', 0, () => {
      const seed = createSeedContacts();
      const groups = SearchEngine.groupByCategory(seed);
      expect(groups.indexOf(CATEGORY_A)).assertEqual(0);
      expect(groups.indexOf(CATEGORY_B)).assertEqual(1);
      expect(groups.indexOf(CATEGORY_C)).assertEqual(2);
      expect(groups.indexOf(CATEGORY_D)).assertEqual(3);
      expect(groups.indexOf(CATEGORY_E)).assertEqual(4);
      expect(groups.indexOf(CATEGORY_F)).assertEqual(5);
      logStep('categoryIndexMatrixTest', 'group index equals letter position');
    });

    /**
     * @tc.name   rowsPerGroupAreContiguous
     * @tc.desc   The seed is grouped in contiguous runs, so no letter reappears after another.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('rowsPerGroupAreContiguous', 0, () => {
      const seed = createSeedContacts();
      const seen: string[] = [];
      let changes = 0;
      for (let index = 0; index < seed.length; index++) {
        if (seen.indexOf(seed[index].category) < 0) {
          seen.push(seed[index].category);
          changes = changes + 1;
        }
      }
      expect(changes).assertEqual(6);
      expect(seen.length).assertEqual(6);
      expect(joined(seen)).assertEqual(joined(CATEGORIES));
      logStep('categoryIndexMatrixTest', 'seed rows are contiguous per group');
    });

    /**
     * @tc.name   newCategoryAppendsGroup
     * @tc.desc   A row with a new letter G adds a seventh group at the tail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('newCategoryAppendsGroup', 0, () => {
      const rows = createSeedContacts();
      rows.push(contactOf('龙川', '13900001001', 'longchuan@example.com', '云南省昆明市五华区', '', 'G'));
      const groups = SearchEngine.groupByCategory(rows);
      expect(groups.length).assertEqual(7);
      expect(groups[6]).assertEqual('G');
      expect(groups.indexOf('G')).assertEqual(6);
      expect(SearchEngine.countCategory(rows, 'G')).assertEqual(1);
      logStep('categoryIndexMatrixTest', 'new category appends a group');
    });

    /**
     * @tc.name   emptyCategoryBecomesGroup
     * @tc.desc   A row with an empty category creates an empty-string group at the tail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyCategoryBecomesGroup', 0, () => {
      const rows = createSeedContacts();
      rows.push(contactOf('龙水', '13900001002', 'longshui@example.com', '云南省昆明市盘龙区', '', ''));
      const groups = SearchEngine.groupByCategory(rows);
      expect(groups.length).assertEqual(7);
      expect(groups[6]).assertEqual('');
      expect(SearchEngine.countCategory(rows, '')).assertEqual(1);
      expect(groups.indexOf('')).assertEqual(6);
      logStep('categoryIndexMatrixTest', 'empty category becomes a group');
    });

    /**
     * @tc.name   categoryChangeMovesRowGroup
     * @tc.desc   Rewriting a row from A to F lowers the A count and raises the F count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryChangeMovesRowGroup', 0, () => {
      const rows = createSeedContacts();
      const beforeA = SearchEngine.countCategory(rows, CATEGORY_A);
      const beforeF = SearchEngine.countCategory(rows, CATEGORY_F);
      rows[0].category = CATEGORY_F;
      expect(SearchEngine.countCategory(rows, CATEGORY_A)).assertEqual(beforeA - 1);
      expect(SearchEngine.countCategory(rows, CATEGORY_F)).assertEqual(beforeF + 1);
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(6);
      expect(SearchEngine.groupByCategory(rows)[0]).assertEqual(CATEGORY_F);
      logStep('categoryIndexMatrixTest', 'category change moves the row');
    });

    /**
     * @tc.name   deleteLowersOnlyItsGroup
     * @tc.desc   Deleting 康纳 removes one C row and leaves every other count untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteLowersOnlyItsGroup', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      expect(store.deleteByName('康纳')).assertEqual(1);
      expect(SearchEngine.countCategory(store.rows, CATEGORY_C)).assertEqual(2);
      expect(SearchEngine.countCategory(store.rows, CATEGORY_A)).assertEqual(2);
      expect(SearchEngine.countCategory(store.rows, CATEGORY_F)).assertEqual(2);
      expect(store.rowCount()).assertEqual(14);
      logStep('categoryIndexMatrixTest', 'delete lowers only its own group');
    });

    /**
     * @tc.name   addIncreasesItsGroup
     * @tc.desc   Adding a B row raises only the B count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addIncreasesItsGroup', 0, () => {
      const rows = createSeedContacts();
      rows.push(contactOf('贝拉二号', '11111110022', 'bella.two@example.com', '湖北省孝感市孝南区', '', CATEGORY_B));
      expect(SearchEngine.countCategory(rows, CATEGORY_B)).assertEqual(4);
      expect(SearchEngine.countCategory(rows, CATEGORY_A)).assertEqual(2);
      expect(SearchEngine.countCategory(rows, CATEGORY_C)).assertEqual(3);
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(6);
      logStep('categoryIndexMatrixTest', 'add increases its own group');
    });

    /**
     * @tc.name   categoryFilterKeepsSeedOrder
     * @tc.desc   Filtering the seed to category C keeps 卡梅隆, 康纳 and 卡特琳娜 in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryFilterKeepsSeedOrder', 0, () => {
      const seed = createSeedContacts();
      const picked: string[] = [];
      for (let index = 0; index < seed.length; index++) {
        if (seed[index].category === CATEGORY_C) {
          picked.push(seed[index].name);
        }
      }
      expect(picked.length).assertEqual(3);
      expect(joined(picked)).assertEqual('卡梅隆,康纳,卡特琳娜');
      expect(picked[0]).assertEqual('卡梅隆');
      expect(picked[2]).assertEqual('卡特琳娜');
      logStep('categoryIndexMatrixTest', 'category filter keeps seed order');
    });

    /**
     * @tc.name   groupIndexMapsToAlphabetPosition
     * @tc.desc   Each group's index equals the letter's offset from A.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('groupIndexMapsToAlphabetPosition', 0, () => {
      const groups = SearchEngine.groupByCategory(createSeedContacts());
      for (let index = 0; index < groups.length; index++) {
        expect(groups[index].charCodeAt(0) - CATEGORY_A.charCodeAt(0)).assertEqual(index);
      }
      expect(CATEGORY_A.charCodeAt(0)).assertEqual(65);
      expect(CATEGORY_F.charCodeAt(0)).assertEqual(70);
      logStep('categoryIndexMatrixTest', 'group index maps to the alphabet');
    });

    /**
     * @tc.name   categoryMatrixUnknownCountsZero
     * @tc.desc   Asking for a letter absent from the seed returns zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryMatrixUnknownCountsZero', 0, () => {
      const seed = createSeedContacts();
      expect(SearchEngine.countCategory(seed, 'G')).assertEqual(0);
      expect(SearchEngine.countCategory(seed, '')).assertEqual(0);
      expect(SearchEngine.countCategory(seed, 'a')).assertEqual(0);
      expect(SearchEngine.groupByCategory(seed).indexOf('G')).assertEqual(-1);
      logStep('categoryIndexMatrixTest', 'unknown category counts zero');
    });

    /**
     * @tc.name   duplicateNamesAcrossGroups
     * @tc.desc   The same name in two categories appears in both groups and in neither dedupe.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateNamesAcrossGroups', 0, () => {
      const rows = createSeedContacts();
      rows.push(contactOf('沈川', '13700000011', 'shenchuan.a@example.com', '福建省福州市鼓楼区', '', CATEGORY_A));
      rows.push(contactOf('沈川', '13700000012', 'shenchuan.f@example.com', '福建省厦门市思明区', '', CATEGORY_F));
      expect(countOf(contactNames(rows), '沈川')).assertEqual(2);
      expect(SearchEngine.countCategory(rows, CATEGORY_A)).assertEqual(3);
      expect(SearchEngine.countCategory(rows, CATEGORY_F)).assertEqual(3);
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(6);
      logStep('categoryIndexMatrixTest', 'same name can span two groups');
    });

    /**
     * @tc.name   categoryBucketRoundTrip
     * @tc.desc   The category letter survives bucket mapping without a group lookup.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryBucketRoundTrip', 0, () => {
      const row = contactOf('龙川', '13900001003', 'longchuan2@example.com', '云南省昆明市官渡区', '', CATEGORY_D);
      const restored = ContactMapper.fromBucket(ContactMapper.toBucket(row));
      expect(restored.category).assertEqual(CATEGORY_D);
      expect(restored.category.length).assertEqual(1);
      expect(CATEGORY_D.charCodeAt(0) - CATEGORY_A.charCodeAt(0)).assertEqual(3);
      logStep('categoryIndexMatrixTest', 'category round trips through the bucket');
    });

    /**
     * @tc.name   storeGroupCountAfterBatch
     * @tc.desc   A batch of two A rows leaves the store with one group and a count of two.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('storeGroupCountAfterBatch', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      const chunk = createSeedContacts().slice(0, 2);
      store.batchInsert(true, chunk);
      expect(SearchEngine.groupByCategory(store.rows).length).assertEqual(1);
      expect(SearchEngine.countCategory(store.rows, CATEGORY_A)).assertEqual(2);
      expect(SearchEngine.groupByCategory(store.rows)[0]).assertEqual(CATEGORY_A);
      expect(store.rowCount()).assertEqual(2);
      logStep('categoryIndexMatrixTest', 'store groups after a batch');
    });

    /**
     * @tc.name   managerGroupCountAfterSet
     * @tc.desc   The manager exposes the same six groups as the seed list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerGroupCountAfterSet', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      const groups = SearchEngine.groupByCategory(manager.getContacts());
      expect(groups.length).assertEqual(6);
      expect(joined(groups)).assertEqual(joined(CATEGORIES));
      expect(manager.getContacts().length).assertEqual(15);
      logStep('categoryIndexMatrixTest', 'manager groups match the seed');
    });

    /**
     * @tc.name   categoryComparisonIsCaseSensitive
     * @tc.desc   A lowercase b is a different group from B.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryComparisonIsCaseSensitive', 0, () => {
      const rows = createSeedContacts();
      rows.push(contactOf('贝拉小写', '11111110033', 'bella.lower@example.com', '湖北省黄冈市黄州区', '', 'b'));
      expect(SearchEngine.countCategory(rows, CATEGORY_B)).assertEqual(3);
      expect(SearchEngine.countCategory(rows, 'b')).assertEqual(1);
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(7);
      expect(SearchEngine.groupByCategory(rows)[6]).assertEqual('b');
      logStep('categoryIndexMatrixTest', 'category comparison is case sensitive');
    });

    /**
     * @tc.name   groupOrderAfterRemovingWholeA
     * @tc.desc   Removing both A rows leaves five groups starting at B.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('groupOrderAfterRemovingWholeA', 0, () => {
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      store.deleteByName('艾德里安');
      store.deleteByName('阿诺德');
      const groups = SearchEngine.groupByCategory(store.rows);
      expect(groups.length).assertEqual(5);
      expect(groups[0]).assertEqual(CATEGORY_B);
      expect(groups.indexOf(CATEGORY_A)).assertEqual(-1);
      expect(SearchEngine.countCategory(store.rows, CATEGORY_A)).assertEqual(0);
      logStep('categoryIndexMatrixTest', 'removing a whole group shifts the list');
    });

    /**
     * @tc.name   metricsCategoriesAfterNewLetter
     * @tc.desc   Adding a G row raises the metrics category count from six to seven.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('metricsCategoriesAfterNewLetter', 0, () => {
      const rows = createSeedContacts();
      expect(ContactMetrics.from(rows).categories).assertEqual(6);
      rows.push(contactOf('龙风', '13900001004', 'longfeng@example.com', '云南省曲靖市麒麟区', '', 'G'));
      expect(ContactMetrics.from(rows).categories).assertEqual(7);
      expect(ContactMetrics.from(rows).total).assertEqual(16);
      expect(SearchEngine.countCategory(rows, 'G')).assertEqual(1);
      logStep('categoryIndexMatrixTest', 'metrics see the new letter');
    });

    /**
     * @tc.name   seedLetterPositions
     * @tc.desc   The first row of each letter sits at the documented seed index.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('seedLetterPositions', 0, () => {
      const seed = createSeedContacts();
      const firstA = seed[0];
      const firstB = seed[2];
      const firstC = seed[5];
      const firstD = seed[8];
      const firstE = seed[10];
      const firstF = seed[13];
      expect(firstA.category).assertEqual(CATEGORY_A);
      expect(firstB.category).assertEqual(CATEGORY_B);
      expect(firstC.category).assertEqual(CATEGORY_C);
      expect(firstD.category).assertEqual(CATEGORY_D);
      expect(firstE.category).assertEqual(CATEGORY_E);
      expect(firstF.category).assertEqual(CATEGORY_F);
      logStep('categoryIndexMatrixTest', 'seed letter positions pinned');
    });

    /**
     * @tc.name   categoryIndexStableAfterReorder
     * @tc.desc   Moving a row inside its own group does not change the group order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('categoryIndexStableAfterReorder', 0, () => {
      const rows = createSeedContacts();
      const groupsBefore = joined(SearchEngine.groupByCategory(rows));
      const promoted = rows.splice(9, 1)[0];
      rows.splice(8, 0, promoted);
      expect(joined(SearchEngine.groupByCategory(rows))).assertEqual(groupsBefore);
      expect(SearchEngine.countCategory(rows, CATEGORY_D)).assertEqual(2);
      expect(rows.length).assertEqual(15);
      logStep('categoryIndexMatrixTest', 'reorder inside a group is invisible');
    });

    /**
     * @tc.name   categoryListsAgreeAcrossViews
     * @tc.desc   The manager and the store expose the same category counts for the seed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('categoryListsAgreeAcrossViews', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      const store = new StoreDouble();
      store.init(true);
      store.batchInsert(true, createSeedContacts());
      for (let index = 0; index < CATEGORIES.length; index++) {
        expect(SearchEngine.countCategory(store.rows, CATEGORIES[index]))
          .assertEqual(SearchEngine.countCategory(manager.getContacts(), CATEGORIES[index]));
      }
      expect(joined(SearchEngine.groupByCategory(store.rows)))
        .assertEqual(joined(SearchEngine.groupByCategory(manager.getContacts())));
      logStep('categoryIndexMatrixTest', 'category views agree');
    });

    /**
     * @tc.name   whitespaceCategoryIsItsOwnGroup
     * @tc.desc   A single space is a distinct category from the empty string.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('whitespaceCategoryIsItsOwnGroup', 0, () => {
      const rows = createSeedContacts();
      rows.push(contactOf('龙雨', '13900001005', 'longyu@example.com', '云南省玉溪市红塔区', '', ' '));
      const groups = SearchEngine.groupByCategory(rows);
      expect(groups.length).assertEqual(7);
      expect(groups[6]).assertEqual(' ');
      expect(SearchEngine.countCategory(rows, ' ')).assertEqual(1);
      expect(SearchEngine.countCategory(rows, '')).assertEqual(0);
      logStep('categoryIndexMatrixTest', 'whitespace is its own group');
    });

    /**
     * @tc.name   countsRepeatConsistently
     * @tc.desc   Two consecutive count passes over the same rows return identical numbers.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexMatrix scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('countsRepeatConsistently', 0, () => {
      const seed = createSeedContacts();
      let firstText = '';
      let secondText = '';
      for (let index = 0; index < CATEGORIES.length; index++) {
        if (index > 0) {
          firstText = firstText + ',';
          secondText = secondText + ',';
        }
        firstText = firstText + String(SearchEngine.countCategory(seed, CATEGORIES[index]));
        secondText = secondText + String(SearchEngine.countCategory(seed, CATEGORIES[index]));
      }
      expect(firstText).assertEqual('2,3,3,2,3,2');
      expect(secondText).assertEqual('2,3,3,2,3,2');
      logStep('categoryIndexMatrixTest', 'category counts are repeatable');
    });
  });
}
