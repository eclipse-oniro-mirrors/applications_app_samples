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
 * ContactCore / ContactDirectoryModel suite.
 *
 * The list page shows the directory in insertion order and narrows it with a
 * name substring search. The suite pins the name projection, the uniqueness and
 * duplicate counters, snapshot alignment, the clone semantics of filterByName
 * and the invariants that hold while rows are added or deleted.
 *
 * Source anchors:
 *   OperateRDBInTaskPool.ets:53-69   directory seed order
 *   ContactManager.ets:41-53         copy on read and append on add
 *   SharedDriver.ets:122-128         contactNames projection
 *   SharedDriver.ets:798-810         SearchEngine.filterByName
 *   SharedDriver.ets:834-910         metrics and snapshots
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  createSeedContacts,
  contactOf,
  cloneContact,
  sameContact,
  contactNames,
  joined,
  sameStringArray,
  countOf,
  uniqueStrings,
  textFingerprint,
  expectedAfterAdd,
  ContactMetrics,
  snapshotsOf,
  sameSnapshotArray,
  SearchEngine,
  resetContactManager
} from '../Shared/SharedDriver';

export default function contactDirectoryModelTest(): void {
  describe('ContactDirectoryModel', () => {
    beforeAll(() => {
      logSuite('ContactDirectoryModel', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('ContactDirectoryModel', 'end');
    });

    /**
     * @tc.name   directoryContactNamesMatchSeedOrder
     * @tc.desc   The projected name list reproduces the page order from 艾德里安 to 法里.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('directoryContactNamesMatchSeedOrder', 0, () => {
      const rows = createSeedContacts();
      const names = contactNames(rows);
      expect(names.length).assertEqual(15);
      expect(names[0]).assertEqual('艾德里安');
      expect(names[1]).assertEqual('阿诺德');
      expect(names[6]).assertEqual('康纳');
      expect(names[14]).assertEqual('法里');
      expect(joined(names, '>')).assertEqual('艾德里安>阿诺德>贝拉>本>本杰明>卡梅隆>康纳>卡特琳娜>丹尼尔>戴维维>艾登>艾拉>艾里>法比而>法里');
      expect(names.length).assertEqual(rows.length);
    });

    /**
     * @tc.name   directoryNamesAreUniqueInSeed
     * @tc.desc   No two seeded rows share a name, so the duplicate counter is zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('directoryNamesAreUniqueInSeed', 0, () => {
      const names = contactNames(createSeedContacts());
      const unique = uniqueStrings(names);
      expect(unique.length).assertEqual(15);
      expect(unique.length).assertEqual(names.length);
      expect(countOf(names, '')).assertEqual(0);
      expect(countOf(names, '本')).assertEqual(1);
      expect(countOf(names, '艾')).assertEqual(0);
      expect(unique[0]).assertEqual('艾德里安');
      expect(unique[14]).assertEqual('法里');
    });

    /**
     * @tc.name   directoryNameDuplicateMetricIsZero
     * @tc.desc   ContactMetrics over the directory reports fifteen unique names and no duplicates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directoryNameDuplicateMetricIsZero', 0, () => {
      const metrics = ContactMetrics.from(createSeedContacts());
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.uniqueNames).assertEqual(15);
      expect(metrics.uniqueNames - metrics.duplicateNames).assertEqual(15);
      expect(metrics.fillRatio()).assertEqual(1);
      expect(metrics.uniqueNames).assertEqual(uniqueStrings(contactNames(createSeedContacts())).length);
      expect(metrics.categories).assertEqual(6);
      expect(metrics.total).assertEqual(15);
    });

    /**
     * @tc.name   directoryMetricsTotalMatchesNamesLength
     * @tc.desc   The metric total always equals the projected name list length for the directory.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directoryMetricsTotalMatchesNamesLength', 0, () => {
      const rows = createSeedContacts();
      const metrics = ContactMetrics.from(rows);
      expect(metrics.total).assertEqual(contactNames(rows).length);
      expect(metrics.uniqueNames).assertEqual(uniqueStrings(contactNames(rows)).length);
      expect(metrics.total).assertEqual(rows.length);
      expect(metrics.totalPhoneDigits).assertEqual(165);
      expect(metrics.total * 11).assertEqual(metrics.totalPhoneDigits);
      expect(metrics.fingerprint()).assertEqual(textFingerprint('15:15:6:165'));
      expect(metrics.fillRatio()).assertEqual(1);
    });

    /**
     * @tc.name   directorySnapshotArrayLengthMatchesRows
     * @tc.desc   snapshotsOf produces exactly one snapshot per directory row with no gaps.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('directorySnapshotArrayLengthMatchesRows', 0, () => {
      const rows = createSeedContacts();
      const snapshots = snapshotsOf(rows);
      expect(snapshots.length).assertEqual(rows.length);
      expect(snapshots.length).assertEqual(15);
      expect(snapshots[0] === undefined).assertFalse();
      expect(snapshots[14] === undefined).assertFalse();
      expect(snapshots.slice(15).length === 0).assertTrue();
      expect(snapshotsOf([]).length).assertEqual(0);
      expect(sameSnapshotArray(snapshots, snapshotsOf(createSeedContacts()))).assertTrue();
    });

    /**
     * @tc.name   directorySnapshotValuesMatchNamesInOrder
     * @tc.desc   Snapshot names line up with contactNames position by position.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directorySnapshotValuesMatchNamesInOrder', 0, () => {
      const rows = createSeedContacts();
      const names = contactNames(rows);
      const snapshots = snapshotsOf(rows);
      let aligned = 0;
      for (let index = 0; index < snapshots.length; index++) {
        if (snapshots[index].name === names[index]) {
          aligned = aligned + 1;
        }
      }
      expect(aligned).assertEqual(15);
      expect(snapshots[6].name).assertEqual('康纳');
      expect(snapshots[6].phone).assertEqual(rows[6].phone);
      expect(snapshots[9].category).assertEqual('D');
      expect(snapshots[14].describe().startsWith('法里/')).assertTrue();
      expect(snapshots[0].name).assertEqual(names[0]);
    });

    /**
     * @tc.name   directorySnapshotDescribeKeepsFiveSegmentsPerRow
     * @tc.desc   Every snapshot descriptor splits into five parts and never includes the avatar slot.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directorySnapshotDescribeKeepsFiveSegmentsPerRow', 0, () => {
      const snapshots = snapshotsOf(createSeedContacts());
      let fiveParts = 0;
      for (let index = 0; index < snapshots.length; index++) {
        if (snapshots[index].describe().split('/').length === 5) {
          fiveParts = fiveParts + 1;
        }
      }
      expect(fiveParts).assertEqual(15);
      expect(snapshots[0].describe().split('/')[0]).assertEqual('艾德里安');
      expect(snapshots[0].describe().split('/')[4]).assertEqual('A');
      expect(snapshots[5].describe().split('/')[2]).assertEqual('cameron@example.com');
      expect(snapshots[5].describe().indexOf('avatar')).assertEqual(-1);
      expect(snapshots[14].describe()).assertEqual('法里/11111111111/katrina@example.com/吉林省长春市朝阳区/F');
    });

    /**
     * @tc.name   directorySearchWithEmptyKeywordReturnsAllRows
     * @tc.desc   An empty keyword returns a fresh array containing every original row reference.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('directorySearchWithEmptyKeywordReturnsAllRows', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '');
      expect(hits.length).assertEqual(15);
      expect(hits.length).assertEqual(rows.length);
      expect(hits === rows).assertFalse();
      expect(sameStringArray(contactNames(hits), contactNames(rows))).assertTrue();
      expect(hits[0] === rows[0]).assertTrue();
      expect(sameContact(hits[0], rows[0])).assertTrue();
      expect(hits[14].name).assertEqual('法里');
    });

    /**
     * @tc.name   directorySearchByFullNameReturnsOneHit
     * @tc.desc   Searching the complete name 卡特琳娜 matches exactly one directory entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('directorySearchByFullNameReturnsOneHit', 0, () => {
      const hits = SearchEngine.filterByName(createSeedContacts(), '卡特琳娜');
      expect(hits.length).assertEqual(1);
      expect(hits[0].name).assertEqual('卡特琳娜');
      expect(hits[0].phone).assertEqual('11111111111');
      expect(hits[0].email).assertEqual('katrina@example.com');
      expect(hits[0].category).assertEqual('C');
      expect(hits[0].address).assertEqual('吉林省长春市朝阳区');
      expect(countOf(contactNames(hits), '卡特琳娜')).assertEqual(1);
    });

    /**
     * @tc.name   directorySearchBySharedCharacterReturnsFourRows
     * @tc.desc   The character 艾 appears in four names and the hits keep their directory order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directorySearchBySharedCharacterReturnsFourRows', 0, () => {
      const hits = SearchEngine.filterByName(createSeedContacts(), '艾');
      expect(hits.length).assertEqual(4);
      expect(joined(contactNames(hits), '>')).assertEqual('艾德里安>艾登>艾拉>艾里');
      expect(hits[0].name).assertEqual('艾德里安');
      expect(hits[3].name).assertEqual('艾里');
      expect(SearchEngine.groupByCategory(hits).length).assertEqual(2);
      expect(SearchEngine.countCategory(hits, 'E')).assertEqual(3);
      expect(SearchEngine.countCategory(hits, 'A')).assertEqual(1);
    });

    /**
     * @tc.name   directorySearchByBenCharacterReturnsTwo
     * @tc.desc   The character 本 matches 本 and 本杰明, proving substring rather than prefix search.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directorySearchByBenCharacterReturnsTwo', 0, () => {
      const hits = SearchEngine.filterByName(createSeedContacts(), '本');
      expect(hits.length).assertEqual(2);
      expect(joined(contactNames(hits), '>')).assertEqual('本>本杰明');
      expect(hits[0].name).assertEqual('本');
      expect(hits[1].name).assertEqual('本杰明');
      expect(hits[1].email).assertEqual('benjieiming@example.com');
      expect(hits[0].phone).assertEqual('12222222222');
      expect(hits[1].phone === hits[0].phone).assertFalse();
    });

    /**
     * @tc.name   directorySearchByMissingKeywordReturnsNothing
     * @tc.desc   A keyword that no name contains yields an empty hit list without touching the rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directorySearchByMissingKeywordReturnsNothing', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '不存在');
      expect(hits.length).assertEqual(0);
      expect(contactNames(hits).length).assertEqual(0);
      expect(joined(contactNames(hits), ',')).assertEqual('');
      expect(ContactMetrics.from(hits).fillRatio()).assertEqual(0);
      expect(rows.length).assertEqual(15);
      expect(SearchEngine.groupByCategory(hits).length).assertEqual(0);
      expect(hits === rows).assertFalse();
    });

    /**
     * @tc.name   directorySearchReturnsClonesNotReferences
     * @tc.desc   Editing a hit leaves the directory row untouched because filterByName clones each hit.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directorySearchReturnsClonesNotReferences', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '卡梅隆');
      expect(hits.length).assertEqual(1);
      expect(hits[0] === rows[5]).assertFalse();
      expect(sameContact(hits[0], rows[5])).assertTrue();
      hits[0].phone = '13900000000';
      hits[0].category = 'F';
      expect(rows[5].phone).assertEqual('17777777777');
      expect(rows[5].category).assertEqual('C');
      expect(sameContact(hits[0], rows[5])).assertFalse();
      expect(SearchEngine.filterByName(rows, '卡梅隆')[0].phone).assertEqual('17777777777');
    });

    /**
     * @tc.name   directorySearchPreservesRelativeOrder
     * @tc.desc   Hits for the character 法 keep 法比而 before 法里 with no re-sorting.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directorySearchPreservesRelativeOrder', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '法');
      expect(hits.length).assertEqual(2);
      expect(hits[0].name).assertEqual('法比而');
      expect(hits[1].name).assertEqual('法里');
      expect(rows.indexOf(rows[13]) < rows.indexOf(rows[14])).assertTrue();
      expect(countOf(contactNames(hits), '法里')).assertEqual(1);
      const reversed: Contact[] = [];
      for (let index = rows.length - 1; index >= 0; index--) {
        reversed.push(rows[index]);
      }
      const reverseHits = SearchEngine.filterByName(reversed, '法');
      expect(reverseHits[0].name).assertEqual('法里');
      expect(reverseHits[1].name).assertEqual('法比而');
    });

    /**
     * @tc.name   directoryDuplicateNameIncreasesDuplicateMetric
     * @tc.desc   Appending a second 贝拉 raises duplicateNames to one while total reaches sixteen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directoryDuplicateNameIncreasesDuplicateMetric', 0, () => {
      const rows = createSeedContacts();
      const before = ContactMetrics.from(rows);
      rows.push(contactOf('贝拉', '13900000031', 'bella31@example.com', '江苏省苏州市姑苏区', '', 'B'));
      const after = ContactMetrics.from(rows);
      expect(before.duplicateNames).assertEqual(0);
      expect(after.duplicateNames).assertEqual(1);
      expect(after.total).assertEqual(16);
      expect(after.total).assertEqual(before.total + 1);
      expect(countOf(contactNames(rows), '贝拉')).assertEqual(2);
      expect(uniqueStrings(contactNames(rows)).length).assertEqual(15);
      expect(after.total - after.duplicateNames).assertEqual(15);
    });

    /**
     * @tc.name   directoryDuplicateNameKeepsUniqueCount
     * @tc.desc   A duplicate never raises uniqueNames; it only adds to the duplicate counter.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directoryDuplicateNameKeepsUniqueCount', 0, () => {
      const rows = createSeedContacts();
      rows.push(cloneContact(rows[0]));
      rows.push(cloneContact(rows[0]));
      const metrics = ContactMetrics.from(rows);
      expect(rows.length).assertEqual(17);
      expect(metrics.uniqueNames).assertEqual(15);
      expect(metrics.duplicateNames).assertEqual(2);
      expect(uniqueStrings(contactNames(rows)).length).assertEqual(15);
      expect(countOf(contactNames(rows), '艾德里安')).assertEqual(3);
      expect(metrics.categories).assertEqual(6);
      expect(metrics.total - metrics.uniqueNames).assertEqual(2);
    });

    /**
     * @tc.name   directoryDuplicateNameLowersFillRatio
     * @tc.desc   The fill ratio falls below one once a duplicated name enters the directory.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directoryDuplicateNameLowersFillRatio', 0, () => {
      const rows = createSeedContacts();
      rows.push(cloneContact(rows[14]));
      const metrics = ContactMetrics.from(rows);
      expect(metrics.fillRatio() < 1).assertTrue();
      expect(metrics.fillRatio() > 0).assertTrue();
      expect(metrics.fillRatio()).assertEqual(15.0 / 16);
      expect(ContactMetrics.from(createSeedContacts()).fillRatio()).assertEqual(1);
      expect(metrics.duplicateNames).assertEqual(1);
      expect(Int.toDouble(metrics.uniqueNames) / metrics.total).assertEqual(15.0 / 16);
      expect(rows[15].name).assertEqual('法里');
    });

    /**
     * @tc.name   directoryDuplicateNamesCountedByName
     * @tc.desc   Only the repeated name is counted twice; distinct names stay at one occurrence each.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directoryDuplicateNamesCountedByName', 0, () => {
      const rows = createSeedContacts();
      rows.push(contactOf('康纳', '13900000032', 'connor32@example.com', '山东省济南市历下区', '', 'C'));
      const names = contactNames(rows);
      expect(countOf(names, '康纳')).assertEqual(2);
      expect(countOf(names, '艾登')).assertEqual(1);
      expect(countOf(names, '法里')).assertEqual(1);
      expect(uniqueStrings(names).length).assertEqual(15);
      expect(ContactMetrics.from(rows).duplicateNames).assertEqual(1);
      expect(SearchEngine.countCategory(rows, 'C')).assertEqual(4);
      expect(rows.length).assertEqual(16);
    });

    /**
     * @tc.name   directoryNamesListTracksManagerSize
     * @tc.desc   The projected names of manager.getContacts always match the manager row count.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directoryNamesListTracksManagerSize', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      expect(contactNames(manager.getContacts()).length).assertEqual(15);
      manager.addContact(contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'C'));
      expect(contactNames(manager.getContacts()).length).assertEqual(16);
      manager.addContact(new Contact());
      expect(contactNames(manager.getContacts()).length).assertEqual(17);
      manager.setContacts([]);
      expect(contactNames(manager.getContacts()).length).assertEqual(0);
      expect(manager.getContacts().length).assertEqual(0);
      expect(ContactMetrics.from(manager.getContacts()).total).assertEqual(0);
    });

    /**
     * @tc.name   directoryNamesListAfterDeleteDropsOneEntry
     * @tc.desc   Deleting 本杰明 removes exactly that entry from the projected name list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directoryNamesListAfterDeleteDropsOneEntry', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      manager.deleteContact(contactOf('本杰明', '', '', '', '', ''));
      const names = contactNames(manager.getContacts());
      expect(names.length).assertEqual(14);
      expect(names.indexOf('本杰明')).assertEqual(-1);
      expect(names[3]).assertEqual('本');
      expect(names[4]).assertEqual('卡梅隆');
      expect(uniqueStrings(names).length).assertEqual(14);
      expect(joined(names, '>').split('>').length).assertEqual(14);
      expect(SearchEngine.filterByName(manager.getContacts(), '本').length).assertEqual(1);
    });

    /**
     * @tc.name   directorySnapshotAfterDeleteMatchesRemaining
     * @tc.desc   Snapshots taken after a delete equal snapshots of the oracle list for the same name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directorySnapshotAfterDeleteMatchesRemaining', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      manager.deleteContact(contactOf('卡特琳娜', '', '', '', '', ''));
      const remaining: Contact[] = [];
      for (let index = 0; index < seed.length; index++) {
        if (seed[index].name !== '卡特琳娜') {
          remaining.push(seed[index]);
        }
      }
      expect(sameSnapshotArray(snapshotsOf(manager.getContacts()), snapshotsOf(remaining))).assertTrue();
      expect(snapshotsOf(manager.getContacts()).length).assertEqual(14);
      expect(snapshotsOf(manager.getContacts())[7].name).assertEqual('丹尼尔');
      expect(snapshotsOf(manager.getContacts())[6].name).assertEqual('康纳');
      expect(manager.getContacts().length).assertEqual(remaining.length);
      expect(uniqueStrings(contactNames(manager.getContacts())).length).assertEqual(14);
    });

    /**
     * @tc.name   directoryOrderAfterAddAppendsAtTail
     * @tc.desc   addContact appends, so the new name is the last element and the prefix is unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directoryOrderAfterAddAppendsAtTail', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const added = contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'C');
      manager.addContact(added);
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(16);
      expect(loaded[15].name).assertEqual('林岸');
      expect(loaded[15].category).assertEqual('C');
      expect(sameStringArray(contactNames(loaded).slice(0, 15), contactNames(expectedAfterAdd(seed, added).slice(0, 15)))).assertTrue();
      expect(sameContact(loaded[15], added)).assertTrue();
      expect(uniqueStrings(contactNames(loaded)).length).assertEqual(16);
    });

    /**
     * @tc.name   directoryInvariantsHoldAfterSetReplace
     * @tc.desc   Replacing the directory with two rows keeps names, metrics and snapshot alignment.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directoryInvariantsHoldAfterSetReplace', 0, () => {
      const manager = ContactManager.getInstance();
      const rows = [createSeedContacts()[0], createSeedContacts()[14]];
      manager.setContacts(rows);
      const loaded = manager.getContacts();
      const names = contactNames(loaded);
      expect(joined(names, '>')).assertEqual('艾德里安>法里');
      expect(ContactMetrics.from(loaded).total).assertEqual(2);
      expect(ContactMetrics.from(loaded).uniqueNames).assertEqual(2);
      expect(ContactMetrics.from(loaded).categories).assertEqual(2);
      expect(snapshotsOf(loaded).length).assertEqual(names.length);
      expect(snapshotsOf(loaded)[1].name).assertEqual(names[1]);
      expect(SearchEngine.filterByName(loaded, '艾').length).assertEqual(1);
    });

    /**
     * @tc.name   directoryJoinedNameStringHasFourteenSeparators
     * @tc.desc   Joining fifteen names with '>' produces exactly fourteen separator characters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directoryJoinedNameStringHasFourteenSeparators', 0, () => {
      const text = joined(contactNames(createSeedContacts()), '>');
      const parts = text.split('>');
      expect(parts.length).assertEqual(15);
      expect(parts.length - 1).assertEqual(14);
      expect(text.indexOf('>>')).assertEqual(-1);
      expect(text.startsWith('艾德里安')).assertTrue();
      expect(text.endsWith('法里')).assertTrue();
      expect(joined([], '>')).assertEqual('');
      expect(joined(['法里'], '>')).assertEqual('法里');
      logStep('directoryModelTest', 'joined directory name string verified');
    });

    /**
     * @tc.name   directoryFingerprintChangesWhenOrderChanges
     * @tc.desc   Reversing the directory changes the name fingerprint even though every name is kept.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('directoryFingerprintChangesWhenOrderChanges', 0, () => {
      const names = contactNames(createSeedContacts());
      const forward = textFingerprint(joined(names, ','));
      const reversed: string[] = [];
      for (let index = names.length - 1; index >= 0; index--) {
        reversed.push(names[index]);
      }
      const backward = textFingerprint(joined(reversed, ','));
      expect(backward === forward).assertFalse();
      expect(uniqueStrings(reversed).length).assertEqual(uniqueStrings(names).length);
      expect(reversed.length).assertEqual(names.length);
      expect(reversed[0]).assertEqual('法里');
      expect(forward).assertEqual(textFingerprint(joined(contactNames(createSeedContacts()), ',')));
      expect(backward >= 0).assertTrue();
    });

    /**
     * @tc.name   directorySearchIsSubstringNotPrefix
     * @tc.desc   The inner substring 德里安 finds 艾德里安, proving the search is not prefix bound.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directorySearchIsSubstringNotPrefix', 0, () => {
      const rows = createSeedContacts();
      const inner = SearchEngine.filterByName(rows, '德里安');
      expect(inner.length).assertEqual(1);
      expect(inner[0].name).assertEqual('艾德里安');
      expect(SearchEngine.filterByName(rows, '杰明').length).assertEqual(1);
      expect(SearchEngine.filterByName(rows, '杰明')[0].name).assertEqual('本杰明');
      expect(SearchEngine.filterByName(rows, '艾德').length).assertEqual(1);
      expect(SearchEngine.filterByName(rows, '德里').length).assertEqual(1);
      expect(SearchEngine.filterByName(rows, '德').length).assertEqual(2);
    });

    /**
     * @tc.name   directorySearchDoesNotInspectEmail
     * @tc.desc   The keyword only scans names, so a mailbox fragment matches nothing.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directorySearchDoesNotInspectEmail', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.filterByName(rows, 'cameron').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, 'example.com').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, 'katrina@').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '17777777777').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '陕西省').length).assertEqual(0);
      expect(rows[5].email).assertEqual('cameron@example.com');
      expect(SearchEngine.filterByName(rows, '卡梅隆').length).assertEqual(1);
    });

    /**
     * @tc.name   directoryEmptyDirectorySearchReturnsEmpty
     * @tc.desc   Searching an empty directory returns an empty list for both '' and any keyword.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directoryEmptyDirectorySearchReturnsEmpty', 0, () => {
      const empty: Contact[] = [];
      expect(SearchEngine.filterByName(empty, '').length).assertEqual(0);
      expect(SearchEngine.filterByName(empty, '艾').length).assertEqual(0);
      expect(SearchEngine.filterByName(empty, '法里').length).assertEqual(0);
      expect(SearchEngine.filterByName(empty, '').length).assertEqual(empty.length);
      expect(SearchEngine.filterByName(empty, '艾') === empty).assertFalse();
      expect(contactNames(SearchEngine.filterByName(empty, '')).length).assertEqual(0);
      expect(ContactMetrics.from(empty).total).assertEqual(0);
    });

    /**
     * @tc.name   directorySingleRowMetrics
     * @tc.desc   A one row directory reports unit totals and keeps its name in the projection.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directorySingleRowMetrics', 0, () => {
      const row = createSeedContacts()[8];
      const metrics = ContactMetrics.from([row]);
      expect(metrics.total).assertEqual(1);
      expect(metrics.uniqueNames).assertEqual(1);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.categories).assertEqual(1);
      expect(metrics.fillRatio()).assertEqual(1);
      expect(joined(contactNames([row]), ','))
        .assertEqual('丹尼尔');
      expect(snapshotsOf([row])[0].describe().split('/')[4]).assertEqual('D');
      expect(SearchEngine.filterByName([row], '丹').length).assertEqual(1);
    });

    /**
     * @tc.name   directoryDuplicateTripletCountsTwoDuplicates
     * @tc.desc   A directory of three rows named 本 has one unique name and two duplicates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directoryDuplicateTripletCountsTwoDuplicates', 0, () => {
      const rows = createSeedContacts();
      const triplet = [cloneContact(rows[3]), cloneContact(rows[3]), cloneContact(rows[3])];
      const metrics = ContactMetrics.from(triplet);
      expect(triplet.length).assertEqual(3);
      expect(metrics.uniqueNames).assertEqual(1);
      expect(metrics.duplicateNames).assertEqual(2);
      expect(metrics.total - metrics.uniqueNames).assertEqual(2);
      expect(uniqueStrings(contactNames(triplet)).length).assertEqual(1);
      expect(joined(uniqueStrings(contactNames(triplet)), ',')).assertEqual('本');
      expect(SearchEngine.filterByName(triplet, '本').length).assertEqual(3);
    });

    /**
     * @tc.name   directorySearchAfterDeleteReflectsCurrentRows
     * @tc.desc   After 艾登 is deleted a 艾 search returns three rows instead of four.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directorySearchAfterDeleteReflectsCurrentRows', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      expect(SearchEngine.filterByName(manager.getContacts(), '艾').length).assertEqual(4);
      manager.deleteContact(contactOf('艾登', '', '', '', '', ''));
      const hits = SearchEngine.filterByName(manager.getContacts(), '艾');
      expect(hits.length).assertEqual(3);
      expect(joined(contactNames(hits), '>')).assertEqual('艾德里安>艾拉>艾里');
      expect(countOf(contactNames(manager.getContacts()), '艾登')).assertEqual(0);
      expect(SearchEngine.countCategory(hits, 'E')).assertEqual(2);
      expect(SearchEngine.countCategory(hits, 'A')).assertEqual(1);
      expect(ContactMetrics.from(manager.getContacts()).total).assertEqual(14);
    });

    /**
     * @tc.name   directorySnapshotDetectsCategoryChange
     * @tc.desc   Changing only the category of one row breaks snapshot equality at that index alone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directorySnapshotDetectsCategoryChange', 0, () => {
      const rows = createSeedContacts();
      const before = snapshotsOf(rows);
      rows[12].category = 'F';
      const after = snapshotsOf(rows);
      expect(sameSnapshotArray(before, after)).assertFalse();
      expect(before[12].sameAs(after[12])).assertFalse();
      expect(before[11].sameAs(after[11])).assertTrue();
      expect(after[12].name).assertEqual('艾里');
      expect(after[12].category).assertEqual('F');
      expect(before[12].category).assertEqual('E');
    });

    /**
     * @tc.name   directoryOrderStableAcrossRepeatedReads
     * @tc.desc   Three consecutive manager reads return the same name order without mutation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directoryOrderStableAcrossRepeatedReads', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const first = contactNames(manager.getContacts());
      const second = contactNames(manager.getContacts());
      const third = contactNames(manager.getContacts());
      expect(sameStringArray(first, second)).assertTrue();
      expect(sameStringArray(second, third)).assertTrue();
      expect(joined(third, '>')).assertEqual(joined(first, '>'));
      expect(first === second).assertFalse();
      expect(manager.getContacts().length).assertEqual(15);
      expect(first[7]).assertEqual('卡特琳娜');
    });

    /**
     * @tc.name   directoryAddThenDeleteRestoresNames
     * @tc.desc   Adding 林岸 and deleting it again restores the original fifteen names exactly.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directoryAddThenDeleteRestoresNames', 0, () => {
      const manager = ContactManager.getInstance();
      const seed = createSeedContacts();
      manager.setContacts(seed);
      const added = contactOf('林岸', '13800138000', 'lin@example.com', '上海市徐汇区', '', 'C');
      manager.addContact(added);
      expect(manager.getContacts().length).assertEqual(16);
      manager.deleteContact(added);
      const loaded = manager.getContacts();
      expect(loaded.length).assertEqual(15);
      expect(sameStringArray(contactNames(loaded), contactNames(seed))).assertTrue();
      expect(sameSnapshotArray(snapshotsOf(loaded), snapshotsOf(seed))).assertTrue();
      expect(SearchEngine.filterByName(loaded, '林').length).assertEqual(0);
      expect(ContactMetrics.from(loaded).duplicateNames).assertEqual(0);
    });

    /**
     * @tc.name   directoryKeywordLongerThanNamesReturnsEmpty
     * @tc.desc   A keyword longer than every name finds nothing and leaves the directory intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('directoryKeywordLongerThanNamesReturnsEmpty', 0, () => {
      const rows = createSeedContacts();
      const hits = SearchEngine.filterByName(rows, '艾德里安和他的朋友们');
      expect(hits.length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '卡特琳娜卡').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '法里法里').length).assertEqual(0);
      expect(rows.length).assertEqual(15);
      expect(contactNames(rows)[0]).assertEqual('艾德里安');
      expect(SearchEngine.filterByName(rows, '艾德里安').length).assertEqual(1);
      expect(ContactMetrics.from(hits).categories).assertEqual(0);
    });

    /**
     * @tc.name   directorySearchBySpaceReturnsNone
     * @tc.desc   Names contain no spaces, so a single space matches no directory entry.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('directorySearchBySpaceReturnsNone', 0, () => {
      const rows = createSeedContacts();
      expect(SearchEngine.filterByName(rows, ' ').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '   ').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '\n').length).assertEqual(0);
      let spaced = 0;
      for (let index = 0; index < rows.length; index++) {
        if (rows[index].name.indexOf(' ') >= 0) {
          spaced = spaced + 1;
        }
      }
      expect(spaced).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '').length).assertEqual(15);
      expect(SearchEngine.filterByName(rows, ' 艾').length).assertEqual(0);
    });
    /**
     * @tc.name   directoryMetricsAfterSearchSubsetKeepLabels
     * @tc.desc   Metrics of a search subset count only the matched rows and their labels.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directoryMetricsAfterSearchSubsetKeepLabels', 0, () => {
      const hits = SearchEngine.filterByName(createSeedContacts(), '法');
      const metrics = ContactMetrics.from(hits);
      expect(metrics.total).assertEqual(2);
      expect(metrics.uniqueNames).assertEqual(2);
      expect(metrics.categories).assertEqual(1);
      expect(metrics.totalPhoneDigits).assertEqual(22);
      expect(metrics.fillRatio()).assertEqual(1);
      expect(joined(SearchEngine.groupByCategory(hits), '')).assertEqual('F');
      expect(SearchEngine.countCategory(hits, 'F')).assertEqual(2);
    });

    /**
     * @tc.name   directorySetWithDuplicatesPreservesOrder
     * @tc.desc   A hand-made list with a duplicate keeps insertion order and reports one duplicate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directorySetWithDuplicatesPreservesOrder', 0, () => {
      const manager = ContactManager.getInstance();
      const rows = [
        createSeedContacts()[4],
        createSeedContacts()[0],
        createSeedContacts()[4]
      ];
      manager.setContacts(rows);
      const names = contactNames(manager.getContacts());
      expect(joined(names, '>')).assertEqual('本杰明>艾德里安>本杰明');
      expect(names.length).assertEqual(3);
      expect(ContactMetrics.from(manager.getContacts()).duplicateNames).assertEqual(1);
      expect(ContactMetrics.from(manager.getContacts()).uniqueNames).assertEqual(2);
      expect(SearchEngine.filterByName(manager.getContacts(), '本').length).assertEqual(2);
      expect(manager.getContacts()[0].name).assertEqual('本杰明');
    });

    /**
     * @tc.name   directorySearchHitsShareCategoryGroup
     * @tc.desc   Hits for 卡 are both category C rows, so the grouped label list holds one label.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('directorySearchHitsShareCategoryGroup', 0, () => {
      const hits = SearchEngine.filterByName(createSeedContacts(), '卡');
      expect(hits.length).assertEqual(2);
      expect(joined(contactNames(hits), '>')).assertEqual('卡梅隆>卡特琳娜');
      expect(SearchEngine.groupByCategory(hits).length).assertEqual(1);
      expect(SearchEngine.countCategory(hits, 'C')).assertEqual(2);
      expect(SearchEngine.countCategory(hits, 'B')).assertEqual(0);
      expect(joined(SearchEngine.groupByCategory(hits), '')).assertEqual('C');
      expect(uniqueStrings(contactNames(hits)).length).assertEqual(2);
      expect(hits[1].name.length).assertEqual(4);
    });
    /**
     * @tc.name   directoryEmptySearchHitsSurviveLaterDelete
     * @tc.desc   A full search result captured before a delete keeps all fifteen clones afterwards.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactDirectoryModel scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('directoryEmptySearchHitsSurviveLaterDelete', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts(createSeedContacts());
      const hits = SearchEngine.filterByName(manager.getContacts(), '');
      expect(hits.length).assertEqual(15);
      manager.deleteContact(contactOf('法比而', '', '', '', '', ''));
      expect(hits.length).assertEqual(15);
      expect(countOf(contactNames(hits), '法比而')).assertEqual(1);
      expect(manager.getContacts().length).assertEqual(14);
      expect(countOf(contactNames(manager.getContacts()), '法比而')).assertEqual(0);
      expect(hits[13].name).assertEqual('法比而');
    });
  });
}
