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
 * Email shape rule behind the email TextInput on AddressBookEdit.
 *
 * Anchors:
 *   AddressBookEdit.ets:223-244  email TextInput, maxLength 25, onChange copies
 *                                the raw text into data.email
 *   AddressBookEdit.ets:238      .maxLength(CommonConstants.MAX_LENGTH_LONG) = 25
 *   CommonConstant.ets:52        MAX_LENGTH_LONG = 25
 *   SharedDriver.ets:195-200     hasEmailShape: first at after index 0, last dot
 *                                after that at plus one, and not the final unit
 *   SharedDriver.ets:221-229     email-empty / email-too-long / email-malformed
 *
 * The shape test is deliberately small: it finds the first at sign and the last
 * dot and checks their relative positions. It performs no trimming, no domain
 * validation and no unicode folding, so several unusual strings pass. The cases
 * below pin both the accepted and the rejected side of that arithmetic.
 */

import { describe, it, expect, beforeAll, beforeEach, afterAll } from '@ohos/hypium';
import { logSuite, logStep } from '../Shared/Support';
import { Contact } from '../../../../main/ets/pages/model/Contact';
import {
  MAX_EMAIL_LENGTH,
  ContactValidation,
  contactOf,
  countOf,
  createSeedContacts,
  hasEmailShape,
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

/** A complete form whose email is the only field under observation. */
function formWithEmail(email: string): Contact {
  return contactOf('邮箱样本', '13800138000', email, '江苏省南京市玄武区');
}

/** Email codes only, in the order the validator emits them. */
function emailErrors(email: string): string[] {
  const errors = ContactValidation.validate(formWithEmail(email));
  const result: string[] = [];
  for (let index = 0; index < errors.length; index++) {
    if (errors[index].indexOf('email-') === 0) {
      result.push(errors[index]);
    }
  }
  return result;
}

/** Joins codes so a whole sequence can be pinned in one assertion. */
function errorTrace(errors: string[]): string {
  return joined(errors, '|');
}

export default function emailAddressValidationTest(): void {
  describe('EmailAddressValidation', () => {
    beforeAll(() => {
      logSuite('EmailAddressValidation', 'begin');
    });
    beforeEach(async () => {
      resetContactManager();
      await new Promise<void>((resolve) => { setTimeout(() => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      resetContactManager();
      logSuite('EmailAddressValidation', 'end');
    });

    /**
     * @tc.name   plainEmailHasAnAcceptedShape
     * @tc.desc   user@example.com has an at sign then a dot before the last unit.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('plainEmailHasAnAcceptedShape', 0, () => {
      logStep('EmailAddressValidation', 'plain shape');
      expect(hasEmailShape('user@example.com')).assertTrue();
      expect(emailErrors('user@example.com').length).assertEqual(0);
      expect(ContactValidation.canSubmit(formWithEmail('user@example.com'))).assertTrue();
      expect('user@example.com'.indexOf('@')).assertEqual(4);
    });

    /**
     * @tc.name   missingAtSignIsMalformed
     * @tc.desc   A dot but no at sign fails because the at position stays negative.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('missingAtSignIsMalformed', 0, () => {
      const value = 'user.example.com';
      expect(value.indexOf('@')).assertEqual(-1);
      expect(hasEmailShape(value)).assertFalse();
      const errors = emailErrors(value);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('email-malformed');
      expect(ContactValidation.canSubmit(formWithEmail(value))).assertFalse();
    });

    /**
     * @tc.name   missingDotIsMalformed
     * @tc.desc   An at sign without any dot fails because the last dot index is negative.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('missingDotIsMalformed', 0, () => {
      const value = 'user@localhost';
      expect(value.lastIndexOf('.')).assertEqual(-1);
      expect(hasEmailShape(value)).assertFalse();
      const errors = emailErrors(value);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('email-malformed');
      expect(errors.indexOf('email-too-long') < 0).assertTrue();
    });

    /**
     * @tc.name   dotBeforeTheAtSignOnlyIsMalformed
     * @tc.desc   A dot in the local part does not satisfy the rule when the domain has none.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('dotBeforeTheAtSignOnlyIsMalformed', 0, () => {
      const value = 'first.last@localhost';
      expect(value.indexOf('@')).assertEqual(10);
      expect(value.lastIndexOf('.')).assertEqual(5);
      expect(hasEmailShape(value)).assertFalse();
      expect(emailErrors(value)[0]).assertEqual('email-malformed');
      expect(ContactValidation.canSubmit(formWithEmail(value))).assertFalse();
    });

    /**
     * @tc.name   trailingDotIsMalformed
     * @tc.desc   A dot in the final position leaves no character after it, so the shape fails.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('trailingDotIsMalformed', 0, () => {
      const value = 'user@example.';
      expect(value.length).assertEqual(13);
      expect(value.lastIndexOf('.')).assertEqual(12);
      expect(value.lastIndexOf('.') < value.length - 1).assertFalse();
      expect(hasEmailShape(value)).assertFalse();
      expect(emailErrors(value)[0]).assertEqual('email-malformed');
    });

    /**
     * @tc.name   atSignAtPositionZeroIsMalformed
     * @tc.desc   The rule needs at > 0, so a leading at sign with a later dot is rejected.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('atSignAtPositionZeroIsMalformed', 0, () => {
      const value = '@example.com';
      expect(value.indexOf('@')).assertEqual(0);
      expect(value.lastIndexOf('.')).assertEqual(8);
      expect(hasEmailShape(value)).assertFalse();
      expect(emailErrors(value).length).assertEqual(1);
      expect(emailErrors(value)[0]).assertEqual('email-malformed');
    });

    /**
     * @tc.name   dotImmediatelyAfterTheAtSignIsMalformed
     * @tc.desc   The rule needs dot > at + 1, so a dot one position later is rejected.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('dotImmediatelyAfterTheAtSignIsMalformed', 0, () => {
      const value = 'user@.com';
      expect(value.indexOf('@')).assertEqual(4);
      expect(value.lastIndexOf('.')).assertEqual(5);
      expect(value.lastIndexOf('.') > value.indexOf('@') + 1).assertFalse();
      expect(hasEmailShape(value)).assertFalse();
      expect(emailErrors(value)[0]).assertEqual('email-malformed');
    });

    /**
     * @tc.name   emptyEmailReportsOnlyTheEmptyCode
     * @tc.desc   An empty email is caught by the empty rule before the shape rule runs.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('emptyEmailReportsOnlyTheEmptyCode', 0, () => {
      const errors = ContactValidation.validate(formWithEmail(''));
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('email-empty');
      expect(countOf(errors, 'email-malformed')).assertEqual(0);
      expect(hasEmailShape('')).assertFalse();
      expect(ContactValidation.canSubmit(formWithEmail(''))).assertFalse();
    });

    /**
     * @tc.name   malformedEmailAddsItsCodeAfterTheLengthCheck
     * @tc.desc   A short broken address yields exactly one malformed code and no length code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('malformedEmailAddsItsCodeAfterTheLengthCheck', 0, () => {
      const errors = emailErrors('broken');
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('email-malformed');
      expect(errorTrace(errors)).assertEqual('email-malformed');
      expect(countOf(errors, 'email-too-long')).assertEqual(0);
    });

    /**
     * @tc.name   longLocalPartUnderTheCapIsAccepted
     * @tc.desc   Nineteen local units plus a six unit domain reach twenty five and pass.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longLocalPartUnderTheCapIsAccepted', 0, () => {
      const value = repeatedText(19, 'a') + '@x.com';
      expect(value.length).assertEqual(25);
      expect(value.length).assertEqual(MAX_EMAIL_LENGTH);
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
      expect(ContactValidation.canSubmit(formWithEmail(value))).assertTrue();
    });

    /**
     * @tc.name   longLocalPartOverTheCapIsTooLongButStillShaped
     * @tc.desc   Twenty local units make twenty six total, so only the length code appears.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('longLocalPartOverTheCapIsTooLongButStillShaped', 0, () => {
      const value = repeatedText(20, 'a') + '@x.com';
      expect(value.length).assertEqual(26);
      expect(hasEmailShape(value)).assertTrue();
      const errors = emailErrors(value);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('email-too-long');
      expect(countOf(errors, 'email-malformed')).assertEqual(0);
    });

    /**
     * @tc.name   uppercaseLocalPartIsAccepted
     * @tc.desc   The shape rule does not fold case, so an uppercase local part simply passes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('uppercaseLocalPartIsAccepted', 0, () => {
      const value = 'USER@example.com';
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
      expect(value.indexOf('@')).assertEqual(4);
      expect(ContactValidation.canSubmit(formWithEmail(value))).assertTrue();
    });

    /**
     * @tc.name   uppercaseDomainIsAccepted
     * @tc.desc   An uppercase domain keeps the dot position valid and passes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('uppercaseDomainIsAccepted', 0, () => {
      const value = 'user@EXAMPLE.COM';
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
      expect(value.lastIndexOf('.')).assertEqual(12);
      expect(ContactValidation.canSubmit(formWithEmail(value))).assertTrue();
    });

    /**
     * @tc.name   unicodeLocalPartIsAccepted
     * @tc.desc   Chinese characters before the at sign do not affect the position arithmetic.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unicodeLocalPartIsAccepted', 0, () => {
      const value = '林间@example.com';
      expect(value.indexOf('@')).assertEqual(2);
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
      expect(ContactValidation.canSubmit(formWithEmail(value))).assertTrue();
    });

    /**
     * @tc.name   unicodeDomainIsAccepted
     * @tc.desc   A CJK domain still has a dot after the at sign and passes the shape test.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('unicodeDomainIsAccepted', 0, () => {
      const value = 'user@例子.公司';
      expect(value.indexOf('@')).assertEqual(4);
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
      expect(value.lastIndexOf('.')).assertEqual(7);
    });

    /**
     * @tc.name   subdomainIsAccepted
     * @tc.desc   Two dots after the at sign keep the last dot in a valid position.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('subdomainIsAccepted', 0, () => {
      const value = 'user@mail.example.com';
      expect(value.lastIndexOf('.')).assertEqual(17);
      expect(value.indexOf('@')).assertEqual(4);
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
      expect(ContactValidation.canSubmit(formWithEmail(value))).assertTrue();
    });

    /**
     * @tc.name   severalDotsAfterTheAtSignAreAccepted
     * @tc.desc   The rule only inspects the final dot, so a deep domain still passes.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('severalDotsAfterTheAtSignAreAccepted', 0, () => {
      const value = 'user@a.b.c.d.cn';
      expect(value.indexOf('@')).assertEqual(4);
      expect(value.lastIndexOf('.')).assertEqual(12);
      expect(value.lastIndexOf('.') > value.indexOf('@') + 1).assertTrue();
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
    });

    /**
     * @tc.name   spaceInsideTheLocalPartStillPassesTheShape
     * @tc.desc   The shape test never looks for spaces, so an embedded space is tolerated.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('spaceInsideTheLocalPartStillPassesTheShape', 0, () => {
      const value = 'a b@example.com';
      expect(value.indexOf('@')).assertEqual(3);
      expect(value.indexOf(' ')).assertEqual(1);
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
      expect(ContactValidation.canSubmit(formWithEmail(value))).assertTrue();
    });

    /**
     * @tc.name   spaceInsideTheDomainStillPassesTheShape
     * @tc.desc   A space after the at sign and before the dot is not rejected either.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('spaceInsideTheDomainStillPassesTheShape', 0, () => {
      const value = 'a@exa mple.com';
      expect(value.indexOf('@')).assertEqual(1);
      expect(value.lastIndexOf('.')).assertEqual(10);
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
      expect(value.indexOf(' ') > value.indexOf('@')).assertTrue();
    });

    /**
     * @tc.name   doubleAtSignWithALaterDotPasses
     * @tc.desc   The first at sign is at index one and the dot is later, so the shape holds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('doubleAtSignWithALaterDotPasses', 0, () => {
      const value = 'a@@b.com';
      expect(value.indexOf('@')).assertEqual(1);
      expect(value.lastIndexOf('.')).assertEqual(4);
      expect(value.indexOf('@') === value.lastIndexOf('@')).assertFalse();
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
    });

    /**
     * @tc.name   leadingDoubleAtSignIsRejected
     * @tc.desc   Two at signs at the start still fail because the first at is index zero.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('leadingDoubleAtSignIsRejected', 0, () => {
      const value = '@@example.com';
      expect(value.indexOf('@')).assertEqual(0);
      expect(hasEmailShape(value)).assertFalse();
      expect(emailErrors(value)[0]).assertEqual('email-malformed');
      expect(ContactValidation.canSubmit(formWithEmail(value))).assertFalse();
    });

    /**
     * @tc.name   singleUnitDomainBeforeTheDotPasses
     * @tc.desc   a@b.c satisfies every position requirement of the shape test.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('singleUnitDomainBeforeTheDotPasses', 0, () => {
      const value = 'a@b.c';
      expect(value.length).assertEqual(5);
      expect(value.indexOf('@')).assertEqual(1);
      expect(value.lastIndexOf('.')).assertEqual(3);
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
    });

    /**
     * @tc.name   numericDomainPassesTheShape
     * @tc.desc   Digits after the at sign are ordinary units for the position arithmetic.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('numericDomainPassesTheShape', 0, () => {
      const value = 'user@123.456';
      expect(value.indexOf('@')).assertEqual(4);
      expect(value.lastIndexOf('.')).assertEqual(8);
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
      expect(ContactValidation.canSubmit(formWithEmail(value))).assertTrue();
    });

    /**
     * @tc.name   dottedLocalPartBeforeTheAtPasses
     * @tc.desc   A leading dot in the local part is ignored because only the last dot counts.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('dottedLocalPartBeforeTheAtPasses', 0, () => {
      const value = '.a@b.com';
      expect(value.indexOf('@')).assertEqual(2);
      expect(value.lastIndexOf('.')).assertEqual(4);
      expect(value.indexOf('.')).assertEqual(0);
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
    });

    /**
     * @tc.name   trailingTabAfterTheShapeIsTolerated
     * @tc.desc   A tab after a valid address is not the final dot, so the shape still holds.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('trailingTabAfterTheShapeIsTolerated', 0, () => {
      const value = 'a@b.com\t';
      expect(value.length).assertEqual(8);
      expect(value.lastIndexOf('.')).assertEqual(3);
      expect(value.lastIndexOf('.') < value.length - 1).assertTrue();
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
    });

    /**
     * @tc.name   newlineInsideTheLocalPartIsTolerated
     * @tc.desc   A newline before the at sign shifts the positions but keeps the shape valid.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('newlineInsideTheLocalPartIsTolerated', 0, () => {
      const value = 'a\nb@c.com';
      expect(value.indexOf('@')).assertEqual(3);
      expect(value.lastIndexOf('.')).assertEqual(5);
      expect(value.indexOf('\n')).assertEqual(1);
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
    });

    /**
     * @tc.name   shapeFunctionIsPureAcrossRepeatedCalls
     * @tc.desc   Five calls on the same string return the same verdict with no state carried.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('shapeFunctionIsPureAcrossRepeatedCalls', 0, () => {
      const good = 'pure@example.com';
      const bad = 'pure.example.com';
      let goodTrue = 0;
      let badFalse = 0;
      for (let index = 0; index < 5; index++) {
        if (hasEmailShape(good)) {
          goodTrue = goodTrue + 1;
        }
        if (!hasEmailShape(bad)) {
          badFalse = badFalse + 1;
        }
      }
      expect(goodTrue).assertEqual(5);
      expect(badFalse).assertEqual(5);
      expect(goodTrue + badFalse).assertEqual(10);
    });

    /**
     * @tc.name   shapeIgnoresTheLengthCap
     * @tc.desc   A long shaped address passes the shape but fails the length rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('shapeIgnoresTheLengthCap', 0, () => {
      const value = repeatedText(193, 'a') + '@x.com';
      expect(value.length).assertEqual(199);
      expect(hasEmailShape(value)).assertTrue();
      const errors = emailErrors(value);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('email-too-long');
      expect(countOf(errors, 'email-malformed')).assertEqual(0);
    });

    /**
     * @tc.name   everySeedEmailPassesTheShape
     * @tc.desc   All fifteen seeded addresses satisfy the at sign and dot positions.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('everySeedEmailPassesTheShape', 0, () => {
      const rows = createSeedContacts();
      let shaped = 0;
      for (let index = 0; index < rows.length; index++) {
        if (hasEmailShape(rows[index].email)) {
          shaped = shaped + 1;
        }
        expect(rows[index].email.indexOf('@') > 0).assertTrue();
      }
      expect(shaped).assertEqual(15);
      expect(rows.length).assertEqual(15);
    });

    /**
     * @tc.name   everySeedRowReportsNoEmailCode
     * @tc.desc   Validating each seed row alone emits no email-empty or email-malformed code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('everySeedRowReportsNoEmailCode', 0, () => {
      const rows = createSeedContacts();
      let inspected = 0;
      for (let index = 0; index < rows.length; index++) {
        const errors = emailErrors(rows[index].email);
        expect(errors.length).assertEqual(0);
        inspected = inspected + 1;
      }
      expect(inspected).assertEqual(15);
      expect(emailErrors(rows[3].email).length).assertEqual(0);
    });

    /**
     * @tc.name   malformedAndTooLongAreReportedTogether
     * @tc.desc   A thirty unit string with no at sign trips both email rules in order.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('malformedAndTooLongAreReportedTogether', 0, () => {
      const value = repeatedText(30, 'a');
      const errors = emailErrors(value);
      expect(value.length).assertEqual(30);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('email-too-long');
      expect(errors[1]).assertEqual('email-malformed');
      expect(errorTrace(errors)).assertEqual('email-too-long|email-malformed');
    });

    /**
     * @tc.name   onlyTheAtSignHasNoShape
     * @tc.desc   A single at sign has no dot, so the shape test rejects it.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('onlyTheAtSignHasNoShape', 0, () => {
      expect('@'.length).assertEqual(1);
      expect(hasEmailShape('@')).assertFalse();
      expect(emailErrors('@')[0]).assertEqual('email-malformed');
      expect(ContactValidation.canSubmit(formWithEmail('@'))).assertFalse();
    });

    /**
     * @tc.name   onlyADotHasNoShape
     * @tc.desc   A single dot has no at sign, so the shape test rejects it as well.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('onlyADotHasNoShape', 0, () => {
      expect('.'.indexOf('@')).assertEqual(-1);
      expect(hasEmailShape('.')).assertFalse();
      expect(emailErrors('.')[0]).assertEqual('email-malformed');
      expect(emailErrors('.').length).assertEqual(1);
    });

    /**
     * @tc.name   trailingDotWithALongLocalPartIsStillMalformed
     * @tc.desc   The final dot rule applies no matter how long the local part is.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('trailingDotWithALongLocalPartIsStillMalformed', 0, () => {
      const value = repeatedText(10, 'a') + '@example.';
      expect(value.lastIndexOf('.')).assertEqual(value.length - 1);
      expect(hasEmailShape(value)).assertFalse();
      const errors = emailErrors(value);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('email-malformed');
    });

    /**
     * @tc.name   mixedCaseEmailPassesTheShape
     * @tc.desc   Alternating case in local part and domain does not change the verdict.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('mixedCaseEmailPassesTheShape', 0, () => {
      const value = 'UsEr@ExAmPlE.CoM';
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
      expect(value.indexOf('@')).assertEqual(4);
      expect(ContactValidation.canSubmit(formWithEmail(value))).assertTrue();
    });

    /**
     * @tc.name   dotAtSecondToLastUnitStillPasses
     * @tc.desc   a@b.cd has one unit after the dot and satisfies the final position rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('dotAtSecondToLastUnitStillPasses', 0, () => {
      const value = 'a@b.cd';
      expect(value.length).assertEqual(6);
      expect(value.lastIndexOf('.')).assertEqual(3);
      expect(value.lastIndexOf('.')).assertEqual(value.length - 3);
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
    });

    /**
     * @tc.name   dashedDomainPassesTheShape
     * @tc.desc   A hyphen in the domain is not a dot, so the shape arithmetic is unchanged.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('dashedDomainPassesTheShape', 0, () => {
      const value = 'user@my-host.com';
      expect(value.indexOf('-')).assertEqual(7);
      expect(value.lastIndexOf('.')).assertEqual(12);
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
      expect(ContactValidation.canSubmit(formWithEmail(value))).assertTrue();
    });

    /**
     * @tc.name   dottedNumericDomainPasses
     * @tc.desc   An address shaped like four numeric groups passes the last dot rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('dottedNumericDomainPasses', 0, () => {
      const value = 'user@192.168.1.1';
      expect(value.indexOf('@')).assertEqual(4);
      expect(value.lastIndexOf('.')).assertEqual(14);
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
      expect(value.length).assertEqual(16);
    });

    /**
     * @tc.name   exactlyTwentyFiveUnitsWithALongDomainPasses
     * @tc.desc   A three character local part and a long domain reach the cap and stay valid.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('exactlyTwentyFiveUnitsWithALongDomainPasses', 0, () => {
      const value = 'a@' + repeatedText(19, 'b') + '.com';
      expect(value.length).assertEqual(25);
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
      expect(ContactValidation.canSubmit(formWithEmail(value))).assertTrue();
    });

    /**
     * @tc.name   twentySixUnitsWithALongDomainIsTooLong
     * @tc.desc   One more domain unit keeps the shape and adds the length code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('twentySixUnitsWithALongDomainIsTooLong', 0, () => {
      const value = 'a@' + repeatedText(20, 'b') + '.com';
      expect(value.length).assertEqual(26);
      expect(hasEmailShape(value)).assertTrue();
      const errors = emailErrors(value);
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('email-too-long');
      expect(ContactValidation.canSubmit(formWithEmail(value))).assertFalse();
    });

    /**
     * @tc.name   emptyEmailCodePrecedesTheDuplicateNameCode
     * @tc.desc   With a seeded name and a blank email the email code comes first.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyEmailCodePrecedesTheDuplicateNameCode', 0, () => {
      const rows = createSeedContacts();
      const form = contactOf('贝拉', '13800138000', '', '地址');
      const errors = ContactValidation.validate(form, rows);
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual('email-empty');
      expect(errors[1]).assertEqual('name-duplicate');
      expect(ContactValidation.canSubmit(form, rows)).assertFalse();
    });

    /**
     * @tc.name   singleUnitEmailHasNoShape
     * @tc.desc   A one character email is non-empty, short and still malformed.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('singleUnitEmailHasNoShape', 0, () => {
      expect(hasEmailShape('a')).assertFalse();
      const errors = emailErrors('a');
      expect(errors.length).assertEqual(1);
      expect(errors[0]).assertEqual('email-malformed');
      expect(countOf(errors, 'email-empty')).assertEqual(0);
    });

    /**
     * @tc.name   validatingTheSameBrokenEmailTwiceIsStable
     * @tc.desc   Two runs over the same malformed address report the identical code list.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('validatingTheSameBrokenEmailTwiceIsStable', 0, () => {
      const value = 'not-an-address@';
      const first = errorTrace(emailErrors(value));
      const second = errorTrace(emailErrors(value));
      expect(first).assertEqual(second);
      expect(first).assertEqual('email-malformed');
      expect(hasEmailShape(value)).assertFalse();
      expect(emailErrors(value).length).assertEqual(1);
    });

    /**
     * @tc.name   domainWithOnlyTheAtAndDotFails
     * @tc.desc   a@. fails both the dot position and the final unit rule.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('domainWithOnlyTheAtAndDotFails', 0, () => {
      const value = 'a@.';
      expect(value.indexOf('@')).assertEqual(1);
      expect(value.lastIndexOf('.')).assertEqual(2);
      expect(value.lastIndexOf('.')).assertEqual(value.length - 1);
      expect(hasEmailShape(value)).assertFalse();
      expect(emailErrors(value)[0]).assertEqual('email-malformed');
    });

    /**
     * @tc.name   quotedLocalPartUsesTheFirstAtSign
     * @tc.desc   A quote before the at sign changes nothing because only the at index matters.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('quotedLocalPartUsesTheFirstAtSign', 0, () => {
      const value = '"a"@b.com';
      expect(value.indexOf('@')).assertEqual(3);
      expect(value.indexOf('"')).assertEqual(0);
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
      expect(ContactValidation.canSubmit(formWithEmail(value))).assertTrue();
    });

    /**
     * @tc.name   emailOfTwoUnitsIsMalformed
     * @tc.desc   a@ has an at sign after index zero but no dot, so the shape fails.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emailOfTwoUnitsIsMalformed', 0, () => {
      const value = 'a@';
      expect(value.length).assertEqual(2);
      expect(value.indexOf('@')).assertEqual(1);
      expect(value.lastIndexOf('.')).assertEqual(-1);
      expect(hasEmailShape(value)).assertFalse();
      expect(emailErrors(value).length).assertEqual(1);
    });

    /**
     * @tc.name   validEmailKeepsTheFormSubmittableWithSeedRows
     * @tc.desc   A shaped email plus a fresh name clears the validator against all fifteen rows.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('validEmailKeepsTheFormSubmittableWithSeedRows', 0, () => {
      const rows = createSeedContacts();
      const form = formWithEmail('fresh.person@example.com');
      form.name = '邮箱新联系人';
      expect(hasEmailShape(form.email)).assertTrue();
      expect(ContactValidation.validate(form, rows).length).assertEqual(0);
      expect(ContactValidation.canSubmit(form, rows)).assertTrue();
      expect(uniqueStrings(emailErrors(form.email)).length).assertEqual(0);
    });

    /**
     * @tc.name   emptyDomainAfterTheAtIsMalformed
     * @tc.desc   user@.com has a dot too close to the at sign and must be rejected.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('emptyDomainAfterTheAtIsMalformed', 0, () => {
      const value = 'user@.com';
      expect(value.substring(value.indexOf('@') + 1, value.lastIndexOf('.'))).assertEqual('');
      expect(hasEmailShape(value)).assertFalse();
      expect(emailErrors(value).length).assertEqual(1);
      expect(ContactValidation.canSubmit(formWithEmail(value))).assertFalse();
    });

    /**
     * @tc.name   schemePrefixPushesTheEmailOverTheLengthCap
     * @tc.desc   A mailto style prefix keeps a valid shape but grows the value past twenty five units.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL3
     */
    it('schemePrefixPushesTheEmailOverTheLengthCap', 0, () => {
      const value = 'mailto:user@example.com';
      const longer = 'mailto:user@example.com.cn';
      expect(value.length).assertEqual(23);
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
      expect(longer.length).assertEqual(26);
      expect(hasEmailShape(longer)).assertTrue();
      expect(emailErrors(longer)[0]).assertEqual('email-too-long');
    });

    /**
     * @tc.name   shortEmailWithAllThreeSignsPasses
     * @tc.desc   a@b.co is six units, shaped, and free of every email code.
 * @tc.precondition  The shared driver is loaded and beforeEach resets suite state before yielding once.
 * @tc.steps         1. Build the EmailAddressValidation scenario from suite constants and factory helpers.
 *                   2. Invoke the operation under test and capture the observable result.
 *                   3. Compare every captured value with the independent oracle.
 * @tc.expected      All assertions in the case body hold and no residual state leaks into the next case.
 * @tc.remark        Pure logic case; no device, network stack or UI dependency.
     * @tc.type   FUNCTION
     * @tc.level  LEVEL2
     */
    it('shortEmailWithAllThreeSignsPasses', 0, () => {
      const value = 'a@b.co';
      expect(value.length).assertEqual(6);
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
      expect(ContactValidation.canSubmit(formWithEmail(value))).assertTrue();
      expect(value.indexOf('.') > value.indexOf('@')).assertTrue();
      expect(hasEmailShape(value)).assertTrue();
      expect(emailErrors(value).length).assertEqual(0);
      expect(value.indexOf('@') > 0).assertTrue();
    });
  });
}
