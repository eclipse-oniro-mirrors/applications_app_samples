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

import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { CounterLogic } from '../../../main/ets/model/ChipModels';

export default function counterLogicMatrixTest() {
  describe('counterLogicMatrixTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_0100
     * @tc.name clampLowerBoundaryExact0001
     * @tc.desc Verify clamp returns min unchanged when the value equals min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clampLowerBoundaryExact0001', 0, () => {
      expect(CounterLogic.clamp(0, 0, 10)).assertEqual(0);
      expect(CounterLogic.clamp(-20, -20, 0)).assertEqual(-20);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_0200
     * @tc.name clampUpperBoundaryExact0002
     * @tc.desc Verify clamp returns max unchanged when the value equals max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clampUpperBoundaryExact0002', 0, () => {
      expect(CounterLogic.clamp(10, 0, 10)).assertEqual(10);
      expect(CounterLogic.clamp(100, 0, 100)).assertEqual(100);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_0300
     * @tc.name clampInsideRange0003
     * @tc.desc Verify clamp keeps values strictly inside the range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clampInsideRange0003', 0, () => {
      expect(CounterLogic.clamp(5, 0, 10)).assertEqual(5);
      expect(CounterLogic.clamp(3, 1, 9)).assertEqual(3);
      expect(CounterLogic.clamp(50, 10, 90)).assertEqual(50);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_0400
     * @tc.name clampDegenerateRange0004
     * @tc.desc Verify clamp on a zero-width range returns that single value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clampDegenerateRange0004', 0, () => {
      expect(CounterLogic.clamp(5, 5, 5)).assertEqual(5);
      expect(CounterLogic.clamp(0, 5, 5)).assertEqual(5);
      expect(CounterLogic.clamp(9, 5, 5)).assertEqual(5);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_0500
     * @tc.name clampNegativeRange0005
     * @tc.desc Verify clamp works for a fully negative range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('clampNegativeRange0005', 0, () => {
      expect(CounterLogic.clamp(-15, -20, -10)).assertEqual(-15);
      expect(CounterLogic.clamp(-30, -20, -10)).assertEqual(-20);
      expect(CounterLogic.clamp(-1, -20, -10)).assertEqual(-10);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_0600
     * @tc.name initialInsideRange0006
     * @tc.desc Verify a constructor value inside the range is kept as-is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('initialInsideRange0006', 0, () => {
      const c: CounterLogic = new CounterLogic(5, 0, 10, 1);
      expect(c.getValue()).assertEqual(5);
      expect(c.atMin()).assertFalse();
      expect(c.atMax()).assertFalse();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_0700
     * @tc.name initialAtBounds0007
     * @tc.desc Verify constructor values at or beyond the bounds are clamped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('initialAtBounds0007', 0, () => {
      expect(new CounterLogic(0, 0, 10, 1).getValue()).assertEqual(0);
      expect(new CounterLogic(10, 0, 10, 1).getValue()).assertEqual(10);
      expect(new CounterLogic(11, 0, 10, 1).getValue()).assertEqual(10);
      expect(new CounterLogic(-1, 0, 10, 1).getValue()).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_0800
     * @tc.name stepZeroKeepsValue0008
     * @tc.desc Verify a zero step keeps the value unchanged on either direction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('stepZeroKeepsValue0008', 0, () => {
      const c: CounterLogic = new CounterLogic(5, 0, 10, 0);
      expect(c.increase()).assertEqual(5);
      expect(c.decrease()).assertEqual(5);
      expect(c.getValue()).assertEqual(5);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_0900
     * @tc.name stepFractional0009
     * @tc.desc Verify a fractional step is applied exactly on increase and decrease
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('stepFractional0009', 0, () => {
      const c: CounterLogic = new CounterLogic(5, 0, 10, 0.5);
      expect(c.increase()).assertEqual(5.5);
      expect(c.decrease()).assertEqual(5);
      expect(c.getValue()).assertEqual(5);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_1000
     * @tc.name increaseRepeatedToMax0010
     * @tc.desc Verify repeated increases stop exactly at max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('increaseRepeatedToMax0010', 0, () => {
      const c: CounterLogic = new CounterLogic(8, 0, 10, 1);
      expect(c.increase()).assertEqual(9);
      expect(c.increase()).assertEqual(10);
      expect(c.increase()).assertEqual(10);
      expect(c.atMax()).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_1100
     * @tc.name decreaseRepeatedToMin0011
     * @tc.desc Verify repeated decreases stop exactly at min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('decreaseRepeatedToMin0011', 0, () => {
      const c: CounterLogic = new CounterLogic(2, 0, 10, 1);
      expect(c.decrease()).assertEqual(1);
      expect(c.decrease()).assertEqual(0);
      expect(c.decrease()).assertEqual(0);
      expect(c.atMin()).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_1200
     * @tc.name increaseCrossMaxClamps0012
     * @tc.desc Verify a single increase that overshoots max is clamped to max
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('increaseCrossMaxClamps0012', 0, () => {
      const c: CounterLogic = new CounterLogic(9, 0, 10, 2);
      expect(c.increase()).assertEqual(10);
      expect(c.increase()).assertEqual(10);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_1300
     * @tc.name decreaseCrossMinClamps0013
     * @tc.desc Verify a single decrease that undershoots min is clamped to min
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('decreaseCrossMinClamps0013', 0, () => {
      const c: CounterLogic = new CounterLogic(1, 0, 10, 2);
      expect(c.decrease()).assertEqual(0);
      expect(c.decrease()).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_1400
     * @tc.name setValueInside0014
     * @tc.desc Verify setValue inside the range is applied and reflected by getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setValueInside0014', 0, () => {
      const c: CounterLogic = new CounterLogic(5, 0, 10, 1);
      expect(c.setValue(8)).assertEqual(8);
      expect(c.getValue()).assertEqual(8);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_1500
     * @tc.name setValueBoundaries0015
     * @tc.desc Verify setValue above max and below min is clamped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setValueBoundaries0015', 0, () => {
      const c: CounterLogic = new CounterLogic(5, 0, 10, 1);
      expect(c.setValue(99)).assertEqual(10);
      expect(c.setValue(-3)).assertEqual(0);
      expect(c.getValue()).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_1600
     * @tc.name setValueFractional0016
     * @tc.desc Verify setValue accepts a fractional value inside the range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('setValueFractional0016', 0, () => {
      const c: CounterLogic = new CounterLogic(5, 0, 10, 1);
      expect(c.setValue(2.5)).assertEqual(2.5);
      expect(c.getValue()).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_1700
     * @tc.name atMaxTransitions0017
     * @tc.desc Verify atMax becomes true at max and false after decreasing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('atMaxTransitions0017', 0, () => {
      const c: CounterLogic = new CounterLogic(9, 0, 10, 1);
      expect(c.atMax()).assertFalse();
      c.increase();
      expect(c.atMax()).assertTrue();
      c.decrease();
      expect(c.atMax()).assertFalse();
      c.setValue(10);
      expect(c.atMax()).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_1800
     * @tc.name atMinTransitions0018
     * @tc.desc Verify atMin becomes true at min and false after increasing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('atMinTransitions0018', 0, () => {
      const c: CounterLogic = new CounterLogic(1, 0, 10, 1);
      expect(c.atMin()).assertFalse();
      c.decrease();
      expect(c.atMin()).assertTrue();
      c.increase();
      expect(c.atMin()).assertFalse();
      c.setValue(0);
      expect(c.atMin()).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_1900
     * @tc.name negativeRangeStepping0019
     * @tc.desc Verify stepping and clamping behave correctly on a negative range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('negativeRangeStepping0019', 0, () => {
      const c: CounterLogic = new CounterLogic(-5, -10, -1, 1);
      expect(c.increase()).assertEqual(-4);
      expect(c.decrease()).assertEqual(-5);
      expect(c.decrease()).assertEqual(-6);
      expect(c.atMin()).assertFalse();
      expect(c.setValue(-100)).assertEqual(-10);
      expect(c.atMin()).assertTrue();
      expect(c.increase()).assertEqual(-9);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_2000
     * @tc.name largeRangeStepping0020
     * @tc.desc Verify stepping over a large numeric range clamps at the upper bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('largeRangeStepping0020', 0, () => {
      const c: CounterLogic = new CounterLogic(5000, 0, 10000, 2500);
      expect(c.increase()).assertEqual(7500);
      expect(c.increase()).assertEqual(10000);
      expect(c.atMax()).assertTrue();
      expect(c.increase()).assertEqual(10000);
      expect(c.decrease()).assertEqual(7500);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_2100
     * @tc.name returnsMatchGetValue0021
     * @tc.desc Verify increase/decrease/setValue return the value reported by getValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('returnsMatchGetValue0021', 0, () => {
      const c: CounterLogic = new CounterLogic(3, 0, 10, 2);
      expect(c.increase() === c.getValue()).assertTrue();
      expect(c.decrease() === c.getValue()).assertTrue();
      expect(c.setValue(9) === c.getValue()).assertTrue();
      expect(c.getValue()).assertEqual(9);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_2200
     * @tc.name independentInstances0022
     * @tc.desc Verify two counters with identical configuration keep independent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('independentInstances0022', 0, () => {
      const a: CounterLogic = new CounterLogic(5, 0, 10, 1);
      const b: CounterLogic = new CounterLogic(5, 0, 10, 1);
      expect(a.increase()).assertEqual(6);
      expect(b.getValue()).assertEqual(5);
      expect(b.decrease()).assertEqual(4);
      expect(a.getValue()).assertEqual(6);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_COUNTERLOGICMATRIX_2300
     * @tc.name infinityBounds0023
     * @tc.desc Verify infinite inputs clamp to the finite bounds for clamp, constructor and setValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('infinityBounds0023', 0, () => {
      expect(CounterLogic.clamp(Number.POSITIVE_INFINITY, 0, 10)).assertEqual(10);
      expect(CounterLogic.clamp(Number.NEGATIVE_INFINITY, 0, 10)).assertEqual(0);
      const upper: CounterLogic = new CounterLogic(Number.POSITIVE_INFINITY, 0, 10, 1);
      expect(upper.getValue()).assertEqual(10);
      expect(upper.setValue(Number.NEGATIVE_INFINITY)).assertEqual(0);
      expect(upper.atMin()).assertTrue();
      expect(upper.increase()).assertEqual(1);
    });
  });
}
