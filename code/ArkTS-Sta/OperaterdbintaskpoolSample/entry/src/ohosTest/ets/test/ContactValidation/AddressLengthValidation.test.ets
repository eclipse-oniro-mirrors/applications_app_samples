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
 * Address length validation for the address TextInput on AddressBookEdit.
 *
 * Anchors:
 *   AddressBookEdit.ets:257-279  address TextInput with
 *                                .maxLength(CommonConstants.MAX_LENGTH_VERY_LONG)
 *   AddressBookEdit.ets:276-278  onChange copies the raw value into data.address
 *   CommonConstant.ets:53        MAX_LENGTH_VERY_LONG = 100
 *   Contact.ets:31-47            six fields; only the address length matters here
 *   SharedDriver.ets:230-235     address-empty / address-too-long codes
 *   SharedDriver.ets:251-253     canSubmit requires an empty error list
 *
 * The edit page never trims the address, so a whitespace-only address is a
 * non-empty address and only the length rule can reject it. The boundary under
 * test is therefore "more than one hundred code units", not "blank".
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { CommonConstants } from '../../../../main/ets/pages/constant/CommonConstant';
import {
  MAX_ADDRESS_LENGTH,
  ContactValidation,
  contactOf,
  createSeedContacts,
  countOf,
  resetContactManager
} from '../Shared/SharedDriver';

/** Repeats unit until the result holds count code units. */
function repeatedText(count: number, unit: string): string {
  let text = '';
  for (let index = 0; index < count; index++) {
    text = text + unit;
  }
  return text;
}

/** A contact whose address is the only field under observation. */
function contactWithAddress(address: string, name: string = '地址样本'): Contact {
  return contactOf(name, '13800138000', 'sample@example.com', address);
}

/** Runs the shared validator and returns the error codes it produced. */
function errorsFor(address: string): string[] {
  return ContactValidation.validate(contactWithAddress(address));
}

/** Counts the address-too-long code in one error list. */
function tooLongCount(errors: string[]): number {
  return countOf(errors, 'address-too-long');
}

export default function addressLengthValidationTest(): void {
  describe('AddressLengthValidation', () => {
    beforeAll(() => {
      logSuite('AddressLengthValidation', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('AddressLengthValidation', 'end');
    });

    /**
     * @tc.name   emptyAddressIsReportedAsEmptyAndNotAsTooLong
     * @tc.desc   A zero length address yields exactly address-empty; the length rule stays silent.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyAddressIsReportedAsEmptyAndNotAsTooLong', 0, () => {
      logStep('AddressLengthValidation', 'zero length address');
      const contact = contactWithAddress('');
      expect(contact.address.length).assertEqual(0);
      const errors = ContactValidation.validate(contact);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('address-empty');
      expect(tooLongCount(errors)).assertEqual(0);
      expect(ContactValidation.canSubmit(contact)).assertFalse();
    });

    /**
     * @tc.name   singleCharacterAddressSatisfiesTheLengthRule
     * @tc.desc   One code unit clears the empty check at the low end of the range.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('singleCharacterAddressSatisfiesTheLengthRule', 0, () => {
      const contact = contactWithAddress('京');
      expect(contact.address.length).assertEqual(1);
      const errors = ContactValidation.validate(contact);
      expect(errors.length).assertEqual(0);
      expect(countOf(errors, 'address-empty')).assertEqual(0);
      expect(tooLongCount(errors)).assertEqual(0);
      expect(ContactValidation.canSubmit(contact)).assertTrue();
    });

    /**
     * @tc.name   ninetyNineCharacterAddressStaysInsideTheLimit
     * @tc.desc   The code unit immediately below the limit is accepted with no error codes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('ninetyNineCharacterAddressStaysInsideTheLimit', 0, () => {
      const address = repeatedText(99, 'a');
      expect(address.length).assertEqual(99);
      expect(address.length < MAX_ADDRESS_LENGTH).assertTrue();
      const errors = errorsFor(address);
      expect(errors.length).assertEqual(0);
      expect(tooLongCount(errors)).assertEqual(0);
      expect(ContactValidation.canSubmit(contactWithAddress(address))).assertTrue();
    });

    /**
     * @tc.name   exactlyOneHundredCharactersIsTheAcceptedBoundary
     * @tc.desc   The maxLength literal from CommonConstant accepts a one hundred unit address.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('exactlyOneHundredCharactersIsTheAcceptedBoundary', 0, () => {
      const address = repeatedText(100, 'a');
      expect(address.length).assertEqual(100);
      expect(address.length).assertEqual(MAX_ADDRESS_LENGTH);
      const errors = errorsFor(address);
      expect(errors.length).assertEqual(0);
      expect(tooLongCount(errors)).assertEqual(0);
      expect(ContactValidation.canSubmit(contactWithAddress(address))).assertTrue();
    });

    /**
     * @tc.name   oneHundredAndOneCharactersIsRejectedAsTooLong
     * @tc.desc   Adding a single code unit past the limit produces exactly address-too-long.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('oneHundredAndOneCharactersIsRejectedAsTooLong', 0, () => {
      const address = repeatedText(101, 'a');
      expect(address.length).assertEqual(101);
      expect(address.length > MAX_ADDRESS_LENGTH).assertTrue();
      const errors = errorsFor(address);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('address-too-long');
      expect(tooLongCount(errors)).assertEqual(1);
    });

    /**
     * @tc.name   oneHundredAndTwoCharactersIsAlsoRejected
     * @tc.desc   Two code units past the limit still collapse into one address-too-long code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('oneHundredAndTwoCharactersIsAlsoRejected', 0, () => {
      const address = repeatedText(102, 'a');
      expect(address.length).assertEqual(102);
      const errors = errorsFor(address);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('address-too-long');
      expect(ContactValidation.canSubmit(contactWithAddress(address))).assertFalse();
      expect(tooLongCount(errors)).assertEqual(1);
    });

    /**
     * @tc.name   boundarySweepShowsASingleTransitionAtOneHundred
     * @tc.desc   Addresses from 98 through 102 units produce no error, no error, no error, one, one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('boundarySweepShowsASingleTransitionAtOneHundred', 0, () => {
      const observed: number[] = [];
      for (let length = 98; length <= 102; length++) {
        observed.push(errorsFor(repeatedText(length, 'x')).length);
      }
      expect(observed.length).assertEqual(5);
      expect(observed[0]).assertEqual(0);
      expect(observed[1]).assertEqual(0);
      expect(observed[2]).assertEqual(0);
      expect(observed[3]).assertEqual(1);
      expect(observed[4]).assertEqual(1);
    });

    /**
     * @tc.name   addressLengthConstantMatchesProductionConstant
     * @tc.desc   The driver re-exports MAX_LENGTH_VERY_LONG unchanged at one hundred.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addressLengthConstantMatchesProductionConstant', 0, () => {
      expect(MAX_ADDRESS_LENGTH).assertEqual(100);
      expect(MAX_ADDRESS_LENGTH).assertEqual(CommonConstants.MAX_LENGTH_VERY_LONG);
      expect(MAX_ADDRESS_LENGTH > CommonConstants.MAX_LENGTH_LONG).assertTrue();
      expect(MAX_ADDRESS_LENGTH > CommonConstants.MAX_LENGTH_MODERATE).assertTrue();
    });

    /**
     * @tc.name   chineseAddressCountsEachCharacterOnce
     * @tc.desc   A hundred Chinese characters are exactly at the limit and pass validation.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('chineseAddressCountsEachCharacterOnce', 0, () => {
      const address = repeatedText(100, '京');
      expect(address.length).assertEqual(100);
      expect(errorsFor(address).length).assertEqual(0);
      const longer = address + '京';
      expect(longer.length).assertEqual(101);
      expect(errorsFor(longer)[0]).assertEqual('address-too-long');
    });

    /**
     * @tc.name   emojiAddressCountsTwoCodeUnitsPerSymbol
     * @tc.desc   Fifty emoji occupy one hundred code units and pass; fifty one overflow.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emojiAddressCountsTwoCodeUnitsPerSymbol', 0, () => {
      const emoji = '\u{1F600}';
      const fifty = repeatedText(50, emoji);
      expect(fifty.length).assertEqual(100);
      expect(errorsFor(fifty).length).assertEqual(0);
      const fiftyOne = repeatedText(51, emoji);
      expect(fiftyOne.length).assertEqual(102);
      expect(errorsFor(fiftyOne)[0]).assertEqual('address-too-long');
    });

    /**
     * @tc.name   asciiAndEmojiMixStopsAtTheSameCodeUnitLimit
     * @tc.desc   Ninety ascii units plus five emoji reach the limit; one emoji more does not.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('asciiAndEmojiMixStopsAtTheSameCodeUnitLimit', 0, () => {
      const base = repeatedText(90, 'a') + repeatedText(5, '\u{1F4CD}');
      expect(base.length).assertEqual(100);
      expect(errorsFor(base).length).assertEqual(0);
      const overflow = base + '\u{1F4CD}';
      expect(overflow.length).assertEqual(102);
      expect(errorsFor(overflow).length).assertEqual(1);
    });

    /**
     * @tc.name   whitespaceOnlyAddressIsNotEmpty
     * @tc.desc   Ten spaces clear the empty rule because the page stores the raw text untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('whitespaceOnlyAddressIsNotEmpty', 0, () => {
      const address = repeatedText(10, ' ');
      expect(address.length).assertEqual(10);
      expect(address.trim().length).assertEqual(0);
      const errors = errorsFor(address);
      expect(errors.length).assertEqual(0);
      expect(countOf(errors, 'address-empty')).assertEqual(0);
    });

    /**
     * @tc.name   oneHundredSpacesSitExactlyOnTheLimit
     * @tc.desc   Whitespace is measured like any other code unit, so the limit starts at 101.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('oneHundredSpacesSitExactlyOnTheLimit', 0, () => {
      expect(errorsFor(repeatedText(100, ' ')).length).assertEqual(0);
      expect(errorsFor(repeatedText(101, ' ')).length).assertEqual(1);
      expect(errorsFor(repeatedText(101, ' '))[0]).assertEqual('address-too-long');
      expect(ContactValidation.canSubmit(contactWithAddress(repeatedText(100, ' ')))).assertTrue();
    });

    /**
     * @tc.name   tooLongAddressIsReportedAfterTheEarlierFieldCodes
     * @tc.desc   With an empty name the list is name-empty, address-too-long in that order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('tooLongAddressIsReportedAfterTheEarlierFieldCodes', 0, () => {
      const contact = contactOf('', '13800138000', 'sample@example.com', repeatedText(101, 'a'));
      const errors = ContactValidation.validate(contact);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('name-empty');
      expect(errors[1]).assertEqual('address-too-long');
      expect(errors.indexOf('address-too-long') > errors.indexOf('name-empty')).assertTrue();
    });

    /**
     * @tc.name   addressTooLongKeepsTheEmailCodeAheadOfIt
     * @tc.desc   The email and address rules both fire and the address code lands last.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addressTooLongKeepsTheEmailCodeAheadOfIt', 0, () => {
      const contact = contactOf('长地址', '13800138000', 'broken', repeatedText(120, 'b'));
      const errors = ContactValidation.validate(contact);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('email-malformed');
      expect(errors[1]).assertEqual('address-too-long');
      expect(errors[errors.length - 1]).assertEqual('address-too-long');
    });

    /**
     * @tc.name   fourIndependentFaultsQueueInFieldOrder
     * @tc.desc   Empty name, letters in phone, malformed email and a longErrors address stay ordered.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fourIndependentFaultsQueueInFieldOrder', 0, () => {
      const contact = contactOf('', '13800abc', 'no-at-sign', repeatedText(101, 'c'));
      const errors = ContactValidation.validate(contact);
      expect(errors.length).assertEqual(4);
      expect(errors[0]).assertEqual('name-empty');
      expect(errors[1]).assertEqual('phone-not-numeric');
      expect(errors[2]).assertEqual('email-malformed');
      expect(errors[3]).assertEqual('address-too-long');
    });

    /**
     * @tc.name   duplicateNameCodeStillFollowsTheAddressCode
     * @tc.desc   A longErrors address plus a duplicate name yields address-too-long then name-duplicate.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('duplicateNameCodeStillFollowsTheAddressCode', 0, () => {
      const existing = createSeedContacts();
      const contact = contactOf('贝拉', '13800138000', 'sample@example.com', repeatedText(101, 'a'));
      const errors = ContactValidation.validate(contact, existing);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('address-too-long');
      expect(errors[1]).assertEqual('name-duplicate');
      expect(ContactValidation.canSubmit(contact, existing)).assertFalse();
    });

    /**
     * @tc.name   validationNeverMutatesTheContactOrTheAddress
     * @tc.desc   Calling validate twice leaves name, phone and the exact address text untouched.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validationNeverMutatesTheContactOrTheAddress', 0, () => {
      const address = repeatedText(105, 'd');
      const contact = contactWithAddress(address, '不可变');
      const before = contact.address;
      ContactValidation.validate(contact);
      ContactValidation.validate(contact);
      expect(contact.address).assertEqual(before);
      expect(contact.address.length).assertEqual(105);
      expect(contact.name).assertEqual('不可变');
      expect(contact.phone).assertEqual('13800138000');
    });

    /**
     * @tc.name   repeatedValidationOfTheSameAddressIsStable
     * @tc.desc   The same over-longErrors address yields the same single code on each call.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('repeatedValidationOfTheSameAddressIsStable', 0, () => {
      const address = repeatedText(140, 'e');
      const first = errorsFor(address);
      const second = errorsFor(address);
      expect(first.length).assertEqual(second.length);
      expect(first[0]).assertEqual(second[0]);
      expect(first[0]).assertEqual('address-too-long');
      expect(tooLongCount(second)).assertEqual(1);
    });

    /**
     * @tc.name   canSubmitMirrorsTheErrorCountAtTheBoundary
     * @tc.desc   canSubmit is true exactly while the address holds at most one hundred units.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('canSubmitMirrorsTheErrorCountAtTheBoundary', 0, () => {
      expect(ContactValidation.canSubmit(contactWithAddress(repeatedText(100, 'f')))).assertTrue();
      expect(ContactValidation.canSubmit(contactWithAddress(repeatedText(101, 'f')))).assertFalse();
      expect(ContactValidation.canSubmit(contactWithAddress(repeatedText(99, 'f')))).assertTrue();
      expect(ContactValidation.canSubmit(contactWithAddress(''))).assertFalse();
    });

    /**
     * @tc.name   seedAddressesAreAllFarInsideTheLimit
     * @tc.desc   Every one of the fifteen seeded rows carries a short address and passes the rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('seedAddressesAreAllFarInsideTheLimit', 0, () => {
      const rows = createSeedContacts();
      expect(rows.length).assertEqual(15);
      let longest = 0;
      for (let index = 0; index < rows.length; index++) {
        if (rows[index].address.length > longest) {
          longest = rows[index].address.length;
        }
        expect(tooLongCount(ContactValidation.validate(rows[index], rows))).assertEqual(0);
      }
      expect(longest < MAX_ADDRESS_LENGTH).assertTrue();
      expect(longest > 0).assertTrue();
    });

    /**
     * @tc.name   paddingEverySeedAddressToTheLimitKeepsThemValid
     * @tc.desc   Extending all fifteen seeded addresses to one hundred units adds no error code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('paddingEverySeedAddressToTheLimitKeepsThemValid', 0, () => {
      const rows = createSeedContacts();
      let checked = 0;
      for (let index = 0; index < rows.length; index++) {
        const padded = rows[index].address + repeatedText(100 - rows[index].address.length, '镇');
        expect(padded.length).assertEqual(100);
        rows[index].address = padded;
        expect(errorsFor(padded).length).assertEqual(0);
        expect(tooLongCount(ContactValidation.validate(rows[index]))).assertEqual(0);
        checked = checked + 1;
      }
      expect(checked).assertEqual(15);
    });

    /**
     * @tc.name   twoContactsWithDifferentAddressLengthsValidateIndependently
     * @tc.desc   One accepted address and one over-longErrors address in the same call keep separate results.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoContactsWithDifferentAddressLengthsValidateIndependently', 0, () => {
      const accepted = contactWithAddress(repeatedText(100, 'g'), '甲');
      const rejected = contactWithAddress(repeatedText(101, 'g'), '乙');
      const first = ContactValidation.validate(accepted);
      const second = ContactValidation.validate(rejected);
      expect(first.length).assertEqual(0);
      expect(second.length).assertEqual(1);
      expect(second[0]).assertEqual('address-too-long');
      expect(ContactValidation.canSubmit(accepted)).assertTrue();
      expect(ContactValidation.canSubmit(rejected)).assertFalse();
    });

    /**
     * @tc.name   addressLengthRuleIgnoresTheAvatarAndCategory
     * @tc.desc   Avatar and category never influence the address verdict, even when unusual.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('addressLengthRuleIgnoresTheAvatarAndCategory', 0, () => {
      const plain = contactOf('头像', '13800138000', 'sample@example.com', repeatedText(101, 'h'), '', '');
      const decorated = contactOf('头像', '13800138000', 'sample@example.com', repeatedText(101, 'h'),
        'avatar.png', 'Z');
      expect(ContactValidation.validate(plain).length).assertEqual(1);
      expect(ContactValidation.validate(decorated).length).assertEqual(1);
      expect(ContactValidation.validate(decorated)[0]).assertEqual(ContactValidation.validate(plain)[0]);
      expect(ContactValidation.canSubmit(decorated)).assertFalse();
    });

    /**
     * @tc.name   newlineCharactersEachOccupyOneUnit
     * @tc.desc   Fifty newlines plus fifty ascii letters reach the limit exactly.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('newlineCharactersEachOccupyOneUnit', 0, () => {
      const address = repeatedText(50, '\n') + repeatedText(50, 'i');
      expect(address.length).assertEqual(100);
      expect(errorsFor(address).length).assertEqual(0);
      const overflow = address + '\n';
      expect(overflow.length).assertEqual(101);
      expect(errorsFor(overflow)[0]).assertEqual('address-too-long');
    });

    /**
     * @tc.name   carriageReturnAndTabEachCountAsOneUnit
     * @tc.desc   Control characters are measured literally; one hundred of them still pass.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('carriageReturnAndTabEachCountAsOneUnit', 0, () => {
      const address = repeatedText(50, '\r') + repeatedText(50, '\t');
      expect(address.length).assertEqual(100);
      expect(errorsFor(address).length).assertEqual(0);
      expect(errorsFor(address + '\r')[0]).assertEqual('address-too-long');
      expect(tooLongCount(errorsFor(address + '\r'))).assertEqual(1);
    });

    /**
     * @tc.name   shortJapaneseAddressIsAcceptedAtItsCodeUnitLength
     * @tc.desc   Mixed CJK text below the limit produces no code, pinning code unit arithmetic.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('shortJapaneseAddressIsAcceptedAtItsCodeUnitLength', 0, () => {
      const address = '東京都渋谷区神南一丁目';
      expect(address.length).assertEqual(11);
      expect(errorsFor(address).length).assertEqual(0);
      const padded = address + repeatedText(89, '区');
      expect(padded.length).assertEqual(100);
      expect(errorsFor(padded).length).assertEqual(0);
      expect(errorsFor(padded + '区')[0]).assertEqual('address-too-long');
    });

    /**
     * @tc.name   surrogatePairAloneAtTheLimitIsAlreadyTwoUnits
     * @tc.desc   A lone emoji counts as two units, so ninety nine ascii plus one emoji overflows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('surrogatePairAloneAtTheLimitIsAlreadyTwoUnits', 0, () => {
      const address = repeatedText(99, 'k') + '\u{1F600}';
      expect(address.length).assertEqual(101);
      const errors = errorsFor(address);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('address-too-long');
      const shorter = repeatedText(98, 'k') + '\u{1F600}';
      expect(shorter.length).assertEqual(100);
      expect(errorsFor(shorter).length).assertEqual(0);
    });

    /**
     * @tc.name   tooLongAddressKeepsEveryOtherFieldValidatable
     * @tc.desc   A valid name, phone and email stay clean while the address alone fails.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('tooLongAddressKeepsEveryOtherFieldValidatable', 0, () => {
      const contact = contactWithAddress(repeatedText(101, 'm'));
      const errors = ContactValidation.validate(contact);
      expect(errors.length).assertEqual(1);
      expect(countOf(errors, 'name-empty')).assertEqual(0);
      expect(countOf(errors, 'phone-empty')).assertEqual(0);
      expect(countOf(errors, 'email-empty')).assertEqual(0);
      expect(countOf(errors, 'address-too-long')).assertEqual(1);
    });

    /**
     * @tc.name   exactlyOneHundredRemovesTheErrorAfterBeingTrimmedFromOverLong
     * @tc.desc   Dropping the final code unit from a 101 unit address flips the verdict back.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('exactlyOneHundredRemovesTheErrorAfterBeingTrimmedFromOverLong', 0, () => {
      const overLong = repeatedText(101, 'n');
      const trimmed = overLong.substring(0, 100);
      expect(overLong.length).assertEqual(101);
      expect(trimmed.length).assertEqual(100);
      expect(errorsFor(overLong).length).assertEqual(1);
      expect(errorsFor(trimmed).length).assertEqual(0);
      expect(ContactValidation.canSubmit(contactWithAddress(trimmed))).assertTrue();
    });

    /**
     * @tc.name   addressOfTwoHundredUnitsStillReportsOneCode
     * @tc.desc   Far past the limit the validator does not duplicate the address code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('addressOfTwoHundredUnitsStillReportsOneCode', 0, () => {
      const address = repeatedText(200, 'p');
      expect(address.length).assertEqual(200);
      const errors = errorsFor(address);
      expect(errors.length).assertEqual(1);
      expect(tooLongCount(errors)).assertEqual(1);
      expect(countOf(errors, 'address-too-long')).assertEqual(1);
      expect(errors[0] === errors[0]).assertTrue();
    });

    /**
     * @tc.name   boundaryAddressWithDuplicateNameReportsOnlyTheDuplicate
     * @tc.desc   The one hundred unit address itself is fine, so only the duplicate name remains.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('boundaryAddressWithDuplicateNameReportsOnlyTheDuplicate', 0, () => {
      const existing = createSeedContacts();
      const contact = contactOf('阿诺德', '13800138000', 'sample@example.com', repeatedText(100, 'q'));
      const errors = ContactValidation.validate(contact, existing);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('name-duplicate');
      expect(tooLongCount(errors)).assertEqual(0);
      expect(ContactValidation.canSubmit(contact, existing)).assertFalse();
    });

    /**
     * @tc.name   emptyAddressAndOverLongAddressDifferOnlyByTheEmptyCode
     * @tc.desc   The two rejected extremes produce disjoint single-code lists.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyAddressAndOverLongAddressDifferOnlyByTheEmptyCode', 0, () => {
      const empty = errorsFor('');
      const longErrors = errorsFor(repeatedText(101, 'r'));
      expect(empty.length).assertEqual(1);
      expect(longErrors.length).assertEqual(1);
      expect(empty[0] === longErrors[0]).assertFalse();
      expect(empty[0]).assertEqual('address-empty');
      expect(longErrors[0]).assertEqual('address-too-long');
    });

    /**
     * @tc.name   emojiOnlyAddressBelowLimitIsAccepted
     * @tc.desc   Twenty five emoji occupy fifty units and pass despite the unusual glyphs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('emojiOnlyAddressBelowLimitIsAccepted', 0, () => {
      const address = repeatedText(25, '\u{1F3E0}');
      expect(address.length).assertEqual(50);
      expect(errorsFor(address).length).assertEqual(0);
      expect(ContactValidation.canSubmit(contactWithAddress(address))).assertTrue();
      expect(errorsFor(address + repeatedText(51, '\u{1F3E0}')).length).assertEqual(1);
    });

    /**
     * @tc.name   validationAcceptsAnAddressBuiltFromSeedTextPlusPadding
     * @tc.desc   A real seeded address padded to the limit stays accepted while one more unit fails.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('validationAcceptsAnAddressBuiltFromSeedTextPlusPadding', 0, () => {
      const seed = createSeedContacts();
      const source = seed[2].address;
      expect(source.length > 0).assertTrue();
      const padded = source + repeatedText(100 - source.length, '号');
      expect(padded.length).assertEqual(100);
      expect(errorsFor(padded).length).assertEqual(0);
      expect(errorsFor(padded + '号')[0]).assertEqual('address-too-long');
      expect(ContactValidation.canSubmit(contactWithAddress(padded))).assertTrue();
    });

    /**
     * @tc.name   lengthRuleAppliesUniformlyToEverySeedRowPaddingBoundary
     * @tc.desc   For all fifteen seed rows, padding to 101 always yields exactly one code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('lengthRuleAppliesUniformlyToEverySeedRowPaddingBoundary', 0, () => {
      const rows = createSeedContacts();
      let accepted = 0;
      let rejected = 0;
      for (let index = 0; index < rows.length; index++) {
        const base = rows[index].address;
        const atLimit = base + repeatedText(100 - base.length, '巷');
        if (errorsFor(atLimit).length === 0) {
          accepted = accepted + 1;
        }
        if (errorsFor(atLimit + '巷').length === 1) {
          rejected = rejected + 1;
        }
      }
      expect(accepted).assertEqual(15);
      expect(rejected).assertEqual(15);
      expect(accepted + rejected).assertEqual(30);
    });

    /**
     * @tc.name   canSubmitIsFalseForEveryOverLongSeedPadding
     * @tc.desc   Submitting a padded row with 101 units is blocked, the 100 unit row is not.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('canSubmitIsFalseForEveryOverLongSeedPadding', 0, () => {
      const rows = createSeedContacts();
      const base = rows[7].address;
      const atLimit = contactWithAddress(base + repeatedText(100 - base.length, '路'), '可提交');
      const over = contactWithAddress(base + repeatedText(101 - base.length, '路'), '不可提交');
      expect(ContactValidation.canSubmit(atLimit)).assertTrue();
      expect(ContactValidation.canSubmit(over)).assertFalse();
      expect(ContactValidation.validate(over).length).assertEqual(1);
      expect(ContactValidation.validate(atLimit).length).assertEqual(0);
    });

    /**
     * @tc.name   textFingerprintOfBoundaryAddressesDiffers
     * @tc.desc   The two neighbouring lengths are genuinely different inputs, not equal strings.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('textFingerprintOfBoundaryAddressesDiffers', 0, () => {
      const hundred = repeatedText(100, 's');
      const hundredOne = repeatedText(101, 's');
      expect(hundred.length === hundredOne.length).assertFalse();
      expect(hundred === hundredOne).assertFalse();
      expect(hundredOne.startsWith(hundred)).assertTrue();
      expect(tooLongCount(errorsFor(hundred))).assertEqual(0);
      expect(tooLongCount(errorsFor(hundredOne))).assertEqual(1);
    });

    /**
     * @tc.name   managerResetLeavesNoResidualAddressVerdict
     * @tc.desc   Two back to back validations after a manager reset agree on the boundary verdict.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('managerResetLeavesNoResidualAddressVerdict', 0, () => {
      const first = ContactValidation.validate(contactWithAddress(repeatedText(101, 't')));
      resetContactManager();
      const second = ContactValidation.validate(contactWithAddress(repeatedText(101, 't')));
      expect(first.length).assertEqual(1);
      expect(second.length).assertEqual(1);
      expect(first[0]).assertEqual(second[0]);
      expect(second[0]).assertEqual('address-too-long');
    });

    /**
     * @tc.name   oneUnitAddressWithAllOtherFieldsEmptyReportsOnlyEmptyCodes
     * @tc.desc   A single character address contributes no address code, only the other empty fields do.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('oneUnitAddressWithAllOtherFieldsEmptyReportsOnlyEmptyCodes', 0, () => {
      const contact = contactOf('', '', '', '北');
      const errors = ContactValidation.validate(contact);
      expect(errors.length).assertEqual(3);
      expect(errors[0]).assertEqual('name-empty');
      expect(errors[1]).assertEqual('phone-empty');
      expect(errors[2]).assertEqual('email-empty');
      expect(countOf(errors, 'address-empty')).assertEqual(0);
      expect(countOf(errors, 'address-too-long')).assertEqual(0);
    });

    /**
     * @tc.name   addressComposedOfRepeatedSeedWordsHitsTheLimit
     * @tc.desc   Repeating a two character word fifty times yields exactly the accepted maximum.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('addressComposedOfRepeatedSeedWordsHitsTheLimit', 0, () => {
      const word = '鼓楼';
      const address = repeatedText(50, word);
      expect(word.length).assertEqual(2);
      expect(address.length).assertEqual(100);
      expect(errorsFor(address).length).assertEqual(0);
      const over = repeatedText(50, word) + '区';
      expect(over.length).assertEqual(101);
      expect(errorsFor(over)[0]).assertEqual('address-too-long');
    });

    /**
     * @tc.name   tooLongAddressWithValidDuplicateFreeFormIsBlockedOnlyByLength
     * @tc.desc   With every other field perfect the length code is the only reason to block.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('tooLongAddressWithValidDuplicateFreeFormIsBlockedOnlyByLength', 0, () => {
      const existing = createSeedContacts();
      const contact = contactOf('新联系人', '13800138000', 'fresh@example.com', repeatedText(150, 'u'));
      const errors = ContactValidation.validate(contact, existing);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('address-too-long');
      expect(ContactValidation.isDuplicateName(existing, contact.name)).assertFalse();
      expect(ContactValidation.canSubmit(contact, existing)).assertFalse();
    });

    /**
     * @tc.name   validateUsesTheFullAddressNotAPrefix
     * @tc.desc   A prefix of an over-longErrors address would pass, proving the whole field is measured.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('validateUsesTheFullAddressNotAPrefix', 0, () => {
      const full = repeatedText(100, 'v') + repeatedText(5, '省');
      expect(full.length).assertEqual(105);
      const prefix = full.substring(0, 100);
      expect(prefix.length).assertEqual(100);
      expect(errorsFor(full).length).assertEqual(1);
      expect(errorsFor(prefix).length).assertEqual(0);
      expect(full.indexOf(prefix)).assertEqual(0);
    });

    /**
     * @tc.name   digitsOnlyAddressAtTheLimitIsAccepted
     * @tc.desc   Numeric text is ordinary text for the address rule and stops at the same limit.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('digitsOnlyAddressAtTheLimitIsAccepted', 0, () => {
      const address = repeatedText(100, '7');
      expect(address.length).assertEqual(100);
      expect(errorsFor(address).length).assertEqual(0);
      expect(errorsFor(address + '7').length).assertEqual(1);
      expect(ContactValidation.canSubmit(contactWithAddress(address))).assertTrue();
    });

    /**
     * @tc.name   addressLengthVerdictDoesNotLeakBetweenContacts
     * @tc.desc   Validating a longErrors address first does not taint the verdict for a short one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addressLengthVerdictDoesNotLeakBetweenContacts', 0, () => {
      const first = contactWithAddress(repeatedText(130, 'w'), '先长');
      const second = contactWithAddress('短地址', '后短');
      expect(ContactValidation.validate(first).length).assertEqual(1);
      expect(ContactValidation.validate(second).length).assertEqual(0);
      expect(ContactValidation.validate(first)[0]).assertEqual('address-too-long');
      expect(ContactValidation.canSubmit(second)).assertTrue();
    });

    /**
     * @tc.name   addressAtTheLimitIsStableWhenCopiedIntoANewContact
     * @tc.desc   Copying the boundary text into a second Contact keeps the accepted verdict.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('addressAtTheLimitIsStableWhenCopiedIntoANewContact', 0, () => {
      const original = repeatedText(100, 'y');
      const first = contactWithAddress(original, '原件');
      const second = new Contact(first.name, first.phone, first.email, first.address, first.avatar, first.category);
      expect(second.address === original).assertTrue();
      expect(second.address.length).assertEqual(100);
      expect(ContactValidation.validate(second).length).assertEqual(0);
      expect(ContactValidation.canSubmit(second)).assertTrue();
    });

    /**
     * @tc.name   addressOverTheLimitRemainsRejectedAfterACopy
     * @tc.desc   The copied over-longErrors address still carries exactly the address-too-long code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('addressOverTheLimitRemainsRejectedAfterACopy', 0, () => {
      const original = contactWithAddress(repeatedText(101, 'z'), '原长');
      const copy = new Contact(original.name, original.phone, original.email, original.address,
        original.avatar, original.category);
      expect(copy.address.length).assertEqual(101);
      const errors = ContactValidation.validate(copy);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('address-too-long');
      expect(ContactValidation.canSubmit(copy)).assertFalse();
    });

    /**
     * @tc.name   ninetyNineAndOneHundredAreAdjacentAcceptedLengths
     * @tc.desc   Both neighbours of the rejected 101 unit address pass, so the rule is a clean cap.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the AddressLengthValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('ninetyNineAndOneHundredAreAdjacentAcceptedLengths', 0, () => {
      expect(ContactValidation.canSubmit(contactWithAddress(repeatedText(99, 'a')))).assertTrue();
      expect(ContactValidation.canSubmit(contactWithAddress(repeatedText(100, 'a')))).assertTrue();
      expect(ContactValidation.canSubmit(contactWithAddress(repeatedText(101, 'a')))).assertFalse();
      expect(tooLongCount(errorsFor(repeatedText(99, 'a')))).assertEqual(0);
    });
  });
}
