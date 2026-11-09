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
import { NumericStringUtil } from './support/NumericStringUtil';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_NUMSTR]';

interface ParseIntCase {
  text: string;
  fallback: number;
  expected: number;
}

const PARSE_INT_CASES: ParseIntCase[] = [
  { text: '42', fallback: 0, expected: 42 },
  { text: '-42', fallback: 0, expected: -42 },
  { text: '+42', fallback: 0, expected: 42 },
  { text: '0', fallback: -1, expected: 0 },
  { text: ' 42 ', fallback: 0, expected: 42 },
  { text: '42.5', fallback: -1, expected: -1 },
  { text: 'abc', fallback: -1, expected: -1 },
  { text: '', fallback: -1, expected: -1 },
  { text: '1e3', fallback: -1, expected: -1 },
  { text: '007', fallback: 0, expected: 7 },
];

interface ParseDecimalCase {
  text: string;
  fallback: number;
  expected: number;
}

const PARSE_DECIMAL_CASES: ParseDecimalCase[] = [
  { text: '1.5', fallback: 0, expected: 1.5 },
  { text: '-1.5', fallback: 0, expected: -1.5 },
  { text: '+1.5', fallback: 0, expected: 1.5 },
  { text: '0.0', fallback: -1, expected: 0.0 },
  { text: ' .5 ', fallback: 0, expected: 0.5 },
  { text: '5.', fallback: 0, expected: 5.0 },
  { text: 'abc', fallback: -1, expected: -1 },
  { text: '', fallback: -1, expected: -1 },
  { text: '1.2.3', fallback: -1, expected: -1 },
  { text: '1e3', fallback: -1, expected: -1 },
];

interface NumericCase {
  text: string;
  expected: boolean;
}

const NUMERIC_CASES: NumericCase[] = [
  { text: '1', expected: true },
  { text: '-1', expected: true },
  { text: '+1', expected: true },
  { text: '1.5', expected: true },
  { text: '.5', expected: true },
  { text: '5.', expected: true },
  { text: '1e3', expected: false },
  { text: 'abc', expected: false },
  { text: '', expected: false },
  { text: '1,000', expected: false },
  { text: '0x10', expected: false },
];

interface DigitCase {
  text: string;
  digits: string;
  count: number;
}

const DIGIT_CASES: DigitCase[] = [
  { text: 'abc123', digits: '123', count: 3 },
  { text: '000', digits: '000', count: 3 },
  { text: 'a1b2c3', digits: '123', count: 3 },
  { text: '', digits: '', count: 0 },
  { text: '12.34', digits: '1234', count: 4 },
  { text: '+86-13800138000', digits: '8613800138000', count: 13 },
  { text: '中文42', digits: '42', count: 2 },
];

interface NormalizeCase {
  text: string;
  expected: string;
}

const NORMALIZE_CASES: NormalizeCase[] = [
  { text: '000', expected: '0' },
  { text: '007', expected: '7' },
  { text: '-000', expected: '0' },
  { text: '+000', expected: '0' },
  { text: '00120', expected: '120' },
  { text: '-00120', expected: '-120' },
  { text: '0', expected: '0' },
  { text: '-0', expected: '0' },
  { text: 'abc', expected: '' },
  { text: ' 042 ', expected: '42' },
  { text: '+42', expected: '42' },
];

interface CompareCase {
  left: string;
  right: string;
  expected: number;
}

const COMPARE_CASES: CompareCase[] = [
  { left: '1', right: '2', expected: -1 },
  { left: '2', right: '1', expected: 1 },
  { left: '2', right: '2', expected: 0 },
  { left: '-1', right: '1', expected: -1 },
  { left: '010', right: '10', expected: 0 },
  { left: 'abc', right: '1', expected: 0 },
  { left: '1', right: 'abc', expected: 0 },
  { left: '-5', right: '-3', expected: -1 },
];

interface SignCase {
  input: number;
  expected: string;
}

const SIGN_CASES: SignCase[] = [
  { input: 0, expected: '0' },
  { input: 1, expected: '+1' },
  { input: -1, expected: '-1' },
  { input: 42, expected: '+42' },
  { input: -42, expected: '-42' },
  { input: 3.5, expected: '+3.5' },
  { input: -3.5, expected: '-3.5' },
];

interface SplitCase {
  text: string;
  integerPart: string;
  fractionPart: string;
}

const SPLIT_CASES: SplitCase[] = [
  { text: '12.34', integerPart: '12', fractionPart: '34' },
  { text: '-12.34', integerPart: '-12', fractionPart: '34' },
  { text: '12', integerPart: '12', fractionPart: '' },
  { text: '.5', integerPart: '', fractionPart: '5' },
  { text: '5.', integerPart: '5', fractionPart: '' },
  { text: 'abc', integerPart: '', fractionPart: '' },
  { text: '', integerPart: '', fractionPart: '' },
];

export default function numericStringMatrixTest() {
  describe('NumericStringMatrixTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'NumericStringMatrixTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'NumericStringMatrixTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTR_0100
     * @tc.name      testParseInteger0001
     * @tc.desc      Verify parseInteger accepts signed integer text and returns the fallback for invalid text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseInteger0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseInteger0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < PARSE_INT_CASES.length; i++) {
        const row: ParseIntCase = PARSE_INT_CASES[i];
        expect(NumericStringUtil.parseInteger(row.text, row.fallback)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(PARSE_INT_CASES.length);
      expect(PARSE_INT_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'parseInteger rows checked: ' + checked);
      expect(NumericStringUtil.parseInteger('42', -1)).assertEqual(42);
      expect(NumericStringUtil.parseInteger('-42', -1)).assertEqual(-42);
      expect(NumericStringUtil.parseInteger(' 42 ', -1)).assertEqual(42);
      expect(NumericStringUtil.parseInteger('4.2', -1)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTR_0200
     * @tc.name      testParseDecimal0002
     * @tc.desc      Verify parseDecimal accepts signed decimal text and returns the fallback for invalid text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseDecimal0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseDecimal0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < PARSE_DECIMAL_CASES.length; i++) {
        const row: ParseDecimalCase = PARSE_DECIMAL_CASES[i];
        expect(NumericStringUtil.parseDecimal(row.text, row.fallback)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(PARSE_DECIMAL_CASES.length);
      expect(PARSE_DECIMAL_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'parseDecimal rows checked: ' + checked);
      expect(NumericStringUtil.parseDecimal('1.5', -1)).assertEqual(1.5);
      expect(NumericStringUtil.parseDecimal('-1.5', -1)).assertEqual(-1.5);
      expect(NumericStringUtil.parseDecimal('.5', -1)).assertEqual(0.5);
      expect(NumericStringUtil.parseDecimal('1e3', -1)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTR_0300
     * @tc.name      testIsNumeric0003
     * @tc.desc      Verify isNumeric accepts plain decimal text and rejects exponents, separators and empty text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIsNumeric0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIsNumeric0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < NUMERIC_CASES.length; i++) {
        const row: NumericCase = NUMERIC_CASES[i];
        expect(NumericStringUtil.isNumeric(row.text)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(NUMERIC_CASES.length);
      expect(NUMERIC_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'isNumeric rows checked: ' + checked);
      expect(NumericStringUtil.isNumeric('123')).assertTrue();
      expect(NumericStringUtil.isNumeric('-123')).assertTrue();
      expect(NumericStringUtil.isNumeric('1.2.3')).assertFalse();
      expect(NumericStringUtil.isNumeric('')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTR_0400
     * @tc.name      testExtractDigits0004
     * @tc.desc      Verify extractDigits keeps digit characters and countDigits counts them.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testExtractDigits0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testExtractDigits0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < DIGIT_CASES.length; i++) {
        const row: DigitCase = DIGIT_CASES[i];
        expect(NumericStringUtil.extractDigits(row.text)).assertEqual(row.digits);
        expect(NumericStringUtil.countDigits(row.text)).assertEqual(row.count);
        checked = checked + 1;
      }
      expect(checked).assertEqual(DIGIT_CASES.length);
      expect(DIGIT_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'extractDigits rows checked: ' + checked);
      expect(NumericStringUtil.extractDigits('abc')).assertEqual('');
      expect(NumericStringUtil.countDigits('abc')).assertEqual(0);
      expect(NumericStringUtil.extractDigits('1a2b3c')).assertEqual('123');
      expect(NumericStringUtil.countDigits('1a2b3c')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTR_0500
     * @tc.name      testNormalizeIntegerText0005
     * @tc.desc      Verify normalizeIntegerText removes redundant leading zeros and keeps the sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNormalizeIntegerText0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNormalizeIntegerText0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < NORMALIZE_CASES.length; i++) {
        const row: NormalizeCase = NORMALIZE_CASES[i];
        expect(NumericStringUtil.normalizeIntegerText(row.text)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(NORMALIZE_CASES.length);
      expect(NORMALIZE_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'normalizeIntegerText rows checked: ' + checked);
      expect(NumericStringUtil.normalizeIntegerText('000123')).assertEqual('123');
      expect(NumericStringUtil.normalizeIntegerText('-000')).assertEqual('0');
      expect(NumericStringUtil.normalizeIntegerText('+000120')).assertEqual('120');
      expect(NumericStringUtil.normalizeIntegerText('12a')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTR_0600
     * @tc.name      testCompareNumericText0006
     * @tc.desc      Verify compareNumericText compares integer text numerically and reports zero for invalid text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCompareNumericText0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCompareNumericText0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < COMPARE_CASES.length; i++) {
        const row: CompareCase = COMPARE_CASES[i];
        expect(NumericStringUtil.compareNumericText(row.left, row.right)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(COMPARE_CASES.length);
      expect(COMPARE_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'compareNumericText rows checked: ' + checked);
      expect(NumericStringUtil.compareNumericText('10', '9')).assertEqual(1);
      expect(NumericStringUtil.compareNumericText('9', '10')).assertEqual(-1);
      expect(NumericStringUtil.compareNumericText('10', '010')).assertEqual(0);
      expect(NumericStringUtil.compareNumericText('x', '10')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTR_0700
     * @tc.name      testFormatWithSign0007
     * @tc.desc      Verify formatWithSign adds a plus sign only for strictly positive values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFormatWithSign0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFormatWithSign0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < SIGN_CASES.length; i++) {
        const row: SignCase = SIGN_CASES[i];
        expect(NumericStringUtil.formatWithSign(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(SIGN_CASES.length);
      expect(SIGN_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'formatWithSign rows checked: ' + checked);
      expect(NumericStringUtil.formatWithSign(0)).assertEqual('0');
      expect(NumericStringUtil.formatWithSign(1)).assertEqual('+1');
      expect(NumericStringUtil.formatWithSign(-1)).assertEqual('-1');
      expect(NumericStringUtil.formatWithSign(100).charAt(0)).assertEqual('+');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTR_0800
     * @tc.name      testSplitNumericText0008
     * @tc.desc      Verify integerPart and fractionPart split numeric text around the decimal point.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSplitNumericText0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSplitNumericText0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < SPLIT_CASES.length; i++) {
        const row: SplitCase = SPLIT_CASES[i];
        expect(NumericStringUtil.integerPart(row.text)).assertEqual(row.integerPart);
        expect(NumericStringUtil.fractionPart(row.text)).assertEqual(row.fractionPart);
        checked = checked + 1;
      }
      expect(checked).assertEqual(SPLIT_CASES.length);
      expect(SPLIT_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'split rows checked: ' + checked);
      expect(NumericStringUtil.integerPart('12')).assertEqual('12');
      expect(NumericStringUtil.fractionPart('12')).assertEqual('');
      expect(NumericStringUtil.integerPart('abc')).assertEqual('');
      expect(NumericStringUtil.fractionPart('abc')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTR_0900
     * @tc.name      testNumericStringInvariants0009
     * @tc.desc      Verify round trips between parseInteger, normalizeIntegerText and formatWithSign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericStringInvariants0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericStringInvariants0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let value = -200; value <= 200; value++) {
        const text: string = value.toString();
        expect(NumericStringUtil.parseInteger(text, 0)).assertEqual(value);
        expect(NumericStringUtil.normalizeIntegerText(text)).assertEqual(text);
        checked = checked + 1;
      }
      expect(checked).assertEqual(401);
      expect(NumericStringUtil.parseInteger('00123', 0)).assertEqual(123);
      expect(NumericStringUtil.normalizeIntegerText('00123')).assertEqual('123');
      expect(NumericStringUtil.formatWithSign(7)).assertEqual('+7');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTR_1000
     * @tc.name      testNumericStringBoundaries0010
     * @tc.desc      Verify numeric text helpers handle empty, whitespace, sign only and long inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumericStringBoundaries0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumericStringBoundaries0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumericStringUtil.isNumeric('')).assertFalse();
      expect(NumericStringUtil.isNumeric('   ')).assertFalse();
      expect(NumericStringUtil.isNumeric('+')).assertFalse();
      expect(NumericStringUtil.isNumeric('-')).assertFalse();
      expect(NumericStringUtil.parseInteger('', 9)).assertEqual(9);
      expect(NumericStringUtil.parseDecimal('', 9.5)).assertEqual(9.5);
      expect(NumericStringUtil.extractDigits('')).assertEqual('');
      expect(NumericStringUtil.countDigits('')).assertEqual(0);
      expect(NumericStringUtil.normalizeIntegerText('   ')).assertEqual('');
      expect(NumericStringUtil.compareNumericText('', '')).assertEqual(0);
      expect(NumericStringUtil.integerPart('99999999999999999999')).assertEqual('99999999999999999999');
      expect(NumericStringUtil.parseDecimal('99999999999999999999.5', 0) > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
