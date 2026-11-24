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
 * ContactManagerQueries drives the read side of the store: seed installation,
 * keyword filtering, category grouping, aggregate metrics and snapshots.
 *
 * Anchors:
 *   OperateRDBInTaskPool.ets:53-69   the fifteen seeded rows
 *   OperateRDBInTaskPool.ets:74-80   seed installation into the manager
 *   SharedDriver.ets:88-106          createSeedContacts replica
 *   SharedDriver.ets:798-831         SearchEngine filter and grouping
 *   SharedDriver.ets:834-864         ContactMetrics aggregate
 *   SharedDriver.ets:867-910         ContactSnapshot projection
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  contactOf,
  cloneContact,
  contactNames,
  joined,
  sameStringArray,
  uniqueStrings,
  isDigitsOnly,
  hasEmailShape,
  resetContactManager,
  createSeedContacts,
  SearchEngine,
  ContactMetrics,
  ContactSnapshot,
  snapshotsOf,
  sameSnapshotArray,
  CATEGORIES
} from '../Shared/SharedDriver';

/** Installs the fifteen production seed rows. */
function seededManager(): ContactManager {
  const manager: ContactManager = ContactManager.getInstance();
  manager.setContacts(createSeedContacts());
  return manager;
}

/** First slot whose name equals the target, or -1. */
function indexOfName(rows: Contact[], name: string): number {
  for (let index = 0; index < rows.length; index++) {
    if (rows[index].name === name) {
      return index;
    }
  }
  return -1;
}

/** Searches the currently stored rows. */
function searchStored(keyword: string): Contact[] {
  return SearchEngine.filterByName(ContactManager.getInstance().getContacts(), keyword);
}

/** Metrics over the currently stored rows. */
function storedMetrics(): ContactMetrics {
  return ContactMetrics.from(ContactManager.getInstance().getContacts());
}

export default function contactManagerQueriesTest(): void {
  describe('ContactManagerQueries', () => {
    beforeAll(() => {
      logSuite('ContactManagerQueries', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('ContactManagerQueries', 'end');
    });

    /**
     * @tc.name   seedPayloadCarriesFifteenRows
     * @tc.desc   The production seed table is installed as fifteen contacts after a reset.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('seedPayloadCarriesFifteenRows', 0, () => {
      const manager: ContactManager = seededManager();
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(15);
      expect(rows[0].name).assertEqual('艾德里安');
      expect(rows[14].name).assertEqual('法里');
      expect(rows[7].category).assertEqual('C');
      logStep('ContactManagerQueries', 'seed installed');
    });

    /**
     * @tc.name   seedMatchesItsIndependentSnapshot
     * @tc.desc   The manager rows equal the seed projection field for field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('seedMatchesItsIndependentSnapshot', 0, () => {
      seededManager();
      const expected: ContactSnapshot[] = snapshotsOf(createSeedContacts());
      const actual: ContactSnapshot[] = snapshotsOf(ContactManager.getInstance().getContacts());
      expect(actual.length).assertEqual(15);
      expect(sameSnapshotArray(actual, expected)).assertTrue();
      expect(actual[0].describe()).assertEqual(expected[0].describe());
      expect(actual[13].category).assertEqual('F');
    });

    /**
     * @tc.name   emptyKeywordReturnsEverySeedRow
     * @tc.desc   Clearing the search text returns a new array holding all fifteen rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyKeywordReturnsEverySeedRow', 0, () => {
      seededManager();
      const all: Contact[] = searchStored('');
      expect(all.length).assertEqual(15);
      expect(all === ContactManager.getInstance().getContacts()).assertFalse();
      expect(sameStringArray(contactNames(all), contactNames(createSeedContacts()))).assertTrue();
      expect(all[3].name).assertEqual('本');
    });

    /**
     * @tc.name   oneCharacterKeywordFiltersTheSeed
     * @tc.desc   Searching 本 keeps 本 and 本杰明 and drops the other thirteen rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('oneCharacterKeywordFiltersTheSeed', 0, () => {
      seededManager();
      const found: Contact[] = searchStored('本');
      expect(found.length).assertEqual(2);
      expect(found[0].name).assertEqual('本');
      expect(found[1].name).assertEqual('本杰明');
      expect(found[0].phone).assertEqual('12222222222');
      expect(found[1].category).assertEqual('B');
    });

    /**
     * @tc.name   surnameKeywordReturnsFourMatches
     * @tc.desc   The character 艾 appears in four seed names in storage order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('surnameKeywordReturnsFourMatches', 0, () => {
      seededManager();
      const found: Contact[] = searchStored('艾');
      expect(found.length).assertEqual(4);
      expect(sameStringArray(contactNames(found), ['艾德里安', '艾登', '艾拉', '艾里'])).assertTrue();
      expect(found[1].category).assertEqual('E');
      expect(found[3].category).assertEqual('E');
      expect(joined(contactNames(found), '-')).assertEqual('艾德里安-艾登-艾拉-艾里');
    });

    /**
     * @tc.name   suffixKeywordReturnsOneMatch
     * @tc.desc   The character 明 only appears in 本杰明, so the filter returns one row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('suffixKeywordReturnsOneMatch', 0, () => {
      seededManager();
      const found: Contact[] = searchStored('明');
      expect(found.length).assertEqual(1);
      expect(found[0].name).assertEqual('本杰明');
      expect(found[0].phone).assertEqual('16666666666');
      expect(found[0].address).assertEqual('上海市浦东新区');
      expect(found[0] === createSeedContacts()[4]).assertFalse();
    });

    /**
     * @tc.name   absentKeywordReturnsAnEmptyList
     * @tc.desc   A keyword that no seed name contains yields zero rows and no exception.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('absentKeywordReturnsAnEmptyList', 0, () => {
      seededManager();
      const found: Contact[] = searchStored('齐天大圣');
      expect(found.length).assertEqual(0);
      expect(found instanceof Array).assertTrue();
      expect(contactNames(found).length).assertEqual(0);
      expect(joined(contactNames(found))).assertEqual('');
      expect(ContactManager.getInstance().getContacts().length).assertEqual(15);
    });

    /**
     * @tc.name   seededCategoriesAppearInFirstSeenOrder
     * @tc.desc   Grouping the seed yields A through F once each, following first appearance.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('seededCategoriesAppearInFirstSeenOrder', 0, () => {
      seededManager();
      const groups: string[] = SearchEngine.groupByCategory(ContactManager.getInstance().getContacts());
      expect(groups.length).assertEqual(6);
      expect(sameStringArray(groups, CATEGORIES)).assertTrue();
      expect(joined(groups)).assertEqual('A,B,C,D,E,F');
      expect(groups[0]).assertEqual('A');
      expect(groups[5]).assertEqual('F');
    });

    /**
     * @tc.name   categoryAContainsTwoSeedRows
     * @tc.desc   The first category bucket holds 艾德里安 and 阿诺德.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryAContainsTwoSeedRows', 0, () => {
      seededManager();
      const rows: Contact[] = ContactManager.getInstance().getContacts();
      expect(SearchEngine.countCategory(rows, 'A')).assertEqual(2);
      expect(rows[0].category).assertEqual('A');
      expect(rows[1].category).assertEqual('A');
      expect(rows[2].category).assertEqual('B');
      expect(SearchEngine.countCategory(rows, 'A') === 3).assertFalse();
    });

    /**
     * @tc.name   categoryBContainsThreeSeedRows
     * @tc.desc   The B bucket covers 贝拉, 本 and 本杰明.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryBContainsThreeSeedRows', 0, () => {
      seededManager();
      const rows: Contact[] = ContactManager.getInstance().getContacts();
      expect(SearchEngine.countCategory(rows, 'B')).assertEqual(3);
      expect(rows[2].name).assertEqual('贝拉');
      expect(rows[3].name).assertEqual('本');
      expect(rows[4].name).assertEqual('本杰明');
      expect(SearchEngine.countCategory(rows, 'B') > SearchEngine.countCategory(rows, 'A')).assertTrue();
    });

    /**
     * @tc.name   categoryCContainsThreeSeedRows
     * @tc.desc   The C bucket holds 卡梅隆, 康纳 and 卡特琳娜 in row order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryCContainsThreeSeedRows', 0, () => {
      seededManager();
      const rows: Contact[] = ContactManager.getInstance().getContacts();
      expect(SearchEngine.countCategory(rows, 'C')).assertEqual(3);
      expect(rows[5].name).assertEqual('卡梅隆');
      expect(rows[6].name).assertEqual('康纳');
      expect(rows[7].name).assertEqual('卡特琳娜');
      expect(rows[5].email).assertEqual('cameron@example.com');
      expect(SearchEngine.countCategory(rows, 'C')).assertEqual(SearchEngine.countCategory(rows, 'B'));
    });

    /**
     * @tc.name   categoryDContainsTwoSeedRows
     * @tc.desc   The D bucket covers 丹尼尔 and 戴维维 only.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryDContainsTwoSeedRows', 0, () => {
      seededManager();
      const rows: Contact[] = ContactManager.getInstance().getContacts();
      expect(SearchEngine.countCategory(rows, 'D')).assertEqual(2);
      expect(rows[8].name).assertEqual('丹尼尔');
      expect(rows[9].name).assertEqual('戴维维');
      expect(rows[9].phone).assertEqual('11111111111');
      expect(SearchEngine.countCategory(rows, 'D')).assertEqual(SearchEngine.countCategory(rows, 'A'));
      expect(rows[8].address).assertEqual('陕西省西安市雁塔区');
    });

    /**
     * @tc.name   categoryEContainsThreeSeedRows
     * @tc.desc   The E bucket covers 艾登, 艾拉 and 艾里.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryEContainsThreeSeedRows', 0, () => {
      seededManager();
      const rows: Contact[] = ContactManager.getInstance().getContacts();
      expect(SearchEngine.countCategory(rows, 'E')).assertEqual(3);
      expect(rows[10].name).assertEqual('艾登');
      expect(rows[11].name).assertEqual('艾拉');
      expect(rows[12].name).assertEqual('艾里');
      expect(rows[11].phone).assertEqual('10000000000');
      expect(SearchEngine.countCategory(rows, 'E') === 2).assertFalse();
    });

    /**
     * @tc.name   categoryFContainsTwoSeedRows
     * @tc.desc   The F bucket covers 法比而 and 法里 at the tail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('categoryFContainsTwoSeedRows', 0, () => {
      seededManager();
      const rows: Contact[] = ContactManager.getInstance().getContacts();
      expect(SearchEngine.countCategory(rows, 'F')).assertEqual(2);
      expect(rows[13].name).assertEqual('法比而');
      expect(rows[14].name).assertEqual('法里');
      expect(rows[14].category).assertEqual('F');
      expect(SearchEngine.countCategory(rows, 'F')).assertEqual(SearchEngine.countCategory(rows, 'D'));
    });

    /**
     * @tc.name   categoryCountsSumToTheSeedTotal
     * @tc.desc   The six bucket counts add up to fifteen and an unknown bucket reports zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('categoryCountsSumToTheSeedTotal', 0, () => {
      seededManager();
      const rows: Contact[] = ContactManager.getInstance().getContacts();
      let sum = 0;
      for (let index = 0; index < CATEGORIES.length; index++) {
        const count = SearchEngine.countCategory(rows, CATEGORIES[index]);
        expect(count > 0).assertTrue();
        sum = sum + count;
      }
      expect(sum).assertEqual(15);
      expect(SearchEngine.countCategory(rows, 'G')).assertEqual(0);
      expect(SearchEngine.countCategory(rows, '')).assertEqual(0);
      expect(CATEGORIES.length).assertEqual(6);
    });

    /**
     * @tc.name   metricsReportFifteenUniqueNames
     * @tc.desc   The seed aggregate has fifteen rows, fifteen unique names and no duplicates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('metricsReportFifteenUniqueNames', 0, () => {
      seededManager();
      const metrics: ContactMetrics = storedMetrics();
      expect(metrics.total).assertEqual(15);
      expect(metrics.uniqueNames).assertEqual(15);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.categories).assertEqual(6);
      expect(metrics.fillRatio()).assertEqual(1);
    });

    /**
     * @tc.name   metricsAccumulateSeedPhoneDigits
     * @tc.desc   Fifteen eleven digit phones produce a digit total of one hundred sixty five.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsAccumulateSeedPhoneDigits', 0, () => {
      seededManager();
      const metrics: ContactMetrics = storedMetrics();
      expect(metrics.totalPhoneDigits).assertEqual(165);
      expect(metrics.total * 11).assertEqual(metrics.totalPhoneDigits);
      const rows: Contact[] = ContactManager.getInstance().getContacts();
      let manual = 0;
      for (let index = 0; index < rows.length; index++) {
        manual = manual + rows[index].phone.length;
      }
      expect(manual).assertEqual(metrics.totalPhoneDigits);
      expect(manual).assertEqual(165);
    });

    /**
     * @tc.name   metricsFingerprintIsStableForTheSeed
     * @tc.desc   Two independently built metric objects over identical rows share one fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsFingerprintIsStableForTheSeed', 0, () => {
      seededManager();
      const first: ContactMetrics = ContactMetrics.from(createSeedContacts());
      const second: ContactMetrics = ContactMetrics.from(createSeedContacts());
      expect(first.fingerprint()).assertEqual(second.fingerprint());
      expect(first.fingerprint() > 0).assertTrue();
      expect(first.duplicateNames).assertEqual(second.duplicateNames);
      expect(first.categories).assertEqual(second.categories);
      expect(first.totalPhoneDigits).assertEqual(second.totalPhoneDigits);
      expect(String(first.fingerprint()) === String(second.fingerprint())).assertTrue();
    });

    /**
     * @tc.name   seedSnapshotsCompareEqualFieldByField
     * @tc.desc   Snapshots of the stored seed and of a fresh seed compare equal at every slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('seedSnapshotsCompareEqualFieldByField', 0, () => {
      seededManager();
      const stored: ContactSnapshot[] = snapshotsOf(ContactManager.getInstance().getContacts());
      const fresh: ContactSnapshot[] = snapshotsOf(createSeedContacts());
      expect(stored.length).assertEqual(fresh.length);
      for (let index = 0; index < stored.length; index++) {
        expect(stored[index].sameAs(fresh[index])).assertTrue();
      }
      expect(stored[0].name).assertEqual('艾德里安');
      expect(stored[0].phone).assertEqual('13333333333');
      expect(stored[14].describe().endsWith('/F')).assertTrue();
    });

    /**
     * @tc.name   snapshotDescribeExposesFiveFields
     * @tc.desc   The snapshot description joins name, phone, email, address and category with slashes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('snapshotDescribeExposesFiveFields', 0, () => {
      seededManager();
      const rows: Contact[] = ContactManager.getInstance().getContacts();
      const snapshot: ContactSnapshot = new ContactSnapshot(rows[2]);
      expect(snapshot.describe()).assertEqual('贝拉/11111111111/bella@example.com/湖北省武汉市江汉区/B');
      expect(snapshot.name).assertEqual('贝拉');
      expect(snapshot.category).assertEqual('B');
      expect(snapshot.describe().split('/').length).assertEqual(5);
      expect(snapshot.describe().indexOf('bella@example.com') > 0).assertTrue();
    });

    /**
     * @tc.name   snapshotComparisonRejectsADifferentRow
     * @tc.desc   Snapshots of two different seed rows are not equal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('snapshotComparisonRejectsADifferentRow', 0, () => {
      seededManager();
      const rows: Contact[] = ContactManager.getInstance().getContacts();
      const left: ContactSnapshot = new ContactSnapshot(rows[0]);
      const right: ContactSnapshot = new ContactSnapshot(rows[1]);
      expect(left.sameAs(right)).assertFalse();
      expect(left.sameAs(new ContactSnapshot(rows[0]))).assertTrue();
      expect(left.name === right.name).assertFalse();
      expect(sameSnapshotArray([left], [right])).assertFalse();
      expect(sameSnapshotArray([left], [left])).assertTrue();
    });

    /**
     * @tc.name   addingARowChangesTheSnapshotArray
     * @tc.desc   Appending one contact makes the snapshot arrays differ in length and tail.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addingARowChangesTheSnapshotArray', 0, () => {
      const manager: ContactManager = seededManager();
      const before: ContactSnapshot[] = snapshotsOf(manager.getContacts());
      manager.addContact(contactOf('新成员', '13900000001', 'member@example.com',
        '江苏省南京市建邺区', '', 'A'));
      const after: ContactSnapshot[] = snapshotsOf(manager.getContacts());
      expect(before.length).assertEqual(15);
      expect(after.length).assertEqual(16);
      expect(sameSnapshotArray(before, after)).assertFalse();
      expect(after[15].name).assertEqual('新成员');
      expect(after[15].category).assertEqual('A');
      expect(storedMetrics().categories).assertEqual(6);
    });

    /**
     * @tc.name   searchResultsAreIndependentCopies
     * @tc.desc   Editing a returned search row cannot change the stored seed row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('searchResultsAreIndependentCopies', 0, () => {
      seededManager();
      const found: Contact[] = searchStored('本杰明');
      expect(found.length).assertEqual(1);
      found[0].phone = '10000000000';
      found[0].email = 'hacked@example.com';
      expect(ContactManager.getInstance().getContacts()[4].phone).assertEqual('16666666666');
      expect(ContactManager.getInstance().getContacts()[4].email).assertEqual('benjieiming@example.com');
      expect(storedMetrics().totalPhoneDigits).assertEqual(165);
    });

    /**
     * @tc.name   emptyStoreYieldsEmptyQueryResults
     * @tc.desc   With no rows, search, grouping and counting all return empty or zero values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyStoreYieldsEmptyQueryResults', 0, () => {
      const rows: Contact[] = ContactManager.getInstance().getContacts();
      expect(rows.length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '艾').length).assertEqual(0);
      expect(SearchEngine.groupByCategory(rows).length).assertEqual(0);
      expect(SearchEngine.countCategory(rows, 'A')).assertEqual(0);
      expect(ContactMetrics.from(rows).total).assertEqual(0);
    });

    /**
     * @tc.name   deletingARowIsVisibleToQueries
     * @tc.desc   After deleting 贝拉 the name count drops and the B bucket shrinks by one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deletingARowIsVisibleToQueries', 0, () => {
      const manager: ContactManager = seededManager();
      manager.deleteContact(new Contact('贝拉'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(14);
      expect(indexOfName(rows, '贝拉')).assertEqual(-1);
      expect(SearchEngine.countCategory(rows, 'B')).assertEqual(2);
      expect(storedMetrics().total).assertEqual(14);
      expect(searchStored('贝拉').length).assertEqual(0);
      expect(storedMetrics().totalPhoneDigits).assertEqual(154);
    });

    /**
     * @tc.name   updatingARowIsVisibleToQueries
     * @tc.desc   Changing 贝拉's category and email moves the row into another bucket for counting.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updatingARowIsVisibleToQueries', 0, () => {
      const manager: ContactManager = seededManager();
      manager.updateContact(contactOf('贝拉', '11111111111', 'bella.new@example.com',
        '湖北省武汉市江汉区', '', 'F'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(15);
      expect(SearchEngine.countCategory(rows, 'B')).assertEqual(2);
      expect(SearchEngine.countCategory(rows, 'F')).assertEqual(3);
      expect(rows[2].email).assertEqual('bella.new@example.com');
      expect(searchStored('bella.new').length).assertEqual(0);
      expect(storedMetrics().categories).assertEqual(6);
    });

    /**
     * @tc.name   nameLookupFindsEachSeedSlot
     * @tc.desc   A linear lookup over the stored rows returns the documented index for four names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('nameLookupFindsEachSeedSlot', 0, () => {
      seededManager();
      const rows: Contact[] = ContactManager.getInstance().getContacts();
      expect(indexOfName(rows, '艾德里安')).assertEqual(0);
      expect(indexOfName(rows, '本杰明')).assertEqual(4);
      expect(indexOfName(rows, '卡特琳娜')).assertEqual(7);
      expect(indexOfName(rows, '法里')).assertEqual(14);
      expect(indexOfName(rows, '幽灵')).assertEqual(-1);
      expect(indexOfName(rows, '')).assertEqual(-1);
    });

    /**
     * @tc.name   uniqueNameHelperReportsFifteenForTheSeed
     * @tc.desc   The name list has fifteen entries and all of them are unique.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('uniqueNameHelperReportsFifteenForTheSeed', 0, () => {
      seededManager();
      const names: string[] = contactNames(ContactManager.getInstance().getContacts());
      expect(names.length).assertEqual(15);
      expect(uniqueStrings(names).length).assertEqual(15);
      expect(uniqueStrings(names).length).assertEqual(names.length);
      expect(names.indexOf('艾德里安')).assertEqual(0);
      expect(names.lastIndexOf('法里')).assertEqual(14);
      expect(joined(uniqueStrings(names), ',') === joined(names, ',')).assertTrue();
    });

    /**
     * @tc.name   queriesSeedPhonesAreDigitsOnly
     * @tc.desc   All fifteen seeded phone literals pass the numeric-only check.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('queriesSeedPhonesAreDigitsOnly', 0, () => {
      const rows: Contact[] = createSeedContacts();
      for (let index = 0; index < rows.length; index++) {
        expect(isDigitsOnly(rows[index].phone)).assertTrue();
        expect(rows[index].phone.length).assertEqual(11);
      }
      expect(isDigitsOnly('12345abc')).assertFalse();
      expect(isDigitsOnly('')).assertFalse();
      expect(isDigitsOnly(rows[0].phone)).assertTrue();
      expect(isDigitsOnly(rows[14].phone)).assertTrue();
    });

    /**
     * @tc.name   everySeedEmailHasAEmailShape
     * @tc.desc   All fifteen seeded email literals contain an at sign and a dot after it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('everySeedEmailHasAEmailShape', 0, () => {
      const rows: Contact[] = createSeedContacts();
      for (let index = 0; index < rows.length; index++) {
        expect(hasEmailShape(rows[index].email)).assertTrue();
        expect(rows[index].email.indexOf('@') > 0).assertTrue();
      }
      expect(hasEmailShape('missing-at.example.com')).assertFalse();
      expect(hasEmailShape('user@nodot')).assertFalse();
      expect(hasEmailShape(rows[3].email)).assertTrue();
      expect(rows[3].email).assertEqual('ben@example.com');
    });

    /**
     * @tc.name   seedAvatarsAreEmptyAndCategoriesAreSingleLetters
     * @tc.desc   The seeded avatar column is empty and every category is one of A through F.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('seedAvatarsAreEmptyAndCategoriesAreSingleLetters', 0, () => {
      const rows: Contact[] = createSeedContacts();
      for (let index = 0; index < rows.length; index++) {
        expect(rows[index].avatar).assertEqual('');
        expect(rows[index].category.length).assertEqual(1);
        expect(CATEGORIES.indexOf(rows[index].category) >= 0).assertTrue();
      }
      expect(rows[0].avatar === rows[14].avatar).assertTrue();
      expect(rows[0].category).assertEqual('A');
      expect(rows[14].category).assertEqual('F');
    });

    /**
     * @tc.name   replacingTheStoreDropsEverySeedRow
     * @tc.desc   A two row replacement makes all seed queries return only the new names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('replacingTheStoreDropsEverySeedRow', 0, () => {
      const manager: ContactManager = seededManager();
      const replacement: Contact[] = [];
      replacement.push(contactOf('替换甲', '13800000001', 'replace1@example.com', '四川省自贡市自流井区', '', 'A'));
      replacement.push(contactOf('替换乙', '13800000002', 'replace2@example.com', '四川省攀枝花市东区', '', 'B'));
      manager.setContacts(replacement);
      expect(manager.getContacts().length).assertEqual(2);
      expect(searchStored('艾').length).assertEqual(0);
      expect(searchStored('替换').length).assertEqual(2);
      expect(storedMetrics().total).assertEqual(2);
      expect(storedMetrics().categories).assertEqual(2);
    });

    /**
     * @tc.name   searchAfterAddFindsTheNewRow
     * @tc.desc   A row appended after the seed is immediately visible to the keyword filter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('searchAfterAddFindsTheNewRow', 0, () => {
      const manager: ContactManager = seededManager();
      manager.addContact(contactOf('新增者', '13700000011', 'added@example.com',
        '重庆市江北区', '', 'A'));
      const found: Contact[] = searchStored('新增');
      expect(found.length).assertEqual(1);
      expect(found[0].name).assertEqual('新增者');
      expect(found[0].phone).assertEqual('13700000011');
      expect(storedMetrics().total).assertEqual(16);
      expect(SearchEngine.countCategory(manager.getContacts(), 'A')).assertEqual(3);
    });

    /**
     * @tc.name   searchOrderFollowsStorageOrder
     * @tc.desc   Two matches inside one category keep the order in which they were stored.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('searchOrderFollowsStorageOrder', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const rows: Contact[] = [];
      rows.push(contactOf('序尾', '13600000001', 'order1@example.com', '安徽省淮南市田家庵区', '', 'D'));
      rows.push(contactOf('序中', '13600000002', 'order2@example.com', '安徽省马鞍山市花山区', '', 'E'));
      rows.push(contactOf('序尾二', '13600000003', 'order3@example.com', '安徽省淮北市相山区', '', 'F'));
      manager.setContacts(rows);
      const found: Contact[] = searchStored('序');
      expect(found.length).assertEqual(3);
      expect(sameStringArray(contactNames(found), ['序尾', '序中', '序尾二'])).assertTrue();
      expect(found[2].phone).assertEqual('13600000003');
      expect(SearchEngine.groupByCategory(found).length).assertEqual(3);
      expect(searchStored('尾')[0].name).assertEqual('序尾');
    });

    /**
     * @tc.name   clearingTheStoreResetsEveryAggregate
     * @tc.desc   After clearing, total, categories, digit count and fingerprint all return to zero state.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('clearingTheStoreResetsEveryAggregate', 0, () => {
      const manager: ContactManager = seededManager();
      expect(storedMetrics().total).assertEqual(15);
      manager.setContacts([]);
      const metrics: ContactMetrics = storedMetrics();
      expect(metrics.total).assertEqual(0);
      expect(metrics.categories).assertEqual(0);
      expect(metrics.uniqueNames).assertEqual(0);
      expect(metrics.totalPhoneDigits).assertEqual(0);
      expect(metrics.fillRatio()).assertEqual(0);
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(0);
    });

    /**
     * @tc.name   groupingAfterDeletionDropsEmptyCategories
     * @tc.desc   Deleting both D rows removes D from the grouping while A, B, C, E and F remain.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('groupingAfterDeletionDropsEmptyCategories', 0, () => {
      const manager: ContactManager = seededManager();
      manager.deleteContact(new Contact('丹尼尔'));
      manager.deleteContact(new Contact('戴维维'));
      const groups: string[] = SearchEngine.groupByCategory(manager.getContacts());
      expect(groups.length).assertEqual(5);
      expect(groups.indexOf('D')).assertEqual(-1);
      expect(sameStringArray(groups, ['A', 'B', 'C', 'E', 'F'])).assertTrue();
      expect(SearchEngine.countCategory(manager.getContacts(), 'D')).assertEqual(0);
      expect(storedMetrics().categories).assertEqual(5);
    });

    /**
     * @tc.name   snapshotArrayForAnEmptyStoreIsEmpty
     * @tc.desc   Snapshotting a cleared store yields a zero length array that compares equal to itself.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('snapshotArrayForAnEmptyStoreIsEmpty', 0, () => {
      const manager: ContactManager = seededManager();
      manager.setContacts([]);
      const empty: ContactSnapshot[] = snapshotsOf(manager.getContacts());
      expect(empty.length).assertEqual(0);
      expect(sameSnapshotArray(empty, empty)).assertTrue();
      expect(sameSnapshotArray(empty, snapshotsOf(createSeedContacts()))).assertFalse();
      expect(empty instanceof Array).assertTrue();
      expect(manager.getContacts().length).assertEqual(0);
    });

    /**
     * @tc.name   metricsAfterPartialDeletionTrackTheRemainder
     * @tc.desc   Removing one A row leaves fourteen rows, five categories and one hundred fifty four digits.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsAfterPartialDeletionTrackTheRemainder', 0, () => {
      const manager: ContactManager = seededManager();
      manager.deleteContact(new Contact('艾德里安'));
      const rows: Contact[] = manager.getContacts();
      const metrics: ContactMetrics = ContactMetrics.from(rows);
      expect(rows.length).assertEqual(14);
      expect(metrics.total).assertEqual(14);
      expect(metrics.uniqueNames).assertEqual(14);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.totalPhoneDigits).assertEqual(154);
      expect(metrics.categories).assertEqual(6);
      expect(rows[0].name).assertEqual('阿诺德');
    });

    /**
     * @tc.name   searchForACategoryLetterReturnsNothing
     * @tc.desc   The keyword filter only inspects names, so the category letter is not searchable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('searchForACategoryLetterReturnsNothing', 0, () => {
      seededManager();
      expect(searchStored('A').length).assertEqual(0);
      expect(searchStored('B').length).assertEqual(0);
      expect(searchStored('F').length).assertEqual(0);
      expect(searchStored('example').length).assertEqual(0);
      expect(searchStored('13333333333').length).assertEqual(0);
      expect(searchStored('上海').length).assertEqual(0);
    });
    /**
     * @tc.name   metricsFingerprintChangesAfterDeletion
     * @tc.desc   One deletion changes the fingerprint while leaving duplicate names at zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('metricsFingerprintChangesAfterDeletion', 0, () => {
      const manager: ContactManager = seededManager();
      const before: ContactMetrics = ContactMetrics.from(manager.getContacts());
      manager.deleteContact(new Contact('法里'));
      const after: ContactMetrics = ContactMetrics.from(manager.getContacts());
      expect(before.fingerprint() === after.fingerprint()).assertFalse();
      expect(after.total).assertEqual(14);
      expect(after.duplicateNames).assertEqual(0);
      expect(after.categories).assertEqual(6);
      expect(before.total).assertEqual(15);
      expect(after.totalPhoneDigits < before.totalPhoneDigits).assertTrue();
    });

    /**
     * @tc.name   filtersUseSubstringSemanticsNotPrefixOnes
     * @tc.desc   A keyword in the middle of a name matches while a keyword spanning two names does not.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('filtersUseSubstringSemanticsNotPrefixOnes', 0, () => {
      seededManager();
      expect(searchStored('杰').length).assertEqual(1);
      expect(searchStored('梅隆').length).assertEqual(1);
      expect(searchStored('琳娜').length).assertEqual(1);
      expect(searchStored('法比').length).assertEqual(1);
      expect(searchStored('本杰明康德').length).assertEqual(0);
      expect(searchStored('艾德').length).assertEqual(1);
      expect(searchStored('德拉').length).assertEqual(0);
    });
    /**
     * @tc.name   mixedEditsProduceAConsistentSnapshot
     * @tc.desc   Two updates, one delete and one add leave a snapshot with sixteen rows and the new values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('mixedEditsProduceAConsistentSnapshot', 0, () => {
      const manager: ContactManager = seededManager();
      manager.updateContact(contactOf('艾德里安', '13333333333', 'aid.new@example.com',
        '江苏省南京市玄武区', '', 'A'));
      manager.updateContact(contactOf('法里', '11111111111', 'far.new@example.com',
        '吉林省长春市南关区', '', 'F'));
      manager.deleteContact(new Contact('卡梅隆'));
      manager.addContact(contactOf('补位', '13900002222', 'filler@example.com',
        '海南省三亚市吉阳区', '', 'C'));
      const snapshots: ContactSnapshot[] = snapshotsOf(manager.getContacts());
      expect(snapshots.length).assertEqual(15);
      expect(snapshots[0].email).assertEqual('aid.new@example.com');
      expect(snapshots[13].email).assertEqual('far.new@example.com');
      expect(snapshots[14].name).assertEqual('补位');
      expect(searchStored('卡梅隆').length).assertEqual(0);
      expect(storedMetrics().total).assertEqual(15);
      expect(storedMetrics().uniqueNames).assertEqual(15);
      expect(snapshots[0].name).assertEqual('艾德里安');
      expect(snapshots[0].category).assertEqual('A');
      expect(snapshots[0].sameAs(snapshots[1])).assertFalse();
      expect(snapshots[13].category).assertEqual('F');
      expect(snapshots[13].address).assertEqual('吉林省长春市南关区');
      expect(snapshots[14].phone).assertEqual('13900002222');
      expect(snapshots[14].category).assertEqual('C');
      expect(SearchEngine.countCategory(manager.getContacts(), 'C')).assertEqual(3);
      expect(SearchEngine.countCategory(manager.getContacts(), 'B')).assertEqual(3);
      expect(joined(contactNames(manager.getContacts())).startsWith('艾德里安')).assertTrue();
      expect(indexOfName(manager.getContacts(), '补位')).assertEqual(14);
      expect(storedMetrics().duplicateNames).assertEqual(0);
      expect(storedMetrics().fillRatio()).assertEqual(1);
      expect(storedMetrics().totalPhoneDigits).assertEqual(165);
    });

    /**
     * @tc.name   addingANewCategoryExtendsTheGrouping
     * @tc.desc   A category letter absent from the seed joins the grouping after one append.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerQueries scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('addingANewCategoryExtendsTheGrouping', 0, () => {
      const manager: ContactManager = seededManager();
      expect(SearchEngine.groupByCategory(manager.getContacts()).length).assertEqual(6);
      manager.addContact(contactOf('新类', '13900001111', 'newcat@example.com',
        '江苏省南京市玄武区', '', 'G'));
      const groups: string[] = SearchEngine.groupByCategory(manager.getContacts());
      expect(groups.length).assertEqual(7);
      expect(groups[6]).assertEqual('G');
      expect(SearchEngine.countCategory(manager.getContacts(), 'G')).assertEqual(1);
      expect(storedMetrics().categories).assertEqual(7);
    });
  });
}
