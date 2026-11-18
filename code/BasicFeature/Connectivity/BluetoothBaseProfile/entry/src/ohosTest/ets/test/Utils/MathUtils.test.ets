/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { MathUtils } from 'library';

/**
 * Test suite for MathUtils.
 * @since 26.0.0
 */
export default function mathUtilsTest(): void {
  describe('MathUtilsTest', () => {
    // ==================== numeric clamp (2 cases) ====================

    /*
     * @tc.number: SUB_MATH_UTILS_0100
     * @tc.name: testMathUtils0001
     * @tc.desc: Clamp values below, inside and above the accepted range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMathUtils0001', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0001', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0001',
        '#1 assert ' + "expect(MathUtils.clamp(5, 1, 10)).assertEqual(5)");
      expect(MathUtils.clamp(5, 1, 10)).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0001',
        '#2 assert ' + "expect(MathUtils.clamp(0, 1, 10)).assertEqual(1)");
      expect(MathUtils.clamp(0, 1, 10)).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0001',
        '#3 assert ' + "expect(MathUtils.clamp(11, 1, 10)).assertEqual(10)");
      expect(MathUtils.clamp(11, 1, 10)).assertEqual(10);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0001',
        '#4 assert ' + "expect(MathUtils.clamp(-3, -2, -1)).assertEqual(-2)");
      expect(MathUtils.clamp(-3, -2, -1)).assertEqual(-2);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0001', 'end');
    });

    /*
     * @tc.number: SUB_MATH_UTILS_0200
     * @tc.name: testMathUtils0002
     * @tc.desc: Clamp every input to the single value of a collapsed range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMathUtils0002', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0002', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0002',
        '#1 assert ' + "expect(MathUtils.clamp(7, 4, 4)).assertEqual(4)");
      expect(MathUtils.clamp(7, 4, 4)).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0002',
        '#2 assert ' + "expect(MathUtils.clamp(3, 4, 4)).assertEqual(4)");
      expect(MathUtils.clamp(3, 4, 4)).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0002',
        '#3 assert ' + "expect(MathUtils.clamp(4, 4, 4)).assertEqual(4)");
      expect(MathUtils.clamp(4, 4, 4)).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0002',
        '#4 assert ' + "expect(MathUtils.clamp(0, 0, 0)).assertEqual(0)");
      expect(MathUtils.clamp(0, 0, 0)).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0002', 'end');
    });

    // ==================== linear interpolation (2 cases) ====================

    /*
     * @tc.number: SUB_MATH_UTILS_0300
     * @tc.name: testMathUtils0003
     * @tc.desc: Interpolate between two bounds at the ends and at the middle.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMathUtils0003', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0003', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0003',
        '#1 assert ' + "expect(MathUtils.lerp(0, 10, 0)).assertEqual(0)");
      expect(MathUtils.lerp(0, 10, 0)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0003',
        '#2 assert ' + "expect(MathUtils.lerp(0, 10, 1)).assertEqual(10)");
      expect(MathUtils.lerp(0, 10, 1)).assertEqual(10);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0003',
        '#3 assert ' + "expect(MathUtils.lerp(0, 10, 0.5)).assertEqual(5)");
      expect(MathUtils.lerp(0, 10, 0.5)).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0003',
        '#4 assert ' + "expect(MathUtils.lerp(10, 20, 0.25)).assertEqual(12.5)");
      expect(MathUtils.lerp(10, 20, 0.25)).assertEqual(12.5);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0003', 'end');
    });

    /*
     * @tc.number: SUB_MATH_UTILS_0400
     * @tc.name: testMathUtils0004
     * @tc.desc: Keep interpolation inside the bounds for out of range factors.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMathUtils0004', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0004', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0004',
        '#1 assert ' + "expect(MathUtils.lerp(10, 20, -1)).assertEqual(10)");
      expect(MathUtils.lerp(10, 20, -1)).assertEqual(10);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0004',
        '#2 assert ' + "expect(MathUtils.lerp(10, 20, 2)).assertEqual(20)");
      expect(MathUtils.lerp(10, 20, 2)).assertEqual(20);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0004',
        '#3 assert ' + "expect(MathUtils.lerp(10, 20, -0.5)).assertEqual(10)");
      expect(MathUtils.lerp(10, 20, -0.5)).assertEqual(10);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0004',
        '#4 assert ' + "expect(MathUtils.lerp(10, 20, 1.5)).assertEqual(20)");
      expect(MathUtils.lerp(10, 20, 1.5)).assertEqual(20);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0004', 'end');
    });

    // ==================== average (2 cases) ====================

    /*
     * @tc.number: SUB_MATH_UTILS_0500
     * @tc.name: testMathUtils0005
     * @tc.desc: Average positive, fractional and signed data sets.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMathUtils0005', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0005', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0005',
        '#1 assert ' + "expect(MathUtils.average([2, 4, 6])).assertEqual(4)");
      expect(MathUtils.average([2, 4, 6])).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0005',
        '#2 assert ' + "expect(MathUtils.average([1, 2, 3, 4])).assertEqual(2.5)");
      expect(MathUtils.average([1, 2, 3, 4])).assertEqual(2.5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0005',
        '#3 assert ' + "expect(MathUtils.average([-5, 5])).assertEqual(0)");
      expect(MathUtils.average([-5, 5])).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0005',
        '#4 assert ' + "expect(MathUtils.average([9])).assertEqual(9)");
      expect(MathUtils.average([9])).assertEqual(9);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0005', 'end');
    });

    /*
     * @tc.number: SUB_MATH_UTILS_0600
     * @tc.name: testMathUtils0006
     * @tc.desc: Return zero as the average of an empty data set.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMathUtils0006', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0006', 'begin');
      const empty: number[] = [];
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0006',
        '#1 assert ' + "expect(MathUtils.average(empty)).assertEqual(0)");
      expect(MathUtils.average(empty)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0006',
        '#2 assert ' + "expect(MathUtils.average([0, 0])).assertEqual(0)");
      expect(MathUtils.average([0, 0])).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0006',
        '#3 assert ' + "expect(MathUtils.average([0.5, 0.5])).assertEqual(0.5)");
      expect(MathUtils.average([0.5, 0.5])).assertEqual(0.5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0006',
        '#4 assert ' + "expect(MathUtils.average(empty)).assertEqual(MathUtils.average([]))");
      expect(MathUtils.average(empty)).assertEqual(MathUtils.average([]));
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0006', 'end');
    });

    // ==================== median (3 cases) ====================

    /*
     * @tc.number: SUB_MATH_UTILS_0700
     * @tc.name: testMathUtils0007
     * @tc.desc: Pick the middle element of odd length data sets.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMathUtils0007', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0007', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0007',
        '#1 assert ' + "expect(MathUtils.median([3, 1, 2])).assertEqual(2)");
      expect(MathUtils.median([3, 1, 2])).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0007',
        '#2 assert ' + "expect(MathUtils.median([5, 1, 9, 3, 7])).assertEqual(5)");
      expect(MathUtils.median([5, 1, 9, 3, 7])).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0007',
        '#3 assert ' + "expect(MathUtils.median([1, 2, 3, 4, 5])).assertEqual(3)");
      expect(MathUtils.median([1, 2, 3, 4, 5])).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0007',
        '#4 assert ' + "expect(MathUtils.median([-1, -2, -3])).assertEqual(-2)");
      expect(MathUtils.median([-1, -2, -3])).assertEqual(-2);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0007', 'end');
    });

    /*
     * @tc.number: SUB_MATH_UTILS_0800
     * @tc.name: testMathUtils0008
     * @tc.desc: Mean the two central elements of even length data sets.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMathUtils0008', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0008', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0008',
        '#1 assert ' + "expect(MathUtils.median([1, 2, 3, 4])).assertEqual(2.5)");
      expect(MathUtils.median([1, 2, 3, 4])).assertEqual(2.5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0008',
        '#2 assert ' + "expect(MathUtils.median([4, 1, 3, 2])).assertEqual(2.5)");
      expect(MathUtils.median([4, 1, 3, 2])).assertEqual(2.5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0008',
        '#3 assert ' + "expect(MathUtils.median([10, 20])).assertEqual(15)");
      expect(MathUtils.median([10, 20])).assertEqual(15);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0008',
        '#4 assert ' + "expect(MathUtils.median([7, 7, 7, 7])).assertEqual(7)");
      expect(MathUtils.median([7, 7, 7, 7])).assertEqual(7);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0008', 'end');
    });

    /*
     * @tc.number: SUB_MATH_UTILS_0900
     * @tc.name: testMathUtils0009
     * @tc.desc: Return zero for an empty set and keep the input order intact.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMathUtils0009', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0009', 'begin');
      const source: number[] = [9, 1, 5];
      const empty: number[] = [];
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0009',
        '#1 assert ' + "expect(MathUtils.median(empty)).assertEqual(0)");
      expect(MathUtils.median(empty)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0009',
        '#2 assert ' + "expect(MathUtils.median(source)).assertEqual(5)");
      expect(MathUtils.median(source)).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0009',
        '#3 ' + "source[0]" + ' = ' + JSON.stringify(source[0]));
      expect(source[0]).assertEqual(9);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0009',
        '#4 ' + "source[1]" + ' = ' + JSON.stringify(source[1]));
      expect(source[1]).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0009', 'end');
    });

    // ==================== standard deviation (2 cases) ====================

    /*
     * @tc.number: SUB_MATH_UTILS_1000
     * @tc.name: testMathUtils0010
     * @tc.desc: Report zero deviation when every sample equals the mean.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMathUtils0010', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0010', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0010',
        '#1 assert ' + "expect(MathUtils.standardDeviation([5, 5, 5])).assertEqual(0)");
      expect(MathUtils.standardDeviation([5, 5, 5])).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0010',
        '#2 assert ' + "expect(MathUtils.standardDeviation([])).assertEqual(0)");
      expect(MathUtils.standardDeviation([])).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0010',
        '#3 assert ' + "expect(MathUtils.standardDeviation([4])).assertEqual(0)");
      expect(MathUtils.standardDeviation([4])).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0010',
        '#4 assert ' + "expect(MathUtils.standardDeviation([-3, -3, -3])).assertEqual(0)");
      expect(MathUtils.standardDeviation([-3, -3, -3])).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0010', 'end');
    });

    /*
     * @tc.number: SUB_MATH_UTILS_1100
     * @tc.name: testMathUtils0011
     * @tc.desc: Compute the population deviation of known sample sets.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMathUtils0011', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0011', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0011',
        '#1 assert ' + "expect(MathUtils.standardDeviation([2, 4, 4, 4, 5, 5, 7, 9])).assertEqual(2)");
      expect(MathUtils.standardDeviation([2, 4, 4, 4, 5, 5, 7, 9])).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0011',
        '#2 assert ' + "expect(MathUtils.standardDeviation([1, 2, 3, 4, 5])).assertEqual(Math.sqrt(2))");
      expect(MathUtils.standardDeviation([1, 2, 3, 4, 5])).assertEqual(Math.sqrt(2));
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0011',
        '#3 assert ' + "expect(MathUtils.standardDeviation([2, 4])).assertEqual(1)");
      expect(MathUtils.standardDeviation([2, 4])).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0011',
        '#4 assert ' + "expect(MathUtils.standardDeviation([0, 10])).assertEqual(5)");
      expect(MathUtils.standardDeviation([0, 10])).assertEqual(5);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0011', 'end');
    });

    // ==================== percentage (2 cases) ====================

    /*
     * @tc.number: SUB_MATH_UTILS_1200
     * @tc.name: testMathUtils0012
     * @tc.desc: Round ratios to integer percentages within zero and one hundred.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMathUtils0012', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0012', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0012',
        '#1 assert ' + "expect(MathUtils.percentage(3, 4)).assertEqual(75)");
      expect(MathUtils.percentage(3, 4)).assertEqual(75);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0012',
        '#2 assert ' + "expect(MathUtils.percentage(1, 3)).assertEqual(33)");
      expect(MathUtils.percentage(1, 3)).assertEqual(33);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0012',
        '#3 assert ' + "expect(MathUtils.percentage(1, 2)).assertEqual(50)");
      expect(MathUtils.percentage(1, 2)).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0012',
        '#4 assert ' + "expect(MathUtils.percentage(2, 3)).assertEqual(67)");
      expect(MathUtils.percentage(2, 3)).assertEqual(67);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0012', 'end');
    });

    /*
     * @tc.number: SUB_MATH_UTILS_1300
     * @tc.name: testMathUtils0013
     * @tc.desc: Clamp negative and overflowing ratios away from the percent range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMathUtils0013', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0013', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0013',
        '#1 assert ' + "expect(MathUtils.percentage(5, 0)).assertEqual(0)");
      expect(MathUtils.percentage(5, 0)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0013',
        '#2 assert ' + "expect(MathUtils.percentage(0, 0)).assertEqual(0)");
      expect(MathUtils.percentage(0, 0)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0013',
        '#3 assert ' + "expect(MathUtils.percentage(-5, 10)).assertEqual(0)");
      expect(MathUtils.percentage(-5, 10)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0013',
        '#4 assert ' + "expect(MathUtils.percentage(20, 10)).assertEqual(100)");
      expect(MathUtils.percentage(20, 10)).assertEqual(100);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0013', 'end');
    });

    // ==================== RSSI distance distance and quality amount (4 cases) ====================

    /*
     * @tc.number: SUB_MATH_UTILS_1400
     * @tc.name: testMathUtils0014
     * @tc.desc: Estimate one metre at the reference power and reject unknown signal.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMathUtils0014', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0014', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0014',
        '#1 assert ' + "expect(MathUtils.rssiToDistance(-59)).assertEqual(1)");
      expect(MathUtils.rssiToDistance(-59)).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0014',
        '#2 assert ' + "expect(MathUtils.rssiToDistance(0)).assertEqual(-1)");
      expect(MathUtils.rssiToDistance(0)).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0014',
        '#3 assert ' + "expect(MathUtils.rssiToDistance(-39)).assertEqual(10)");
      expect(MathUtils.rssiToDistance(-39)).assertEqual(10);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0014',
        '#4 assert ' + "expect(MathUtils.rssiToDistance(0) < 0).assertTrue()");
      expect(MathUtils.rssiToDistance(0) < 0).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0014', 'end');
    });

    /*
     * @tc.number: SUB_MATH_UTILS_1500
     * @tc.name: testMathUtils0015
     * @tc.desc: Apply the custom transmit power and path loss exponent.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMathUtils0015', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0015', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0015',
        '#1 assert ' + "expect(MathUtils.rssiToDistance(-59, -59, 2.0)).assertEqual(1)");
      expect(MathUtils.rssiToDistance(-59, -59, 2.0)).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0015',
        '#2 assert ' + "expect(MathUtils.rssiToDistance(-79, -59, 1.0)).assertEqual(0.01)");
      expect(MathUtils.rssiToDistance(-79, -59, 1.0)).assertEqual(0.01);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0015',
        '#3 assert ' + "expect(MathUtils.rssiToDistance(-69, -59, 1.0)).assertEqual(0.1)");
      expect(MathUtils.rssiToDistance(-69, -59, 1.0)).assertEqual(0.1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0015',
        '#4 assert ' + "expect(MathUtils.rssiToDistance(-59, -59, 2.0) > 0).assertTrue()");
      expect(MathUtils.rssiToDistance(-59, -59, 2.0) > 0).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0015', 'end');
    });

    /*
     * @tc.number: SUB_MATH_UTILS_1600
     * @tc.name: testMathUtils0016
     * @tc.desc: Saturate signal quality at both ends of the RSSI scale.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMathUtils0016', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0016', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0016',
        '#1 assert ' + "expect(MathUtils.rssiToQuality(-100)).assertEqual(0)");
      expect(MathUtils.rssiToQuality(-100)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0016',
        '#2 assert ' + "expect(MathUtils.rssiToQuality(-50)).assertEqual(100)");
      expect(MathUtils.rssiToQuality(-50)).assertEqual(100);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0016',
        '#3 assert ' + "expect(MathUtils.rssiToQuality(-120)).assertEqual(0)");
      expect(MathUtils.rssiToQuality(-120)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0016',
        '#4 assert ' + "expect(MathUtils.rssiToQuality(0)).assertEqual(100)");
      expect(MathUtils.rssiToQuality(0)).assertEqual(100);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0016', 'end');
    });

    /*
     * @tc.number: SUB_MATH_UTILS_1700
     * @tc.name: testMathUtils0017
     * @tc.desc: Scale quality linearly between the saturation thresholds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMathUtils0017', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0017', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0017',
        '#1 assert ' + "expect(MathUtils.rssiToQuality(-75)).assertEqual(50)");
      expect(MathUtils.rssiToQuality(-75)).assertEqual(50);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0017',
        '#2 assert ' + "expect(MathUtils.rssiToQuality(-90)).assertEqual(20)");
      expect(MathUtils.rssiToQuality(-90)).assertEqual(20);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0017',
        '#3 assert ' + "expect(MathUtils.rssiToQuality(-60)).assertEqual(80)");
      expect(MathUtils.rssiToQuality(-60)).assertEqual(80);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0017',
        '#4 assert ' + "expect(MathUtils.rssiToQuality(-75) < MathUtils.rssiToQuality(-60)).assertTrue()");
      expect(MathUtils.rssiToQuality(-75) < MathUtils.rssiToQuality(-60)).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0017', 'end');
    });

    // ==================== Euclidean distance (1 cases) ====================

    /*
     * @tc.number: SUB_MATH_UTILS_1800
     * @tc.name: testMathUtils0018
     * @tc.desc: Measure point distance for the 3-4-5 triangle and negative legs.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMathUtils0018', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0018', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0018',
        '#1 assert ' + "expect(MathUtils.distance(0, 0, 3, 4)).assertEqual(5)");
      expect(MathUtils.distance(0, 0, 3, 4)).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0018',
        '#2 assert ' + "expect(MathUtils.distance(1, 1, 1, 1)).assertEqual(0)");
      expect(MathUtils.distance(1, 1, 1, 1)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0018',
        '#3 assert ' + "expect(MathUtils.distance(0, 0, -3, -4)).assertEqual(5)");
      expect(MathUtils.distance(0, 0, -3, -4)).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0018',
        '#4 assert ' + "expect(MathUtils.distance(0, 5, 0, 0)).assertEqual(5)");
      expect(MathUtils.distance(0, 5, 0, 0)).assertEqual(5);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0018', 'end');
    });

    // ==================== random number (2 cases) ====================

    /*
     * @tc.number: SUB_MATH_UTILS_1900
     * @tc.name: testMathUtils0019
     * @tc.desc: Draw integers only inside the inclusive bounds.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMathUtils0019', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0019', 'begin');
      let below: number = 0;
      let above: number = 0;
      let integerHits: number = 0;
      for (let i: number = 0; i < 200; i++) {
        const value: number = MathUtils.randomInt(1, 6);
        if (value < 1) {
          below = below + 1;
        }
        if (value > 6) {
          above = above + 1;
        }
        if (Number.isInteger(value)) {
          integerHits = integerHits + 1;
        }
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0019',
        '#1 ' + "below" + ' = ' + JSON.stringify(below));
      expect(below).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0019',
        '#2 ' + "above" + ' = ' + JSON.stringify(above));
      expect(above).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0019',
        '#3 ' + "integerHits" + ' = ' + JSON.stringify(integerHits));
      expect(integerHits).assertEqual(200);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0019',
        '#4 assert ' + "expect(MathUtils.randomInt(5, 5)).assertEqual(5)");
      expect(MathUtils.randomInt(5, 5)).assertEqual(5);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0019', 'end');
    });

    /*
     * @tc.number: SUB_MATH_UTILS_2000
     * @tc.name: testMathUtils0020
     * @tc.desc: Spread random draws and freeze the value of a zero width range.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMathUtils0020', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0020', 'begin');
      let minimum: number = Number.MAX_VALUE;
      let maximum: number = -Number.MAX_VALUE;
      let rangeHits: number = 0;
      for (let i: number = 0; i < 200; i++) {
        const value: number = MathUtils.randomFloat(2, 4);
        if (value >= 2 && value < 4) {
          rangeHits = rangeHits + 1;
        }
        minimum = Math.min(minimum, value);
        maximum = Math.max(maximum, value);
      }
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0020',
        '#1 ' + "rangeHits" + ' = ' + JSON.stringify(rangeHits));
      expect(rangeHits).assertEqual(200);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0020',
        '#2 ' + "maximum - minimum > 0.5" + ' = ' + JSON.stringify(maximum - minimum > 0.5));
      expect(maximum - minimum > 0.5).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0020',
        '#3 assert ' + "expect(MathUtils.randomFloat(3, 3)).assertEqual(3)");
      expect(MathUtils.randomFloat(3, 3)).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0020',
        '#4 assert ' + "expect(MathUtils.randomFloat(-1, 1) >= -1).assertTrue()");
      expect(MathUtils.randomFloat(-1, 1) >= -1).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0020', 'end');
    });

    // ==================== four house five in (1 cases) ====================

    /*
     * @tc.number: SUB_MATH_UTILS_2100
     * @tc.name: testMathUtils0021
     * @tc.desc: Round a value to the requested number of digits.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMathUtils0021', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0021', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0021',
        '#1 assert ' + "expect(MathUtils.roundTo(2.5, 0)).assertEqual(3)");
      expect(MathUtils.roundTo(2.5, 0)).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0021',
        '#2 assert ' + "expect(MathUtils.roundTo(1.5, 0)).assertEqual(2)");
      expect(MathUtils.roundTo(1.5, 0)).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0021',
        '#3 assert ' + "expect(MathUtils.roundTo(0.125, 2)).assertEqual(0.13)");
      expect(MathUtils.roundTo(0.125, 2)).assertEqual(0.13);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0021',
        '#4 assert ' + "expect(MathUtils.roundTo(1234.5678, 2)).assertEqual(1234.57)");
      expect(MathUtils.roundTo(1234.5678, 2)).assertEqual(1234.57);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0021', 'end');
    });

    // ==================== range range determine (1 cases) ====================

    /*
     * @tc.number: SUB_MATH_UTILS_2200
     * @tc.name: testMathUtils0022
     * @tc.desc: Accept both bounds and reject values outside the interval.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMathUtils0022', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0022', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0022',
        '#1 assert ' + "expect(MathUtils.inRange(5, 1, 10)).assertTrue()");
      expect(MathUtils.inRange(5, 1, 10)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0022',
        '#2 assert ' + "expect(MathUtils.inRange(1, 1, 10)).assertTrue()");
      expect(MathUtils.inRange(1, 1, 10)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0022',
        '#3 assert ' + "expect(MathUtils.inRange(10, 1, 10)).assertTrue()");
      expect(MathUtils.inRange(10, 1, 10)).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0022',
        '#4 assert ' + "expect(MathUtils.inRange(0.5, 1, 10)).assertFalse()");
      expect(MathUtils.inRange(0.5, 1, 10)).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0022',
        '#5 assert ' + "expect(MathUtils.inRange(10.5, 1, 10)).assertFalse()");
      expect(MathUtils.inRange(10.5, 1, 10)).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0022', 'end');
    });

    // ==================== greatest common divisor (2 cases) ====================

    /*
     * @tc.number: SUB_MATH_UTILS_2300
     * @tc.name: testMathUtils0023
     * @tc.desc: Divide the greatest common divisor of ordinary number pairs.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMathUtils0023', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0023', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0023',
        '#1 assert ' + "expect(MathUtils.gcd(12, 8)).assertEqual(4)");
      expect(MathUtils.gcd(12, 8)).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0023',
        '#2 assert ' + "expect(MathUtils.gcd(17, 5)).assertEqual(1)");
      expect(MathUtils.gcd(17, 5)).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0023',
        '#3 assert ' + "expect(MathUtils.gcd(1024, 768)).assertEqual(256)");
      expect(MathUtils.gcd(1024, 768)).assertEqual(256);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0023',
        '#4 assert ' + "expect(MathUtils.gcd(36, 36)).assertEqual(36)");
      expect(MathUtils.gcd(36, 36)).assertEqual(36);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0023', 'end');
    });

    /*
     * @tc.number: SUB_MATH_UTILS_2400
     * @tc.name: testMathUtils0024
     * @tc.desc: Ignore sign and zero when searching for the common divisor.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMathUtils0024', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0024', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0024',
        '#1 assert ' + "expect(MathUtils.gcd(-12, 8)).assertEqual(4)");
      expect(MathUtils.gcd(-12, 8)).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0024',
        '#2 assert ' + "expect(MathUtils.gcd(12, -8)).assertEqual(4)");
      expect(MathUtils.gcd(12, -8)).assertEqual(4);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0024',
        '#3 assert ' + "expect(MathUtils.gcd(0, 5)).assertEqual(5)");
      expect(MathUtils.gcd(0, 5)).assertEqual(5);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0024',
        '#4 assert ' + "expect(MathUtils.gcd(1, 100)).assertEqual(1)");
      expect(MathUtils.gcd(1, 100)).assertEqual(1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0024', 'end');
    });

    // ==================== least common multiple (2 cases) ====================

    /*
     * @tc.number: SUB_MATH_UTILS_2500
     * @tc.name: testMathUtils0025
     * @tc.desc: Multiply the least common multiple of coprime and shared pairs.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testMathUtils0025', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0025', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0025',
        '#1 assert ' + "expect(MathUtils.lcm(4, 6)).assertEqual(12)");
      expect(MathUtils.lcm(4, 6)).assertEqual(12);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0025',
        '#2 assert ' + "expect(MathUtils.lcm(3, 5)).assertEqual(15)");
      expect(MathUtils.lcm(3, 5)).assertEqual(15);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0025',
        '#3 assert ' + "expect(MathUtils.lcm(12, 18)).assertEqual(36)");
      expect(MathUtils.lcm(12, 18)).assertEqual(36);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0025',
        '#4 assert ' + "expect(MathUtils.lcm(2, 4)).assertEqual(4)");
      expect(MathUtils.lcm(2, 4)).assertEqual(4);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0025', 'end');
    });

    /*
     * @tc.number: SUB_MATH_UTILS_2600
     * @tc.name: testMathUtils0026
     * @tc.desc: Collapse the multiple to zero or to the operand itself.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testMathUtils0026', 0, () => {
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0026', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0026',
        '#1 assert ' + "expect(MathUtils.lcm(0, 7)).assertEqual(0)");
      expect(MathUtils.lcm(0, 7)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0026',
        '#2 assert ' + "expect(MathUtils.lcm(7, 0)).assertEqual(0)");
      expect(MathUtils.lcm(7, 0)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0026',
        '#3 assert ' + "expect(MathUtils.lcm(6, 6)).assertEqual(6)");
      expect(MathUtils.lcm(6, 6)).assertEqual(6);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testMathUtils0026',
        '#4 assert ' + "expect(MathUtils.lcm(-4, 6)).assertEqual(12)");
      expect(MathUtils.lcm(-4, 6)).assertEqual(12);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testMathUtils0026', 'end');
    });
  });
}
