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
 * ContactManagerDuplicates covers the behaviour that matters when two stored
 * rows share one name.
 *
 * Anchors:
 *   ContactManager.ets:51-53   addContact keeps every copy of a name
 *   ContactManager.ets:56-65   updateContact breaks after the first name match
 *   ContactManager.ets:68-70   deleteContact filters every row with that name
 *   AddressBookEdit.ets:176-279 duplicate name rejection before insert
 *   SharedDriver.ets:236-249   isDuplicateName oracle
 *   SharedDriver.ets:834-864   duplicateNames metric
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
  countOf,
  uniqueStrings,
  resetContactManager,
  ContactValidation,
  SearchEngine,
  ContactMetrics
} from '../Shared/SharedDriver';

/** Two rows that intentionally share the name 双生 but differ in other fields. */
function duplicatePair(): Contact[] {
  const rows: Contact[] = [];
  rows.push(contactOf('双生', '13511110001', 'twin.one@example.com', '江苏省南京市秦淮区', '', 'A'));
  rows.push(contactOf('双生', '13511110002', 'twin.two@example.com', '江苏省南京市玄武区', '', 'B'));
  return rows;
}

/** Four rows where two names are repeated once each. */
function mixedDuplicates(): Contact[] {
  const rows: Contact[] = [];
  rows.push(contactOf('重名甲', '13622220001', 'dup.a1@example.com', '浙江省温州市鹿城区', '', 'C'));
  rows.push(contactOf('独立乙', '13622220002', 'solo.b@example.com', '浙江省嘉兴市南湖区', '', 'D'));
  rows.push(contactOf('重名甲', '13622220003', 'dup.a2@example.com', '浙江省绍兴市越城区', '', 'E'));
  rows.push(contactOf('独立乙', '13622220004', 'solo.b2@example.com', '浙江省金华市婺城区', '', 'F'));
  return rows;
}

/** Names whose occurrences equal the requested value. */
function occurrences(rows: Contact[], name: string): number {
  return countOf(contactNames(rows), name);
}

/** All slots carrying a name, in storage order. */
function rowsNamed(rows: Contact[], name: string): Contact[] {
  const result: Contact[] = [];
  for (let index = 0; index < rows.length; index++) {
    if (rows[index].name === name) {
      result.push(rows[index]);
    }
  }
  return result;
}

/** Installs the rows and returns the singleton. */
function installDuplicates(rows: Contact[]): ContactManager {
  const manager: ContactManager = ContactManager.getInstance();
  manager.setContacts(rows);
  return manager;
}

export default function contactManagerDuplicatesTest(): void {
  describe('ContactManagerDuplicates', () => {
    beforeAll(() => {
      logSuite('ContactManagerDuplicates', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('ContactManagerDuplicates', 'end');
    });

    /**
     * @tc.name   addingTwoRowsWithOneNameKeepsBoth
     * @tc.desc   addContact never deduplicates, so both 双生 rows survive the second append.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addingTwoRowsWithOneNameKeepsBoth', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const pair: Contact[] = duplicatePair();
      manager.addContact(pair[0]);
      expect(manager.getContacts().length).assertEqual(1);
      manager.addContact(pair[1]);
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(2);
      expect(rows[0].name).assertEqual('双生');
      expect(rows[1].name).assertEqual('双生');
      expect(occurrences(rows, '双生')).assertEqual(2);
      expect(rows[0].phone === rows[1].phone).assertFalse();
    });

    /**
     * @tc.name   threeCopiesOfOneNameOccupyThreeSlots
     * @tc.desc   Appending the same name three times yields three rows with distinct emails.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('threeCopiesOfOneNameOccupyThreeSlots', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      manager.addContact(contactOf('三连', '13733330001', 'three1@example.com', '福建省厦门市思明区', '', 'A'));
      manager.addContact(contactOf('三连', '13733330002', 'three2@example.com', '福建省泉州市鲤城区', '', 'B'));
      manager.addContact(contactOf('三连', '13733330003', 'three3@example.com', '福建省漳州市芗城区', '', 'C'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(3);
      expect(occurrences(rows, '三连')).assertEqual(3);
      expect(rows[0].email).assertEqual('three1@example.com');
      expect(rows[2].email).assertEqual('three3@example.com');
      expect(uniqueStrings(contactNames(rows)).length).assertEqual(1);
    });

    /**
     * @tc.name   deleteRemovesEveryCopyOfTheName
     * @tc.desc   deleteContact filters all 双生 rows in one call, not just the first match.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('deleteRemovesEveryCopyOfTheName', 0, () => {
      const manager: ContactManager = installDuplicates(duplicatePair());
      expect(manager.getContacts().length).assertEqual(2);
      manager.deleteContact(contactOf('双生', '', '', ''));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(0);
      expect(occurrences(rows, '双生')).assertEqual(0);
      expect(rowsNamed(rows, '双生').length).assertEqual(0);
      expect(joined(contactNames(rows))).assertEqual('');
    });

    /**
     * @tc.name   deleteOnlyFiltersTheRequestedName
     * @tc.desc   A mixed payload loses the repeated 重名甲 rows while 独立乙 stays.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteOnlyFiltersTheRequestedName', 0, () => {
      const manager: ContactManager = installDuplicates(mixedDuplicates());
      manager.deleteContact(new Contact('重名甲'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(2);
      expect(occurrences(rows, '重名甲')).assertEqual(0);
      expect(occurrences(rows, '独立乙')).assertEqual(2);
      expect(rows[0].category).assertEqual('D');
      expect(rows[1].category).assertEqual('F');
    });

    /**
     * @tc.name   mergingFiltersBothRepeatedNames
     * @tc.desc   Two delete calls remove both repeated names and leave no rows behind.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mergingFiltersBothRepeatedNames', 0, () => {
      const manager: ContactManager = installDuplicates(mixedDuplicates());
      expect(manager.getContacts().length).assertEqual(4);
      manager.deleteContact(new Contact('重名甲'));
      expect(manager.getContacts().length).assertEqual(2);
      manager.deleteContact(new Contact('独立乙'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(0);
      expect(contactNames(rows).length).assertEqual(0);
      expect(joined(contactNames(rows))).assertEqual('');
    });

    /**
     * @tc.name   deleteMissingNameKeepsDuplicateRows
     * @tc.desc   A delete for an absent name leaves every stored duplicate untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteMissingNameKeepsDuplicateRows', 0, () => {
      const manager: ContactManager = installDuplicates(duplicatePair());
      manager.deleteContact(new Contact('不存在'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(2);
      expect(occurrences(rows, '双生')).assertEqual(2);
      expect(rows[0].phone).assertEqual('13511110001');
      expect(rows[1].phone).assertEqual('13511110002');
      expect(rows[0].category).assertEqual('A');
    });

    /**
     * @tc.name   updateReplacesOnlyTheFirstDuplicate
     * @tc.desc   updateContact breaks after replacing slot zero, so the second 双生 keeps its phone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('updateReplacesOnlyTheFirstDuplicate', 0, () => {
      const manager: ContactManager = installDuplicates(duplicatePair());
      const replacement: Contact = contactOf('双生', '13999990000', 'twin.one@example.com', '江苏省南京市秦淮区', '', 'A');
      manager.updateContact(replacement);
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(2);
      expect(rows[0].phone).assertEqual('13999990000');
      expect(rows[1].phone).assertEqual('13511110002');
      expect(rows[0] === replacement).assertTrue();
      expect(rows[1] === replacement).assertFalse();
      expect(occurrences(rows, '双生')).assertEqual(2);
    });

    /**
     * @tc.name   updateKeepsLaterDuplicateFieldsIntact
     * @tc.desc   Only the first duplicate receives the new email, address and category.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateKeepsLaterDuplicateFieldsIntact', 0, () => {
      const manager: ContactManager = installDuplicates(duplicatePair());
      manager.updateContact(contactOf('双生', '13511110001', 'moved@example.com', '江苏省南京市浦口区', '', 'F'));
      const rows: Contact[] = manager.getContacts();
      expect(rows[0].email).assertEqual('moved@example.com');
      expect(rows[0].address).assertEqual('江苏省南京市浦口区');
      expect(rows[0].category).assertEqual('F');
      expect(rows[1].email).assertEqual('twin.two@example.com');
      expect(rows[1].address).assertEqual('江苏省南京市玄武区');
      expect(rows[1].category).assertEqual('B');
    });

    /**
     * @tc.name   updateKeepsDuplicateSlotPositions
     * @tc.desc   Replacing the first 双生 does not move it or the neighbouring rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('updateKeepsDuplicateSlotPositions', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const rows: Contact[] = [];
      rows.push(contactOf('前哨', '13811110001', 'front@example.com', '广东省深圳市南山区', '', 'A'));
      rows.push(contactOf('双生', '13811110002', 'twin.one@example.com', '广东省深圳市福田区', '', 'B'));
      rows.push(contactOf('双生', '13811110003', 'twin.two@example.com', '广东省深圳市罗湖区', '', 'C'));
      rows.push(contactOf('后卫', '13811110004', 'rear@example.com', '广东省深圳市宝安区', '', 'D'));
      manager.setContacts(rows);
      manager.updateContact(contactOf('双生', '13811119999', 'twin.new@example.com', '广东省深圳市龙岗区', '', 'E'));
      const stored: Contact[] = manager.getContacts();
      expect(stored.length).assertEqual(4);
      expect(stored[0].name).assertEqual('前哨');
      expect(stored[1].name).assertEqual('双生');
      expect(stored[1].phone).assertEqual('13811119999');
      expect(stored[2].phone).assertEqual('13811110003');
      expect(stored[3].name).assertEqual('后卫');
    });

    /**
     * @tc.name   duplicateValidationRejectsAnExistingName
     * @tc.desc   The edit form oracle reports name-duplicate and blocks submission for 双生.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('duplicateValidationRejectsAnExistingName', 0, () => {
      const existing: Contact[] = duplicatePair();
      const candidate: Contact = contactOf('双生', '13744440001', 'candidate@example.com',
        '江苏省南京市雨花台区', '', 'A');
      const errors: string[] = ContactValidation.validate(candidate, existing);
      expect(errors.indexOf('name-duplicate') >= 0).assertTrue();
      expect(countOf(errors, 'name-duplicate')).assertEqual(1);
      expect(ContactValidation.canSubmit(candidate, existing)).assertFalse();
      expect(errors.indexOf('name-empty') < 0).assertTrue();
      expect(errors.indexOf('phone-empty') < 0).assertTrue();
    });

    /**
     * @tc.name   duplicateValidationAcceptsAnUnusedName
     * @tc.desc   A candidate whose name is absent passes validation even when the list has duplicates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('duplicateValidationAcceptsAnUnusedName', 0, () => {
      const existing: Contact[] = duplicatePair();
      const candidate: Contact = contactOf('新人', '13744440002', 'fresh@example.com',
        '江苏省南京市栖霞区', '', 'B');
      const errors: string[] = ContactValidation.validate(candidate, existing);
      expect(errors.length).assertEqual(0);
      expect(errors.indexOf('name-duplicate') < 0).assertTrue();
      expect(ContactValidation.isDuplicateName(existing, '新人')).assertFalse();
      expect(ContactValidation.isDuplicateName(existing, '双生')).assertTrue();
      expect(ContactValidation.canSubmit(candidate, existing)).assertTrue();
    });

    /**
     * @tc.name   duplicateValidationKeepsItsOwnErrorsSeparate
     * @tc.desc   An empty phone is reported alongside name-duplicate without suppressing it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateValidationKeepsItsOwnErrorsSeparate', 0, () => {
      const existing: Contact[] = duplicatePair();
      const candidate: Contact = contactOf('双生', '', 'candidate@example.com',
        '江苏省南京市六合区', '', 'C');
      const errors: string[] = ContactValidation.validate(candidate, existing);
      expect(errors.indexOf('phone-empty') >= 0).assertTrue();
      expect(errors.indexOf('name-duplicate') >= 0).assertTrue();
      expect(errors.length).assertEqual(2);
      expect(ContactValidation.canSubmit(candidate, existing)).assertFalse();
      expect(ContactValidation.isDuplicateName(existing, '双生')).assertTrue();
    });

    /**
     * @tc.name   searchKeepsBothDuplicateMatches
     * @tc.desc   The list search returns both 双生 rows because filtering never deduplicates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('searchKeepsBothDuplicateMatches', 0, () => {
      const pair: Contact[] = duplicatePair();
      const found: Contact[] = SearchEngine.filterByName(pair, '双生');
      expect(found.length).assertEqual(2);
      expect(found[0].email).assertEqual('twin.one@example.com');
      expect(found[1].email).assertEqual('twin.two@example.com');
      expect(occurrences(found, '双生')).assertEqual(2);
      expect(found[0].phone === found[1].phone).assertFalse();
    });

    /**
     * @tc.name   searchOnAPartialKeywordKeepsDuplicates
     * @tc.desc   A one character keyword matches both copies and an unrelated row stays out.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('searchOnAPartialKeywordKeepsDuplicates', 0, () => {
      const rows: Contact[] = mixedDuplicates();
      const found: Contact[] = SearchEngine.filterByName(rows, '重名');
      expect(found.length).assertEqual(2);
      expect(occurrences(found, '重名甲')).assertEqual(2);
      expect(found[0].phone).assertEqual('13622220001');
      expect(found[1].phone).assertEqual('13622220003');
      const none: Contact[] = SearchEngine.filterByName(rows, '隔离');
      expect(none.length).assertEqual(0);
    });

    /**
     * @tc.name   metricsCountOneDuplicateForAPair
     * @tc.desc   Two rows with one shared name produce one duplicate name in the aggregate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('metricsCountOneDuplicateForAPair', 0, () => {
      const metrics: ContactMetrics = ContactMetrics.from(duplicatePair());
      expect(metrics.total).assertEqual(2);
      expect(metrics.uniqueNames).assertEqual(1);
      expect(metrics.duplicateNames).assertEqual(1);
      expect(metrics.categories).assertEqual(2);
      expect(metrics.fillRatio()).assertEqual(0.5);
    });

    /**
     * @tc.name   metricsCountTwoDuplicatesForATriple
     * @tc.desc   Three rows sharing one name produce two extra name occurrences.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsCountTwoDuplicatesForATriple', 0, () => {
      const rows: Contact[] = [];
      rows.push(contactOf('三联', '13955550001', 'triple1@example.com', '山东省烟台市芝罘区', '', 'A'));
      rows.push(contactOf('三联', '13955550002', 'triple2@example.com', '山东省潍坊市奎文区', '', 'A'));
      rows.push(contactOf('三联', '13955550003', 'triple3@example.com', '山东省临沂市兰山区', '', 'A'));
      const metrics: ContactMetrics = ContactMetrics.from(rows);
      expect(metrics.total).assertEqual(3);
      expect(metrics.uniqueNames).assertEqual(1);
      expect(metrics.duplicateNames).assertEqual(2);
      expect(metrics.categories).assertEqual(1);
      expect(metrics.totalPhoneDigits).assertEqual(33);
    });

    /**
     * @tc.name   metricsCountMixedDuplicatePattern
     * @tc.desc   Two repeated names in four rows produce two duplicate occurrences overall.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsCountMixedDuplicatePattern', 0, () => {
      const rows: Contact[] = mixedDuplicates();
      const metrics: ContactMetrics = ContactMetrics.from(rows);
      expect(metrics.total).assertEqual(4);
      expect(metrics.uniqueNames).assertEqual(2);
      expect(metrics.duplicateNames).assertEqual(2);
      expect(metrics.categories).assertEqual(4);
      expect(metrics.fillRatio()).assertEqual(0.5);
    });

    /**
     * @tc.name   metricsIgnoreDuplicatesForUniqueNames
     * @tc.desc   A payload without repeated names reports zero duplicates and a full fill ratio.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('metricsIgnoreDuplicatesForUniqueNames', 0, () => {
      const rows: Contact[] = [];
      rows.push(contactOf('单甲', '13166660001', 'single1@example.com', '辽宁省大连市中山区', '', 'A'));
      rows.push(contactOf('单乙', '13166660002', 'single2@example.com', '辽宁省大连市西岗区', '', 'B'));
      rows.push(contactOf('单丙', '13166660003', 'single3@example.com', '辽宁省大连市沙河口区', '', 'C'));
      const metrics: ContactMetrics = ContactMetrics.from(rows);
      expect(metrics.total).assertEqual(3);
      expect(metrics.uniqueNames).assertEqual(3);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.fillRatio()).assertEqual(1);
      expect(metrics.categories).assertEqual(3);
    });

    /**
     * @tc.name   metricsFingerprintChangesWhenADuplicateArrives
     * @tc.desc   Adding a second 双生 changes both duplicateNames and the aggregate fingerprint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('metricsFingerprintChangesWhenADuplicateArrives', 0, () => {
      const rows: Contact[] = duplicatePair();
      const before: ContactMetrics = ContactMetrics.from(rows.slice(0, 1));
      const after: ContactMetrics = ContactMetrics.from(rows);
      expect(before.duplicateNames).assertEqual(0);
      expect(after.duplicateNames).assertEqual(1);
      expect(before.fingerprint() === after.fingerprint()).assertFalse();
      expect(after.total > before.total).assertTrue();
      expect(after.uniqueNames).assertEqual(before.uniqueNames);
    });

    /**
     * @tc.name   setKeepsDuplicateRowsInPayloadOrder
     * @tc.desc   A bulk payload with repeated names preserves both copies and their slot order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('setKeepsDuplicateRowsInPayloadOrder', 0, () => {
      const manager: ContactManager = installDuplicates(mixedDuplicates());
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(4);
      expect(sameStringArray(contactNames(rows), ['重名甲', '独立乙', '重名甲', '独立乙'])).assertTrue();
      expect(rows[0].phone).assertEqual('13622220001');
      expect(rows[2].phone).assertEqual('13622220003');
      expect(rows[1].email).assertEqual('solo.b@example.com');
    });

    /**
     * @tc.name   addDuplicateDoesNotMergeFields
     * @tc.desc   A third copy of a name keeps its own field values instead of merging with earlier rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addDuplicateDoesNotMergeFields', 0, () => {
      const manager: ContactManager = installDuplicates(duplicatePair());
      manager.addContact(contactOf('双生', '13511110003', 'twin.three@example.com',
        '江苏省南京市江宁区', 'avatar3.jpg', 'C'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(3);
      expect(rows[2].email).assertEqual('twin.three@example.com');
      expect(rows[2].address).assertEqual('江苏省南京市江宁区');
      expect(rows[2].avatar).assertEqual('avatar3.jpg');
      expect(rows[0].avatar).assertEqual('');
      expect(rows[1].category).assertEqual('B');
    });

    /**
     * @tc.name   deleteThenReaddMovesTheNameToTheTail
     * @tc.desc   Deleting both copies and appending again leaves exactly one row at the end.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deleteThenReaddMovesTheNameToTheTail', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const rows: Contact[] = [];
      rows.push(contactOf('留客', '13277770001', 'stay@example.com', '河南省洛阳市洛龙区', '', 'A'));
      rows.push(contactOf('双生', '13277770002', 'twin.one@example.com', '河南省开封市鼓楼区', '', 'B'));
      rows.push(contactOf('双生', '13277770003', 'twin.two@example.com', '河南省平顶山市新华区', '', 'C'));
      manager.setContacts(rows);
      manager.deleteContact(new Contact('双生'));
      expect(manager.getContacts().length).assertEqual(1);
      manager.addContact(contactOf('双生', '13277770004', 'twin.back@example.com',
        '河南省安阳市文峰区', '', 'D'));
      const stored: Contact[] = manager.getContacts();
      expect(stored.length).assertEqual(2);
      expect(stored[0].name).assertEqual('留客');
      expect(stored[1].name).assertEqual('双生');
      expect(stored[1].email).assertEqual('twin.back@example.com');
      expect(occurrences(stored, '双生')).assertEqual(1);
    });

    /**
     * @tc.name   secondUpdateRewritesTheSameFirstSlot
     * @tc.desc   Two updates for a repeated name both target slot zero and never touch the copy.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('secondUpdateRewritesTheSameFirstSlot', 0, () => {
      const manager: ContactManager = installDuplicates(duplicatePair());
      manager.updateContact(contactOf('双生', '13700000001', 'first.pass@example.com',
        '江苏省南京市建邺区', '', 'A'));
      expect(manager.getContacts()[0].email).assertEqual('first.pass@example.com');
      manager.updateContact(contactOf('双生', '13700000002', 'second.pass@example.com',
        '江苏省南京市鼓楼区', '', 'B'));
      const rows: Contact[] = manager.getContacts();
      expect(rows[0].phone).assertEqual('13700000002');
      expect(rows[0].email).assertEqual('second.pass@example.com');
      expect(rows[1].phone).assertEqual('13511110002');
      expect(rows[1].email).assertEqual('twin.two@example.com');
    });

    /**
     * @tc.name   deleteMatchesOnlyTheNameField
     * @tc.desc   The delete request carries a different phone but still removes every 双生 row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteMatchesOnlyTheNameField', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      const rows: Contact[] = [];
      rows.push(contactOf('双生', '13488880001', 'twin.one@example.com', '湖北省黄石市黄石港区', '', 'A'));
      rows.push(contactOf('旁观', '13488880002', 'side@example.com', '湖北省十堰市茅箭区', '', 'B'));
      rows.push(contactOf('双生', '13488880003', 'twin.two@example.com', '湖北省襄阳市襄城区', '', 'C'));
      manager.setContacts(rows);
      manager.deleteContact(contactOf('双生', '00000000000', 'wrong@example.com', '错误地址', '', 'Z'));
      const stored: Contact[] = manager.getContacts();
      expect(stored.length).assertEqual(1);
      expect(stored[0].name).assertEqual('旁观');
      expect(stored[0].phone).assertEqual('13488880002');
      expect(occurrences(stored, '双生')).assertEqual(0);
      expect(rows.length).assertEqual(3);
    });

    /**
     * @tc.name   duplicateCategoryCollapsesGrouping
     * @tc.desc   Three copies in one category produce a single grouping key rather than three.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateCategoryCollapsesGrouping', 0, () => {
      const rows: Contact[] = [];
      rows.push(contactOf('同组', '13599990001', 'group1@example.com', '山西省晋中市榆次区', '', 'D'));
      rows.push(contactOf('同组', '13599990002', 'group2@example.com', '山西省运城市盐湖区', '', 'D'));
      rows.push(contactOf('同组', '13599990003', 'group3@example.com', '山西省临汾市尧都区', '', 'D'));
      const groups: string[] = SearchEngine.groupByCategory(rows);
      expect(groups.length).assertEqual(1);
      expect(groups[0]).assertEqual('D');
      expect(SearchEngine.countCategory(rows, 'D')).assertEqual(3);
      expect(ContactMetrics.from(rows).duplicateNames).assertEqual(2);
    });

    /**
     * @tc.name   returnedShellRetainsDuplicateRows
     * @tc.desc   Reading through the copied shell shows both copies and element edits reach the store.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('returnedShellRetainsDuplicateRows', 0, () => {
      const manager: ContactManager = installDuplicates(duplicatePair());
      const shell: Contact[] = manager.getContacts();
      expect(shell.length).assertEqual(2);
      expect(occurrences(shell, '双生')).assertEqual(2);
      shell[1].email = 'shell.edit@example.com';
      expect(manager.getContacts()[1].email).assertEqual('shell.edit@example.com');
      shell.push(contactOf('双生', '13511110009', 'pushed@example.com', '江苏省南京市高淳区'));
      expect(manager.getContacts().length).assertEqual(2);
      expect(occurrences(manager.getContacts(), '双生')).assertEqual(2);
    });

    /**
     * @tc.name   deletingAnotherNameKeepsDuplicateCount
     * @tc.desc   Removing the unique row from a mixed payload leaves both 重名甲 copies.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('deletingAnotherNameKeepsDuplicateCount', 0, () => {
      const manager: ContactManager = installDuplicates(mixedDuplicates());
      manager.deleteContact(new Contact('独立乙'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(2);
      expect(occurrences(rows, '重名甲')).assertEqual(2);
      expect(occurrences(rows, '独立乙')).assertEqual(0);
      expect(ContactMetrics.from(rows).duplicateNames).assertEqual(1);
      expect(ContactMetrics.from(rows).uniqueNames).assertEqual(1);
    });

    /**
     * @tc.name   duplicateRowsKeepDistinctAvatarAndAddress
     * @tc.desc   Two rows with one name still carry their own avatar and address values.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateRowsKeepDistinctAvatarAndAddress', 0, () => {
      const pair: Contact[] = duplicatePair();
      pair[0].avatar = 'operate_rdb_in_taskpool_photo1.jpg';
      pair[1].avatar = 'operate_rdb_in_taskpool_photo2.jpg';
      const manager: ContactManager = installDuplicates(pair);
      const rows: Contact[] = manager.getContacts();
      expect(rows[0].avatar).assertEqual('operate_rdb_in_taskpool_photo1.jpg');
      expect(rows[1].avatar).assertEqual('operate_rdb_in_taskpool_photo2.jpg');
      expect(rows[0].address === rows[1].address).assertFalse();
      expect(rows[0].address.startsWith('江苏省')).assertTrue();
      expect(rows[1].address.startsWith('江苏省')).assertTrue();
    });

    /**
     * @tc.name   duplicateNameBecomesFreeAfterDeletion
     * @tc.desc   Once both copies are deleted, the same name validates as a fresh candidate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateNameBecomesFreeAfterDeletion', 0, () => {
      const manager: ContactManager = installDuplicates(duplicatePair());
      const candidate: Contact = contactOf('双生', '13600000001', 'candidate@example.com',
        '江苏省南京市溧水区', '', 'B');
      expect(ContactValidation.canSubmit(candidate, manager.getContacts())).assertFalse();
      manager.deleteContact(new Contact('双生'));
      const remaining: Contact[] = manager.getContacts();
      expect(remaining.length).assertEqual(0);
      expect(ContactValidation.isDuplicateName(remaining, '双生')).assertFalse();
      expect(ContactValidation.validate(candidate, remaining).length).assertEqual(0);
      expect(ContactValidation.canSubmit(candidate, remaining)).assertTrue();
    });

    /**
     * @tc.name   occurrenceHelperFollowsUpdatesToDuplicateRows
     * @tc.desc   An update changes fields but not the name, so the occurrence count stays at two.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('occurrenceHelperFollowsUpdatesToDuplicateRows', 0, () => {
      const manager: ContactManager = installDuplicates(duplicatePair());
      expect(occurrences(manager.getContacts(), '双生')).assertEqual(2);
      manager.updateContact(contactOf('双生', '13800000011', 'renamed.phone@example.com',
        '江苏省南京市玄武区', '', 'F'));
      const rows: Contact[] = manager.getContacts();
      expect(occurrences(rows, '双生')).assertEqual(2);
      expect(rows[0].category).assertEqual('F');
      expect(rows[1].category).assertEqual('B');
      expect(uniqueStrings(contactNames(rows)).length).assertEqual(1);
      expect(rowsNamed(rows, '双生').length).assertEqual(2);
    });

    /**
     * @tc.name   mixedPayloadAfterOneDeletionKeepsMetricsConsistent
     * @tc.desc   Metrics recomputed after deleting one repeated name still report the other repeat.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mixedPayloadAfterOneDeletionKeepsMetricsConsistent', 0, () => {
      const manager: ContactManager = installDuplicates(mixedDuplicates());
      const before: ContactMetrics = ContactMetrics.from(manager.getContacts());
      expect(before.duplicateNames).assertEqual(2);
      manager.deleteContact(new Contact('重名甲'));
      const after: ContactMetrics = ContactMetrics.from(manager.getContacts());
      expect(after.total).assertEqual(2);
      expect(after.uniqueNames).assertEqual(1);
      expect(after.duplicateNames).assertEqual(1);
      expect(after.fillRatio()).assertEqual(0.5);
      expect(after.fingerprint() === before.fingerprint()).assertFalse();
    });

    /**
     * @tc.name   emptyKeywordSearchReturnsEveryDuplicate
     * @tc.desc   Clearing the search box returns a copy of all four rows including both repeats.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emptyKeywordSearchReturnsEveryDuplicate', 0, () => {
      const rows: Contact[] = mixedDuplicates();
      const found: Contact[] = SearchEngine.filterByName(rows, '');
      expect(found.length).assertEqual(4);
      expect(found === rows).assertFalse();
      expect(occurrences(found, '重名甲')).assertEqual(2);
      expect(occurrences(found, '独立乙')).assertEqual(2);
      found[0].email = 'changed@example.com';
      expect(rows[0].email).assertEqual('changed@example.com');
      expect(found[0] === rows[0]).assertTrue();
      expect(rows.length).assertEqual(4);
    });

    /**
     * @tc.name   duplicateNamesSurviveManagerReplacementCycles
     * @tc.desc   Replacing the payload twice keeps the second duplicate pair intact.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateNamesSurviveManagerReplacementCycles', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      manager.setContacts(duplicatePair());
      expect(occurrences(manager.getContacts(), '双生')).assertEqual(2);
      manager.setContacts(mixedDuplicates());
      expect(manager.getContacts().length).assertEqual(4);
      const pair: Contact[] = duplicatePair();
      pair[1].phone = '13511119999';
      manager.setContacts(pair);
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(2);
      expect(rows[1].phone).assertEqual('13511119999');
      expect(occurrences(rows, '双生')).assertEqual(2);
      expect(ContactMetrics.from(rows).duplicateNames).assertEqual(1);
    });

    /**
     * @tc.name   updatingTheSecondSlotRequiresItsOwnName
     * @tc.desc   Because update matches by name, updating the second copy rewrites the first slot again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('updatingTheSecondSlotRequiresItsOwnName', 0, () => {
      const manager: ContactManager = installDuplicates(duplicatePair());
      const second: Contact = manager.getContacts()[1];
      second.phone = '13900001111';
      expect(second.phone).assertEqual('13900001111');
      expect(manager.getContacts()[1].phone).assertEqual('13900001111');
      manager.updateContact(contactOf('双生', '13900002222', 'mask@example.com',
        '江苏省南京市浦口区', '', 'E'));
      const rows: Contact[] = manager.getContacts();
      expect(rows[0].phone).assertEqual('13900002222');
      expect(rows[1].phone).assertEqual('13900001111');
      expect(rows[0].email).assertEqual('mask@example.com');
      expect(rows[1].email).assertEqual('twin.two@example.com');
      expect(rows.length).assertEqual(2);
    });
    /**
     * @tc.name   duplicateRowsHaveIndependentMutableFields
     * @tc.desc   Changing one duplicate's phone and email leaves the other copy unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateRowsHaveIndependentMutableFields', 0, () => {
      const manager: ContactManager = installDuplicates(duplicatePair());
      const rows: Contact[] = manager.getContacts();
      rows[0].phone = '13000000001';
      rows[0].email = 'independent@example.com';
      rows[0].avatar = 'avatar-a.jpg';
      const stored: Contact[] = manager.getContacts();
      expect(stored[0].phone).assertEqual('13000000001');
      expect(stored[0].email).assertEqual('independent@example.com');
      expect(stored[0].avatar).assertEqual('avatar-a.jpg');
      expect(stored[1].phone).assertEqual('13511110002');
      expect(stored[1].email).assertEqual('twin.two@example.com');
      expect(stored[1].avatar).assertEqual('');
    });

    /**
     * @tc.name   deleteOnAnEmptyStoreIsANoOp
     * @tc.desc   Deleting a name before any rows exist changes nothing and keeps the manager readable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteOnAnEmptyStoreIsANoOp', 0, () => {
      const manager: ContactManager = ContactManager.getInstance();
      expect(manager.getContacts().length).assertEqual(0);
      manager.deleteContact(new Contact('双生'));
      expect(manager.getContacts().length).assertEqual(0);
      expect(occurrences(manager.getContacts(), '双生')).assertEqual(0);
      manager.addContact(duplicatePair()[0]);
      expect(manager.getContacts().length).assertEqual(1);
      expect(manager.getContacts()[0].name).assertEqual('双生');
    });

    /**
     * @tc.name   duplicateCountGrowsAfterSetAndOneAdd
     * @tc.desc   A pair from setContacts plus one appended copy yields three slots and two duplicates.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateCountGrowsAfterSetAndOneAdd', 0, () => {
      const manager: ContactManager = installDuplicates(duplicatePair());
      manager.addContact(contactOf('双生', '13511110003', 'twin.three@example.com',
        '江苏省南京市建邺区', '', 'C'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(3);
      expect(occurrences(rows, '双生')).assertEqual(3);
      expect(ContactMetrics.from(rows).duplicateNames).assertEqual(2);
      expect(ContactMetrics.from(rows).uniqueNames).assertEqual(1);
      expect(rows[2].phone).assertEqual('13511110003');
    });
    /**
     * @tc.name   searchKeywordTargetsTheNameOnly
     * @tc.desc   Matching a phone fragment or an email fragment returns no rows because search uses names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('searchKeywordTargetsTheNameOnly', 0, () => {
      const rows: Contact[] = duplicatePair();
      expect(SearchEngine.filterByName(rows, '1351111').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, 'twin.one').length).assertEqual(0);
      expect(SearchEngine.filterByName(rows, '双').length).assertEqual(2);
      expect(SearchEngine.filterByName(rows, '生').length).assertEqual(2);
      expect(SearchEngine.filterByName(rows, '双生').length).assertEqual(2);
      expect(SearchEngine.filterByName(rows, '双子').length).assertEqual(0);
    });

    /**
     * @tc.name   duplicatePhoneDigitsAccumulateAcrossCopies
     * @tc.desc   The aggregate phone digit count sums both copies even when the names collide.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('duplicatePhoneDigitsAccumulateAcrossCopies', 0, () => {
      const metrics: ContactMetrics = ContactMetrics.from(duplicatePair());
      expect(metrics.totalPhoneDigits).assertEqual(22);
      expect(metrics.total).assertEqual(2);
      expect(metrics.duplicateNames).assertEqual(1);
      const rows: Contact[] = duplicatePair();
      rows[1].phone = '135111100021';
      const longer: ContactMetrics = ContactMetrics.from(rows);
      expect(longer.totalPhoneDigits).assertEqual(23);
      expect(longer.total).assertEqual(2);
      expect(longer.duplicateNames).assertEqual(1);
      expect(longer.fingerprint() === metrics.fingerprint()).assertFalse();
    });
    /**
     * @tc.name   emptyStoreReportsNoDuplicateNames
     * @tc.desc   After removing every duplicate the metrics collapse to zero without dividing by zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactManagerDuplicates scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emptyStoreReportsNoDuplicateNames', 0, () => {
      const manager: ContactManager = installDuplicates(duplicatePair());
      manager.deleteContact(new Contact('双生'));
      const rows: Contact[] = manager.getContacts();
      expect(rows.length).assertEqual(0);
      const metrics: ContactMetrics = ContactMetrics.from(rows);
      expect(metrics.total).assertEqual(0);
      expect(metrics.duplicateNames).assertEqual(0);
      expect(metrics.uniqueNames).assertEqual(0);
      expect(metrics.fillRatio()).assertEqual(0);
      expect(metrics.totalPhoneDigits).assertEqual(0);
    });
  });
}
