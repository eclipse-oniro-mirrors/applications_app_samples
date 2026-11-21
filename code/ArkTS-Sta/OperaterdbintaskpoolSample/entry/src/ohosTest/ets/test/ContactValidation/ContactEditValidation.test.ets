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
 * Whole form validation for AddressBookEdit in both add and edit mode.
 *
 * Anchors:
 *   AddressBookEdit.ets:154-183   add mode renders a name TextInput and sets isName
 *                                 from a name equality scan of the manager rows
 *   AddressBookEdit.ets:96-111    the ok button blocks navigation when isName is true
 *   AddressBookEdit.ets:173-174   name maxLength 12
 *   AddressBookEdit.ets:204       phone maxLength 12
 *   AddressBookEdit.ets:238       email maxLength 25
 *   AddressBookEdit.ets:272       address maxLength 100
 *   Contact.ets:31-47             six fields, defaults to empty strings
 *   SharedDriver.ets:202-254      validate / isDuplicateName / canSubmit
 *
 * The validator walks name, phone, email, address and finally the duplicate
 * check, so the error list is a stable field order plus one trailing code.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import {
  ContactValidation,
  cloneContact,
  contactOf,
  countOf,
  createSeedContacts,
  joined,
  resetContactManager,
  uniqueStrings
} from '../Shared/SharedDriver';

/** A contact that satisfies every rule when no duplicate exists. */
function validForm(name: string = '完整表单'): Contact {
  return contactOf(name, '13800138000', 'complete@example.com', '江苏省苏州市姑苏区');
}

/** Joins error codes so an expected sequence can be compared in one assertion. */
function errorTrace(errors: string[]): string {
  return joined(errors, '|');
}

/** Repeats one character to reach an exact code unit count. */
function repeatedText(count: number, unit: string): string {
  let text = '';
  for (let index = 0; index < count; index++) {
    text = text + unit;
  }
  return text;
}

/** Builds a form whose only populated field is the one under test. */
function onlyName(name: string): Contact {
  return contactOf(name, '', '', '');
}

/** Builds a form whose only populated field is the phone. */
function onlyPhone(phone: string): Contact {
  return contactOf('', phone, '', '');
}

/** Builds a form whose only populated field is the email. */
function onlyEmail(email: string): Contact {
  return contactOf('', '', email, '');
}

/** Builds a form whose only populated field is the address. */
function onlyAddress(address: string): Contact {
  return contactOf('', '', '', address);
}

export default function contactEditValidationTest(): void {
  describe('ContactEditValidation', () => {
    beforeAll(() => {
      logSuite('ContactEditValidation', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('ContactEditValidation', 'end');
    });

    /**
     * @tc.name   everyFieldEmptyProducesFourEmptyCodes
     * @tc.desc   The blank add form from AddressBookList yields four codes in field order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('everyFieldEmptyProducesFourEmptyCodes', 0, () => {
      logStep('ContactEditValidation', 'blank add form');
      const form = new Contact();
      expect(form.name).assertEqual('');
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(4);
      expect(errorTrace(errors)).assertEqual('name-empty|phone-empty|email-empty|address-empty');
      expect(uniqueStrings(errors).length).assertEqual(4);
    });

    /**
     * @tc.name   completeFormProducesNoErrorCodes
     * @tc.desc   A form with name, phone, email and address produces an empty error list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('completeFormProducesNoErrorCodes', 0, () => {
      const form = validForm();
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(0);
      expect(ContactValidation.canSubmit(form)).assertTrue();
      expect(ContactValidation.validate(form, []).length).assertEqual(0);
      expect(form.email).assertEqual('complete@example.com');
    });

    /**
     * @tc.name   canSubmitIsTrueForTheCompleteForm
     * @tc.desc   canSubmit is the empty-error predicate for a form with no duplicates nearby.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('canSubmitIsTrueForTheCompleteForm', 0, () => {
      const form = validForm('可提交');
      expect(ContactValidation.validate(form).length).assertEqual(0);
      expect(ContactValidation.canSubmit(form)).assertTrue();
      expect(ContactValidation.canSubmit(form, createSeedContacts())).assertTrue();
      expect(form.phone.length).assertEqual(11);
    });

    /**
     * @tc.name   missingNameAloneReportsOnlyNameEmpty
     * @tc.desc   Replacing the name with an empty string leaves exactly name-empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('missingNameAloneReportsOnlyNameEmpty', 0, () => {
      const form = validForm();
      form.name = '';
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('name-empty');
      expect(countOf(errors, 'phone-empty')).assertEqual(0);
      expect(ContactValidation.canSubmit(form)).assertFalse();
    });

    /**
     * @tc.name   missingPhoneAloneReportsOnlyPhoneEmpty
     * @tc.desc   An empty phone is the only fault when the other three fields are filled.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('missingPhoneAloneReportsOnlyPhoneEmpty', 0, () => {
      const form = validForm();
      form.phone = '';
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-empty');
      expect(countOf(errors, 'phone-not-numeric')).assertEqual(0);
      expect(ContactValidation.canSubmit(form)).assertFalse();
    });

    /**
     * @tc.name   missingEmailAloneReportsOnlyEmailEmpty
     * @tc.desc   An empty email reports email-empty and never the malformed code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('missingEmailAloneReportsOnlyEmailEmpty', 0, () => {
      const form = validForm();
      form.email = '';
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('email-empty');
      expect(countOf(errors, 'email-malformed')).assertEqual(0);
      expect(errorTrace(errors)).assertEqual('email-empty');
    });

    /**
     * @tc.name   missingAddressAloneReportsOnlyAddressEmpty
     * @tc.desc   An empty address reports address-empty without the length code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('missingAddressAloneReportsOnlyAddressEmpty', 0, () => {
      const form = validForm();
      form.address = '';
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('address-empty');
      expect(countOf(errors, 'address-too-long')).assertEqual(0);
      expect(ContactValidation.canSubmit(form)).assertFalse();
    });

    /**
     * @tc.name   twoMissingFieldsKeepNameBeforeAddress
     * @tc.desc   Empty name and empty address produce name-empty then address-empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoMissingFieldsKeepNameBeforeAddress', 0, () => {
      const form = validForm();
      form.name = '';
      form.address = '';
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('name-empty');
      expect(errors[1]).assertEqual('address-empty');
      expect(errors.indexOf('address-empty') > errors.indexOf('name-empty')).assertTrue();
    });

    /**
     * @tc.name   allFourFieldsEmptyFollowTheDeclarationOrder
     * @tc.desc   The four empty codes appear in name, phone, email, address order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('allFourFieldsEmptyFollowTheDeclarationOrder', 0, () => {
      const errors = ContactValidation.validate(contactOf('', '', '', ''));
      expect(errors.length).assertEqual(4);
      expect(errors[0]).assertEqual('name-empty');
      expect(errors[1]).assertEqual('phone-empty');
      expect(errors[2]).assertEqual('email-empty');
      expect(errors[3]).assertEqual('address-empty');
      expect(errorTrace(errors)).assertEqual('name-empty|phone-empty|email-empty|address-empty');
    });

    /**
     * @tc.name   malformedEmailAndLetterPhoneQueueInFieldOrder
     * @tc.desc   Phone before email in the queue even though the email rule is longer.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('malformedEmailAndLetterPhoneQueueInFieldOrder', 0, () => {
      const form = contactOf('排错', '13800abc', 'missing-at', '地址');
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('phone-not-numeric');
      expect(errors[1]).assertEqual('email-malformed');
      expect(errorTrace(errors)).assertEqual('phone-not-numeric|email-malformed');
    });

    /**
     * @tc.name   duplicateNameIsAppendedAfterEveryFieldCode
     * @tc.desc   A blank duplicate form yields the four empty codes plus name-duplicate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateNameIsAppendedAfterEveryFieldCode', 0, () => {
      const existing = createSeedContacts();
      const form = contactOf('贝拉', '', '', '');
      const errors = ContactValidation.validate(form, existing);
      expect(errors.length).assertEqual(4);
      expect(errors[0]).assertEqual('phone-empty');
      expect(errors[1]).assertEqual('email-empty');
      expect(errors[2]).assertEqual('address-empty');
      expect(errors[3]).assertEqual('name-duplicate');
    });

    /**
     * @tc.name   duplicateNameAgainstSeedBlocksAnOtherwiseValidForm
     * @tc.desc   A complete form that reuses a seeded name is blocked with one trailing code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('duplicateNameAgainstSeedBlocksAnOtherwiseValidForm', 0, () => {
      const existing = createSeedContacts();
      const form = validForm('康纳');
      const errors = ContactValidation.validate(form, existing);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('name-duplicate');
      expect(ContactValidation.canSubmit(form, existing)).assertFalse();
      expect(ContactValidation.canSubmit(form)).assertTrue();
    });

    /**
     * @tc.name   distinctNameAgainstTheSameSeedPasses
     * @tc.desc   Changing the name by one character removes the duplicate code entirely.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('distinctNameAgainstTheSameSeedPasses', 0, () => {
      const existing = createSeedContacts();
      const form = validForm('康纳新');
      const errors = ContactValidation.validate(form, existing);
      expect(errors.length).assertEqual(0);
      expect(ContactValidation.isDuplicateName(existing, '康纳')).assertTrue();
      expect(ContactValidation.isDuplicateName(existing, '康纳新')).assertFalse();
      expect(ContactValidation.canSubmit(form, existing)).assertTrue();
    });

    /**
     * @tc.name   duplicateCheckUsesTheWholeNameNotAPrefix
     * @tc.desc   本 exists but 本杰明 is a different row, so neither name hides the other.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateCheckUsesTheWholeNameNotAPrefix', 0, () => {
      const existing = createSeedContacts();
      expect(ContactValidation.isDuplicateName(existing, '本')).assertTrue();
      expect(ContactValidation.isDuplicateName(existing, '本杰明')).assertTrue();
      expect(ContactValidation.isDuplicateName(existing, '本杰')).assertFalse();
      const form = validForm('本杰');
      expect(ContactValidation.validate(form, existing).length).assertEqual(0);
      expect(ContactValidation.canSubmit(form, existing)).assertTrue();
    });

    /**
     * @tc.name   duplicateCheckReadsEveryRowNotJustTheFirst
     * @tc.desc   A name placed in the last row of a long list is still found.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateCheckReadsEveryRowNotJustTheFirst', 0, () => {
      const existing = createSeedContacts();
      const last = existing[existing.length - 1].name;
      expect(last).assertEqual('法里');
      expect(ContactValidation.isDuplicateName(existing, last)).assertTrue();
      expect(ContactValidation.validate(validForm(last), existing)[0]).assertEqual('name-duplicate');
      expect(ContactValidation.isDuplicateName(existing, '法')).assertFalse();
    });

    /**
     * @tc.name   emptyNameNeverCountsAsADuplicate
     * @tc.desc   No seeded row is blank, so a blank name reports only its empty code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyNameNeverCountsAsADuplicate', 0, () => {
      const existing = createSeedContacts();
      expect(ContactValidation.isDuplicateName(existing, '')).assertFalse();
      const errors = ContactValidation.validate(contactOf('', '13800138000', 'ok@example.com', '地址'), existing);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('name-empty');
      expect(countOf(errors, 'name-duplicate')).assertEqual(0);
      expect(ContactValidation.canSubmit(contactOf('', '13800138000', 'ok@example.com', '地址'), existing))
        .assertFalse();
    });

    /**
     * @tc.name   whiteSpaceNameIsNotADuplicateOfATrimmedRow
     * @tc.desc   The page stores raw text, so a padded name is a new distinct name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('whiteSpaceNameIsNotADuplicateOfATrimmedRow', 0, () => {
      const existing = createSeedContacts();
      const padded = ' ' + existing[0].name;
      expect(padded === existing[0].name).assertFalse();
      expect(padded.trim()).assertEqual(existing[0].name);
      expect(ContactValidation.isDuplicateName(existing, padded)).assertFalse();
      const form = validForm(padded);
      expect(ContactValidation.validate(form, existing).length).assertEqual(0);
      expect(ContactValidation.canSubmit(form, existing)).assertTrue();
    });

    /**
     * @tc.name   duplicateNameIsTheLastCodeWhenTheNameIsPresent
     * @tc.desc   A named row with three blank fields yields three empty codes then the duplicate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateNameIsTheLastCodeWhenTheNameIsPresent', 0, () => {
      const existing = createSeedContacts();
      const errors = ContactValidation.validate(contactOf(existing[1].name, '', '', ''), existing);
      expect(errors.length).assertEqual(4);
      expect(errors[0]).assertEqual('phone-empty');
      expect(errors[1]).assertEqual('email-empty');
      expect(errors[2]).assertEqual('address-empty');
      expect(errors[3]).assertEqual('name-duplicate');
      expect(errorTrace(errors)).assertEqual('phone-empty|email-empty|address-empty|name-duplicate');
    });

    /**
     * @tc.name   addModeBlankFormIsBlockedAgainstTheSeed
     * @tc.desc   The add button hands over new Contact(); with rows present it cannot submit.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addModeBlankFormIsBlockedAgainstTheSeed', 0, () => {
      const existing = createSeedContacts();
      const drafted = new Contact();
      const errors = ContactValidation.validate(drafted, existing);
      expect(errors.length).assertEqual(4);
      expect(errors[3]).assertEqual('address-empty');
      expect(countOf(errors, 'name-duplicate')).assertEqual(0);
      expect(ContactValidation.canSubmit(drafted, existing)).assertFalse();
    });

    /**
     * @tc.name   editModePrefilledRowSubmitsAgainstTheOtherRows
     * @tc.desc   Excluding the edited row itself leaves its name free, so the form submits.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('editModePrefilledRowSubmitsAgainstTheOtherRows', 0, () => {
      const seed = createSeedContacts();
      const edited = seed[4];
      const others: Contact[] = [];
      for (let index = 0; index < seed.length; index++) {
        if (seed[index].name !== edited.name) {
          others.push(cloneContact(seed[index]));
        }
      }
      expect(others.length).assertEqual(14);
      const errors = ContactValidation.validate(edited, others);
      expect(errors.length).assertEqual(0);
      expect(ContactValidation.canSubmit(edited, others)).assertTrue();
      expect(ContactValidation.validate(edited, seed)[0]).assertEqual('name-duplicate');
    });

    /**
     * @tc.name   editModeKeepingTheNameIsADuplicateOnlyWhenSelfIsIncluded
     * @tc.desc   The same edited row passes against fourteen rows and fails against all fifteen.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('editModeKeepingTheNameIsADuplicateOnlyWhenSelfIsIncluded', 0, () => {
      const seed = createSeedContacts();
      const edited = cloneContact(seed[9]);
      const others: Contact[] = [];
      for (let index = 0; index < seed.length; index++) {
        if (index !== 9) {
          others.push(cloneContact(seed[index]));
        }
      }
      expect(ContactValidation.canSubmit(edited, others)).assertTrue();
      expect(ContactValidation.canSubmit(edited, seed)).assertFalse();
      expect(ContactValidation.isDuplicateName(seed, edited.name)).assertTrue();
      expect(ContactValidation.isDuplicateName(others, edited.name)).assertFalse();
    });

    /**
     * @tc.name   oneCharacterInEveryFieldIsSubmittable
     * @tc.desc   There is no minimum length rule, so single unit fields pass all four checks.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('oneCharacterInEveryFieldIsSubmittable', 0, () => {
      const form = new Contact('甲', '1', 'a@b.cn', '京');
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(0);
      expect(form.name.length).assertEqual(1);
      expect(form.phone.length).assertEqual(1);
      expect(form.email.length).assertEqual(6);
      expect(form.address.length).assertEqual(1);
    });

    /**
     * @tc.name   maximumLengthFormPassesEveryRule
     * @tc.desc   Twelve, twelve, twenty five and one hundred units are all exactly acceptable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('maximumLengthFormPassesEveryRule', 0, () => {
      const name = repeatedText(12, '名');
      const phone = repeatedText(12, '8');
      const email = repeatedText(19, 'a') + '@x.com';
      const address = repeatedText(100, '址');
      const form = contactOf(name, phone, email, address);
      expect(email.length).assertEqual(25);
      expect(address.length).assertEqual(100);
      expect(ContactValidation.validate(form).length).assertEqual(0);
      expect(ContactValidation.canSubmit(form)).assertTrue();
    });

    /**
     * @tc.name   overLongNameAloneReportsNameTooLong
     * @tc.desc   Thirteen name units are the only fault in an otherwise perfect form.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('overLongNameAloneReportsNameTooLong', 0, () => {
      const form = validForm(repeatedText(13, '名'));
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('name-too-long');
      expect(ContactValidation.canSubmit(form)).assertFalse();
      expect(form.phone).assertEqual('13800138000');
    });

    /**
     * @tc.name   overLongPhoneAloneReportsPhoneTooLong
     * @tc.desc   Thirteen digits keep the digits-only rule satisfied and trigger only the cap.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('overLongPhoneAloneReportsPhoneTooLong', 0, () => {
      const form = validForm();
      form.phone = repeatedText(13, '6');
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-too-long');
      expect(countOf(errors, 'phone-not-numeric')).assertEqual(0);
      expect(ContactValidation.canSubmit(form)).assertFalse();
    });

    /**
     * @tc.name   overLongEmailAloneReportsEmailTooLong
     * @tc.desc   A twenty six unit address keeps a valid shape and trips only the cap.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('overLongEmailAloneReportsEmailTooLong', 0, () => {
      const form = validForm();
      form.email = repeatedText(20, 'a') + '@x.com';
      const errors = ContactValidation.validate(form);
      expect(form.email.length).assertEqual(26);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('email-too-long');
      expect(countOf(errors, 'email-malformed')).assertEqual(0);
    });

    /**
     * @tc.name   overLongAddressAloneReportsAddressTooLong
     * @tc.desc   One hundred and one address units trip the cap without touching other fields.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('overLongAddressAloneReportsAddressTooLong', 0, () => {
      const form = validForm();
      form.address = repeatedText(101, '路');
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('address-too-long');
      expect(ContactValidation.canSubmit(form)).assertFalse();
      expect(form.name).assertEqual('完整表单');
    });

    /**
     * @tc.name   longNameAndLongPhoneReportTwoCodes
     * @tc.desc   Two over-long text fields each contribute exactly one code in field order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longNameAndLongPhoneReportTwoCodes', 0, () => {
      const form = contactOf(repeatedText(13, '名'), repeatedText(14, '7'), 'ok@example.com', '地址');
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('name-too-long');
      expect(errors[1]).assertEqual('phone-too-long');
      expect(errorTrace(errors)).assertEqual('name-too-long|phone-too-long');
    });

    /**
     * @tc.name   validateIsPureAcrossRepeatedCalls
     * @tc.desc   Five calls over the same broken form produce identical traces and lengths.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('validateIsPureAcrossRepeatedCalls', 0, () => {
      const form = contactOf('', '12ab', 'bad-email', repeatedText(120, 'x'));
      const first = errorTrace(ContactValidation.validate(form));
      let stable = 0;
      for (let index = 0; index < 5; index++) {
        if (errorTrace(ContactValidation.validate(form)) === first) {
          stable = stable + 1;
        }
      }
      expect(stable).assertEqual(5);
      expect(first).assertEqual('name-empty|phone-not-numeric|email-malformed|address-too-long');
      expect(form.phone).assertEqual('12ab');
    });

    /**
     * @tc.name   validateDoesNotMutateTheExistingRows
     * @tc.desc   The duplicate scan reads names and leaves every seeded field unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('validateDoesNotMutateTheExistingRows', 0, () => {
      const existing = createSeedContacts();
      let before = '';
      for (let index = 0; index < existing.length; index++) {
        before = before + existing[index].name + existing[index].phone;
      }
      ContactValidation.validate(validForm('贝拉'), existing);
      let after = '';
      for (let index = 0; index < existing.length; index++) {
        after = after + existing[index].name + existing[index].phone;
      }
      expect(after).assertEqual(before);
      expect(existing.length).assertEqual(15);
      expect(existing[0].name).assertEqual('艾德里安');
    });

    /**
     * @tc.name   canSubmitAgreesWithTheErrorListAcrossForms
     * @tc.desc   For five different forms canSubmit is true exactly when the list is empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('canSubmitAgreesWithTheErrorListAcrossForms', 0, () => {
      const forms: Contact[] = [
        new Contact(),
        validForm(),
        onlyName('只有名字'),
        onlyPhone('13800138000'),
        contactOf('坏', '12ab', 'bad', '')
      ];
      let agreements = 0;
      for (let index = 0; index < forms.length; index++) {
        const empty = ContactValidation.validate(forms[index]).length === 0;
        if (empty === ContactValidation.canSubmit(forms[index])) {
          agreements = agreements + 1;
        }
      }
      expect(agreements).assertEqual(5);
      expect(ContactValidation.canSubmit(forms[1])).assertTrue();
      expect(ContactValidation.canSubmit(forms[0])).assertFalse();
    });

    /**
     * @tc.name   errorListNeverRepeatsTheSameCode
     * @tc.desc   Even a form that breaks several rules yields each code at most once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('errorListNeverRepeatsTheSameCode', 0, () => {
      const form = contactOf('', '1a2b3c', 'nope', repeatedText(101, 'q'));
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(4);
      expect(uniqueStrings(errors).length).assertEqual(errors.length);
      expect(countOf(errors, 'phone-not-numeric')).assertEqual(1);
      expect(countOf(errors, 'address-too-long')).assertEqual(1);
    });

    /**
     * @tc.name   onlyNameFormReportsTheThreeOtherEmptyCodes
     * @tc.desc   A populated name alone leaves phone, email and address empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('onlyNameFormReportsTheThreeOtherEmptyCodes', 0, () => {
      const errors = ContactValidation.validate(onlyName('独名'));
      expect(errors.length).assertEqual(3);
      expect(errorTrace(errors)).assertEqual('phone-empty|email-empty|address-empty');
      expect(countOf(errors, 'name-empty')).assertEqual(0);
      expect(ContactValidation.canSubmit(onlyName('独名'))).assertFalse();
    });

    /**
     * @tc.name   onlyPhoneFormReportsTheThreeOtherEmptyCodes
     * @tc.desc   A populated phone alone leaves name, email and address empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('onlyPhoneFormReportsTheThreeOtherEmptyCodes', 0, () => {
      const errors = ContactValidation.validate(onlyPhone('13800138000'));
      expect(errors.length).assertEqual(3);
      expect(errorTrace(errors)).assertEqual('name-empty|email-empty|address-empty');
      expect(countOf(errors, 'phone-not-numeric')).assertEqual(0);
      expect(errors.indexOf('phone-empty') < 0).assertTrue();
    });

    /**
     * @tc.name   onlyEmailFormReportsTheThreeOtherEmptyCodes
     * @tc.desc   A populated email alone leaves name, phone and address empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('onlyEmailFormReportsTheThreeOtherEmptyCodes', 0, () => {
      const errors = ContactValidation.validate(onlyEmail('solo@example.com'));
      expect(errors.length).assertEqual(3);
      expect(errorTrace(errors)).assertEqual('name-empty|phone-empty|address-empty');
      expect(countOf(errors, 'email-malformed')).assertEqual(0);
      expect(errors.indexOf('email-empty') < 0).assertTrue();
    });

    /**
     * @tc.name   onlyAddressFormReportsTheThreeOtherEmptyCodes
     * @tc.desc   A populated address alone leaves name, phone and email empty.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('onlyAddressFormReportsTheThreeOtherEmptyCodes', 0, () => {
      const errors = ContactValidation.validate(onlyAddress('地址齐全'));
      expect(errors.length).assertEqual(3);
      expect(errorTrace(errors)).assertEqual('name-empty|phone-empty|email-empty');
      expect(countOf(errors, 'address-too-long')).assertEqual(0);
      expect(errors.indexOf('address-empty') < 0).assertTrue();
    });

    /**
     * @tc.name   avatarAndCategoryCannotRescueABlankForm
     * @tc.desc   The validator ignores the two non-input fields, so the form stays blocked.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('avatarAndCategoryCannotRescueABlankForm', 0, () => {
      const form = new Contact('', '', '', '', 'portrait.png', 'A');
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(4);
      expect(form.avatar).assertEqual('portrait.png');
      expect(form.category).assertEqual('A');
      expect(errorTrace(errors)).assertEqual('name-empty|phone-empty|email-empty|address-empty');
    });

    /**
     * @tc.name   everySeedRowSubmitsWhenItselfIsExcluded
     * @tc.desc   All fifteen edit-mode forms pass against the other fourteen rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('everySeedRowSubmitsWhenItselfIsExcluded', 0, () => {
      const seed = createSeedContacts();
      let passed = 0;
      for (let index = 0; index < seed.length; index++) {
        const others: Contact[] = [];
        for (let inner = 0; inner < seed.length; inner++) {
          if (inner !== index) {
            others.push(cloneContact(seed[inner]));
          }
        }
        if (ContactValidation.canSubmit(seed[index], others)) {
          passed = passed + 1;
        }
      }
      expect(passed).assertEqual(15);
      expect(seed.length).assertEqual(15);
      expect(ContactValidation.canSubmit(seed[0], seed)).assertFalse();
    });

    /**
     * @tc.name   everySeedRowIsDuplicateWhenTheWholeSeedIsPassed
     * @tc.desc   Passing all fifteen rows back in makes each name a duplicate of itself.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('everySeedRowIsDuplicateWhenTheWholeSeedIsPassed', 0, () => {
      const seed = createSeedContacts();
      let blocked = 0;
      for (let index = 0; index < seed.length; index++) {
        if (!ContactValidation.canSubmit(seed[index], seed)) {
          blocked = blocked + 1;
        }
      }
      expect(blocked).assertEqual(15);
      expect(ContactValidation.isDuplicateName(seed, seed[14].name)).assertTrue();
      expect(ContactValidation.isDuplicateName(seed, seed[14].name + '新')).assertFalse();
    });

    /**
     * @tc.name   completeFormWithAFreshNamePassesAgainstTheSeed
     * @tc.desc   A filled form whose name is absent from the seed is submittable in add mode.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completeFormWithAFreshNamePassesAgainstTheSeed', 0, () => {
      const existing = createSeedContacts();
      const form = contactOf('新来的', '13500135000', 'fresh@example.com', '浙江省杭州市西湖区');
      const errors = ContactValidation.validate(form, existing);
      expect(errors.length).assertEqual(0);
      expect(errorTrace(errors)).assertEqual('');
      expect(ContactValidation.isDuplicateName(existing, form.name)).assertFalse();
      expect(ContactValidation.canSubmit(form, existing)).assertTrue();
    });

    /**
     * @tc.name   mixedFormReportsFourCodesIncludingDuplicate
     * @tc.desc   A named duplicate with a letter phone, bad email and long address yields four codes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('mixedFormReportsFourCodesIncludingDuplicate', 0, () => {
      const existing = createSeedContacts();
      const form = contactOf('卡梅隆', '17a7', 'nope', repeatedText(101, '址'));
      const errors = ContactValidation.validate(form, existing);
      expect(errors.length).assertEqual(4);
      expect(errorTrace(errors)).assertEqual('phone-not-numeric|email-malformed|address-too-long|name-duplicate');
      expect(ContactValidation.canSubmit(form, existing)).assertFalse();
      expect(ContactValidation.validate(form).length).assertEqual(3);
    });

    /**
     * @tc.name   blankNameWithLongAddressStillHasNoDuplicateCode
     * @tc.desc   The duplicate scan runs after the field checks and ignores the empty name.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('blankNameWithLongAddressStillHasNoDuplicateCode', 0, () => {
      const existing = createSeedContacts();
      const errors = ContactValidation.validate(contactOf('', '13800138000', 'ok@example.com',
        repeatedText(101, '城')), existing);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('name-empty');
      expect(errors[1]).assertEqual('address-too-long');
      expect(countOf(errors, 'name-duplicate')).assertEqual(0);
    });

    /**
     * @tc.name   formClonedFromASeedRowKeepsItsErrorVerdict
     * @tc.desc   A copy of a seeded row validates like the original in edit mode.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('formClonedFromASeedRowKeepsItsErrorVerdict', 0, () => {
      const seed = createSeedContacts();
      const copy = cloneContact(seed[11]);
      const others: Contact[] = [];
      for (let index = 0; index < seed.length; index++) {
        if (index !== 11) {
          others.push(cloneContact(seed[index]));
        }
      }
      expect(copy.name).assertEqual(seed[11].name);
      expect(ContactValidation.validate(copy, others).length).assertEqual(0);
      expect(ContactValidation.canSubmit(copy, others)).assertTrue();
      copy.address = '';
      expect(ContactValidation.validate(copy, others)[0]).assertEqual('address-empty');
    });

    /**
     * @tc.name   removingOneCharacterFromTheNameReleasesTheDuplicate
     * @tc.desc   Trimming a seeded name by one unit makes the form submittable again.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('removingOneCharacterFromTheNameReleasesTheDuplicate', 0, () => {
      const existing = createSeedContacts();
      const blocked = validForm('卡特琳娜');
      const released = validForm('卡特琳');
      expect(ContactValidation.canSubmit(blocked, existing)).assertFalse();
      expect(ContactValidation.canSubmit(released, existing)).assertTrue();
      expect(ContactValidation.validate(blocked, existing).length).assertEqual(1);
      expect(ContactValidation.validate(released, existing).length).assertEqual(0);
    });

    /**
     * @tc.name   completeFormWithDuplicateNameAndWrongPhoneReportsBoth
     * @tc.desc   A duplicate name plus a non-numeric phone reports the phone code first.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactEditValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('completeFormWithDuplicateNameAndWrongPhoneReportsBoth', 0, () => {
      const existing = createSeedContacts();
      const form = contactOf('丹尼尔', '1777x7777', 'ok@example.com', '陕西省西安市雁塔区');
      const errors = ContactValidation.validate(form, existing);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('phone-not-numeric');
      expect(errors[1]).assertEqual('name-duplicate');
      expect(ContactValidation.canSubmit(form, existing)).assertFalse();
    });
  });
}
