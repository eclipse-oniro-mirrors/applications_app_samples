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
import { NumberParseUtils } from '../testutils/NumberParseUtils';

const DOMAIN: number = 0xF811;

export default function numberParseEdgeLogicTest() {
  describe('NumberParseEdgeLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_0100
     * @tc.name      testParseIntSafe0001
     * @tc.desc      Verify parseIntSafe returns zero for the empty string
     *               and for strings containing only whitespace.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParseIntSafe0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParseIntSafe0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.parseIntSafe('')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('   ')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('\t')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('\n')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe(' \t \n ')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_0200
     * @tc.name      testParseIntSafe0002
     * @tc.desc      Verify parseIntSafe rejects letters, dots, exponent
     *               markers and embedded spaces with a zero result.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseIntSafe0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParseIntSafe0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.parseIntSafe('abc')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('12a3')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('a12')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('1.5')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('1e3')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('12 3')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_0300
     * @tc.name      testParseIntSafe0003
     * @tc.desc      Verify parseIntSafe returns zero for a lone sign even
     *               when surrounded by whitespace.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseIntSafe0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParseIntSafe0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.parseIntSafe('-')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('+')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('- ')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('+ ')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('  -  ')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('  +  ')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_0400
     * @tc.name      testParseIntSafe0004
     * @tc.desc      Verify parseIntSafe rejects doubled or mixed sign
     *               prefixes instead of parsing a partial value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testParseIntSafe0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testParseIntSafe0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.parseIntSafe('--5')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('+-3')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('-+7')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('++9')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('-+0')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_0500
     * @tc.name      testParseIntSafe0005
     * @tc.desc      Verify parseIntSafe returns zero for decimal strings
     *               beyond the safe integer range in both directions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testParseIntSafe0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testParseIntSafe0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.parseIntSafe('99999999999999999999')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('9007199254740992')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('-9007199254740992')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('1000000000000000000000')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_0600
     * @tc.name      testParseIntSafe0006
     * @tc.desc      Verify parseIntSafe parses the negative safe bound
     *               exactly and stays exact one unit inside it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseIntSafe0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParseIntSafe0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.parseIntSafe('-9007199254740991')).assertEqual(-9007199254740991);
      expect(NumberParseUtils.parseIntSafe('9007199254740990')).assertEqual(9007199254740990);
      expect(NumberParseUtils.parseIntSafe('-9007199254740990')).assertEqual(-9007199254740990);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_0700
     * @tc.name      testIsDigits0001
     * @tc.desc      Verify isDigits returns false for the empty string and
     *               whitespace-only strings of several kinds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsDigits0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIsDigits0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.isDigits('')).assertFalse();
      expect(NumberParseUtils.isDigits('  ')).assertFalse();
      expect(NumberParseUtils.isDigits('\t')).assertFalse();
      expect(NumberParseUtils.isDigits('\n')).assertFalse();
      expect(NumberParseUtils.isDigits(' \t\n ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_0800
     * @tc.name      testIsDigits0002
     * @tc.desc      Verify isDigits rejects punctuation, signs, dots and
     *               exponent markers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIsDigits0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testIsDigits0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.isDigits('12.5')).assertFalse();
      expect(NumberParseUtils.isDigits('1e3')).assertFalse();
      expect(NumberParseUtils.isDigits('+1')).assertFalse();
      expect(NumberParseUtils.isDigits('-1')).assertFalse();
      expect(NumberParseUtils.isDigits('1 2')).assertFalse();
      expect(NumberParseUtils.isDigits('12a')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_0900
     * @tc.name      testIsDigits0003
     * @tc.desc      Verify isDigits accepts only ASCII 0-9 and rejects
     *               fullwidth and other non-ASCII digit look-alikes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIsDigits0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testIsDigits0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.isDigits('１２３')).assertFalse();
      expect(NumberParseUtils.isDigits('½')).assertFalse();
      expect(NumberParseUtils.isDigits('٣')).assertFalse();
      expect(NumberParseUtils.isDigits('0')).assertTrue();
      expect(NumberParseUtils.isDigits('9')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_1000
     * @tc.name      testClampInt0001
     * @tc.desc      Verify clampInt keeps exact bounds, clamps infinities
     *               and returns endpoints for out-of-range input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampInt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testClampInt0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.clampInt(0, 0, 10)).assertEqual(0);
      expect(NumberParseUtils.clampInt(10, 0, 10)).assertEqual(10);
      expect(NumberParseUtils.clampInt(-2, -2, 5)).assertEqual(-2);
      expect(NumberParseUtils.clampInt(Infinity, 0, 10)).assertEqual(10);
      expect(NumberParseUtils.clampInt(-Infinity, 0, 10)).assertEqual(0);
      expect(NumberParseUtils.clampInt(15, 0, 10)).assertEqual(10);
      expect(NumberParseUtils.clampInt(-5, 0, 10)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_1100
     * @tc.name      testToFixedText0001
     * @tc.desc      Verify toFixedText honors the digits endpoints 0 and 8
     *               for exact binary fractions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testToFixedText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testToFixedText0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.toFixedText(0.125, 8)).assertEqual('0.12500000');
      expect(NumberParseUtils.toFixedText(7 / 8, 8)).assertEqual('0.87500000');
      expect(NumberParseUtils.toFixedText(2.5, 8)).assertEqual('2.50000000');
      expect(NumberParseUtils.toFixedText(0, 8)).assertEqual('0.00000000');
      expect(NumberParseUtils.toFixedText(1 / 3, 0)).assertEqual('0');
      expect(NumberParseUtils.toFixedText(0, 0)).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_1200
     * @tc.name      testToFixedText0002
     * @tc.desc      Verify toFixedText falls back to toString for digit
     *               counts outside 0-8 including fractional ones.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToFixedText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testToFixedText0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.toFixedText(1.5, 9)).assertEqual('1.5');
      expect(NumberParseUtils.toFixedText(1.5, -1)).assertEqual('1.5');
      expect(NumberParseUtils.toFixedText(1.5, 100)).assertEqual('1.5');
      expect(NumberParseUtils.toFixedText(1.5, 2.5)).assertEqual('1.5');
      expect(NumberParseUtils.toFixedText(1.5, -0.5)).assertEqual('1.5');
      expect(NumberParseUtils.toFixedText(0, 9)).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_1300
     * @tc.name      testToFixedText0003
     * @tc.desc      Verify toFixedText rounds negative ties away from zero
     *               and keeps the sign on fraction digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToFixedText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testToFixedText0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.toFixedText(-2.5, 0)).assertEqual('-3');
      expect(NumberParseUtils.toFixedText(-0.5, 0)).assertEqual('-1');
      expect(NumberParseUtils.toFixedText(-1.5, 0)).assertEqual('-2');
      expect(NumberParseUtils.toFixedText(-1.25, 1)).assertEqual('-1.3');
      expect(NumberParseUtils.toFixedText(-0.125, 8)).assertEqual('-0.12500000');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_1400
     * @tc.name      testGroupThousands0001
     * @tc.desc      Verify groupThousands returns malformed strings
     *               unchanged including lone signs and mixed signs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGroupThousands0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testGroupThousands0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.groupThousands('', ',')).assertEqual('');
      expect(NumberParseUtils.groupThousands('abc', ',')).assertEqual('abc');
      expect(NumberParseUtils.groupThousands('12a3', ',')).assertEqual('12a3');
      expect(NumberParseUtils.groupThousands('-', ',')).assertEqual('-');
      expect(NumberParseUtils.groupThousands('+', ',')).assertEqual('+');
      expect(NumberParseUtils.groupThousands('-12-34', ',')).assertEqual('-12-34');
      expect(NumberParseUtils.groupThousands('1 234', ',')).assertEqual('1 234');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_1500
     * @tc.name      testGroupThousands0002
     * @tc.desc      Verify groupThousands with the empty separator and long
     *               twelve digit groups splits at exact positions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGroupThousands0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testGroupThousands0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.groupThousands('1234', '')).assertEqual('1234');
      expect(NumberParseUtils.groupThousands('9', ',')).assertEqual('9');
      expect(NumberParseUtils.groupThousands('123456789', ',')).assertEqual('123,456,789');
      expect(NumberParseUtils.groupThousands('1000000000000', ',')).assertEqual('1,000,000,000,000');
      expect(NumberParseUtils.groupThousands('0', ',')).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_1600
     * @tc.name      testGroupThousands0003
     * @tc.desc      Verify groupThousands handles sign-only strings and
     *               multi-character separators with negative values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testGroupThousands0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testGroupThousands0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.groupThousands('1234567', '::')).assertEqual('1::234::567');
      expect(NumberParseUtils.groupThousands('-987654321', ' ')).assertEqual('-987 654 321');
      expect(NumberParseUtils.groupThousands('-1234', '')).assertEqual('-1234');
      expect(NumberParseUtils.groupThousands('+1234', ',')).assertEqual('+1,234');
      const long: string = NumberParseUtils.groupThousands('123456789012', ',');
      expect(long).assertEqual('123,456,789,012');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_1700
     * @tc.name      testToHex0001
     * @tc.desc      Verify toHex returns the empty string for negatives,
     *               signs, spaces, dots and hex-prefixed input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testToHex0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testToHex0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.toHex('')).assertEqual('');
      expect(NumberParseUtils.toHex('-16')).assertEqual('');
      expect(NumberParseUtils.toHex('12a')).assertEqual('');
      expect(NumberParseUtils.toHex('  ')).assertEqual('');
      expect(NumberParseUtils.toHex('+5')).assertEqual('');
      expect(NumberParseUtils.toHex('3.5')).assertEqual('');
      expect(NumberParseUtils.toHex('0x1F')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_1800
     * @tc.name      testToHex0002
     * @tc.desc      Verify toHex collapses leading zero runs to canonical
     *               uppercase output without a prefix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToHex0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testToHex0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.toHex('0')).assertEqual('0');
      expect(NumberParseUtils.toHex('0000')).assertEqual('0');
      expect(NumberParseUtils.toHex('007')).assertEqual('7');
      expect(NumberParseUtils.toHex('00010')).assertEqual('A');
      expect(NumberParseUtils.toHex('000255')).assertEqual('FF');
      expect(NumberParseUtils.toHex('0000016')).assertEqual('10');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_1900
     * @tc.name      testToHex0003
     * @tc.desc      Verify toHex and fromHex round trip several magnitudes
     *               back to the original decimal value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testToHex0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testToHex0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const hexA: string = NumberParseUtils.toHex('255');
      expect(hexA).assertEqual('FF');
      expect(NumberParseUtils.fromHex(hexA)).assertEqual(255);
      const hexB: string = NumberParseUtils.toHex('4096');
      expect(hexB).assertEqual('1000');
      expect(NumberParseUtils.fromHex(hexB)).assertEqual(4096);
      const hexC: string = NumberParseUtils.toHex('1048576');
      expect(hexC).assertEqual('100000');
      expect(NumberParseUtils.fromHex(hexC)).assertEqual(1048576);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_2000
     * @tc.name      testFromHex0001
     * @tc.desc      Verify fromHex returns -1 for empty input, spaces,
     *               prefixes and invalid letters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFromHex0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFromHex0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.fromHex('')).assertEqual(-1);
      expect(NumberParseUtils.fromHex('GG')).assertEqual(-1);
      expect(NumberParseUtils.fromHex(' 12')).assertEqual(-1);
      expect(NumberParseUtils.fromHex('0x10')).assertEqual(-1);
      expect(NumberParseUtils.fromHex('12g')).assertEqual(-1);
      expect(NumberParseUtils.fromHex('+F')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_2100
     * @tc.name      testFromHex0002
     * @tc.desc      Verify fromHex accepts mixed case letters and ignores
     *               leading zeros in the value computation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFromHex0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testFromHex0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.fromHex('0000')).assertEqual(0);
      expect(NumberParseUtils.fromHex('000FF')).assertEqual(255);
      expect(NumberParseUtils.fromHex('0f')).assertEqual(15);
      expect(NumberParseUtils.fromHex('F0')).assertEqual(240);
      expect(NumberParseUtils.fromHex('AbCdEf')).assertEqual(11259375);
      expect(NumberParseUtils.fromHex('0001A')).assertEqual(26);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_2200
     * @tc.name      testFromHex0003
     * @tc.desc      Verify fromHex returns -1 beyond the safe range and
     *               still parses the largest safe power of two.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFromHex0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testFromHex0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let allF: string = '';
      for (let i = 0; i < 16; i++) {
        allF = allF + 'F';
      }
      expect(allF.length).assertEqual(16);
      expect(NumberParseUtils.fromHex(allF)).assertEqual(-1);
      expect(NumberParseUtils.fromHex('123456789ABCDEF')).assertEqual(-1);
      expect(NumberParseUtils.fromHex('8000000000000')).assertEqual(2251799813685248);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_2300
     * @tc.name      testToBinary0001
     * @tc.desc      Verify toBinary rejects invalid decimal input and
     *               accepts complete decimal digit strings.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testToBinary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testToBinary0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.toBinary('')).assertEqual('');
      expect(NumberParseUtils.toBinary('-1')).assertEqual('');
      expect(NumberParseUtils.toBinary('102')).assertEqual('1100110');
      expect(NumberParseUtils.toBinary('abc')).assertEqual('');
      expect(NumberParseUtils.toBinary('2a')).assertEqual('');
      expect(NumberParseUtils.toBinary('1 0')).assertEqual('');
      expect(NumberParseUtils.toBinary('1.0')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_2400
     * @tc.name      testToBinary0002
     * @tc.desc      Verify toBinary strips long leading zero runs while
     *               keeping the canonical bit pattern.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToBinary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testToBinary0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.toBinary('0001')).assertEqual('1');
      expect(NumberParseUtils.toBinary('0000')).assertEqual('0');
      expect(NumberParseUtils.toBinary('00010')).assertEqual('1010');
      let padded: string = '';
      for (let i = 0; i < 20; i++) {
        padded = padded + '0';
      }
      padded = padded + '2';
      expect(NumberParseUtils.toBinary(padded)).assertEqual('10');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_2500
     * @tc.name      testToBinary0003
     * @tc.desc      Verify toBinary and fromBinary round trip several
     *               magnitudes back to the original decimal value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testToBinary0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testToBinary0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const bitsA: string = NumberParseUtils.toBinary('3');
      expect(bitsA).assertEqual('11');
      expect(NumberParseUtils.fromBinary(bitsA)).assertEqual(3);
      const bitsB: string = NumberParseUtils.toBinary('255');
      expect(bitsB).assertEqual('11111111');
      expect(NumberParseUtils.fromBinary(bitsB)).assertEqual(255);
      const bitsC: string = NumberParseUtils.toBinary('65535');
      expect(bitsC).assertEqual('1111111111111111');
      expect(NumberParseUtils.fromBinary(bitsC)).assertEqual(65535);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_2600
     * @tc.name      testFromBinary0001
     * @tc.desc      Verify fromBinary returns -1 for empty input, digits
     *               above one, spaces and sign prefixes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFromBinary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFromBinary0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.fromBinary('')).assertEqual(-1);
      expect(NumberParseUtils.fromBinary('102')).assertEqual(-1);
      expect(NumberParseUtils.fromBinary('abc')).assertEqual(-1);
      expect(NumberParseUtils.fromBinary('10 1')).assertEqual(-1);
      expect(NumberParseUtils.fromBinary('2')).assertEqual(-1);
      expect(NumberParseUtils.fromBinary('+1')).assertEqual(-1);
      expect(NumberParseUtils.fromBinary('-1')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_2700
     * @tc.name      testFromBinary0002
     * @tc.desc      Verify fromBinary treats leading zero bits as no-ops
     *               and resolves the remaining pattern exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFromBinary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testFromBinary0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.fromBinary('0000')).assertEqual(0);
      expect(NumberParseUtils.fromBinary('0001')).assertEqual(1);
      expect(NumberParseUtils.fromBinary('0001010')).assertEqual(10);
      expect(NumberParseUtils.fromBinary('0011')).assertEqual(3);
      let padded: string = '';
      for (let i = 0; i < 12; i++) {
        padded = padded + '0';
      }
      padded = padded + '1010';
      expect(NumberParseUtils.fromBinary(padded)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_2800
     * @tc.name      testFromBinary0003
     * @tc.desc      Verify fromBinary parses the 53-one safe maximum and
     *               rejects the 54-one overflow pattern with -1.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFromBinary0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testFromBinary0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let ones53: string = '';
      for (let i = 0; i < 53; i++) {
        ones53 = ones53 + '1';
      }
      expect(NumberParseUtils.fromBinary(ones53)).assertEqual(9007199254740991);
      let ones54: string = '';
      for (let i = 0; i < 54; i++) {
        ones54 = ones54 + '1';
      }
      expect(NumberParseUtils.fromBinary(ones54)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_2900
     * @tc.name      testDigitSum0001
     * @tc.desc      Verify digitSum ignores every non-digit character and
     *               returns zero for digit-free strings.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDigitSum0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDigitSum0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.digitSum('')).assertEqual(0);
      expect(NumberParseUtils.digitSum('abc')).assertEqual(0);
      expect(NumberParseUtils.digitSum('---')).assertEqual(0);
      expect(NumberParseUtils.digitSum('a1b2')).assertEqual(3);
      expect(NumberParseUtils.digitSum('!@#')).assertEqual(0);
      expect(NumberParseUtils.digitSum('  ')).assertEqual(0);
      expect(NumberParseUtils.digitSum('-45')).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_3000
     * @tc.name      testDigitSum0002
     * @tc.desc      Verify digitSum totals long digit runs exactly without
     *       overflow or precision loss.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDigitSum0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDigitSum0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.digitSum('999999999')).assertEqual(81);
      expect(NumberParseUtils.digitSum('1234567890')).assertEqual(45);
      expect(NumberParseUtils.digitSum('12345678901234567890')).assertEqual(90);
      let zeros: string = '';
      for (let i = 0; i < 30; i++) {
        zeros = zeros + '0';
      }
      expect(NumberParseUtils.digitSum(zeros)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_3100
     * @tc.name      testLeadingZeroTrim0001
     * @tc.desc      Verify leadingZeroTrim returns non-numeric strings and
     *               plus-signed input unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLeadingZeroTrim0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLeadingZeroTrim0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.leadingZeroTrim('')).assertEqual('');
      expect(NumberParseUtils.leadingZeroTrim('abc')).assertEqual('abc');
      expect(NumberParseUtils.leadingZeroTrim('12a')).assertEqual('12a');
      expect(NumberParseUtils.leadingZeroTrim('-abc')).assertEqual('-abc');
      expect(NumberParseUtils.leadingZeroTrim('+007')).assertEqual('+007');
      expect(NumberParseUtils.leadingZeroTrim('-12a')).assertEqual('-12a');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_3200
     * @tc.name      testLeadingZeroTrim0002
     * @tc.desc      Verify leadingZeroTrim keeps the minus sign for zero
     *               and zero-padded negative values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLeadingZeroTrim0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testLeadingZeroTrim0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.leadingZeroTrim('-0')).assertEqual('-0');
      expect(NumberParseUtils.leadingZeroTrim('-000')).assertEqual('-0');
      expect(NumberParseUtils.leadingZeroTrim('-007')).assertEqual('-7');
      expect(NumberParseUtils.leadingZeroTrim('-100')).assertEqual('-100');
      expect(NumberParseUtils.leadingZeroTrim('-000123')).assertEqual('-123');
      const padded: string = NumberParseUtils.leadingZeroTrim('-000123');
      expect(padded.charAt(0)).assertEqual('-');
      expect(padded).assertContain('123');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_3300
     * @tc.name      testLeadingZeroTrim0003
     * @tc.desc      Verify leadingZeroTrim collapses long zero runs and
     *               keeps inner zeros of padded values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLeadingZeroTrim0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testLeadingZeroTrim0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let zeros: string = '';
      for (let i = 0; i < 21; i++) {
        zeros = zeros + '0';
      }
      expect(NumberParseUtils.leadingZeroTrim(zeros)).assertEqual('0');
      expect(NumberParseUtils.leadingZeroTrim('0001000')).assertEqual('1000');
      expect(NumberParseUtils.leadingZeroTrim('0000000001')).assertEqual('1');
      expect(NumberParseUtils.leadingZeroTrim('-00000000000000000001')).assertEqual('-1');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_3400
     * @tc.name      testParseIntSafe0007
     * @tc.desc      Verify parseIntSafe parses whitespace wrapped 32-bit
     *               boundary values and compact signed magnitudes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseIntSafe0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParseIntSafe0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.parseIntSafe(' 2147483648 ')).assertEqual(2147483648);
      expect(NumberParseUtils.parseIntSafe(' -2147483648 ')).assertEqual(-2147483648);
      expect(NumberParseUtils.parseIntSafe(' 65536 ')).assertEqual(65536);
      expect(NumberParseUtils.parseIntSafe('+1000000')).assertEqual(1000000);
      expect(NumberParseUtils.parseIntSafe('-1000000')).assertEqual(-1000000);
      const padded: number = NumberParseUtils.parseIntSafe('  987654  ');
      expect(padded).assertEqual(987654);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_3500
     * @tc.name      testIsDigits0004
     * @tc.desc      Verify isDigits accepts long digit runs built by loops
     *               and rejects letters mixed into digit strings.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIsDigits0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testIsDigits0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let ones: string = '';
      for (let i = 0; i < 30; i++) {
        ones = ones + '1';
      }
      expect(NumberParseUtils.isDigits(ones)).assertTrue();
      expect(NumberParseUtils.isDigits('123456789012345678901234567890')).assertTrue();
      expect(NumberParseUtils.isDigits('abc123abc')).assertFalse();
      expect(NumberParseUtils.isDigits('0')).assertTrue();
      expect(NumberParseUtils.isDigits('00')).assertTrue();
      expect(NumberParseUtils.isDigits('9')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_3600
     * @tc.name      testToFixedText0004
     * @tc.desc      Verify toFixedText rounds half-way integer values away
     *               from zero and keeps single fraction digits stable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToFixedText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testToFixedText0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.toFixedText(0.4, 1)).assertEqual('0.4');
      expect(NumberParseUtils.toFixedText(0.6, 1)).assertEqual('0.6');
      expect(NumberParseUtils.toFixedText(2.7, 1)).assertEqual('2.7');
      expect(NumberParseUtils.toFixedText(5.5, 0)).assertEqual('6');
      expect(NumberParseUtils.toFixedText(4.5, 0)).assertEqual('5');
      expect(NumberParseUtils.toFixedText(-4.5, 0)).assertEqual('-5');
      expect(NumberParseUtils.toFixedText(1.5, 0)).assertEqual('2');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_3700
     * @tc.name      testFromHex0004
     * @tc.desc      Verify fromHex maps every single hex letter of both
     *               cases to its exact decimal place value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFromHex0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFromHex0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.fromHex('A')).assertEqual(10);
      expect(NumberParseUtils.fromHex('B')).assertEqual(11);
      expect(NumberParseUtils.fromHex('C')).assertEqual(12);
      expect(NumberParseUtils.fromHex('D')).assertEqual(13);
      expect(NumberParseUtils.fromHex('E')).assertEqual(14);
      expect(NumberParseUtils.fromHex('F')).assertEqual(15);
      expect(NumberParseUtils.fromHex('a')).assertEqual(10);
      expect(NumberParseUtils.fromHex('f')).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_3800
     * @tc.name      testToBinary0004
     * @tc.desc      Verify toBinary renders power-of-two decimals as a one
     *               bit followed by the exact number of zero bits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testToBinary0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testToBinary0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let pow15: string = '1';
      for (let i = 0; i < 15; i++) {
        pow15 = pow15 + '0';
      }
      expect(NumberParseUtils.toBinary('32768')).assertEqual(pow15);
      let pow16: string = '1';
      for (let i = 0; i < 16; i++) {
        pow16 = pow16 + '0';
      }
      expect(NumberParseUtils.toBinary('65536')).assertEqual(pow16);
      let pow31: string = '1';
      for (let i = 0; i < 31; i++) {
        pow31 = pow31 + '0';
      }
      const bigOut: string = NumberParseUtils.toBinary('2147483648');
      expect(bigOut).assertEqual(pow31);
      expect(bigOut.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_3900
     * @tc.name      testFromBinary0004
     * @tc.desc      Verify fromBinary resolves single-bit patterns built by
     *               loops into the exact power-of-two values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFromBinary0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testFromBinary0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let bits15: string = '1';
      for (let i = 0; i < 15; i++) {
        bits15 = bits15 + '0';
      }
      expect(NumberParseUtils.fromBinary(bits15)).assertEqual(32768);
      let bits16: string = '1';
      for (let i = 0; i < 16; i++) {
        bits16 = bits16 + '0';
      }
      expect(NumberParseUtils.fromBinary(bits16)).assertEqual(65536);
      let bits18: string = '1';
      for (let i = 0; i < 18; i++) {
        bits18 = bits18 + '0';
      }
      expect(NumberParseUtils.fromBinary(bits18)).assertEqual(262144);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NPEX_4000
     * @tc.name      testGroupThousands0004
     * @tc.desc      Verify groupThousands inserts separators at the correct
     *               positions for four to six digit strings.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGroupThousands0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testGroupThousands0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.groupThousands('1000', ',')).assertEqual('1,000');
      expect(NumberParseUtils.groupThousands('10000', ',')).assertEqual('10,000');
      expect(NumberParseUtils.groupThousands('100000', ',')).assertEqual('100,000');
      expect(NumberParseUtils.groupThousands('999999', ',')).assertEqual('999,999');
      expect(NumberParseUtils.groupThousands('12345', ',')).assertEqual('12,345');
      expect(NumberParseUtils.groupThousands('654321', ',')).assertEqual('654,321');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
