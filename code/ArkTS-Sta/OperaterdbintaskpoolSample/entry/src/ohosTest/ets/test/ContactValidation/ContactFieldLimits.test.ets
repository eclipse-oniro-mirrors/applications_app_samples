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
 * Per field maxLength limits of the four AddressBookEdit inputs.
 *
 * Anchors:
 *   AddressBookEdit.ets:173      name .maxLength(MAX_LENGTH_MODERATE)      = 12
 *   AddressBookEdit.ets:204      phone .maxLength(MAX_LENGTH_MODERATE)     = 12
 *   AddressBookEdit.ets:238      email .maxLength(MAX_LENGTH_LONG)         = 25
 *   AddressBookEdit.ets:272      address .maxLength(MAX_LENGTH_VERY_LONG)  = 100
 *   CommonConstant.ets:51-53     the three literals above
 *   SharedDriver.ets:70-73       MAX_NAME_LENGTH, MAX_PHONE_LENGTH,
 *                                MAX_EMAIL_LENGTH, MAX_ADDRESS_LENGTH
 *   SharedDriver.ets:204-239     per field empty, too-long and format checks
 *
 * The name and phone inputs deliberately share the moderate constant, so a
 * change to one limit must not silently move the other. Each field is measured
 * on its own below, then all four are combined at the boundary and beyond it.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import { CommonConstants } from '../../../../main/ets/pages/constant/CommonConstant';
import {
  MAX_ADDRESS_LENGTH,
  MAX_EMAIL_LENGTH,
  MAX_NAME_LENGTH,
  MAX_PHONE_LENGTH,
  ContactValidation,
  contactOf,
  countOf,
  createSeedContacts,
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

/** Builds a shaped email whose total length is exactly total. */
function emailOfLength(total: number): string {
  return repeatedText(total - 6, 'a') + '@x.com';
}

/** A form with all four inputs filled at their smallest legal values. */
function minimalForm(): Contact {
  return contactOf('甲', '1', 'a@b.cn', '京');
}

/** A form whose fields are replaced by the supplied values. */
function formWith(name: string, phone: string, email: string, address: string): Contact {
  return contactOf(name, phone, email, address);
}

/** Joins codes so one assertion can pin a whole sequence. */
function errorTrace(errors: string[]): string {
  return joined(errors, '|');
}

export default function contactFieldLimitsTest(): void {
  describe('ContactFieldLimits', () => {
    beforeAll(() => {
      logSuite('ContactFieldLimits', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('ContactFieldLimits', 'end');
    });

    /**
     * @tc.name   limitsMatchTheDeclaredProductionConstants
     * @tc.desc   Name and phone share 12, email is 25 and address is 100.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('limitsMatchTheDeclaredProductionConstants', 0, () => {
      logStep('ContactFieldLimits', 'declared limits');
      expect(MAX_NAME_LENGTH).assertEqual(12);
      expect(MAX_PHONE_LENGTH).assertEqual(12);
      expect(MAX_EMAIL_LENGTH).assertEqual(25);
      expect(MAX_ADDRESS_LENGTH).assertEqual(100);
      expect(MAX_NAME_LENGTH).assertEqual(CommonConstants.MAX_LENGTH_MODERATE);
      expect(MAX_EMAIL_LENGTH).assertEqual(CommonConstants.MAX_LENGTH_LONG);
    });

    /**
     * @tc.name   nameAtItsLimitIsAccepted
     * @tc.desc   Twelve name units pass while the rest of the form is minimal and valid.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('nameAtItsLimitIsAccepted', 0, () => {
      const form = formWith(repeatedText(12, '名'), '1', 'a@b.cn', '京');
      expect(form.name.length).assertEqual(MAX_NAME_LENGTH);
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(0);
      expect(countOf(errors, 'name-too-long')).assertEqual(0);
      expect(ContactValidation.canSubmit(form)).assertTrue();
    });

    /**
     * @tc.name   nameLimitPlusOneIsRejected
     * @tc.desc   Thirteen name units produce exactly name-too-long.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('nameLimitPlusOneIsRejected', 0, () => {
      const form = formWith(repeatedText(13, '名'), '1', 'a@b.cn', '京');
      expect(form.name.length).assertEqual(MAX_NAME_LENGTH + 1);
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('name-too-long');
      expect(ContactValidation.canSubmit(form)).assertFalse();
    });

    /**
     * @tc.name   nameLimitPlusTwoIsRejected
     * @tc.desc   Fourteen name units still collapse into the single too-long code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('nameLimitPlusTwoIsRejected', 0, () => {
      const form = formWith(repeatedText(14, '名'), '1', 'a@b.cn', '京');
      expect(form.name.length).assertEqual(MAX_NAME_LENGTH + 2);
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('name-too-long');
      expect(errorTrace(errors)).assertEqual('name-too-long');
    });

    /**
     * @tc.name   phoneAtItsLimitIsAccepted
     * @tc.desc   Twelve digits clear both the length and the digits-only rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('phoneAtItsLimitIsAccepted', 0, () => {
      const form = formWith('甲', repeatedText(12, '9'), 'a@b.cn', '京');
      expect(form.phone.length).assertEqual(MAX_PHONE_LENGTH);
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(0);
      expect(countOf(errors, 'phone-too-long')).assertEqual(0);
      expect(ContactValidation.canSubmit(form)).assertTrue();
    });

    /**
     * @tc.name   phoneLimitPlusOneIsRejected
     * @tc.desc   Thirteen digits trip only the phone cap, not the numeric rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('phoneLimitPlusOneIsRejected', 0, () => {
      const form = formWith('甲', repeatedText(13, '9'), 'a@b.cn', '京');
      expect(form.phone.length).assertEqual(MAX_PHONE_LENGTH + 1);
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-too-long');
      expect(countOf(errors, 'phone-not-numeric')).assertEqual(0);
    });

    /**
     * @tc.name   phoneLimitPlusTwoIsRejected
     * @tc.desc   Fourteen digits remain a single too-long code with no numeric complaint.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('phoneLimitPlusTwoIsRejected', 0, () => {
      const form = formWith('甲', repeatedText(14, '9'), 'a@b.cn', '京');
      expect(form.phone.length).assertEqual(MAX_PHONE_LENGTH + 2);
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('phone-too-long');
      expect(ContactValidation.canSubmit(form)).assertFalse();
    });

    /**
     * @tc.name   emailAtItsLimitIsAccepted
     * @tc.desc   A shaped email of exactly twenty five units passes the cap and the shape rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emailAtItsLimitIsAccepted', 0, () => {
      const email = emailOfLength(25);
      const form = formWith('甲', '1', email, '京');
      expect(email.length).assertEqual(MAX_EMAIL_LENGTH);
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(0);
      expect(countOf(errors, 'email-too-long')).assertEqual(0);
      expect(ContactValidation.canSubmit(form)).assertTrue();
    });

    /**
     * @tc.name   emailLimitPlusOneIsRejected
     * @tc.desc   Twenty six shaped units produce only email-too-long.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emailLimitPlusOneIsRejected', 0, () => {
      const email = emailOfLength(26);
      const form = formWith('甲', '1', email, '京');
      expect(email.length).assertEqual(MAX_EMAIL_LENGTH + 1);
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('email-too-long');
      expect(countOf(errors, 'email-malformed')).assertEqual(0);
    });

    /**
     * @tc.name   emailLimitPlusTwoIsRejected
     * @tc.desc   Twenty seven shaped units keep one code and stay shaped.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emailLimitPlusTwoIsRejected', 0, () => {
      const email = emailOfLength(27);
      const form = formWith('甲', '1', email, '京');
      expect(email.length).assertEqual(MAX_EMAIL_LENGTH + 2);
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('email-too-long');
      expect(ContactValidation.canSubmit(form)).assertFalse();
    });

    /**
     * @tc.name   addressAtItsLimitIsAccepted
     * @tc.desc   One hundred address units pass while the other three fields stay minimal.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addressAtItsLimitIsAccepted', 0, () => {
      const form = formWith('甲', '1', 'a@b.cn', repeatedText(100, '址'));
      expect(form.address.length).assertEqual(MAX_ADDRESS_LENGTH);
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(0);
      expect(countOf(errors, 'address-too-long')).assertEqual(0);
      expect(ContactValidation.canSubmit(form)).assertTrue();
    });

    /**
     * @tc.name   addressLimitPlusOneIsRejected
     * @tc.desc   One hundred and one units produce exactly address-too-long.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('addressLimitPlusOneIsRejected', 0, () => {
      const form = formWith('甲', '1', 'a@b.cn', repeatedText(101, '址'));
      expect(form.address.length).assertEqual(MAX_ADDRESS_LENGTH + 1);
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('address-too-long');
      expect(ContactValidation.canSubmit(form)).assertFalse();
    });

    /**
     * @tc.name   addressLimitPlusTwoIsRejected
     * @tc.desc   One hundred and two units still yield a single address code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addressLimitPlusTwoIsRejected', 0, () => {
      const form = formWith('甲', '1', 'a@b.cn', repeatedText(102, '址'));
      expect(form.address.length).assertEqual(MAX_ADDRESS_LENGTH + 2);
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('address-too-long');
      expect(errorTrace(errors)).assertEqual('address-too-long');
    });

    /**
     * @tc.name   nameOneBelowItsLimitIsAccepted
     * @tc.desc   Eleven name units pass, confirming the cap is a ceiling not an exact size.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('nameOneBelowItsLimitIsAccepted', 0, () => {
      const form = formWith(repeatedText(11, '名'), '1', 'a@b.cn', '京');
      expect(form.name.length).assertEqual(MAX_NAME_LENGTH - 1);
      expect(ContactValidation.validate(form).length).assertEqual(0);
      expect(ContactValidation.canSubmit(form)).assertTrue();
      expect(form.name.length < MAX_NAME_LENGTH).assertTrue();
    });

    /**
     * @tc.name   phoneOneBelowItsLimitIsAccepted
     * @tc.desc   Eleven digits, the production common case, pass without a length code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('phoneOneBelowItsLimitIsAccepted', 0, () => {
      const form = formWith('甲', repeatedText(11, '1'), 'a@b.cn', '京');
      expect(form.phone.length).assertEqual(MAX_PHONE_LENGTH - 1);
      expect(form.phone).assertEqual('11111111111');
      expect(ContactValidation.validate(form).length).assertEqual(0);
      expect(ContactValidation.canSubmit(form)).assertTrue();
    });

    /**
     * @tc.name   emailOneBelowItsLimitIsAccepted
     * @tc.desc   Twenty four shaped units pass and remain inside the long constant.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emailOneBelowItsLimitIsAccepted', 0, () => {
      const email = emailOfLength(24);
      const form = formWith('甲', '1', email, '京');
      expect(email.length).assertEqual(MAX_EMAIL_LENGTH - 1);
      expect(ContactValidation.validate(form).length).assertEqual(0);
      expect(ContactValidation.canSubmit(form)).assertTrue();
      expect(countOf(ContactValidation.validate(form), 'email-too-long')).assertEqual(0);
    });

    /**
     * @tc.name   addressOneBelowItsLimitIsAccepted
     * @tc.desc   Ninety nine address units pass and the cap only starts at one hundred one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addressOneBelowItsLimitIsAccepted', 0, () => {
      const form = formWith('甲', '1', 'a@b.cn', repeatedText(99, '址'));
      expect(form.address.length).assertEqual(MAX_ADDRESS_LENGTH - 1);
      expect(ContactValidation.validate(form).length).assertEqual(0);
      expect(ContactValidation.canSubmit(form)).assertTrue();
      expect(form.address.length > 0).assertTrue();
    });

    /**
     * @tc.name   allFourFieldsAtTheirLimitsPassTogether
     * @tc.desc   Twelve, twelve, twenty five and one hundred units coexist without an error.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('allFourFieldsAtTheirLimitsPassTogether', 0, () => {
      const form = formWith(repeatedText(12, '名'), repeatedText(12, '3'), emailOfLength(25),
        repeatedText(100, '址'));
      expect(form.name.length).assertEqual(MAX_NAME_LENGTH);
      expect(form.phone.length).assertEqual(MAX_PHONE_LENGTH);
      expect(form.email.length).assertEqual(MAX_EMAIL_LENGTH);
      expect(form.address.length).assertEqual(MAX_ADDRESS_LENGTH);
      expect(ContactValidation.validate(form).length).assertEqual(0);
      expect(ContactValidation.canSubmit(form)).assertTrue();
    });

    /**
     * @tc.name   allFourFieldsAtLimitPlusOneReportFourCodes
     * @tc.desc   One extra unit in each field yields the four too-long codes in field order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('allFourFieldsAtLimitPlusOneReportFourCodes', 0, () => {
      const form = formWith(repeatedText(13, '名'), repeatedText(13, '3'), emailOfLength(26),
        repeatedText(101, '址'));
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(4);
      expect(errorTrace(errors)).assertEqual('name-too-long|phone-too-long|email-too-long|address-too-long');
      expect(uniqueStrings(errors).length).assertEqual(4);
      expect(ContactValidation.canSubmit(form)).assertFalse();
    });

    /**
     * @tc.name   allFourFieldsAtLimitPlusTwoReportFourCodes
     * @tc.desc   Two extra units per field keep the same four code sequence.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('allFourFieldsAtLimitPlusTwoReportFourCodes', 0, () => {
      const form = formWith(repeatedText(14, '名'), repeatedText(14, '3'), emailOfLength(27),
        repeatedText(102, '址'));
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(4);
      expect(errors[0]).assertEqual('name-too-long');
      expect(errors[1]).assertEqual('phone-too-long');
      expect(errors[2]).assertEqual('email-too-long');
      expect(errors[3]).assertEqual('address-too-long');
      expect(countOf(errors, 'name-too-long')).assertEqual(1);
    });

    /**
     * @tc.name   nameLimitCountsChineseCharactersAsOneUnit
     * @tc.desc   Twelve Chinese characters fit while thirteen do not, exactly like ascii.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('nameLimitCountsChineseCharactersAsOneUnit', 0, () => {
      const atLimit = formWith(repeatedText(12, '张'), '1', 'a@b.cn', '京');
      const overLimit = formWith(repeatedText(13, '张'), '1', 'a@b.cn', '京');
      expect(atLimit.name.length).assertEqual(12);
      expect(overLimit.name.length).assertEqual(13);
      expect(ContactValidation.validate(atLimit).length).assertEqual(0);
      expect(ContactValidation.validate(overLimit)[0]).assertEqual('name-too-long');
      expect(ContactValidation.canSubmit(atLimit)).assertTrue();
    });

    /**
     * @tc.name   phoneLimitKeepsTheDigitsOnlyRuleSeparate
     * @tc.desc   Thirteen letters report both the cap and the numeric rule, in that order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('phoneLimitKeepsTheDigitsOnlyRuleSeparate', 0, () => {
      const form = formWith('甲', repeatedText(13, 'a'), 'a@b.cn', '京');
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('phone-too-long');
      expect(errors[1]).assertEqual('phone-not-numeric');
      expect(errorTrace(errors)).assertEqual('phone-too-long|phone-not-numeric');
    });

    /**
     * @tc.name   emailOverTheLimitWithoutAShapeReportsBothEmailCodes
     * @tc.desc   A twenty six unit string with no at sign is too long and malformed at once.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emailOverTheLimitWithoutAShapeReportsBothEmailCodes', 0, () => {
      const form = formWith('甲', '1', repeatedText(26, 'a'), '京');
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('email-too-long');
      expect(errors[1]).assertEqual('email-malformed');
      expect(ContactValidation.canSubmit(form)).assertFalse();
    });

    /**
     * @tc.name   overLongNameAndAddressAreReportedIndependently
     * @tc.desc   The middle fields stay clean while name and address each report their own cap.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('overLongNameAndAddressAreReportedIndependently', 0, () => {
      const form = formWith(repeatedText(13, '名'), '1', 'a@b.cn', repeatedText(101, '址'));
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('name-too-long');
      expect(errors[1]).assertEqual('address-too-long');
      expect(countOf(errors, 'phone-too-long')).assertEqual(0);
      expect(countOf(errors, 'email-too-long')).assertEqual(0);
      expect(errorTrace(errors)).assertEqual('name-too-long|address-too-long');
    });

    /**
     * @tc.name   overLongNameAndEmailAreReportedIndependently
     * @tc.desc   Name and email caps fire while the phone and address stay acceptable.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('overLongNameAndEmailAreReportedIndependently', 0, () => {
      const form = formWith(repeatedText(14, '名'), '1', emailOfLength(27), '京');
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('name-too-long');
      expect(errors[1]).assertEqual('email-too-long');
      expect(countOf(errors, 'address-too-long')).assertEqual(0);
      expect(errors.indexOf('phone-too-long') < 0).assertTrue();
    });

    /**
     * @tc.name   oneOverlongFieldLeavesTheOtherThreeClean
     * @tc.desc   Four runs each breach one cap and report exactly one code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('oneOverlongFieldLeavesTheOtherThreeClean', 0, () => {
      const cases: Contact[] = [
        formWith(repeatedText(13, '名'), '1', 'a@b.cn', '京'),
        formWith('甲', repeatedText(13, '2'), 'a@b.cn', '京'),
        formWith('甲', '1', emailOfLength(26), '京'),
        formWith('甲', '1', 'a@b.cn', repeatedText(101, '址'))
      ];
      const expected: string[] = ['name-too-long', 'phone-too-long', 'email-too-long', 'address-too-long'];
      for (let index = 0; index < cases.length; index++) {
        const errors = ContactValidation.validate(cases[index]);
        expect(errors.length).assertEqual(1);
        expect(errors[0]).assertEqual(expected[index]);
      }
      expect(cases.length).assertEqual(4);
    });

    /**
     * @tc.name   nameLimitSweepTurnsAtThirteenUnits
     * @tc.desc   Eleven through fourteen name units produce zero, zero, one, one codes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('nameLimitSweepTurnsAtThirteenUnits', 0, () => {
      const counts: number[] = [];
      for (let length = 11; length <= 14; length++) {
        counts.push(ContactValidation.validate(formWith(repeatedText(length, '名'), '1', 'a@b.cn', '京')).length);
      }
      expect(counts.length).assertEqual(4);
      let trace = '';
      for (let index = 0; index < counts.length; index++) {
        trace = trace + String(counts[index]) + (index < counts.length - 1 ? '|' : '');
      }
      expect(trace).assertEqual('0|0|1|1');
      expect(counts[2]).assertEqual(1);
    });

    /**
     * @tc.name   phoneLimitSweepTurnsAtThirteenDigits
     * @tc.desc   Eleven through fourteen digits produce the same two-zero-then-two-one pattern.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('phoneLimitSweepTurnsAtThirteenDigits', 0, () => {
      const counts: number[] = [];
      for (let length = 11; length <= 14; length++) {
        counts.push(ContactValidation.validate(formWith('甲', repeatedText(length, '5'), 'a@b.cn', '京')).length);
      }
      expect(counts[0]).assertEqual(0);
      expect(counts[1]).assertEqual(0);
      expect(counts[2]).assertEqual(1);
      expect(counts[3]).assertEqual(1);
      expect(counts[2] + counts[3]).assertEqual(2);
    });

    /**
     * @tc.name   emailLimitSweepTurnsAtTwentySixUnits
     * @tc.desc   Twenty four through twenty seven shaped units produce zero, zero, one, one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emailLimitSweepTurnsAtTwentySixUnits', 0, () => {
      const counts: number[] = [];
      for (let length = 24; length <= 27; length++) {
        counts.push(ContactValidation.validate(formWith('甲', '1', emailOfLength(length), '京')).length);
      }
      expect(counts[0]).assertEqual(0);
      expect(counts[1]).assertEqual(0);
      expect(counts[2]).assertEqual(1);
      expect(counts[3]).assertEqual(1);
      expect(counts[2]).assertEqual(ContactValidation.validate(formWith('甲', '1', emailOfLength(26), '京')).length);
    });

    /**
     * @tc.name   addressLimitSweepTurnsAtOneHundredOneUnits
     * @tc.desc   Ninety nine through one hundred two units produce zero, zero, one, one.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('addressLimitSweepTurnsAtOneHundredOneUnits', 0, () => {
      const counts: number[] = [];
      for (let length = 99; length <= 102; length++) {
        counts.push(ContactValidation.validate(formWith('甲', '1', 'a@b.cn', repeatedText(length, '址'))).length);
      }
      expect(counts[0]).assertEqual(0);
      expect(counts[1]).assertEqual(0);
      expect(counts[2]).assertEqual(1);
      expect(counts[3]).assertEqual(1);
      expect(counts[0] + counts[3]).assertEqual(1);
    });

    /**
     * @tc.name   canSubmitTurnsFalseExactlyPastEachLimit
     * @tc.desc   For each field the at-limit form submits and the plus-one form does not.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('canSubmitTurnsFalseExactlyPastEachLimit', 0, () => {
      const atLimit: Contact[] = [
        formWith(repeatedText(12, '名'), '1', 'a@b.cn', '京'),
        formWith('甲', repeatedText(12, '2'), 'a@b.cn', '京'),
        formWith('甲', '1', emailOfLength(25), '京'),
        formWith('甲', '1', 'a@b.cn', repeatedText(100, '址'))
      ];
      const over: Contact[] = [
        formWith(repeatedText(13, '名'), '1', 'a@b.cn', '京'),
        formWith('甲', repeatedText(13, '2'), 'a@b.cn', '京'),
        formWith('甲', '1', emailOfLength(26), '京'),
        formWith('甲', '1', 'a@b.cn', repeatedText(101, '址'))
      ];
      let transitions = 0;
      for (let index = 0; index < atLimit.length; index++) {
        if (ContactValidation.canSubmit(atLimit[index]) && !ContactValidation.canSubmit(over[index])) {
          transitions = transitions + 1;
        }
      }
      expect(transitions).assertEqual(4);
      expect(ContactValidation.canSubmit(minimalForm())).assertTrue();
    });

    /**
     * @tc.name   fieldLimitsAreNotSharedAcrossFields
     * @tc.desc   A thirteen unit value is legal for email but not for name or phone.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('fieldLimitsAreNotSharedAcrossFields', 0, () => {
      const thirteen = repeatedText(13, 'a');
      const asName = formWith(thirteen, '1', 'a@b.cn', '京');
      const asEmail = formWith('甲', '1', thirteen, '京');
      expect(thirteen.length).assertEqual(13);
      expect(ContactValidation.validate(asName)[0]).assertEqual('name-too-long');
      expect(ContactValidation.validate(asEmail).length).assertEqual(1);
      expect(ContactValidation.validate(asEmail)[0]).assertEqual('email-malformed');
      expect(ContactValidation.canSubmit(asEmail)).assertFalse();
    });

    /**
     * @tc.name   minimalFormRemainsSubmittableAtEveryLimit
     * @tc.desc   Each field individually pushed to its exact limit keeps the whole form valid.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('minimalFormRemainsSubmittableAtEveryLimit', 0, () => {
      const forms: Contact[] = [
        formWith(repeatedText(12, '名'), '1', 'a@b.cn', '京'),
        formWith('甲', repeatedText(12, '4'), 'a@b.cn', '京'),
        formWith('甲', '1', emailOfLength(25), '京'),
        formWith('甲', '1', 'a@b.cn', repeatedText(100, '址'))
      ];
      let accepted = 0;
      for (let index = 0; index < forms.length; index++) {
        if (ContactValidation.canSubmit(forms[index])) {
          accepted = accepted + 1;
        }
      }
      expect(accepted).assertEqual(4);
      expect(forms.length).assertEqual(4);
      expect(ContactValidation.validate(forms[3]).length).assertEqual(0);
    });

    /**
     * @tc.name   limitBreachNeverDuplicatesACode
     * @tc.desc   Each single breach contributes exactly one copy of its own code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('limitBreachNeverDuplicatesACode', 0, () => {
      const over: Contact[] = [
        formWith(repeatedText(13, '名'), '1', 'a@b.cn', '京'),
        formWith('甲', repeatedText(13, '4'), 'a@b.cn', '京'),
        formWith('甲', '1', emailOfLength(26), '京'),
        formWith('甲', '1', 'a@b.cn', repeatedText(101, '址'))
      ];
      const codes: string[] = ['name-too-long', 'phone-too-long', 'email-too-long', 'address-too-long'];
      for (let index = 0; index < over.length; index++) {
        expect(countOf(ContactValidation.validate(over[index]), codes[index])).assertEqual(1);
        expect(uniqueStrings(ContactValidation.validate(over[index])).length).assertEqual(1);
      }
      expect(over.length).assertEqual(4);
    });

    /**
     * @tc.name   exceedingByManyUnitsStillReportsOneCodePerField
     * @tc.desc   Far past every cap the validator stays at four codes, not one per extra unit.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('exceedingByManyUnitsStillReportsOneCodePerField', 0, () => {
      const form = formWith(repeatedText(40, '名'), repeatedText(40, '5'), emailOfLength(60),
        repeatedText(300, '址'));
      const errors = ContactValidation.validate(form);
      expect(form.name.length).assertEqual(40);
      expect(errors.length).assertEqual(4);
      expect(uniqueStrings(errors).length).assertEqual(4);
      expect(countOf(errors, 'address-too-long')).assertEqual(1);
    });

    /**
     * @tc.name   nameAndPhoneShareTheLimitButReportDifferentCodes
     * @tc.desc   Both caps are twelve, yet each field keeps its own too-long code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('nameAndPhoneShareTheLimitButReportDifferentCodes', 0, () => {
      expect(MAX_NAME_LENGTH).assertEqual(MAX_PHONE_LENGTH);
      const nameOver = ContactValidation.validate(formWith(repeatedText(13, '名'), '1', 'a@b.cn', '京'));
      const phoneOver = ContactValidation.validate(formWith('甲', repeatedText(13, '6'), 'a@b.cn', '京'));
      expect(nameOver[0]).assertEqual('name-too-long');
      expect(phoneOver[0]).assertEqual('phone-too-long');
      expect(nameOver[0] === phoneOver[0]).assertFalse();
      expect(nameOver.length).assertEqual(phoneOver.length);
    });

    /**
     * @tc.name   everySeedRowSitsUnderAllFourLimits
     * @tc.desc   No seeded field approaches its cap, so the seed itself is a clean baseline.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('everySeedRowSitsUnderAllFourLimits', 0, () => {
      const rows = createSeedContacts();
      let checked = 0;
      for (let index = 0; index < rows.length; index++) {
        expect(rows[index].name.length < MAX_NAME_LENGTH).assertTrue();
        expect(rows[index].phone.length < MAX_PHONE_LENGTH).assertTrue();
        expect(rows[index].email.length < MAX_EMAIL_LENGTH).assertTrue();
        expect(rows[index].address.length < MAX_ADDRESS_LENGTH).assertTrue();
        checked = checked + 1;
      }
      expect(checked).assertEqual(15);
    });

    /**
     * @tc.name   shapedEmailAtTwentyFivePassesWhileUnshapedFails
     * @tc.desc   At the same legal length the shape rule still decides the verdict.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('shapedEmailAtTwentyFivePassesWhileUnshapedFails', 0, () => {
      const shaped = emailOfLength(25);
      const unshaped = repeatedText(25, 'a');
      expect(shaped.length).assertEqual(25);
      expect(unshaped.length).assertEqual(25);
      expect(ContactValidation.validate(formWith('甲', '1', shaped, '京')).length).assertEqual(0);
      const broken = ContactValidation.validate(formWith('甲', '1', unshaped, '京'));
      expect(broken.length).assertEqual(1);
      expect(broken[0]).assertEqual('email-malformed');
    });

    /**
     * @tc.name   twoFieldsAtLimitAndTwoOverLimitReportTwoCodes
     * @tc.desc   Name and phone at twelve stay clean while email and address report.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twoFieldsAtLimitAndTwoOverLimitReportTwoCodes', 0, () => {
      const form = formWith(repeatedText(12, '名'), repeatedText(12, '7'), emailOfLength(26),
        repeatedText(101, '址'));
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('email-too-long');
      expect(errors[1]).assertEqual('address-too-long');
      expect(countOf(errors, 'name-too-long')).assertEqual(0);
      expect(countOf(errors, 'phone-too-long')).assertEqual(0);
    });

    /**
     * @tc.name   overLongFieldDoesNotSuppressTheEmptyCodeOfAnother
     * @tc.desc   A blank name plus a long address reports the empty and the length code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('overLongFieldDoesNotSuppressTheEmptyCodeOfAnother', 0, () => {
      const form = formWith('', '1', 'a@b.cn', repeatedText(101, '址'));
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('name-empty');
      expect(errors[1]).assertEqual('address-too-long');
      expect(ContactValidation.canSubmit(form)).assertFalse();
      expect(countOf(errors, 'name-too-long')).assertEqual(0);
    });

    /**
     * @tc.name   limitConstantsAreStrictlyIncreasing
     * @tc.desc   Name and phone tie at twelve, then email at twenty five, then address at one hundred.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('limitConstantsAreStrictlyIncreasing', 0, () => {
      expect(MAX_NAME_LENGTH).assertEqual(MAX_PHONE_LENGTH);
      expect(MAX_EMAIL_LENGTH > MAX_PHONE_LENGTH).assertTrue();
      expect(MAX_ADDRESS_LENGTH > MAX_EMAIL_LENGTH).assertTrue();
      expect(MAX_EMAIL_LENGTH - MAX_NAME_LENGTH).assertEqual(13);
      expect(MAX_ADDRESS_LENGTH - MAX_EMAIL_LENGTH).assertEqual(75);
    });

    /**
     * @tc.name   twentyUnitTextIsTooLongForNameButLegalForEmail
     * @tc.desc   The same length is rejected by the twelve cap and accepted under the email cap.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('twentyUnitTextIsTooLongForNameButLegalForEmail', 0, () => {
      const text = repeatedText(20, 's');
      const asName = formWith(text, '1', 'a@b.cn', '京');
      const asEmail = formWith('甲', '1', emailOfLength(20), '京');
      expect(text.length).assertEqual(20);
      expect(asEmail.email.length).assertEqual(20);
      expect(ContactValidation.validate(asName).length).assertEqual(1);
      expect(ContactValidation.validate(asName)[0]).assertEqual('name-too-long');
      expect(ContactValidation.validate(asEmail).length).assertEqual(0);
      expect(ContactValidation.canSubmit(asEmail)).assertTrue();
    });

    /**
     * @tc.name   veryLongValuesInTwoFieldsReportTwoCodes
     * @tc.desc   A two hundred unit name and address breach both caps with two codes total.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('veryLongValuesInTwoFieldsReportTwoCodes', 0, () => {
      const form = formWith(repeatedText(200, '名'), '1', 'a@b.cn', repeatedText(200, '址'));
      const errors = ContactValidation.validate(form);
      expect(form.name.length).assertEqual(200);
      expect(form.address.length).assertEqual(200);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('name-too-long');
      expect(errors[1]).assertEqual('address-too-long');
      expect(ContactValidation.canSubmit(form)).assertFalse();
    });

    /**
     * @tc.name   atLimitFormWithAFreshNameIsStillSubmittableAgainstTheSeed
     * @tc.desc   The boundary form only fails on duplicates, so a fresh name clears every rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('atLimitFormWithAFreshNameIsStillSubmittableAgainstTheSeed', 0, () => {
      const existing = createSeedContacts();
      const form = formWith(repeatedText(12, '限'), repeatedText(12, '8'), emailOfLength(25),
        repeatedText(100, '址'));
      expect(ContactValidation.validate(form, existing).length).assertEqual(0);
      expect(ContactValidation.canSubmit(form, existing)).assertTrue();
      expect(existing.length).assertEqual(15);
    });

    /**
     * @tc.name   bothCapsSharedByOneRowProduceTwoDistinctCodes
     * @tc.desc   Exceeding the twelve cap in name and phone keeps the two codes distinct.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the ContactFieldLimits scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('bothCapsSharedByOneRowProduceTwoDistinctCodes', 0, () => {
      const form = formWith(repeatedText(13, '名'), repeatedText(13, '9'), 'a@b.cn', '京');
      const errors = ContactValidation.validate(form);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('name-too-long');
      expect(errors[1]).assertEqual('phone-too-long');
      expect(errors[0] === errors[1]).assertFalse();
      expect(MAX_NAME_LENGTH).assertEqual(MAX_PHONE_LENGTH);
      expect(MAX_NAME_LENGTH + 1).assertEqual(form.name.length);
      expect(MAX_PHONE_LENGTH + 1).assertEqual(form.phone.length);
      expect(ContactValidation.canSubmit(form)).assertFalse();
      expect(errors.length < 3).assertTrue();
    });
  });
}
