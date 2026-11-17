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

export default function luhnGenLogicTest() {
  describe('LuhnGenLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_0100
     * @tc.name      testLuhnMake0001
     * @tc.desc      Verify makeValidCardNumber() emits the exact expected
     *               sixteen digit number for the single digit prefix four.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnMake0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnMake0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The deterministic filler turns prefix four into a known number.
      const gen: string = LuhnUtils.makeValidCardNumber('4', 16);
      expect(gen).assertEqual('4123456789012349');
      // The generated number carries exactly sixteen digits.
      expect(gen.length).assertEqual(16);
      // The generated number passes the full validation.
      expect(LuhnUtils.isValidCardNumber(gen)).assertTrue();
      // The number starts with the requested prefix.
      expect(gen.substring(0, 1)).assertEqual('4');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_0200
     * @tc.name      testLuhnMake0002
     * @tc.desc      Verify makeValidCardNumber() outputs for six common
     *               prefixes all pass isValidCardNumber() at length sixteen.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnMake0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnMake0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const prefixes: string[] = ['4', '42', '4532', '6011', '34', '55'];
      let validCount: number = 0;
      // Every generated number must validate and keep its prefix.
      for (let i = 0; i < prefixes.length; i++) {
        const gen: string = LuhnUtils.makeValidCardNumber(prefixes[i], 16);
        if (LuhnUtils.isValidCardNumber(gen) && gen.length === 16) {
          validCount = validCount + 1;
        }
        expect(gen.substring(0, prefixes[i].length)).assertEqual(prefixes[i]);
      }
      expect(validCount).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_0300
     * @tc.name      testLuhnMake0003
     * @tc.desc      Verify makeValidCardNumber() exact output for the
     *               shortest legal lengths two and three.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnMake0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnMake0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prefix four plus check digit two.
      expect(LuhnUtils.makeValidCardNumber('4', 2)).assertEqual('42');
      // Prefix forty two plus check digit two.
      expect(LuhnUtils.makeValidCardNumber('42', 3)).assertEqual('422');
      // Both minimal numbers validate.
      expect(LuhnUtils.isValidCardNumber('42')).assertTrue();
      expect(LuhnUtils.isValidCardNumber('422')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_0400
     * @tc.name      testLuhnMake0004
     * @tc.desc      Verify makeValidCardNumber() rebuilds three known card
     *               numbers from their fifteen digit payload prefixes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnMake0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnMake0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The Visa payload rebuilds the classic test number.
      expect(LuhnUtils.makeValidCardNumber('411111111111111', 16))
        .assertEqual('4111111111111111');
      // The first Mastercard payload rebuilds its sample.
      expect(LuhnUtils.makeValidCardNumber('453201511283036', 16))
        .assertEqual('4532015112830366');
      // The second Mastercard payload rebuilds its sample.
      expect(LuhnUtils.makeValidCardNumber('550000555555555', 16))
        .assertEqual('5500005555555559');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_0500
     * @tc.name      testLuhnMake0005
     * @tc.desc      Verify makeValidCardNumber() exact output at the upper
     *               bound nineteen and an intermediate length fifteen.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnMake0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnMake0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The longest supported number for prefix four.
      const longGen: string = LuhnUtils.makeValidCardNumber('4', 19);
      expect(longGen).assertEqual('4123456789012345677');
      expect(longGen.length).assertEqual(19);
      expect(LuhnUtils.isValidCardNumber(longGen)).assertTrue();
      // The intermediate fifteen digit number.
      const midGen: string = LuhnUtils.makeValidCardNumber('4', 15);
      expect(midGen).assertEqual('412345678901233');
      expect(LuhnUtils.isValidCardNumber(midGen)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_0600
     * @tc.name      testLuhnMake0006
     * @tc.desc      Verify makeValidCardNumber() with a four digit prefix at
     *               length five and a two digit prefix at length sixteen.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnMake0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnMake0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prefix four five three two plus check digit eight.
      expect(LuhnUtils.makeValidCardNumber('4532', 5)).assertEqual('45328');
      expect(LuhnUtils.isValidCardNumber('45328')).assertTrue();
      // Prefix forty two fills fourteen filler digits at length sixteen.
      const gen: string = LuhnUtils.makeValidCardNumber('42', 16);
      expect(gen.length).assertEqual(16);
      expect(gen.substring(0, 2)).assertEqual('42');
      expect(LuhnUtils.isValidCardNumber(gen)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_0700
     * @tc.name      testLuhnMake0007
     * @tc.desc      Verify makeValidCardNumber() accepts prefixes starting
     *               with zero and keeps them in the output.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnMake0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnMake0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The shortest zero prefixed number is zero one two five.
      expect(LuhnUtils.makeValidCardNumber('0', 4)).assertEqual('0125');
      // Longer zero prefixed numbers validate too.
      const gen16: string = LuhnUtils.makeValidCardNumber('0', 16);
      expect(gen16.substring(0, 1)).assertEqual('0');
      expect(LuhnUtils.isValidCardNumber(gen16)).assertTrue();
      // A two digit zero prefix is preserved as well.
      const gen00: string = LuhnUtils.makeValidCardNumber('00', 16);
      expect(gen00.substring(0, 2)).assertEqual('00');
      expect(LuhnUtils.isValidCardNumber(gen00)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_0800
     * @tc.name      testLuhnMake0008
     * @tc.desc      Verify makeValidCardNumber() across lengths twelve,
     *               thirteen and fourteen with prefix four.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnMake0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnMake0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Length twelve matches the hand computed sample.
      expect(LuhnUtils.makeValidCardNumber('4', 12)).assertEqual('412345678905');
      // Length thirteen validates at full length.
      const gen13: string = LuhnUtils.makeValidCardNumber('4', 13);
      expect(gen13.length).assertEqual(13);
      expect(LuhnUtils.isValidCardNumber(gen13)).assertTrue();
      // Length fourteen validates at full length.
      const gen14: string = LuhnUtils.makeValidCardNumber('4', 14);
      expect(gen14.length).assertEqual(14);
      expect(LuhnUtils.isValidCardNumber(gen14)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_0900
     * @tc.name      testLuhnMake0009
     * @tc.desc      Verify makeValidCardNumber() returns the empty string
     *               for empty, alphabetic and punctuated prefixes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnMake0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnMake0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty prefix has nothing to build from.
      expect(LuhnUtils.makeValidCardNumber('', 16)).assertEqual('');
      // Letters are rejected.
      expect(LuhnUtils.makeValidCardNumber('4a', 16)).assertEqual('');
      // Spaces are rejected.
      expect(LuhnUtils.makeValidCardNumber('4 1', 16)).assertEqual('');
      // Dashes are rejected.
      expect(LuhnUtils.makeValidCardNumber('4-1', 16)).assertEqual('');
      // Dots are rejected.
      expect(LuhnUtils.makeValidCardNumber('4.1', 16)).assertEqual('');
      // Upper case letters are rejected.
      expect(LuhnUtils.makeValidCardNumber('ABCD', 16)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_1000
     * @tc.name      testLuhnMake0010
     * @tc.desc      Verify makeValidCardNumber() length guards for values
     *               below two, above nineteen and at prefix collisions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnMake0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnMake0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Length one cannot host a check digit.
      expect(LuhnUtils.makeValidCardNumber('4', 1)).assertEqual('');
      // Length zero is rejected.
      expect(LuhnUtils.makeValidCardNumber('4', 0)).assertEqual('');
      // Negative lengths are rejected.
      expect(LuhnUtils.makeValidCardNumber('4', -3)).assertEqual('');
      // Length twenty exceeds the supported maximum.
      expect(LuhnUtils.makeValidCardNumber('4', 20)).assertEqual('');
      // Length twenty one exceeds the maximum as well.
      expect(LuhnUtils.makeValidCardNumber('4', 21)).assertEqual('');
      // Prefix longer than the total length is rejected.
      expect(LuhnUtils.makeValidCardNumber('4532', 2)).assertEqual('');
      expect(LuhnUtils.makeValidCardNumber('4532', 3)).assertEqual('');
      // Prefix equal to the total length leaves no room.
      expect(LuhnUtils.makeValidCardNumber('4532', 4)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_1100
     * @tc.name      testLuhnMake0011
     * @tc.desc      Verify makeValidCardNumber() rejects fractional lengths
     *               and the NaN length value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnMake0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnMake0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A fractional length has no integer floor match.
      expect(LuhnUtils.makeValidCardNumber('4', 4.5)).assertEqual('');
      // Another fractional length is rejected too.
      expect(LuhnUtils.makeValidCardNumber('42', 15.2)).assertEqual('');
      // NaN compares false against every bound and is rejected.
      expect(LuhnUtils.makeValidCardNumber('4', Number.NaN)).assertEqual('');
      // Integer lengths still work right after the rejection checks.
      expect(LuhnUtils.makeValidCardNumber('4', 16)).assertEqual('4123456789012349');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_1200
     * @tc.name      testLuhnMake0012
     * @tc.desc      Verify makeValidCardNumber() rejects prefixes that fill
     *               or exceed the requested total length exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnMake0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnMake0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Sixteen digit prefix at length sixteen has no room.
      expect(LuhnUtils.makeValidCardNumber('4111111111111111', 16)).assertEqual('');
      // Seventeen digit prefix at length sixteen overflows.
      expect(LuhnUtils.makeValidCardNumber('41111111111111111', 16)).assertEqual('');
      // Nineteen digit prefix at length nineteen has no room.
      expect(LuhnUtils.makeValidCardNumber('4111111111111111111', 19)).assertEqual('');
      // Twenty digit prefix overflows any supported length.
      expect(LuhnUtils.makeValidCardNumber('41111111111111111111', 19)).assertEqual('');
      // A one digit prefix at length two still works.
      expect(LuhnUtils.makeValidCardNumber('4', 2)).assertEqual('42');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_1300
     * @tc.name      testLuhnMake0013
     * @tc.desc      Verify makeValidCardNumber() is deterministic: two calls
     *               with identical inputs return identical numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnMake0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnMake0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two consecutive calls agree for prefix four five three two.
      const first: string = LuhnUtils.makeValidCardNumber('4532', 16);
      const second: string = LuhnUtils.makeValidCardNumber('4532', 16);
      expect(first).assertEqual(second);
      // Two consecutive calls agree for prefix six zero one one.
      const third: string = LuhnUtils.makeValidCardNumber('6011', 16);
      const fourth: string = LuhnUtils.makeValidCardNumber('6011', 16);
      expect(third).assertEqual(fourth);
      // Both stable outputs validate.
      expect(LuhnUtils.isValidCardNumber(first)).assertTrue();
      expect(LuhnUtils.isValidCardNumber(third)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_1400
     * @tc.name      testLuhnMake0014
     * @tc.desc      Verify makeValidCardNumber() yields different numbers
     *               for different prefixes and different lengths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnMake0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnMake0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const gen4: string = LuhnUtils.makeValidCardNumber('4', 16);
      const gen5: string = LuhnUtils.makeValidCardNumber('5', 16);
      // Different prefixes produce different numbers.
      expect(gen4 !== gen5).assertTrue();
      // The same prefix at a shorter length produces a shorter number.
      const gen4s: string = LuhnUtils.makeValidCardNumber('4', 15);
      expect(gen4 !== gen4s).assertTrue();
      expect(gen4s.length).assertEqual(15);
      // Two digit prefix numbers differ from one digit prefix numbers.
      const gen42: string = LuhnUtils.makeValidCardNumber('42', 16);
      expect(gen4 !== gen42).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_1500
     * @tc.name      testLuhnGenEdge0001
     * @tc.desc      Verify the generated last digit equals luhnCheckDigit()
     *               applied to the generated payload prefix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnGenEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnGenEdge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const gen: string = LuhnUtils.makeValidCardNumber('453201', 16);
      const payload: string = gen.substring(0, 15);
      const last: string = gen.substring(15, 16);
      // The final character matches the payload check digit.
      expect(last).assertEqual(LuhnUtils.luhnCheckDigit(payload));
      // The final character is a plain digit.
      expect(last >= '0' && last <= '9').assertTrue();
      // The payload itself is fifteen digits.
      expect(payload.length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_1600
     * @tc.name      testLuhnGenEdge0002
     * @tc.desc      Verify a generated number passes validation, keeps its
     *               prefix and contains no separator characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnGenEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnGenEdge0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const gen: string = LuhnUtils.makeValidCardNumber('453201', 16);
      // The number validates as a whole.
      expect(LuhnUtils.isValidCardNumber(gen)).assertTrue();
      // The requested prefix survives at the front.
      expect(gen.substring(0, 6)).assertEqual('453201');
      // No spaces are inserted by the generator.
      expect(gen.indexOf(' ')).assertEqual(-1);
      // No dashes are inserted by the generator.
      expect(gen.indexOf('-')).assertEqual(-1);
      // The length matches the request.
      expect(gen.length).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_1700
     * @tc.name      testLuhnGenEdge0003
     * @tc.desc      Verify isValidCardNumber() boundaries for two digit
     *               numbers and their letter or separator variants.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnGenEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnGenEdge0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Forty two is the minimal valid number.
      expect(LuhnUtils.isValidCardNumber('42')).assertTrue();
      // Forty three fails the checksum.
      expect(LuhnUtils.isValidCardNumber('43')).assertFalse();
      // A letter tail is rejected.
      expect(LuhnUtils.isValidCardNumber('4x')).assertFalse();
      // A leading space is rejected.
      expect(LuhnUtils.isValidCardNumber(' 42')).assertFalse();
      // A trailing space is rejected.
      expect(LuhnUtils.isValidCardNumber('42 ')).assertFalse();
      // An embedded dash is rejected.
      expect(LuhnUtils.isValidCardNumber('4-2')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_1800
     * @tc.name      testLuhnGenEdge0004
     * @tc.desc      Verify luhnCheckDigit() single digit payloads and the
     *               all-zero two digit payload.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnGenEdge0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnGenEdge0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Doubling zero contributes nothing.
      expect(LuhnUtils.luhnCheckDigit('0')).assertEqual('0');
      // Doubling one contributes two, so the check digit is eight.
      expect(LuhnUtils.luhnCheckDigit('1')).assertEqual('8');
      // Doubling five reduces to one, so the check digit is nine.
      expect(LuhnUtils.luhnCheckDigit('5')).assertEqual('9');
      // Doubling eight reduces to seven, so the check digit is three.
      expect(LuhnUtils.luhnCheckDigit('8')).assertEqual('3');
      // Doubling nine reduces to nine, so the check digit is one.
      expect(LuhnUtils.luhnCheckDigit('9')).assertEqual('1');
      // The zero payload pair keeps a zero check digit.
      expect(LuhnUtils.luhnCheckDigit('00')).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_1900
     * @tc.name      testLuhnStripGen0001
     * @tc.desc      Verify a space grouped generated number survives a
     *               strip round trip unchanged and still validates.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnStripGen0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnStripGen0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const gen: string = LuhnUtils.makeValidCardNumber('4532', 16);
      const spaced: string = gen.substring(0, 4) + ' ' + gen.substring(4, 8) + ' '
        + gen.substring(8, 12) + ' ' + gen.substring(12, 16);
      // Stripping the display form restores the generated number.
      expect(LuhnUtils.stripSeparators(spaced)).assertEqual(gen);
      // The restored number validates.
      expect(LuhnUtils.isValidCardNumber(LuhnUtils.stripSeparators(spaced))).assertTrue();
      // The raw spaced form does not validate before stripping.
      expect(LuhnUtils.isValidCardNumber(spaced)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_2000
     * @tc.name      testLuhnStripGen0002
     * @tc.desc      Verify a dash grouped generated number survives a strip
     *               round trip unchanged and still validates.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnStripGen0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnStripGen0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const gen: string = LuhnUtils.makeValidCardNumber('6011', 16);
      const dashed: string = gen.substring(0, 4) + '-' + gen.substring(4, 8) + '-'
        + gen.substring(8, 12) + '-' + gen.substring(12, 16);
      // Stripping the dashed form restores the generated number.
      expect(LuhnUtils.stripSeparators(dashed)).assertEqual(gen);
      // The restored number validates.
      expect(LuhnUtils.isValidCardNumber(LuhnUtils.stripSeparators(dashed))).assertTrue();
      // The raw dashed form does not validate before stripping.
      expect(LuhnUtils.isValidCardNumber(dashed)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_2100
     * @tc.name      testLuhnStrip0001
     * @tc.desc      Verify stripSeparators() collapses spaces from known
     *               card display forms into bare digit strings.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnStrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnStrip0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The grouped Visa display form collapses correctly.
      expect(LuhnUtils.stripSeparators('4111 1111 1111 1111')).assertEqual('4111111111111111');
      // The grouped Mastercard display form collapses correctly.
      expect(LuhnUtils.stripSeparators('4532 0151 1283 0366')).assertEqual('4532015112830366');
      // Single spaced digits collapse one by one.
      expect(LuhnUtils.stripSeparators('5 5 0 0 0 0 5 5 5 5 5 5 5 5 5 9'))
        .assertEqual('5500005555555559');
      // Single character spaced input collapses to the bare digits.
      expect(LuhnUtils.stripSeparators('4 1 1 1')).assertEqual('4111');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_2200
     * @tc.name      testLuhnStrip0002
     * @tc.desc      Verify stripSeparators() removes mixed space and dash
     *               separators in any position or density.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnStrip0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnStrip0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Spaces and dashes interleaved around the digits.
      expect(LuhnUtils.stripSeparators(' 4-1 1-1 ')).assertEqual('4111');
      // Dashes padded with spaces between every digit.
      expect(LuhnUtils.stripSeparators('4 - 1 - 1 - 1')).assertEqual('4111');
      // Leading and trailing dashes around every digit.
      expect(LuhnUtils.stripSeparators('-4-1-1-1-')).assertEqual('4111');
      // Mixed density from a real paste scenario.
      expect(LuhnUtils.stripSeparators('4111 1111-1111 1111')).assertEqual('4111111111111111');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_2300
     * @tc.name      testLuhnStrip0003
     * @tc.desc      Verify stripSeparators() keeps letters, dots and commas
     *               so only spaces and dashes are removed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnStrip0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnStrip0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Letters survive untouched.
      expect(LuhnUtils.stripSeparators('4X11')).assertEqual('4X11');
      // Plain digit groups collapse normally.
      expect(LuhnUtils.stripSeparators('12 34')).assertEqual('1234');
      // Dots and dashes behave differently.
      expect(LuhnUtils.stripSeparators('4.1-1')).assertEqual('4.11');
      // Pure letters pass through unchanged.
      expect(LuhnUtils.stripSeparators('abc')).assertEqual('abc');
      // Commas survive the strip operation.
      expect(LuhnUtils.stripSeparators('4,111')).assertEqual('4,111');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_2400
     * @tc.name      testLuhnRound0001
     * @tc.desc      Verify the make, group, strip and validate pipeline on
     *               one generated number end to end.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnRound0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnRound0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const gen: string = LuhnUtils.makeValidCardNumber('4', 16);
      const grouped: string = LuhnUtils.formatGrouped(gen);
      // The known generated number groups into four blocks.
      expect(grouped).assertEqual('4123 4567 8901 2349');
      // Stripping the grouped form restores the generated number.
      expect(LuhnUtils.stripSeparators(grouped)).assertEqual(gen);
      // The grouped form itself does not validate.
      expect(LuhnUtils.isValidCardNumber(grouped)).assertFalse();
      // The stripped form validates again.
      expect(LuhnUtils.isValidCardNumber(LuhnUtils.stripSeparators(grouped))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_2500
     * @tc.name      testLuhnRound0002
     * @tc.desc      Verify makeValidCardNumber() honours a long fourteen
     *               digit prefix derived from a known test card.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnRound0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnRound0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const gen: string = LuhnUtils.makeValidCardNumber('42222222222222', 16);
      // The number reaches the requested length.
      expect(gen.length).assertEqual(16);
      // The fourteen digit prefix survives intact.
      expect(gen.substring(0, 14)).assertEqual('42222222222222');
      // The generated number validates as a whole.
      expect(LuhnUtils.isValidCardNumber(gen)).assertTrue();
      // Exactly two characters were appended to the prefix.
      expect(gen.substring(14, 16).length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_2600
     * @tc.name      testLuhnRound0003
     * @tc.desc      Verify makeValidCardNumber() with the classic ten digit
     *               wiki payload yields the exact known sixteen digit result.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnRound0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnRound0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const gen: string = LuhnUtils.makeValidCardNumber('7992739871', 16);
      // The filler digits and check digit match the hand computation.
      expect(gen).assertEqual('7992739871123459');
      // The generated number validates end to end.
      expect(LuhnUtils.isValidCardNumber(gen)).assertTrue();
      // The ten digit wiki payload survives at the front.
      expect(gen.substring(0, 10)).assertEqual('7992739871');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_2700
     * @tc.name      testLuhnMake0015
     * @tc.desc      Verify a batch of ten prefix and length combinations all
     *               produce numbers that pass the full validation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnMake0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnMake0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const prefixes: string[] = ['4', '42', '4532', '6011', '34', '55', '7', '99', '42', '411'];
      const lengths: number[] = [16, 16, 16, 16, 15, 16, 12, 14, 19, 16];
      let validCount: number = 0;
      // Every combination must validate at its requested length.
      for (let i = 0; i < prefixes.length; i++) {
        const gen: string = LuhnUtils.makeValidCardNumber(prefixes[i], lengths[i]);
        if (LuhnUtils.isValidCardNumber(gen) && gen.length === lengths[i]) {
          validCount = validCount + 1;
        }
        expect(gen.substring(0, prefixes[i].length)).assertEqual(prefixes[i]);
      }
      expect(validCount).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_2800
     * @tc.name      testLuhnGenEdge0005
     * @tc.desc      Verify maskCard() applied to a generated number keeps
     *               the prefix head and hides the middle block.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnGenEdge0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnGenEdge0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const gen: string = LuhnUtils.makeValidCardNumber('453201', 16);
      const masked: string = LuhnUtils.maskCard(gen);
      // The masked head matches the number head.
      expect(masked.substring(0, 4)).assertEqual('4532');
      // The masked output keeps the original length.
      expect(masked.length).assertEqual(16);
      // The masked output differs from the raw number.
      expect(masked !== gen).assertTrue();
      // The first star appears right after the head block.
      expect(masked.indexOf('*')).assertEqual(4);
      // The raw number itself still validates.
      expect(LuhnUtils.isValidCardNumber(gen)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_2900
     * @tc.name      testLuhnRound0004
     * @tc.desc      Verify that a known number and its generator rebuild are
     *               identical and share the same validation result.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnRound0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnRound0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const rebuilt: string = LuhnUtils.makeValidCardNumber('411111111111111', 16);
      const pasted: string = LuhnUtils.stripSeparators('4111 1111 1111 1111');
      // The rebuild equals the pasted display form.
      expect(rebuilt).assertEqual(pasted);
      // Both validate through the same code path.
      expect(LuhnUtils.isValidCardNumber(rebuilt)).assertTrue();
      expect(LuhnUtils.isValidCardNumber(pasted)).assertTrue();
      // Their check digits agree.
      expect(rebuilt.substring(15, 16)).assertEqual(pasted.substring(15, 16));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_3000
     * @tc.name      testLuhnGenEdge0006
     * @tc.desc      Verify every supported total length from two to nineteen
     *               produces a valid number of exactly that length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnGenEdge0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnGenEdge0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let validCount: number = 0;
      // Walk every length from two to nineteen inclusive.
      for (let len = 2; len <= 19; len++) {
        const gen: string = LuhnUtils.makeValidCardNumber('4', len);
        if (LuhnUtils.isValidCardNumber(gen) && gen.length === len) {
          validCount = validCount + 1;
        }
        expect(gen.substring(0, 1)).assertEqual('4');
      }
      // All eighteen lengths succeed.
      expect(validCount).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_3100
     * @tc.name      testLuhnGenEdge0007
     * @tc.desc      Verify a second batch of ten prefix and length pairs
     *               all produce valid numbers with the right shape.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnGenEdge0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnGenEdge0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const prefixes: string[] = ['4', '42', '453', '55', '34', '6011', '99', '7', '42', '4'];
      const lengths: number[] = [16, 16, 16, 16, 15, 16, 12, 13, 19, 18];
      let validCount: number = 0;
      // Each pair must produce a valid number of the exact length.
      for (let i = 0; i < prefixes.length; i++) {
        const gen: string = LuhnUtils.makeValidCardNumber(prefixes[i], lengths[i]);
        if (LuhnUtils.isValidCardNumber(gen) && gen.length === lengths[i]) {
          validCount = validCount + 1;
        }
        expect(gen.indexOf(' ')).assertEqual(-1);
        expect(gen.indexOf('-')).assertEqual(-1);
      }
      expect(validCount).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_3200
     * @tc.name      testLuhnGenEdge0008
     * @tc.desc      Verify the final character of every generated number
     *               equals the check digit of its own payload part.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnGenEdge0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnGenEdge0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three representative generated numbers are inspected.
      const genA: string = LuhnUtils.makeValidCardNumber('453201', 16);
      const genB: string = LuhnUtils.makeValidCardNumber('6011', 15);
      const genC: string = LuhnUtils.makeValidCardNumber('55', 12);
      // The last digit equals the payload check digit in each case.
      expect(genA.charAt(15)).assertEqual(LuhnUtils.luhnCheckDigit(genA.substring(0, 15)));
      expect(genB.charAt(14)).assertEqual(LuhnUtils.luhnCheckDigit(genB.substring(0, 14)));
      expect(genC.charAt(11)).assertEqual(LuhnUtils.luhnCheckDigit(genC.substring(0, 11)));
      // The payload part never carries a check digit already.
      expect(genB.length).assertEqual(15);
      expect(genC.length).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_3300
     * @tc.name      testLuhnMake0016
     * @tc.desc      Verify long generated numbers at total length nineteen
     *               keep the prefix, exact length and full validity.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnMake0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnMake0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const genA: string = LuhnUtils.makeValidCardNumber('4532', 19);
      // The nineteen digit number keeps its four digit prefix.
      expect(genA.length).assertEqual(19);
      expect(genA.substring(0, 4)).assertEqual('4532');
      expect(LuhnUtils.isValidCardNumber(genA)).assertTrue();
      const genB: string = LuhnUtils.makeValidCardNumber('6011', 19);
      // A second prefix also reaches the maximum length.
      expect(genB.length).assertEqual(19);
      expect(genB.substring(0, 4)).assertEqual('6011');
      expect(LuhnUtils.isValidCardNumber(genB)).assertTrue();
      const genC: string = LuhnUtils.makeValidCardNumber('42', 18);
      // An eighteen digit variant stays valid too.
      expect(genC.length).assertEqual(18);
      expect(LuhnUtils.isValidCardNumber(genC)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_3400
     * @tc.name      testLuhnGenEdge0009
     * @tc.desc      Verify that replacing only the check digit of a generated
     *               number with any other character breaks the validation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnGenEdge0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnGenEdge0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const gen: string = LuhnUtils.makeValidCardNumber('4532', 16);
      const payload: string = gen.substring(0, 15);
      // The untouched number validates before the loop.
      expect(LuhnUtils.isValidCardNumber(gen)).assertTrue();
      const wrongs: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'X'];
      let broken: number = 0;
      // Any candidate different from the real check digit must fail.
      for (let i = 0; i < wrongs.length; i++) {
        if (wrongs[i] !== gen.charAt(15) && !LuhnUtils.isValidCardNumber(payload + wrongs[i])) {
          broken = broken + 1;
        }
      }
      expect(broken).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_LUGE_3500
     * @tc.name      testLuhnMake0017
     * @tc.desc      Verify generated numbers for the remaining single digit
     *               prefixes all validate and keep their exact lengths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLuhnMake0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLuhnMake0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const prefixes: string[] = ['9', '8', '6', '5', '3', '2', '1', '0'];
      let validCount: number = 0;
      // Every single digit prefix produces a valid sixteen digit number.
      for (let i = 0; i < prefixes.length; i++) {
        const gen: string = LuhnUtils.makeValidCardNumber(prefixes[i], 16);
        if (LuhnUtils.isValidCardNumber(gen) && gen.length === 16) {
          validCount = validCount + 1;
        }
        expect(gen.substring(0, 1)).assertEqual(prefixes[i]);
        expect(gen.length).assertEqual(16);
      }
      expect(validCount).assertEqual(8);
      // The generated numbers are pairwise different.
      const genA: string = LuhnUtils.makeValidCardNumber('9', 16);
      const genB: string = LuhnUtils.makeValidCardNumber('8', 16);
      expect(genA !== genB).assertTrue();
      // Each number stays valid when rebuilt from its payload.
      expect(genA.charAt(15)).assertEqual(LuhnUtils.luhnCheckDigit(genA.substring(0, 15)));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
