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
 * Name search semantics behind the list page filter.
 *
 * Anchors:
 *   AddressBookList.ets:52-74    the list renders the filtered array in order and
 *                                keys each item by contact.name
 *   AddressBookList.ets:56-68    every row click routes to the detail page
 *   AddressBookList.ets:76-91    the add button routes to the edit page with a
 *                                fresh Contact
 *   Contact.ets:31-47            name is the field the filter inspects
 *   SharedDriver.ets:798-810     SearchEngine.filterByName: empty keyword returns
 *                                a shallow copy, otherwise indexOf on the name
 *   SharedDriver.ets:812-830     groupByCategory and countCategory used on the
 *                                filtered rows
 *
 * filterByName is a case sensitive substring test on the name field only. An
 * empty keyword is not a wildcard: it returns every row as a copy of the array
 * itself, while a non-empty keyword always builds a new array of cloned rows.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import {
  CATEGORY_A,
  CATEGORY_B,
  CATEGORY_C,
  CATEGORY_E,
  CATEGORY_F,
  SearchEngine,
  contactNames,
  contactOf,
  createSeedContacts,
  joined,
  resetContactManager,
  uniqueStrings
} from '../Shared/SharedDriver';

/** Renders the hit names as a comma separated trace. */
function hitNames(rows: Contact[]): string {
  return joined(contactNames(rows), ',');
}

/** Renders the hit categories as a dotted trace. */
function hitCategories(rows: Contact[]): string {
  return joined(SearchEngine.groupByCategory(rows), '>');
}

/** Filters the seed by keyword and returns the hit names. */
function seedHits(keyword: string): string {
  return hitNames(SearchEngine.filterByName(createSeedContacts(), keyword));
}

/** Filters an arbitrary row list by keyword and returns the hit count. */
function countHits(rows: Contact[], keyword: string): number {
  return SearchEngine.filterByName(rows, keyword).length;
}

export default function searchFilterValidationTest(): void {
  describe('SearchFilterValidation', () => {
    beforeAll(() => {
      logSuite('SearchFilterValidation', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('SearchFilterValidation', 'end');
    });

    /**
     * @tc.name   emptyKeywordReturnsACopyOfTheSameRows
     * @tc.desc   The empty keyword branch uses slice, so the array object differs but the rows match.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyKeywordReturnsACopyOfTheSameRows', 0, () => {
      logStep('SearchFilterValidation', 'empty keyword branch');
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '');
      expect(hits === rows).assertFalse();
      expect(hits.length).assertEqual(rows.length);
      expect(hits.length).assertEqual(15);
      expect(hitNames(hits)).assertEqual(hitNames(rows));
    });

    /**
     * @tc.name   emptyKeywordKeepsTheSourceOrder
     * @tc.desc   The zero argument slice preserves the original fifteen row order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyKeywordKeepsTheSourceOrder', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '');
      expect(hits[0].name).assertEqual('艾德里安');
      expect(hits[1].name).assertEqual('阿诺德');
      expect(hits[14].name).assertEqual('法里');
      expect(hitNames(hits)).assertEqual(hitNames(rows));
    });

    /**
     * @tc.name   exactNameReturnsExactlyOneRow
     * @tc.desc   A full seed name matches only its own row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('exactNameReturnsExactlyOneRow', 0, () => {
      const hits = SearchEngine.filterByName(createSeedContacts(), '康纳');
      expect(hits.length).assertEqual(1);
      expect(hits[0].name).assertEqual('康纳');
      expect(hits[0].category).assertEqual(CATEGORY_C);
      expect(hitNames(hits)).assertEqual('康纳');
    });

    /**
     * @tc.name   prefixKeywordReturnsAllFourAiNames
     * @tc.desc   The single character 艾 prefixes four rows across categories A and E.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('prefixKeywordReturnsAllFourAiNames', 0, () => {
      const hits = SearchEngine.filterByName(createSeedContacts(), '艾');
      expect(hits.length).assertEqual(4);
      expect(seedHits('艾')).assertEqual('艾德里安,艾登,艾拉,艾里');
      expect(hits[0].name).assertEqual('艾德里安');
      expect(hits[3].name).assertEqual('艾里');
    });

    /**
     * @tc.name   middleSubstringMatchesTheCompoundName
     * @tc.desc   The character 杰 appears only inside 本杰明, so one hit is returned.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('middleSubstringMatchesTheCompoundName', 0, () => {
      const hits = SearchEngine.filterByName(createSeedContacts(), '杰');
      expect(hits.length).assertEqual(1);
      expect(hits[0].name).assertEqual('本杰明');
      expect(hits[0].name.indexOf('杰')).assertEqual(1);
      expect(hits[0].category).assertEqual(CATEGORY_B);
    });

    /**
     * @tc.name   suffixKeywordMatchesTheFinalCharacter
     * @tc.desc   A keyword at the end of a name is found because indexOf scans the whole name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('suffixKeywordMatchesTheFinalCharacter', 0, () => {
      const hits = SearchEngine.filterByName(createSeedContacts(), '明');
      expect(hits.length).assertEqual(1);
      expect(hits[0].name).assertEqual('本杰明');
      expect(hits[0].name.endsWith('明')).assertTrue();
      expect(hitCategories(hits)).assertEqual(CATEGORY_B);
    });

    /**
     * @tc.name   unmatchedKeywordReturnsAnEmptyArray
     * @tc.desc   A keyword not present in any seed name yields a fresh empty array.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('unmatchedKeywordReturnsAnEmptyArray', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '无此姓名');
      expect(hits.length).assertEqual(0);
      expect(hits === rows).assertFalse();
      expect(hitNames(hits)).assertEqual('');
      expect(rows.length).assertEqual(15);
    });

    /**
     * @tc.name   singleCharacterBenMatchesTwoRows
     * @tc.desc   本 matches both 本 and 本杰明 because it is a prefix of both.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('singleCharacterBenMatchesTwoRows', 0, () => {
      const hits = SearchEngine.filterByName(createSeedContacts(), '本');
      expect(hits.length).assertEqual(2);
      expect(hitNames(hits)).assertEqual('本,本杰明');
      expect(hits[0].name.length).assertEqual(1);
      expect(hits[1].name.length).assertEqual(3);
      expect(hitCategories(hits)).assertEqual(CATEGORY_B);
    });

    /**
     * @tc.name   kaKeywordMatchesTwoRowsInCategoryC
     * @tc.desc   卡 prefixes 卡梅隆 and 卡特琳娜, both inside the C block.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('kaKeywordMatchesTwoRowsInCategoryC', 0, () => {
      const hits = SearchEngine.filterByName(createSeedContacts(), '卡');
      expect(hits.length).assertEqual(2);
      expect(hitNames(hits)).assertEqual('卡梅隆,卡特琳娜');
      expect(hitCategories(hits)).assertEqual(CATEGORY_C);
      expect(SearchEngine.countCategory(hits, CATEGORY_C)).assertEqual(2);
    });

    /**
     * @tc.name   faKeywordMatchesTwoRowsInCategoryF
     * @tc.desc   法 prefixes 法比而 and 法里, the whole F block.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('faKeywordMatchesTwoRowsInCategoryF', 0, () => {
      const hits = SearchEngine.filterByName(createSeedContacts(), '法');
      expect(hits.length).assertEqual(2);
      expect(hitNames(hits)).assertEqual('法比而,法里');
      expect(hitCategories(hits)).assertEqual(CATEGORY_F);
      expect(SearchEngine.countCategory(hits, CATEGORY_A)).assertEqual(0);
    });

    /**
     * @tc.name   matchingIsCaseSensitiveForLatinNames
     * @tc.desc   A keyword in one case never matches a name stored in the other case.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('matchingIsCaseSensitiveForLatinNames', 0, () => {
      const rows: Contact[] = [
        contactOf('Ben', '13800138000', 'big@example.com', '地址一', '', CATEGORY_A),
        contactOf('ben', '13900139000', 'small@example.com', '地址二', '', CATEGORY_B)
      ];
      const upper = SearchEngine.filterByName(rows, 'Ben');
      const lower = SearchEngine.filterByName(rows, 'ben');
      const mixed = SearchEngine.filterByName(rows, 'BEN');
      expect(upper.length).assertEqual(1);
      expect(lower.length).assertEqual(1);
      expect(mixed.length).assertEqual(0);
      expect(upper[0].category).assertEqual(CATEGORY_A);
      expect(lower[0].category).assertEqual(CATEGORY_B);
    });

    /**
     * @tc.name   uppercaseKeywordMatchesOnlyTheUppercaseRow
     * @tc.desc   Searching the fully uppercase form misses the mixed case name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('uppercaseKeywordMatchesOnlyTheUppercaseRow', 0, () => {
      const rows: Contact[] = [
        contactOf('ALICE', '13800138000', 'a@example.com', '地址一', '', CATEGORY_A),
        contactOf('Alice', '13900139000', 'b@example.com', '地址二', '', CATEGORY_B)
      ];
      expect(SearchEngine.filterByName(rows, 'ALICE').length).assertEqual(1);
      expect(SearchEngine.filterByName(rows, 'ALICE')[0].name).assertEqual('ALICE');
      expect(SearchEngine.filterByName(rows, 'alice').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, 'Alice').length).assertEqual(1);
    });

    /**
     * @tc.name   filterResultIsACloneOfEachRow
     * @tc.desc   Mutating a hit does not change the source row, because clones are returned.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('filterResultIsACloneOfEachRow', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '艾');
      expect(hits[0] === rows[0]).assertFalse();
      hits[0].phone = '10000000000';
      hits[0].name = '被改名的命中行';
      expect(rows[0].phone).assertEqual('13333333333');
      expect(rows[0].name).assertEqual('艾德里安');
      expect(rows.length).assertEqual(15);
    });

    /**
     * @tc.name   filterResultKeepsCategoryAndContactFields
     * @tc.desc   A cloned hit carries the same six field values as the source row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('filterResultKeepsCategoryAndContactFields', 0, () => {
      const rows = createSeedContacts();
      const hit = SearchEngine.filterByName(rows, '阿诺德')[0];
      expect(hit.name).assertEqual(rows[1].name);
      expect(hit.phone).assertEqual(rows[1].phone);
      expect(hit.email).assertEqual(rows[1].email);
      expect(hit.address).assertEqual(rows[1].address);
      expect(hit.category).assertEqual(rows[1].category);
      expect(hit.avatar).assertEqual(rows[1].avatar);
    });

    /**
     * @tc.name   searchingAnEmptyListReturnsNoRows
     * @tc.desc   A cleared list has nothing to match, even for an empty keyword.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('searchingAnEmptyListReturnsNoRows', 0, () => {
      const rows: Contact[] = [];
      expect(SearchEngine.filterByName(rows, '').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '艾').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, 'anything').length).assertEqual(0);
      expect(rows.length).assertEqual(0);
    });

    /**
     * @tc.name   keywordLongerThanEveryNameReturnsNothing
     * @tc.desc   A full sentence cannot be a substring of any three character name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('keywordLongerThanEveryNameReturnsNothing', 0, () => {
      const keyword = '这是一个非常长的搜索关键字';
      const hits = SearchEngine.filterByName(createSeedContacts(), keyword);
      expect(keyword.length > 10).assertTrue();
      expect(hits.length).assertEqual(0);
      expect(hitNames(hits)).assertEqual('');
      expect(countHits(createSeedContacts(), keyword)).assertEqual(0);
    });

    /**
     * @tc.name   whitespaceKeywordMatchesNoSeedName
     * @tc.desc   No seeded name contains a space, so a single space yields zero hits.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('whitespaceKeywordMatchesNoSeedName', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.filterByName(rows, ' ').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '  ').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '\t').length).assertEqual(0);
      expect(rows.length).assertEqual(15);
    });

    /**
     * @tc.name   customNameWithAnInnerSpaceMatchesThatSpace
     * @tc.desc   A keyword containing a space finds a name that stores the same space.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('customNameWithAnInnerSpaceMatchesThatSpace', 0, () => {
      const rows: Contact[] = [contactOf('王 小明', '13800138000', 'wang@example.com', '地址', '', CATEGORY_A)];
      expect(SearchEngine.filterByName(rows, ' ').length).assertEqual(1);
      expect(SearchEngine.filterByName(rows, '王 ').length).assertEqual(1);
      expect(SearchEngine.filterByName(rows, '王  小').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '小明').length).assertEqual(1);
    });

    /**
     * @tc.name   repeatedSearchesReturnTheSameResult
     * @tc.desc   Three identical keyword calls produce identical hit traces and counts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedSearchesReturnTheSameResult', 0, () => {
      const rows = createSeedContacts();
      const first = hitNames(SearchEngine.filterByName(rows, '艾'));
      const second = hitNames(SearchEngine.filterByName(rows, '艾'));
      const third = hitNames(SearchEngine.filterByName(rows, '艾'));
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
      expect(first).assertEqual('艾德里安,艾登,艾拉,艾里');
      expect(countHits(rows, '艾')).assertEqual(4);
    });

    /**
     * @tc.name   latinCategoryLettersMatchNoSeedName
     * @tc.desc   Category letters appear only in the category field, so searching them finds nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('latinCategoryLettersMatchNoSeedName', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.filterByName(rows, 'A').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, 'B').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, 'F').length).assertEqual(0);
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(6);
    });

    /**
     * @tc.name   filteredGroupCountsReconstructTheHitTotal
     * @tc.desc   Summing category counts over the hits reproduces the hit array length.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('filteredGroupCountsReconstructTheHitTotal', 0, () => {
      const hits = SearchEngine.filterByName(createSeedContacts(), '艾');
      const groups = SearchEngine.groupByCategory(hits);
      let total = 0;
      for (let index = 0; index < groups.length; index++) {
        total = total + SearchEngine.countCategory(hits, groups[index]);
      }
      expect(total).assertEqual(hits.length);
      expect(total).assertEqual(4);
      expect(groups.length).assertEqual(2);
      expect(groups[0]).assertEqual(CATEGORY_A);
    });

    /**
     * @tc.name   aiSearchGroupsIntoCategoryAThenE
     * @tc.desc   The four 艾 hits split one into A and three into E, in first seen order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('aiSearchGroupsIntoCategoryAThenE', 0, () => {
      const hits = SearchEngine.filterByName(createSeedContacts(), '艾');
      expect(hitCategories(hits)).assertEqual('A>E');
      expect(SearchEngine.countCategory(hits, CATEGORY_A)).assertEqual(1);
      expect(SearchEngine.countCategory(hits, CATEGORY_E)).assertEqual(3);
      expect(SearchEngine.countCategory(hits, CATEGORY_A) + SearchEngine.countCategory(hits, CATEGORY_E))
        .assertEqual(4);
    });

    /**
     * @tc.name   searchResultOrderFollowsTheSourceOrder
     * @tc.desc   Hits keep the seed order even though A and E are not adjacent blocks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('searchResultOrderFollowsTheSourceOrder', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '艾');
      expect(hits[0].name).assertEqual('艾德里安');
      expect(hits[1].name).assertEqual('艾登');
      expect(hits[2].name).assertEqual('艾拉');
      expect(hits[3].name).assertEqual('艾里');
      expect(hits[1].category).assertEqual(CATEGORY_E);
    });

    /**
     * @tc.name   categoryValueIsNotPartOfTheSearch
     * @tc.desc   A keyword equal to a category is never matched against the category field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('categoryValueIsNotPartOfTheSearch', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, CATEGORY_C);
      expect(hits.length).assertEqual(0);
      expect(SearchEngine.countCategory(rows, CATEGORY_C)).assertEqual(3);
      expect(hits === rows).assertFalse();
    });

    /**
     * @tc.name   phoneValueIsNotPartOfTheSearch
     * @tc.desc   Searching a phone prefix never inspects the phone field of any row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('phoneValueIsNotPartOfTheSearch', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '13333333333');
      expect(hits.length).assertEqual(0);
      expect(rows[0].phone).assertEqual('13333333333');
      expect(SearchEngine.filterByName(rows, '133').length).assertEqual(0);
    });

    /**
     * @tc.name   duplicateNamesInTheSourceAreBothReturned
     * @tc.desc   The filter does not dedupe, so two rows with the same name both come back.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('duplicateNamesInTheSourceAreBothReturned', 0, () => {
      const rows: Contact[] = [
        contactOf('重复名', '13800138000', 'one@example.com', '地址一', '', CATEGORY_A),
        contactOf('重复名', '13900139000', 'two@example.com', '地址二', '', CATEGORY_B)
      ];
      const hits = SearchEngine.filterByName(rows, '重复名');
      expect(hits.length).assertEqual(2);
      expect(hits[0].phone).assertEqual('13800138000');
      expect(hits[1].phone).assertEqual('13900139000');
      expect(uniqueStrings(contactNames(hits)).length).assertEqual(1);
    });

    /**
     * @tc.name   keywordIsNotTrimmedBeforeMatching
     * @tc.desc   A leading space makes the keyword different, so 艾 with a prefix misses.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('keywordIsNotTrimmedBeforeMatching', 0, () => {
      const rows = createSeedContacts();
      const padded = ' 艾';
      expect(padded.trim()).assertEqual('艾');
      expect(SearchEngine.filterByName(rows, padded).length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '艾 ').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '艾').length).assertEqual(4);
    });

    /**
     * @tc.name   keywordEqualToTheWholeNameIsASingleHit
     * @tc.desc   A complete name matches just itself and not its longer neighbours.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('keywordEqualToTheWholeNameIsASingleHit', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.filterByName(rows, '本').length).assertEqual(2);
      expect(SearchEngine.filterByName(rows, '本杰明').length).assertEqual(1);
      expect(SearchEngine.filterByName(rows, '本杰明')[0].name).assertEqual('本杰明');
      expect(hitNames(SearchEngine.filterByName(rows, '本杰明'))).assertEqual('本杰明');
    });

    /**
     * @tc.name   longerKeywordNeverWidensTheResult
     * @tc.desc   Extending a prefix keyword cannot add hits, only keep or drop them.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('longerKeywordNeverWidensTheResult', 0, () => {
      const rows = createSeedContacts();
      const one = countHits(rows, '本');
      const two = countHits(rows, '本杰');
      const three = countHits(rows, '本杰明');
      expect(one).assertEqual(2);
      expect(two).assertEqual(1);
      expect(three).assertEqual(1);
      expect(two <= one).assertTrue();
      expect(three <= two).assertTrue();
    });

    /**
     * @tc.name   managerAddThenSearchFindsTheNewRow
     * @tc.desc   A row appended to the singleton becomes visible to the name filter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerAddThenSearchFindsTheNewRow', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      const added = contactOf('新增可搜', '13500135000', 'added@example.com', '新增地址', '', CATEGORY_B);
      expect(SearchEngine.filterByName(manager.getContacts(), '新增').length).assertEqual(0);
      manager.addContact(added);
      const hits = SearchEngine.filterByName(manager.getContacts(), '新增');
      expect(manager.getContacts().length).assertEqual(16);
      expect(hits.length).assertEqual(1);
      expect(hits[0].name).assertEqual('新增可搜');
      expect(hits[0].category).assertEqual(CATEGORY_B);
    });

    /**
     * @tc.name   managerDeleteThenSearchLosesTheRow
     * @tc.desc   Removing a row through the singleton removes it from later search results.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerDeleteThenSearchLosesTheRow', 0, () => {
      const seed = createSeedContacts();
      const manager = resetContactManager(seed);
      expect(SearchEngine.filterByName(manager.getContacts(), '艾').length).assertEqual(4);
      manager.deleteContact(seed[0]);
      const hits = SearchEngine.filterByName(manager.getContacts(), '艾');
      expect(manager.getContacts().length).assertEqual(14);
      expect(hits.length).assertEqual(3);
      expect(hitNames(hits)).assertEqual('艾登,艾拉,艾里');
      expect(SearchEngine.filterByName(manager.getContacts(), '艾德里安').length).assertEqual(0);
    });

    /**
     * @tc.name   twoCharacterMiddleSubstringMatches
     * @tc.desc   梅隆 is a two unit substring inside 卡梅隆 and yields one hit.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoCharacterMiddleSubstringMatches', 0, () => {
      const hits = SearchEngine.filterByName(createSeedContacts(), '梅隆');
      expect(hits.length).assertEqual(1);
      expect(hits[0].name).assertEqual('卡梅隆');
      expect(hits[0].name.indexOf('梅隆')).assertEqual(1);
      expect(hitCategories(hits)).assertEqual(CATEGORY_C);
    });

    /**
     * @tc.name   emojiInTheNameIsSearchable
     * @tc.desc   A keyword of one emoji uses code unit matching and finds the stored name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emojiInTheNameIsSearchable', 0, () => {
      const rows: Contact[] = [
        contactOf('小明\u{1F600}', '13800138000', 'emoji@example.com', '地址', '', CATEGORY_A),
        contactOf('小红', '13900139000', 'plain@example.com', '地址', '', CATEGORY_B)
      ];
      const hits = SearchEngine.filterByName(rows, '\u{1F600}');
      expect(hits.length).assertEqual(1);
      expect(hits[0].name).assertEqual('小明\u{1F600}');
      expect(rows[0].name.length).assertEqual(4);
      expect(SearchEngine.filterByName(rows, '小明').length).assertEqual(1);
    });

    /**
     * @tc.name   firstBlockCharactersReturnTheirExpectedCounts
     * @tc.desc   Five block leading characters map to four, two, two, one and two hits.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('firstBlockCharactersReturnTheirExpectedCounts', 0, () => {
      const rows = createSeedContacts();
      const keywords: string[] = ['艾', '贝', '卡', '丹', '法'];
      const expected: number[] = [4, 1, 2, 1, 2];
      let matched = 0;
      for (let index = 0; index < keywords.length; index++) {
        if (countHits(rows, keywords[index]) === expected[index]) {
          matched = matched + 1;
        }
      }
      expect(matched).assertEqual(5);
      expect(keywords.length).assertEqual(5);
      expect(countHits(rows, '丹')).assertEqual(1);
    });

    /**
     * @tc.name   searchAfterAManagerResetFindsNothing
     * @tc.desc   Clearing the singleton leaves the filter with no rows to return.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('searchAfterAManagerResetFindsNothing', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      expect(SearchEngine.filterByName(manager.getContacts(), '艾').length).assertEqual(4);
      resetContactManager();
      const rows = manager.getContacts();
      expect(rows.length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '艾').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '').length).assertEqual(0);
    });

    /**
     * @tc.name   keywordWithANewlineMatchesNothing
     * @tc.desc   A newline is not part of any seeded name, so the result is empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('keywordWithANewlineMatchesNothing', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.filterByName(rows, '\n').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '艾\n').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '法里\n').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '法里').length).assertEqual(1);
    });

    /**
     * @tc.name   exactMatchOfTheLastRowWorks
     * @tc.desc   The final seeded name is found by an exact keyword and by its suffix.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('exactMatchOfTheLastRowWorks', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '法里');
      expect(hits.length).assertEqual(1);
      expect(hits[0].name).assertEqual(rows[14].name);
      expect(SearchEngine.filterByName(rows, '里').length).assertEqual(3);
      expect(SearchEngine.filterByName(rows, '而').length).assertEqual(1);
    });

    /**
     * @tc.name   eachCallReturnsANewResultArray
     * @tc.desc   Non-empty keyword calls never return the same array object.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('eachCallReturnsANewResultArray', 0, () => {
      const rows = createSeedContacts();
      const first = SearchEngine.filterByName(rows, '艾');
      const second = SearchEngine.filterByName(rows, '艾');
      expect(first === second).assertFalse();
      expect(first.length).assertEqual(second.length);
      expect(first[0] === second[0]).assertFalse();
      expect(first[0].name).assertEqual(second[0].name);
    });

    /**
     * @tc.name   emptyKeywordSharesRowReferencesWithTheSource
     * @tc.desc   The slice branch copies the array but not the rows, unlike a keyword search.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emptyKeywordSharesRowReferencesWithTheSource', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '');
      expect(hits === rows).assertFalse();
      expect(hits[0] === rows[0]).assertTrue();
      hits[0].phone = '10000000000';
      expect(rows[0].phone).assertEqual('10000000000');
      const cloned = SearchEngine.filterByName(rows, '艾')[0];
      cloned.phone = '12222222222';
      expect(rows[0].phone).assertEqual('10000000000');
    });

    /**
     * @tc.name   longSuffixOfANameIsFound
     * @tc.desc   特琳娜 is a three unit suffix inside 卡特琳娜 and matches once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longSuffixOfANameIsFound', 0, () => {
      const hits = SearchEngine.filterByName(createSeedContacts(), '特琳娜');
      expect(hits.length).assertEqual(1);
      expect(hits[0].name).assertEqual('卡特琳娜');
      expect(hits[0].name.endsWith('特琳娜')).assertTrue();
      expect(hits[0].category).assertEqual(CATEGORY_C);
    });

    /**
     * @tc.name   unmatchedKeywordYieldsNoGroupsAndZeroCounts
     * @tc.desc   An empty hit list produces no category index and zero counts for every letter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unmatchedKeywordYieldsNoGroupsAndZeroCounts', 0, () => {
      const hits = SearchEngine.filterByName(createSeedContacts(), '零命中');
      expect(hits.length).assertEqual(0);
      expect(SearchEngine.groupByCategory(hits).length).assertEqual(0);
      expect(SearchEngine.countCategory(hits, CATEGORY_A)).assertEqual(0);
      expect(SearchEngine.countCategory(hits, CATEGORY_F)).assertEqual(0);
      expect(hitCategories(hits)).assertEqual('');
    });

    /**
     * @tc.name   singleSharedCharacterReturnsBothCustomRows
     * @tc.desc   Two names that both contain 小 are both returned in source order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('singleSharedCharacterReturnsBothCustomRows', 0, () => {
      const rows: Contact[] = [
        contactOf('小甲', '13800138000', 'a@example.com', '地址一', '', CATEGORY_A),
        contactOf('乙小', '13900139000', 'b@example.com', '地址二', '', CATEGORY_B),
        contactOf('丙丁', '13700137000', 'c@example.com', '地址三', '', CATEGORY_C)
      ];
      const hits = SearchEngine.filterByName(rows, '小');
      expect(hits.length).assertEqual(2);
      expect(hitNames(hits)).assertEqual('小甲,乙小');
      expect(hitCategories(hits)).assertEqual('A>B');
      expect(countHits(rows, '丙')).assertEqual(1);
    });

    /**
     * @tc.name   everyCharacterOfASeedNameMatchesAtLeastOneRow
     * @tc.desc   Each unit of 艾德里安 appears in some row, so no character is a dead end.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('everyCharacterOfASeedNameMatchesAtLeastOneRow', 0, () => {
      const rows = createSeedContacts();
      const name = '艾德里安';
      let matched = 0;
      for (let index = 0; index < name.length; index++) {
        const keyword = name.substring(index, index + 1);
        if (countHits(rows, keyword) > 0) {
          matched = matched + 1;
        }
      }
      expect(name.length).assertEqual(4);
      expect(matched).assertEqual(4);
      expect(countHits(rows, '德')).assertEqual(2);
      expect(countHits(rows, '里')).assertEqual(3);
    });

    /**
     * @tc.name   alternatingKeywordsDoNotLeakState
     * @tc.desc   Searching 艾, then 法, then 艾 again returns the same first result count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('alternatingKeywordsDoNotLeakState', 0, () => {
      const rows = createSeedContacts();
      const first = countHits(rows, '艾');
      const middle = countHits(rows, '法');
      const last = countHits(rows, '艾');
      expect(first).assertEqual(4);
      expect(middle).assertEqual(2);
      expect(last).assertEqual(first);
      expect(first === last).assertTrue();
    });

    /**
     * @tc.name   categoryOrderOfHitsFollowsTheNamesNotTheCategories
     * @tc.desc   Hits from E before F keep E first, proving the filter does not reorder.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('categoryOrderOfHitsFollowsTheNamesNotTheCategories', 0, () => {
      const rows: Contact[] = [
        contactOf('检索戊', '13800138000', 'e@example.com', '地址一', '', CATEGORY_E),
        contactOf('检索寅', '13900139000', 'f@example.com', '地址二', '', CATEGORY_F),
        contactOf('无关', '13700137000', 'x@example.com', '地址三', '', CATEGORY_A)
      ];
      const hits = SearchEngine.filterByName(rows, '检索');
      expect(hits.length).assertEqual(2);
      expect(hitCategories(hits)).assertEqual('E>F');
      expect(hits[0].category).assertEqual(CATEGORY_E);
      expect(hits[1].category).assertEqual(CATEGORY_F);
    });

    /**
     * @tc.name   searchingLeavesTheSourceCountsUntouched
     * @tc.desc   Category counts of the full seed are unchanged after three filtered searches.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('searchingLeavesTheSourceCountsUntouched', 0, () => {
      const rows = createSeedContacts();
      SearchEngine.filterByName(rows, '艾');
      SearchEngine.filterByName(rows, '法');
      SearchEngine.filterByName(rows, '无');
      expect(rows.length).assertEqual(15);
      expect(SearchEngine.countCategory(rows, CATEGORY_A)).assertEqual(2);
      expect(SearchEngine.countCategory(rows, CATEGORY_F)).assertEqual(2);
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(6);
    });

    /**
     * @tc.name   disjointKeywordsReturnDisjointHitSets
     * @tc.desc   The 艾 hits and the 法 hits share no row and add up to six rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the SearchFilterValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('disjointKeywordsReturnDisjointHitSets', 0, () => {
      const rows = createSeedContacts();
      const ai = SearchEngine.filterByName(rows, '艾');
      const fa = SearchEngine.filterByName(rows, '法');
      expect(ai.length).assertEqual(4);
      expect(fa.length).assertEqual(2);
      expect(ai.length + fa.length).assertEqual(6);
      expect(hitCategories(ai)).assertEqual('A>E');
      expect(hitCategories(fa)).assertEqual(CATEGORY_F);
      expect(SearchEngine.countCategory(ai, CATEGORY_E)).assertEqual(3);
      expect(SearchEngine.countCategory(fa, CATEGORY_F)).assertEqual(2);
      expect(uniqueStrings(contactNames(ai)).length).assertEqual(4);
      expect(contactNames(fa).length).assertEqual(2);
      expect(rows.length).assertEqual(15);
      expect(ai[0].name).assertEqual('艾德里安');
      expect(fa[0].name).assertEqual('法比而');
      expect(hitNames(ai)).assertEqual('艾德里安,艾登,艾拉,艾里');
      expect(hitNames(fa)).assertEqual('法比而,法里');
      expect(hitNames(ai).length > 0).assertTrue();
    });
  });
}
