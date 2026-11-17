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
/** Largest whole number the double precision format can represent exactly. */
const MAX_SAFE: number = Number.MAX_SAFE_INTEGER;
/** Smallest whole number the double precision format can represent exactly. */
const MIN_SAFE: number = Number.MIN_SAFE_INTEGER;
/** Smallest positive subnormal double, used as a boundary for sign checks. */
const MIN_POSITIVE: number = Number.MIN_VALUE;
/** Thousand separator expected by the grouping formatter. */
const SEPARATOR: string = ',';

/**
 * Registers the boundary oriented cases of every NumberUtils helper. Each case
 * drives one method into its extreme numeric corner: safe integer limits,
 * subnormals, epsilon sized values, sentinel NaN and infinity values plus the
 * exact unit boundaries of the byte formatter.
 */
export default function numberUtilsEdgeTest() {
  describe('NumberUtilsEdgeTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_0100
     * @tc.name      testNumEdge0001
     * @tc.desc      Verify clamp keeps a value equal to either boundary
     *               unchanged instead of moving it inside the range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumEdge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.clamp(0, 0, 100)).assertEqual(0);
      expect(NumberUtils.clamp(100, 0, 100)).assertEqual(100);
      expect(NumberUtils.clamp(-50, -50, -10)).assertEqual(-50);
      expect(NumberUtils.clamp(-10, -50, -10)).assertEqual(-10);
      expect(NumberUtils.clamp(1.5, 1.5, 2.5)).assertEqual(1.5);
      expect(NumberUtils.clamp(2.5, 1.5, 2.5)).assertEqual(2.5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_0200
     * @tc.name      testNumEdge0002
     * @tc.desc      Verify clamp saturates safe integer extremes against a
     *               narrow range without producing an out of range result.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumEdge0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.clamp(MAX_SAFE, -1, 1)).assertEqual(1);
      expect(NumberUtils.clamp(MIN_SAFE, -1, 1)).assertEqual(-1);
      expect(NumberUtils.clamp(MAX_SAFE, 0, MAX_SAFE)).assertEqual(MAX_SAFE);
      expect(NumberUtils.clamp(MIN_SAFE, MIN_SAFE, 0)).assertEqual(MIN_SAFE);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_0300
     * @tc.name      testNumEdge0003
     * @tc.desc      Verify clamp returns NaN unchanged and treats negative
     *               zero as an ordinary in-range value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumEdge0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Number.isNaN(NumberUtils.clamp(Number.NaN, 0, 10))).assertTrue();
      expect(Number.isNaN(NumberUtils.clamp(Number.NaN, Number.NaN, 10))).assertTrue();
      expect(NumberUtils.clamp(-0, -1, 1)).assertEqual(0);
      expect(NumberUtils.clamp(-0, 1, 2)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_0400
     * @tc.name      testNumEdge0004
     * @tc.desc      Verify clamp honours the lower bound when the requested
     *               range is inverted because the lower bound wins first.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumEdge0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumEdge0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.clamp(0, 10, -10)).assertEqual(10);
      expect(NumberUtils.clamp(100, 10, -10)).assertEqual(-10);
      expect(NumberUtils.clamp(-100, 10, -10)).assertEqual(10);
      expect(NumberUtils.clamp(5, 5, 5)).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_0500
     * @tc.name      testNumEdge0005
     * @tc.desc      Verify parseSafe decodes radix prefixed texts through the
     *               platform parser including hex, binary and octal forms.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumEdge0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumEdge0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.parseSafe('0x10')).assertEqual(16);
      expect(NumberUtils.parseSafe('0b101')).assertEqual(5);
      expect(NumberUtils.parseSafe('0o17')).assertEqual(15);
      expect(NumberUtils.parseSafe('0xFF')).assertEqual(255);
      expect(Number.isNaN(NumberUtils.parseSafe('0x'))).assertTrue();
      expect(Number.isNaN(NumberUtils.parseSafe('0b'))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_0600
     * @tc.name      testNumEdge0006
     * @tc.desc      Verify parseSafe accepts leading zeros and explicit plus
     *               or minus signs and yields the exact signed magnitude.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumEdge0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumEdge0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.parseSafe('007')).assertEqual(7);
      expect(NumberUtils.parseSafe('000')).assertEqual(0);
      expect(NumberUtils.parseSafe('+42')).assertEqual(42);
      expect(NumberUtils.parseSafe('-42')).assertEqual(-42);
      expect(NumberUtils.parseSafe('+0.5')).assertEqual(0.5);
      expect(NumberUtils.parseSafe('-0.5')).assertEqual(-0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_0700
     * @tc.name      testNumEdge0007
     * @tc.desc      Verify parseSafe understands exponent notation for large,
     *               small and negative exponents.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumEdge0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumEdge0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.parseSafe('1e3')).assertEqual(1000);
      expect(NumberUtils.parseSafe('1e-3')).assertEqual(0.001);
      expect(NumberUtils.parseSafe('2.5e2')).assertEqual(250);
      expect(NumberUtils.parseSafe('1e21')).assertEqual(1e21);
      expect(NumberUtils.parseSafe('-1e3')).assertEqual(-1000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_0800
     * @tc.name      testNumEdge0008
     * @tc.desc      Verify parseSafe reports the sentinel texts Infinity,
     *               -Infinity and NaN through the number domain.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumEdge0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumEdge0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.parseSafe('Infinity')).assertEqual(Number.POSITIVE_INFINITY);
      expect(NumberUtils.parseSafe('-Infinity')).assertEqual(Number.NEGATIVE_INFINITY);
      expect(Number.isNaN(NumberUtils.parseSafe('NaN'))).assertTrue();
      expect(Number.isNaN(NumberUtils.parseSafe('nan'))).assertTrue();
      expect(Number.isNaN(NumberUtils.parseSafe('infinity'))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_0900
     * @tc.name      testNumEdge0009
     * @tc.desc      Verify parseSafe trims every whitespace kind around the
     *               numeric text before handing it to the parser.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumEdge0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumEdge0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.parseSafe(' 15 ')).assertEqual(15);
      expect(NumberUtils.parseSafe('\t15\t')).assertEqual(15);
      expect(NumberUtils.parseSafe('\n15\n')).assertEqual(15);
      expect(NumberUtils.parseSafe(' \t 15 \t ')).assertEqual(15);
      expect(Number.isNaN(NumberUtils.parseSafe('1 5'))).assertTrue();
      expect(Number.isNaN(NumberUtils.parseSafe(' '))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_1000
     * @tc.name      testNumEdge0010
     * @tc.desc      Verify parseSafe round trips the safe integer limits
     *               exactly without precision loss.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumEdge0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumEdge0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.parseSafe('9007199254740991')).assertEqual(MAX_SAFE);
      expect(NumberUtils.parseSafe('-9007199254740991')).assertEqual(MIN_SAFE);
      expect(NumberUtils.isInteger(NumberUtils.parseSafe('9007199254740991'))).assertTrue();
      expect(NumberUtils.isInteger(NumberUtils.parseSafe('-9007199254740991'))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_1100
     * @tc.name      testNumEdge0011
     * @tc.desc      Verify parseSafe maps the missing texts undefined, null,
     *               empty and blank to the NaN sentinel.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumEdge0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumEdge0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Number.isNaN(NumberUtils.parseSafe(undefined))).assertTrue();
      expect(Number.isNaN(NumberUtils.parseSafe(null))).assertTrue();
      expect(Number.isNaN(NumberUtils.parseSafe(''))).assertTrue();
      expect(Number.isNaN(NumberUtils.parseSafe('   '))).assertTrue();
      expect(Number.isNaN(NumberUtils.parseSafe('\t'))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_1200
     * @tc.name      testNumEdge0012
     * @tc.desc      Verify toFixedSafe raises a negative digits request to
     *               zero decimals and keeps exact half values rounded up.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumEdge0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumEdge0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.toFixedSafe(2.5, -3)).assertEqual('3');
      expect(NumberUtils.toFixedSafe(-2.5, -3)).assertEqual('-3');
      expect(NumberUtils.toFixedSafe(2.5, 0)).assertEqual('3');
      expect(NumberUtils.toFixedSafe(1.125, 2)).assertEqual('1.13');
      expect(NumberUtils.toFixedSafe(2.375, 2)).assertEqual('2.38');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_1300
     * @tc.name      testNumEdge0013
     * @tc.desc      Verify toFixedSafe floors a fractional digits request and
     *               renders negative zero without a sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumEdge0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumEdge0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.toFixedSafe(1.234567, 2.9)).assertEqual('1.23');
      expect(NumberUtils.toFixedSafe(1.234567, 5.7)).assertEqual('1.23457');
      expect(NumberUtils.toFixedSafe(-0, 2)).assertEqual('0.00');
      expect(NumberUtils.toFixedSafe(-0, 0)).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_1400
     * @tc.name      testNumEdge0014
     * @tc.desc      Verify toFixedSafe reports NaN and both infinities as
     *               literal texts instead of throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumEdge0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumEdge0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.toFixedSafe(Number.NaN, 5)).assertEqual('NaN');
      expect(NumberUtils.toFixedSafe(Number.POSITIVE_INFINITY, 1)).assertEqual('Infinity');
      expect(NumberUtils.toFixedSafe(Number.NEGATIVE_INFINITY, 1)).assertEqual('-Infinity');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_1500
     * @tc.name      testNumEdge0015
     * @tc.desc      Verify toFixedSafe propagates the platform RangeError when
     *               the digits request exceeds the supported maximum of 100.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumEdge0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumEdge0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let caught: boolean = false;
      try {
        NumberUtils.toFixedSafe(1.5, 150);
      } catch (error) {
        caught = true;
      }
      expect(caught).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_1600
     * @tc.name      testNumEdge0016
     * @tc.desc      Verify isInteger accepts every whole number up to and
     *               including the safe integer limits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumEdge0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumEdge0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.isInteger(MAX_SAFE)).assertTrue();
      expect(NumberUtils.isInteger(MIN_SAFE)).assertTrue();
      expect(NumberUtils.isInteger(9007199254740992)).assertTrue();
      expect(NumberUtils.isInteger(-9007199254740992)).assertTrue();
      expect(NumberUtils.isInteger(-0)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_1700
     * @tc.name      testNumEdge0017
     * @tc.desc      Verify isInteger rejects the smallest positive subnormal
     *               and epsilon sized values because their floor differs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumEdge0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumEdge0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.isInteger(MIN_POSITIVE)).assertFalse();
      expect(NumberUtils.isInteger(Number.EPSILON)).assertFalse();
      expect(NumberUtils.isInteger(-Number.EPSILON)).assertFalse();
      expect(NumberUtils.isInteger(1e-7)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_1800
     * @tc.name      testNumEdge0018
     * @tc.desc      Verify isPositive treats the smallest positive subnormal
     *               as positive and negative zero as non positive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumEdge0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumEdge0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.isPositive(MIN_POSITIVE)).assertTrue();
      expect(NumberUtils.isPositive(Number.EPSILON)).assertTrue();
      expect(NumberUtils.isPositive(-0)).assertFalse();
      expect(NumberUtils.isPositive(Number.NaN)).assertFalse();
      expect(NumberUtils.isPositive(Number.POSITIVE_INFINITY)).assertTrue();
      expect(NumberUtils.isPositive(Number.NEGATIVE_INFINITY)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_1900
     * @tc.name      testNumEdge0019
     * @tc.desc      Verify percent saturates at 100 for an extremely large
     *               part over a tiny total and at 0 for a negative part.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumEdge0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumEdge0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.percent(MAX_SAFE, 1)).assertEqual(100);
      expect(NumberUtils.percent(-MAX_SAFE, 1)).assertEqual(0);
      expect(NumberUtils.percent(Number.POSITIVE_INFINITY, 1)).assertEqual(100);
      expect(NumberUtils.percent(Number.NEGATIVE_INFINITY, 1)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_2000
     * @tc.name      testNumEdge0020
     * @tc.desc      Verify percent yields NaN when the part is NaN and zero
     *               when the total is not positive including NaN totals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumEdge0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumEdge0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Number.isNaN(NumberUtils.percent(Number.NaN, 10))).assertTrue();
      expect(NumberUtils.percent(1, 0)).assertEqual(0);
      expect(NumberUtils.percent(1, -10)).assertEqual(0);
      expect(NumberUtils.percent(1, Number.NaN)).assertEqual(0);
      expect(NumberUtils.percent(1, Number.NEGATIVE_INFINITY)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_2100
     * @tc.name      testNumEdge0021
     * @tc.desc      Verify percent keeps a tiny positive ratio unclamped and
     *               below one tenth of a percent for a huge total.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumEdge0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumEdge0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const tiny: number = NumberUtils.percent(1, MAX_SAFE);
      expect(tiny).assertLargerOrEqual(0);
      expect(tiny).assertLess(0.001);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_2200
     * @tc.name      testNumEdge0022
     * @tc.desc      Verify formatThousands keeps values below one thousand
     *               free of separators at the exact boundary values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumEdge0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumEdge0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.formatThousands(0)).assertEqual('0');
      expect(NumberUtils.formatThousands(1)).assertEqual('1');
      expect(NumberUtils.formatThousands(99)).assertEqual('99');
      expect(NumberUtils.formatThousands(999)).assertEqual('999');
      expect(NumberUtils.formatThousands(-999)).assertEqual('-999');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_2300
     * @tc.name      testNumEdge0023
     * @tc.desc      Verify formatThousands inserts the first separator at
     *               exactly one thousand and keeps the group widths stable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumEdge0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumEdge0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.formatThousands(1000)).assertEqual('1' + SEPARATOR + '000');
      expect(NumberUtils.formatThousands(1001)).assertEqual('1' + SEPARATOR + '001');
      expect(NumberUtils.formatThousands(99999)).assertEqual('99' + SEPARATOR + '999');
      expect(NumberUtils.formatThousands(-1000)).assertEqual('-1' + SEPARATOR + '000');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_2400
     * @tc.name      testNumEdge0024
     * @tc.desc      Verify formatThousands groups millions and hundreds of
     *               millions into three digit blocks from the right.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumEdge0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumEdge0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.formatThousands(1000000))
        .assertEqual('1' + SEPARATOR + '000' + SEPARATOR + '000');
      expect(NumberUtils.formatThousands(999999999))
        .assertEqual('999' + SEPARATOR + '999' + SEPARATOR + '999');
      expect(NumberUtils.formatThousands(123456789))
        .assertEqual('123' + SEPARATOR + '456' + SEPARATOR + '789');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_2500
     * @tc.name      testNumEdge0025
     * @tc.desc      Verify formatThousands renders the safe integer maximum
     *               with the documented five separator grouping.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumEdge0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumEdge0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.formatThousands(MAX_SAFE))
        .assertEqual('9' + SEPARATOR + '007' + SEPARATOR + '199' + SEPARATOR + '254' +
          SEPARATOR + '740' + SEPARATOR + '991');
      expect(NumberUtils.formatThousands(MIN_SAFE))
        .assertEqual('-9' + SEPARATOR + '007' + SEPARATOR + '199' + SEPARATOR + '254' +
          SEPARATOR + '740' + SEPARATOR + '991');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_2600
     * @tc.name      testNumEdge0026
     * @tc.desc      Verify formatThousands appends the fractional part without
     *               touching the grouped integer digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumEdge0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumEdge0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.formatThousands(1234.5))
        .assertEqual('1' + SEPARATOR + '234.5');
      expect(NumberUtils.formatThousands(1234567.891))
        .assertEqual('1' + SEPARATOR + '234' + SEPARATOR + '567.891');
      expect(NumberUtils.formatThousands(-1234.5))
        .assertEqual('-1' + SEPARATOR + '234.5');
      expect(NumberUtils.formatThousands(0.5)).assertEqual('0.5');
      expect(NumberUtils.formatThousands(-0.5)).assertEqual('-0.5');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_2700
     * @tc.name      testNumEdge0027
     * @tc.desc      Verify formatThousands maps NaN to the literal text and
     *               groups the letters of the infinity literals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumEdge0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumEdge0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.formatThousands(Number.NaN)).assertEqual('NaN');
      expect(NumberUtils.formatThousands(Number.POSITIVE_INFINITY))
        .assertEqual('In' + SEPARATOR + 'fin' + SEPARATOR + 'ity');
      expect(NumberUtils.formatThousands(Number.NEGATIVE_INFINITY))
        .assertEqual('-In' + SEPARATOR + 'fin' + SEPARATOR + 'ity');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_2800
     * @tc.name      testNumEdge0028
     * @tc.desc      Verify formatThousands treats negative zero as plain zero
     *               because the sign test only fires for values below zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumEdge0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumEdge0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.formatThousands(-0)).assertEqual('0');
      expect(NumberUtils.formatThousands(0)).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_2900
     * @tc.name      testNumEdge0029
     * @tc.desc      Verify roundHalfUp moves exact half values away from zero
     *               at zero digits for both signs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumEdge0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumEdge0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.roundHalfUp(0.5, 0)).assertEqual(1);
      expect(NumberUtils.roundHalfUp(-0.5, 0)).assertEqual(-1);
      expect(NumberUtils.roundHalfUp(2.5, 0)).assertEqual(3);
      expect(NumberUtils.roundHalfUp(-2.5, 0)).assertEqual(-3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_3000
     * @tc.name      testNumEdge0030
     * @tc.desc      Verify roundHalfUp rounds exact binary halves away from
     *               zero at one and two digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumEdge0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumEdge0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.roundHalfUp(1.25, 1)).assertEqual(1.3);
      expect(NumberUtils.roundHalfUp(-1.25, 1)).assertEqual(-1.3);
      expect(NumberUtils.roundHalfUp(2.75, 1)).assertEqual(2.8);
      expect(NumberUtils.roundHalfUp(-2.75, 1)).assertEqual(-2.8);
      expect(NumberUtils.roundHalfUp(0.125, 2)).assertEqual(0.13);
      expect(NumberUtils.roundHalfUp(-0.125, 2)).assertEqual(-0.13);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_3100
     * @tc.name      testNumEdge0031
     * @tc.desc      Verify roundHalfUp keeps negative zero input at the plain
     *               zero result because minus zero floors to zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumEdge0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumEdge0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.roundHalfUp(-0, 0)).assertEqual(0);
      expect(NumberUtils.roundHalfUp(0, 0)).assertEqual(0);
      expect(NumberUtils.roundHalfUp(0.4, 0)).assertEqual(0);
      expect(NumberUtils.roundHalfUp(-0.4, 0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_3200
     * @tc.name      testNumEdge0032
     * @tc.desc      Verify roundHalfUp reports NaN for NaN and both infinite
     *               inputs because they cannot be rounded.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumEdge0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumEdge0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Number.isNaN(NumberUtils.roundHalfUp(Number.NaN, 2))).assertTrue();
      expect(Number.isNaN(NumberUtils.roundHalfUp(Number.POSITIVE_INFINITY, 2))).assertTrue();
      expect(Number.isNaN(NumberUtils.roundHalfUp(Number.NEGATIVE_INFINITY, 2))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_3300
     * @tc.name      testNumEdge0033
     * @tc.desc      Verify roundHalfUp raises a negative digits request to
     *               zero and floors a fractional digits request.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumEdge0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumEdge0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.roundHalfUp(2.5, -2)).assertEqual(3);
      expect(NumberUtils.roundHalfUp(1.23456, 2.9)).assertEqual(1.23);
      expect(NumberUtils.roundHalfUp(1.266, 2.9)).assertEqual(1.27);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_3400
     * @tc.name      testNumEdge0034
     * @tc.desc      Verify roundHalfUp over a huge safe integer stays at or
     *               above the input magnitude regardless of tie behaviour.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumEdge0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumEdge0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const rounded: number = NumberUtils.roundHalfUp(MAX_SAFE, 0);
      expect(rounded).assertLargerOrEqual(MAX_SAFE);
      expect(rounded).assertLessOrEqual(MAX_SAFE + 2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_3500
     * @tc.name      testNumEdge0035
     * @tc.desc      Verify roundHalfUp degrades to NaN when the scale factor
     *               overflows for an absurd digits request.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumEdge0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumEdge0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(Number.isNaN(NumberUtils.roundHalfUp(2, 320))).assertTrue();
      expect(NumberUtils.roundHalfUp(2, 150)).assertEqual(2);
      expect(NumberUtils.roundHalfUp(1000, 150)).assertEqual(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_3600
     * @tc.name      testNumEdge0036
     * @tc.desc      Verify bytesToReadable prints the byte unit without
     *               decimals from one byte up to the kibibyte boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumEdge0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumEdge0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.bytesToReadable(1)).assertEqual('1 B');
      expect(NumberUtils.bytesToReadable(2)).assertEqual('2 B');
      expect(NumberUtils.bytesToReadable(1022)).assertEqual('1022 B');
      expect(NumberUtils.bytesToReadable(1023)).assertEqual('1023 B');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_3700
     * @tc.name      testNumEdge0037
     * @tc.desc      Verify bytesToReadable switches to the kibibyte unit at
     *               exactly 1024 bytes and keeps one decimal formatting.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumEdge0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumEdge0037';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.bytesToReadable(1024)).assertEqual('1.0 KB');
      expect(NumberUtils.bytesToReadable(1025)).assertEqual('1.0 KB');
      expect(NumberUtils.bytesToReadable(1536)).assertEqual('1.5 KB');
      expect(NumberUtils.bytesToReadable(2048)).assertEqual('2.0 KB');
      expect(NumberUtils.bytesToReadable(2049)).assertEqual('2.0 KB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_3800
     * @tc.name      testNumEdge0038
     * @tc.desc      Verify bytesToReadable shows the last kibibyte value as
     *               a rounded one decimal and the first mebibyte as 1.0 MB.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumEdge0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumEdge0038';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.bytesToReadable(1048575)).assertEqual('1024.0 KB');
      expect(NumberUtils.bytesToReadable(1048576)).assertEqual('1.0 MB');
      expect(NumberUtils.bytesToReadable(1048577)).assertEqual('1.0 MB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_3900
     * @tc.name      testNumEdge0039
     * @tc.desc      Verify bytesToReadable switches to the gibibyte unit at
     *               exactly one gibibyte and rounds the last mebibyte value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumEdge0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumEdge0039';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.bytesToReadable(1073741823)).assertEqual('1024.0 MB');
      expect(NumberUtils.bytesToReadable(1073741824)).assertEqual('1.0 GB');
      expect(NumberUtils.bytesToReadable(1610612736)).assertEqual('1.5 GB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_4000
     * @tc.name      testNumEdge0040
     * @tc.desc      Verify bytesToReadable switches to the tebibyte unit at
     *               exactly one tebibyte and rounds the last gibibyte value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumEdge0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumEdge0040';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.bytesToReadable(1099511627775)).assertEqual('1024.0 GB');
      expect(NumberUtils.bytesToReadable(1099511627776)).assertEqual('1.0 TB');
      expect(NumberUtils.bytesToReadable(1649267441664)).assertEqual('1.5 TB');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_4100
     * @tc.name      testNumEdge0041
     * @tc.desc      Verify bytesToReadable stays in the terabyte unit for an
     *               infinite request and keeps a non empty TB text for the
     *               maximum double value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumEdge0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testNumEdge0041';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.bytesToReadable(Number.POSITIVE_INFINITY)).assertEqual('Infinity TB');
      const hugeText: string = NumberUtils.bytesToReadable(Number.MAX_VALUE);
      expect(hugeText.indexOf(' TB') > 0).assertTrue();
      expect(hugeText.length > 3).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_4200
     * @tc.name      testNumEdge0042
     * @tc.desc      Verify bytesToReadable clamps zero, negative and NaN
     *               byte counts to the zero byte text at every boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumEdge0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumEdge0042';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberUtils.bytesToReadable(0)).assertEqual('0 B');
      expect(NumberUtils.bytesToReadable(-0)).assertEqual('0 B');
      expect(NumberUtils.bytesToReadable(-1)).assertEqual('0 B');
      expect(NumberUtils.bytesToReadable(-1048576)).assertEqual('0 B');
      expect(NumberUtils.bytesToReadable(Number.NaN)).assertEqual('0 B');
      expect(NumberUtils.bytesToReadable(Number.NEGATIVE_INFINITY)).assertEqual('0 B');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_4300
     * @tc.name      testNumEdge0043
     * @tc.desc      Verify parseSafe and toFixedSafe cooperate on a parsed
     *               fraction so formatting keeps the parsed magnitude.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumEdge0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumEdge0043';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const parsed: number = NumberUtils.parseSafe('12.25');
      expect(parsed).assertEqual(12.25);
      expect(NumberUtils.toFixedSafe(parsed, 1)).assertEqual('12.3');
      expect(NumberUtils.toFixedSafe(parsed, 2)).assertEqual('12.25');
      expect(NumberUtils.isInteger(parsed)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMEDGE_4400
     * @tc.name      testNumEdge0044
     * @tc.desc      Verify roundHalfUp and formatThousands agree on a rounded
     *               value so the grouped text shows the rounded magnitude.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumEdge0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumEdge0044';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const rounded: number = NumberUtils.roundHalfUp(2999.5, 0);
      expect(rounded).assertEqual(3000);
      expect(NumberUtils.formatThousands(rounded))
        .assertEqual('3' + SEPARATOR + '000');
      const lowered: number = NumberUtils.roundHalfUp(2999.4, 0);
      expect(lowered).assertEqual(2999);
      expect(NumberUtils.formatThousands(lowered)).assertEqual('2' + SEPARATOR + '999');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
