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
 * Category grouping index for the contact list.
 *
 * Anchors:
 *   Contact.ets:31-47            category is the sixth field and defaults to ''
 *   CommonConstant.ets:51-53     length constants the seeded rows respect
 *   SharedDriver.ets:75-81       A..F category constants and their order
 *   SharedDriver.ets:90-104      fifteen seeded rows, category letters A..F
 *   SharedDriver.ets:798-831     SearchEngine.filterByName / groupByCategory /
 *                                countCategory
 *   AddressBookList.ets:56-68    the list renders rows in array order and keys
 *                                them by name
 *
 * The page has no explicit category index: the index is whatever order the
 * distinct category values first appear in. These cases pin that order, the
 * per-category counts, and the way a name search narrows the grouping.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import {
  CATEGORIES,
  CATEGORY_A,
  CATEGORY_B,
  CATEGORY_C,
  CATEGORY_D,
  CATEGORY_E,
  CATEGORY_F,
  SearchEngine,
  cloneContact,
  contactOf,
  contactNames,
  countOf,
  createSeedContacts,
  joined,
  resetContactManager,
  sameStringArray,
  uniqueStrings
} from '../Shared/SharedDriver';

/** Renders the grouping index as a single dotted string for comparison. */
function groupTrace(groups: string[]): string {
  return joined(groups, '>');
}

/** Renders one category with its count, for example A:2. */
function categoryTrace(rows: Contact[], category: string): string {
  return category + ':' + String(SearchEngine.countCategory(rows, category));
}

/** Builds count contacts inside one category with distinct names. */
function rowsInCategory(category: string, count: number, prefix: string): Contact[] {
  const rows: Contact[] = [];
  for (let index = 0; index < count; index++) {
    rows.push(contactOf(prefix + String(index), '13800138000', 'bulk@example.com', '批量地址', '', category));
  }
  return rows;
}

/** Concatenates two row arrays without sharing element references. */
function concatRows(left: Contact[], right: Contact[]): Contact[] {
  const rows: Contact[] = [];
  for (let index = 0; index < left.length; index++) {
    rows.push(cloneContact(left[index]));
  }
  for (let index = 0; index < right.length; index++) {
    rows.push(cloneContact(right[index]));
  }
  return rows;
}

export default function categoryIndexValidationTest(): void {
  describe('CategoryIndexValidation', () => {
    beforeAll(() => {
      logSuite('CategoryIndexValidation', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('CategoryIndexValidation', 'end');
    });

    /**
     * @tc.name   categoryConstantsCoverSixLettersInAlphabetOrder
     * @tc.desc   CATEGORIES holds exactly A through F, matching the seeded row spread.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryConstantsCoverSixLettersInAlphabetOrder', 0, () => {
      logStep('CategoryIndexValidation', 'category constant order');
      expect(CATEGORIES.length).assertEqual(6);
      expect(groupTrace(CATEGORIES)).assertEqual('A>B>C>D>E>F');
      expect(CATEGORY_A).assertEqual('A');
      expect(CATEGORY_F).assertEqual('F');
      expect(CATEGORIES.indexOf('G') < 0).assertTrue();
    });

    /**
     * @tc.name   everyCategoryConstantMatchesItsOwnLetter
     * @tc.desc   Each constant is a single letter and no two constants are equal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('everyCategoryConstantMatchesItsOwnLetter', 0, () => {
      const letters: string[] = [CATEGORY_A, CATEGORY_B, CATEGORY_C, CATEGORY_D, CATEGORY_E, CATEGORY_F];
      expect(letters.length).assertEqual(6);
      expect(uniqueStrings(letters).length).assertEqual(6);
      for (let index = 0; index < letters.length; index++) {
        expect(letters[index].length).assertEqual(1);
        expect(letters[index]).assertEqual(CATEGORIES[index]);
      }
      expect(countOf(letters, CATEGORY_C)).assertEqual(1);
    });

    /**
     * @tc.name   seededRowsUseOnlyTheSixKnownCategories
     * @tc.desc   No seed row carries an unknown category letter or an empty category.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('seededRowsUseOnlyTheSixKnownCategories', 0, () => {
      const rows = createSeedContacts();
      expect(rows.length).assertEqual(15);
      let unknown = 0;
      let blank = 0;
      for (let index = 0; index < rows.length; index++) {
        const category = rows[index].category;
        if (category.length === 0) {
          blank = blank + 1;
        }
        if (CATEGORIES.indexOf(category) < 0) {
          unknown = unknown + 1;
        }
      }
      expect(blank).assertEqual(0);
      expect(unknown).assertEqual(0);
      expect(uniqueStrings(SearchEngine.groupByCategory(rows)).length).assertEqual(6);
    });

    /**
     * @tc.name   groupingYieldsSixGroupsInFirstSeenOrder
     * @tc.desc   The seed appears as A, B, C, D, E, F because each pair starts in that order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('groupingYieldsSixGroupsInFirstSeenOrder', 0, () => {
      const rows = createSeedContacts();
      const groups = SearchEngine.groupByCategory(rows);
      expect(groups.length).assertEqual(6);
      expect(sameStringArray(groups, CATEGORIES)).assertTrue();
      expect(groupTrace(groups)).assertEqual('A>B>C>D>E>F');
      expect(groups[0]).assertEqual(CATEGORY_A);
      expect(groups[5]).assertEqual(CATEGORY_F);
    });

    /**
     * @tc.name   categoryACountsTwoSeedRows
     * @tc.desc   The two A rows are the first two seeds, so countCategory returns two.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryACountsTwoSeedRows', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, CATEGORY_A)).assertEqual(2);
      expect(categoryTrace(rows, CATEGORY_A)).assertEqual('A:2');
      expect(SearchEngine.countCategory(rows, CATEGORY_A) < 3).assertTrue();
      expect(SearchEngine.groupByCategory(rows)[0]).assertEqual(CATEGORY_A);
    });

    /**
     * @tc.name   categoryBCountsThreeSeedRows
     * @tc.desc   B holds 贝拉, 本 and 本杰明, three rows between the A and C blocks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryBCountsThreeSeedRows', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, CATEGORY_B)).assertEqual(3);
      expect(categoryTrace(rows, CATEGORY_B)).assertEqual('B:3');
      expect(SearchEngine.countCategory(rows, CATEGORY_B) > SearchEngine.countCategory(rows, CATEGORY_A))
        .assertTrue();
      expect(SearchEngine.countCategory(rows, CATEGORY_B)).assertEqual(3);
    });

    /**
     * @tc.name   categoryCCountsThreeSeedRows
     * @tc.desc   C holds 卡梅隆, 康纳 and 卡特琳娜, all sharing the same three letter spread.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryCCountsThreeSeedRows', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, CATEGORY_C)).assertEqual(3);
      expect(categoryTrace(rows, CATEGORY_C)).assertEqual('C:3');
      expect(SearchEngine.countCategory(rows, CATEGORY_C))
        .assertEqual(SearchEngine.countCategory(rows, CATEGORY_B));
      expect(SearchEngine.countCategory(rows, CATEGORY_C) > 2).assertTrue();
    });

    /**
     * @tc.name   categoryDCountsTwoSeedRows
     * @tc.desc   D holds 丹尼尔 and 戴维维, a smaller block after the C group.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryDCountsTwoSeedRows', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, CATEGORY_D)).assertEqual(2);
      expect(categoryTrace(rows, CATEGORY_D)).assertEqual('D:2');
      expect(SearchEngine.countCategory(rows, CATEGORY_D))
        .assertEqual(SearchEngine.countCategory(rows, CATEGORY_A));
      expect(SearchEngine.countCategory(rows, CATEGORY_D) < 3).assertTrue();
    });

    /**
     * @tc.name   categoryECountsThreeSeedRows
     * @tc.desc   E holds 艾登, 艾拉 and 艾里, the three 艾 names outside the A block.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryECountsThreeSeedRows', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, CATEGORY_E)).assertEqual(3);
      expect(categoryTrace(rows, CATEGORY_E)).assertEqual('E:3');
      expect(SearchEngine.filterByName(rows, '艾').length).assertEqual(4);
      expect(SearchEngine.countCategory(rows, CATEGORY_E) < 4).assertTrue();
    });

    /**
     * @tc.name   categoryFCountsTwoSeedRows
     * @tc.desc   F holds 法比而 and 法里, closing the seed with the same size as A and D.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryFCountsTwoSeedRows', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, CATEGORY_F)).assertEqual(2);
      expect(categoryTrace(rows, CATEGORY_F)).assertEqual('F:2');
      expect(SearchEngine.countCategory(rows, CATEGORY_F))
        .assertEqual(SearchEngine.countCategory(rows, CATEGORY_D));
      expect(SearchEngine.countCategory(rows, CATEGORY_F) > 1).assertTrue();
    });

    /**
     * @tc.name   allCategoryCountsSumToTheSeedLength
     * @tc.desc   The six per-category counts add up to fifteen, with no row counted twice.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('allCategoryCountsSumToTheSeedLength', 0, () => {
      const rows = createSeedContacts();
      let total = 0;
      for (let index = 0; index < CATEGORIES.length; index++) {
        total = total + SearchEngine.countCategory(rows, CATEGORIES[index]);
      }
      expect(total).assertEqual(15);
      expect(total).assertEqual(rows.length);
      expect(total - rows.length).assertEqual(0);
      expect(SearchEngine.countCategory(rows, 'G')).assertEqual(0);
    });

    /**
     * @tc.name   unknownCategoryCountsZero
     * @tc.desc   A letter outside A..F never matches a seeded row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('unknownCategoryCountsZero', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, 'G')).assertEqual(0);
      expect(SearchEngine.countCategory(rows, 'a')).assertEqual(0);
      expect(SearchEngine.countCategory(rows, 'AA')).assertEqual(0);
      expect(SearchEngine.countCategory(rows, '')).assertEqual(0);
      expect(SearchEngine.countCategory(rows, '艾')).assertEqual(0);
    });

    /**
     * @tc.name   unknownCategoryAddsANewGroupAtTheEnd
     * @tc.desc   A row with category G joins the grouping after F, keeping first appearance order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unknownCategoryAddsANewGroupAtTheEnd', 0, () => {
      const rows = concatRows(createSeedContacts(),
        [contactOf('未知', '13800138000', 'unk@example.com', '未知地址', '', 'G')]);
      const groups = SearchEngine.groupByCategory(rows);
      expect(groups.length).assertEqual(7);
      expect(groups[6]).assertEqual('G');
      expect(groupTrace(groups)).assertEqual('A>B>C>D>E>F>G');
      expect(SearchEngine.countCategory(rows, 'G')).assertEqual(1);
      expect(rows.length).assertEqual(16);
    });

    /**
     * @tc.name   emptyCategoryJoinsTheGroupingAfterTheLetters
     * @tc.desc   A blank category is a group of its own and appears at its first position.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyCategoryJoinsTheGroupingAfterTheLetters', 0, () => {
      const rows = concatRows(createSeedContacts(),
        [contactOf('未分类', '13800138000', 'none@example.com', '未分类地址')]);
      const groups = SearchEngine.groupByCategory(rows);
      expect(groups.length).assertEqual(7);
      expect(groups[6]).assertEqual('');
      expect(SearchEngine.countCategory(rows, '')).assertEqual(1);
      expect(SearchEngine.countCategory(rows, CATEGORY_A)).assertEqual(2);
      expect(groupTrace(groups)).assertEqual('A>B>C>D>E>F>');
    });

    /**
     * @tc.name   groupOrderFollowsFirstAppearanceNotAlphabet
     * @tc.desc   A list starting with F yields F first even though F is the last letter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('groupOrderFollowsFirstAppearanceNotAlphabet', 0, () => {
      const rows: Contact[] = [
        contactOf('己一', '13800138000', 'f1@example.com', '地址一', '', CATEGORY_F),
        contactOf('甲一', '13800138000', 'a1@example.com', '地址二', '', CATEGORY_A),
        contactOf('丙一', '13800138000', 'c1@example.com', '地址三', '', CATEGORY_C)
      ];
      const groups = SearchEngine.groupByCategory(rows);
      expect(groupTrace(groups)).assertEqual('F>A>C');
      expect(groups[0]).assertEqual(CATEGORY_F);
      expect(groups.indexOf(CATEGORY_A)).assertEqual(1);
      expect(groups.length).assertEqual(3);
    });

    /**
     * @tc.name   reorderingRowsReversesTheDistinctGroupOrder
     * @tc.desc   Reversing the seed makes the grouping start with F and end with A.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('reorderingRowsReversesTheDistinctGroupOrder', 0, () => {
      const forward = SearchEngine.groupByCategory(createSeedContacts());
      const reversed: Contact[] = [];
      const seed = createSeedContacts();
      for (let index = seed.length - 1; index >= 0; index--) {
        reversed.push(cloneContact(seed[index]));
      }
      const backward = SearchEngine.groupByCategory(reversed);
      expect(groupTrace(forward)).assertEqual('A>B>C>D>E>F');
      expect(groupTrace(backward)).assertEqual('F>E>D>C>B>A');
      expect(backward.length).assertEqual(forward.length);
      expect(backward[0]).assertEqual(CATEGORY_F);
    });

    /**
     * @tc.name   insertingARowIntoACategoryRaisesOnlyThatCount
     * @tc.desc   One extra D row lifts D from two to three while A stays at two.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('insertingARowIntoACategoryRaisesOnlyThatCount', 0, () => {
      const seed = createSeedContacts();
      const withExtra = concatRows(seed, [contactOf('新丁', '13800138000', 'newd@example.com', '新地址', '', CATEGORY_D)]);
      expect(SearchEngine.countCategory(seed, CATEGORY_D)).assertEqual(2);
      expect(SearchEngine.countCategory(withExtra, CATEGORY_D)).assertEqual(3);
      expect(SearchEngine.countCategory(withExtra, CATEGORY_A)).assertEqual(2);
      expect(SearchEngine.groupByCategory(withExtra).length).assertEqual(6);
    });

    /**
     * @tc.name   movingARowBetweenCategoriesShiftsBothCounts
     * @tc.desc   Reassigning one A row to F drops A to one and lifts F to three.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('movingARowBetweenCategoriesShiftsBothCounts', 0, () => {
      const rows = createSeedContacts();
      const mover = rows[0];
      expect(mover.category).assertEqual(CATEGORY_A);
      mover.category = CATEGORY_F;
      expect(SearchEngine.countCategory(rows, CATEGORY_A)).assertEqual(1);
      expect(SearchEngine.countCategory(rows, CATEGORY_F)).assertEqual(3);
      expect(SearchEngine.countCategory(rows, CATEGORY_B)).assertEqual(3);
      const groups = SearchEngine.groupByCategory(rows);
      expect(groupTrace(groups)).assertEqual('F>A>B>C>D>E');
      expect(groups.indexOf(CATEGORY_A)).assertEqual(1);
    });

    /**
     * @tc.name   categoryCountsAreCaseSensitive
     * @tc.desc   Lowercase a and uppercase A are different keys, so lowercase counts zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryCountsAreCaseSensitive', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.countCategory(rows, 'A')).assertEqual(2);
      expect(SearchEngine.countCategory(rows, 'a')).assertEqual(0);
      const lowered = concatRows(rows, [contactOf('小写', '13800138000', 'low@example.com', '地址', '', 'a')]);
      expect(SearchEngine.countCategory(lowered, 'a')).assertEqual(1);
      expect(SearchEngine.countCategory(lowered, 'A')).assertEqual(2);
    });

    /**
     * @tc.name   groupingSkipsDuplicateCategoryValues
     * @tc.desc   Fifteen rows collapse to six groups because only the first appearance is kept.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('groupingSkipsDuplicateCategoryValues', 0, () => {
      const rows = createSeedContacts();
      const groups = SearchEngine.groupByCategory(rows);
      expect(rows.length).assertEqual(15);
      expect(groups.length).assertEqual(6);
      expect(uniqueStrings(groups).length).assertEqual(groups.length);
      expect(groups.length < rows.length).assertTrue();
      expect(groupTrace(groups)).assertEqual('A>B>C>D>E>F');
    });

    /**
     * @tc.name   singleCategoryRowsCollapseToOneGroup
     * @tc.desc   Five rows in B produce the single group B with a count of five.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('singleCategoryRowsCollapseToOneGroup', 0, () => {
      const rows = rowsInCategory(CATEGORY_B, 5, '同类');
      const groups = SearchEngine.groupByCategory(rows);
      expect(groups.length).assertEqual(1);
      expect(groups[0]).assertEqual(CATEGORY_B);
      expect(SearchEngine.countCategory(rows, CATEGORY_B)).assertEqual(5);
      expect(SearchEngine.countCategory(rows, CATEGORY_A)).assertEqual(0);
      expect(groupTrace(groups)).assertEqual('B');
    });

    /**
     * @tc.name   emptyRowListProducesNoGroupsAndZeroCounts
     * @tc.desc   A cleared list has no grouping index and every category counts zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyRowListProducesNoGroupsAndZeroCounts', 0, () => {
      const rows: Contact[] = [];
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(0);
      for (let index = 0; index < CATEGORIES.length; index++) {
        expect(SearchEngine.countCategory(rows, CATEGORIES[index])).assertEqual(0);
      }
      expect(joined(SearchEngine.groupByCategory(rows), '>')).assertEqual('');
      expect(rows.length).assertEqual(0);
    });

    /**
     * @tc.name   nameSearchForAiNarrowsGroupingToAAndE
     * @tc.desc   The four 艾 names live in A and E, so the filtered grouping is A then E.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('nameSearchForAiNarrowsGroupingToAAndE', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '艾');
      expect(hits.length).assertEqual(4);
      const groups = SearchEngine.groupByCategory(hits);
      expect(groupTrace(groups)).assertEqual('A>E');
      expect(SearchEngine.countCategory(hits, CATEGORY_A)).assertEqual(1);
      expect(SearchEngine.countCategory(hits, CATEGORY_E)).assertEqual(3);
      expect(joined(contactNames(hits))).assertEqual('艾德里安,艾登,艾拉,艾里');
    });

    /**
     * @tc.name   nameSearchForKaKeepsOnlyCategoryC
     * @tc.desc   Both 卡 names are in C, so the filtered index has a single group with two rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('nameSearchForKaKeepsOnlyCategoryC', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '卡');
      expect(hits.length).assertEqual(2);
      const groups = SearchEngine.groupByCategory(hits);
      expect(groups.length).assertEqual(1);
      expect(groups[0]).assertEqual(CATEGORY_C);
      expect(SearchEngine.countCategory(hits, CATEGORY_C)).assertEqual(2);
      expect(SearchEngine.countCategory(hits, CATEGORY_A)).assertEqual(0);
    });

    /**
     * @tc.name   nameSearchForBenSpansBothBenRowsInB
     * @tc.desc   Searching 本 matches 本 and 本杰明, both inside category B.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('nameSearchForBenSpansBothBenRowsInB', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '本');
      expect(hits.length).assertEqual(2);
      expect(joined(contactNames(hits))).assertEqual('本,本杰明');
      expect(SearchEngine.groupByCategory(hits)[0]).assertEqual(CATEGORY_B);
      expect(SearchEngine.countCategory(hits, CATEGORY_B)).assertEqual(2);
    });

    /**
     * @tc.name   nameSearchForFaKeepsCategoryF
     * @tc.desc   The two 法 names are the entire F block and survive the filter unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('nameSearchForFaKeepsCategoryF', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '法');
      expect(hits.length).assertEqual(2);
      expect(SearchEngine.groupByCategory(hits)[0]).assertEqual(CATEGORY_F);
      expect(SearchEngine.countCategory(hits, CATEGORY_F)).assertEqual(2);
      expect(SearchEngine.countCategory(rows, CATEGORY_F)).assertEqual(hits.length);
    });

    /**
     * @tc.name   suffixSearchMingKeepsOnlyCategoryB
     * @tc.desc   The name 本杰明 is the only 明 row and it belongs to B.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('suffixSearchMingKeepsOnlyCategoryB', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '明');
      expect(hits.length).assertEqual(1);
      expect(hits[0].name).assertEqual('本杰明');
      expect(hits[0].category).assertEqual(CATEGORY_B);
      expect(SearchEngine.groupByCategory(hits).length).assertEqual(1);
    });

    /**
     * @tc.name   nameSearchWithoutMatchesEmptiesTheGrouping
     * @tc.desc   A keyword that matches no seed name yields no hits, no groups and zero counts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('nameSearchWithoutMatchesEmptiesTheGrouping', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '不存在');
      expect(hits.length).assertEqual(0);
      expect(SearchEngine.groupByCategory(hits).length).assertEqual(0);
      expect(SearchEngine.countCategory(hits, CATEGORY_A)).assertEqual(0);
      expect(SearchEngine.countCategory(hits, CATEGORY_F)).assertEqual(0);
      expect(groupTrace(SearchEngine.groupByCategory(hits))).assertEqual('');
    });

    /**
     * @tc.name   emptyKeywordGroupingEqualsTheSeedGrouping
     * @tc.desc   An empty keyword returns every row, so the index is again A through F.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyKeywordGroupingEqualsTheSeedGrouping', 0, () => {
      const rows = createSeedContacts();
      const all = SearchEngine.filterByName(rows, '');
      const groups = SearchEngine.groupByCategory(all);
      expect(all.length).assertEqual(rows.length);
      expect(groupTrace(groups)).assertEqual(groupTrace(SearchEngine.groupByCategory(rows)));
      expect(groups.length).assertEqual(6);
      expect(SearchEngine.countCategory(all, CATEGORY_B)).assertEqual(3);
    });

    /**
     * @tc.name   categoryIndexGroupCountsReconstructTheHitTotal
     * @tc.desc   Summing the counts of the filtered groups reproduces the filtered row count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryIndexGroupCountsReconstructTheHitTotal', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '艾');
      const groups = SearchEngine.groupByCategory(hits);
      let total = 0;
      for (let index = 0; index < groups.length; index++) {
        total = total + SearchEngine.countCategory(hits, groups[index]);
      }
      expect(total).assertEqual(hits.length);
      expect(total).assertEqual(4);
      expect(total < rows.length).assertTrue();
      expect(groups.length).assertEqual(2);
    });

    /**
     * @tc.name   searchCategoryOrderFollowsTheFilteredRowOrder
     * @tc.desc   Custom rows in C then A then C group as C then A after a shared substring search.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('searchCategoryOrderFollowsTheFilteredRowOrder', 0, () => {
      const rows: Contact[] = [
        contactOf('检索甲', '13800138000', 'a@example.com', '地址一', '', CATEGORY_C),
        contactOf('无关乙', '13800138000', 'b@example.com', '地址二', '', CATEGORY_B),
        contactOf('检索丙', '13800138000', 'c@example.com', '地址三', '', CATEGORY_A),
        contactOf('检索丁', '13800138000', 'd@example.com', '地址四', '', CATEGORY_C)
      ];
      const hits = SearchEngine.filterByName(rows, '检索');
      const groups = SearchEngine.groupByCategory(hits);
      expect(hits.length).assertEqual(3);
      expect(groupTrace(groups)).assertEqual('C>A');
      expect(SearchEngine.countCategory(hits, CATEGORY_C)).assertEqual(2);
      expect(SearchEngine.countCategory(hits, CATEGORY_A)).assertEqual(1);
      expect(SearchEngine.countCategory(hits, CATEGORY_B)).assertEqual(0);
    });

    /**
     * @tc.name   categoryIndexPositionMatchesTheGroupingOrder
     * @tc.desc   indexOf on the grouping reproduces the A..F positions zero through five.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryIndexPositionMatchesTheGroupingOrder', 0, () => {
      const groups = SearchEngine.groupByCategory(createSeedContacts());
      expect(groups.indexOf(CATEGORY_A)).assertEqual(0);
      expect(groups.indexOf(CATEGORY_B)).assertEqual(1);
      expect(groups.indexOf(CATEGORY_C)).assertEqual(2);
      expect(groups.indexOf(CATEGORY_D)).assertEqual(3);
      expect(groups.indexOf(CATEGORY_E)).assertEqual(4);
      expect(groups.indexOf(CATEGORY_F)).assertEqual(5);
    });

    /**
     * @tc.name   removingEveryRowOfACategoryDropsThatGroup
     * @tc.desc   Dropping the three C names shrinks the index to five groups without C.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('removingEveryRowOfACategoryDropsThatGroup', 0, () => {
      const seed = createSeedContacts();
      const kept: Contact[] = [];
      for (let index = 0; index < seed.length; index++) {
        if (seed[index].category !== CATEGORY_C) {
          kept.push(cloneContact(seed[index]));
        }
      }
      const groups = SearchEngine.groupByCategory(kept);
      expect(kept.length).assertEqual(12);
      expect(groups.length).assertEqual(5);
      expect(groups.indexOf(CATEGORY_C) < 0).assertTrue();
      expect(groupTrace(groups)).assertEqual('A>B>D>E>F');
      expect(SearchEngine.countCategory(kept, CATEGORY_C)).assertEqual(0);
    });

    /**
     * @tc.name   groupingDoesNotMutateTheRowArray
     * @tc.desc   groupByCategory reads the category field and leaves row order and values intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('groupingDoesNotMutateTheRowArray', 0, () => {
      const rows = createSeedContacts();
      const before = joined(contactNames(rows));
      const groups = SearchEngine.groupByCategory(rows);
      expect(joined(contactNames(rows))).assertEqual(before);
      expect(rows.length).assertEqual(15);
      expect(groups.length).assertEqual(6);
      expect(rows[0].category).assertEqual(CATEGORY_A);
      expect(rows[14].category).assertEqual(CATEGORY_F);
    });

    /**
     * @tc.name   descendingLetterListGroupsDescending
     * @tc.desc   A hand built list in F, E, D, C, B, A order groups in exactly that order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('descendingLetterListGroupsDescending', 0, () => {
      const rows: Contact[] = [];
      for (let index = CATEGORIES.length - 1; index >= 0; index--) {
        rows.push(contactOf('倒序' + CATEGORIES[index], '13800138000', 'desc@example.com', '倒序地址', '',
          CATEGORIES[index]));
      }
      const groups = SearchEngine.groupByCategory(rows);
      expect(rows.length).assertEqual(6);
      expect(groupTrace(groups)).assertEqual('F>E>D>C>B>A');
      expect(groups[0]).assertEqual(CATEGORY_F);
      expect(SearchEngine.countCategory(rows, CATEGORY_C)).assertEqual(1);
    });

    /**
     * @tc.name   caseSensitiveNameSearchKeepsCategoryAttribution
     * @tc.desc   Searching Ben hits only the B row while ben hits only the A row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('caseSensitiveNameSearchKeepsCategoryAttribution', 0, () => {
      const rows: Contact[] = [
        contactOf('Ben', '13800138000', 'big@example.com', '地址一', '', CATEGORY_B),
        contactOf('ben', '13800138000', 'small@example.com', '地址二', '', CATEGORY_A)
      ];
      const upper = SearchEngine.filterByName(rows, 'Ben');
      const lower = SearchEngine.filterByName(rows, 'ben');
      expect(upper.length).assertEqual(1);
      expect(lower.length).assertEqual(1);
      expect(upper[0].category).assertEqual(CATEGORY_B);
      expect(lower[0].category).assertEqual(CATEGORY_A);
      expect(SearchEngine.groupByCategory(upper)[0]).assertEqual(CATEGORY_B);
    });

    /**
     * @tc.name   countsOfTwoCustomCategoriesStayIndependent
     * @tc.desc   Three A rows and two D rows report three and two regardless of query order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('countsOfTwoCustomCategoriesStayIndependent', 0, () => {
      const rows = concatRows(rowsInCategory(CATEGORY_A, 3, '甲'), rowsInCategory(CATEGORY_D, 2, '丁'));
      expect(rows.length).assertEqual(5);
      expect(SearchEngine.countCategory(rows, CATEGORY_A)).assertEqual(3);
      expect(SearchEngine.countCategory(rows, CATEGORY_D)).assertEqual(2);
      expect(SearchEngine.countCategory(rows, CATEGORY_C)).assertEqual(0);
      expect(groupTrace(SearchEngine.groupByCategory(rows))).assertEqual('A>D');
      expect(SearchEngine.countCategory(rows, CATEGORY_A) + SearchEngine.countCategory(rows, CATEGORY_D))
        .assertEqual(rows.length);
    });

    /**
     * @tc.name   seedCategoryBlocksHoldTheExpectedNameRuns
     * @tc.desc   Each category block is a contiguous run of names in the seed array.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('seedCategoryBlocksHoldTheExpectedNameRuns', 0, () => {
      const rows = createSeedContacts();
      let blocks = 0;
      let previous = '';
      for (let index = 0; index < rows.length; index++) {
        if (rows[index].category !== previous) {
          blocks = blocks + 1;
          previous = rows[index].category;
        }
      }
      expect(blocks).assertEqual(6);
      expect(rows[0].category).assertEqual(CATEGORY_A);
      expect(rows[1].category).assertEqual(CATEGORY_A);
      expect(rows[2].category).assertEqual(CATEGORY_B);
      expect(rows[14].category).assertEqual(CATEGORY_F);
    });

    /**
     * @tc.name   sameNameInTwoCategoriesIsCountedTwice
     * @tc.desc   Two rows that share a name but not a category occupy both groups.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('sameNameInTwoCategoriesIsCountedTwice', 0, () => {
      const rows: Contact[] = [
        contactOf('同名', '13800138000', 'same@example.com', '地址一', '', CATEGORY_A),
        contactOf('同名', '13900139000', 'same@example.com', '地址二', '', CATEGORY_D)
      ];
      const groups = SearchEngine.groupByCategory(rows);
      expect(rows.length).assertEqual(2);
      expect(groups.length).assertEqual(2);
      expect(groupTrace(groups)).assertEqual('A>D');
      expect(SearchEngine.countCategory(rows, CATEGORY_A)).assertEqual(1);
      expect(SearchEngine.countCategory(rows, CATEGORY_D)).assertEqual(1);
      expect(SearchEngine.countCategory(rows, CATEGORY_D) + SearchEngine.countCategory(rows, CATEGORY_A))
        .assertEqual(2);
    });

    /**
     * @tc.name   repeatedGroupingCallsReturnTheSameIndex
     * @tc.desc   Two consecutive calls over the same seed produce identical traces and lengths.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedGroupingCallsReturnTheSameIndex', 0, () => {
      const rows = createSeedContacts();
      const first = SearchEngine.groupByCategory(rows);
      const second = SearchEngine.groupByCategory(rows);
      expect(first.length).assertEqual(second.length);
      expect(groupTrace(first)).assertEqual(groupTrace(second));
      expect(sameStringArray(first, second)).assertTrue();
      expect(groupTrace(first)).assertEqual('A>B>C>D>E>F');
    });

    /**
     * @tc.name   filteredIndexIsASubsetOfTheSeedIndex
     * @tc.desc   Grouping a name search never introduces a letter that the full seed did not have.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('filteredIndexIsASubsetOfTheSeedIndex', 0, () => {
      const rows = createSeedContacts();
      const seedGroups = SearchEngine.groupByCategory(rows);
      const hits = SearchEngine.filterByName(rows, '艾');
      const hitGroups = SearchEngine.groupByCategory(hits);
      let outside = 0;
      for (let index = 0; index < hitGroups.length; index++) {
        if (seedGroups.indexOf(hitGroups[index]) < 0) {
          outside = outside + 1;
        }
      }
      expect(outside).assertEqual(0);
      expect(hitGroups.length < seedGroups.length).assertTrue();
      expect(hitGroups.length).assertEqual(2);
    });

    /**
     * @tc.name   countCategoryIgnoresNameAndPhoneOfTheRow
     * @tc.desc   Only the category field decides the bucket; altering other fields keeps counts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('countCategoryIgnoresNameAndPhoneOfTheRow', 0, () => {
      const rows = concatRows(rowsInCategory(CATEGORY_E, 2, '戊'), rowsInCategory(CATEGORY_B, 1, '乙'));
      const before = SearchEngine.countCategory(rows, CATEGORY_E);
      rows[0].name = '改名不改类';
      rows[0].phone = '19999999999';
      rows[1].address = '新地址';
      expect(SearchEngine.countCategory(rows, CATEGORY_E)).assertEqual(before);
      expect(SearchEngine.countCategory(rows, CATEGORY_E)).assertEqual(2);
      expect(SearchEngine.countCategory(rows, CATEGORY_B)).assertEqual(1);
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(2);
    });

    /**
     * @tc.name   groupIndexLengthMatchesDistinctCategoryCardinality
     * @tc.desc   The index size equals the number of unique category values in the rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the CategoryIndexValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('groupIndexLengthMatchesDistinctCategoryCardinality', 0, () => {
      const mixed: Contact[] = [
        contactOf('一', '13800138000', 'm1@example.com', '地址一', '', CATEGORY_E),
        contactOf('二', '13800138000', 'm2@example.com', '地址二', '', CATEGORY_E),
        contactOf('三', '13800138000', 'm3@example.com', '地址三', '', CATEGORY_B),
        contactOf('四', '13800138000', 'm4@example.com', '地址四', '', CATEGORY_F)
      ];
      const categories: string[] = [];
      for (let index = 0; index < mixed.length; index++) {
        categories.push(mixed[index].category);
      }
      expect(uniqueStrings(categories).length).assertEqual(3);
      expect(SearchEngine.groupByCategory(mixed).length).assertEqual(3);
      expect(groupTrace(SearchEngine.groupByCategory(mixed))).assertEqual('E>B>F');
      expect(SearchEngine.countCategory(mixed, CATEGORY_E)).assertEqual(2);
    });
  });
}
