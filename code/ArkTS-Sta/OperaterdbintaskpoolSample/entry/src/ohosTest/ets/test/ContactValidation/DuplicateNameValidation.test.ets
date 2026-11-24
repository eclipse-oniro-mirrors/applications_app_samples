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
 * Duplicate name detection shared by the edit page and the validator.
 *
 * Anchors:
 *   AddressBookEdit.ets:176-179  onChange sets isName from item.name === data.name
 *   AddressBookEdit.ets:102-110  isName blocks navigation and shows the toast
 *   AddressBookEdit.ets:105-108  toast message 姓名已存在，请重新输入! with 2000 ms
 *   SharedDriver.ets:68          DUPLICATE_NAME_TOAST literal
 *   SharedDriver.ets:242-249     isDuplicateName compares the exact name string
 *   SharedDriver.ets:236-238     name-duplicate is appended after every field code
 *   ContactManager.ets:41-70     copy on read, append, replace first, filter by name
 *
 * The comparison is a strict string equality: no trimming, no case folding and
 * no unicode normalisation. Two rows that differ only in whitespace or case are
 * therefore different names for this sample.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { ContactManager } from '../../../../main/ets/pages/model/ContactManager';
import {
  ACTION_ADD,
  DUPLICATE_NAME_TOAST,
  ROUTE_EDIT,
  ROUTE_LIST,
  ContactValidation,
  cloneContact,
  contactOf,
  contactNames,
  countOf,
  createSeedContacts,
  resetContactManager,
  uniqueStrings
} from '../Shared/SharedDriver';

/** A complete form that differs only in its name. */
function formNamed(name: string): Contact {
  return contactOf(name, '13800138000', 'duplicate@example.com', '北京市朝阳区');
}

/** Mirrors the isName flag computed by the name TextInput onChange handler. */
function pageBlocksSubmit(rows: Contact[], name: string): boolean {
  return ContactValidation.isDuplicateName(rows, name);
}

/** Repeats one character to reach an exact code unit count. */
function repeatedText(count: number, unit: string): string {
  let text = '';
  for (let index = 0; index < count; index++) {
    text = text + unit;
  }
  return text;
}

/** Names present in the singleton after a seed install. */
function managerNames(seed: Contact[]): string[] {
  const manager = resetContactManager(seed);
  return contactNames(manager.getContacts());
}

export default function duplicateNameValidationTest(): void {
  describe('DuplicateNameValidation', () => {
    beforeAll(() => {
      logSuite('DuplicateNameValidation', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('DuplicateNameValidation', 'end');
    });

    /**
     * @tc.name   seededNameIsReportedAsADuplicate
     * @tc.desc   The first seeded name is found by the strict equality scan.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('seededNameIsReportedAsADuplicate', 0, () => {
      logStep('DuplicateNameValidation', 'first seed name');
      const rows = createSeedContacts();
      expect(ContactValidation.isDuplicateName(rows, '艾德里安')).assertTrue();
      expect(pageBlocksSubmit(rows, '艾德里安')).assertTrue();
      expect(ContactValidation.validate(formNamed('艾德里安'), rows)[0]).assertEqual('name-duplicate');
      expect(rows.length).assertEqual(15);
    });

    /**
     * @tc.name   unlistedNameIsNotADuplicate
     * @tc.desc   A name absent from the seed leaves the duplicate scan negative and the form valid.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('unlistedNameIsNotADuplicate', 0, () => {
      const rows = createSeedContacts();
      expect(ContactValidation.isDuplicateName(rows, '未登记')).assertFalse();
      expect(pageBlocksSubmit(rows, '未登记')).assertFalse();
      expect(ContactValidation.validate(formNamed('未登记'), rows).length).assertEqual(0);
      expect(ContactValidation.canSubmit(formNamed('未登记'), rows)).assertTrue();
    });

    /**
     * @tc.name   comparisonIsExactAndNotAByPrefix
     * @tc.desc   本杰明 and 本 both exist, yet 本杰 is not a duplicate of either.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('comparisonIsExactAndNotAByPrefix', 0, () => {
      const rows = createSeedContacts();
      expect(ContactValidation.isDuplicateName(rows, '本')).assertTrue();
      expect(ContactValidation.isDuplicateName(rows, '本杰明')).assertTrue();
      expect(ContactValidation.isDuplicateName(rows, '本杰')).assertFalse();
      expect(ContactValidation.isDuplicateName(rows, '杰明')).assertFalse();
      expect(ContactValidation.isDuplicateName(rows, '本杰明明')).assertFalse();
    });

    /**
     * @tc.name   comparisonIsCaseSensitiveForLatinNames
     * @tc.desc   Ben and ben are separate rows, so only the exact spelling collides.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('comparisonIsCaseSensitiveForLatinNames', 0, () => {
      const rows: Contact[] = [
        contactOf('Ben', '13800138000', 'big@example.com', '地址一', '', 'A'),
        contactOf('ben', '13900139000', 'small@example.com', '地址二', '', 'B')
      ];
      expect(ContactValidation.isDuplicateName(rows, 'Ben')).assertTrue();
      expect(ContactValidation.isDuplicateName(rows, 'ben')).assertTrue();
      expect(ContactValidation.isDuplicateName(rows, 'BEN')).assertFalse();
      expect(ContactValidation.isDuplicateName(rows, 'bEn')).assertFalse();
      expect(ContactValidation.validate(formNamed('BEN'), rows).length).assertEqual(0);
    });

    /**
     * @tc.name   nameEqualityCountsEveryRowOfTheSeed
     * @tc.desc   All fifteen seeded names are duplicates and all fifteen seed names are unique.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('nameEqualityCountsEveryRowOfTheSeed', 0, () => {
      const rows = createSeedContacts();
      const names = contactNames(rows);
      let hits = 0;
      for (let index = 0; index < names.length; index++) {
        if (ContactValidation.isDuplicateName(rows, names[index])) {
          hits = hits + 1;
        }
      }
      expect(hits).assertEqual(15);
      expect(uniqueStrings(names).length).assertEqual(15);
      expect(names.length).assertEqual(15);
    });

    /**
     * @tc.name   lastSeedRowIsStillFoundByTheScan
     * @tc.desc   Equality is checked against every element, including the final 法里 row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('lastSeedRowIsStillFoundByTheScan', 0, () => {
      const rows = createSeedContacts();
      const last = rows[14].name;
      expect(last).assertEqual('法里');
      expect(ContactValidation.isDuplicateName(rows, last)).assertTrue();
      expect(ContactValidation.validate(formNamed(last), rows).length).assertEqual(1);
      expect(ContactValidation.isDuplicateName(rows, '法')).assertFalse();
    });

    /**
     * @tc.name   duplicateNameCheckNeedsAnExistingRow
     * @tc.desc   An empty existing list can never report a duplicate, even for a seeded name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('duplicateNameCheckNeedsAnExistingRow', 0, () => {
      const rows: Contact[] = [];
      expect(ContactValidation.isDuplicateName(rows, '艾德里安')).assertFalse();
      expect(ContactValidation.validate(formNamed('艾德里安'), rows).length).assertEqual(0);
      expect(ContactValidation.canSubmit(formNamed('艾德里安'), rows)).assertTrue();
      expect(rows.length).assertEqual(0);
    });

    /**
     * @tc.name   leadingSpaceMakesADistinctName
     * @tc.desc   A space prefixed copy of a seeded name is not trimmed before comparison.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('leadingSpaceMakesADistinctName', 0, () => {
      const rows = createSeedContacts();
      const padded = ' ' + rows[0].name;
      expect(padded.length).assertEqual(rows[0].name.length + 1);
      expect(padded.trim()).assertEqual(rows[0].name);
      expect(ContactValidation.isDuplicateName(rows, padded)).assertFalse();
      expect(ContactValidation.canSubmit(formNamed(padded), rows)).assertTrue();
    });

    /**
     * @tc.name   trailingSpaceMakesADistinctName
     * @tc.desc   A space appended to a seeded name also escapes the duplicate scan.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('trailingSpaceMakesADistinctName', 0, () => {
      const rows = createSeedContacts();
      const padded = rows[2].name + ' ';
      expect(padded.trim()).assertEqual(rows[2].name);
      expect(ContactValidation.isDuplicateName(rows, padded)).assertFalse();
      expect(ContactValidation.isDuplicateName(rows, rows[2].name)).assertTrue();
      expect(ContactValidation.validate(formNamed(padded), rows).length).assertEqual(0);
    });

    /**
     * @tc.name   innerDoubleSpaceMakesADistinctName
     * @tc.desc   Collapsing inner whitespace is not part of the comparison.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('innerDoubleSpaceMakesADistinctName', 0, () => {
      const rows: Contact[] = [contactOf('王 小明', '13800138000', 'wang@example.com', '地址', '', 'A')];
      expect(ContactValidation.isDuplicateName(rows, '王 小明')).assertTrue();
      expect(ContactValidation.isDuplicateName(rows, '王  小明')).assertFalse();
      expect(ContactValidation.isDuplicateName(rows, '王小明')).assertFalse();
      expect(ContactValidation.validate(formNamed('王  小明'), rows).length).assertEqual(0);
    });

    /**
     * @tc.name   duplicateAppearsAfterASingleAddedRow
     * @tc.desc   Appending one contact to the manager makes its name a duplicate immediately.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateAppearsAfterASingleAddedRow', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      const added = contactOf('新增者', '13500135000', 'added@example.com', '新地址', '', 'C');
      expect(ContactValidation.isDuplicateName(manager.getContacts(), '新增者')).assertFalse();
      manager.addContact(added);
      expect(manager.getContacts().length).assertEqual(16);
      expect(ContactValidation.isDuplicateName(manager.getContacts(), '新增者')).assertTrue();
      expect(ContactValidation.canSubmit(formNamed('新增者'), manager.getContacts())).assertFalse();
    });

    /**
     * @tc.name   duplicateDisappearsAfterDeletingTheRow
     * @tc.desc   Deleting the only row with a name frees that name for a new form.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateDisappearsAfterDeletingTheRow', 0, () => {
      const seed = createSeedContacts();
      const manager = resetContactManager(seed);
      const target = seed[3];
      expect(ContactValidation.isDuplicateName(manager.getContacts(), target.name)).assertTrue();
      manager.deleteContact(target);
      expect(manager.getContacts().length).assertEqual(14);
      expect(ContactValidation.isDuplicateName(manager.getContacts(), target.name)).assertFalse();
      expect(ContactValidation.validate(formNamed(target.name), manager.getContacts()).length).assertEqual(0);
    });

    /**
     * @tc.name   duplicateStaysAfterAnEditThatKeepsTheName
     * @tc.desc   Updating phone and email in place does not release the name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateStaysAfterAnEditThatKeepsTheName', 0, () => {
      const seed = createSeedContacts();
      const manager = resetContactManager(seed);
      const edited = cloneContact(seed[5]);
      edited.phone = '13000130000';
      edited.email = 'edited@example.com';
      manager.updateContact(edited);
      const rows = manager.getContacts();
      expect(rows.length).assertEqual(15);
      expect(rows[5].phone).assertEqual('13000130000');
      expect(ContactValidation.isDuplicateName(rows, seed[5].name)).assertTrue();
      expect(ContactValidation.canSubmit(formNamed(seed[5].name), rows)).assertFalse();
    });

    /**
     * @tc.name   renamingARowReleasesTheOldName
     * @tc.desc   Deleting the old name and adding the new one moves the duplicate target.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('renamingARowReleasesTheOldName', 0, () => {
      const seed = createSeedContacts();
      const manager = resetContactManager(seed);
      const oldName = seed[7].name;
      const renamed = cloneContact(seed[7]);
      renamed.name = '改名后的联系人';
      manager.deleteContact(seed[7]);
      manager.addContact(renamed);
      const rows = manager.getContacts();
      expect(rows.length).assertEqual(15);
      expect(ContactValidation.isDuplicateName(rows, oldName)).assertFalse();
      expect(ContactValidation.isDuplicateName(rows, '改名后的联系人')).assertTrue();
      expect(ContactValidation.canSubmit(formNamed(oldName), rows)).assertTrue();
    });

    /**
     * @tc.name   sharedPhoneAndEmailDoNotCreateADuplicate
     * @tc.desc   Only the name is compared, so a shared phone and email keep the name free.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('sharedPhoneAndEmailDoNotCreateADuplicate', 0, () => {
      const rows = createSeedContacts();
      const twin = contactOf('同号不同名', rows[0].phone, rows[0].email, rows[0].address, '', rows[0].category);
      expect(twin.phone).assertEqual(rows[0].phone);
      expect(twin.email).assertEqual(rows[0].email);
      expect(ContactValidation.isDuplicateName(rows, twin.name)).assertFalse();
      const errors = ContactValidation.validate(twin, rows);
      expect(errors.length).assertEqual(0);
      expect(countOf(errors, 'name-duplicate')).assertEqual(0);
    });

    /**
     * @tc.name   avatarAndCategoryDoNotCreateADuplicate
     * @tc.desc   Identical avatar and category values are irrelevant to the name scan.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('avatarAndCategoryDoNotCreateADuplicate', 0, () => {
      const rows: Contact[] = [contactOf('分类样本', '13800138000', 'cat@example.com', '地址', 'same.png', 'A')];
      const candidate = contactOf('分类样本二', '13800138000', 'cat@example.com', '地址', 'same.png', 'A');
      expect(candidate.avatar).assertEqual(rows[0].avatar);
      expect(candidate.category).assertEqual(rows[0].category);
      expect(ContactValidation.isDuplicateName(rows, candidate.name)).assertFalse();
      expect(ContactValidation.validate(candidate, rows).length).assertEqual(0);
      expect(ContactValidation.canSubmit(candidate, rows)).assertTrue();
    });

    /**
     * @tc.name   toastLiteralMatchesTheProductionMessage
     * @tc.desc   The exported toast text is byte for byte the AddressBookEdit literal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('toastLiteralMatchesTheProductionMessage', 0, () => {
      expect(DUPLICATE_NAME_TOAST).assertEqual('姓名已存在，请重新输入!');
      expect(DUPLICATE_NAME_TOAST.length).assertEqual(12);
      expect(DUPLICATE_NAME_TOAST.indexOf('姓名')).assertEqual(0);
      expect(DUPLICATE_NAME_TOAST.indexOf('!')).assertEqual(11);
    });

    /**
     * @tc.name   toastTextIsStableAcrossRepeatedReads
     * @tc.desc   The constant is the same value on each read, so the toast cannot drift.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('toastTextIsStableAcrossRepeatedReads', 0, () => {
      const first = DUPLICATE_NAME_TOAST;
      const second = DUPLICATE_NAME_TOAST;
      const third = '姓名已存在，请重新输入!';
      expect(first === second).assertTrue();
      expect(first === third).assertTrue();
      expect(first.length).assertEqual(third.length);
      expect(second.indexOf('请重新输入')).assertEqual(6);
      expect(second.endsWith('!')).assertTrue();
    });

    /**
     * @tc.name   pageGuardMatchesTheDuplicateScanForEverySeedName
     * @tc.desc   The isName flag is true exactly for the fifteen seeded names and false for fresh ones.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('pageGuardMatchesTheDuplicateScanForEverySeedName', 0, () => {
      const rows = createSeedContacts();
      const names = contactNames(rows);
      let blocked = 0;
      for (let index = 0; index < names.length; index++) {
        if (pageBlocksSubmit(rows, names[index])) {
          blocked = blocked + 1;
        }
      }
      expect(blocked).assertEqual(15);
      expect(pageBlocksSubmit(rows, '页面守卫')).assertFalse();
      expect(pageBlocksSubmit(rows, '')).assertFalse();
    });

    /**
     * @tc.name   duplicateCodeTrailsTheNonNumericPhoneCode
     * @tc.desc   A duplicate name with a letter phone reports the phone code first.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateCodeTrailsTheNonNumericPhoneCode', 0, () => {
      const rows = createSeedContacts();
      const form = contactOf('戴维维', '11111a1111', 'dup@example.com', '吉林省长春市朝阳区');
      const errors = ContactValidation.validate(form, rows);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('phone-not-numeric');
      expect(errors[1]).assertEqual('name-duplicate');
      expect(errors[errors.length - 1]).assertEqual('name-duplicate');
    });

    /**
     * @tc.name   scanFindsTargetAtTheEndOfALongList
     * @tc.desc   A name placed last among thirty rows is still detected.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('scanFindsTargetAtTheEndOfALongList', 0, () => {
      const rows: Contact[] = [];
      for (let index = 0; index < 29; index++) {
        rows.push(contactOf('批量' + String(index), '13800138000', 'bulk@example.com', '地址', '', 'A'));
      }
      rows.push(contactOf('队尾目标', '13800138000', 'tail@example.com', '地址', '', 'B'));
      expect(rows.length).assertEqual(30);
      expect(ContactValidation.isDuplicateName(rows, '队尾目标')).assertTrue();
      expect(ContactValidation.isDuplicateName(rows, '批量28')).assertTrue();
      expect(ContactValidation.isDuplicateName(rows, '批量30')).assertFalse();
      expect(ContactValidation.validate(formNamed('队尾目标'), rows).length).assertEqual(1);
    });

    /**
     * @tc.name   repeatedNameInTheExistingListYieldsOneCode
     * @tc.desc   Two rows that share a name still add a single name-duplicate code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('repeatedNameInTheExistingListYieldsOneCode', 0, () => {
      const rows: Contact[] = [
        contactOf('重复行', '13800138000', 'one@example.com', '地址一', '', 'A'),
        contactOf('重复行', '13900139000', 'two@example.com', '地址二', '', 'B')
      ];
      const errors = ContactValidation.validate(formNamed('重复行'), rows);
      expect(errors.length).assertEqual(1);
      expect(countOf(errors, 'name-duplicate')).assertEqual(1);
      expect(ContactValidation.isDuplicateName(rows, '重复行')).assertTrue();
      expect(rows.length).assertEqual(2);
    });

    /**
     * @tc.name   fullWidthLetterIsNotADuplicateOfAscii
     * @tc.desc   Ａ and A are different code units, so no width folding is applied.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('fullWidthLetterIsNotADuplicateOfAscii', 0, () => {
      const rows: Contact[] = [contactOf('A', '13800138000', 'ascii@example.com', '地址', '', 'A')];
      expect(ContactValidation.isDuplicateName(rows, 'A')).assertTrue();
      expect(ContactValidation.isDuplicateName(rows, '\uFF21')).assertFalse();
      expect('\uFF21' === 'A').assertFalse();
      expect(ContactValidation.validate(formNamed('\uFF21'), rows).length).assertEqual(0);
    });

    /**
     * @tc.name   combiningAccentIsNotADuplicateOfPrecomposed
     * @tc.desc   é written as two code units differs from the single precomposed unit.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('combiningAccentIsNotADuplicateOfPrecomposed', 0, () => {
      const precomposed = '\u00E9';
      const decomposed = 'e\u0301';
      const rows: Contact[] = [contactOf(precomposed, '13800138000', 'accent@example.com', '地址', '', 'A')];
      expect(precomposed.length).assertEqual(1);
      expect(decomposed.length).assertEqual(2);
      expect(precomposed === decomposed).assertFalse();
      expect(ContactValidation.isDuplicateName(rows, precomposed)).assertTrue();
      expect(ContactValidation.isDuplicateName(rows, decomposed)).assertFalse();
    });

    /**
     * @tc.name   managerSnapshotControlsTheDuplicateVerdict
     * @tc.desc   The same name is free on an empty manager and blocked after the seed install.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('managerSnapshotControlsTheDuplicateVerdict', 0, () => {
      const empty = resetContactManager();
      expect(empty.getContacts().length).assertEqual(0);
      expect(ContactValidation.isDuplicateName(empty.getContacts(), '艾拉')).assertFalse();
      const seeded = resetContactManager(createSeedContacts());
      expect(seeded.getContacts().length).assertEqual(15);
      expect(ContactValidation.isDuplicateName(seeded.getContacts(), '艾拉')).assertTrue();
      expect(ContactValidation.canSubmit(formNamed('艾拉'), seeded.getContacts())).assertFalse();
    });

    /**
     * @tc.name   addingThroughTheManagerBlocksTheNextSubmit
     * @tc.desc   A row appended through addContact turns its name into a duplicate for the form.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addingThroughTheManagerBlocksTheNextSubmit', 0, () => {
      const manager = ContactManager.getInstance();
      manager.setContacts([]);
      const draft = formNamed('先添加后校验');
      expect(ContactValidation.canSubmit(draft, manager.getContacts())).assertTrue();
      manager.addContact(draft);
      expect(manager.getContacts().length).assertEqual(1);
      expect(ContactValidation.isDuplicateName(manager.getContacts(), draft.name)).assertTrue();
      expect(ContactValidation.canSubmit(formNamed('先添加后校验'), manager.getContacts())).assertFalse();
    });

    /**
     * @tc.name   deletingEveryRowFreesEverySeedName
     * @tc.desc   After removing all fifteen rows each seeded name passes the duplicate scan.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deletingEveryRowFreesEverySeedName', 0, () => {
      const seed = createSeedContacts();
      const manager = resetContactManager(seed);
      const names = contactNames(seed);
      for (let index = 0; index < seed.length; index++) {
        manager.deleteContact(seed[index]);
      }
      const rows = manager.getContacts();
      expect(rows.length).assertEqual(0);
      let free = 0;
      for (let index = 0; index < names.length; index++) {
        if (!ContactValidation.isDuplicateName(rows, names[index])) {
          free = free + 1;
        }
      }
      expect(free).assertEqual(15);
      expect(managerNames([]).length).assertEqual(0);
    });

    /**
     * @tc.name   singleCharacterNameIsDetectedInACustomList
     * @tc.desc   A one unit name participates in equality exactly like a long name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('singleCharacterNameIsDetectedInACustomList', 0, () => {
      const rows: Contact[] = [contactOf('单', '13800138000', 'one@example.com', '地址', '', 'A')];
      expect(ContactValidation.isDuplicateName(rows, '单')).assertTrue();
      expect(ContactValidation.isDuplicateName(rows, '单字')).assertFalse();
      expect(ContactValidation.validate(formNamed('单'), rows).length).assertEqual(1);
      expect(ContactValidation.canSubmit(formNamed('单'), rows)).assertFalse();
    });

    /**
     * @tc.name   rowOrderDoesNotChangeTheVerdict
     * @tc.desc   Reversing the seed keeps the same fifteen duplicate verdicts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('rowOrderDoesNotChangeTheVerdict', 0, () => {
      const seed = createSeedContacts();
      const reversed: Contact[] = [];
      for (let index = seed.length - 1; index >= 0; index--) {
        reversed.push(cloneContact(seed[index]));
      }
      let matched = 0;
      for (let index = 0; index < seed.length; index++) {
        const forward = ContactValidation.isDuplicateName(seed, seed[index].name);
        const backward = ContactValidation.isDuplicateName(reversed, seed[index].name);
        if (forward === backward) {
          matched = matched + 1;
        }
      }
      expect(matched).assertEqual(15);
      expect(reversed[0].name).assertEqual('法里');
      expect(ContactValidation.isDuplicateName(reversed, '法里')).assertTrue();
    });

    /**
     * @tc.name   validateWithoutAnExistingListIgnoresDuplicates
     * @tc.desc   The default argument is an empty array, so a seeded name passes on its own.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('validateWithoutAnExistingListIgnoresDuplicates', 0, () => {
      const form = formNamed('艾德里安');
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(0);
      expect(ContactValidation.canSubmit(form)).assertTrue();
      expect(ContactValidation.validate(form, createSeedContacts()).length).assertEqual(1);
      expect(ContactValidation.validate(form, createSeedContacts())[0]).assertEqual('name-duplicate');
    });

    /**
     * @tc.name   twoRowsAddedInSequenceBothBecomeDuplicates
     * @tc.desc   Each addContact call extends the scan by one name without dropping the earlier one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('twoRowsAddedInSequenceBothBecomeDuplicates', 0, () => {
      const manager = resetContactManager();
      manager.addContact(contactOf('先来', '13800138000', 'first@example.com', '地址', '', 'A'));
      manager.addContact(contactOf('后到', '13900139000', 'second@example.com', '地址', '', 'B'));
      const rows = manager.getContacts();
      expect(rows.length).assertEqual(2);
      expect(ContactValidation.isDuplicateName(rows, '先来')).assertTrue();
      expect(ContactValidation.isDuplicateName(rows, '后到')).assertTrue();
      expect(ContactValidation.isDuplicateName(rows, '未到')).assertFalse();
    });

    /**
     * @tc.name   seedMinusOneRowStillReportsFourteenDuplicates
     * @tc.desc   Removing one seed row leaves the other fourteen names blocked.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('seedMinusOneRowStillReportsFourteenDuplicates', 0, () => {
      const seed = createSeedContacts();
      const rows: Contact[] = [];
      for (let index = 0; index < seed.length; index++) {
        if (index !== 6) {
          rows.push(cloneContact(seed[index]));
        }
      }
      expect(rows.length).assertEqual(14);
      expect(ContactValidation.isDuplicateName(rows, seed[6].name)).assertFalse();
      let blocked = 0;
      for (let index = 0; index < seed.length; index++) {
        if (ContactValidation.isDuplicateName(rows, seed[index].name)) {
          blocked = blocked + 1;
        }
      }
      expect(blocked).assertEqual(14);
    });

    /**
     * @tc.name   editModeExclusionFlipsTheDuplicateVerdict
     * @tc.desc   Excluding the edited row itself turns a blocked name into an allowed one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editModeExclusionFlipsTheDuplicateVerdict', 0, () => {
      const seed = createSeedContacts();
      const edited = cloneContact(seed[8]);
      const others: Contact[] = [];
      for (let index = 0; index < seed.length; index++) {
        if (index !== 8) {
          others.push(cloneContact(seed[index]));
        }
      }
      expect(ContactValidation.isDuplicateName(seed, edited.name)).assertTrue();
      expect(ContactValidation.isDuplicateName(others, edited.name)).assertFalse();
      expect(ContactValidation.canSubmit(edited, seed)).assertFalse();
      expect(ContactValidation.canSubmit(edited, others)).assertTrue();
    });

    /**
     * @tc.name   newlineInsideTheNameMakesADistinctName
     * @tc.desc   A name with an embedded newline is not trimmed and never equals the seed row.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('newlineInsideTheNameMakesADistinctName', 0, () => {
      const rows = createSeedContacts();
      const candidate = rows[0].name + '\n';
      expect(candidate.length).assertEqual(rows[0].name.length + 1);
      expect(candidate.indexOf('\n') > 0).assertTrue();
      expect(ContactValidation.isDuplicateName(rows, candidate)).assertFalse();
      expect(ContactValidation.validate(formNamed(candidate), rows).length).assertEqual(0);
      expect(countOf(ContactValidation.validate(formNamed(candidate), rows), 'name-duplicate')).assertEqual(0);
    });

    /**
     * @tc.name   blankExistingNameMakesABlankCandidateADuplicate
     * @tc.desc   Two blank names are equal, so the empty and duplicate codes coexist there.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('blankExistingNameMakesABlankCandidateADuplicate', 0, () => {
      const rows: Contact[] = [contactOf('', '13800138000', 'blank@example.com', '地址', '', 'A')];
      expect(ContactValidation.isDuplicateName(rows, '')).assertTrue();
      const errors = ContactValidation.validate(contactOf('', '', '', ''), rows);
      expect(errors.length).assertEqual(5);
      expect(errors[0]).assertEqual('name-empty');
      expect(errors[4]).assertEqual('name-duplicate');
      expect(ContactValidation.isDuplicateName(createSeedContacts(), '')).assertFalse();
    });

    /**
     * @tc.name   threeRowsWithTheSameNameStillYieldOneCode
     * @tc.desc   The duplicate code is added once per form, regardless of how many rows match.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('threeRowsWithTheSameNameStillYieldOneCode', 0, () => {
      const rows: Contact[] = [
        contactOf('三连', '13800138000', 'a@example.com', '地址一', '', 'A'),
        contactOf('三连', '13900139000', 'b@example.com', '地址二', '', 'B'),
        contactOf('三连', '13700137000', 'c@example.com', '地址三', '', 'C')
      ];
      const errors = ContactValidation.validate(formNamed('三连'), rows);
      expect(rows.length).assertEqual(3);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('name-duplicate');
      expect(countOf(errors, 'name-duplicate')).assertEqual(1);
      expect(ContactValidation.canSubmit(formNamed('三连'), rows)).assertFalse();
    });

    /**
     * @tc.name   duplicateToastIsNotARouteAction
     * @tc.desc   A blocked submit shows the toast instead of navigating to the list or edit page.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('duplicateToastIsNotARouteAction', 0, () => {
      expect(DUPLICATE_NAME_TOAST === ACTION_ADD).assertFalse();
      expect(DUPLICATE_NAME_TOAST === ROUTE_EDIT).assertFalse();
      expect(DUPLICATE_NAME_TOAST === ROUTE_LIST).assertFalse();
      expect(ACTION_ADD.indexOf(DUPLICATE_NAME_TOAST) < 0).assertTrue();
      expect(ROUTE_EDIT.indexOf('姓名') < 0).assertTrue();
    });

    /**
     * @tc.name   everySeedNameWithASpaceIsUnique
     * @tc.desc   Fifteen padded seed names are all distinct from the seed and from each other.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('everySeedNameWithASpaceIsUnique', 0, () => {
      const rows = createSeedContacts();
      const padded: Contact[] = [];
      for (let index = 0; index < rows.length; index++) {
        padded.push(formNamed(rows[index].name + ' '));
      }
      let free = 0;
      for (let index = 0; index < padded.length; index++) {
        if (!ContactValidation.isDuplicateName(rows, padded[index].name)) {
          free = free + 1;
        }
      }
      const paddedNames = contactNames(padded);
      expect(padded.length).assertEqual(15);
      expect(free).assertEqual(15);
      expect(uniqueStrings(paddedNames).length).assertEqual(15);
    });

    /**
     * @tc.name   deletingOneOfTwoMatchingRowsKeepsTheDuplicate
     * @tc.desc   Legacy case ID: deletion matches the name and removes both rows, clearing the duplicate verdict.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deletingOneOfTwoMatchingRowsKeepsTheDuplicate', 0, () => {
      const manager = resetContactManager();
      const first = contactOf('同名双行', '13800138000', 'one@example.com', '地址一', '', 'A');
      const second = contactOf('同名双行', '13900139000', 'two@example.com', '地址二', '', 'B');
      manager.addContact(first);
      manager.addContact(second);
      expect(manager.getContacts().length).assertEqual(2);
      manager.deleteContact(first);
      const rows = manager.getContacts();
      expect(rows.length).assertEqual(0);
      expect(rows.some((row: Contact): boolean => row.phone === '13900139000')).assertFalse();
      expect(ContactValidation.isDuplicateName(rows, '同名双行')).assertFalse();
    });

    /**
     * @tc.name   cyrillicLookalikeIsNotADuplicateOfLatin
     * @tc.desc   А (U+0410) and A (U+0041) look alike but are separate names.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('cyrillicLookalikeIsNotADuplicateOfLatin', 0, () => {
      const rows: Contact[] = [contactOf('Alice', '13800138000', 'latin@example.com', '地址', '', 'A')];
      const lookalike = '\u0410lice';
      expect(lookalike.length).assertEqual(5);
      expect(lookalike === 'Alice').assertFalse();
      expect(ContactValidation.isDuplicateName(rows, lookalike)).assertFalse();
      expect(ContactValidation.validate(formNamed(lookalike), rows).length).assertEqual(0);
    });

    /**
     * @tc.name   managerSnapshotIsACopyThatStillReportsDuplicates
     * @tc.desc   getContacts copies the array and shares its Contact objects; changing a row name updates both views.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('managerSnapshotIsACopyThatStillReportsDuplicates', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      const snapshot = manager.getContacts();
      expect(snapshot.length).assertEqual(15);
      snapshot[0].name = '本地改名';
      expect(manager.getContacts()[0].name).assertEqual('本地改名');
      expect(ContactValidation.isDuplicateName(snapshot, '本地改名')).assertTrue();
      expect(ContactValidation.isDuplicateName(manager.getContacts(), '本地改名')).assertTrue();
    });

    /**
     * @tc.name   deleteMatchesTheNameEvenWithAStaleObject
     * @tc.desc   deleteContact filters by name, so a clone of the row removes the original too.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('deleteMatchesTheNameEvenWithAStaleObject', 0, () => {
      const seed = createSeedContacts();
      const manager = resetContactManager(seed);
      const clone = cloneContact(seed[10]);
      expect(clone === seed[10]).assertFalse();
      expect(clone.name).assertEqual(seed[10].name);
      manager.deleteContact(clone);
      expect(manager.getContacts().length).assertEqual(14);
      expect(ContactValidation.isDuplicateName(manager.getContacts(), seed[10].name)).assertFalse();
      expect(ContactValidation.isDuplicateName(manager.getContacts(), seed[9].name)).assertTrue();
    });

    /**
     * @tc.name   freshFormKeepsTheToastConstantUnread
     * @tc.desc   A unique name submits without the guard, though the toast text is always available.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('freshFormKeepsTheToastConstantUnread', 0, () => {
      const rows = createSeedContacts();
      const blocked = pageBlocksSubmit(rows, '全新的名字');
      expect(blocked).assertFalse();
      expect(ContactValidation.canSubmit(formNamed('全新的名字'), rows)).assertTrue();
      expect(DUPLICATE_NAME_TOAST.length).assertEqual(12);
      expect(DUPLICATE_NAME_TOAST.length > 0).assertTrue();
      expect(DUPLICATE_NAME_TOAST.indexOf('已存在') > 0).assertTrue();
    });

    /**
     * @tc.name   guardReadsTheManagerRowsNotTheDraftRows
     * @tc.desc   The flag comes from the stored rows, so a draft name alone never blocks itself.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the DuplicateNameValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('guardReadsTheManagerRowsNotTheDraftRows', 0, () => {
      const manager = resetContactManager(createSeedContacts());
      const draft = formNamed('尚未入库');
      const rows = manager.getContacts();
      expect(pageBlocksSubmit(rows, draft.name)).assertFalse();
      expect(ContactValidation.validate(draft, rows).length).assertEqual(0);
      expect(rows.indexOf(draft) < 0).assertTrue();
      expect(rows.length).assertEqual(15);
    });
  });
}
