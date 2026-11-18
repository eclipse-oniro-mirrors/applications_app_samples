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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { LuhnUtils } from '../testutils/LuhnUtils';

const DOMAIN: number = 0xF811;

export default function luhnLogicTest() {
  describe('LuhnLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_0100
     * @tc.name      testLuhnCheck0001
     * @tc.desc      Verify luhnCheckDigit() returns the exact check digit
     *               for six well known fifteen and ten digit payloads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnCheck0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnCheck0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Visa test payload without its final check digit.
      expect(LuhnUtils.luhnCheckDigit('411111111111111')).assertEqual('1');
      // Mastercard style payload with weighted sum forty four.
      expect(LuhnUtils.luhnCheckDigit('453201511283036')).assertEqual('6');
      // Mastercard payload whose weighted sum is thirty one.
      expect(LuhnUtils.luhnCheckDigit('550000555555555')).assertEqual('9');
      // Stripe style alternating payload.
      expect(LuhnUtils.luhnCheckDigit('424242424242424')).assertEqual('2');
      // Discover style payload with weighted sum twenty three.
      expect(LuhnUtils.luhnCheckDigit('601111111111111')).assertEqual('7');
      // Classic Wikipedia example payload.
      expect(LuhnUtils.luhnCheckDigit('7992739871')).assertEqual('3');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_0200
     * @tc.name      testLuhnCheck0002
     * @tc.desc      Verify luhnCheckDigit() for single digit payloads where
     *               the doubling step is directly observable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnCheck0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnCheck0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Four doubled is eight and the check digit is two.
      expect(LuhnUtils.luhnCheckDigit('4')).assertEqual('2');
      // Seven doubles to fourteen, reduces to five, check digit five.
      expect(LuhnUtils.luhnCheckDigit('7')).assertEqual('5');
      // Zero stays zero through every step.
      expect(LuhnUtils.luhnCheckDigit('0')).assertEqual('0');
      // Nine doubles to eighteen, reduces to nine, check digit one.
      expect(LuhnUtils.luhnCheckDigit('9')).assertEqual('1');
      // Five doubles to ten, reduces to one, check digit nine.
      expect(LuhnUtils.luhnCheckDigit('5')).assertEqual('9');
      // Eight doubles to sixteen, reduces to seven, check digit three.
      expect(LuhnUtils.luhnCheckDigit('8')).assertEqual('3');
      // One doubles to two, check digit eight.
      expect(LuhnUtils.luhnCheckDigit('1')).assertEqual('8');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_0300
     * @tc.name      testLuhnCheck0003
     * @tc.desc      Verify luhnCheckDigit() returns the empty string for
     *               payloads containing spaces, dashes, letters or dots.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnCheck0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnCheck0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty payload has no digits to weight.
      expect(LuhnUtils.luhnCheckDigit('')).assertEqual('');
      // An embedded space is not an ASCII digit.
      expect(LuhnUtils.luhnCheckDigit('4111 1111')).assertEqual('');
      // An embedded dash is not an ASCII digit either.
      expect(LuhnUtils.luhnCheckDigit('4111-1111')).assertEqual('');
      // A letter inside the payload fails.
      expect(LuhnUtils.luhnCheckDigit('411a111')).assertEqual('');
      // A dot inside the payload fails.
      expect(LuhnUtils.luhnCheckDigit('4.111')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_0400
     * @tc.name      testLuhnCheck0004
     * @tc.desc      Verify luhnCheckDigit() on short even length payloads
     *               and on a sixteen digit string treated as payload.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnCheck0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnCheck0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two digit payload with sum eight.
      expect(LuhnUtils.luhnCheckDigit('42')).assertEqual('2');
      // Four digit payload with sum sixteen.
      expect(LuhnUtils.luhnCheckDigit('4242')).assertEqual('4');
      // Nine digit payload with weighted sum forty three.
      expect(LuhnUtils.luhnCheckDigit('123456789')).assertEqual('7');
      // Sixteen digit string still computes a fresh check digit.
      expect(LuhnUtils.luhnCheckDigit('4111111111111111')).assertEqual('3');
      // All zero payload keeps the zero check digit.
      expect(LuhnUtils.luhnCheckDigit('00')).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_0500
     * @tc.name      testLuhnCheck0005
     * @tc.desc      Verify luhnCheckDigit() for Mastercard, Discover and
     *               Amex payloads drawn from published test numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnCheck0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnCheck0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Mastercard payload with weighted sum twenty.
      expect(LuhnUtils.luhnCheckDigit('510510510510510')).assertEqual('0');
      // Discover payload with weighted sum forty six.
      expect(LuhnUtils.luhnCheckDigit('601100099013942')).assertEqual('4');
      // Amex payload with weighted sum eleven.
      expect(LuhnUtils.luhnCheckDigit('34000000000000')).assertEqual('9');
      // Visa thirteen digit payload with weighted sum thirty eight.
      expect(LuhnUtils.luhnCheckDigit('422222222222')).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_0600
     * @tc.name      testLuhnCheck0006
     * @tc.desc      Verify luhnCheckDigit() on a seventeen digit payload and
     *               confirm high digit reductions stay in the digit range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnCheck0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnCheck0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Seventeen digit payload with weighted sum sixty nine.
      expect(LuhnUtils.luhnCheckDigit('12345678901234567')).assertEqual('1');
      // Digit five reduces to one after doubling.
      expect(LuhnUtils.luhnCheckDigit('5')).assertEqual('9');
      // Digit eight reduces to seven after doubling.
      expect(LuhnUtils.luhnCheckDigit('8')).assertEqual('3');
      // The result is always a single character.
      expect(LuhnUtils.luhnCheckDigit('12345678901234567').length).assertEqual(1);
      // The result is never the empty string for digits.
      expect(LuhnUtils.luhnCheckDigit('12345678901234567') !== '').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_0700
     * @tc.name      testLuhnCheck0007
     * @tc.desc      Verify luhnCheckDigit() rejects payloads with separators
     *               or whitespace at either end instead of stripping them.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnCheck0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnCheck0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A leading space fails.
      expect(LuhnUtils.luhnCheckDigit(' 4111')).assertEqual('');
      // A trailing space fails.
      expect(LuhnUtils.luhnCheckDigit('4111 ')).assertEqual('');
      // An embedded dash fails.
      expect(LuhnUtils.luhnCheckDigit('4-111')).assertEqual('');
      // A trailing dash fails.
      expect(LuhnUtils.luhnCheckDigit('4111-')).assertEqual('');
      // A leading tab fails.
      expect(LuhnUtils.luhnCheckDigit('\t4111')).assertEqual('');
      // A trailing newline fails.
      expect(LuhnUtils.luhnCheckDigit('4111\n')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_0800
     * @tc.name      testLuhnValid0001
     * @tc.desc      Verify isValidCardNumber() accepts seven published test
     *               card numbers spanning four card schemes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnValid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnValid0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Visa sixteen digit test number.
      expect(LuhnUtils.isValidCardNumber('4111111111111111')).assertTrue();
      // Visa sixteen digit variant.
      expect(LuhnUtils.isValidCardNumber('4532015112830366')).assertTrue();
      // Mastercard sixteen digit test number.
      expect(LuhnUtils.isValidCardNumber('5500005555555559')).assertTrue();
      // Stripe alternating test number.
      expect(LuhnUtils.isValidCardNumber('4242424242424242')).assertTrue();
      // Discover sixteen digit test number.
      expect(LuhnUtils.isValidCardNumber('6011111111111117')).assertTrue();
      // Mastercard alternating test number.
      expect(LuhnUtils.isValidCardNumber('5105105105105100')).assertTrue();
      // Discover fifteen digit variant.
      expect(LuhnUtils.isValidCardNumber('6011000990139424')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_0900
     * @tc.name      testLuhnValid0002
     * @tc.desc      Verify isValidCardNumber() rejects known numbers whose
     *               final digit has been shifted by one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnValid0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnValid0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Correct final digit is one, not two.
      expect(LuhnUtils.isValidCardNumber('4111111111111112')).assertFalse();
      // Correct final digit is six, not seven.
      expect(LuhnUtils.isValidCardNumber('4532015112830367')).assertFalse();
      // Correct final digit is nine, not eight.
      expect(LuhnUtils.isValidCardNumber('5500005555555558')).assertFalse();
      // Correct final digit is two, not three.
      expect(LuhnUtils.isValidCardNumber('4242424242424243')).assertFalse();
      // Correct final digit is seven, not eight.
      expect(LuhnUtils.isValidCardNumber('6011111111111118')).assertFalse();
      // Correct final digit is seven, not six.
      expect(LuhnUtils.isValidCardNumber('6011111111111116')).assertFalse();
      // Correct final digit is zero, not one.
      expect(LuhnUtils.isValidCardNumber('5105105105105101')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_1000
     * @tc.name      testLuhnValid0003
     * @tc.desc      Verify isValidCardNumber() rejects empty, one character
     *               and non-digit strings while all-zero numbers pass.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnValid0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnValid0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty string fails the minimum length.
      expect(LuhnUtils.isValidCardNumber('')).assertFalse();
      // One digit has no room for a check digit.
      expect(LuhnUtils.isValidCardNumber('4')).assertFalse();
      // A letter breaks the digit rule.
      expect(LuhnUtils.isValidCardNumber('4a')).assertFalse();
      // A leading letter breaks the digit rule too.
      expect(LuhnUtils.isValidCardNumber('a4')).assertFalse();
      // A spaced number fails before any stripping.
      expect(LuhnUtils.isValidCardNumber('4111 1111 1111 1111')).assertFalse();
      // A dashed number fails before any stripping.
      expect(LuhnUtils.isValidCardNumber('4532-0151-1283-0366')).assertFalse();
      // Two zeros validate because zero is a fixed point.
      expect(LuhnUtils.isValidCardNumber('00')).assertTrue();
      // Sixteen zeros validate for the same reason.
      expect(LuhnUtils.isValidCardNumber('0000000000000000')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_1100
     * @tc.name      testLuhnValid0004
     * @tc.desc      Verify isValidCardNumber() on two to five digit numbers
     *               covering both valid and off-by-one candidates.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnValid0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnValid0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The shortest valid number is forty two.
      expect(LuhnUtils.isValidCardNumber('42')).assertTrue();
      // Digit three is not the check digit of four.
      expect(LuhnUtils.isValidCardNumber('43')).assertFalse();
      // Ninety one validates with check digit one.
      expect(LuhnUtils.isValidCardNumber('91')).assertTrue();
      // Ninety nine fails because the check digit is one.
      expect(LuhnUtils.isValidCardNumber('99')).assertFalse();
      // Three zeros validate.
      expect(LuhnUtils.isValidCardNumber('000')).assertTrue();
      // Five digit alternating number validates.
      expect(LuhnUtils.isValidCardNumber('42424')).assertTrue();
      // Four digit payload four hundred needs check digit two.
      expect(LuhnUtils.isValidCardNumber('4002')).assertTrue();
      // Digit three is wrong for payload four hundred.
      expect(LuhnUtils.isValidCardNumber('4003')).assertFalse();
      // Payload four twenty two needs check digit six.
      expect(LuhnUtils.isValidCardNumber('4226')).assertTrue();
      // Digit two is wrong for payload four twenty two.
      expect(LuhnUtils.isValidCardNumber('4222')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_1200
     * @tc.name      testLuhnValid0005
     * @tc.desc      Verify isValidCardNumber() on thirteen, fifteen and
     *               eleven digit scheme lengths including Amex samples.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnValid0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnValid0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Visa thirteen digit test number.
      expect(LuhnUtils.isValidCardNumber('4222222222222')).assertTrue();
      // One shifted final digit breaks it.
      expect(LuhnUtils.isValidCardNumber('4222222222223')).assertFalse();
      // Amex fifteen digit test number.
      expect(LuhnUtils.isValidCardNumber('340000000000009')).assertTrue();
      // One shifted final digit breaks it.
      expect(LuhnUtils.isValidCardNumber('340000000000008')).assertFalse();
      // Amex fifteen digit sample from Stripe.
      expect(LuhnUtils.isValidCardNumber('378282246310005')).assertTrue();
      // One shifted final digit breaks it.
      expect(LuhnUtils.isValidCardNumber('378282246310004')).assertFalse();
      // Wikipedia eleven digit example validates.
      expect(LuhnUtils.isValidCardNumber('79927398713')).assertTrue();
      // One shifted final digit breaks it.
      expect(LuhnUtils.isValidCardNumber('79927398712')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_1300
     * @tc.name      testLuhnValid0006
     * @tc.desc      Verify isValidCardNumber() on nineteen and twenty digit
     *               numbers beyond the usual scheme lengths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnValid0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnValid0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Nineteen digit number ending in the correct zero.
      expect(LuhnUtils.isValidCardNumber('4111111111111111110')).assertTrue();
      // Nineteen digit number ending in one is wrong.
      expect(LuhnUtils.isValidCardNumber('4111111111111111111')).assertFalse();
      // Twenty digit number ending in the correct five.
      expect(LuhnUtils.isValidCardNumber('41111111111111111115')).assertTrue();
      // Twenty digit number ending in zero is wrong.
      expect(LuhnUtils.isValidCardNumber('41111111111111111110')).assertFalse();
      // Length guards are symmetric at the long end.
      expect(LuhnUtils.isValidCardNumber('41111111111111111115')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_1400
     * @tc.name      testLuhnValid0007
     * @tc.desc      Verify isValidCardNumber() treats all-zero numbers as
     *               valid and all-nine numbers by their checksum digit five.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnValid0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnValid0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Ten zeros validate.
      expect(LuhnUtils.isValidCardNumber('0000000000')).assertTrue();
      // Sixteen zeros validate.
      expect(LuhnUtils.isValidCardNumber('0000000000000000')).assertTrue();
      // Fifteen nines plus check digit five validate.
      expect(LuhnUtils.isValidCardNumber('9999999999999995')).assertTrue();
      // Sixteen nines fail because the check digit is five.
      expect(LuhnUtils.isValidCardNumber('9999999999999999')).assertFalse();
      // The valid all-nine number has sixteen characters.
      expect('9999999999999995'.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_1500
     * @tc.name      testLuhnValid0008
     * @tc.desc      Verify isValidCardNumber() rejects letters, punctuation
     *               and full width digits without stripping them.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnValid0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnValid0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Upper case letter in the last position fails.
      expect(LuhnUtils.isValidCardNumber('411111111111111A')).assertFalse();
      // Lower case letter in the last position fails.
      expect(LuhnUtils.isValidCardNumber('411111111111111a')).assertFalse();
      // Full width digit in the first position fails.
      expect(LuhnUtils.isValidCardNumber('\uFF341111111111111')).assertFalse();
      // A comma in the body fails.
      expect(LuhnUtils.isValidCardNumber('4111,111111111111')).assertFalse();
      // A dot in the body fails.
      expect(LuhnUtils.isValidCardNumber('4111.111111111111')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_1600
     * @tc.name      testLuhnValid0009
     * @tc.desc      Verify isValidCardNumber() on Discover and alternating
     *               Mastercard samples plus their shifted neighbours.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnValid0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnValid0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Alternating Mastercard test number validates.
      expect(LuhnUtils.isValidCardNumber('5105105105105100')).assertTrue();
      // Discover test number validates.
      expect(LuhnUtils.isValidCardNumber('6011000990139424')).assertTrue();
      // Its final digit shifted to one fails.
      expect(LuhnUtils.isValidCardNumber('5105105105105101')).assertFalse();
      // Discover short sample validates.
      expect(LuhnUtils.isValidCardNumber('6011111111111117')).assertTrue();
      // Neighbours below and above the correct digit fail.
      expect(LuhnUtils.isValidCardNumber('6011111111111116')).assertFalse();
      expect(LuhnUtils.isValidCardNumber('6011111111111118')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_1700
     * @tc.name      testLuhnStrip0001
     * @tc.desc      Verify stripSeparators() removes spaces and dashes in
     *               the four-by-four display grouping of card numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnStrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnStrip0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Spaces collapse to the bare number.
      expect(LuhnUtils.stripSeparators('4111 1111 1111 1111')).assertEqual('4111111111111111');
      // Dashes collapse to the bare number too.
      expect(LuhnUtils.stripSeparators('4532-0151-1283-0366')).assertEqual('4532015112830366');
      // Single spaced digits collapse one by one.
      expect(LuhnUtils.stripSeparators('4 1 1 1')).assertEqual('4111');
      // Single dashed digits collapse one by one.
      expect(LuhnUtils.stripSeparators('4-1-1-1')).assertEqual('4111');
      // The result equals the source digits of the sample.
      expect(LuhnUtils.stripSeparators('5500 0000 5555 5559')).assertEqual('5500000055555559');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_1800
     * @tc.name      testLuhnStrip0002
     * @tc.desc      Verify stripSeparators() on mixed space and dash noise
     *               around a four digit core.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnStrip0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnStrip0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Mixed leading and trailing noise is fully removed.
      expect(LuhnUtils.stripSeparators(' 4-1 1-1 ')).assertEqual('4111');
      // Space dash alternation is fully removed.
      expect(LuhnUtils.stripSeparators('4 - 1 - 1 - 1')).assertEqual('4111');
      // Leading and trailing dashes are fully removed.
      expect(LuhnUtils.stripSeparators('-4-1-1-1-')).assertEqual('4111');
      // Interleaved groups still collapse correctly.
      expect(LuhnUtils.stripSeparators('4111 1111-1111 1111')).assertEqual('4111111111111111');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_1900
     * @tc.name      testLuhnStrip0003
     * @tc.desc      Verify stripSeparators() keeps characters other than
     *               spaces and dashes, including dots, letters and tabs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnStrip0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnStrip0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A dot is preserved verbatim.
      expect(LuhnUtils.stripSeparators('4111.1111')).assertEqual('4111.1111');
      // Letters are preserved and separators removed.
      expect(LuhnUtils.stripSeparators('ab-cd ef')).assertEqual('abcdef');
      // A tab is preserved so the length stays three.
      expect(LuhnUtils.stripSeparators('4\t1').length).assertEqual(3);
      // A comma is preserved verbatim.
      expect(LuhnUtils.stripSeparators('4,1')).assertEqual('4,1');
      // A mixed digit letter string is preserved.
      expect(LuhnUtils.stripSeparators('4X11')).assertEqual('4X11');
      // Digits separated by a space collapse.
      expect(LuhnUtils.stripSeparators('12 34')).assertEqual('1234');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_2000
     * @tc.name      testLuhnStrip0004
     * @tc.desc      Verify stripSeparators() is idempotent: stripping an
     *               already stripped string changes nothing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnStrip0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnStrip0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const once: string = LuhnUtils.stripSeparators(' 4-1 1-1 1-1 1-1 ');
      const twice: string = LuhnUtils.stripSeparators(once);
      // Stripping twice equals stripping once.
      expect(twice).assertEqual(once);
      // The grouped sample stabilises after one pass.
      const grouped: string = LuhnUtils.stripSeparators('4111 1111 1111 1111');
      expect(LuhnUtils.stripSeparators(grouped)).assertEqual(grouped);
      // The empty string is a fixed point.
      expect(LuhnUtils.stripSeparators('')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_2100
     * @tc.name      testLuhnStrip0005
     * @tc.desc      Verify stripSeparators() reduces pure separator strings
     *               to the empty string while keeping tabs and newlines.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnStrip0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnStrip0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A pure dash string empties out.
      expect(LuhnUtils.stripSeparators('----')).assertEqual('');
      // A pure mixed separator string empties out.
      expect(LuhnUtils.stripSeparators(' - - ')).assertEqual('');
      // A single dash empties out.
      expect(LuhnUtils.stripSeparators('-')).assertEqual('');
      // A single space empties out.
      expect(LuhnUtils.stripSeparators(' ')).assertEqual('');
      // A tab is kept so the result is not empty.
      expect(LuhnUtils.stripSeparators('\t\n').length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_2200
     * @tc.name      testLuhnRound0001
     * @tc.desc      Verify luhnCheckDigit() equals the final character of
     *               three published numbers, proving the two helpers agree.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnRound0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnRound0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Visa payload and full number agree on digit one.
      expect(LuhnUtils.luhnCheckDigit('411111111111111')).assertEqual('4111111111111111'.charAt(15));
      // Mastercard payload and full number agree on digit six.
      expect(LuhnUtils.luhnCheckDigit('453201511283036')).assertEqual('4532015112830366'.charAt(15));
      // Mastercard payload and full number agree on digit nine.
      expect(LuhnUtils.luhnCheckDigit('550000555555555')).assertEqual('5500005555555559'.charAt(15));
      // The full Visa number validates as a whole.
      expect(LuhnUtils.isValidCardNumber('4111111111111111')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_2300
     * @tc.name      testLuhnRound0002
     * @tc.desc      Verify that flipping any single body digit of a valid
     *               number breaks the whole-number validation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnRound0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnRound0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The untouched Visa number validates.
      expect(LuhnUtils.isValidCardNumber('4111111111111111')).assertTrue();
      // Flipping the second digit to two breaks it.
      expect(LuhnUtils.isValidCardNumber('4211111111111111')).assertFalse();
      // Flipping the third digit to two breaks it.
      expect(LuhnUtils.isValidCardNumber('4112111111111111')).assertFalse();
      // Flipping the final digit to two breaks it.
      expect(LuhnUtils.isValidCardNumber('4111111111111112')).assertFalse();
      // The untouched Mastercard number validates.
      expect(LuhnUtils.isValidCardNumber('4532015112830366')).assertTrue();
      // Raising a body digit by four breaks it.
      expect(LuhnUtils.isValidCardNumber('4532015112830376')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_2400
     * @tc.name      testLuhnRound0003
     * @tc.desc      Verify the paste pipeline: strip separators, confirm the
     *               final digit and validate the cleaned number.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnRound0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnRound0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const clean: string = LuhnUtils.stripSeparators('4111 1111 1111 1111');
      // The cleaned string is the bare sixteen digit number.
      expect(clean).assertEqual('4111111111111111');
      // The final digit is one.
      expect(clean.charAt(15)).assertEqual('1');
      // The payload check digit agrees with the final digit.
      expect(LuhnUtils.luhnCheckDigit(clean.substring(0, 15))).assertEqual('1');
      // The cleaned number validates end to end.
      expect(LuhnUtils.isValidCardNumber(clean)).assertTrue();
      // The dashed variant validates identically after stripping.
      const dashed: string = LuhnUtils.stripSeparators('4532-0151-1283-0366');
      expect(LuhnUtils.isValidCardNumber(dashed)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_2500
     * @tc.name      testLuhnRound0004
     * @tc.desc      Verify that payload plus computed check digit rebuilds
     *               the exact published numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnRound0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnRound0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Visa rebuild matches the published sample.
      expect('411111111111111' + LuhnUtils.luhnCheckDigit('411111111111111')).assertEqual('4111111111111111');
      // Mastercard rebuild matches the published sample.
      expect('453201511283036' + LuhnUtils.luhnCheckDigit('453201511283036')).assertEqual('4532015112830366');
      // Mastercard variant rebuild matches the published sample.
      expect('550000555555555' + LuhnUtils.luhnCheckDigit('550000555555555')).assertEqual('5500005555555559');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_2600
     * @tc.name      testLuhnGroup0001
     * @tc.desc      Verify formatGrouped() inserts single spaces every four
     *               digits for fifteen and sixteen digit numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnGroup0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnGroup0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Sixteen digits split into four groups of four.
      expect(LuhnUtils.formatGrouped('4111111111111111')).assertEqual('4111 1111 1111 1111');
      // Fifteen digits keep a three digit tail group.
      expect(LuhnUtils.formatGrouped('340000000000009')).assertEqual('3400 0000 0000 009');
      // Stripping the grouped output restores the source.
      expect(LuhnUtils.stripSeparators(LuhnUtils.formatGrouped('4111111111111111')))
        .assertEqual('4111111111111111');
      // The grouped Visa sample is the display form.
      expect(LuhnUtils.formatGrouped('4532015112830366')).assertEqual('4532 0151 1283 0366');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_2700
     * @tc.name      testLuhnGroup0002
     * @tc.desc      Verify formatGrouped() edge cases for empty, short and
     *               boundary length inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnGroup0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnGroup0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty string stays empty.
      expect(LuhnUtils.formatGrouped('')).assertEqual('');
      // Two digits carry no separator.
      expect(LuhnUtils.formatGrouped('42')).assertEqual('42');
      // Four digits carry no separator.
      expect(LuhnUtils.formatGrouped('4222')).assertEqual('4222');
      // Five digits gain one separator.
      expect(LuhnUtils.formatGrouped('42222')).assertEqual('4222 2');
      // One digit stays as is.
      expect(LuhnUtils.formatGrouped('4')).assertEqual('4');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_2800
     * @tc.name      testLuhnMask0001
     * @tc.desc      Verify maskCard() keeps head four and tail four and
     *               fills the gap with asterisks for 15/16 digit numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnMask0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnMask0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Sixteen digit input shows eight stars.
      expect(LuhnUtils.maskCard('4111111111111111')).assertEqual('4111********1111');
      // Fifteen digit input shows seven stars.
      expect(LuhnUtils.maskCard('340000000000009')).assertEqual('3400*******0009');
      // The masked length equals the source length.
      expect(LuhnUtils.maskCard('4111111111111111').length).assertEqual(16);
      // The head block is preserved.
      expect(LuhnUtils.maskCard('4532015112830366').substring(0, 4)).assertEqual('4532');
      // The tail block preserves the check digit.
      expect(LuhnUtils.maskCard('4532015112830366').substring(12, 16)).assertEqual('0366');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_2900
     * @tc.name      testLuhnMask0002
     * @tc.desc      Verify maskCard() returns short inputs unchanged and
     *               keeps an eight character input fully visible.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnMask0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnMask0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two digit input is below the mask threshold.
      expect(LuhnUtils.maskCard('42')).assertEqual('42');
      // Empty input stays empty.
      expect(LuhnUtils.maskCard('')).assertEqual('');
      // Eight character input has no star gap at all.
      expect(LuhnUtils.maskCard('12345678')).assertEqual('12345678');
      // Nine character input shows a single star.
      expect(LuhnUtils.maskCard('123456789')).assertEqual('1234*6789');
      // Ten character input shows two stars.
      expect(LuhnUtils.maskCard('1234567890')).assertEqual('1234**7890');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_3000
     * @tc.name      testLuhnValid0010
     * @tc.desc      Verify the full display pipeline on a valid number:
     *               group, mask, strip and validate stay consistent.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnValid0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnValid0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const source: string = '4111111111111111';
      const grouped: string = LuhnUtils.formatGrouped(source);
      // The display form matches the classic grouping.
      expect(grouped).assertEqual('4111 1111 1111 1111');
      // The masked form keeps head and tail blocks.
      expect(LuhnUtils.maskCard(source)).assertEqual('4111********1111');
      // Stripping the display form restores the source.
      expect(LuhnUtils.stripSeparators(grouped)).assertEqual(source);
      // The restored source validates.
      expect(LuhnUtils.isValidCardNumber(LuhnUtils.stripSeparators(grouped))).assertTrue();
      // The raw grouped form does not validate before stripping.
      expect(LuhnUtils.isValidCardNumber(grouped)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_3100
     * @tc.name      testLuhnCheck0008
     * @tc.desc      Verify luhnCheckDigit() changes for every single digit
     *               mutation of a known fifteen digit payload.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnCheck0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnCheck0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const payload: string = '411111111111111';
      // The untouched payload keeps its known check digit.
      expect(LuhnUtils.luhnCheckDigit(payload)).assertEqual('1');
      let changed: number = 0;
      // Replacing any single one with a two shifts the weighted sum.
      for (let i = 0; i < payload.length; i++) {
        const mutated: string = payload.substring(0, i) + '2' + payload.substring(i + 1);
        const check: string = LuhnUtils.luhnCheckDigit(mutated);
        if (check !== '1' && check !== '') {
          changed = changed + 1;
        }
      }
      // Every one of the fifteen mutations yields a different digit.
      expect(changed).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_3200
     * @tc.name      testLuhnRound0005
     * @tc.desc      Verify that payload plus computed check digit rebuilds
     *               each known complete card number exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnRound0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnRound0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Rebuilding the Visa test number.
      expect('411111111111111' + LuhnUtils.luhnCheckDigit('411111111111111'))
        .assertEqual('4111111111111111');
      // Rebuilding the sixteen digit Mastercard sample.
      expect('453201511283036' + LuhnUtils.luhnCheckDigit('453201511283036'))
        .assertEqual('4532015112830366');
      // Rebuilding the second Mastercard sample.
      expect('550000555555555' + LuhnUtils.luhnCheckDigit('550000555555555'))
        .assertEqual('5500005555555559');
      // Rebuilding the alternating Stripe sample.
      expect('424242424242424' + LuhnUtils.luhnCheckDigit('424242424242424'))
        .assertEqual('4242424242424242');
      // Rebuilding the classic wiki example.
      expect('7992739871' + LuhnUtils.luhnCheckDigit('7992739871'))
        .assertEqual('79927398713');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_3300
     * @tc.name      testLuhnValid0011
     * @tc.desc      Verify isValidCardNumber() rejects letters, padding and
     *               separator variants even when the digits are correct.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnValid0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnValid0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Upper case letters are not digits.
      expect(LuhnUtils.isValidCardNumber('411111111111111B')).assertFalse();
      // Lower case letters are not digits either.
      expect(LuhnUtils.isValidCardNumber('411111111111111b')).assertFalse();
      // A trailing space extends the length.
      expect(LuhnUtils.isValidCardNumber('4111111111111111 ')).assertFalse();
      // A leading space extends the length.
      expect(LuhnUtils.isValidCardNumber(' 4111111111111111')).assertFalse();
      // Grouped digits with a wrong check digit fail.
      expect(LuhnUtils.isValidCardNumber('4111 1111 1111 1112')).assertFalse();
      // Dashed digits with a wrong check digit fail.
      expect(LuhnUtils.isValidCardNumber('4532-0151-1283-0367')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUCN_3400
     * @tc.name      testLuhnValid0012
     * @tc.desc      Verify luhnSum() matches the check digit formula and
     *               that flipping only the check digit always breaks the
     *               number.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnValid0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnValid0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The Visa payload has weighted sum twenty nine.
      expect(LuhnUtils.luhnSum('411111111111111')).assertEqual(29);
      // The Mastercard payload has weighted sum forty four.
      expect(LuhnUtils.luhnSum('453201511283036')).assertEqual(44);
      // The check digit equals nine times the sum modulo ten.
      const sum: number = LuhnUtils.luhnSum('411111111111111');
      expect(LuhnUtils.luhnCheckDigit('411111111111111')).assertEqual('' + ((sum * 9) % 10));
      // An empty payload carries no weighted sum.
      expect(LuhnUtils.luhnSum('')).assertEqual(-1);
      // A letter inside the payload carries no weighted sum.
      expect(LuhnUtils.luhnSum('4a')).assertEqual(-1);
      // Flipping the check digit through every wrong candidate fails.
      const base: string = '4532015112830366';
      const wrongs: string[] = ['0', '1', '2', '3', '4', '5', '7', '8', '9', 'X'];
      let broken: number = 0;
      for (let i = 0; i < wrongs.length; i++) {
        if (!LuhnUtils.isValidCardNumber(base.substring(0, 15) + wrongs[i])) {
          broken = broken + 1;
        }
      }
      expect(broken).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
