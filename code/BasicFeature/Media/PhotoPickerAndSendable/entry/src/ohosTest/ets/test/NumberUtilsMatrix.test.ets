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
import { NumberUtils } from 'photopickersendable';
import { hilog } from '@kit.PerformanceAnalysisKit';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;

/**
 * Registers the numeric matrix cases of every NumberUtils helper of the shared
 * library. The same method is exercised with zero, negative, fractional and
 * sentinel numbers so that the full numeric domain is covered. All methods
 * under test are pure static helpers, so no ability context is required.
 */
export default function numberUtilsMatrixTest() {
  describe('NumberUtilsMatrixTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_0100
     * @tc.name      testNumMat0001
     * @tc.desc      Verify clamp keeps an in-range value unchanged for positive,
     *               zero, negative and fractional inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.clamp(5, 0, 10)).assertEqual(5);
      expect(NumberUtils.clamp(0, 0, 10)).assertEqual(0);
      expect(NumberUtils.clamp(-3, -10, -1)).assertEqual(-3);
      expect(NumberUtils.clamp(2.5, 1, 4)).assertEqual(2.5);
      expect(NumberUtils.clamp(-0.5, -1, 1)).assertEqual(-0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_0200
     * @tc.name      testNumMat0002
     * @tc.desc      Verify clamp raises a value below the lower bound to the
     *               lower bound, also when the bounds are negative.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.clamp(-5, 0, 10)).assertEqual(0);
      expect(NumberUtils.clamp(-20, -10, 10)).assertEqual(-10);
      expect(NumberUtils.clamp(-0.9, -0.5, 0.5)).assertEqual(-0.5);
      expect(NumberUtils.clamp(0, 1, 5)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_0300
     * @tc.name      testNumMat0003
     * @tc.desc      Verify clamp lowers a value above the upper bound to the
     *               upper bound for integer, fractional and negative bounds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.clamp(15, 0, 10)).assertEqual(10);
      expect(NumberUtils.clamp(100, -10, 10)).assertEqual(10);
      expect(NumberUtils.clamp(0.9, -0.5, 0.5)).assertEqual(0.5);
      expect(NumberUtils.clamp(-1, -5, -2)).assertEqual(-2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_0400
     * @tc.name      testNumMat0004
     * @tc.desc      Verify clamp keeps a value equal to one of the bounds
     *               untouched because the range endpoints are inclusive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.clamp(0, 0, 0)).assertEqual(0);
      expect(NumberUtils.clamp(10, 10, 20)).assertEqual(10);
      expect(NumberUtils.clamp(20, 10, 20)).assertEqual(20);
      expect(NumberUtils.clamp(-1, -1, -1)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_0500
     * @tc.name      testNumMat0005
     * @tc.desc      Verify clamp hands a NaN input back unchanged because NaN
     *               cannot be ordered against any bound.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Number.isNaN(NumberUtils.clamp(Number.NaN, 0, 10))).assertTrue();
      expect(Number.isNaN(NumberUtils.clamp(Number.NaN, -100, 100))).assertTrue();
      expect(Number.isNaN(NumberUtils.clamp(Number.NaN, -1, 1))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_0600
     * @tc.name      testNumMat0006
     * @tc.desc      Verify clamp on an inverted range prefers the lower bound
     *               for a low value and the upper bound for a high value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumMat0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumMat0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.clamp(0, 10, -10)).assertEqual(10);
      expect(NumberUtils.clamp(100, 10, -10)).assertEqual(-10);
      expect(NumberUtils.clamp(-50, 10, -10)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_0700
     * @tc.name      testNumMat0007
     * @tc.desc      Verify clamp folds the safe integer extremes into a small
     *               range and keeps them inside a matching wide range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumMat0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumMat0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.clamp(Number.MAX_SAFE_INTEGER, -100, 100)).assertEqual(100);
      expect(NumberUtils.clamp(Number.MIN_SAFE_INTEGER, -100, 100)).assertEqual(-100);
      expect(NumberUtils.clamp(Number.MAX_SAFE_INTEGER, 0, Number.MAX_SAFE_INTEGER))
        .assertEqual(Number.MAX_SAFE_INTEGER);
      expect(NumberUtils.clamp(Number.MIN_SAFE_INTEGER, Number.MIN_SAFE_INTEGER, 0))
        .assertEqual(Number.MIN_SAFE_INTEGER);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_0800
     * @tc.name      testNumMat0008
     * @tc.desc      Verify parseSafe converts plain integer text into the exact
     *               numeric value for positive, zero and negative inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.parseSafe('42')).assertEqual(42);
      expect(NumberUtils.parseSafe('0')).assertEqual(0);
      expect(NumberUtils.parseSafe('-7')).assertEqual(-7);
      expect(NumberUtils.parseSafe('123456789')).assertEqual(123456789);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_0900
     * @tc.name      testNumMat0009
     * @tc.desc      Verify parseSafe converts fractional and signed decimal
     *               text into the matching floating point value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.parseSafe('1.5')).assertEqual(1.5);
      expect(NumberUtils.parseSafe('-2.25')).assertEqual(-2.25);
      expect(NumberUtils.parseSafe('0.125')).assertEqual(0.125);
      expect(NumberUtils.parseSafe('100.001')).assertEqual(100.001);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_1000
     * @tc.name      testNumMat0010
     * @tc.desc      Verify parseSafe trims surrounding whitespace so padded
     *               numeric text still parses to the expected number.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.parseSafe(' 42 ')).assertEqual(42);
      expect(NumberUtils.parseSafe('\t-3\n')).assertEqual(-3);
      expect(NumberUtils.parseSafe(' 8.25  ')).assertEqual(8.25);
      expect(NumberUtils.parseSafe('  0  ')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_1100
     * @tc.name      testNumMat0011
     * @tc.desc      Verify parseSafe reports NaN for the empty string and for
     *               text that only contains whitespace.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Number.isNaN(NumberUtils.parseSafe(''))).assertTrue();
      expect(Number.isNaN(NumberUtils.parseSafe('   '))).assertTrue();
      expect(Number.isNaN(NumberUtils.parseSafe('\t\n'))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_1200
     * @tc.name      testNumMat0012
     * @tc.desc      Verify parseSafe reports NaN for non numeric text and for
     *               text that mixes digits with letters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Number.isNaN(NumberUtils.parseSafe('abc'))).assertTrue();
      expect(Number.isNaN(NumberUtils.parseSafe('12abc'))).assertTrue();
      expect(Number.isNaN(NumberUtils.parseSafe('a1'))).assertTrue();
      expect(Number.isNaN(NumberUtils.parseSafe('1,5'))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_1300
     * @tc.name      testNumMat0013
     * @tc.desc      Verify parseSafe reports NaN when the text is undefined or
     *               null because missing input cannot be parsed.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Number.isNaN(NumberUtils.parseSafe(undefined))).assertTrue();
      expect(Number.isNaN(NumberUtils.parseSafe(null))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_1400
     * @tc.name      testNumMat0014
     * @tc.desc      Verify parseSafe accepts scientific notation, hexadecimal
     *               and infinity text exactly like the platform parser.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumMat0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumMat0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.parseSafe('1e3')).assertEqual(1000);
      expect(NumberUtils.parseSafe('2.5e-2')).assertEqual(0.025);
      expect(NumberUtils.parseSafe('0x10')).assertEqual(16);
      expect(NumberUtils.parseSafe('Infinity')).assertEqual(Number.POSITIVE_INFINITY);
      expect(NumberUtils.parseSafe('-Infinity')).assertEqual(Number.NEGATIVE_INFINITY);
      expect(Number.isNaN(NumberUtils.parseSafe('NaN'))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_1500
     * @tc.name      testNumMat0015
     * @tc.desc      Verify parseSafe keeps the safe integer extremes exact and
     *               reports NaN for a bare plus sign without digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumMat0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumMat0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.parseSafe('9007199254740991')).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(NumberUtils.parseSafe('-9007199254740991')).assertEqual(Number.MIN_SAFE_INTEGER);
      expect(Number.isNaN(NumberUtils.parseSafe('+'))).assertTrue();
      expect(Number.isNaN(NumberUtils.parseSafe('-'))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_1600
     * @tc.name      testNumMat0016
     * @tc.desc      Verify toFixedSafe renders a fractional number with the
     *               requested number of decimals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.toFixedSafe(1.25, 2)).assertEqual('1.25');
      expect(NumberUtils.toFixedSafe(2.5, 1)).assertEqual('2.5');
      expect(NumberUtils.toFixedSafe(0.125, 3)).assertEqual('0.125');
      expect(NumberUtils.toFixedSafe(100, 0)).assertEqual('100');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_1700
     * @tc.name      testNumMat0017
     * @tc.desc      Verify toFixedSafe raises a negative digit count to zero so
     *               the platform formatter never receives an invalid precision.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.toFixedSafe(1.234, -1)).assertEqual('1');
      expect(NumberUtils.toFixedSafe(2.7, -100)).assertEqual('3');
      expect(NumberUtils.toFixedSafe(0.5, -2)).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_1800
     * @tc.name      testNumMat0018
     * @tc.desc      Verify toFixedSafe floors a fractional digit count before
     *               formatting, so 2.9 decimals behave like 2 decimals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumMat0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumMat0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.toFixedSafe(1.234, 2.9)).assertEqual('1.23');
      expect(NumberUtils.toFixedSafe(1.234, 0.9)).assertEqual('1');
      expect(NumberUtils.toFixedSafe(2.625, 2.5)).assertEqual('2.63');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_1900
     * @tc.name      testNumMat0019
     * @tc.desc      Verify toFixedSafe reports the literal text NaN when the
     *               input value is NaN.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.toFixedSafe(Number.NaN, 2)).assertEqual('NaN');
      expect(NumberUtils.toFixedSafe(Number.NaN, 0)).assertEqual('NaN');
      expect(NumberUtils.toFixedSafe(Number.NaN, -1)).assertEqual('NaN');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_2000
     * @tc.name      testNumMat0020
     * @tc.desc      Verify toFixedSafe renders infinity and negative infinity
     *               literally and formats zero and negative zero as zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumMat0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumMat0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.toFixedSafe(Number.POSITIVE_INFINITY, 2)).assertEqual('Infinity');
      expect(NumberUtils.toFixedSafe(Number.NEGATIVE_INFINITY, 2)).assertEqual('-Infinity');
      expect(NumberUtils.toFixedSafe(0, 2)).assertEqual('0.00');
      expect(NumberUtils.toFixedSafe(-0, 2)).assertEqual('0.00');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_2100
     * @tc.name      testNumMat0021
     * @tc.desc      Verify isInteger reports true for positive, negative and
     *               zero integer values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.isInteger(0)).assertTrue();
      expect(NumberUtils.isInteger(7)).assertTrue();
      expect(NumberUtils.isInteger(-9)).assertTrue();
      expect(NumberUtils.isInteger(1000000)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_2200
     * @tc.name      testNumMat0022
     * @tc.desc      Verify isInteger reports false for fractional values on
     *               both sides of zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.isInteger(0.1)).assertFalse();
      expect(NumberUtils.isInteger(1.5)).assertFalse();
      expect(NumberUtils.isInteger(-0.5)).assertFalse();
      expect(NumberUtils.isInteger(99.99)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_2300
     * @tc.name      testNumMat0023
     * @tc.desc      Verify isInteger rejects NaN and both infinities because
     *           they have no meaningful integer form.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.isInteger(Number.NaN)).assertFalse();
      expect(NumberUtils.isInteger(Number.POSITIVE_INFINITY)).assertFalse();
      expect(NumberUtils.isInteger(Number.NEGATIVE_INFINITY)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_2400
     * @tc.name      testNumMat0024
     * @tc.desc      Verify isPositive accepts positive numbers and rejects zero
     *               and negative numbers including negative fractions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.isPositive(1)).assertTrue();
      expect(NumberUtils.isPositive(0.0001)).assertTrue();
      expect(NumberUtils.isPositive(1000)).assertTrue();
      expect(NumberUtils.isPositive(0)).assertFalse();
      expect(NumberUtils.isPositive(-1)).assertFalse();
      expect(NumberUtils.isPositive(-0.001)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_2500
     * @tc.name      testNumMat0025
     * @tc.desc      Verify isPositive rejects NaN, negative zero and negative
     *               infinity while accepting positive infinity.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumMat0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumMat0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.isPositive(Number.NaN)).assertFalse();
      expect(NumberUtils.isPositive(-0)).assertFalse();
      expect(NumberUtils.isPositive(Number.NEGATIVE_INFINITY)).assertFalse();
      expect(NumberUtils.isPositive(Number.POSITIVE_INFINITY)).assertTrue();
      expect(NumberUtils.isPositive(Number.MIN_VALUE)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_2600
     * @tc.name      testNumMat0026
     * @tc.desc      Verify percent computes the exact ratio of simple integer
     *               part and total pairs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.percent(25, 50)).assertEqual(50);
      expect(NumberUtils.percent(2, 8)).assertEqual(25);
      expect(NumberUtils.percent(1, 4)).assertEqual(25);
      expect(NumberUtils.percent(50, 100)).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_2700
     * @tc.name      testNumMat0027
     * @tc.desc      Verify percent clamps an oversized part to one hundred and
     *               a negative part to zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.percent(10, 5)).assertEqual(100);
      expect(NumberUtils.percent(1000, 100)).assertEqual(100);
      expect(NumberUtils.percent(-1, 5)).assertEqual(0);
      expect(NumberUtils.percent(-100, 3)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_2800
     * @tc.name      testNumMat0028
     * @tc.desc      Verify percent returns zero whenever the total is zero,
     *               negative or NaN because the ratio is meaningless.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.percent(1, 0)).assertEqual(0);
      expect(NumberUtils.percent(1, -5)).assertEqual(0);
      expect(NumberUtils.percent(100, -1)).assertEqual(0);
      expect(NumberUtils.percent(1, Number.NaN)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_2900
     * @tc.name      testNumMat0029
     * @tc.desc      Verify percent equals one hundred when part equals total
     *               and stays close to the one third ratio for uneven input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumMat0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumMat0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.percent(5, 5)).assertEqual(100);
      expect(NumberUtils.percent(7, 7)).assertEqual(100);
      expect(Math.abs(NumberUtils.percent(1, 3) - 33.33333333333333) < 0.000000001).assertTrue();
      expect(Math.abs(NumberUtils.percent(2, 3) - 66.66666666666666) < 0.000000001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_3000
     * @tc.name      testNumMat0030
     * @tc.desc      Verify formatThousands leaves numbers below one thousand
     *               without any separator.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.formatThousands(0)).assertEqual('0');
      expect(NumberUtils.formatThousands(1)).assertEqual('1');
      expect(NumberUtils.formatThousands(99)).assertEqual('99');
      expect(NumberUtils.formatThousands(999)).assertEqual('999');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_3100
     * @tc.name      testNumMat0031
     * @tc.desc      Verify formatThousands inserts one separator per three
     *               digits for the thousand and million ranges.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.formatThousands(1000)).assertEqual('1,000');
      expect(NumberUtils.formatThousands(12345)).assertEqual('12,345');
      expect(NumberUtils.formatThousands(999999)).assertEqual('999,999');
      expect(NumberUtils.formatThousands(1000000)).assertEqual('1,000,000');
      expect(NumberUtils.formatThousands(1234567)).assertEqual('1,234,567');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_3200
     * @tc.name      testNumMat0032
     * @tc.desc      Verify formatThousands keeps the fractional part intact and
     *               prefixes a minus sign for negative numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.formatThousands(123.456)).assertEqual('123.456');
      expect(NumberUtils.formatThousands(1234.5)).assertEqual('1,234.5');
      expect(NumberUtils.formatThousands(-9876543.21)).assertEqual('-9,876,543.21');
      expect(NumberUtils.formatThousands(-1000)).assertEqual('-1,000');
      expect(NumberUtils.formatThousands(-1)).assertEqual('-1');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_3300
     * @tc.name      testNumMat0033
     * @tc.desc      Verify formatThousands reports NaN literally and groups the
     *               digit letters of infinity exactly like numeric digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumMat0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumMat0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.formatThousands(Number.NaN)).assertEqual('NaN');
      expect(NumberUtils.formatThousands(Number.POSITIVE_INFINITY)).assertEqual('In,fin,ity');
      expect(NumberUtils.formatThousands(Number.NEGATIVE_INFINITY)).assertEqual('-In,fin,ity');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_3400
     * @tc.name      testNumMat0034
     * @tc.desc      Verify roundHalfUp rounds exact half values away from zero
     *               at zero decimal places.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.roundHalfUp(2.5, 0)).assertEqual(3);
      expect(NumberUtils.roundHalfUp(-2.5, 0)).assertEqual(-3);
      expect(NumberUtils.roundHalfUp(0.5, 0)).assertEqual(1);
      expect(NumberUtils.roundHalfUp(-0.5, 0)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_3500
     * @tc.name      testNumMat0035
     * @tc.desc      Verify roundHalfUp rounds exact half values away from zero
     *               at one and two decimal places.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.roundHalfUp(1.25, 1)).assertEqual(1.3);
      expect(NumberUtils.roundHalfUp(-1.25, 1)).assertEqual(-1.3);
      expect(NumberUtils.roundHalfUp(0.125, 2)).assertEqual(0.13);
      expect(NumberUtils.roundHalfUp(-0.125, 2)).assertEqual(-0.13);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_3600
     * @tc.name      testNumMat0036
     * @tc.desc      Verify roundHalfUp performs ordinary rounding on non half
     *               values for integer and negative inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.roundHalfUp(123.444, 1)).assertEqual(123.4);
      expect(NumberUtils.roundHalfUp(123.456, 1)).assertEqual(123.5);
      expect(NumberUtils.roundHalfUp(-123.444, 1)).assertEqual(-123.4);
      expect(NumberUtils.roundHalfUp(3.14159, 2)).assertEqual(3.14);
      expect(NumberUtils.roundHalfUp(42, 0)).assertEqual(42);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_3700
     * @tc.name      testNumMat0037
     * @tc.desc      Verify roundHalfUp raises a negative digit count to zero
     *               and reports NaN for non finite input values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumMat0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumMat0037';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.roundHalfUp(2.6, -3)).assertEqual(3);
      expect(Number.isNaN(NumberUtils.roundHalfUp(Number.NaN, 2))).assertTrue();
      expect(Number.isNaN(NumberUtils.roundHalfUp(Number.POSITIVE_INFINITY, 2))).assertTrue();
      expect(Number.isNaN(NumberUtils.roundHalfUp(Number.NEGATIVE_INFINITY, 2))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_3800
     * @tc.name      testNumMat0038
     * @tc.desc      Verify bytesToReadable renders zero, negative and NaN byte
     *               counts as the zero byte text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0038';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.bytesToReadable(0)).assertEqual('0 B');
      expect(NumberUtils.bytesToReadable(-1)).assertEqual('0 B');
      expect(NumberUtils.bytesToReadable(-1024)).assertEqual('0 B');
      expect(NumberUtils.bytesToReadable(Number.NaN)).assertEqual('0 B');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_3900
     * @tc.name      testNumMat0039
     * @tc.desc      Verify bytesToReadable prints byte sized values without
     *               decimals below the kibibyte boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0039';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.bytesToReadable(1)).assertEqual('1 B');
      expect(NumberUtils.bytesToReadable(512)).assertEqual('512 B');
      expect(NumberUtils.bytesToReadable(1023)).assertEqual('1023 B');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_4000
     * @tc.name      testNumMat0040
     * @tc.desc      Verify bytesToReadable switches to the kibibyte and
     *               mebibyte unit with one decimal at the boundaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0040';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.bytesToReadable(1024)).assertEqual('1.0 KB');
      expect(NumberUtils.bytesToReadable(1536)).assertEqual('1.5 KB');
      expect(NumberUtils.bytesToReadable(2048)).assertEqual('2.0 KB');
      expect(NumberUtils.bytesToReadable(1048576)).assertEqual('1.0 MB');
      expect(NumberUtils.bytesToReadable(1572864)).assertEqual('1.5 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_4100
     * @tc.name      testNumMat0041
     * @tc.desc      Verify bytesToReadable switches to the gibibyte and
     *               tebibyte unit with one decimal at the boundaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumMat0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumMat0041';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.bytesToReadable(1073741824)).assertEqual('1.0 GB');
      expect(NumberUtils.bytesToReadable(1610612736)).assertEqual('1.5 GB');
      expect(NumberUtils.bytesToReadable(1099511627776)).assertEqual('1.0 TB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_4200
     * @tc.name      testNumMat0042
     * @tc.desc      Verify bytesToReadable reports infinity inside the
     *               terabyte unit because the ratio never becomes finite.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumMat0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumMat0042';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.bytesToReadable(Number.POSITIVE_INFINITY)).assertEqual('Infinity TB');
      const maxText: string = NumberUtils.bytesToReadable(Number.MAX_VALUE);
      expect(maxText.length > 0).assertTrue();
      expect(maxText.indexOf(' TB') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_4300
     * @tc.name      testNumMat0043
     * @tc.desc      Verify parseSafe and isInteger agree that a padded integer
     *               text yields an integer while decimal text does not.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumMat0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumMat0043';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const whole: number = NumberUtils.parseSafe(' 77 ');
      expect(NumberUtils.isInteger(whole)).assertTrue();
      expect(whole).assertEqual(77);
      const fraction: number = NumberUtils.parseSafe('7.7');
      expect(NumberUtils.isInteger(fraction)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMMAT_4400
     * @tc.name      testNumMat0044
     * @tc.desc      Verify percent and isPositive cooperate so that only a
     *               positive total produces a meaningful percentage.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumMat0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumMat0044';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.isPositive(10)).assertTrue();
      expect(NumberUtils.percent(5, 10)).assertEqual(50);
      expect(NumberUtils.isPositive(0)).assertFalse();
      expect(NumberUtils.percent(5, 0)).assertEqual(0);
      expect(NumberUtils.isPositive(-10)).assertFalse();
      expect(NumberUtils.percent(5, -10)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
