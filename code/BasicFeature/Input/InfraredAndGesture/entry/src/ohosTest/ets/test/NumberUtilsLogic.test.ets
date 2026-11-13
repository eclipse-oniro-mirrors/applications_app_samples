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
import { NumberUtils } from 'common';
import {
  NumericCaseCatalog, IntParseCase, FloatParseCase, FiniteCase,
  ClampCase, RangeCase, FixedCase, SizeCase
} from './helper/NumericCaseCatalog';

/**
 * NumberUtils 纯逻辑套件。
 *
 * 覆盖范围：parseIntSafe / parseFloatSafe / isFiniteNumber / clamp /
 * isInRange / toFixedString / formatFileSize 共七个静态方法。
 *
 * 数据来源：所有期望值都来自 helper/NumericCaseCatalog 的固定数据表，
 * 测试侧不做二次推导，也不复制被测实现的循环结构，保证 oracle 独立。
 *
 * 断言口径：
 *   - 精确整数值使用 assertEqual 或 assertClose（容差 0）。
 *   - 涉及浮点表示误差（例如 1024 * 1.5 或 2.5e-2）时使用固定的小容差，
 *     容差是常量字符串，不依赖时间、随机数，用例可重复执行。
 *   - 超出安全整数范围的边界（例如 parseInt 处理 9007199254740993）只断言
 *     “与相邻安全整数相差不超过 1”，避免不同 JS 引擎的舍入差异造成假失败。
 *
 * 明确不覆盖的分支：
 *   - AppLogger.warn 只写日志、不产生返回值，无法从外部观测，因此只通过
 *     “函数仍然返回期望值且不抛异常”间接覆盖告警分支。
 *   - formatFileSize 在 bytes 为 Infinity/NaN 时先被归一为 0，因此
 *     TB 之后的单位越界分支无法通过公共入参触发（联合上界受
 *     SIZE_UNITS.length - 1 限制），此分支不覆盖。
 */

/** Hilog domain reserved for the NumberUtils logic tests. */
const DOMAIN: number = 0xF821;
/** Prefix added to every case log so the logs can be filtered by suite. */
const SUITE_PREFIX: string = 'MeetingScene_NumberUtils_';

/** Negative fallback used by the first half of the parsing cases. */
const DEFAULT_NEGATIVE: number = -1;
/** Zero fallback used by the second half of the parsing cases. */
const DEFAULT_ZERO: number = 0;
/** Large positive fallback used to prove the caller-supplied value is echoed. */
const DEFAULT_SEVEN: number = 7;
/** Sentinel fallback used when the caller wants an unmistakable marker. */
const DEFAULT_SENTINEL: number = -99999;

/** Absolute tolerance for exactly representable binary fractions. */
const BINARY_DELTA: number = 1e-12;
/** Absolute tolerance for decimal fractions that are not binary exact. */
const DECIMAL_DELTA: number = 1e-9;
/** Tolerance used for the huge 2^53 style integers. */
const ULP_DELTA: number = 1;

/** Bytes of one kilobyte, mirrors the production scaling factor. */
const BYTES_PER_KB: number = 1024;
/** Bytes of one megabyte. */
const BYTES_PER_MB: number = BYTES_PER_KB * BYTES_PER_KB;
/** Bytes of one gigabyte. */
const BYTES_PER_GB: number = BYTES_PER_MB * BYTES_PER_KB;
/** Bytes of one terabyte. */
const BYTES_PER_TB: number = BYTES_PER_GB * BYTES_PER_KB;
/** Bytes of one petabyte, one step beyond the supported unit list. */
const BYTES_PER_PB: number = BYTES_PER_TB * BYTES_PER_KB;

/** Byte count sitting exactly on the last byte before one kilobyte. */
const LAST_BYTE_BEFORE_KB: number = BYTES_PER_KB - 1;
/** Byte count sitting exactly on the last byte before one megabyte. */
const LAST_BYTE_BEFORE_MB: number = BYTES_PER_MB - 1;
/** Byte count sitting exactly on the last byte before one gigabyte. */
const LAST_BYTE_BEFORE_GB: number = BYTES_PER_GB - 1;
/** Byte count sitting exactly on the last byte before one terabyte. */
const LAST_BYTE_BEFORE_TB: number = BYTES_PER_TB - 1;

/** Maximum fraction digit count the production class accepts. */
const MAX_FRACTION_DIGITS: number = 100;
/** First digit count the production class rejects as out of range. */
const OVER_LIMIT_DIGITS: number = MAX_FRACTION_DIGITS + 1;

/** Probe range lower bound used by the clamp/isInRange cross checks. */
const RANGE_LOW: number = -100;
/** Probe range upper bound used by the clamp/isInRange cross checks. */
const RANGE_HIGH: number = 100;

/**
 * Builds the exact expected text of toFixedString(value, 100) for value 1:
 * the digit one, a decimal separator and exactly one hundred zero digits.
 * Building it avoids a 100 character hand written literal that is easy to
 * mis-count.
 */
function buildHundredDigitText(): string {
  let text: string = '1.';
  for (let i: number = 0; i < MAX_FRACTION_DIGITS; i++) {
    text += '0';
  }
  return text;
}

/**
 * Counts the characters after the decimal separator of a formatted number.
 * Used to prove that the clamped digit count really produced one hundred
 * fraction digits without comparing a hard coded 102 character string twice.
 */
function countFractionDigits(text: string): number {
  const separatorIndex: number = text.indexOf('.');
  if (separatorIndex < 0) {
    return 0;
  }
  return text.length - separatorIndex - 1;
}

/**
 * Returns true when the text consists of digits and at most one dot, which is
 * the shape every non exponential toFixed output has.
 */
function looksLikePlainDecimal(text: string): boolean {
  if (text.length === 0) {
    return false;
  }
  let dotCount: number = 0;
  let digitCount: number = 0;
  for (let i: number = 0; i < text.length; i++) {
    const ch: string = text.charAt(i);
    if (ch === '.') {
      dotCount++;
    } else if (ch >= '0' && ch <= '9') {
      digitCount++;
    } else if (ch !== '-') {
      return false;
    }
  }
  return dotCount <= 1 && digitCount > 0;
}

export default function numberUtilsLogicTest() {
  describe('NumberUtilsLogicTest', () => {

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0100
     * @tc.name      testNumberUtils0001
     * @tc.desc      Verify every valid integer parsing case returns the catalog value with the negative fallback.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0001';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: IntParseCase[] = NumericCaseCatalog.validIntCases();
      expect(cases.length).assertLarger(0);
      for (const item of cases) {
        const actual: number = NumberUtils.parseIntSafe(item.text, DEFAULT_NEGATIVE);
        expect(actual).assertEqual(item.expected);
        // A valid input must never echo the fallback sentinel.
        expect(actual === DEFAULT_NEGATIVE).assertEqual(item.expected === DEFAULT_NEGATIVE);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0101
     * @tc.name      testNumberUtils0002
     * @tc.desc      Verify every invalid integer parsing case falls back to the negative default value.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0002';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: IntParseCase[] = NumericCaseCatalog.invalidIntCases();
      expect(cases.length).assertLarger(0);
      for (const item of cases) {
        const actual: number = NumberUtils.parseIntSafe(item.text, DEFAULT_NEGATIVE);
        expect(actual).assertEqual(DEFAULT_NEGATIVE);
        expect(item.valid).assertFalse();
        // The catalog expectation for invalid inputs is the zero fallback.
        expect(item.expected).assertEqual(DEFAULT_ZERO);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0102
     * @tc.name      testNumberUtils0003
     * @tc.desc      Verify the same valid integer inputs produce the same value when the fallback is zero.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0003';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: IntParseCase[] = NumericCaseCatalog.validIntCases();
      for (const item of cases) {
        const withNegative: number = NumberUtils.parseIntSafe(item.text, DEFAULT_NEGATIVE);
        const withZero: number = NumberUtils.parseIntSafe(item.text, DEFAULT_ZERO);
        // A successful parse must be independent of the fallback value.
        expect(withZero).assertEqual(withNegative);
        expect(withZero).assertEqual(item.expected);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0103
     * @tc.name      testNumberUtils0004
     * @tc.desc      Verify the same invalid integer inputs echo whichever fallback the caller supplies.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberUtils0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberUtils0004';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: IntParseCase[] = NumericCaseCatalog.invalidIntCases();
      for (const item of cases) {
        const withNegative: number = NumberUtils.parseIntSafe(item.text, DEFAULT_NEGATIVE);
        const withZero: number = NumberUtils.parseIntSafe(item.text, DEFAULT_ZERO);
        const withSeven: number = NumberUtils.parseIntSafe(item.text, DEFAULT_SEVEN);
        expect(withNegative).assertEqual(DEFAULT_NEGATIVE);
        expect(withZero).assertEqual(DEFAULT_ZERO);
        expect(withSeven).assertEqual(DEFAULT_SEVEN);
        // The two fallbacks must be distinguishable for every invalid input.
        expect(withNegative === withZero).assertFalse();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0104
     * @tc.name      testNumberUtils0005
     * @tc.desc      Verify a null integer input returns the fallback instead of throwing.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0005';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.parseIntSafe(null, DEFAULT_NEGATIVE)).assertEqual(DEFAULT_NEGATIVE);
      expect(NumberUtils.parseIntSafe(null, DEFAULT_ZERO)).assertEqual(DEFAULT_ZERO);
      expect(NumberUtils.parseIntSafe(null, DEFAULT_SEVEN)).assertEqual(DEFAULT_SEVEN);
      expect(NumberUtils.parseIntSafe(null, DEFAULT_SENTINEL)).assertEqual(DEFAULT_SENTINEL);
      // A -0 fallback is returned as a value equal to 0.
      expect(NumberUtils.parseIntSafe(null, -0)).assertEqual(DEFAULT_ZERO);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0105
     * @tc.name      testNumberUtils0006
     * @tc.desc      Verify an undefined integer input returns the fallback instead of throwing.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0006';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.parseIntSafe(undefined, DEFAULT_NEGATIVE)).assertEqual(DEFAULT_NEGATIVE);
      expect(NumberUtils.parseIntSafe(undefined, DEFAULT_ZERO)).assertEqual(DEFAULT_ZERO);
      expect(NumberUtils.parseIntSafe(undefined, DEFAULT_SEVEN)).assertEqual(DEFAULT_SEVEN);
      expect(NumberUtils.parseIntSafe(undefined, DEFAULT_SENTINEL)).assertEqual(DEFAULT_SENTINEL);
      // Null and undefined share the missing-value branch.
      const fromNull: number = NumberUtils.parseIntSafe(null, DEFAULT_SEVEN);
      const fromUndefined: number = NumberUtils.parseIntSafe(undefined, DEFAULT_SEVEN);
      expect(fromNull).assertEqual(fromUndefined);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0106
     * @tc.name      testNumberUtils0007
     * @tc.desc      Verify single labelled integer cases keep their documented trimming and prefix semantics.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberUtils0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberUtils0007';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const bothSpaces: IntParseCase | null = NumericCaseCatalog.intCase('both-spaces');
      expect(bothSpaces !== null).assertTrue();
      if (bothSpaces !== null) {
        expect(NumberUtils.parseIntSafe(bothSpaces.text, DEFAULT_NEGATIVE)).assertEqual(bothSpaces.expected);
      }
      const leadingTab: IntParseCase | null = NumericCaseCatalog.intCase('leading-tab');
      expect(leadingTab !== null).assertTrue();
      if (leadingTab !== null) {
        expect(NumberUtils.parseIntSafe(leadingTab.text, DEFAULT_NEGATIVE)).assertEqual(42);
      }
      // parseInt truncates at the first non numeric character.
      expect(NumberUtils.parseIntSafe('12abc', DEFAULT_NEGATIVE)).assertEqual(12);
      expect(NumberUtils.parseIntSafe('3.9', DEFAULT_NEGATIVE)).assertEqual(3);
      expect(NumberUtils.parseIntSafe('1e3', DEFAULT_NEGATIVE)).assertEqual(1);
      // parseInt without an explicit radix would read 0x1f as 31, with radix 10 it stops at 0.
      expect(NumberUtils.parseIntSafe('0x1f', DEFAULT_NEGATIVE)).assertEqual(0);
      expect(NumberUtils.parseIntSafe('1_000', DEFAULT_NEGATIVE)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0107
     * @tc.name      testNumberUtils0008
     * @tc.desc      Verify large integer inputs keep the documented rounding behaviour beyond the int32 range.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberUtils0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberUtils0008';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // 2147483648 is exactly representable as a double, no rounding involved.
      const beyondInt32: number = NumberUtils.parseIntSafe('2147483648', DEFAULT_NEGATIVE);
      expect(beyondInt32).assertEqual(2147483648);
      expect(beyondInt32 > 2147483647).assertTrue();
      // 9007199254740993 is not representable, so allow a 1 ULP difference.
      const beyondSafe: number = NumberUtils.parseIntSafe('9007199254740993', DEFAULT_NEGATIVE);
      const difference: number = Math.abs(beyondSafe - 9007199254740992);
      expect(difference <= ULP_DELTA).assertTrue();
      // The parsed value stays finite even at the edge of the safe range.
      expect(NumberUtils.isFiniteNumber(beyondSafe)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0108
     * @tc.name      testNumberUtils0009
     * @tc.desc      Verify every expected float parsing case returns the catalog value with the negative fallback.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0009';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: FloatParseCase[] = NumericCaseCatalog.floatParseCases();
      expect(cases.length).assertLarger(0);
      for (const item of cases) {
        const actual: number = NumberUtils.parseFloatSafe(item.text, DEFAULT_NEGATIVE);
        if (item.valid) {
          // Finite expectations compare numerically, infinities compare by sign.
          if (Number.isFinite(item.expected)) {
            expect(actual).assertClose(item.expected, DECIMAL_DELTA);
          } else {
            expect(actual).assertEqual(item.expected);
          }
        } else {
          expect(actual).assertEqual(DEFAULT_NEGATIVE);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0109
     * @tc.name      testNumberUtils0010
     * @tc.desc      Verify every invalid float parsing case falls back to the zero default value.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0010';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      let checked: number = 0;
      for (const item of NumericCaseCatalog.floatParseCases()) {
        if (item.valid) {
          continue;
        }
        checked++;
        expect(NumberUtils.parseFloatSafe(item.text, DEFAULT_ZERO)).assertEqual(DEFAULT_ZERO);
        expect(NumberUtils.parseFloatSafe(item.text, DEFAULT_NEGATIVE)).assertEqual(DEFAULT_NEGATIVE);
      }
      // The catalog must keep at least the five documented invalid inputs.
      expect(checked >= 5).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0110
     * @tc.name      testNumberUtils0011
     * @tc.desc      Verify valid float inputs are independent of the fallback and keep their fractional part.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberUtils0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberUtils0011';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      for (const item of NumericCaseCatalog.floatParseCases()) {
        if (!item.valid || !Number.isFinite(item.expected)) {
          continue;
        }
        const withNegative: number = NumberUtils.parseFloatSafe(item.text, DEFAULT_NEGATIVE);
        const withSeven: number = NumberUtils.parseFloatSafe(item.text, DEFAULT_SEVEN);
        expect(withNegative).assertEqual(withSeven);
      }
      // Spot checks on the documented trimming and truncation behaviour.
      expect(NumberUtils.parseFloatSafe('  2.25  ', DEFAULT_NEGATIVE)).assertClose(2.25, BINARY_DELTA);
      expect(NumberUtils.parseFloatSafe('.5', DEFAULT_NEGATIVE)).assertClose(0.5, BINARY_DELTA);
      expect(NumberUtils.parseFloatSafe('5.', DEFAULT_NEGATIVE)).assertClose(5, BINARY_DELTA);
      expect(NumberUtils.parseFloatSafe('1.5abc', DEFAULT_NEGATIVE)).assertClose(1.5, BINARY_DELTA);
      expect(NumberUtils.parseFloatSafe('1.2.3', DEFAULT_NEGATIVE)).assertClose(1.2, DECIMAL_DELTA);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0111
     * @tc.name      testNumberUtils0012
     * @tc.desc      Verify exponent notation and the tiny decimal survive the float parsing path.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberUtils0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberUtils0012';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.parseFloatSafe('1e3', DEFAULT_NEGATIVE)).assertEqual(1000);
      expect(NumberUtils.parseFloatSafe('2.5e-2', DEFAULT_NEGATIVE)).assertClose(0.025, DECIMAL_DELTA);
      expect(NumberUtils.parseFloatSafe('0.000001', DEFAULT_NEGATIVE)).assertClose(0.000001, DECIMAL_DELTA);
      expect(NumberUtils.parseFloatSafe('-0.5', DEFAULT_NEGATIVE)).assertClose(-0.5, BINARY_DELTA);
      // The tiny value stays strictly positive, it is not rounded to zero.
      const tiny: number = NumberUtils.parseFloatSafe('0.000001', DEFAULT_NEGATIVE);
      expect(tiny).assertLarger(0);
      // Integer text and plain float text agree on the same numeric value.
      expect(NumberUtils.parseFloatSafe('42', DEFAULT_NEGATIVE))
        .assertEqual(NumberUtils.parseIntSafe('42', DEFAULT_NEGATIVE));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0112
     * @tc.name      testNumberUtils0013
     * @tc.desc      Verify the infinite literals are parsed as signed infinities and stay non finite.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberUtils0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberUtils0013';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const positive: number = NumberUtils.parseFloatSafe('Infinity', DEFAULT_NEGATIVE);
      const negative: number = NumberUtils.parseFloatSafe('-Infinity', DEFAULT_NEGATIVE);
      expect(positive).assertEqual(Infinity);
      expect(negative).assertEqual(-Infinity);
      // An infinite parse is not a fallback hit, so it must not equal the default.
      expect(positive === DEFAULT_NEGATIVE).assertFalse();
      expect(negative === DEFAULT_NEGATIVE).assertFalse();
      // Both results are rejected by the finite probe.
      expect(NumberUtils.isFiniteNumber(positive)).assertFalse();
      expect(NumberUtils.isFiniteNumber(negative)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0113
     * @tc.name      testNumberUtils0014
     * @tc.desc      Verify a null float input returns the caller supplied fallback.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0014';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.parseFloatSafe(null, DEFAULT_NEGATIVE)).assertEqual(DEFAULT_NEGATIVE);
      expect(NumberUtils.parseFloatSafe(null, DEFAULT_ZERO)).assertEqual(DEFAULT_ZERO);
      expect(NumberUtils.parseFloatSafe(null, DEFAULT_SEVEN)).assertEqual(DEFAULT_SEVEN);
      expect(NumberUtils.parseFloatSafe(null, DEFAULT_SENTINEL)).assertEqual(DEFAULT_SENTINEL);
      // A fractional fallback is echoed exactly as supplied.
      expect(NumberUtils.parseFloatSafe(null, 0.5)).assertClose(0.5, BINARY_DELTA);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0114
     * @tc.name      testNumberUtils0015
     * @tc.desc      Verify an undefined float input returns the caller supplied fallback.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0015';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.parseFloatSafe(undefined, DEFAULT_NEGATIVE)).assertEqual(DEFAULT_NEGATIVE);
      expect(NumberUtils.parseFloatSafe(undefined, DEFAULT_ZERO)).assertEqual(DEFAULT_ZERO);
      expect(NumberUtils.parseFloatSafe(undefined, DEFAULT_SEVEN)).assertEqual(DEFAULT_SEVEN);
      expect(NumberUtils.parseFloatSafe(undefined, DEFAULT_SENTINEL)).assertEqual(DEFAULT_SENTINEL);
      expect(NumberUtils.parseFloatSafe(undefined, -2.5)).assertClose(-2.5, BINARY_DELTA);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0115
     * @tc.name      testNumberUtils0016
     * @tc.desc      Verify int and float parsing disagree on decimal text, proving the two paths differ.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumberUtils0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumberUtils0016';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const intValue: number = NumberUtils.parseIntSafe('3.9', DEFAULT_NEGATIVE);
      const floatValue: number = NumberUtils.parseFloatSafe('3.9', DEFAULT_NEGATIVE);
      expect(intValue).assertEqual(3);
      expect(floatValue).assertClose(3.9, DECIMAL_DELTA);
      expect(intValue === floatValue).assertFalse();
      // Exponent text: integer parsing stops at the letter, float parsing expands it.
      expect(NumberUtils.parseIntSafe('1e3', DEFAULT_NEGATIVE)).assertEqual(1);
      expect(NumberUtils.parseFloatSafe('1e3', DEFAULT_NEGATIVE)).assertEqual(1000);
      // For pure digit text both paths must agree.
      expect(NumberUtils.parseIntSafe('250', DEFAULT_ZERO))
        .assertEqual(NumberUtils.parseFloatSafe('250', DEFAULT_ZERO));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0116
     * @tc.name      testNumberUtils0017
     * @tc.desc      Verify every catalog finite case is classified exactly as documented.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0017';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: FiniteCase[] = NumericCaseCatalog.finiteCases();
      expect(cases.length).assertLarger(0);
      for (const item of cases) {
        expect(NumberUtils.isFiniteNumber(item.value)).assertEqual(item.expected);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0117
     * @tc.name      testNumberUtils0018
     * @tc.desc      Verify zero, negative zero and signed integers are all reported as finite.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0018';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.isFiniteNumber(0)).assertTrue();
      expect(NumberUtils.isFiniteNumber(-0)).assertTrue();
      expect(NumberUtils.isFiniteNumber(1)).assertTrue();
      expect(NumberUtils.isFiniteNumber(-1)).assertTrue();
      expect(NumberUtils.isFiniteNumber(0.5)).assertTrue();
      expect(NumberUtils.isFiniteNumber(-0.125)).assertTrue();
      // Plain integer literals round-trip through the probe unchanged.
      let finiteCount: number = 0;
      for (const item of NumericCaseCatalog.finiteCases()) {
        if (NumberUtils.isFiniteNumber(item.value)) {
          finiteCount++;
        }
      }
      expect(finiteCount).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0118
     * @tc.name      testNumberUtils0019
     * @tc.desc      Verify NaN and both infinities are rejected by the finite probe.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0019';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.isFiniteNumber(NaN)).assertFalse();
      expect(NumberUtils.isFiniteNumber(Infinity)).assertFalse();
      expect(NumberUtils.isFiniteNumber(-Infinity)).assertFalse();
      expect(NumberUtils.isFiniteNumber(Infinity - Infinity)).assertFalse();
      expect(NumberUtils.isFiniteNumber(0 * Infinity)).assertFalse();
      // Infinities produced by arithmetic are rejected as well.
      expect(NumberUtils.isFiniteNumber(Number.MAX_VALUE * 2)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0119
     * @tc.name      testNumberUtils0020
     * @tc.desc      Verify the largest and smallest representable doubles and the safe integer limits are finite.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberUtils0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberUtils0020';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.isFiniteNumber(Number.MAX_VALUE)).assertTrue();
      expect(NumberUtils.isFiniteNumber(Number.MIN_VALUE)).assertTrue();
      expect(NumberUtils.isFiniteNumber(Number.MAX_SAFE_INTEGER)).assertTrue();
      expect(NumberUtils.isFiniteNumber(Number.MIN_SAFE_INTEGER)).assertTrue();
      expect(NumberUtils.isFiniteNumber(-Number.MAX_VALUE)).assertTrue();
      // One step beyond the maximum double overflows to infinity.
      expect(NumberUtils.isFiniteNumber(Number.MAX_VALUE * 10)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0120
     * @tc.name      testNumberUtils0021
     * @tc.desc      Verify every non swapped clamp case returns exactly the catalog expectation.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0021';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      let checked: number = 0;
      for (const item of NumericCaseCatalog.clampCases()) {
        if (item.swapped) {
          continue;
        }
        checked++;
        const actual: number = NumberUtils.clamp(item.value, item.min, item.max);
        expect(actual).assertEqual(item.expected);
        // Every clamped result must sit inside the requested bounds.
        expect(actual >= item.min).assertTrue();
        expect(actual <= item.max).assertTrue();
      }
      expect(checked).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0121
     * @tc.name      testNumberUtils0022
     * @tc.desc      Verify clamp keeps in-range values untouched and pushes out-of-range values onto the bound.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0022';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // In-range values are returned verbatim.
      expect(NumberUtils.clamp(5, 0, 10)).assertEqual(5);
      expect(NumberUtils.clamp(0.25, 0, 1)).assertClose(0.25, BINARY_DELTA);
      expect(NumberUtils.clamp(1500, 1000, 2000)).assertEqual(1500);
      // Out-of-range values are saturated to the nearest bound.
      expect(NumberUtils.clamp(-3, 0, 10)).assertEqual(0);
      expect(NumberUtils.clamp(99, 0, 10)).assertEqual(10);
      expect(NumberUtils.clamp(-11, -10, 0)).assertEqual(-10);
      expect(NumberUtils.clamp(1, -10, 0)).assertEqual(0);
      // Degenerate range collapses every value onto the single point.
      expect(NumberUtils.clamp(7, 3, 3)).assertEqual(3);
      expect(NumberUtils.clamp(-7, 3, 3)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0122
     * @tc.name      testNumberUtils0023
     * @tc.desc      Verify swapped bounds are normalized before clamping so the result honours the logical range.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberUtils0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberUtils0023';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const swapped: ClampCase[] = NumericCaseCatalog.swappedClampCases();
      expect(swapped.length).assertEqual(5);
      for (const item of swapped) {
        const actual: number = NumberUtils.clamp(item.value, item.min, item.max);
        expect(actual).assertEqual(item.expected);
        // After normalization the effective bounds are min/max swapped back.
        expect(actual >= item.max).assertTrue();
        expect(actual <= item.min).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0123
     * @tc.name      testNumberUtils0024
     * @tc.desc      Verify swapped and non swapped bounds produce the same result for the same logical range.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberUtils0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberUtils0024';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const probes: number[] = [-3, 0, 5, 10, 99];
      for (const probe of probes) {
        const normal: number = NumberUtils.clamp(probe, 0, 10);
        const swapped: number = NumberUtils.clamp(probe, 10, 0);
        expect(swapped).assertEqual(normal);
      }
      // Spot checks against the catalog labels that document the swap branch.
      const swappedInside: ClampCase | null = NumericCaseCatalog.clampCase('swapped-inside');
      expect(swappedInside !== null).assertTrue();
      if (swappedInside !== null) {
        expect(NumberUtils.clamp(swappedInside.value, swappedInside.min, swappedInside.max))
          .assertEqual(swappedInside.expected);
      }
      const swappedFraction: ClampCase | null = NumericCaseCatalog.clampCase('swapped-fraction');
      expect(swappedFraction !== null).assertTrue();
      if (swappedFraction !== null) {
        expect(NumberUtils.clamp(swappedFraction.value, swappedFraction.min, swappedFraction.max))
          .assertClose(0.75, BINARY_DELTA);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0124
     * @tc.name      testNumberUtils0025
     * @tc.desc      Verify clamp is idempotent with swapped bounds: clamping the result again with the same bounds changes nothing, and widening the range keeps an already clamped value.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumberUtils0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumberUtils0025';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      for (const item of NumericCaseCatalog.clampCases()) {
        const once: number = NumberUtils.clamp(item.value, item.max, item.min);
        const twice: number = NumberUtils.clamp(once, item.max, item.min);
        expect(twice).assertEqual(once);
      }
      // Widening an already clamped value never changes it either.
      const narrow: number = NumberUtils.clamp(500, 0, 10);
      const widened: number = NumberUtils.clamp(narrow, -1000, 1000);
      expect(narrow).assertEqual(10);
      expect(widened).assertEqual(narrow);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0125
     * @tc.name      testNumberUtils0026
     * @tc.desc      Verify clamp saturates infinite values to the bounds, keeps a finite value inside an infinite range and returns a non-finite result for NaN.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumberUtils0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumberUtils0026';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.clamp(Infinity, 0, 10)).assertEqual(10);
      expect(NumberUtils.clamp(-Infinity, 0, 10)).assertEqual(0);
      expect(NumberUtils.clamp(Infinity, 10, 0)).assertEqual(10);
      expect(NumberUtils.clamp(-Infinity, 10, 0)).assertEqual(0);
      // An infinite range keeps the value itself.
      expect(NumberUtils.clamp(12345, -Infinity, Infinity)).assertEqual(12345);
      // NaN is not orderable, so the result is NaN and the probe rejects it.
      expect(NumberUtils.isFiniteNumber(NumberUtils.clamp(NaN, 0, 10))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0126
     * @tc.name      testNumberUtils0027
     * @tc.desc      Verify every catalog range case is classified with inclusive bounds.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0027';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: RangeCase[] = NumericCaseCatalog.rangeCases();
      expect(cases.length).assertEqual(18);
      for (const item of cases) {
        expect(NumberUtils.isInRange(item.value, item.min, item.max)).assertEqual(item.expected);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0127
     * @tc.name      testNumberUtils0028
     * @tc.desc      Verify both bounds count as inside the range while the adjacent values do not.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0028';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.isInRange(0, 0, 10)).assertTrue();
      expect(NumberUtils.isInRange(10, 0, 10)).assertTrue();
      expect(NumberUtils.isInRange(-1, 0, 10)).assertFalse();
      expect(NumberUtils.isInRange(11, 0, 10)).assertFalse();
      // Degenerate range only accepts the single point.
      expect(NumberUtils.isInRange(4, 4, 4)).assertTrue();
      expect(NumberUtils.isInRange(5, 4, 4)).assertFalse();
      // A swapped range is empty, nothing can satisfy it.
      expect(NumberUtils.isInRange(4, 10, 0)).assertFalse();
      expect(NumberUtils.isInRange(5, 10, 0)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0128
     * @tc.name      testNumberUtils0029
     * @tc.desc      Verify one step outside the bounds on both sides is rejected for integer ranges.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberUtils0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberUtils0029';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const min: number = 3;
      const max: number = 9;
      expect(NumberUtils.isInRange(min - 1, min, max)).assertFalse();
      expect(NumberUtils.isInRange(min, min, max)).assertTrue();
      expect(NumberUtils.isInRange(max, min, max)).assertTrue();
      expect(NumberUtils.isInRange(max + 1, min, max)).assertFalse();
      // Filling the whole inclusive range gives max - min + 1 hits.
      let hits: number = 0;
      for (let value: number = min - 1; value <= max + 1; value++) {
        if (NumberUtils.isInRange(value, min, max)) {
          hits++;
        }
      }
      expect(hits).assertEqual(max - min + 1);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0129
     * @tc.name      testNumberUtils0030
     * @tc.desc      Verify NaN and the infinities are never reported as inside a finite range.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberUtils0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberUtils0030';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.isInRange(NaN, 0, 10)).assertFalse();
      expect(NumberUtils.isInRange(NaN, -Infinity, Infinity)).assertFalse();
      expect(NumberUtils.isInRange(Infinity, 0, 10)).assertFalse();
      expect(NumberUtils.isInRange(-Infinity, 0, 10)).assertFalse();
      // Infinity is only inside an unbounded range, and even then only on the right side.
      expect(NumberUtils.isInRange(Infinity, 0, Infinity)).assertTrue();
      expect(NumberUtils.isInRange(-Infinity, -Infinity, 0)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0130
     * @tc.name      testNumberUtils0031
     * @tc.desc      Verify every catalog fixed case produces the exact documented text.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0031';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: FixedCase[] = NumericCaseCatalog.fixedCases();
      expect(cases.length).assertEqual(19);
      for (const item of cases) {
        const actual: string = NumberUtils.toFixedString(item.value, item.digits);
        expect(actual).assertEqual(item.expected);
        // The produced text must be a plain decimal without exponent notation.
        expect(looksLikePlainDecimal(actual)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0131
     * @tc.name      testNumberUtils0032
     * @tc.desc      Verify the requested fraction digit count is honoured for representable values.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0032';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.toFixedString(0, 0)).assertEqual('0');
      expect(NumberUtils.toFixedString(0, 2)).assertEqual('0.00');
      expect(NumberUtils.toFixedString(0.5, 2)).assertEqual('0.50');
      expect(NumberUtils.toFixedString(1.5, 2)).assertEqual('1.50');
      expect(NumberUtils.toFixedString(1.25, 3)).assertEqual('1.250');
      expect(NumberUtils.toFixedString(-0.75, 2)).assertEqual('-0.75');
      expect(NumberUtils.toFixedString(100, 1)).assertEqual('100.0');
      // Counting the digits proves the padding really happened.
      expect(countFractionDigits(NumberUtils.toFixedString(1.25, 3))).assertEqual(3);
      expect(countFractionDigits(NumberUtils.toFixedString(100, 0))).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0132
     * @tc.name      testNumberUtils0033
     * @tc.desc      Verify rounding to zero fraction digits follows the documented half-away rules.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberUtils0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberUtils0033';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.toFixedString(7.8, 0)).assertEqual('8');
      expect(NumberUtils.toFixedString(2.4, 0)).assertEqual('2');
      expect(NumberUtils.toFixedString(-2.4, 0)).assertEqual('-2');
      // A positive value never gains a minus sign.
      expect(NumberUtils.toFixedString(2.4, 0).indexOf('-')).assertEqual(-1);
      // A negative value keeps exactly one minus sign at the head.
      const negative: string = NumberUtils.toFixedString(-2.4, 0);
      expect(negative.charAt(0)).assertEqual('-');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0133
     * @tc.name      testNumberUtils0034
     * @tc.desc      Verify out-of-range digit counts are clamped to zero fraction digits instead of throwing.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberUtils0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberUtils0034';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // Negative digits fall back to toFixed(0).
      expect(NumberUtils.toFixedString(7.8, -1)).assertEqual('8');
      expect(NumberUtils.toFixedString(7.8, -100)).assertEqual('8');
      // Non finite digit counts are rejected by the same guard.
      expect(NumberUtils.toFixedString(2.4, NaN)).assertEqual('2');
      expect(NumberUtils.toFixedString(2.4, Infinity)).assertEqual('2');
      expect(NumberUtils.toFixedString(2.4, -Infinity)).assertEqual('2');
      // Every rejected digit count yields integer text only.
      expect(countFractionDigits(NumberUtils.toFixedString(2.4, NaN))).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0134
     * @tc.name      testNumberUtils0035
     * @tc.desc      Verify toFixedString keeps exactly one hundred fraction digits for 1, producing a 102 character text.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberUtils0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberUtils0035';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const atLimit: string = NumberUtils.toFixedString(1, MAX_FRACTION_DIGITS);
      const expectedText: string = buildHundredDigitText();
      expect(atLimit).assertEqual(expectedText);
      expect(countFractionDigits(atLimit)).assertEqual(MAX_FRACTION_DIGITS);
      // The text is 2 characters of head plus 100 fraction digits.
      expect(atLimit.length).assertEqual(2 + MAX_FRACTION_DIGITS);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0135
     * @tc.name      testNumberUtils0036
     * @tc.desc      Verify a digit count of one hundred and one is clamped to the hundred digit limit.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberUtils0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberUtils0036';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const overLimit: FixedCase | null = NumericCaseCatalog.fixedCase('over-limit-digits');
      expect(overLimit !== null).assertTrue();
      if (overLimit === null) {
        hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
        return;
      }
      expect(overLimit.digits).assertEqual(OVER_LIMIT_DIGITS);
      expect(overLimit.clampedDigits).assertTrue();
      const actual: string = NumberUtils.toFixedString(overLimit.value, overLimit.digits);
      // The clamped result equals the literal hundred digit expectation.
      expect(actual).assertEqual(overLimit.expected);
      // It also equals the value produced by the maximum supported digit count.
      const atLimit: string = NumberUtils.toFixedString(overLimit.value, MAX_FRACTION_DIGITS);
      expect(actual).assertEqual(atLimit);
      expect(countFractionDigits(actual)).assertEqual(MAX_FRACTION_DIGITS);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0136
     * @tc.name      testNumberUtils0037
     * @tc.desc      Verify digit counts far beyond the limit all collapse onto the same clamped output.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumberUtils0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumberUtils0037';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const reference: string = NumberUtils.toFixedString(1, MAX_FRACTION_DIGITS);
      const farDigits: number[] = [101, 150, 1000, 100000];
      for (const digits of farDigits) {
        expect(NumberUtils.toFixedString(1, digits)).assertEqual(reference);
      }
      // Values other than one keep the same clamped digit count.
      const zeroReference: string = NumberUtils.toFixedString(0, MAX_FRACTION_DIGITS);
      expect(NumberUtils.toFixedString(0, OVER_LIMIT_DIGITS)).assertEqual(zeroReference);
      expect(countFractionDigits(zeroReference)).assertEqual(MAX_FRACTION_DIGITS);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0137
     * @tc.name      testNumberUtils0038
     * @tc.desc      Verify toFixedString propagates the special numeric values in their engine defined text form.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumberUtils0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumberUtils0038';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // NaN and the infinities are echoed in their canonical text form,
      // no exception is thrown and no digit padding is applied.
      expect(NumberUtils.toFixedString(NaN, 2)).assertEqual('NaN');
      expect(NumberUtils.toFixedString(Infinity, 2)).assertEqual('Infinity');
      expect(NumberUtils.toFixedString(-Infinity, 2)).assertEqual('-Infinity');
      // Even the rejected digit branch keeps the special text.
      expect(NumberUtils.toFixedString(NaN, -1)).assertEqual('NaN');
      expect(NumberUtils.toFixedString(Infinity, OVER_LIMIT_DIGITS)).assertEqual('Infinity');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0138
     * @tc.name      testNumberUtils0039
     * @tc.desc      Verify every catalog file size case produces the exact documented unit string.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0039';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: SizeCase[] = NumericCaseCatalog.sizeCases();
      expect(cases.length).assertEqual(22);
      for (const item of cases) {
        const actual: string = NumberUtils.formatFileSize(item.bytes);
        expect(actual).assertEqual(item.expected);
        // Every formatted size ends with one of the five supported units.
        const endsWithUnit: boolean = actual.endsWith('B') || actual.endsWith('KB')
          || actual.endsWith('MB') || actual.endsWith('GB') || actual.endsWith('TB');
        expect(endsWithUnit).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0139
     * @tc.name      testNumberUtils0040
     * @tc.desc      Verify the kilobyte boundary keeps one thousand and twenty three bytes in the byte unit.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0040';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.formatFileSize(0)).assertEqual('0.00B');
      expect(NumberUtils.formatFileSize(1)).assertEqual('1.00B');
      expect(NumberUtils.formatFileSize(100)).assertEqual('100.00B');
      expect(NumberUtils.formatFileSize(LAST_BYTE_BEFORE_KB)).assertEqual('1023.00B');
      // One byte below the boundary still uses the byte unit.
      expect(NumberUtils.formatFileSize(LAST_BYTE_BEFORE_KB).endsWith('B')).assertTrue();
      expect(NumberUtils.formatFileSize(LAST_BYTE_BEFORE_KB).endsWith('KB')).assertFalse();
      // Exactly one kilobyte switches the unit.
      expect(NumberUtils.formatFileSize(BYTES_PER_KB)).assertEqual('1.00KB');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0140
     * @tc.name      testNumberUtils0041
     * @tc.desc      Verify the megabyte boundary switches to the next unit exactly at one million and forty eight thousand five hundred and seventy six bytes.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0041';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // 1048575 bytes is one byte short of a megabyte and is reported in kilobytes.
      expect(NumberUtils.formatFileSize(1048575)).assertEqual('1024.00KB');
      expect(NumberUtils.formatFileSize(LAST_BYTE_BEFORE_MB)).assertEqual('1024.00KB');
      expect(NumberUtils.formatFileSize(BYTES_PER_MB)).assertEqual('1.00MB');
      // The half megabyte figures scale with the 1/2 factor of the catalog.
      expect(NumberUtils.formatFileSize(BYTES_PER_KB * 2)).assertEqual('2.00KB');
      expect(NumberUtils.formatFileSize(BYTES_PER_KB + BYTES_PER_KB / 2)).assertEqual('1.50KB');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0141
     * @tc.name      testNumberUtils0042
     * @tc.desc      Verify the gigabyte and terabyte boundaries switch units only at the exact powers of one thousand and twenty four.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberUtils0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberUtils0042';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.formatFileSize(LAST_BYTE_BEFORE_GB)).assertEqual('1024.00MB');
      expect(NumberUtils.formatFileSize(BYTES_PER_GB)).assertEqual('1.00GB');
      expect(NumberUtils.formatFileSize(LAST_BYTE_BEFORE_TB)).assertEqual('1024.00GB');
      expect(NumberUtils.formatFileSize(BYTES_PER_TB)).assertEqual('1.00TB');
      expect(NumberUtils.formatFileSize(BYTES_PER_TB * 2)).assertEqual('2.00TB');
      // Half units are expressible and keep two fraction digits.
      expect(NumberUtils.formatFileSize(BYTES_PER_MB + BYTES_PER_MB / 2)).assertEqual('1.50MB');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0142
     * @tc.name      testNumberUtils0043
     * @tc.desc      Verify one petabyte stays in the terabyte unit because terabyte is the last supported unit.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberUtils0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberUtils0043';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(BYTES_PER_PB).assertEqual(BYTES_PER_TB * BYTES_PER_KB);
      expect(NumberUtils.formatFileSize(BYTES_PER_PB)).assertEqual('1024.00TB');
      // The unit list stops at terabyte, so the text never uses a petabyte suffix.
      expect(NumberUtils.formatFileSize(BYTES_PER_PB).endsWith('TB')).assertTrue();
      expect(NumberUtils.formatFileSize(BYTES_PER_PB).endsWith('PB')).assertFalse();
      // Ten petabytes keeps growing the numeric part inside the terabyte unit.
      expect(NumberUtils.formatFileSize(BYTES_PER_PB * 10)).assertEqual('10240.00TB');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0143
     * @tc.name      testNumberUtils0044
     * @tc.desc      Verify negative byte counts are normalized to zero bytes.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumberUtils0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumberUtils0044';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.formatFileSize(-1)).assertEqual('0.00B');
      expect(NumberUtils.formatFileSize(-BYTES_PER_MB)).assertEqual('0.00B');
      expect(NumberUtils.formatFileSize(-BYTES_PER_TB)).assertEqual('0.00B');
      // Negative sizes never leak a minus sign into the output.
      expect(NumberUtils.formatFileSize(-BYTES_PER_MB).indexOf('-')).assertEqual(-1);
      // Negative zero is not negative after comparison with zero, so it stays zero bytes.
      expect(NumberUtils.formatFileSize(-0)).assertEqual('0.00B');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0144
     * @tc.name      testNumberUtils0045
     * @tc.desc      Verify NaN and the infinities are treated as zero bytes instead of producing invalid unit text.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberUtils0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberUtils0045';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(NumberUtils.formatFileSize(NaN)).assertEqual('0.00B');
      expect(NumberUtils.formatFileSize(Infinity)).assertEqual('0.00B');
      expect(NumberUtils.formatFileSize(-Infinity)).assertEqual('0.00B');
      // No NaN or Infinity text can survive into the formatted result.
      expect(NumberUtils.formatFileSize(NaN).indexOf('NaN')).assertEqual(-1);
      expect(NumberUtils.formatFileSize(Infinity).indexOf('Infinity')).assertEqual(-1);
      expect(NumberUtils.formatFileSize(Infinity)).assertEqual(NumberUtils.formatFileSize(0));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0145
     * @tc.name      testNumberUtils0046
     * @tc.desc      Verify single catalog size labels keep their exact documented formatting.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumberUtils0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumberUtils0046';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const labels: string[] = ['zero-byte', 'last-byte', 'exactly-one-kb', 'byte-before-mb',
        'exactly-one-tb', 'beyond-tb-range'];
      for (const label of labels) {
        const item: SizeCase | null = NumericCaseCatalog.sizeCase(label);
        expect(item !== null).assertTrue();
        if (item !== null) {
          expect(NumberUtils.formatFileSize(item.bytes)).assertEqual(item.expected);
        }
      }
      // Every looked up label must resolve, an unknown label yields null.
      expect(NumericCaseCatalog.sizeCase('no-such-label')).assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0146
     * @tc.name      testNumberUtils0047
     * @tc.desc      Verify clamp followed by isInRange always succeeds for every catalog clamp case.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberUtils0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberUtils0047';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      for (const item of NumericCaseCatalog.clampCases()) {
        const clamped: number = NumberUtils.clamp(item.value, item.min, item.max);
        // Swap the bounds back so the probe sees the logical range.
        const low: number = Math.min(item.min, item.max);
        const high: number = Math.max(item.min, item.max);
        expect(NumberUtils.isInRange(clamped, low, high)).assertTrue();
      }
      // Outside values first fail the probe, after clamping they pass.
      expect(NumberUtils.isInRange(999, RANGE_LOW, RANGE_HIGH)).assertFalse();
      expect(NumberUtils.isInRange(NumberUtils.clamp(999, RANGE_LOW, RANGE_HIGH), RANGE_LOW, RANGE_HIGH))
        .assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0147
     * @tc.name      testNumberUtils0048
     * @tc.desc      Verify isInRange agrees with clamp for a dense integer sweep over a symmetric range.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumberUtils0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumberUtils0048';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      let insideCount: number = 0;
      let changedCount: number = 0;
      for (let value: number = -150; value <= 150; value++) {
        const inside: boolean = NumberUtils.isInRange(value, RANGE_LOW, RANGE_HIGH);
        const clamped: number = NumberUtils.clamp(value, RANGE_LOW, RANGE_HIGH);
        if (inside) {
          insideCount++;
          // A value already inside the range is not modified by clamp.
          expect(clamped).assertEqual(value);
        } else {
          changedCount++;
          // A value outside the range is moved onto exactly one of the bounds.
          expect(clamped === RANGE_LOW || clamped === RANGE_HIGH).assertTrue();
        }
      }
      // The sweep visits 301 integers, 201 of them are inside the range.
      expect(insideCount).assertEqual(RANGE_HIGH - RANGE_LOW + 1);
      expect(changedCount).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0148
     * @tc.name      testNumberUtils0049
     * @tc.desc      Verify parsing then probing treats parseable text as finite and unparseable text as the fallback.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumberUtils0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumberUtils0049';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      for (const item of NumericCaseCatalog.intParseCases()) {
        const parsed: number = NumberUtils.parseIntSafe(item.text, DEFAULT_SENTINEL);
        if (item.valid) {
          // Any successful integer parse is a finite number.
          expect(NumberUtils.isFiniteNumber(parsed)).assertTrue();
        } else {
          // The fallback sentinel is finite as well, but it is a known constant.
          expect(parsed).assertEqual(DEFAULT_SENTINEL);
          expect(NumberUtils.isFiniteNumber(parsed)).assertTrue();
        }
      }
      // A rejected parse can never be mistaken for a successful one.
      const rejected: number = NumberUtils.parseIntSafe('abc', DEFAULT_SENTINEL);
      expect(rejected === DEFAULT_SENTINEL).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0149
     * @tc.name      testNumberUtils0050
     * @tc.desc      Verify fixed formatting, size formatting and clamping stay consistent on the same magnitude.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumberUtils0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumberUtils0050';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // formatFileSize always keeps two fraction digits, matching toFixedString(x, 2).
      const bytes: number = BYTES_PER_KB + BYTES_PER_KB / 2;
      expect(NumberUtils.formatFileSize(bytes)).assertEqual(NumberUtils.toFixedString(1.5, 2) + 'KB');
      // Zero clamps to the lower bound and formats to the same byte text.
      expect(NumberUtils.formatFileSize(NumberUtils.clamp(-5, 0, 100))).assertEqual('0.00B');
      // A clamped kilobyte value keeps the kilobyte unit.
      const clampedKb: number = NumberUtils.clamp(BYTES_PER_MB * 100, BYTES_PER_KB, BYTES_PER_MB);
      expect(clampedKb).assertEqual(BYTES_PER_MB);
      expect(NumberUtils.formatFileSize(clampedKb)).assertEqual('1.00MB');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0150
     * @tc.name      testNumberUtils0051
     * @tc.desc      Verify the same invalid input yields different results under different fallbacks for both parsers.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberUtils0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberUtils0051';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const badText: string = 'not-a-number';
      const intDefaultA: number = NumberUtils.parseIntSafe(badText, DEFAULT_NEGATIVE);
      const intDefaultB: number = NumberUtils.parseIntSafe(badText, DEFAULT_ZERO);
      const floatDefaultA: number = NumberUtils.parseFloatSafe(badText, DEFAULT_NEGATIVE);
      const floatDefaultB: number = NumberUtils.parseFloatSafe(badText, DEFAULT_ZERO);
      expect(intDefaultA).assertEqual(DEFAULT_NEGATIVE);
      expect(intDefaultB).assertEqual(DEFAULT_ZERO);
      expect(floatDefaultA).assertEqual(DEFAULT_NEGATIVE);
      expect(floatDefaultB).assertEqual(DEFAULT_ZERO);
      // The two runs must be distinguishable, that is the whole point of the fallback.
      expect(intDefaultA === intDefaultB).assertFalse();
      expect(floatDefaultA === floatDefaultB).assertFalse();
      // Both parsers share the same fallback policy for the same input.
      expect(intDefaultA).assertEqual(floatDefaultA);
      expect(intDefaultB).assertEqual(floatDefaultB);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0151
     * @tc.name      testNumberUtils0052
     * @tc.desc      Verify parseFallback then clamp then isInRange produces a value that always satisfies the range probe.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumberUtils0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumberUtils0052';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const texts: string[] = ['12', 'abc', '', '-40', '1e3', '  7  ', '   ', 'NaN'];
      for (const text of texts) {
        const parsed: number = NumberUtils.parseIntSafe(text, DEFAULT_SENTINEL);
        const clamped: number = NumberUtils.clamp(parsed, 0, 10);
        expect(NumberUtils.isInRange(clamped, 0, 10)).assertTrue();
        // A far negative fallback is saturated to the lower bound.
        if (parsed === DEFAULT_SENTINEL) {
          expect(clamped).assertEqual(0);
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0152
     * @tc.name      testNumberUtils0053
     * @tc.desc      Verify a bulk pipe of parser, probe, clamp and formatter produces stable and finite text.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumberUtils0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumberUtils0053';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      for (const item of NumericCaseCatalog.floatParseCases()) {
        const parsed: number = NumberUtils.parseFloatSafe(item.text, DEFAULT_ZERO);
        const bounded: number = NumberUtils.clamp(parsed, -1000, 1000);
        expect(NumberUtils.isInRange(bounded, -1000, 1000)).assertTrue();
        // Except for NaN, every bounded value is finite and formats to plain text.
        if (!Number.isNaN(bounded)) {
          expect(NumberUtils.isFiniteNumber(bounded)).assertTrue();
          const text: string = NumberUtils.toFixedString(bounded, 2);
          expect(looksLikePlainDecimal(text)).assertTrue();
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0153
     * @tc.name      testNumberUtils0054
     * @tc.desc      Verify every helper catalog lookup returns the documented record or null for unknown labels.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumberUtils0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumberUtils0054';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const intCase: IntParseCase | null = NumericCaseCatalog.intCase('multi-digit');
      expect(intCase !== null).assertTrue();
      if (intCase !== null) {
        expect(NumberUtils.parseIntSafe(intCase.text, DEFAULT_NEGATIVE)).assertEqual(intCase.expected);
      }
      const floatCase: FloatParseCase | null = NumericCaseCatalog.floatCase('simple-decimal');
      expect(floatCase !== null).assertTrue();
      if (floatCase !== null) {
        expect(NumberUtils.parseFloatSafe(floatCase.text, DEFAULT_NEGATIVE)).assertClose(1.5, BINARY_DELTA);
      }
      // Unknown labels resolve to null and must not be treated as matches.
      expect(NumericCaseCatalog.intCase('missing-label')).assertNull();
      expect(NumericCaseCatalog.floatCase('missing-label')).assertNull();
      expect(NumericCaseCatalog.clampCase('missing-label')).assertNull();
      expect(NumericCaseCatalog.sizeCase('missing-label')).assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0154
     * @tc.name      testNumberUtils0055
     * @tc.desc      Verify repeated calls on the same input are deterministic and return identical results.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumberUtils0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumberUtils0055';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const padded: IntParseCase | null = NumericCaseCatalog.intCase('both-spaces');
      expect(padded !== null).assertTrue();
      if (padded !== null) {
        const first: number = NumberUtils.parseIntSafe(padded.text, DEFAULT_NEGATIVE);
        const second: number = NumberUtils.parseIntSafe(padded.text, DEFAULT_NEGATIVE);
        expect(first).assertEqual(second);
        expect(first).assertEqual(padded.expected);
        // The probe never mutates the parsed value.
        const probeA: boolean = NumberUtils.isFiniteNumber(first);
        const probeB: boolean = NumberUtils.isFiniteNumber(first);
        expect(probeA).assertEqual(probeB);
        expect(probeA).assertTrue();
      }
      const sizeFirst: string = NumberUtils.formatFileSize(LAST_BYTE_BEFORE_KB);
      const sizeSecond: string = NumberUtils.formatFileSize(LAST_BYTE_BEFORE_KB);
      expect(sizeFirst).assertEqual(sizeSecond);
      // clamp is a pure function of its three arguments.
      expect(NumberUtils.clamp(12, 0, 10)).assertEqual(NumberUtils.clamp(12, 0, 10));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0155
     * @tc.name      testNumberUtils0056
     * @tc.desc      Verify the produced size text keeps exactly two fraction digits across every unit.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumberUtils0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumberUtils0056';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const probes: number[] = [0, 1, LAST_BYTE_BEFORE_KB, BYTES_PER_KB, LAST_BYTE_BEFORE_MB,
        BYTES_PER_MB, BYTES_PER_GB + 12345, BYTES_PER_TB + 99];
      for (const bytes of probes) {
        const text: string = NumberUtils.formatFileSize(bytes);
        // Strip the unit suffix, the numeric head must keep two fraction digits.
        let numericHead: string = text;
        while (numericHead.length > 0 && !(numericHead.charAt(numericHead.length - 1) >= '0'
          && numericHead.charAt(numericHead.length - 1) <= '9')) {
          numericHead = numericHead.substring(0, numericHead.length - 1);
        }
        expect(countFractionDigits(numericHead)).assertEqual(2);
        expect(looksLikePlainDecimal(numericHead)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0156
     * @tc.name      testNumberUtils0057
     * @tc.desc      Verify a monotonic byte sweep never produces a decreasing numeric head inside one unit.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumberUtils0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumberUtils0057';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      // Inside the kilobyte unit the reported value never decreases as the byte count grows.
      let previous: number = -1;
      let steps: number = 0;
      for (let bytes: number = BYTES_PER_KB; bytes < BYTES_PER_KB * 2; bytes += 128) {
        const text: string = NumberUtils.formatFileSize(bytes);
        const numeric: number = Number.parseFloat(text);
        expect(numeric >= previous).assertTrue();
        expect(NumberUtils.isFiniteNumber(numeric)).assertTrue();
        previous = numeric;
        steps++;
      }
      // 1024, 1152, ..., 1920 gives eight probes, all inside the kilobyte unit.
      expect(steps).assertEqual(8);
      // The first probe sits exactly on the kilobyte boundary.
      expect(NumberUtils.formatFileSize(BYTES_PER_KB)).assertEqual('1.00KB');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_NUMBER_0157
     * @tc.name      testNumberUtils0058
     * @tc.desc      Verify small negative byte counts format as '0.00B', unlike their positive counterparts, and that 0 and -0 format identically.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumberUtils0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumberUtils0058';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const magnitudes: number[] = [1, 42, 512, LAST_BYTE_BEFORE_KB];
      for (const magnitude of magnitudes) {
        const positive: string = NumberUtils.formatFileSize(magnitude);
        const negative: string = NumberUtils.formatFileSize(-magnitude);
        // The negative side is normalized to zero, never mirrored.
        expect(negative).assertEqual('0.00B');
        expect(positive === negative).assertFalse();
      }
      // Zero itself is the only value equal to its own negation after formatting.
      expect(NumberUtils.formatFileSize(0)).assertEqual(NumberUtils.formatFileSize(-0));
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });
  });
}
