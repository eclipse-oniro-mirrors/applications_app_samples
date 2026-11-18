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

export default function numberParseLogicTest() {
  describe('NumberParseLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_0100
     * @tc.name      testParseIntSafe0001
     * @tc.desc      Verify parseIntSafe parses plain positive decimal
     *               integers of varying length into exact values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testParseIntSafe0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testParseIntSafe0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.parseIntSafe('0')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('1')).assertEqual(1);
      expect(NumberParseUtils.parseIntSafe('9')).assertEqual(9);
      expect(NumberParseUtils.parseIntSafe('10')).assertEqual(10);
      expect(NumberParseUtils.parseIntSafe('42')).assertEqual(42);
      expect(NumberParseUtils.parseIntSafe('999')).assertEqual(999);
      expect(NumberParseUtils.parseIntSafe('12345')).assertEqual(12345);
      const intMax: number = NumberParseUtils.parseIntSafe('2147483647');
      expect(intMax).assertEqual(2147483647);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_0200
     * @tc.name      testParseIntSafe0002
     * @tc.desc      Verify parseIntSafe accepts an optional sign prefix and
     *               surrounding whitespace for both positive and negative
     *               decimal integers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseIntSafe0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParseIntSafe0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.parseIntSafe('  -42  ')).assertEqual(-42);
      expect(NumberParseUtils.parseIntSafe('+7')).assertEqual(7);
      expect(NumberParseUtils.parseIntSafe('  +123 ')).assertEqual(123);
      expect(NumberParseUtils.parseIntSafe('-999999')).assertEqual(-999999);
      expect(NumberParseUtils.parseIntSafe('+0')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('-1')).assertEqual(-1);
      const spaced: number = NumberParseUtils.parseIntSafe(' 8 ');
      expect(spaced).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_0300
     * @tc.name      testParseIntSafe0003
     * @tc.desc      Verify parseIntSafe strips leading zeros as plain number
     *               text and keeps the maximum safe integer exact.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseIntSafe0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testParseIntSafe0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.parseIntSafe('007')).assertEqual(7);
      expect(NumberParseUtils.parseIntSafe('000123')).assertEqual(123);
      expect(NumberParseUtils.parseIntSafe('0000')).assertEqual(0);
      const maxSafe: number = NumberParseUtils.parseIntSafe('9007199254740991');
      expect(maxSafe).assertEqual(9007199254740991);
      const negMaxSafe: number = NumberParseUtils.parseIntSafe('-9007199254740991');
      expect(negMaxSafe).assertEqual(-9007199254740991);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_0400
     * @tc.name      testParseIntSafe0004
     * @tc.desc      Verify parseIntSafe trims tab and carriage-return style
     *               whitespace the same way as plain spaces.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testParseIntSafe0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testParseIntSafe0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const tabbed: number = NumberParseUtils.parseIntSafe('\t42\n');
      expect(tabbed).assertEqual(42);
      const mixed: number = NumberParseUtils.parseIntSafe(' \t 8 \r ');
      expect(mixed).assertEqual(8);
      const inner: number = NumberParseUtils.parseIntSafe(' \t\n 5 \t ');
      expect(inner).assertEqual(5);
      expect(NumberParseUtils.parseIntSafe('\t\t')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_0500
     * @tc.name      testIsDigits0001
     * @tc.desc      Verify isDigits returns true for non-empty strings made
     *               only of decimal digit characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsDigits0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIsDigits0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.isDigits('0')).assertTrue();
      expect(NumberParseUtils.isDigits('1')).assertTrue();
      expect(NumberParseUtils.isDigits('123')).assertTrue();
      expect(NumberParseUtils.isDigits('007')).assertTrue();
      expect(NumberParseUtils.isDigits('999999')).assertTrue();
      expect(NumberParseUtils.isDigits('0000000000')).assertTrue();
      expect(NumberParseUtils.isDigits('90210')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_0600
     * @tc.name      testIsDigits0002
     * @tc.desc      Verify isDigits returns false for empty strings and for
     *               strings containing letters, signs or spaces.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsDigits0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIsDigits0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.isDigits('')).assertFalse();
      expect(NumberParseUtils.isDigits('12a')).assertFalse();
      expect(NumberParseUtils.isDigits(' 12')).assertFalse();
      expect(NumberParseUtils.isDigits('12 ')).assertFalse();
      expect(NumberParseUtils.isDigits('1 2')).assertFalse();
      expect(NumberParseUtils.isDigits('+5')).assertFalse();
      expect(NumberParseUtils.isDigits('-1')).assertFalse();
      expect(NumberParseUtils.isDigits('a')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_0700
     * @tc.name      testClampInt0001
     * @tc.desc      Verify clampInt keeps in-range values untouched and
     *               clamps out-of-range values to the nearest bound.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampInt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testClampInt0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.clampInt(5, 0, 10)).assertEqual(5);
      expect(NumberParseUtils.clampInt(15, 0, 10)).assertEqual(10);
      expect(NumberParseUtils.clampInt(-5, 0, 10)).assertEqual(0);
      expect(NumberParseUtils.clampInt(0, 0, 10)).assertEqual(0);
      expect(NumberParseUtils.clampInt(10, 0, 10)).assertEqual(10);
      const below: number = NumberParseUtils.clampInt(-100, -50, 50);
      expect(below).assertEqual(-50);
      const above: number = NumberParseUtils.clampInt(100, -50, 50);
      expect(above).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_0800
     * @tc.name      testClampInt0002
     * @tc.desc      Verify clampInt works on negative intervals and on a
     *               single-point interval where min equals max.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClampInt0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testClampInt0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.clampInt(0, -3, 3)).assertEqual(0);
      expect(NumberParseUtils.clampInt(10, -3, 3)).assertEqual(3);
      expect(NumberParseUtils.clampInt(-3, -3, 3)).assertEqual(-3);
      expect(NumberParseUtils.clampInt(7, 7, 7)).assertEqual(7);
      expect(NumberParseUtils.clampInt(100, -1, 1)).assertEqual(1);
      expect(NumberParseUtils.clampInt(-100, -1, 1)).assertEqual(-1);
      const point: number = NumberParseUtils.clampInt(-9, -9, -9);
      expect(point).assertEqual(-9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_0900
     * @tc.name      testToFixedText0001
     * @tc.desc      Verify toFixedText renders fraction digits with correct
     *               rounding for common decimal fractions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testToFixedText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testToFixedText0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const pi2: string = NumberParseUtils.toFixedText(3.14159, 2);
      expect(pi2).assertEqual('3.14');
      const quarter: string = NumberParseUtils.toFixedText(1.25, 1);
      expect(quarter).assertEqual('1.3');
      const third: string = NumberParseUtils.toFixedText(1 / 3, 8);
      expect(third).assertEqual('0.33333333');
      const zero3: string = NumberParseUtils.toFixedText(0, 3);
      expect(zero3).assertEqual('0.000');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_1000
     * @tc.name      testToFixedText0002
     * @tc.desc      Verify toFixedText keeps the sign for negative values
     *               and rounds half-away-from-zero at digit zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToFixedText0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testToFixedText0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.toFixedText(5, 0)).assertEqual('5');
      expect(NumberParseUtils.toFixedText(-5, 0)).assertEqual('-5');
      expect(NumberParseUtils.toFixedText(2.5, 0)).assertEqual('3');
      expect(NumberParseUtils.toFixedText(-2.5, 0)).assertEqual('-3');
      expect(NumberParseUtils.toFixedText(0.5, 0)).assertEqual('1');
      const wide: string = NumberParseUtils.toFixedText(123.456, 8);
      expect(wide).assertEqual('123.45600000');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_1100
     * @tc.name      testToFixedText0003
     * @tc.desc      Verify toFixedText falls back to plain toString() when
     *               digits is out of the 0..8 range or not an integer.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToFixedText0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testToFixedText0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const tooBig: string = NumberParseUtils.toFixedText(3.7, 9);
      expect(tooBig).assertEqual('3.7');
      const negative: string = NumberParseUtils.toFixedText(3.7, -1);
      expect(negative).assertEqual('3.7');
      const fractional: string = NumberParseUtils.toFixedText(3.7, 1.5);
      expect(fractional).assertEqual('3.7');
      const halfDigits: string = NumberParseUtils.toFixedText(42, 0.5);
      expect(halfDigits).assertEqual('42');
      const zeroZero: string = NumberParseUtils.toFixedText(0, 0);
      expect(zeroZero).assertEqual('0');
      const maxDigits: string = NumberParseUtils.toFixedText(0, 8);
      expect(maxDigits).assertEqual('0.00000000');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_1200
     * @tc.name      testGroupThousands0001
     * @tc.desc      Verify groupThousands inserts separators every three
     *               digits for comma and underscore separators.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGroupThousands0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testGroupThousands0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.groupThousands('0', ',')).assertEqual('0');
      expect(NumberParseUtils.groupThousands('12', ',')).assertEqual('12');
      expect(NumberParseUtils.groupThousands('123', ',')).assertEqual('123');
      expect(NumberParseUtils.groupThousands('1234', ',')).assertEqual('1,234');
      const big: string = NumberParseUtils.groupThousands('1234567', ',');
      expect(big).assertEqual('1,234,567');
      expect(big).assertContain('234');
      const underscore: string = NumberParseUtils.groupThousands('1000000', '_');
      expect(underscore).assertEqual('1_000_000');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_1300
     * @tc.name      testGroupThousands0002
     * @tc.desc      Verify groupThousands preserves a single leading sign
     *               and supports multi-character and empty separators.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testGroupThousands0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testGroupThousands0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const negative: string = NumberParseUtils.groupThousands('-1234', ',');
      expect(negative).assertEqual('-1,234');
      const positive: string = NumberParseUtils.groupThousands('+98765', ' ');
      expect(positive).assertEqual('+98 765');
      const long: string = NumberParseUtils.groupThousands('123456789', ',');
      expect(long).assertEqual('123,456,789');
      const emptySep: string = NumberParseUtils.groupThousands('1234', '');
      expect(emptySep).assertEqual('1234');
      expect(NumberParseUtils.groupThousands('9', ',')).assertEqual('9');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_1400
     * @tc.name      testToHex0001
     * @tc.desc      Verify toHex converts small non-negative decimal strings
     *               to uppercase hexadecimal without any prefix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testToHex0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testToHex0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.toHex('0')).assertEqual('0');
      expect(NumberParseUtils.toHex('1')).assertEqual('1');
      expect(NumberParseUtils.toHex('9')).assertEqual('9');
      expect(NumberParseUtils.toHex('10')).assertEqual('A');
      expect(NumberParseUtils.toHex('15')).assertEqual('F');
      expect(NumberParseUtils.toHex('16')).assertEqual('10');
      expect(NumberParseUtils.toHex('32')).assertEqual('20');
      expect(NumberParseUtils.toHex('100')).assertEqual('64');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_1500
     * @tc.name      testToHex0002
     * @tc.desc      Verify toHex converts large decimal strings exactly up
     *               to the 32-bit boundary using string division.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testToHex0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testToHex0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.toHex('255')).assertEqual('FF');
      expect(NumberParseUtils.toHex('256')).assertEqual('100');
      expect(NumberParseUtils.toHex('4095')).assertEqual('FFF');
      expect(NumberParseUtils.toHex('4096')).assertEqual('1000');
      expect(NumberParseUtils.toHex('65535')).assertEqual('FFFF');
      const mega: string = NumberParseUtils.toHex('1048576');
      expect(mega).assertEqual('100000');
      const uint32: string = NumberParseUtils.toHex('4294967295');
      expect(uint32).assertEqual('FFFFFFFF');
      expect(uint32.length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_1600
     * @tc.name      testToHex0003
     * @tc.desc      Verify toHex treats leading zeros as plain number text
     *               and returns the shortest canonical hexadecimal form.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToHex0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testToHex0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.toHex('007')).assertEqual('7');
      expect(NumberParseUtils.toHex('0000')).assertEqual('0');
      expect(NumberParseUtils.toHex('000255')).assertEqual('FF');
      const zeroPad: string = NumberParseUtils.toHex('00010');
      expect(zeroPad).assertEqual('A');
      expect(zeroPad.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_1700
     * @tc.name      testFromHex0001
     * @tc.desc      Verify fromHex converts hexadecimal strings in upper and
     *               lower case into the expected decimal numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFromHex0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFromHex0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.fromHex('0')).assertEqual(0);
      expect(NumberParseUtils.fromHex('FF')).assertEqual(255);
      expect(NumberParseUtils.fromHex('ff')).assertEqual(255);
      expect(NumberParseUtils.fromHex('10')).assertEqual(16);
      expect(NumberParseUtils.fromHex('1A')).assertEqual(26);
      expect(NumberParseUtils.fromHex('aF')).assertEqual(175);
      expect(NumberParseUtils.fromHex('100')).assertEqual(256);
      expect(NumberParseUtils.fromHex('FFFF')).assertEqual(65535);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_1800
     * @tc.name      testFromHex0002
     * @tc.desc      Verify fromHex handles the signed 32-bit maximum, a
     *               mixed-case long literal and the 2^52 power of two.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFromHex0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testFromHex0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const intMax: number = NumberParseUtils.fromHex('7FFFFFFF');
      expect(intMax).assertEqual(2147483647);
      const pow52: number = NumberParseUtils.fromHex('10000000000000');
      expect(pow52).assertEqual(4503599627370496);
      const mixed: number = NumberParseUtils.fromHex('AbCdEf');
      expect(mixed).assertEqual(11259375);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_1900
     * @tc.name      testFromHex0003
     * @tc.desc      Verify toHex and fromHex round-trip decimal strings of
     *               increasing size without any precision loss.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFromHex0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFromHex0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.fromHex(NumberParseUtils.toHex('5'))).assertEqual(5);
      expect(NumberParseUtils.fromHex(NumberParseUtils.toHex('255'))).assertEqual(255);
      expect(NumberParseUtils.fromHex(NumberParseUtils.toHex('4096'))).assertEqual(4096);
      expect(NumberParseUtils.fromHex(NumberParseUtils.toHex('65535'))).assertEqual(65535);
      const mega: number = NumberParseUtils.fromHex(NumberParseUtils.toHex('1048576'));
      expect(mega).assertEqual(1048576);
      const hexText: string = NumberParseUtils.toHex('1048576');
      expect(hexText).assertEqual('100000');
      expect(hexText.charAt(0)).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_2000
     * @tc.name      testToBinary0001
     * @tc.desc      Verify toBinary converts small non-negative decimal
     *               strings into canonical binary text without a prefix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testToBinary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testToBinary0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.toBinary('0')).assertEqual('0');
      expect(NumberParseUtils.toBinary('1')).assertEqual('1');
      expect(NumberParseUtils.toBinary('2')).assertEqual('10');
      expect(NumberParseUtils.toBinary('5')).assertEqual('101');
      expect(NumberParseUtils.toBinary('10')).assertEqual('1010');
      expect(NumberParseUtils.toBinary('12')).assertEqual('1100');
      const byte: string = NumberParseUtils.toBinary('8');
      expect(byte).assertEqual('1000');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_2100
     * @tc.name      testToBinary0002
     * @tc.desc      Verify toBinary renders byte, word and 2^20 boundaries
     *               as the expected runs of ones and zeros.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testToBinary0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testToBinary0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.toBinary('255')).assertEqual('11111111');
      expect(NumberParseUtils.toBinary('256')).assertEqual('100000000');
      expect(NumberParseUtils.toBinary('1023')).assertEqual('1111111111');
      const word: string = NumberParseUtils.toBinary('65535');
      expect(word).assertEqual('1111111111111111');
      expect(word.length).assertEqual(16);
      const mega: string = NumberParseUtils.toBinary('1048576');
      expect(mega).assertEqual('100000000000000000000');
      expect(mega.length).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_2200
     * @tc.name      testFromBinary0001
     * @tc.desc      Verify fromBinary converts binary strings including
     *               leading-zero forms into exact decimal numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFromBinary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFromBinary0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.fromBinary('0')).assertEqual(0);
      expect(NumberParseUtils.fromBinary('1')).assertEqual(1);
      expect(NumberParseUtils.fromBinary('10')).assertEqual(2);
      expect(NumberParseUtils.fromBinary('1010')).assertEqual(10);
      expect(NumberParseUtils.fromBinary('11111111')).assertEqual(255);
      expect(NumberParseUtils.fromBinary('111')).assertEqual(7);
      expect(NumberParseUtils.fromBinary('100000')).assertEqual(32);
      expect(NumberParseUtils.fromBinary('0110')).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_2300
     * @tc.name      testFromBinary0002
     * @tc.desc      Verify fromBinary stays exact for the 2^31-1 and 2^53-1
     *               all-one patterns built by string repetition.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFromBinary0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testFromBinary0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let bits31: string = '';
      for (let i = 0; i < 31; i++) {
        bits31 = bits31 + '1';
      }
      expect(bits31.length).assertEqual(31);
      const intMax: number = NumberParseUtils.fromBinary(bits31);
      expect(intMax).assertEqual(2147483647);
      let bits53: string = '';
      for (let i = 0; i < 53; i++) {
        bits53 = bits53 + '1';
      }
      const maxSafe: number = NumberParseUtils.fromBinary(bits53);
      expect(maxSafe).assertEqual(9007199254740991);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_2400
     * @tc.name      testDigitSum0001
     * @tc.desc      Verify digitSum adds every decimal digit character and
     *               returns zero for digit-free input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDigitSum0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDigitSum0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.digitSum('123')).assertEqual(6);
      expect(NumberParseUtils.digitSum('4567')).assertEqual(22);
      expect(NumberParseUtils.digitSum('99999')).assertEqual(45);
      expect(NumberParseUtils.digitSum('000')).assertEqual(0);
      expect(NumberParseUtils.digitSum('10')).assertEqual(1);
      expect(NumberParseUtils.digitSum('505')).assertEqual(10);
      const mixedSum: number = NumberParseUtils.digitSum('a1b2c3');
      expect(mixedSum).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_2500
     * @tc.name      testLeadingZeroTrim0001
     * @tc.desc      Verify leadingZeroTrim strips leading zeros from plain
     *               digit strings and collapses all-zero input to '0'.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLeadingZeroTrim0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testLeadingZeroTrim0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.leadingZeroTrim('007')).assertEqual('7');
      expect(NumberParseUtils.leadingZeroTrim('0')).assertEqual('0');
      expect(NumberParseUtils.leadingZeroTrim('0000')).assertEqual('0');
      expect(NumberParseUtils.leadingZeroTrim('100')).assertEqual('100');
      expect(NumberParseUtils.leadingZeroTrim('0123')).assertEqual('123');
      const many: string = NumberParseUtils.leadingZeroTrim('000000001');
      expect(many).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_2600
     * @tc.name      testLeadingZeroTrim0002
     * @tc.desc      Verify leadingZeroTrim keeps the minus sign while
     *               trimming zeros for negative integer strings.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLeadingZeroTrim0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testLeadingZeroTrim0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.leadingZeroTrim('-007')).assertEqual('-7');
      expect(NumberParseUtils.leadingZeroTrim('-0')).assertEqual('-0');
      expect(NumberParseUtils.leadingZeroTrim('-000')).assertEqual('-0');
      expect(NumberParseUtils.leadingZeroTrim('-100')).assertEqual('-100');
      const negMany: string = NumberParseUtils.leadingZeroTrim('-000123');
      expect(negMany).assertEqual('-123');
      expect(negMany.charAt(0)).assertEqual('-');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_2700
     * @tc.name      testParseIntSafe0005
     * @tc.desc      Verify parseIntSafe rejects whitespace between the sign
     *               and the digits while accepting compact signed forms.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testParseIntSafe0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testParseIntSafe0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.parseIntSafe(' +42 ')).assertEqual(42);
      expect(NumberParseUtils.parseIntSafe('- 7')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('  -0  ')).assertEqual(0);
      expect(NumberParseUtils.parseIntSafe('+456789')).assertEqual(456789);
      expect(NumberParseUtils.parseIntSafe('-321')).assertEqual(-321);
      const tabSign: number = NumberParseUtils.parseIntSafe('\t+11\t');
      expect(tabSign).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_2800
     * @tc.name      testIsDigits0003
     * @tc.desc      Verify isDigits accepts single digits and long all-zero
     *               digit runs while rejecting letters and dots.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsDigits0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIsDigits0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.isDigits('0')).assertTrue();
      expect(NumberParseUtils.isDigits('9')).assertTrue();
      expect(NumberParseUtils.isDigits('42')).assertTrue();
      expect(NumberParseUtils.isDigits('1234567890')).assertTrue();
      let zeros: string = '';
      for (let i = 0; i < 24; i++) {
        zeros = zeros + '0';
      }
      expect(NumberParseUtils.isDigits(zeros)).assertTrue();
      expect(NumberParseUtils.isDigits('X')).assertFalse();
      expect(NumberParseUtils.isDigits('1.5')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_2900
     * @tc.name      testClampInt0003
     * @tc.desc      Verify clampInt keeps both endpoints and the center of a
     *               symmetric range and clamps values just outside it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampInt0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testClampInt0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.clampInt(0, -5, 5)).assertEqual(0);
      expect(NumberParseUtils.clampInt(5, -5, 5)).assertEqual(5);
      expect(NumberParseUtils.clampInt(-5, -5, 5)).assertEqual(-5);
      expect(NumberParseUtils.clampInt(3, -3, 3)).assertEqual(3);
      expect(NumberParseUtils.clampInt(-3, -3, 3)).assertEqual(-3);
      expect(NumberParseUtils.clampInt(0, -1, 1)).assertEqual(0);
      expect(NumberParseUtils.clampInt(-6, -5, 5)).assertEqual(-5);
      expect(NumberParseUtils.clampInt(6, -5, 5)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_3000
     * @tc.name      testToFixedText0004
     * @tc.desc      Verify toFixedText keeps one fraction digit intact and
     *               rounds known floating point tie cases downward.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToFixedText0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testToFixedText0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.toFixedText(2.5, 1)).assertEqual('2.5');
      expect(NumberParseUtils.toFixedText(-2.5, 1)).assertEqual('-2.5');
      expect(NumberParseUtils.toFixedText(0.5, 1)).assertEqual('0.5');
      expect(NumberParseUtils.toFixedText(1.005, 2)).assertEqual('1.00');
      expect(NumberParseUtils.toFixedText(2.675, 2)).assertEqual('2.67');
      expect(NumberParseUtils.toFixedText(0.615, 2)).assertEqual('0.61');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_3100
     * @tc.name      testGroupThousands0003
     * @tc.desc      Verify groupThousands supports custom separators including
     *               multi-character ones and the empty separator.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGroupThousands0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testGroupThousands0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.groupThousands('1234567', ' ')).assertEqual('1 234 567');
      expect(NumberParseUtils.groupThousands('1234567', '-')).assertEqual('1-234-567');
      expect(NumberParseUtils.groupThousands('1234567', '::')).assertEqual('1::234::567');
      expect(NumberParseUtils.groupThousands('1234567', '')).assertEqual('1234567');
      expect(NumberParseUtils.groupThousands('4321', ',')).assertEqual('4,321');
      expect(NumberParseUtils.groupThousands('54321', '.')).assertEqual('54.321');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_3200
     * @tc.name      testToHex0004
     * @tc.desc      Verify toHex maps power-of-two decimals to their
     *               canonical uppercase hexadecimal forms.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testToHex0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testToHex0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.toHex('64')).assertEqual('40');
      expect(NumberParseUtils.toHex('128')).assertEqual('80');
      expect(NumberParseUtils.toHex('512')).assertEqual('200');
      expect(NumberParseUtils.toHex('1024')).assertEqual('400');
      expect(NumberParseUtils.toHex('2048')).assertEqual('800');
      expect(NumberParseUtils.toHex('8192')).assertEqual('2000');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_3300
     * @tc.name      testFromHex0004
     * @tc.desc      Verify fromHex resolves hex place values and accepts
     *               mixed case letters in either position.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testFromHex0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testFromHex0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.fromHex('100')).assertEqual(256);
      expect(NumberParseUtils.fromHex('1000')).assertEqual(4096);
      expect(NumberParseUtils.fromHex('10000')).assertEqual(65536);
      expect(NumberParseUtils.fromHex('F0')).assertEqual(240);
      expect(NumberParseUtils.fromHex('0F')).assertEqual(15);
      expect(NumberParseUtils.fromHex('FF')).assertEqual(255);
      expect(NumberParseUtils.fromHex('fF')).assertEqual(255);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_3400
     * @tc.name      testToBinary0003
     * @tc.desc      Verify toBinary converts small powers of two into a
     *               single one bit followed by zeros.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testToBinary0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testToBinary0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.toBinary('2')).assertEqual('10');
      expect(NumberParseUtils.toBinary('4')).assertEqual('100');
      expect(NumberParseUtils.toBinary('8')).assertEqual('1000');
      expect(NumberParseUtils.toBinary('16')).assertEqual('10000');
      expect(NumberParseUtils.toBinary('32')).assertEqual('100000');
      expect(NumberParseUtils.toBinary('64')).assertEqual('1000000');
      expect(NumberParseUtils.toBinary('128')).assertEqual('10000000');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_3500
     * @tc.name      testFromBinary0003
     * @tc.desc      Verify fromBinary resolves binary place values and mixed
     *               bit patterns into exact decimal numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFromBinary0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testFromBinary0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.fromBinary('10000')).assertEqual(16);
      expect(NumberParseUtils.fromBinary('1000000')).assertEqual(64);
      expect(NumberParseUtils.fromBinary('10000000')).assertEqual(128);
      expect(NumberParseUtils.fromBinary('11000')).assertEqual(24);
      expect(NumberParseUtils.fromBinary('10010')).assertEqual(18);
      expect(NumberParseUtils.fromBinary('11110000')).assertEqual(240);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_3600
     * @tc.name      testDigitSum0002
     * @tc.desc      Verify digitSum accumulates repeated digits and long
     *               digit runs into exact totals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDigitSum0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testDigitSum0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.digitSum('111')).assertEqual(3);
      expect(NumberParseUtils.digitSum('2222')).assertEqual(8);
      expect(NumberParseUtils.digitSum('19')).assertEqual(10);
      expect(NumberParseUtils.digitSum('90')).assertEqual(9);
      expect(NumberParseUtils.digitSum('99')).assertEqual(18);
      expect(NumberParseUtils.digitSum('5')).assertEqual(5);
      let nines: string = '';
      for (let i = 0; i < 20; i++) {
        nines = nines + '9';
      }
      const ninesSum: number = NumberParseUtils.digitSum(nines);
      expect(ninesSum).assertEqual(180);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_NUMP_3700
     * @tc.name      testLeadingZeroTrim0003
     * @tc.desc      Verify leadingZeroTrim keeps inner zeros, collapses long
     *               zero runs and handles negative zero-padded values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testLeadingZeroTrim0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const TAG: string = 'testLeadingZeroTrim0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberParseUtils.leadingZeroTrim('0001000')).assertEqual('1000');
      expect(NumberParseUtils.leadingZeroTrim('1')).assertEqual('1');
      expect(NumberParseUtils.leadingZeroTrim('01')).assertEqual('1');
      let zeros21: string = '';
      for (let i = 0; i < 21; i++) {
        zeros21 = zeros21 + '0';
      }
      expect(NumberParseUtils.leadingZeroTrim(zeros21)).assertEqual('0');
      expect(NumberParseUtils.leadingZeroTrim('-00000000000000000001')).assertEqual('-1');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
