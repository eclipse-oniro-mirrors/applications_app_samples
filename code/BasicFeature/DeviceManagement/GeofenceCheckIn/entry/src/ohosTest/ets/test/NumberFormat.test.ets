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


import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { NumberFormatUtil } from './support/NumberFormatUtil';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_NUMFMT]';

interface GroupCase {
  input: number;
  expected: string;
}

const GROUP_CASES: GroupCase[] = [
  { input: 0, expected: '0' },
  { input: 1, expected: '1' },
  { input: 9, expected: '9' },
  { input: 10, expected: '10' },
  { input: 99, expected: '99' },
  { input: 100, expected: '100' },
  { input: 999, expected: '999' },
  { input: 1000, expected: '1,000' },
  { input: 1001, expected: '1,001' },
  { input: 9999, expected: '9,999' },
  { input: 10000, expected: '10,000' },
  { input: 99999, expected: '99,999' },
  { input: 100000, expected: '100,000' },
  { input: 999999, expected: '999,999' },
  { input: 1000000, expected: '1,000,000' },
  { input: 1234567, expected: '1,234,567' },
  { input: 123456789, expected: '123,456,789' },
  { input: 1000000000, expected: '1,000,000,000' },
  { input: -1, expected: '-1' },
  { input: -999, expected: '-999' },
  { input: -1000, expected: '-1,000' },
  { input: -1234567, expected: '-1,234,567' },
];

interface PadCase {
  input: number;
  width: number;
  pad: string;
  expected: string;
}

const PAD_CASES: PadCase[] = [
  { input: 0, width: 1, pad: '0', expected: '0' },
  { input: 0, width: 2, pad: '0', expected: '00' },
  { input: 0, width: 3, pad: '0', expected: '000' },
  { input: 5, width: 2, pad: '_', expected: '_5' },
  { input: 5, width: 3, pad: '_', expected: '__5' },
  { input: 9, width: 4, pad: ' ', expected: '   9' },
  { input: 42, width: 2, pad: '0', expected: '42' },
  { input: 42, width: 5, pad: '0', expected: '00042' },
  { input: 123, width: 3, pad: '0', expected: '123' },
  { input: 123, width: 6, pad: '0', expected: '000123' },
  { input: -5, width: 4, pad: '0', expected: '00-5' },
  { input: 7, width: 0, pad: '0', expected: '7' },
];

interface RomanCase {
  input: number;
  expected: string;
}

const ROMAN_CASES: RomanCase[] = [
  { input: 1, expected: 'I' },
  { input: 2, expected: 'II' },
  { input: 3, expected: 'III' },
  { input: 4, expected: 'IV' },
  { input: 5, expected: 'V' },
  { input: 6, expected: 'VI' },
  { input: 7, expected: 'VII' },
  { input: 8, expected: 'VIII' },
  { input: 9, expected: 'IX' },
  { input: 10, expected: 'X' },
  { input: 11, expected: 'XI' },
  { input: 12, expected: 'XII' },
  { input: 13, expected: 'XIII' },
  { input: 14, expected: 'XIV' },
  { input: 15, expected: 'XV' },
  { input: 16, expected: 'XVI' },
  { input: 17, expected: 'XVII' },
  { input: 18, expected: 'XVIII' },
  { input: 19, expected: 'XIX' },
  { input: 20, expected: 'XX' },
  { input: 21, expected: 'XXI' },
  { input: 22, expected: 'XXII' },
  { input: 23, expected: 'XXIII' },
  { input: 24, expected: 'XXIV' },
  { input: 25, expected: 'XXV' },
  { input: 26, expected: 'XXVI' },
  { input: 27, expected: 'XXVII' },
  { input: 28, expected: 'XXVIII' },
  { input: 29, expected: 'XXIX' },
  { input: 30, expected: 'XXX' },
  { input: 40, expected: 'XL' },
  { input: 50, expected: 'L' },
  { input: 90, expected: 'XC' },
  { input: 100, expected: 'C' },
  { input: 400, expected: 'CD' },
  { input: 500, expected: 'D' },
  { input: 900, expected: 'CM' },
  { input: 1000, expected: 'M' },
  { input: 1994, expected: 'MCMXCIV' },
  { input: 2024, expected: 'MMXXIV' },
  { input: 3999, expected: 'MMMCMXCIX' },
  { input: 0, expected: '' },
  { input: 4000, expected: '' },
];

interface BaseCase {
  input: number;
  base: number;
  expected: string;
}

const BASE_CASES: BaseCase[] = [
  { input: 0, base: 2, expected: '0' },
  { input: 0, base: 8, expected: '0' },
  { input: 0, base: 16, expected: '0' },
  { input: 0, base: 36, expected: '0' },
  { input: 1, base: 2, expected: '1' },
  { input: 1, base: 8, expected: '1' },
  { input: 1, base: 16, expected: '1' },
  { input: 1, base: 36, expected: '1' },
  { input: 2, base: 2, expected: '10' },
  { input: 2, base: 8, expected: '2' },
  { input: 2, base: 16, expected: '2' },
  { input: 2, base: 36, expected: '2' },
  { input: 7, base: 2, expected: '111' },
  { input: 7, base: 8, expected: '7' },
  { input: 7, base: 16, expected: '7' },
  { input: 7, base: 36, expected: '7' },
  { input: 8, base: 2, expected: '1000' },
  { input: 8, base: 8, expected: '10' },
  { input: 8, base: 16, expected: '8' },
  { input: 8, base: 36, expected: '8' },
  { input: 9, base: 2, expected: '1001' },
  { input: 9, base: 8, expected: '11' },
  { input: 9, base: 16, expected: '9' },
  { input: 9, base: 36, expected: '9' },
  { input: 10, base: 2, expected: '1010' },
  { input: 10, base: 8, expected: '12' },
  { input: 10, base: 16, expected: 'A' },
  { input: 10, base: 36, expected: 'A' },
  { input: 15, base: 2, expected: '1111' },
  { input: 15, base: 8, expected: '17' },
  { input: 15, base: 16, expected: 'F' },
  { input: 15, base: 36, expected: 'F' },
  { input: 16, base: 2, expected: '10000' },
  { input: 16, base: 8, expected: '20' },
  { input: 16, base: 16, expected: '10' },
  { input: 16, base: 36, expected: 'G' },
  { input: 31, base: 2, expected: '11111' },
  { input: 31, base: 8, expected: '37' },
  { input: 31, base: 16, expected: '1F' },
  { input: 31, base: 36, expected: 'V' },
  { input: 32, base: 2, expected: '100000' },
  { input: 32, base: 8, expected: '40' },
  { input: 32, base: 16, expected: '20' },
  { input: 32, base: 36, expected: 'W' },
  { input: 100, base: 2, expected: '1100100' },
  { input: 100, base: 8, expected: '144' },
  { input: 100, base: 16, expected: '64' },
  { input: 100, base: 36, expected: '2S' },
  { input: 255, base: 2, expected: '11111111' },
  { input: 255, base: 8, expected: '377' },
  { input: 255, base: 16, expected: 'FF' },
  { input: 255, base: 36, expected: '73' },
  { input: 1024, base: 2, expected: '10000000000' },
  { input: 1024, base: 8, expected: '2000' },
  { input: 1024, base: 16, expected: '400' },
  { input: 1024, base: 36, expected: 'SG' },
];

interface FixedCase {
  input: number;
  digits: number;
  expected: string;
}

const FIXED_CASES: FixedCase[] = [
  { input: 0, digits: 0, expected: '0' },
  { input: 0, digits: 2, expected: '0.00' },
  { input: 1.5, digits: 0, expected: '2' },
  { input: 1.5, digits: 1, expected: '1.5' },
  { input: 1.5, digits: 3, expected: '1.500' },
  { input: 2.345, digits: 2, expected: '2.35' },
  { input: -2.345, digits: 2, expected: '-2.35' },
  { input: 123.456, digits: 1, expected: '123.5' },
  { input: 0.005, digits: 2, expected: '0.01' },
  { input: 999.999, digits: 2, expected: '1000.00' },
  { input: 3.14159, digits: 5, expected: '3.14159' },
  { input: 3.14159, digits: -1, expected: '3' },
  { input: 3.14159, digits: 12, expected: '3.1415900000' },
];

interface AbbreviateCase {
  input: number;
  expected: string;
}

const ABBREVIATE_CASES: AbbreviateCase[] = [
  { input: 0, expected: '0' },
  { input: 1, expected: '1' },
  { input: 999, expected: '999' },
  { input: 1000, expected: '1.0K' },
  { input: 1500, expected: '1.5K' },
  { input: 999999, expected: '1000.0K' },
  { input: 1000000, expected: '1.0M' },
  { input: 2500000, expected: '2.5M' },
  { input: 999999999, expected: '1000.0M' },
  { input: 1000000000, expected: '1.0B' },
  { input: 1500000000, expected: '1.5B' },
  { input: -1500, expected: '-1.5K' },
  { input: -2500000, expected: '-2.5M' },
];

export default function numberFormatMatrixTest() {
  describe('NumberFormatMatrixTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'NumberFormatMatrixTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'NumberFormatMatrixTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMFMT_0100
     * @tc.name      testGroupThousands0001
     * @tc.desc      Verify groupThousands inserts comma separators every three digits and keeps the sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGroupThousands0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testGroupThousands0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < GROUP_CASES.length; i++) {
        const row: GroupCase = GROUP_CASES[i];
        expect(NumberFormatUtil.groupThousands(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(GROUP_CASES.length);
      expect(GROUP_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'groupThousands rows checked: ' + checked);
      expect(NumberFormatUtil.groupThousands(0)).assertEqual('0');
      expect(NumberFormatUtil.groupThousands(1000)).assertEqual('1,000');
      expect(NumberFormatUtil.groupThousands(-1000)).assertEqual('-1,000');
      expect(NumberFormatUtil.groupThousands(1234567)).assertEqual('1,234,567');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMFMT_0200
     * @tc.name      testPadLeft0002
     * @tc.desc      Verify padLeft fills the requested width with the first pad character only.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPadLeft0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPadLeft0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < PAD_CASES.length; i++) {
        const row: PadCase = PAD_CASES[i];
        expect(NumberFormatUtil.padLeft(row.input, row.width, row.pad)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(PAD_CASES.length);
      expect(PAD_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'padLeft rows checked: ' + checked);
      expect(NumberFormatUtil.padLeft(1, 3, '0')).assertEqual('001');
      expect(NumberFormatUtil.padLeft(1, 1, '0')).assertEqual('1');
      expect(NumberFormatUtil.padLeft(1, 0, '0')).assertEqual('1');
      expect(NumberFormatUtil.padLeft(1, 4, '')).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMFMT_0300
     * @tc.name      testToRoman0003
     * @tc.desc      Verify toRoman converts values inside the classic range and rejects values outside it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testToRoman0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testToRoman0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < ROMAN_CASES.length; i++) {
        const row: RomanCase = ROMAN_CASES[i];
        expect(NumberFormatUtil.toRoman(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(ROMAN_CASES.length);
      expect(ROMAN_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'toRoman rows checked: ' + checked);
      expect(NumberFormatUtil.toRoman(1)).assertEqual('I');
      expect(NumberFormatUtil.toRoman(4)).assertEqual('IV');
      expect(NumberFormatUtil.toRoman(9)).assertEqual('IX');
      expect(NumberFormatUtil.toRoman(3999).length).assertEqual(9);
      expect(NumberFormatUtil.toRoman(-1)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMFMT_0400
     * @tc.name      testToBaseString0004
     * @tc.desc      Verify toBaseString converts values into binary, octal, hexadecimal and base 36 text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testToBaseString0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testToBaseString0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < BASE_CASES.length; i++) {
        const row: BaseCase = BASE_CASES[i];
        expect(NumberFormatUtil.toBaseString(row.input, row.base)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(BASE_CASES.length);
      expect(BASE_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'toBaseString rows checked: ' + checked);
      expect(NumberFormatUtil.toBaseString(0, 2)).assertEqual('0');
      expect(NumberFormatUtil.toBaseString(1, 2)).assertEqual('1');
      expect(NumberFormatUtil.toBaseString(10, 16)).assertEqual('A');
      expect(NumberFormatUtil.toBaseString(35, 36)).assertEqual('Z');
      expect(NumberFormatUtil.toBaseString(-1, 10)).assertEqual('');
      expect(NumberFormatUtil.toBaseString(10, 1)).assertEqual('');
      expect(NumberFormatUtil.toBaseString(10, 37)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMFMT_0500
     * @tc.name      testBaseWrappers0005
     * @tc.desc      Verify the binary, octal and hexadecimal wrappers match the generic base conversion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBaseWrappers0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBaseWrappers0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let value = 0; value <= 128; value++) {
        expect(NumberFormatUtil.toBinaryString(value)).assertEqual(NumberFormatUtil.toBaseString(value, 2));
        expect(NumberFormatUtil.toOctalString(value)).assertEqual(NumberFormatUtil.toBaseString(value, 8));
        expect(NumberFormatUtil.toHexString(value)).assertEqual(NumberFormatUtil.toBaseString(value, 16));
        checked = checked + 1;
      }
      expect(checked).assertEqual(129);
      expect(NumberFormatUtil.toBinaryString(10)).assertEqual('1010');
      expect(NumberFormatUtil.toOctalString(10)).assertEqual('12');
      expect(NumberFormatUtil.toHexString(10)).assertEqual('A');
      expect(NumberFormatUtil.toHexString(255)).assertEqual('FF');
      expect(NumberFormatUtil.toBinaryString(-1)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMFMT_0600
     * @tc.name      testFormatFixed0006
     * @tc.desc      Verify formatFixed keeps the requested fraction digits and clamps unsupported digit counts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatFixed0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatFixed0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < FIXED_CASES.length; i++) {
        const row: FixedCase = FIXED_CASES[i];
        expect(NumberFormatUtil.formatFixed(row.input, row.digits)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(FIXED_CASES.length);
      expect(FIXED_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'formatFixed rows checked: ' + checked);
      expect(NumberFormatUtil.formatFixed(1.5, 0)).assertEqual('2');
      expect(NumberFormatUtil.formatFixed(1.5, 2)).assertEqual('1.50');
      expect(NumberFormatUtil.formatFixed(1.005, 2)).assertEqual('1.00');
      expect(NumberFormatUtil.formatFixed(-1.5, 1)).assertEqual('-1.5');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMFMT_0700
     * @tc.name      testAbbreviate0007
     * @tc.desc      Verify abbreviate renders thousand, million and billion short forms with one decimal digit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAbbreviate0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testAbbreviate0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < ABBREVIATE_CASES.length; i++) {
        const row: AbbreviateCase = ABBREVIATE_CASES[i];
        expect(NumberFormatUtil.abbreviate(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(ABBREVIATE_CASES.length);
      expect(ABBREVIATE_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'abbreviate rows checked: ' + checked);
      expect(NumberFormatUtil.abbreviate(999)).assertEqual('999');
      expect(NumberFormatUtil.abbreviate(1000)).assertEqual('1.0K');
      expect(NumberFormatUtil.abbreviate(1000000)).assertEqual('1.0M');
      expect(NumberFormatUtil.abbreviate(1000000000)).assertEqual('1.0B');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMFMT_0800
     * @tc.name      testFormatInvariants0008
     * @tc.desc      Verify formatting invariants such as comma count, base round trip and roman prefix rules.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatInvariants0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatInvariants0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let groupChecked: number = 0;
      for (let value = 0; value <= 200; value++) {
        const text: string = NumberFormatUtil.groupThousands(value * 1000);
        expect(text.indexOf(',') >= 0).assertEqual(value > 0);
        groupChecked = groupChecked + 1;
      }
      expect(groupChecked).assertEqual(201);
      let baseChecked: number = 0;
      for (let value = 0; value <= 200; value++) {
        const text: string = NumberFormatUtil.toBaseString(value, 16);
        expect(Number.parseInt(text, 16)).assertEqual(value);
        baseChecked = baseChecked + 1;
      }
      expect(baseChecked).assertEqual(201);
      let romanChecked: number = 0;
      for (let value = 1; value <= 300; value++) {
        const text: string = NumberFormatUtil.toRoman(value);
        expect(text.length > 0).assertTrue();
        romanChecked = romanChecked + 1;
      }
      expect(romanChecked).assertEqual(300);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMFMT_0900
     * @tc.name      testFormatBoundaries0009
     * @tc.desc      Verify number formatting helpers handle zero, negative and extreme values deterministically.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatBoundaries0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatBoundaries0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberFormatUtil.groupThousands(0)).assertEqual('0');
      expect(NumberFormatUtil.groupThousands(-0)).assertEqual('0');
      expect(NumberFormatUtil.padLeft(0, 5, '0')).assertEqual('00000');
      expect(NumberFormatUtil.toRoman(4000)).assertEqual('');
      expect(NumberFormatUtil.toRoman(0)).assertEqual('');
      expect(NumberFormatUtil.toBaseString(0, 36)).assertEqual('0');
      expect(NumberFormatUtil.toBaseString(1295, 36)).assertEqual('ZZ');
      expect(NumberFormatUtil.formatFixed(0, 0)).assertEqual('0');
      expect(NumberFormatUtil.formatFixed(-0, 2)).assertEqual('0.00');
      expect(NumberFormatUtil.abbreviate(0)).assertEqual('0');
      expect(NumberFormatUtil.abbreviate(-1000)).assertEqual('-1.0K');
      expect(NumberFormatUtil.abbreviate(999999999)).assertEqual('1000.0M');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
