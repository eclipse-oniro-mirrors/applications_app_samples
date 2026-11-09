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
import { BasicUtil } from 'library';
import { NumberSequenceUtil, NumberFrequency } from './support/NumberSequenceUtil';
const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_NumberSequence]';
// One expected membership row of the prime table.
interface PrimeRow {
  value: number;
  expected: boolean;
  label: string;
}
// One expected pair for the gcd table.
interface GcdRow {
  a: number;
  b: number;
  gcd: number;
  lcm: number;
}
// One expected factorial row.
interface FactorialRow {
  n: number;
  expected: number;
}
// One expected digit helper row.
interface DigitRow {
  value: number;
  sum: number;
  reversed: number;
  palindrome: boolean;
  armstrong: boolean;
}
// One expected base conversion row.
interface BaseRow {
  value: number;
  base: number;
  text: string;
}
// One expected parse row, NaN results are checked through the row flag.
interface ParseRow {
  text: string;
  base: number;
  value: number;
  valid: boolean;
}
// One expected clamp row.
interface ClampRow {
  value: number;
  min: number;
  max: number;
  expected: number;
}
// One expected rounding row.
interface RoundRow {
  value: number;
  digits: number;
  expected: number;
}
// One expected percent row.
interface PercentRow {
  part: number;
  total: number;
  expected: number;
}
// One expected width row of the fixed width formatter.
interface WidthRow {
  value: number;
  width: number;
  text: string;
}
// Prime membership table used by the prime test case.
const PRIME_ROWS: PrimeRow[] = [
  { value: -7, expected: false, label: 'negative operand' },
  { value: -1, expected: false, label: 'negative unit' },
  { value: 0, expected: false, label: 'zero' },
  { value: 1, expected: false, label: 'unit' },
  { value: 2, expected: true, label: 'smallest prime' },
  { value: 3, expected: true, label: 'second prime' },
  { value: 4, expected: false, label: 'first even composite' },
  { value: 9, expected: false, label: 'square composite' },
  { value: 25, expected: false, label: 'odd square composite' },
  { value: 49, expected: false, label: 'seven squared' },
  { value: 97, expected: true, label: 'largest two digit prime' },
  { value: 101, expected: true, label: 'first three digit prime' },
  { value: 561, expected: false, label: 'carmichael composite' },
  { value: 7919, expected: true, label: 'four digit prime' }
];
// gcd and lcm table used by the pair test case.
const GCD_ROWS: GcdRow[] = [
  { a: 12, b: 18, gcd: 6, lcm: 36 },
  { a: 18, b: 12, gcd: 6, lcm: 36 },
  { a: 7, b: 13, gcd: 1, lcm: 91 },
  { a: 0, b: 5, gcd: 5, lcm: 0 },
  { a: 5, b: 0, gcd: 5, lcm: 0 },
  { a: 0, b: 0, gcd: 0, lcm: 0 },
  { a: -12, b: 18, gcd: 6, lcm: 36 },
  { a: 100, b: 75, gcd: 25, lcm: 300 },
  { a: 1, b: 1, gcd: 1, lcm: 1 },
  { a: 48, b: 180, gcd: 12, lcm: 720 },
  { a: 2, b: 3, gcd: 1, lcm: 6 },
  { a: 17, b: 17, gcd: 17, lcm: 17 },
  { a: 6, b: 35, gcd: 1, lcm: 210 }
];
// factorial table used by the factorial test case.
const FACTORIAL_ROWS: FactorialRow[] = [
  { n: 0, expected: 1 },
  { n: 1, expected: 1 },
  { n: 2, expected: 2 },
  { n: 3, expected: 6 },
  { n: 4, expected: 24 },
  { n: 5, expected: 120 },
  { n: 6, expected: 720 },
  { n: 7, expected: 5040 },
  { n: 8, expected: 40320 },
  { n: 9, expected: 362880 },
  { n: 11, expected: 39916800 },
  { n: 10, expected: 3628800 }
];
// digit helper table, every row lists the four expected digit answers.
const DIGIT_ROWS: DigitRow[] = [
  { value: 0, sum: 0, reversed: 0, palindrome: true, armstrong: true },
  { value: 5, sum: 5, reversed: 5, palindrome: true, armstrong: true },
  { value: 12, sum: 3, reversed: 21, palindrome: false, armstrong: false },
  { value: 1, sum: 1, reversed: 1, palindrome: true, armstrong: true },
  { value: 10, sum: 1, reversed: 1, palindrome: false, armstrong: false },
  { value: 100, sum: 1, reversed: 1, palindrome: false, armstrong: false },
  { value: 121, sum: 4, reversed: 121, palindrome: true, armstrong: false },
  { value: 153, sum: 9, reversed: 351, palindrome: false, armstrong: true },
  { value: 370, sum: 10, reversed: 73, palindrome: false, armstrong: true },
  { value: 1001, sum: 2, reversed: 1001, palindrome: true, armstrong: false },
  { value: 9474, sum: 24, reversed: 4749, palindrome: false, armstrong: true },
  { value: 12321, sum: 9, reversed: 12321, palindrome: true, armstrong: false },
  { value: 999, sum: 27, reversed: 999, palindrome: true, armstrong: false }
];
// base conversion table, all texts are lowercase as produced by toBaseString.
const BASE_ROWS: BaseRow[] = [
  { value: 0, base: 2, text: '0' },
  { value: 1, base: 2, text: '1' },
  { value: 5, base: 2, text: '101' },
  { value: 255, base: 16, text: 'ff' },
  { value: 4095, base: 16, text: 'fff' },
  { value: 64, base: 8, text: '100' },
  { value: 100, base: 10, text: '100' },
  { value: 35, base: 36, text: 'z' },
  { value: 36, base: 36, text: '10' },
  { value: 1295, base: 36, text: 'zz' },
  { value: 255, base: 2, text: '11111111' },
  { value: 1000, base: 16, text: '3e8' },
  { value: 1000, base: 8, text: '1750' },
  { value: -10, base: 16, text: '-a' }
];
// parse table, the valid flag marks rows that must resolve to a number.
const PARSE_ROWS: ParseRow[] = [
  { text: '101', base: 2, value: 5, valid: true },
  { text: 'ff', base: 16, value: 255, valid: true },
  { text: 'FF', base: 16, value: 255, valid: true },
  { text: '0', base: 10, value: 0, valid: true },
  { text: '-a', base: 16, value: -10, valid: true },
  { text: 'z', base: 36, value: 35, valid: true },
  { text: '12', base: 2, value: 0, valid: false },
  { text: 'g', base: 16, value: 0, valid: false },
  { text: '', base: 10, value: 0, valid: false },
  { text: '-', base: 10, value: 0, valid: false },
  { text: 'Zz', base: 36, value: 1295, valid: true },
  { text: '777', base: 8, value: 511, valid: true },
  { text: '1000', base: 16, value: 4096, valid: true },
  { text: '8', base: 8, value: 0, valid: false }
];
// clamp table covering in range, below, above and inverted bounds.
const CLAMP_ROWS: ClampRow[] = [
  { value: 5, min: 0, max: 10, expected: 5 },
  { value: -5, min: 0, max: 10, expected: 0 },
  { value: 15, min: 0, max: 10, expected: 10 },
  { value: 0, min: 0, max: 10, expected: 0 },
  { value: 10, min: 0, max: 10, expected: 10 },
  { value: 3.9, min: 0, max: 10, expected: 3 },
  { value: -3.9, min: 0, max: 10, expected: 0 },
  { value: 4, min: 10, max: 0, expected: 4 },
  { value: 99, min: 10, max: 0, expected: 10 },
  { value: -99, min: 10, max: 0, expected: 0 },
  { value: 100, min: 50, max: 5000, expected: 100 },
  { value: 4999, min: 50, max: 5000, expected: 4999 },
  { value: -200, min: 50, max: 5000, expected: 50 }
];
// rounding table covering positive, negative and multi digit cases.
const ROUND_ROWS: RoundRow[] = [
  { value: 1.234, digits: 2, expected: 1.23 },
  { value: 1.235, digits: 2, expected: 1.24 },
  { value: 1.5, digits: 0, expected: 2 },
  { value: 2.5, digits: 0, expected: 3 },
  { value: -1.5, digits: 0, expected: -1 },
  { value: 1234, digits: -2, expected: 1200 },
  { value: 1250, digits: -2, expected: 1300 },
  { value: 0.0004, digits: 3, expected: 0 },
  { value: 9.995, digits: 2, expected: 9.99 },
  { value: 0.5, digits: 0, expected: 1 },
  { value: -0.4, digits: 0, expected: 0 },
  { value: 12.3456, digits: 3, expected: 12.346 }
];
// percent table used by the percentOf case.
const PERCENT_ROWS: PercentRow[] = [
  { part: 1, total: 4, expected: 25 },
  { part: 1, total: 2, expected: 50 },
  { part: 3, total: 4, expected: 75 },
  { part: 4, total: 4, expected: 100 },
  { part: 0, total: 4, expected: 0 },
  { part: 5, total: 0, expected: 0 },
  { part: 1, total: 3, expected: 100 / 3 },
  { part: -1, total: 4, expected: -25 },
  { part: 2, total: 5, expected: 40 },
  { part: 9, total: 10, expected: 90 },
  { part: 12, total: 16, expected: 75 }
];
// fixed width table used by the width case.
const WIDTH_ROWS: WidthRow[] = [
  { value: 0, width: 2, text: '00' },
  { value: 7, width: 2, text: '07' },
  { value: 12, width: 2, text: '12' },
  { value: 123, width: 2, text: '23' },
  { value: 5, width: 4, text: '0005' },
  { value: 1234, width: 4, text: '1234' },
  { value: -7, width: 2, text: '-07' },
  { value: 12, width: 5, text: '00012' },
  { value: -12, width: 5, text: '-00012' },
  { value: 999, width: 1, text: '9' }
];
export default function numberSequenceMatrixTest() {
  describe('NumberSequenceMatrixTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'NumberSequenceMatrixTest suite start');
    });
    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'NumberSequenceMatrixTest suite end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_0100
     * @tc.name      testRangeAscending0001
     * @tc.desc      Verify the ascending range helper covers inclusive boundaries and honours custom steps.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRangeAscending0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRangeAscending0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const natural: number[] = NumberSequenceUtil.range(1, 5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'range(1, 5) length ' + natural.length);
      expect(natural.length).assertEqual(5);
      expect(natural[0]).assertEqual(1);
      expect(natural[4]).assertEqual(5);
      expect(NumberSequenceUtil.isAscending(natural)).assertTrue();
      expect(NumberSequenceUtil.isSameSeries(natural, [1, 2, 3, 4, 5])).assertTrue();
      const even: number[] = NumberSequenceUtil.range(0, 10, 2);
      expect(even.length).assertEqual(6);
      expect(even[0]).assertEqual(0);
      expect(even[5]).assertEqual(10);
      const stepped: number[] = NumberSequenceUtil.range(1, 10, 3);
      expect(NumberSequenceUtil.isSameSeries(stepped, [1, 4, 7, 10])).assertTrue();
      const single: number[] = NumberSequenceUtil.range(7, 7);
      expect(single.length).assertEqual(1);
      expect(single[0]).assertEqual(7);
      const singleStepped: number[] = NumberSequenceUtil.range(7, 7, 3);
      expect(singleStepped.length).assertEqual(1);
      expect(singleStepped[0]).assertEqual(7);
      const emptySpan: number[] = NumberSequenceUtil.range(5, 5, 1);
      expect(emptySpan.length).assertEqual(1);
      const wide: number[] = NumberSequenceUtil.range(1, 100, 10);
      expect(wide.length).assertEqual(10);
      expect(wide[9]).assertEqual(91);
      expect(NumberSequenceUtil.maxOf(wide)).assertEqual(91);
      expect(NumberSequenceUtil.countInRange(wide, 40, 60)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_0200
     * @tc.name      testRangeBoundary0001
     * @tc.desc      Verify the range helper falls back to step one for zero, negative, NaN and infinite steps.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRangeBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRangeBoundary0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const zeroStep: number[] = NumberSequenceUtil.range(1, 3, 0);
      expect(zeroStep.length).assertEqual(3);
      expect(NumberSequenceUtil.isSameSeries(zeroStep, [1, 2, 3])).assertTrue();
      const negativeStep: number[] = NumberSequenceUtil.range(1, 3, -1);
      expect(NumberSequenceUtil.isSameSeries(negativeStep, [1, 2, 3])).assertTrue();
      const nanStep: number[] = NumberSequenceUtil.range(1, 3, NaN);
      expect(nanStep.length).assertEqual(3);
      const infiniteStep: number[] = NumberSequenceUtil.range(1, 3, Infinity);
      expect(infiniteStep.length).assertEqual(3);
      const fractional: number[] = NumberSequenceUtil.range(0, 1, 0.25);
      expect(fractional.length).assertEqual(5);
      expect(fractional[1]).assertEqual(0.25);
      expect(fractional[4]).assertEqual(1);
      const hugeStep: number[] = NumberSequenceUtil.range(1, 100, 1000);
      expect(hugeStep.length).assertEqual(1);
      expect(hugeStep[0]).assertEqual(1);
      const negativeRange: number[] = NumberSequenceUtil.range(-3, -1);
      expect(NumberSequenceUtil.isSameSeries(negativeRange, [-3, -2, -1])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_0300
     * @tc.name      testRangeDescending0001
     * @tc.desc      Verify the descending branch of the range helper when start is greater than end.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRangeDescending0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRangeDescending0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const descending: number[] = NumberSequenceUtil.range(10, 0, 5);
      expect(NumberSequenceUtil.isSameSeries(descending, [10, 5, 0])).assertTrue();
      expect(NumberSequenceUtil.isDescending(descending)).assertTrue();
      const natural: number[] = NumberSequenceUtil.range(3, 1);
      expect(NumberSequenceUtil.isSameSeries(natural, [3, 2, 1])).assertTrue();
      expect(natural.length).assertEqual(3);
      expect(natural[0]).assertEqual(3);
      expect(natural[2]).assertEqual(1);
      const zeroStep: number[] = NumberSequenceUtil.range(5, 1, 0);
      expect(NumberSequenceUtil.isSameSeries(zeroStep, [5, 4, 3, 2, 1])).assertTrue();
      const bigJump: number[] = NumberSequenceUtil.range(100, 0, 33);
      expect(NumberSequenceUtil.isSameSeries(bigJump, [100, 67, 34, 1])).assertTrue();
      expect(bigJump.length).assertEqual(4);
      const reversedNatural: number[] = NumberSequenceUtil.range(5, 1).reverse();
      expect(NumberSequenceUtil.isSameSeries(reversedNatural, NumberSequenceUtil.range(1, 5))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_0400
     * @tc.name      testArithmeticSeries0001
     * @tc.desc      Verify the arithmetic series helper builds the expected terms for positive, zero and negative differences.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArithmeticSeries0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArithmeticSeries0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const odd: number[] = NumberSequenceUtil.arithmeticSeries(1, 2, 5);
      expect(NumberSequenceUtil.isSameSeries(odd, [1, 3, 5, 7, 9])).assertTrue();
      expect(odd.length).assertEqual(5);
      const constant: number[] = NumberSequenceUtil.arithmeticSeries(4, 0, 4);
      expect(NumberSequenceUtil.isSameSeries(constant, [4, 4, 4, 4])).assertTrue();
      const decreasing: number[] = NumberSequenceUtil.arithmeticSeries(10, -3, 4);
      expect(NumberSequenceUtil.isSameSeries(decreasing, [10, 7, 4, 1])).assertTrue();
      expect(NumberSequenceUtil.isDescending(decreasing)).assertTrue();
      const single: number[] = NumberSequenceUtil.arithmeticSeries(8, 5, 1);
      expect(single.length).assertEqual(1);
      expect(single[0]).assertEqual(8);
      const empty: number[] = NumberSequenceUtil.arithmeticSeries(1, 1, 0);
      expect(empty.length).assertEqual(0);
      const negativeStart: number[] = NumberSequenceUtil.arithmeticSeries(-5, 5, 3);
      expect(NumberSequenceUtil.isSameSeries(negativeStart, [-5, 0, 5])).assertTrue();
      const diffs: number[] = NumberSequenceUtil.differences(odd);
      expect(NumberSequenceUtil.isSameSeries(diffs, [2, 2, 2, 2])).assertTrue();
      expect(NumberSequenceUtil.sum(odd)).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_0500
     * @tc.name      testArithmeticSeriesBoundary0001
     * @tc.desc      Verify the arithmetic series helper returns an empty array for illegal counts such as zero, negatives, NaN and infinity.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArithmeticSeriesBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArithmeticSeriesBoundary0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberSequenceUtil.arithmeticSeries(1, 1, 0).length).assertEqual(0);
      expect(NumberSequenceUtil.arithmeticSeries(1, 1, -1).length).assertEqual(0);
      expect(NumberSequenceUtil.arithmeticSeries(1, 1, -100).length).assertEqual(0);
      expect(NumberSequenceUtil.arithmeticSeries(1, 1, NaN).length).assertEqual(0);
      expect(NumberSequenceUtil.arithmeticSeries(1, 1, Infinity).length).assertEqual(0);
      expect(NumberSequenceUtil.arithmeticSeries(NaN, 1, 3).length).assertEqual(0);
      expect(NumberSequenceUtil.arithmeticSeries(1, NaN, 3).length).assertEqual(0);
      // A fractional count is compared with '<' against the running index, so 2.5 yields three terms.
      expect(NumberSequenceUtil.arithmeticSeries(1, 1, 2.5).length).assertEqual(3);
      const fractional: number[] = NumberSequenceUtil.arithmeticSeries(0.5, 0.5, 3);
      expect(fractional.length).assertEqual(3);
      expect(fractional[2]).assertEqual(1.5);
      const large: number[] = NumberSequenceUtil.arithmeticSeries(1000, 1000, 10);
      expect(large.length).assertEqual(10);
      expect(NumberSequenceUtil.maxOf(large)).assertEqual(10000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_0600
     * @tc.name      testGeometricSeries0001
     * @tc.desc      Verify the geometric series helper produces the expected powers for integer and fractional ratios.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGeometricSeries0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testGeometricSeries0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const powers: number[] = NumberSequenceUtil.geometricSeries(1, 2, 6);
      expect(NumberSequenceUtil.isSameSeries(powers, [1, 2, 4, 8, 16, 32])).assertTrue();
      expect(powers.length).assertEqual(6);
      const thirds: number[] = NumberSequenceUtil.geometricSeries(1, 3, 4);
      expect(NumberSequenceUtil.isSameSeries(thirds, [1, 3, 9, 27])).assertTrue();
      const halves: number[] = NumberSequenceUtil.geometricSeries(16, 0.5, 5);
      expect(NumberSequenceUtil.isSameSeries(halves, [16, 8, 4, 2, 1])).assertTrue();
      expect(NumberSequenceUtil.isDescending(halves)).assertTrue();
      const zeroRatio: number[] = NumberSequenceUtil.geometricSeries(5, 0, 3);
      expect(NumberSequenceUtil.isSameSeries(zeroRatio, [5, 0, 0])).assertTrue();
      const ones: number[] = NumberSequenceUtil.geometricSeries(7, 1, 3);
      expect(NumberSequenceUtil.isSameSeries(ones, [7, 7, 7])).assertTrue();
      expect(NumberSequenceUtil.geometricSeries(1, 2, 0).length).assertEqual(0);
      expect(NumberSequenceUtil.geometricSeries(1, NaN, 4).length).assertEqual(0);
      const single: number[] = NumberSequenceUtil.geometricSeries(3, 10, 1);
      expect(single.length).assertEqual(1);
      expect(NumberSequenceUtil.sum(powers)).assertEqual(63);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_0700
     * @tc.name      testGeometricSeriesRatioMatrix0001
     * @tc.desc      Verify the geometric series helper for negative ratios and ratio zero boundaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGeometricSeriesRatioMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testGeometricSeriesRatioMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const alternating: number[] = NumberSequenceUtil.geometricSeries(1, -2, 5);
      expect(NumberSequenceUtil.isSameSeries(alternating, [1, -2, 4, -8, 16])).assertTrue();
      expect(alternating[1]).assertEqual(-2);
      expect(alternating[3]).assertEqual(-8);
      const negativeStart: number[] = NumberSequenceUtil.geometricSeries(-1, 3, 4);
      expect(NumberSequenceUtil.isSameSeries(negativeStart, [-1, -3, -9, -27])).assertTrue();
      expect(NumberSequenceUtil.isDescending(negativeStart)).assertTrue();
      const zeroStart: number[] = NumberSequenceUtil.geometricSeries(0, 5, 4);
      expect(NumberSequenceUtil.isSameSeries(zeroStart, [0, 0, 0, 0])).assertTrue();
      const ratioOne: number[] = NumberSequenceUtil.geometricSeries(2, 1, 5);
      expect(NumberSequenceUtil.isSameSeries(ratioOne, [2, 2, 2, 2, 2])).assertTrue();
      expect(NumberSequenceUtil.distinct(ratioOne).length).assertEqual(1);
      expect(NumberSequenceUtil.geometricSeries(2, 2, -5).length).assertEqual(0);
      expect(NumberSequenceUtil.geometricSeries(2, Infinity, 3).length).assertEqual(0);
      const small: number[] = NumberSequenceUtil.geometricSeries(0.5, 0.5, 3);
      expect(small[2]).assertEqual(0.125);
      expect(small.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_0800
     * @tc.name      testFibonacci0001
     * @tc.desc      Verify the Fibonacci helper starts from zero and one and keeps the recurrence relation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFibonacci0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFibonacci0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const ten: number[] = NumberSequenceUtil.fibonacci(10);
      expect(NumberSequenceUtil.isSameSeries(ten, [0, 1, 1, 2, 3, 5, 8, 13, 21, 34])).assertTrue();
      expect(ten.length).assertEqual(10);
      expect(ten[0]).assertEqual(0);
      expect(ten[1]).assertEqual(1);
      const one: number[] = NumberSequenceUtil.fibonacci(1);
      expect(one.length).assertEqual(1);
      expect(one[0]).assertEqual(0);
      const two: number[] = NumberSequenceUtil.fibonacci(2);
      expect(NumberSequenceUtil.isSameSeries(two, [0, 1])).assertTrue();
      const zero: number[] = NumberSequenceUtil.fibonacci(0);
      expect(zero.length).assertEqual(0);
      const negative: number[] = NumberSequenceUtil.fibonacci(-3);
      expect(negative.length).assertEqual(0);
      const many: number[] = NumberSequenceUtil.fibonacci(20);
      expect(many.length).assertEqual(20);
      expect(many[19]).assertEqual(4181);
      expect(many[16]).assertEqual(987);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_0900
     * @tc.name      testFibonacciRecurrence0001
     * @tc.desc      Verify every Fibonacci term equals the sum of its two predecessors through a loop assertion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFibonacciRecurrence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFibonacciRecurrence0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const series: number[] = NumberSequenceUtil.fibonacci(30);
      expect(series.length).assertEqual(30);
      for (let index: number = 2; index < series.length; index++) {
        const expected: number = series[index - 1] + series[index - 2];
        expect(series[index]).assertEqual(expected);
      }
      expect(series[29]).assertEqual(514229);
      expect(NumberSequenceUtil.isAscending(series)).assertFalse();
      expect(NumberSequenceUtil.isAscending(series.slice(2))).assertTrue();
      const diffs: number[] = NumberSequenceUtil.differences(series);
      expect(diffs.length).assertEqual(29);
      expect(diffs[0]).assertEqual(1);
      expect(diffs[1]).assertEqual(0);
      expect(diffs[2]).assertEqual(1);
      expect(NumberSequenceUtil.fibonacci(2.9).length).assertEqual(3);
      expect(NumberSequenceUtil.fibonacci(NaN).length).assertEqual(0);
      expect(NumberSequenceUtil.fibonacci(Infinity).length).assertEqual(0);
      expect(NumberSequenceUtil.fibonacci(51)[50]).assertEqual(12586269025);
      expect(NumberSequenceUtil.fibonacci(51).length).assertEqual(51);
      expect(NumberSequenceUtil.fibonacci(51)[49]).assertEqual(7778742049);
      expect(NumberSequenceUtil.digitSum(NumberSequenceUtil.fibonacci(10)[9])).assertEqual(7);
      expect(NumberSequenceUtil.sum(NumberSequenceUtil.fibonacci(10))).assertEqual(88);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_1000
     * @tc.name      testPrimeMembership0001
     * @tc.desc      Verify the prime check accepts primes and rejects composites, units, zero and negatives.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimeMembership0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPrimeMembership0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PRIME_ROWS.length; index++) {
        const row: PrimeRow = PRIME_ROWS[index];
        hilog.info(DOMAIN, TAG, '%{public}s', 'prime check ' + row.label + ' -> ' + row.expected);
        expect(NumberSequenceUtil.isPrime(row.value)).assertEqual(row.expected);
      }
      expect(NumberSequenceUtil.isPrime(-2)).assertFalse();
      expect(NumberSequenceUtil.isPrime(-7)).assertFalse();
      expect(NumberSequenceUtil.isPrime(2.5)).assertFalse();
      expect(NumberSequenceUtil.isPrime(NaN)).assertFalse();
      expect(NumberSequenceUtil.isPrime(Infinity)).assertFalse();
      expect(NumberSequenceUtil.isPrime(104729)).assertTrue();
      expect(NumberSequenceUtil.isPrime(104730)).assertFalse();
      expect(NumberSequenceUtil.isPrime(1e6 + 3)).assertTrue();
      expect(NumberSequenceUtil.isPrime(25)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_1100
     * @tc.name      testPrimesBelow0001
     * @tc.desc      Verify the prime generator lists all primes strictly below the limit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrimesBelow0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPrimesBelow0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const below30: number[] = NumberSequenceUtil.primesBelow(30);
      expect(NumberSequenceUtil.isSameSeries(below30, [2, 3, 5, 7, 11, 13, 17, 19, 23, 29])).assertTrue();
      expect(below30.length).assertEqual(10);
      expect(NumberSequenceUtil.primesBelow(2).length).assertEqual(0);
      expect(NumberSequenceUtil.primesBelow(1).length).assertEqual(0);
      expect(NumberSequenceUtil.primesBelow(0).length).assertEqual(0);
      expect(NumberSequenceUtil.primesBelow(-20).length).assertEqual(0);
      const below3: number[] = NumberSequenceUtil.primesBelow(3);
      expect(NumberSequenceUtil.isSameSeries(below3, [2])).assertTrue();
      const below20: number[] = NumberSequenceUtil.primesBelow(20);
      expect(below20.length).assertEqual(8);
      expect(below20[7]).assertEqual(19);
      const below100: number[] = NumberSequenceUtil.primesBelow(100);
      expect(below100.length).assertEqual(25);
      expect(below100[24]).assertEqual(97);
      const below1000: number[] = NumberSequenceUtil.primesBelow(1000);
      expect(below1000.length).assertEqual(168);
      expect(NumberSequenceUtil.isAscending(below1000)).assertTrue();
      expect(NumberSequenceUtil.sum(NumberSequenceUtil.primesBelow(10))).assertEqual(17);
      expect(NumberSequenceUtil.countInRange(below100, 40, 60)).assertEqual(5);
      expect(NumberSequenceUtil.primesBelow(4)[1]).assertEqual(3);
      expect(NumberSequenceUtil.primesBelow(NaN).length).assertEqual(0);
      expect(NumberSequenceUtil.primesBelow(13).length).assertEqual(5);
      expect(NumberSequenceUtil.primesBelow(13)[4]).assertEqual(11);
      expect(NumberSequenceUtil.primesBelow(100000).length).assertEqual(9592);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_1200
     * @tc.name      testGcdLcmMatrix0001
     * @tc.desc      Verify the gcd and lcm helpers over a table of positive, zero, negative and coprime pairs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGcdLcmMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testGcdLcmMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < GCD_ROWS.length; index++) {
        const row: GcdRow = GCD_ROWS[index];
        hilog.info(DOMAIN, TAG, '%{public}s', 'gcd/lcm pair index ' + index);
        expect(NumberSequenceUtil.gcd(row.a, row.b)).assertEqual(row.gcd);
        expect(NumberSequenceUtil.lcm(row.a, row.b)).assertEqual(row.lcm);
      }
      expect(NumberSequenceUtil.gcd(NaN, 4)).assertEqual(0);
      expect(NumberSequenceUtil.gcd(4, Infinity)).assertEqual(0);
      expect(NumberSequenceUtil.lcm(NaN, 4)).assertEqual(0);
      expect(NumberSequenceUtil.gcd(3.9, 6.1)).assertEqual(3);
      expect(NumberSequenceUtil.lcm(3.9, 6.1)).assertEqual(6);
      expect(NumberSequenceUtil.gcd(-36, 24)).assertEqual(12);
      expect(NumberSequenceUtil.gcd(13, 17)).assertEqual(1);
      expect(NumberSequenceUtil.lcm(13, 17)).assertEqual(221);
      expect(NumberSequenceUtil.gcd(NaN, 5)).assertEqual(0);
      expect(NumberSequenceUtil.gcd(1, 1)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_1300
     * @tc.name      testFactorialMatrix0001
     * @tc.desc      Verify the factorial helper over a table from zero to ten and reject illegal operands.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testFactorialMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testFactorialMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < FACTORIAL_ROWS.length; index++) {
        const row: FactorialRow = FACTORIAL_ROWS[index];
        expect(NumberSequenceUtil.factorial(row.n)).assertEqual(row.expected);
      }
      expect(NumberSequenceUtil.factorial(-1)).assertEqual(0);
      expect(NumberSequenceUtil.factorial(-20)).assertEqual(0);
      expect(NumberSequenceUtil.factorial(1.5)).assertEqual(0);
      expect(NumberSequenceUtil.factorial(NaN)).assertEqual(0);
      expect(NumberSequenceUtil.factorial(Infinity)).assertEqual(0);
      expect(NumberSequenceUtil.factorial(2.5)).assertEqual(0);
      expect(NumberSequenceUtil.factorial(1)).assertEqual(1);
      expect(NumberSequenceUtil.factorial(171)).assertEqual(0);
      expect(NumberSequenceUtil.factorial(12)).assertEqual(479001600);
      expect(NumberSequenceUtil.factorial(13)).assertEqual(6227020800);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_1400
     * @tc.name      testDigitSumAndReverse0001
     * @tc.desc      Verify digitSum and digitReverse over a digit table including zero and negative inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDigitSumAndReverse0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDigitSumAndReverse0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < DIGIT_ROWS.length; index++) {
        const row: DigitRow = DIGIT_ROWS[index];
        hilog.info(DOMAIN, TAG, '%{public}s', 'digit row value ' + row.value);
        expect(NumberSequenceUtil.digitSum(row.value)).assertEqual(row.sum);
        expect(NumberSequenceUtil.digitReverse(row.value)).assertEqual(row.reversed);
        expect(NumberSequenceUtil.isPalindromeNumber(row.value)).assertEqual(row.palindrome);
        expect(NumberSequenceUtil.isArmstrongNumber(row.value)).assertEqual(row.armstrong);
        expect(NumberSequenceUtil.digitSum(row.reversed)).assertEqual(row.sum);
      }
      expect(NumberSequenceUtil.digitSum(-123)).assertEqual(6);
      expect(NumberSequenceUtil.digitReverse(-123)).assertEqual(321);
      expect(NumberSequenceUtil.digitSum(NaN)).assertEqual(0);
      expect(NumberSequenceUtil.digitReverse(Infinity)).assertEqual(0);
      expect(NumberSequenceUtil.isPalindromeNumber(-121)).assertTrue();
      expect(NumberSequenceUtil.isPalindromeNumber(NaN)).assertFalse();
      expect(NumberSequenceUtil.digitSum(1111111)).assertEqual(7);
      expect(NumberSequenceUtil.digitReverse(1111111)).assertEqual(1111111);
      expect(NumberSequenceUtil.digitSum(2048)).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_1500
     * @tc.name      testPalindromeAndArmstrong0001
     * @tc.desc      Verify that digit reversal drops leading zeros and that Armstrong numbers keep the powered digit sum.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPalindromeAndArmstrong0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPalindromeAndArmstrong0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const expectedTwice: number[] = [0, 5, 12, 1, 1, 1, 121, 153, 37, 1001, 9474, 12321, 999];
      const expectedReversedPalindrome: boolean[] = [true, true, false, true, true, true, true, false, false, true, false, true, true];
      expect(expectedTwice.length).assertEqual(DIGIT_ROWS.length);
      expect(expectedReversedPalindrome.length).assertEqual(DIGIT_ROWS.length);
      for (let index: number = 0; index < DIGIT_ROWS.length; index++) {
        const row: DigitRow = DIGIT_ROWS[index];
        const reversedTwice: number = NumberSequenceUtil.digitReverse(NumberSequenceUtil.digitReverse(row.value));
        expect(reversedTwice).assertEqual(expectedTwice[index]);
        expect(NumberSequenceUtil.digitReverse(row.value)).assertEqual(row.reversed);
        expect(NumberSequenceUtil.isPalindromeNumber(row.reversed)).assertEqual(expectedReversedPalindrome[index]);
      }
      expect(NumberSequenceUtil.isArmstrongNumber(1)).assertTrue();
      expect(NumberSequenceUtil.isArmstrongNumber(153)).assertTrue();
      expect(NumberSequenceUtil.isArmstrongNumber(1634)).assertTrue();
      expect(NumberSequenceUtil.isArmstrongNumber(8208)).assertTrue();
      expect(NumberSequenceUtil.isArmstrongNumber(9474)).assertTrue();
      expect(NumberSequenceUtil.isArmstrongNumber(154)).assertFalse();
      expect(NumberSequenceUtil.isArmstrongNumber(100)).assertFalse();
      expect(NumberSequenceUtil.isArmstrongNumber(0)).assertTrue();
      expect(NumberSequenceUtil.isArmstrongNumber(-153)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_1600
     * @tc.name      testPerfectNumber0001
     * @tc.desc      Verify the perfect number check accepts 6, 28, 496 and 8128 and rejects neighbours and illegal operands.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPerfectNumber0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPerfectNumber0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberSequenceUtil.isPerfectNumber(6)).assertTrue();
      expect(NumberSequenceUtil.isPerfectNumber(28)).assertTrue();
      expect(NumberSequenceUtil.isPerfectNumber(496)).assertTrue();
      expect(NumberSequenceUtil.isPerfectNumber(8128)).assertTrue();
      expect(NumberSequenceUtil.isPerfectNumber(1)).assertFalse();
      expect(NumberSequenceUtil.isPerfectNumber(0)).assertFalse();
      expect(NumberSequenceUtil.isPerfectNumber(-6)).assertFalse();
      expect(NumberSequenceUtil.isPerfectNumber(5)).assertFalse();
      expect(NumberSequenceUtil.isPerfectNumber(7)).assertFalse();
      expect(NumberSequenceUtil.isPerfectNumber(27)).assertFalse();
      expect(NumberSequenceUtil.isPerfectNumber(495)).assertFalse();
      expect(NumberSequenceUtil.isPerfectNumber(6.5)).assertFalse();
      expect(NumberSequenceUtil.isPerfectNumber(33550336)).assertTrue();
      expect(NumberSequenceUtil.isPerfectNumber(NaN)).assertFalse();
      expect(NumberSequenceUtil.properDivisorSum(2)).assertEqual(1);
      expect(NumberSequenceUtil.properDivisorSum(0)).assertEqual(0);
      expect(NumberSequenceUtil.properDivisorSum(-6)).assertEqual(0);
      expect(NumberSequenceUtil.properDivisorSum(6)).assertEqual(6);
      expect(NumberSequenceUtil.properDivisorSum(28)).assertEqual(28);
      expect(NumberSequenceUtil.properDivisorSum(1)).assertEqual(0);
      expect(NumberSequenceUtil.properDivisorSum(12)).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_1700
     * @tc.name      testToBaseString0001
     * @tc.desc      Verify the base encoder over a table of binary, octal, decimal and base 36 values including negatives.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testToBaseString0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testToBaseString0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < BASE_ROWS.length; index++) {
        const row: BaseRow = BASE_ROWS[index];
        hilog.info(DOMAIN, TAG, '%{public}s', 'base row value ' + row.value + ' base ' + row.base);
        expect(NumberSequenceUtil.toBaseString(row.value, row.base)).assertEqual(row.text);
        expect(NumberSequenceUtil.toBaseString(row.value, row.base).length).assertEqual(row.text.length);
      }
      expect(NumberSequenceUtil.toBaseString(10, 1)).assertEqual('');
      expect(NumberSequenceUtil.toBaseString(10, 37)).assertEqual('');
      expect(NumberSequenceUtil.toBaseString(10, 0)).assertEqual('');
      expect(NumberSequenceUtil.toBaseString(10, -2)).assertEqual('');
      expect(NumberSequenceUtil.toBaseString(10, 2.5)).assertEqual('');
      expect(NumberSequenceUtil.toBaseString(NaN, 10)).assertEqual('');
      expect(NumberSequenceUtil.toBaseString(123, 10)).assertEqual('123');
      expect(NumberSequenceUtil.toBaseString(255, 2).length).assertEqual(8);
      expect(NumberSequenceUtil.toBaseString(1000, 32)).assertEqual('v8');
      expect(NumberSequenceUtil.toBaseString(1, 36)).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_1800
     * @tc.name      testParseBaseString0001
     * @tc.desc      Verify the base decoder over a table with upper case letters, minus signs and malformed texts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseBaseString0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseBaseString0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PARSE_ROWS.length; index++) {
        const row: ParseRow = PARSE_ROWS[index];
        const parsed: number = NumberSequenceUtil.parseBaseString(row.text, row.base);
        hilog.info(DOMAIN, TAG, '%{public}s', 'parse row index ' + index + ' valid ' + row.valid);
        if (row.valid) {
          expect(parsed).assertEqual(row.value);
          expect(Number.isNaN(parsed)).assertFalse();
        } else {
          expect(Number.isNaN(parsed)).assertTrue();
        }
      }
      expect(Number.isNaN(NumberSequenceUtil.parseBaseString('10', 1))).assertTrue();
      expect(Number.isNaN(NumberSequenceUtil.parseBaseString('10', 40))).assertTrue();
      expect(NumberSequenceUtil.parseBaseString('1010', 2)).assertEqual(10);
      expect(NumberSequenceUtil.parseBaseString('777', 8)).assertEqual(511);
      expect(NumberSequenceUtil.parseBaseString('1z', 36)).assertEqual(71);
      expect(NumberSequenceUtil.parseBaseString('-1010', 2)).assertEqual(-10);
      expect(Number.isNaN(NumberSequenceUtil.parseBaseString('-', 10))).assertTrue();
      expect(NumberSequenceUtil.parseBaseString('-0', 10)).assertEqual(0);
      expect(NumberSequenceUtil.parseBaseString('ZZ', 36)).assertEqual(1295);
      expect(NumberSequenceUtil.parseBaseString('11', 2)).assertEqual(3);
      expect(NumberSequenceUtil.parseBaseString('ff', 16)).assertEqual(255);
      expect(Number.isNaN(NumberSequenceUtil.parseBaseString('a', 10))).assertTrue();
      expect(NumberSequenceUtil.parseBaseString('1000', 16)).assertEqual(4096);
      expect(NumberSequenceUtil.parseBaseString('110', 2)).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_1900
     * @tc.name      testBaseRoundTrip0001
     * @tc.desc      Verify that encoding then decoding a value in every supported base returns the original value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBaseRoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBaseRoundTrip0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const values: number[] = [0, 1, 7, 42, 255, 1024, 65535, -123];
      let roundTrips: number = 0;
      for (let base: number = 2; base <= 36; base++) {
        expect(NumberSequenceUtil.isValidBase(base)).assertTrue();
        for (let index: number = 0; index < values.length; index++) {
          const encoded: string = NumberSequenceUtil.toBaseString(values[index], base);
          const decoded: number = NumberSequenceUtil.parseBaseString(encoded, base);
          expect(decoded).assertEqual(values[index]);
          roundTrips = roundTrips + 1;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'round trips ' + roundTrips);
      expect(roundTrips).assertEqual(35 * 8);
      expect(NumberSequenceUtil.isValidBase(1)).assertFalse();
      expect(NumberSequenceUtil.isValidBase(37)).assertFalse();
      expect(NumberSequenceUtil.isValidBase(10)).assertTrue();
      expect(NumberSequenceUtil.isValidBase(2.5)).assertFalse();
      expect(NumberSequenceUtil.toBaseString(9, 2)).assertEqual('1001');
      expect(NumberSequenceUtil.toBaseString(0, 36)).assertEqual('0');
      expect(NumberSequenceUtil.toBaseString(35, 36)).assertEqual('z');
      expect(NumberSequenceUtil.toBaseString(36, 36)).assertEqual('10');
      expect(NumberSequenceUtil.toBaseString(-8, 2)).assertEqual('-1000');
      expect(NumberSequenceUtil.toBaseString(7.9, 10)).assertEqual('7');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_2000
     * @tc.name      testClampIntMatrix0001
     * @tc.desc      Verify clampInt truncates fractions, honours inverted bounds and falls back to the lower bound for NaN.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampIntMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampIntMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < CLAMP_ROWS.length; index++) {
        const row: ClampRow = CLAMP_ROWS[index];
        expect(NumberSequenceUtil.clampInt(row.value, row.min, row.max)).assertEqual(row.expected);
      }
      expect(NumberSequenceUtil.clampInt(NaN, 3, 9)).assertEqual(3);
      expect(NumberSequenceUtil.clampInt(Infinity, 3, 9)).assertEqual(3);
      expect(NumberSequenceUtil.clampInt(5.99, 0, 10)).assertEqual(5);
      expect(NumberSequenceUtil.clampInt(-5.99, 0, 10)).assertEqual(0);
      expect(NumberSequenceUtil.clampInt(7, 7, 7)).assertEqual(7);
      expect(NumberSequenceUtil.clampInt(1, 2.9, 8.9)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_2100
     * @tc.name      testLerpMatrix0001
     * @tc.desc      Verify the linear interpolation helper at ratio zero, one, fractions, extrapolation and non finite ratios.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLerpMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLerpMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberSequenceUtil.lerp(0, 10, 0)).assertEqual(0);
      expect(NumberSequenceUtil.lerp(0, 10, 1)).assertEqual(10);
      expect(NumberSequenceUtil.lerp(0, 10, 0.5)).assertEqual(5);
      expect(NumberSequenceUtil.lerp(10, 20, 0.25)).assertEqual(12.5);
      expect(NumberSequenceUtil.lerp(10, 20, 2)).assertEqual(30);
      expect(NumberSequenceUtil.lerp(10, 20, -1)).assertEqual(0);
      expect(NumberSequenceUtil.lerp(-10, 10, 0.5)).assertEqual(0);
      expect(NumberSequenceUtil.lerp(5, 5, 0.7)).assertEqual(5);
      expect(NumberSequenceUtil.lerp(1, 2, NaN)).assertEqual(1);
      expect(NumberSequenceUtil.lerp(1, 2, Infinity)).assertEqual(1);
      expect(Number.isNaN(NumberSequenceUtil.lerp(NaN, 2, 0.5))).assertTrue();
      expect(NumberSequenceUtil.lerp(0, 1, 0.1)).assertEqual(0.1);
      expect(NumberSequenceUtil.lerp(100, 200, 0.75)).assertEqual(175);
      expect(NumberSequenceUtil.lerp(-100, 100, -0.5)).assertEqual(-200);
      expect(NumberSequenceUtil.lerp(0, 0, 0.5)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_2200
     * @tc.name      testPercentOfMatrix0001
     * @tc.desc      Verify the percent helper over a table plus zero totals and non finite operands.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPercentOfMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPercentOfMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PERCENT_ROWS.length; index++) {
        const row: PercentRow = PERCENT_ROWS[index];
        expect(Math.abs(NumberSequenceUtil.percentOf(row.part, row.total) - row.expected) < 1e-12).assertTrue();
      }
      expect(NumberSequenceUtil.percentOf(1, 0)).assertEqual(0);
      expect(NumberSequenceUtil.percentOf(0, 0)).assertEqual(0);
      expect(NumberSequenceUtil.percentOf(NaN, 4)).assertEqual(0);
      expect(NumberSequenceUtil.percentOf(4, Infinity)).assertEqual(0);
      expect(NumberSequenceUtil.percentOf(2, 1)).assertEqual(200);
      expect(NumberSequenceUtil.percentOf(1, 8)).assertEqual(12.5);
      expect(NumberSequenceUtil.percentOf(7, 4)).assertEqual(175);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_2300
     * @tc.name      testRoundToMatrix0001
     * @tc.desc      Verify the rounding helper for fraction digits, negative digits and non finite operands.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoundToMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoundToMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < ROUND_ROWS.length; index++) {
        const row: RoundRow = ROUND_ROWS[index];
        expect(NumberSequenceUtil.roundTo(row.value, row.digits)).assertEqual(row.expected);
      }
      expect(NumberSequenceUtil.roundTo(3.14159, 3)).assertEqual(3.142);
      expect(NumberSequenceUtil.roundTo(3.14159, 0)).assertEqual(3);
      expect(NumberSequenceUtil.roundTo(3.14159, 4)).assertEqual(3.1416);
      expect(NumberSequenceUtil.roundTo(-1234, -2)).assertEqual(-1200);
      expect(Number.isNaN(NumberSequenceUtil.roundTo(NaN, 2))).assertTrue();
      expect(NumberSequenceUtil.roundTo(Infinity, 2)).assertEqual(Infinity);
      expect(NumberSequenceUtil.roundTo(7, NaN)).assertEqual(7);
      expect(NumberSequenceUtil.roundTo(0, 5)).assertEqual(0);
      // Math.round maps -0.5 onto negative zero, so the result keeps the sign of zero.
      expect(1 / NumberSequenceUtil.roundTo(-0.5, 0) === Number.NEGATIVE_INFINITY).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_2400
     * @tc.name      testArrayStatistics0001
     * @tc.desc      Verify the statistics helpers sum, maxOf, minOf and meanOf on non empty, empty and non finite arrays.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayStatistics0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayStatistics0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const sample: number[] = [3, 1, 4, 1, 5, 9, 2, 6];
      expect(NumberSequenceUtil.sum(sample)).assertEqual(31);
      expect(NumberSequenceUtil.maxOf(sample)).assertEqual(9);
      expect(NumberSequenceUtil.minOf(sample)).assertEqual(1);
      expect(NumberSequenceUtil.meanOf(sample)).assertEqual(31 / 8);
      expect(NumberSequenceUtil.sum([])).assertEqual(0);
      expect(NumberSequenceUtil.meanOf([])).assertEqual(0);
      expect(Number.isNaN(NumberSequenceUtil.maxOf([]))).assertTrue();
      expect(Number.isNaN(NumberSequenceUtil.minOf([]))).assertTrue();
      expect(NumberSequenceUtil.sum([1, NaN, 2, Infinity])).assertEqual(3);
      expect(NumberSequenceUtil.maxOf([-5, -1, -9])).assertEqual(-1);
      expect(NumberSequenceUtil.minOf([-5, -1, -9])).assertEqual(-9);
      expect(NumberSequenceUtil.meanOf([2, 4])).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_2500
     * @tc.name      testCounterHelpers0001
     * @tc.desc      Verify countAbove and countInRange including inverted bounds and threshold boundaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCounterHelpers0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCounterHelpers0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const values: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
      expect(NumberSequenceUtil.countAbove(values, 5)).assertEqual(5);
      expect(NumberSequenceUtil.countAbove(values, 0)).assertEqual(10);
      expect(NumberSequenceUtil.countAbove(values, 10)).assertEqual(0);
      expect(NumberSequenceUtil.countAbove(values, -1)).assertEqual(10);
      expect(NumberSequenceUtil.countAbove([], 3)).assertEqual(0);
      expect(NumberSequenceUtil.countInRange(values, 3, 6)).assertEqual(4);
      expect(NumberSequenceUtil.countInRange(values, 1, 10)).assertEqual(10);
      expect(NumberSequenceUtil.countInRange(values, 11, 20)).assertEqual(0);
      expect(NumberSequenceUtil.countInRange(values, 6, 3)).assertEqual(4);
      expect(NumberSequenceUtil.countInRange([], 0, 10)).assertEqual(0);
      expect(NumberSequenceUtil.countInRange([2, 2, 2], 2, 2)).assertEqual(3);
      expect(NumberSequenceUtil.countAbove([1.5, 2.5, 3.5], 2)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_2600
     * @tc.name      testDistinctAndFrequency0001
     * @tc.desc      Verify distinct keeps the first appearance order and frequency builds stable buckets with counts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDistinctAndFrequency0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDistinctAndFrequency0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const duplicated: number[] = [3, 1, 3, 2, 1, 3];
      const unique: number[] = NumberSequenceUtil.distinct(duplicated);
      expect(NumberSequenceUtil.isSameSeries(unique, [3, 1, 2])).assertTrue();
      expect(unique.length).assertEqual(3);
      expect(NumberSequenceUtil.distinct([]).length).assertEqual(0);
      expect(NumberSequenceUtil.distinct([5]).length).assertEqual(1);
      const buckets: NumberFrequency[] = NumberSequenceUtil.frequency(duplicated);
      expect(buckets.length).assertEqual(3);
      expect(buckets[0].value).assertEqual(3);
      expect(buckets[0].count).assertEqual(3);
      expect(buckets[1].value).assertEqual(1);
      expect(buckets[1].count).assertEqual(2);
      expect(buckets[2].value).assertEqual(2);
      expect(buckets[2].count).assertEqual(1);
      expect(NumberSequenceUtil.frequency([]).length).assertEqual(0);
      const totalCount: number = buckets[0].count + buckets[1].count + buckets[2].count;
      expect(totalCount).assertEqual(duplicated.length);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_2700
     * @tc.name      testPrefixSumsAndDifferences0001
     * @tc.desc      Verify prefix sums accumulate and differences invert the accumulation for every series built here.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPrefixSumsAndDifferences0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPrefixSumsAndDifferences0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const values: number[] = [1, 2, 3, 4, 5];
      const prefix: number[] = NumberSequenceUtil.prefixSums(values);
      expect(NumberSequenceUtil.isSameSeries(prefix, [1, 3, 6, 10, 15])).assertTrue();
      expect(prefix.length).assertEqual(values.length);
      expect(prefix[prefix.length - 1]).assertEqual(NumberSequenceUtil.sum(values));
      const diff: number[] = NumberSequenceUtil.differences(prefix);
      expect(NumberSequenceUtil.isSameSeries(diff, values.slice(1))).assertTrue();
      expect(diff.length).assertEqual(4);
      expect(NumberSequenceUtil.prefixSums([]).length).assertEqual(0);
      expect(NumberSequenceUtil.differences([]).length).assertEqual(0);
      expect(NumberSequenceUtil.differences([9]).length).assertEqual(0);
      expect(NumberSequenceUtil.prefixSums([5]).length).assertEqual(1);
      const negative: number[] = NumberSequenceUtil.prefixSums([-1, -2, -3]);
      expect(negative[2]).assertEqual(-6);
      expect(NumberSequenceUtil.isDescending(negative)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_2800
     * @tc.name      testOrderingChecks0001
     * @tc.desc      Verify isAscending, isDescending and isSameSeries for ordered, unordered, empty and single element arrays.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testOrderingChecks0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testOrderingChecks0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberSequenceUtil.isAscending([1, 2, 3])).assertTrue();
      expect(NumberSequenceUtil.isAscending([1, 1, 3])).assertFalse();
      expect(NumberSequenceUtil.isAscending([3, 2, 1])).assertFalse();
      expect(NumberSequenceUtil.isAscending([])).assertTrue();
      expect(NumberSequenceUtil.isAscending([7])).assertTrue();
      expect(NumberSequenceUtil.isDescending([3, 2, 1])).assertTrue();
      expect(NumberSequenceUtil.isDescending([3, 3, 1])).assertFalse();
      expect(NumberSequenceUtil.isDescending([1, 2, 3])).assertFalse();
      expect(NumberSequenceUtil.isDescending([])).assertTrue();
      expect(NumberSequenceUtil.isSameSeries([1, 2], [1, 2])).assertTrue();
      expect(NumberSequenceUtil.isSameSeries([1, 2], [2, 1])).assertFalse();
      expect(NumberSequenceUtil.isSameSeries([1], [1, 1])).assertFalse();
      expect(NumberSequenceUtil.isSameSeries([], [])).assertTrue();
      expect(NumberSequenceUtil.isAscending(NumberSequenceUtil.range(0, 5))).assertTrue();
      expect(NumberSequenceUtil.isDescending(NumberSequenceUtil.range(5, 0))).assertTrue();
      expect(NumberSequenceUtil.isAscending(NumberSequenceUtil.fibonacci(10))).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_2900
     * @tc.name      testSumMultiplesBelow0001
     * @tc.desc      Verify the multiple sum helper for divisors two, three, five and illegal divisors.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSumMultiplesBelow0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSumMultiplesBelow0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberSequenceUtil.sumMultiplesBelow(10, 2)).assertEqual(30);
      expect(NumberSequenceUtil.sumMultiplesBelow(9, 3)).assertEqual(18);
      expect(NumberSequenceUtil.sumMultiplesBelow(100, 5)).assertEqual(1050);
      expect(NumberSequenceUtil.sumMultiplesBelow(1, 1)).assertEqual(1);
      expect(NumberSequenceUtil.sumMultiplesBelow(0, 2)).assertEqual(0);
      expect(NumberSequenceUtil.sumMultiplesBelow(-10, 2)).assertEqual(0);
      expect(NumberSequenceUtil.sumMultiplesBelow(10, 0)).assertEqual(0);
      expect(NumberSequenceUtil.sumMultiplesBelow(10, 0.5)).assertEqual(0);
      expect(NumberSequenceUtil.sumMultiplesBelow(10, -3)).assertEqual(0);
      expect(NumberSequenceUtil.sumMultiplesBelow(NaN, 2)).assertEqual(0);
      expect(NumberSequenceUtil.sumMultiplesBelow(10, NaN)).assertEqual(0);
      expect(NumberSequenceUtil.sumMultiplesBelow(3, 5)).assertEqual(0);
      expect(NumberSequenceUtil.sumMultiplesBelow(10, 2.7)).assertEqual(30);
      expect(NumberSequenceUtil.sumMultiplesBelow(10, 3)).assertEqual(18);
      expect(NumberSequenceUtil.sumMultiplesBelow(6, 6)).assertEqual(6);
      expect(NumberSequenceUtil.sumMultiplesBelow(100, 1)).assertEqual(5050);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_3000
     * @tc.name      testCollatzSteps0001
     * @tc.desc      Verify the Collatz step count for a table of starting values and reject non positive integers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCollatzSteps0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCollatzSteps0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberSequenceUtil.collatzSteps(1)).assertEqual(0);
      expect(NumberSequenceUtil.collatzSteps(2)).assertEqual(1);
      expect(NumberSequenceUtil.collatzSteps(3)).assertEqual(7);
      expect(NumberSequenceUtil.collatzSteps(4)).assertEqual(2);
      expect(NumberSequenceUtil.collatzSteps(5)).assertEqual(5);
      expect(NumberSequenceUtil.collatzSteps(6)).assertEqual(8);
      expect(NumberSequenceUtil.collatzSteps(7)).assertEqual(16);
      expect(NumberSequenceUtil.collatzSteps(10)).assertEqual(6);
      expect(NumberSequenceUtil.collatzSteps(27)).assertEqual(111);
      expect(NumberSequenceUtil.collatzSteps(0)).assertEqual(0);
      expect(NumberSequenceUtil.collatzSteps(-5)).assertEqual(0);
      expect(NumberSequenceUtil.collatzSteps(2.5)).assertEqual(0);
      expect(NumberSequenceUtil.collatzSteps(NaN)).assertEqual(0);
      expect(NumberSequenceUtil.collatzSteps(97)).assertEqual(118);
      expect(NumberSequenceUtil.collatzSteps(9)).assertEqual(19);
      expect(NumberSequenceUtil.collatzSteps(16)).assertEqual(4);
      expect(NumberSequenceUtil.collatzSteps(26)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_3100
     * @tc.name      testToFixedWidth0001
     * @tc.desc      Verify the fixed width formatter pads with zeros, cuts long values and keeps the minus sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testToFixedWidth0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testToFixedWidth0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < WIDTH_ROWS.length; index++) {
        const row: WidthRow = WIDTH_ROWS[index];
        const text: string = NumberSequenceUtil.toFixedWidth(row.value, row.width);
        hilog.info(DOMAIN, TAG, '%{public}s', 'fixed width text ' + text);
        expect(text).assertEqual(row.text);
        // Negative values keep the minus sign in front of the padded digits, so they are one character longer.
        expect(text.length).assertEqual(row.value < 0 ? row.width + 1 : row.width);
      }
      expect(NumberSequenceUtil.toFixedWidth(5, 0)).assertEqual('');
      expect(NumberSequenceUtil.toFixedWidth(5, -2)).assertEqual('');
      expect(NumberSequenceUtil.toFixedWidth(NaN, 2)).assertEqual('');
      expect(NumberSequenceUtil.toFixedWidth(1.6, 2)).assertEqual('02');
      expect(NumberSequenceUtil.toFixedWidth(123456, 3)).assertEqual('456');
      // The minus sign is kept in front of the padded digits, so the text is one character longer than the width.
      expect(NumberSequenceUtil.toFixedWidth(-42, 4)).assertEqual('-0042');
      expect(NumberSequenceUtil.toFixedWidth(-42, 4).length).assertEqual(5);
      expect(NumberSequenceUtil.toFixedWidth(0, 3)).assertEqual('000');
      const widthText: string = NumberSequenceUtil.toFixedWidth(7, 2);
      expect(widthText).assertEqual('07');
      expect(widthText.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_3200
     * @tc.name      testBasicUtilClampMatrix0001
     * @tc.desc      Verify BasicUtil.clamp against the same clamp table used for clampInt to compare real and reference behaviour.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBasicUtilClampMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBasicUtilClampMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(BasicUtil.clamp(5, 0, 10)).assertEqual(5);
      expect(BasicUtil.clamp(-5, 0, 10)).assertEqual(0);
      expect(BasicUtil.clamp(15, 0, 10)).assertEqual(10);
      expect(BasicUtil.clamp(0, 0, 10)).assertEqual(0);
      expect(BasicUtil.clamp(10, 0, 10)).assertEqual(10);
      expect(BasicUtil.clamp(3.5, 0, 10)).assertEqual(3.5);
      expect(BasicUtil.clamp(-0.5, 0, 1)).assertEqual(0);
      expect(BasicUtil.clamp(1.5, 0, 1)).assertEqual(1);
      const radius: number = BasicUtil.clamp(8000, 50, 5000);
      expect(radius).assertEqual(5000);
      const negativeRadius: number = BasicUtil.clamp(-8000, 50, 5000);
      expect(negativeRadius).assertEqual(50);
      for (let index: number = 0; index < CLAMP_ROWS.length; index++) {
        const row: ClampRow = CLAMP_ROWS[index];
        const real: number = BasicUtil.clamp(row.value, row.min, row.max);
        const reference: number = NumberSequenceUtil.clampInt(row.value, row.min, row.max);
        hilog.info(DOMAIN, TAG, '%{public}s', 'clamp row index ' + index);
        if (row.min <= row.max) {
          const realExpected: number = row.value < row.min ? row.min : row.value > row.max ? row.max : row.value;
          expect(real).assertEqual(realExpected);
        }
        expect(reference).assertEqual(row.expected);
      }
      expect(BasicUtil.clamp(0, -10, 10)).assertEqual(0);
      expect(BasicUtil.clamp(7, 7, 7)).assertEqual(7);
      expect(BasicUtil.clamp(-1, 0, 0)).assertEqual(0);
      expect(BasicUtil.clamp(5000, 50, 5000)).assertEqual(5000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_3300
     * @tc.name      testBasicUtilRandomInt0001
     * @tc.desc      Verify BasicUtil.randomInt stays inside the inclusive range for many draws and returns the lower bound for invalid ranges.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBasicUtilRandomInt0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBasicUtilRandomInt0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(BasicUtil.randomInt(5, 5)).assertEqual(5);
      expect(BasicUtil.randomInt(0, 0)).assertEqual(0);
      expect(BasicUtil.randomInt(-7, -7)).assertEqual(-7);
      expect(BasicUtil.randomInt(5, 3)).assertEqual(3);
      expect(BasicUtil.randomInt(-1, -9)).assertEqual(-9);
      let insideCount: number = 0;
      for (let index: number = 0; index < 200; index++) {
        const draw: number = BasicUtil.randomInt(1, 10);
        if (draw >= 1 && draw <= 10 && draw === Math.floor(draw)) {
          insideCount = insideCount + 1;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'draws inside range ' + insideCount);
      expect(insideCount).assertEqual(200);
      const wide: number = BasicUtil.randomInt(-1000, 1000);
      expect(wide >= -1000).assertTrue();
      expect(wide <= 1000).assertTrue();
      const single: number = BasicUtil.randomInt(42, 42);
      expect(single).assertEqual(42);
      const negative: number = BasicUtil.randomInt(-5, 5);
      expect(negative >= -5).assertTrue();
      expect(negative <= 5).assertTrue();
      expect(BasicUtil.randomInt(-3, -3)).assertEqual(-3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_3400
     * @tc.name      testBasicUtilPositiveNumber0001
     * @tc.desc      Verify BasicUtil.isPositiveNumber rejects zero, negatives, NaN and infinities and accepts finite positive values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBasicUtilPositiveNumber0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBasicUtilPositiveNumber0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(BasicUtil.isPositiveNumber(1)).assertTrue();
      expect(BasicUtil.isPositiveNumber(0.0001)).assertTrue();
      expect(BasicUtil.isPositiveNumber(5000)).assertTrue();
      expect(BasicUtil.isPositiveNumber(Number.MAX_SAFE_INTEGER)).assertTrue();
      expect(BasicUtil.isPositiveNumber(0)).assertFalse();
      expect(BasicUtil.isPositiveNumber(-0)).assertFalse();
      expect(BasicUtil.isPositiveNumber(-1)).assertFalse();
      expect(BasicUtil.isPositiveNumber(NaN)).assertFalse();
      expect(BasicUtil.isPositiveNumber(Infinity)).assertFalse();
      expect(BasicUtil.isPositiveNumber(-Infinity)).assertFalse();
      const radiusCandidates: number[] = [-200, 0, 50, 5000, 5001];
      const accepted: number[] = [];
      for (let index: number = 0; index < radiusCandidates.length; index++) {
        if (BasicUtil.isPositiveNumber(radiusCandidates[index])) {
          accepted.push(radiusCandidates[index]);
        }
      }
      expect(accepted.length).assertEqual(3);
      expect(accepted[0]).assertEqual(50);
      expect(accepted[1]).assertEqual(5000);
      expect(accepted[2]).assertEqual(5001);
      expect(NumberSequenceUtil.countAbove(radiusCandidates, 0)).assertEqual(3);
      expect(BasicUtil.isPositiveNumber(1e-10)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_3500
     * @tc.name      testBasicUtilBooleanToFlag0001
     * @tc.desc      Verify BasicUtil.booleanToFlag maps booleans onto the 0 and 1 numeric flag convention in a loop.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBasicUtilBooleanToFlag0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBasicUtilBooleanToFlag0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(BasicUtil.booleanToFlag(true)).assertEqual(1);
      expect(BasicUtil.booleanToFlag(false)).assertEqual(0);
      const flags: boolean[] = [true, false, true, true, false, false, true];
      let trueCount: number = 0;
      let flagSum: number = 0;
      for (let index: number = 0; index < flags.length; index++) {
        const flag: number = BasicUtil.booleanToFlag(flags[index]);
        flagSum = flagSum + flag;
        if (flags[index]) {
          trueCount = trueCount + 1;
        }
        expect(flag === 0 || flag === 1).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'flag sum ' + flagSum);
      expect(flagSum).assertEqual(trueCount);
      expect(flagSum).assertEqual(4);
      expect(NumberSequenceUtil.sum([BasicUtil.booleanToFlag(true), BasicUtil.booleanToFlag(false)])).assertEqual(1);
      expect(BasicUtil.booleanToFlag(1 > 0)).assertEqual(1);
      expect(BasicUtil.booleanToFlag(1 < 0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_3600
     * @tc.name      testBasicUtilFormatPercentMatrix0001
     * @tc.desc      Verify BasicUtil.formatPercent keeps the requested fraction digits and appends the percent suffix for a ratio table.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBasicUtilFormatPercentMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBasicUtilFormatPercentMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const ratios: number[] = [0, 0.1, 0.25, 0.5, 0.75, 1];
      const expectedDefault: string[] = ['0.0%', '10.0%', '25.0%', '50.0%', '75.0%', '100.0%'];
      const expectedZeroDigits: string[] = ['0%', '10%', '25%', '50%', '75%', '100%'];
      for (let index: number = 0; index < ratios.length; index++) {
        const defaultText: string = BasicUtil.formatPercent(ratios[index]);
        hilog.info(DOMAIN, TAG, '%{public}s', 'default percent text ' + defaultText);
        expect(defaultText).assertEqual(expectedDefault[index]);
        expect(BasicUtil.formatPercent(ratios[index], 0)).assertEqual(expectedZeroDigits[index]);
        expect(BasicUtil.formatPercent(ratios[index], 2).endsWith('%')).assertTrue();
      }
      expect(BasicUtil.formatPercent(0.256)).assertEqual('25.6%');
      expect(BasicUtil.formatPercent(0.256, 3)).assertEqual('25.600%');
      expect(BasicUtil.formatPercent(0.12345, 1)).assertEqual('12.3%');
      expect(BasicUtil.formatPercent(0.999, 2)).assertEqual('99.90%');
      expect(BasicUtil.formatPercent(2, 1)).assertEqual('200.0%');
      expect(BasicUtil.formatPercent(-0.5, 1)).assertEqual('-50.0%');
      expect(BasicUtil.formatPercent(0, 3)).assertEqual('0.000%');
      expect(BasicUtil.formatPercent(0.0001, 2)).assertEqual('0.01%');
      expect(BasicUtil.formatPercent(0.1234, 4).length).assertEqual(8);
      expect(BasicUtil.formatPercent(0.5, 1).charAt(0)).assertEqual('5');
      expect(BasicUtil.formatPercent(0.5, 1).indexOf('.')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_3700
     * @tc.name      testPercentCrossCheck0001
     * @tc.desc      Verify the percentOf helper and BasicUtil.formatPercent agree on the same ratio table.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPercentCrossCheck0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPercentCrossCheck0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      for (let index: number = 0; index < PERCENT_ROWS.length; index++) {
        const row: PercentRow = PERCENT_ROWS[index];
        const percent: number = NumberSequenceUtil.percentOf(row.part, row.total);
        expect(Math.abs(percent - row.expected) < 1e-12).assertTrue();
        // A ratio inside [0, 1] must render with the same value through formatPercent.
        if (row.total > 0 && row.part >= 0 && row.part <= row.total) {
          const ratio: number = row.part / row.total;
          const text: string = BasicUtil.formatPercent(ratio, 0);
          const numeric: number = Number(text.substring(0, text.length - 1));
          expect(numeric).assertEqual(NumberSequenceUtil.roundTo(percent, 0));
        }
      }
      expect(NumberSequenceUtil.roundTo(NumberSequenceUtil.percentOf(1, 3), 1)).assertEqual(33.3);
      expect(BasicUtil.formatPercent(1 / 3, 1)).assertEqual('33.3%');
      expect(NumberSequenceUtil.roundTo(NumberSequenceUtil.percentOf(2, 3), 1)).assertEqual(66.7);
      expect(BasicUtil.formatPercent(2 / 3, 1)).assertEqual('66.7%');
      expect(NumberSequenceUtil.roundTo(Number(NumberSequenceUtil.percentOf(1, 3).toFixed(1)), 1)).assertEqual(33.3);
      const halfPercent: number = NumberSequenceUtil.percentOf(1, 2);
      expect(NumberSequenceUtil.roundTo(halfPercent, 0)).assertEqual(50);
      expect(BasicUtil.formatPercent(0.5, 0)).assertEqual('50%');
      expect(NumberSequenceUtil.percentOf(3, 4) + NumberSequenceUtil.percentOf(1, 4)).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_3800
     * @tc.name      testSeriesCombinationMatrix0001
     * @tc.desc      Verify that range, arithmeticSeries and fibonacci compose without contradiction across several parameter sets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSeriesCombinationMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSeriesCombinationMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const cases: number[] = [1, 2, 3, 5, 8];
      for (let index: number = 0; index < cases.length; index++) {
        const count: number = cases[index];
        const arithmetic: number[] = NumberSequenceUtil.arithmeticSeries(0, 1, count);
        const ranged: number[] = NumberSequenceUtil.range(0, count - 1);
        hilog.info(DOMAIN, TAG, '%{public}s', 'combination count ' + count);
        expect(NumberSequenceUtil.isSameSeries(arithmetic, ranged)).assertTrue();
        expect(arithmetic.length).assertEqual(count);
        expect(NumberSequenceUtil.sum(arithmetic)).assertEqual(count * (count - 1) / 2);
        expect(NumberSequenceUtil.maxOf(arithmetic)).assertEqual(count - 1);
        expect(NumberSequenceUtil.minOf(arithmetic)).assertEqual(0);
      }
      const fib: number[] = NumberSequenceUtil.fibonacci(12);
      // The terms above ten are 13, 21, 34, 55 and 89, so five values qualify.
      expect(NumberSequenceUtil.countAbove(fib, 10)).assertEqual(5);
      expect(NumberSequenceUtil.countInRange(fib, 2, 21)).assertEqual(6);
      expect(NumberSequenceUtil.distinct(fib).length).assertEqual(11);
      expect(NumberSequenceUtil.prefixSums([1, 1, 2, 3])[3]).assertEqual(7);
      expect(NumberSequenceUtil.frequency([1, 1, 2])[0].count).assertEqual(2);
      expect(NumberSequenceUtil.range(2, 20, 2).length).assertEqual(10);
      expect(NumberSequenceUtil.sum(NumberSequenceUtil.range(1, 10))).assertEqual(55);
      expect(NumberSequenceUtil.meanOf(NumberSequenceUtil.arithmeticSeries(1, 2, 5))).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_3900
     * @tc.name      testLargeValueBoundary0001
     * @tc.desc      Verify the numeric helpers stay stable for very large values and documented overflow fallbacks.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLargeValueBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLargeValueBoundary0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The digits of Number.MAX_SAFE_INTEGER sum up to 76.
      expect(NumberSequenceUtil.digitSum(9007199254740991)).assertEqual(76);
      expect(NumberSequenceUtil.digitReverse(9007199254740991)).assertLarger(0);
      expect(NumberSequenceUtil.gcd(9007199254740991, 9007199254740990)).assertEqual(1);
      expect(NumberSequenceUtil.factorial(170)).assertLarger(0);
      expect(NumberSequenceUtil.factorial(170) / NumberSequenceUtil.factorial(169)).assertEqual(170);
      expect(NumberSequenceUtil.toBaseString(Number.MAX_SAFE_INTEGER, 16).length).assertEqual(14);
      expect(NumberSequenceUtil.parseBaseString('1fffffffffffff', 16)).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(NumberSequenceUtil.clampInt(Number.MAX_SAFE_INTEGER, 0, 100)).assertEqual(100);
      expect(NumberSequenceUtil.clampInt(-Number.MAX_SAFE_INTEGER, 0, 100)).assertEqual(0);
      expect(NumberSequenceUtil.range(0, Number.MAX_SAFE_INTEGER, Number.MAX_SAFE_INTEGER).length).assertEqual(2);
      expect(NumberSequenceUtil.percentOf(Number.MAX_SAFE_INTEGER, Number.MAX_SAFE_INTEGER)).assertEqual(100);
      expect(NumberSequenceUtil.isPalindromeNumber(Number.MAX_SAFE_INTEGER)).assertFalse();
      expect(NumberSequenceUtil.factorial(170) > 0).assertTrue();
      expect(NumberSequenceUtil.gcd(Number.MAX_SAFE_INTEGER, 3)).assertEqual(1);
      expect(NumberSequenceUtil.digitSum(NumberSequenceUtil.factorial(20))).assertEqual(54);
      expect(NumberSequenceUtil.toBaseString(255, 16)).assertEqual('ff');
      // The first term above 1e15 is F(78), so a 70 term series cannot exceed the threshold.
      expect(NumberSequenceUtil.countAbove(NumberSequenceUtil.fibonacci(70), 1e15)).assertEqual(0);
      expect(NumberSequenceUtil.countAbove(NumberSequenceUtil.fibonacci(70), 1e10)).assertLarger(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_4000
     * @tc.name      testNegativeInputMatrix0001
     * @tc.desc      Verify how every digit based helper reacts to negative operands across a numeric table.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNegativeInputMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNegativeInputMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const negatives: number[] = [-1, -9, -10, -121, -1001, -1234];
      for (let index: number = 0; index < negatives.length; index++) {
        const value: number = negatives[index];
        const positive: number = Math.abs(value);
        hilog.info(DOMAIN, TAG, '%{public}s', 'negative operand ' + value);
        expect(NumberSequenceUtil.digitSum(value)).assertEqual(NumberSequenceUtil.digitSum(positive));
        expect(NumberSequenceUtil.digitReverse(value)).assertEqual(NumberSequenceUtil.digitReverse(positive));
        expect(NumberSequenceUtil.isPalindromeNumber(value)).assertEqual(NumberSequenceUtil.isPalindromeNumber(positive));
        expect(NumberSequenceUtil.toBaseString(value, 10)).assertEqual('-' + NumberSequenceUtil.toBaseString(positive, 10));
        expect(NumberSequenceUtil.parseBaseString(NumberSequenceUtil.toBaseString(value, 2), 2)).assertEqual(value);
      }
      expect(NumberSequenceUtil.isArmstrongNumber(-1)).assertTrue();
      expect(NumberSequenceUtil.isArmstrongNumber(-9)).assertTrue();
      expect(NumberSequenceUtil.isArmstrongNumber(-10)).assertFalse();
      expect(NumberSequenceUtil.clampInt(-150, -100, 100)).assertEqual(-100);
      expect(NumberSequenceUtil.gcd(-12, -18)).assertEqual(6);
      expect(NumberSequenceUtil.lcm(-6, -8)).assertEqual(24);
      expect(NumberSequenceUtil.roundTo(-12.345, 2)).assertEqual(-12.34);
      expect(NumberSequenceUtil.percentOf(-1, 4)).assertEqual(-25);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_4100
     * @tc.name      testGeometricAndArithmeticComposition0001
     * @tc.desc      Verify that geometricSeries and arithmeticSeries agree through log and diff relations on a parameter matrix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testGeometricAndArithmeticComposition0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testGeometricAndArithmeticComposition0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const counts: number[] = [2, 3, 4, 5, 6];
      for (let index: number = 0; index < counts.length; index++) {
        const count: number = counts[index];
        const doubled: number[] = NumberSequenceUtil.geometricSeries(1, 2, count);
        const differences: number[] = NumberSequenceUtil.differences(doubled);
        hilog.info(DOMAIN, TAG, '%{public}s', 'composition count ' + count);
        expect(doubled.length).assertEqual(count);
        expect(doubled[count - 1]).assertEqual(Math.pow(2, count - 1));
        expect(differences.length).assertEqual(count - 1);
        expect(NumberSequenceUtil.isAscending(differences)).assertTrue();
        expect(NumberSequenceUtil.sum(doubled)).assertEqual(Math.pow(2, count) - 1);
      }
      const stepping: number[] = NumberSequenceUtil.arithmeticSeries(3, 3, 10);
      expect(NumberSequenceUtil.prefixSums(stepping)[9]).assertEqual(165);
      expect(NumberSequenceUtil.meanOf(stepping)).assertEqual(16.5);
      // The values inside [10, 20] are 12, 15 and 18, so only three terms qualify.
      expect(NumberSequenceUtil.countInRange(stepping, 10, 20)).assertEqual(3);
      expect(NumberSequenceUtil.distinct(stepping).length).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSEQ_4200
     * @tc.name      testNumberTheoryCrossLink0001
     * @tc.desc      Verify the number theory helpers stay consistent with each other on a shared value table.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumberTheoryCrossLink0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumberTheoryCrossLink0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const values: number[] = [6, 28, 496, 12, 17, 97];
      for (let index: number = 0; index < values.length; index++) {
        const value: number = values[index];
        const divisorSum: number = NumberSequenceUtil.properDivisorSum(value);
        const primes: number[] = NumberSequenceUtil.primesBelow(value + 1);
        hilog.info(DOMAIN, TAG, '%{public}s', 'cross link value ' + value);
        // Every perfect number equals its own proper divisor sum.
        expect(NumberSequenceUtil.isPerfectNumber(value)).assertEqual(divisorSum === value);
        // The prime count below a value must grow with the value.
        expect(primes.length).assertLarger(0);
        expect(NumberSequenceUtil.isPrime(value)).assertEqual(primes.indexOf(value) === primes.length - 1 ||
          primes.indexOf(value) >= 0);
        expect(NumberSequenceUtil.gcd(value, divisorSum)).assertLarger(0);
        expect(NumberSequenceUtil.digitSum(value)).assertLarger(0);
      }
      expect(NumberSequenceUtil.primesBelow(8).length).assertEqual(4);
      expect(NumberSequenceUtil.isPerfectNumber(496)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
