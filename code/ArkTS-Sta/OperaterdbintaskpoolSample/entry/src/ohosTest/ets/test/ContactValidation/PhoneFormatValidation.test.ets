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
 * Phone input rules for the phone TextInput on AddressBookEdit.
 *
 * Anchors:
 *   AddressBookEdit.ets:191-209  phone TextInput with .type(InputType.NUMBER),
 *                                .maxLength(12) and a raw onChange copy
 *   CommonConstant.ets:51        MAX_LENGTH_MODERATE = 12
 *   SharedDriver.ets:181-193     isDigitsOnly: every unit must be 0x30..0x39,
 *                                and an empty string is not digits only
 *   SharedDriver.ets:212-220     phone-empty / phone-too-long / phone-not-numeric
 *
 * InputType.NUMBER affects only the soft keyboard; the stored value is whatever
 * the keyboard produced, so the validator re-checks every unit. There is no
 * minimum length, no country prefix and no separator support: the accepted
 * alphabet is the ten ascii digit code units and the accepted range is one to
 * twelve units.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import {
  MAX_PHONE_LENGTH,
  ContactValidation,
  contactOf,
  countOf,
  createSeedContacts,
  isDigitsOnly,
  joined,
  resetContactManager,
  uniqueStrings
} from '../Shared/SharedDriver';

/** Repeats unit until the text holds count code units. */
function repeatedText(count: number, unit: string): string {
  let text = '';
  for (let index = 0; index < count; index++) {
    text = text + unit;
  }
  return text;
}

/** A complete form whose phone is the only field under observation. */
function formWithPhone(phone: string): Contact {
  return contactOf('电话样本', phone, 'phone@example.com', '广东省广州市天河区');
}

/** Phone codes only, in validator order. */
function phoneErrors(phone: string): string[] {
  const errors = ContactValidation.validate(formWithPhone(phone));
  const result: string[] = [];
  for (let index = 0; index < errors.length; index++) {
    if (errors[index].indexOf('phone-') === 0) {
      result.push(errors[index]);
    }
  }
  return result;
}

/** Joins codes so a whole sequence can be pinned in one assertion. */
function errorTrace(errors: string[]): string {
  return joined(errors, '|');
}

export default function phoneFormatValidationTest(): void {
  describe('PhoneFormatValidation', () => {
    beforeAll(() => {
      logSuite('PhoneFormatValidation', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('PhoneFormatValidation', 'end');
    });

    /**
     * @tc.name   elevenDigitNumberIsTheCommonAcceptedCase
     * @tc.desc   A typical mainland mobile number is all digits, eleven units and accepted.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('elevenDigitNumberIsTheCommonAcceptedCase', 0, () => {
      logStep('PhoneFormatValidation', 'eleven digits');
      const phone = '13800138000';
      expect(phone.length).assertEqual(11);
      expect(isDigitsOnly(phone)).assertTrue();
      expect(phoneErrors(phone).length).assertEqual(0);
      expect(ContactValidation.canSubmit(formWithPhone(phone))).assertTrue();
    });

    /**
     * @tc.name   twelveDigitsSitExactlyOnTheCap
     * @tc.desc   The maxLength twelve case passes the length rule and stays numeric.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('twelveDigitsSitExactlyOnTheCap', 0, () => {
      const phone = repeatedText(12, '8');
      expect(phone.length).assertEqual(MAX_PHONE_LENGTH);
      expect(isDigitsOnly(phone)).assertTrue();
      const errors = phoneErrors(phone);
      expect(errors.length).assertEqual(0);
      expect(countOf(errors, 'phone-too-long')).assertEqual(0);
    });

    /**
     * @tc.name   thirteenDigitsAreTooLong
     * @tc.desc   One unit past the cap reports phone-too-long and never not-numeric.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('thirteenDigitsAreTooLong', 0, () => {
      const phone = repeatedText(13, '8');
      expect(phone.length).assertEqual(MAX_PHONE_LENGTH + 1);
      expect(isDigitsOnly(phone)).assertTrue();
      const errors = phoneErrors(phone);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-too-long');
      expect(countOf(errors, 'phone-not-numeric')).assertEqual(0);
    });

    /**
     * @tc.name   emptyPhoneReportsOnlyTheEmptyCode
     * @tc.desc   An empty phone skips the numeric rule because length is zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyPhoneReportsOnlyTheEmptyCode', 0, () => {
      const errors = phoneErrors('');
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-empty');
      expect(countOf(errors, 'phone-not-numeric')).assertEqual(0);
      expect(isDigitsOnly('')).assertFalse();
      expect(ContactValidation.canSubmit(formWithPhone(''))).assertFalse();
    });

    /**
     * @tc.name   lettersInThePhoneAreRejected
     * @tc.desc   A single ascii letter inside the digits trips the numeric rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('lettersInThePhoneAreRejected', 0, () => {
      const phone = '1380013800a';
      expect(phone.length).assertEqual(11);
      expect(isDigitsOnly(phone)).assertFalse();
      const errors = phoneErrors(phone);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-not-numeric');
      expect(ContactValidation.canSubmit(formWithPhone(phone))).assertFalse();
    });

    /**
     * @tc.name   leadingPlusSignIsRejected
     * @tc.desc   A country prefix sign is not a digit code unit and fails the rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('leadingPlusSignIsRejected', 0, () => {
      const phone = '+8613800138';
      expect(phone.charCodeAt(0)).assertEqual(43);
      expect(isDigitsOnly(phone)).assertFalse();
      expect(phoneErrors(phone)[0]).assertEqual('phone-not-numeric');
      expect(phoneErrors(phone).length).assertEqual(1);
    });

    /**
     * @tc.name   spacesInsideThePhoneAreRejected
     * @tc.desc   A single space breaks the digits-only scan even when the digits are valid.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('spacesInsideThePhoneAreRejected', 0, () => {
      const phone = '138 0013 8000';
      expect(phone.length).assertEqual(13);
      expect(phone.indexOf(' ')).assertEqual(3);
      expect(isDigitsOnly(phone)).assertFalse();
      const errors = phoneErrors(phone);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('phone-too-long');
      expect(errors[1]).assertEqual('phone-not-numeric');
    });

    /**
     * @tc.name   dashesInsideThePhoneAreRejected
     * @tc.desc   A grouped number with dashes fails both the cap and the numeric rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('dashesInsideThePhoneAreRejected', 0, () => {
      const phone = '138-0013-8000';
      expect(phone.charCodeAt(3)).assertEqual(45);
      expect(isDigitsOnly(phone)).assertFalse();
      const errors = phoneErrors(phone);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('phone-too-long');
      expect(errors[1]).assertEqual('phone-not-numeric');
      expect(errorTrace(errors)).assertEqual('phone-too-long|phone-not-numeric');
    });

    /**
     * @tc.name   leadingZeroIsAccepted
     * @tc.desc   A leading zero is an ordinary digit code unit, so the number passes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('leadingZeroIsAccepted', 0, () => {
      const phone = '01380013800';
      expect(phone.length).assertEqual(11);
      expect(phone.charCodeAt(0)).assertEqual(48);
      expect(isDigitsOnly(phone)).assertTrue();
      expect(phoneErrors(phone).length).assertEqual(0);
      expect(ContactValidation.canSubmit(formWithPhone(phone))).assertTrue();
    });

    /**
     * @tc.name   allZeroPhoneIsAccepted
     * @tc.desc   Eleven zero digits satisfy both the length and the numeric rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('allZeroPhoneIsAccepted', 0, () => {
      const phone = repeatedText(11, '0');
      expect(phone).assertEqual('00000000000');
      expect(isDigitsOnly(phone)).assertTrue();
      expect(phoneErrors(phone).length).assertEqual(0);
      expect(ContactValidation.canSubmit(formWithPhone(phone))).assertTrue();
    });

    /**
     * @tc.name   singleDigitPhoneIsAccepted
     * @tc.desc   There is no minimum length, so one digit is enough for the phone field.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('singleDigitPhoneIsAccepted', 0, () => {
      expect(isDigitsOnly('1')).assertTrue();
      expect(phoneErrors('1').length).assertEqual(0);
      expect(ContactValidation.canSubmit(formWithPhone('1'))).assertTrue();
      expect(formWithPhone('1').phone.length).assertEqual(1);
    });

    /**
     * @tc.name   shortNumberIsAccepted
     * @tc.desc   A three digit short code passes because no country length is enforced.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('shortNumberIsAccepted', 0, () => {
      const phone = '110';
      expect(phone.length).assertEqual(3);
      expect(isDigitsOnly(phone)).assertTrue();
      expect(phoneErrors(phone).length).assertEqual(0);
      expect(ContactValidation.canSubmit(formWithPhone(phone))).assertTrue();
    });

    /**
     * @tc.name   decimalPointIsRejected
     * @tc.desc   A dot between digits fails the numeric rule and stays inside the cap.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('decimalPointIsRejected', 0, () => {
      const phone = '138.0013';
      expect(phone.indexOf('.')).assertEqual(3);
      expect(phone.length).assertEqual(8);
      expect(isDigitsOnly(phone)).assertFalse();
      const errors = phoneErrors(phone);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-not-numeric');
    });

    /**
     * @tc.name   fullWidthDigitsAreRejected
     * @tc.desc   Full width digits sit above the ascii range and fail the code unit check.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('fullWidthDigitsAreRejected', 0, () => {
      const phone = repeatedText(11, '\uFF11');
      expect(phone.length).assertEqual(11);
      expect(phone.charCodeAt(0)).assertEqual(65297);
      expect(phone.charCodeAt(0) > 57).assertTrue();
      expect(isDigitsOnly(phone)).assertFalse();
      expect(phoneErrors(phone)[0]).assertEqual('phone-not-numeric');
    });

    /**
     * @tc.name   arabicIndicDigitsAreRejected
     * @tc.desc   Arabic Indic digit code units are outside 0x30..0x39 as well.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('arabicIndicDigitsAreRejected', 0, () => {
      const phone = repeatedText(5, '\u0660');
      expect(phone.length).assertEqual(5);
      expect(phone.charCodeAt(0)).assertEqual(1632);
      expect(isDigitsOnly(phone)).assertFalse();
      expect(phoneErrors(phone).length).assertEqual(1);
      expect(phoneErrors(phone)[0]).assertEqual('phone-not-numeric');
    });

    /**
     * @tc.name   underscoreBetweenDigitsIsRejected
     * @tc.desc   An underscore is not a digit and is reported as not numeric.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('underscoreBetweenDigitsIsRejected', 0, () => {
      const phone = '138_0013_8000';
      expect(phone.substring(3, 4)).assertEqual('_');
      expect(phone.length).assertEqual(13);
      expect(isDigitsOnly(phone)).assertFalse();
      const errors = phoneErrors(phone);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('phone-too-long');
      expect(errors[1]).assertEqual('phone-not-numeric');
    });

    /**
     * @tc.name   newlineInThePhoneIsRejected
     * @tc.desc   A trailing newline pushes the value past the digit alphabet.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('newlineInThePhoneIsRejected', 0, () => {
      const phone = '13800138000\n';
      expect(phone.length).assertEqual(12);
      expect(phone.charCodeAt(11)).assertEqual(10);
      expect(isDigitsOnly(phone)).assertFalse();
      expect(phoneErrors(phone).length).assertEqual(1);
      expect(phoneErrors(phone)[0]).assertEqual('phone-not-numeric');
    });

    /**
     * @tc.name   tabInThePhoneIsRejected
     * @tc.desc   A tab is a control code unit and fails the numeric scan.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('tabInThePhoneIsRejected', 0, () => {
      const phone = '1380\t138000';
      expect(phone.charCodeAt(4)).assertEqual(9);
      expect(isDigitsOnly(phone)).assertFalse();
      expect(phoneErrors(phone)[0]).assertEqual('phone-not-numeric');
      expect(ContactValidation.canSubmit(formWithPhone(phone))).assertFalse();
    });

    /**
     * @tc.name   overLongPhoneWithALetterReportsBothCodes
     * @tc.desc   Fourteen units containing a letter trip the cap and the alphabet rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('overLongPhoneWithALetterReportsBothCodes', 0, () => {
      const phone = repeatedText(13, '9') + 'a';
      expect(phone.length).assertEqual(14);
      expect(isDigitsOnly(phone)).assertFalse();
      const errors = phoneErrors(phone);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('phone-too-long');
      expect(errors[1]).assertEqual('phone-not-numeric');
      expect(errorTrace(errors)).assertEqual('phone-too-long|phone-not-numeric');
    });

    /**
     * @tc.name   canSubmitFlipsOnASingleBadUnit
     * @tc.desc   Replacing one digit with a letter changes the verdict while length is unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('canSubmitFlipsOnASingleBadUnit', 0, () => {
      const good = '13800138000';
      const bad = '1380013800x';
      expect(good.length).assertEqual(bad.length);
      expect(ContactValidation.canSubmit(formWithPhone(good))).assertTrue();
      expect(ContactValidation.canSubmit(formWithPhone(bad))).assertFalse();
      expect(isDigitsOnly(good)).assertTrue();
      expect(isDigitsOnly(bad)).assertFalse();
    });

    /**
     * @tc.name   digitsOnlyHelperAgreesWithTheValidator
     * @tc.desc   For six samples the helper verdict matches whether a not-numeric code appears.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('digitsOnlyHelperAgreesWithTheValidator', 0, () => {
      const samples: string[] = ['13800138000', '13800a3800', '+8613800138000', '000', '1 2', '999999999999'];
      let agreements = 0;
      for (let index = 0; index < samples.length; index++) {
        const helper = isDigitsOnly(samples[index]);
        const validatorNumeric = countOf(phoneErrors(samples[index]), 'phone-not-numeric') === 0;
        if (helper === validatorNumeric) {
          agreements = agreements + 1;
        }
      }
      expect(agreements).assertEqual(6);
      expect(samples.length).assertEqual(6);
      expect(isDigitsOnly(samples[0])).assertTrue();
    });

    /**
     * @tc.name   everySeedPhoneIsDigitsOnly
     * @tc.desc   The fifteen seeded phone values contain no separators or letters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('everySeedPhoneIsDigitsOnly', 0, () => {
      const rows = createSeedContacts();
      let digitsOnlyRows = 0;
      for (let index = 0; index < rows.length; index++) {
        if (isDigitsOnly(rows[index].phone)) {
          digitsOnlyRows = digitsOnlyRows + 1;
        }
      }
      expect(digitsOnlyRows).assertEqual(15);
      expect(rows.length).assertEqual(15);
      expect(phoneErrors(rows[0].phone).length).assertEqual(0);
    });

    /**
     * @tc.name   everySeedPhoneIsElevenDigits
     * @tc.desc   All fifteen seeded numbers sit one unit below the twelve unit cap.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('everySeedPhoneIsElevenDigits', 0, () => {
      const rows = createSeedContacts();
      let eleven = 0;
      for (let index = 0; index < rows.length; index++) {
        if (rows[index].phone.length === 11) {
          eleven = eleven + 1;
        }
        expect(rows[index].phone.length < MAX_PHONE_LENGTH).assertTrue();
      }
      expect(eleven).assertEqual(15);
      expect(MAX_PHONE_LENGTH - rows[0].phone.length).assertEqual(1);
    });

    /**
     * @tc.name   phoneLengthSweepRunsFromOneToFifteenUnits
     * @tc.desc   Digit strings only report the cap from unit thirteen onward.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('phoneLengthSweepRunsFromOneToFifteenUnits', 0, () => {
      let accepted = 0;
      let rejected = 0;
      for (let length = 1; length <= 15; length++) {
        const errors = phoneErrors(repeatedText(length, '4'));
        if (errors.length === 0) {
          accepted = accepted + 1;
        } else {
          rejected = rejected + 1;
        }
      }
      expect(accepted).assertEqual(12);
      expect(rejected).assertEqual(3);
      expect(accepted + rejected).assertEqual(15);
    });

    /**
     * @tc.name   digitsOnlyCheckIsPureAcrossRepeatedCalls
     * @tc.desc   Four calls on the same mixed value all return false with no state kept.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('digitsOnlyCheckIsPureAcrossRepeatedCalls', 0, () => {
      const value = '12345abc';
      let falseCount = 0;
      for (let index = 0; index < 4; index++) {
        if (!isDigitsOnly(value)) {
          falseCount = falseCount + 1;
        }
      }
      expect(falseCount).assertEqual(4);
      expect(isDigitsOnly('12345')).assertTrue();
      expect(isDigitsOnly('12345abc')).assertFalse();
      expect(value.length).assertEqual(8);
    });

    /**
     * @tc.name   parenthesesAroundTheAreaCodeAreRejected
     * @tc.desc   A formatted landline with parentheses fails the numeric rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('parenthesesAroundTheAreaCodeAreRejected', 0, () => {
      const phone = '(010)12345678';
      expect(phone.substring(0, 1)).assertEqual('(');
      expect(phone.length).assertEqual(13);
      expect(isDigitsOnly(phone)).assertFalse();
      const errors = phoneErrors(phone);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('phone-too-long');
      expect(errors[1]).assertEqual('phone-not-numeric');
    });

    /**
     * @tc.name   slashSeparatorIsRejected
     * @tc.desc   A slash between digit groups is not in the digit alphabet.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('slashSeparatorIsRejected', 0, () => {
      const phone = '010/1234567';
      expect(phone.indexOf('/')).assertEqual(3);
      expect(phone.length).assertEqual(11);
      expect(isDigitsOnly(phone)).assertFalse();
      const errors = phoneErrors(phone);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-not-numeric');
    });

    /**
     * @tc.name   spacesOnlyPhoneIsNotNumeric
     * @tc.desc   A whitespace only value is non-empty, short and not numeric.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('spacesOnlyPhoneIsNotNumeric', 0, () => {
      const phone = repeatedText(3, ' ');
      expect(phone.length).assertEqual(3);
      expect(isDigitsOnly(phone)).assertFalse();
      const errors = phoneErrors(phone);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-not-numeric');
      expect(countOf(errors, 'phone-empty')).assertEqual(0);
    });

    /**
     * @tc.name   twelveAndThirteenUnitsDifferByOneCode
     * @tc.desc   The cap transition is a single step from zero codes to one too-long code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twelveAndThirteenUnitsDifferByOneCode', 0, () => {
      const twelve = repeatedText(12, '2');
      const thirteen = repeatedText(13, '2');
      expect(twelve.length).assertEqual(12);
      expect(thirteen.length).assertEqual(13);
      expect(phoneErrors(twelve).length).assertEqual(0);
      expect(phoneErrors(thirteen).length).assertEqual(1);
      expect(phoneErrors(thirteen)[0]).assertEqual('phone-too-long');
      expect(errorTrace(phoneErrors(thirteen))).assertEqual('phone-too-long');
    });

    /**
     * @tc.name   everyAsciiDigitRepeatedElevenTimesIsAccepted
     * @tc.desc   Ten different digit values each form an accepted eleven unit number.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('everyAsciiDigitRepeatedElevenTimesIsAccepted', 0, () => {
      const digits: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
      let accepted = 0;
      for (let index = 0; index < digits.length; index++) {
        const phone = repeatedText(11, digits[index]);
        if (phoneErrors(phone).length === 0) {
          accepted = accepted + 1;
        }
      }
      expect(accepted).assertEqual(10);
      expect(digits.length).assertEqual(10);
      expect(isDigitsOnly(repeatedText(11, '0'))).assertTrue();
    });

    /**
     * @tc.name   trailingZeroKeepsTheNumberAccepted
     * @tc.desc   A number ending in zero has no special meaning for the digit scan.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('trailingZeroKeepsTheNumberAccepted', 0, () => {
      const phone = '13800138000';
      expect(phone.substring(10, 11)).assertEqual('0');
      expect(phone.lastIndexOf('0')).assertEqual(10);
      expect(isDigitsOnly(phone)).assertTrue();
      expect(phoneErrors(phone).length).assertEqual(0);
      expect(ContactValidation.canSubmit(formWithPhone(phone))).assertTrue();
    });

    /**
     * @tc.name   phoneCodesPrecedeEmailAndAddressCodes
     * @tc.desc   A letter phone with a blank email and address reports the phone code first.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('phoneCodesPrecedeEmailAndAddressCodes', 0, () => {
      const form = contactOf('排错', '12a', '', '');
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(3);
      expect(errors[0]).assertEqual('phone-not-numeric');
      expect(errors[1]).assertEqual('email-empty');
      expect(errors[2]).assertEqual('address-empty');
      expect(errorTrace(errors)).assertEqual('phone-not-numeric|email-empty|address-empty');
    });

    /**
     * @tc.name   nonBreakingSpaceIsRejected
     * @tc.desc   U+00A0 is outside the digit range and breaks the numeric scan.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('nonBreakingSpaceIsRejected', 0, () => {
      const phone = '138' + '\u00A0' + '0013800';
      expect(phone.charCodeAt(3)).assertEqual(160);
      expect(phone.length).assertEqual(11);
      expect(isDigitsOnly(phone)).assertFalse();
      const errors = phoneErrors(phone);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-not-numeric');
    });

    /**
     * @tc.name   commaSeparatedNumberIsRejected
     * @tc.desc   Commas are outside 0x30..0x39 and only the numeric code appears.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('commaSeparatedNumberIsRejected', 0, () => {
      const phone = '1,380,013,800';
      expect(phone.indexOf(',')).assertEqual(1);
      expect(phone.length).assertEqual(13);
      expect(isDigitsOnly(phone)).assertFalse();
      const errors = phoneErrors(phone);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('phone-too-long');
      expect(errors[1]).assertEqual('phone-not-numeric');
    });

    /**
     * @tc.name   plusSignAloneIsNotNumeric
     * @tc.desc   A lone plus sign is non-empty and fails the numeric rule without a length code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('plusSignAloneIsNotNumeric', 0, () => {
      expect(isDigitsOnly('+')).assertFalse();
      const errors = phoneErrors('+');
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-not-numeric');
      expect(countOf(errors, 'phone-empty')).assertEqual(0);
      expect(countOf(errors, 'phone-too-long')).assertEqual(0);
    });

    /**
     * @tc.name   hyphenAloneIsNotNumeric
     * @tc.desc   A lone hyphen is rejected by the alphabet check, not by the cap.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('hyphenAloneIsNotNumeric', 0, () => {
      expect(isDigitsOnly('-')).assertFalse();
      const errors = phoneErrors('-');
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-not-numeric');
      expect(ContactValidation.canSubmit(formWithPhone('-'))).assertFalse();
      expect('-'.charCodeAt(0)).assertEqual(45);
    });

    /**
     * @tc.name   twelveUnitsWithTwoLettersIsNotTooLong
     * @tc.desc   At the cap the letters only produce the numeric code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('twelveUnitsWithTwoLettersIsNotTooLong', 0, () => {
      const phone = repeatedText(10, '5') + 'ab';
      expect(phone.length).assertEqual(12);
      const errors = phoneErrors(phone);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-not-numeric');
      expect(countOf(errors, 'phone-too-long')).assertEqual(0);
      expect(isDigitsOnly(phone)).assertFalse();
    });

    /**
     * @tc.name   everySeedRowProducesNoPhoneCode
     * @tc.desc   Validating each of the fifteen seeded rows emits no phone code at all.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('everySeedRowProducesNoPhoneCode', 0, () => {
      const rows = createSeedContacts();
      let inspected = 0;
      for (let index = 0; index < rows.length; index++) {
        expect(phoneErrors(rows[index].phone).length).assertEqual(0);
        inspected = inspected + 1;
      }
      expect(inspected).assertEqual(15);
      expect(phoneErrors(rows[14].phone).length).assertEqual(0);
    });

    /**
     * @tc.name   alternatingDigitsAreAccepted
     * @tc.desc   A non-mobile pattern of alternating ones and zeros is still all digits.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('alternatingDigitsAreAccepted', 0, () => {
      const phone = '10101010101';
      expect(phone.length).assertEqual(11);
      expect(phone.substring(0, 1)).assertEqual('1');
      expect(phone.substring(1, 2)).assertEqual('0');
      expect(isDigitsOnly(phone)).assertTrue();
      expect(phoneErrors(phone).length).assertEqual(0);
    });

    /**
     * @tc.name   currencySymbolIsRejected
     * @tc.desc   A leading dollar sign fails the alphabet rule even with valid digits after it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('currencySymbolIsRejected', 0, () => {
      const phone = '$100';
      expect(phone.charCodeAt(0)).assertEqual(36);
      expect(isDigitsOnly(phone)).assertFalse();
      const errors = phoneErrors(phone);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-not-numeric');
      expect(ContactValidation.canSubmit(formWithPhone(phone))).assertFalse();
    });

    /**
     * @tc.name   tenDigitServiceNumberIsAccepted
     * @tc.desc   A ten unit service number is inside the cap and passes the alphabet rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('tenDigitServiceNumberIsAccepted', 0, () => {
      const phone = '8001234567';
      expect(phone.length).assertEqual(10);
      expect(phone.length).assertEqual(MAX_PHONE_LENGTH - 2);
      expect(isDigitsOnly(phone)).assertTrue();
      expect(phoneErrors(phone).length).assertEqual(0);
      expect(ContactValidation.canSubmit(formWithPhone(phone))).assertTrue();
    });

    /**
     * @tc.name   phoneErrorsRemainStableAcrossRepeatedCalls
     * @tc.desc   Three runs over the same mixed value produce the same two code sequence.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('phoneErrorsRemainStableAcrossRepeatedCalls', 0, () => {
      const phone = '13a0013800012';
      const first = errorTrace(phoneErrors(phone));
      const second = errorTrace(phoneErrors(phone));
      const third = errorTrace(phoneErrors(phone));
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
      expect(first).assertEqual('phone-too-long|phone-not-numeric');
      expect(phone.length).assertEqual(13);
    });

    /**
     * @tc.name   mathematicalBoldDigitIsRejected
     * @tc.desc   A surrogate pair digit is far outside the ascii range and fails the scan.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('mathematicalBoldDigitIsRejected', 0, () => {
      const phone = '\u{1D7CF}\u{1D7CF}';
      expect(phone.length).assertEqual(4);
      expect(phone.charCodeAt(0) > 57).assertTrue();
      expect(isDigitsOnly(phone)).assertFalse();
      const errors = phoneErrors(phone);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-not-numeric');
      expect(uniqueStrings(errors).length).assertEqual(1);
    });

    /**
     * @tc.name   twelveZeroPaddedDigitsAreAccepted
     * @tc.desc   Twelve units of mostly zeros still satisfy the cap and the alphabet rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twelveZeroPaddedDigitsAreAccepted', 0, () => {
      const phone = repeatedText(11, '0') + '1';
      expect(phone.length).assertEqual(12);
      expect(phone.endsWith('1')).assertTrue();
      expect(isDigitsOnly(phone)).assertTrue();
      expect(phoneErrors(phone).length).assertEqual(0);
      expect(ContactValidation.canSubmit(formWithPhone(phone))).assertTrue();
    });

    /**
     * @tc.name   questionMarkInsideTheNumberIsRejected
     * @tc.desc   A placeholder character fails the alphabet rule and adds no length code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('questionMarkInsideTheNumberIsRejected', 0, () => {
      const phone = '138?0138';
      expect(phone.indexOf('?')).assertEqual(3);
      expect(phone.length).assertEqual(8);
      expect(isDigitsOnly(phone)).assertFalse();
      const errors = phoneErrors(phone);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-not-numeric');
    });

    /**
     * @tc.name   digitCodeUnitsAreTheContiguousRangeFromZeroToNine
     * @tc.desc   Codes 48 through 57 are digits while 47 and 58 are not.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the PhoneFormatValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('digitCodeUnitsAreTheContiguousRangeFromZeroToNine', 0, () => {
      let text = '';
      for (let code = 48; code <= 57; code++) {
        text = text + String.fromCharCode(code);
      }
      expect(text).assertEqual('0123456789');
      expect(isDigitsOnly(text)).assertTrue();
      expect(isDigitsOnly(String.fromCharCode(47))).assertFalse();
      expect(isDigitsOnly(String.fromCharCode(58))).assertFalse();
      expect(phoneErrors(text).length).assertEqual(0);
      expect(text.length).assertEqual(10);
      expect(isDigitsOnly(text)).assertTrue();
      expect(ContactValidation.canSubmit(formWithPhone(text))).assertTrue();
      expect(MAX_PHONE_LENGTH > text.length).assertTrue();
      expect(uniqueStrings(phoneErrors(text)).length).assertEqual(0);
      expect(text.indexOf('5')).assertEqual(5);
      expect(text.substring(9, 10)).assertEqual('9');
      expect(isDigitsOnly('0')).assertTrue();
      expect(isDigitsOnly('a')).assertFalse();
      expect(text).assertEqual('0123456789');
    });
  });
}
