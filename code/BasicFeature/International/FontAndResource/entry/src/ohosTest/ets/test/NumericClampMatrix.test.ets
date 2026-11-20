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

// Import hilog directly for device side test logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
// Import the NumberUtils helpers under test from the library HAR package.
import { NumberUtils } from 'library';

// The suite-level hilog tag, distinct from the per-case TAG values.
const SUITE_TAG: string = '[Sample_FontAndResource]';
// The hilog domain used by this suite.
const DOMAIN: number = 0xF811;
// The prefix attached to every case log message.
const BUNDLE: string = 'FontAndResource_';

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Registers every matrix case of the NumericClampMatrixSuite suite.
export default function numericClampMatrixTest() {
  // Group the cases under the "NumericClampMatrixSuite" describe block.
  describe('NumericClampMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'NumericClampMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_CLAMP_0100
     * @tc.name      testClampInside0001
     * @tc.desc      Verify clamp keeps every value that already sits inside the inclusive range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testClampInside0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testClampInside0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: clamp(-10, -10, 10) keeps the in-range value.
      logCase(TAG, "clamp(-10, -10, 10)");
      expect(NumberUtils.clamp(-10, -10, 10)).assertEqual(-10);
      // Vector 2: clamp(-8, -10, 10) keeps the in-range value.
      logCase(TAG, "clamp(-8, -10, 10)");
      expect(NumberUtils.clamp(-8, -10, 10)).assertEqual(-8);
      // Vector 3: clamp(-6, -10, 10) keeps the in-range value.
      logCase(TAG, "clamp(-6, -10, 10)");
      expect(NumberUtils.clamp(-6, -10, 10)).assertEqual(-6);
      // Vector 4: clamp(-4, -10, 10) keeps the in-range value.
      logCase(TAG, "clamp(-4, -10, 10)");
      expect(NumberUtils.clamp(-4, -10, 10)).assertEqual(-4);
      // Vector 5: clamp(-2, -10, 10) keeps the in-range value.
      logCase(TAG, "clamp(-2, -10, 10)");
      expect(NumberUtils.clamp(-2, -10, 10)).assertEqual(-2);
      // Vector 6: clamp(0, -10, 10) keeps the in-range value.
      logCase(TAG, "clamp(0, -10, 10)");
      expect(NumberUtils.clamp(0, -10, 10)).assertEqual(0);
      // Vector 7: clamp(2, -10, 10) keeps the in-range value.
      logCase(TAG, "clamp(2, -10, 10)");
      expect(NumberUtils.clamp(2, -10, 10)).assertEqual(2);
      // Vector 8: clamp(4, -10, 10) keeps the in-range value.
      logCase(TAG, "clamp(4, -10, 10)");
      expect(NumberUtils.clamp(4, -10, 10)).assertEqual(4);
      // Vector 9: clamp(6, -10, 10) keeps the in-range value.
      logCase(TAG, "clamp(6, -10, 10)");
      expect(NumberUtils.clamp(6, -10, 10)).assertEqual(6);
      // Vector 10: clamp(8, -10, 10) keeps the in-range value.
      logCase(TAG, "clamp(8, -10, 10)");
      expect(NumberUtils.clamp(8, -10, 10)).assertEqual(8);
      // Vector 11: clamp(10, -10, 10) keeps the in-range value.
      logCase(TAG, "clamp(10, -10, 10)");
      expect(NumberUtils.clamp(10, -10, 10)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_CLAMP_0200
     * @tc.name      testClampBelow0001
     * @tc.desc      Verify clamp pins every value below the range to the lower bound.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampBelow0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampBelow0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: clamp(-60, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-60, -10, 10)");
      expect(NumberUtils.clamp(-60, -10, 10)).assertEqual(-10);
      // Vector 2: clamp(-58, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-58, -10, 10)");
      expect(NumberUtils.clamp(-58, -10, 10)).assertEqual(-10);
      // Vector 3: clamp(-56, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-56, -10, 10)");
      expect(NumberUtils.clamp(-56, -10, 10)).assertEqual(-10);
      // Vector 4: clamp(-54, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-54, -10, 10)");
      expect(NumberUtils.clamp(-54, -10, 10)).assertEqual(-10);
      // Vector 5: clamp(-52, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-52, -10, 10)");
      expect(NumberUtils.clamp(-52, -10, 10)).assertEqual(-10);
      // Vector 6: clamp(-50, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-50, -10, 10)");
      expect(NumberUtils.clamp(-50, -10, 10)).assertEqual(-10);
      // Vector 7: clamp(-48, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-48, -10, 10)");
      expect(NumberUtils.clamp(-48, -10, 10)).assertEqual(-10);
      // Vector 8: clamp(-46, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-46, -10, 10)");
      expect(NumberUtils.clamp(-46, -10, 10)).assertEqual(-10);
      // Vector 9: clamp(-44, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-44, -10, 10)");
      expect(NumberUtils.clamp(-44, -10, 10)).assertEqual(-10);
      // Vector 10: clamp(-42, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-42, -10, 10)");
      expect(NumberUtils.clamp(-42, -10, 10)).assertEqual(-10);
      // Vector 11: clamp(-40, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-40, -10, 10)");
      expect(NumberUtils.clamp(-40, -10, 10)).assertEqual(-10);
      // Vector 12: clamp(-38, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-38, -10, 10)");
      expect(NumberUtils.clamp(-38, -10, 10)).assertEqual(-10);
      // Vector 13: clamp(-36, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-36, -10, 10)");
      expect(NumberUtils.clamp(-36, -10, 10)).assertEqual(-10);
      // Vector 14: clamp(-34, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-34, -10, 10)");
      expect(NumberUtils.clamp(-34, -10, 10)).assertEqual(-10);
      // Vector 15: clamp(-32, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-32, -10, 10)");
      expect(NumberUtils.clamp(-32, -10, 10)).assertEqual(-10);
      // Vector 16: clamp(-30, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-30, -10, 10)");
      expect(NumberUtils.clamp(-30, -10, 10)).assertEqual(-10);
      // Vector 17: clamp(-28, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-28, -10, 10)");
      expect(NumberUtils.clamp(-28, -10, 10)).assertEqual(-10);
      // Vector 18: clamp(-26, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-26, -10, 10)");
      expect(NumberUtils.clamp(-26, -10, 10)).assertEqual(-10);
      // Vector 19: clamp(-24, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-24, -10, 10)");
      expect(NumberUtils.clamp(-24, -10, 10)).assertEqual(-10);
      // Vector 20: clamp(-22, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-22, -10, 10)");
      expect(NumberUtils.clamp(-22, -10, 10)).assertEqual(-10);
      // Vector 21: clamp(-20, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-20, -10, 10)");
      expect(NumberUtils.clamp(-20, -10, 10)).assertEqual(-10);
      // Vector 22: clamp(-18, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-18, -10, 10)");
      expect(NumberUtils.clamp(-18, -10, 10)).assertEqual(-10);
      // Vector 23: clamp(-16, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-16, -10, 10)");
      expect(NumberUtils.clamp(-16, -10, 10)).assertEqual(-10);
      // Vector 24: clamp(-14, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-14, -10, 10)");
      expect(NumberUtils.clamp(-14, -10, 10)).assertEqual(-10);
      // Vector 25: clamp(-12, -10, 10) pins the value to the lower bound.
      logCase(TAG, "clamp(-12, -10, 10)");
      expect(NumberUtils.clamp(-12, -10, 10)).assertEqual(-10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_CLAMP_0300
     * @tc.name      testClampAbove0001
     * @tc.desc      Verify clamp pins every value above the range to the upper bound.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampAbove0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampAbove0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: clamp(12, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(12, -10, 10)");
      expect(NumberUtils.clamp(12, -10, 10)).assertEqual(10);
      // Vector 2: clamp(14, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(14, -10, 10)");
      expect(NumberUtils.clamp(14, -10, 10)).assertEqual(10);
      // Vector 3: clamp(16, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(16, -10, 10)");
      expect(NumberUtils.clamp(16, -10, 10)).assertEqual(10);
      // Vector 4: clamp(18, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(18, -10, 10)");
      expect(NumberUtils.clamp(18, -10, 10)).assertEqual(10);
      // Vector 5: clamp(20, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(20, -10, 10)");
      expect(NumberUtils.clamp(20, -10, 10)).assertEqual(10);
      // Vector 6: clamp(22, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(22, -10, 10)");
      expect(NumberUtils.clamp(22, -10, 10)).assertEqual(10);
      // Vector 7: clamp(24, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(24, -10, 10)");
      expect(NumberUtils.clamp(24, -10, 10)).assertEqual(10);
      // Vector 8: clamp(26, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(26, -10, 10)");
      expect(NumberUtils.clamp(26, -10, 10)).assertEqual(10);
      // Vector 9: clamp(28, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(28, -10, 10)");
      expect(NumberUtils.clamp(28, -10, 10)).assertEqual(10);
      // Vector 10: clamp(30, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(30, -10, 10)");
      expect(NumberUtils.clamp(30, -10, 10)).assertEqual(10);
      // Vector 11: clamp(32, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(32, -10, 10)");
      expect(NumberUtils.clamp(32, -10, 10)).assertEqual(10);
      // Vector 12: clamp(34, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(34, -10, 10)");
      expect(NumberUtils.clamp(34, -10, 10)).assertEqual(10);
      // Vector 13: clamp(36, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(36, -10, 10)");
      expect(NumberUtils.clamp(36, -10, 10)).assertEqual(10);
      // Vector 14: clamp(38, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(38, -10, 10)");
      expect(NumberUtils.clamp(38, -10, 10)).assertEqual(10);
      // Vector 15: clamp(40, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(40, -10, 10)");
      expect(NumberUtils.clamp(40, -10, 10)).assertEqual(10);
      // Vector 16: clamp(42, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(42, -10, 10)");
      expect(NumberUtils.clamp(42, -10, 10)).assertEqual(10);
      // Vector 17: clamp(44, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(44, -10, 10)");
      expect(NumberUtils.clamp(44, -10, 10)).assertEqual(10);
      // Vector 18: clamp(46, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(46, -10, 10)");
      expect(NumberUtils.clamp(46, -10, 10)).assertEqual(10);
      // Vector 19: clamp(48, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(48, -10, 10)");
      expect(NumberUtils.clamp(48, -10, 10)).assertEqual(10);
      // Vector 20: clamp(50, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(50, -10, 10)");
      expect(NumberUtils.clamp(50, -10, 10)).assertEqual(10);
      // Vector 21: clamp(52, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(52, -10, 10)");
      expect(NumberUtils.clamp(52, -10, 10)).assertEqual(10);
      // Vector 22: clamp(54, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(54, -10, 10)");
      expect(NumberUtils.clamp(54, -10, 10)).assertEqual(10);
      // Vector 23: clamp(56, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(56, -10, 10)");
      expect(NumberUtils.clamp(56, -10, 10)).assertEqual(10);
      // Vector 24: clamp(58, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(58, -10, 10)");
      expect(NumberUtils.clamp(58, -10, 10)).assertEqual(10);
      // Vector 25: clamp(60, -10, 10) pins the value to the upper bound.
      logCase(TAG, "clamp(60, -10, 10)");
      expect(NumberUtils.clamp(60, -10, 10)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_CLAMP_0400
     * @tc.name      testClampBoundary0001
     * @tc.desc      Verify clamp treats both range endpoints as valid in-range values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampBoundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampBoundary0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: clamp(-10, -10, 10) honours the boundary values.
      logCase(TAG, "clamp(-10, -10, 10)");
      expect(NumberUtils.clamp(-10, -10, 10)).assertEqual(-10);
      // Vector 2: clamp(10, -10, 10) honours the boundary values.
      logCase(TAG, "clamp(10, -10, 10)");
      expect(NumberUtils.clamp(10, -10, 10)).assertEqual(10);
      // Vector 3: clamp(0, 0, 0) honours the boundary values.
      logCase(TAG, "clamp(0, 0, 0)");
      expect(NumberUtils.clamp(0, 0, 0)).assertEqual(0);
      // Vector 4: clamp(5, 5, 9) honours the boundary values.
      logCase(TAG, "clamp(5, 5, 9)");
      expect(NumberUtils.clamp(5, 5, 9)).assertEqual(5);
      // Vector 5: clamp(9, 5, 9) honours the boundary values.
      logCase(TAG, "clamp(9, 5, 9)");
      expect(NumberUtils.clamp(9, 5, 9)).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_CLAMP_0500
     * @tc.name      testClampNegativeRange0001
     * @tc.desc      Verify clamp handles an entirely negative range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampNegativeRange0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampNegativeRange0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: clamp(-100, -100, -10) works on an all-negative range.
      logCase(TAG, "clamp(-100, -100, -10)");
      expect(NumberUtils.clamp(-100, -100, -10)).assertEqual(-100);
      // Vector 2: clamp(-95, -100, -10) works on an all-negative range.
      logCase(TAG, "clamp(-95, -100, -10)");
      expect(NumberUtils.clamp(-95, -100, -10)).assertEqual(-95);
      // Vector 3: clamp(-90, -100, -10) works on an all-negative range.
      logCase(TAG, "clamp(-90, -100, -10)");
      expect(NumberUtils.clamp(-90, -100, -10)).assertEqual(-90);
      // Vector 4: clamp(-85, -100, -10) works on an all-negative range.
      logCase(TAG, "clamp(-85, -100, -10)");
      expect(NumberUtils.clamp(-85, -100, -10)).assertEqual(-85);
      // Vector 5: clamp(-80, -100, -10) works on an all-negative range.
      logCase(TAG, "clamp(-80, -100, -10)");
      expect(NumberUtils.clamp(-80, -100, -10)).assertEqual(-80);
      // Vector 6: clamp(-75, -100, -10) works on an all-negative range.
      logCase(TAG, "clamp(-75, -100, -10)");
      expect(NumberUtils.clamp(-75, -100, -10)).assertEqual(-75);
      // Vector 7: clamp(-70, -100, -10) works on an all-negative range.
      logCase(TAG, "clamp(-70, -100, -10)");
      expect(NumberUtils.clamp(-70, -100, -10)).assertEqual(-70);
      // Vector 8: clamp(-65, -100, -10) works on an all-negative range.
      logCase(TAG, "clamp(-65, -100, -10)");
      expect(NumberUtils.clamp(-65, -100, -10)).assertEqual(-65);
      // Vector 9: clamp(-60, -100, -10) works on an all-negative range.
      logCase(TAG, "clamp(-60, -100, -10)");
      expect(NumberUtils.clamp(-60, -100, -10)).assertEqual(-60);
      // Vector 10: clamp(-55, -100, -10) works on an all-negative range.
      logCase(TAG, "clamp(-55, -100, -10)");
      expect(NumberUtils.clamp(-55, -100, -10)).assertEqual(-55);
      // Vector 11: clamp(-50, -100, -10) works on an all-negative range.
      logCase(TAG, "clamp(-50, -100, -10)");
      expect(NumberUtils.clamp(-50, -100, -10)).assertEqual(-50);
      // Vector 12: clamp(-45, -100, -10) works on an all-negative range.
      logCase(TAG, "clamp(-45, -100, -10)");
      expect(NumberUtils.clamp(-45, -100, -10)).assertEqual(-45);
      // Vector 13: clamp(-40, -100, -10) works on an all-negative range.
      logCase(TAG, "clamp(-40, -100, -10)");
      expect(NumberUtils.clamp(-40, -100, -10)).assertEqual(-40);
      // Vector 14: clamp(-35, -100, -10) works on an all-negative range.
      logCase(TAG, "clamp(-35, -100, -10)");
      expect(NumberUtils.clamp(-35, -100, -10)).assertEqual(-35);
      // Vector 15: clamp(-30, -100, -10) works on an all-negative range.
      logCase(TAG, "clamp(-30, -100, -10)");
      expect(NumberUtils.clamp(-30, -100, -10)).assertEqual(-30);
      // Vector 16: clamp(-25, -100, -10) works on an all-negative range.
      logCase(TAG, "clamp(-25, -100, -10)");
      expect(NumberUtils.clamp(-25, -100, -10)).assertEqual(-25);
      // Vector 17: clamp(-20, -100, -10) works on an all-negative range.
      logCase(TAG, "clamp(-20, -100, -10)");
      expect(NumberUtils.clamp(-20, -100, -10)).assertEqual(-20);
      // Vector 18: clamp(-15, -100, -10) works on an all-negative range.
      logCase(TAG, "clamp(-15, -100, -10)");
      expect(NumberUtils.clamp(-15, -100, -10)).assertEqual(-15);
      // Vector 19: clamp(-10, -100, -10) works on an all-negative range.
      logCase(TAG, "clamp(-10, -100, -10)");
      expect(NumberUtils.clamp(-10, -100, -10)).assertEqual(-10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_CLAMP_0600
     * @tc.name      testClampSinglePoint0001
     * @tc.desc      Verify clamp collapses every value onto a single-point range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampSinglePoint0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampSinglePoint0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: clamp(-1000000, 42, 42) collapses to the single-point range.
      logCase(TAG, "clamp(-1000000, 42, 42)");
      expect(NumberUtils.clamp(-1000000, 42, 42)).assertEqual(42);
      // Vector 2: clamp(-1, 42, 42) collapses to the single-point range.
      logCase(TAG, "clamp(-1, 42, 42)");
      expect(NumberUtils.clamp(-1, 42, 42)).assertEqual(42);
      // Vector 3: clamp(0, 42, 42) collapses to the single-point range.
      logCase(TAG, "clamp(0, 42, 42)");
      expect(NumberUtils.clamp(0, 42, 42)).assertEqual(42);
      // Vector 4: clamp(1, 42, 42) collapses to the single-point range.
      logCase(TAG, "clamp(1, 42, 42)");
      expect(NumberUtils.clamp(1, 42, 42)).assertEqual(42);
      // Vector 5: clamp(42, 42, 42) collapses to the single-point range.
      logCase(TAG, "clamp(42, 42, 42)");
      expect(NumberUtils.clamp(42, 42, 42)).assertEqual(42);
      // Vector 6: clamp(999999, 42, 42) collapses to the single-point range.
      logCase(TAG, "clamp(999999, 42, 42)");
      expect(NumberUtils.clamp(999999, 42, 42)).assertEqual(42);
      // Vector 7: clamp(1000000000, 42, 42) collapses to the single-point range.
      logCase(TAG, "clamp(1000000000, 42, 42)");
      expect(NumberUtils.clamp(1000000000, 42, 42)).assertEqual(42);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_CLAMP_0700
     * @tc.name      testClampFractional0001
     * @tc.desc      Verify clamp handles fractional bounds and values without losing precision.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampFractional0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampFractional0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: clamp(-2.5, -1.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-2.5, -1.5, 2.5)");
      expect(NumberUtils.clamp(-2.5, -1.5, 2.5)).assertEqual(-1.5);
      // Vector 2: clamp(-1.5, -1.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-1.5, -1.5, 2.5)");
      expect(NumberUtils.clamp(-1.5, -1.5, 2.5)).assertEqual(-1.5);
      // Vector 3: clamp(-0.5, -1.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(-0.5, -1.5, 2.5)");
      expect(NumberUtils.clamp(-0.5, -1.5, 2.5)).assertEqual(-0.5);
      // Vector 4: clamp(0.0, -1.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0, -1.5, 2.5)");
      expect(NumberUtils.clamp(0, -1.5, 2.5)).assertEqual(0);
      // Vector 5: clamp(0.5, -1.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(0.5, -1.5, 2.5)");
      expect(NumberUtils.clamp(0.5, -1.5, 2.5)).assertEqual(0.5);
      // Vector 6: clamp(1.0, -1.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1, -1.5, 2.5)");
      expect(NumberUtils.clamp(1, -1.5, 2.5)).assertEqual(1);
      // Vector 7: clamp(1.5, -1.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(1.5, -1.5, 2.5)");
      expect(NumberUtils.clamp(1.5, -1.5, 2.5)).assertEqual(1.5);
      // Vector 8: clamp(2.5, -1.5, 2.5) keeps fractional bounds precise.
      logCase(TAG, "clamp(2.5, -1.5, 2.5)");
      expect(NumberUtils.clamp(2.5, -1.5, 2.5)).assertEqual(2.5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_CLAMP_0800
     * @tc.name      testClampLargeMagnitude0001
     * @tc.desc      Verify clamp stays correct for large positive and negative magnitudes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampLargeMagnitude0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampLargeMagnitude0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: clamp(-2000000000, -1e9, 1e9) keeps large magnitudes bounded.
      logCase(TAG, "clamp(-2000000000, -1000000000, 1000000000)");
      expect(NumberUtils.clamp(-2000000000, -1000000000, 1000000000)).assertEqual(-1000000000);
      // Vector 2: clamp(-1000000001, -1e9, 1e9) keeps large magnitudes bounded.
      logCase(TAG, "clamp(-1000000001, -1000000000, 1000000000)");
      expect(NumberUtils.clamp(-1000000001, -1000000000, 1000000000)).assertEqual(-1000000000);
      // Vector 3: clamp(0, -1e9, 1e9) keeps large magnitudes bounded.
      logCase(TAG, "clamp(0, -1000000000, 1000000000)");
      expect(NumberUtils.clamp(0, -1000000000, 1000000000)).assertEqual(0);
      // Vector 4: clamp(1000000001, -1e9, 1e9) keeps large magnitudes bounded.
      logCase(TAG, "clamp(1000000001, -1000000000, 1000000000)");
      expect(NumberUtils.clamp(1000000001, -1000000000, 1000000000)).assertEqual(1000000000);
      // Vector 5: clamp(2000000000, -1e9, 1e9) keeps large magnitudes bounded.
      logCase(TAG, "clamp(2000000000, -1000000000, 1000000000)");
      expect(NumberUtils.clamp(2000000000, -1000000000, 1000000000)).assertEqual(1000000000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_CLAMP_0900
     * @tc.name      testClampDeterministicSweep0001
     * @tc.desc      Verify clamp across a deterministic value sweep that crosses both bounds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampDeterministicSweep0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampDeterministicSweep0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: clamp(-23, -25, 25) follows the deterministic sweep.
      logCase(TAG, "clamp(-23, -25, 25)");
      expect(NumberUtils.clamp(-23, -25, 25)).assertEqual(-23);
      // Vector 2: clamp(14, -25, 25) follows the deterministic sweep.
      logCase(TAG, "clamp(14, -25, 25)");
      expect(NumberUtils.clamp(14, -25, 25)).assertEqual(14);
      // Vector 3: clamp(51, -25, 25) follows the deterministic sweep.
      logCase(TAG, "clamp(51, -25, 25)");
      expect(NumberUtils.clamp(51, -25, 25)).assertEqual(25);
      // Vector 4: clamp(-32, -25, 25) follows the deterministic sweep.
      logCase(TAG, "clamp(-32, -25, 25)");
      expect(NumberUtils.clamp(-32, -25, 25)).assertEqual(-25);
      // Vector 5: clamp(5, -25, 25) follows the deterministic sweep.
      logCase(TAG, "clamp(5, -25, 25)");
      expect(NumberUtils.clamp(5, -25, 25)).assertEqual(5);
      // Vector 6: clamp(42, -25, 25) follows the deterministic sweep.
      logCase(TAG, "clamp(42, -25, 25)");
      expect(NumberUtils.clamp(42, -25, 25)).assertEqual(25);
      // Vector 7: clamp(-41, -25, 25) follows the deterministic sweep.
      logCase(TAG, "clamp(-41, -25, 25)");
      expect(NumberUtils.clamp(-41, -25, 25)).assertEqual(-25);
      // Vector 8: clamp(-4, -25, 25) follows the deterministic sweep.
      logCase(TAG, "clamp(-4, -25, 25)");
      expect(NumberUtils.clamp(-4, -25, 25)).assertEqual(-4);
      // Vector 9: clamp(33, -25, 25) follows the deterministic sweep.
      logCase(TAG, "clamp(33, -25, 25)");
      expect(NumberUtils.clamp(33, -25, 25)).assertEqual(25);
      // Vector 10: clamp(-50, -25, 25) follows the deterministic sweep.
      logCase(TAG, "clamp(-50, -25, 25)");
      expect(NumberUtils.clamp(-50, -25, 25)).assertEqual(-25);
      // Vector 11: clamp(-13, -25, 25) follows the deterministic sweep.
      logCase(TAG, "clamp(-13, -25, 25)");
      expect(NumberUtils.clamp(-13, -25, 25)).assertEqual(-13);
      // Vector 12: clamp(24, -25, 25) follows the deterministic sweep.
      logCase(TAG, "clamp(24, -25, 25)");
      expect(NumberUtils.clamp(24, -25, 25)).assertEqual(24);
      // Vector 13: clamp(-59, -25, 25) follows the deterministic sweep.
      logCase(TAG, "clamp(-59, -25, 25)");
      expect(NumberUtils.clamp(-59, -25, 25)).assertEqual(-25);
      // Vector 14: clamp(-22, -25, 25) follows the deterministic sweep.
      logCase(TAG, "clamp(-22, -25, 25)");
      expect(NumberUtils.clamp(-22, -25, 25)).assertEqual(-22);
      // Vector 15: clamp(15, -25, 25) follows the deterministic sweep.
      logCase(TAG, "clamp(15, -25, 25)");
      expect(NumberUtils.clamp(15, -25, 25)).assertEqual(15);
      // Vector 16: clamp(52, -25, 25) follows the deterministic sweep.
      logCase(TAG, "clamp(52, -25, 25)");
      expect(NumberUtils.clamp(52, -25, 25)).assertEqual(25);
      // Vector 17: clamp(-31, -25, 25) follows the deterministic sweep.
      logCase(TAG, "clamp(-31, -25, 25)");
      expect(NumberUtils.clamp(-31, -25, 25)).assertEqual(-25);
      // Vector 18: clamp(6, -25, 25) follows the deterministic sweep.
      logCase(TAG, "clamp(6, -25, 25)");
      expect(NumberUtils.clamp(6, -25, 25)).assertEqual(6);
      // Vector 19: clamp(43, -25, 25) follows the deterministic sweep.
      logCase(TAG, "clamp(43, -25, 25)");
      expect(NumberUtils.clamp(43, -25, 25)).assertEqual(25);
      // Vector 20: clamp(-40, -25, 25) follows the deterministic sweep.
      logCase(TAG, "clamp(-40, -25, 25)");
      expect(NumberUtils.clamp(-40, -25, 25)).assertEqual(-25);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_CLAMP_1000
     * @tc.name      testClampSymmetry0001
     * @tc.desc      Verify clamp keeps mirror symmetry around zero for symmetric bounds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testClampSymmetry0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testClampSymmetry0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: clamp is symmetric around zero for value 0.
      logCase(TAG, "clamp symmetry for 0");
      expect(NumberUtils.clamp(-0, -50, 50)).assertEqual(-NumberUtils.clamp(0, -50, 50));
      // Vector 2: clamp is symmetric around zero for value 3.
      logCase(TAG, "clamp symmetry for 3");
      expect(NumberUtils.clamp(-3, -50, 50)).assertEqual(-NumberUtils.clamp(3, -50, 50));
      // Vector 3: clamp is symmetric around zero for value 17.
      logCase(TAG, "clamp symmetry for 17");
      expect(NumberUtils.clamp(-17, -50, 50)).assertEqual(-NumberUtils.clamp(17, -50, 50));
      // Vector 4: clamp is symmetric around zero for value 49.
      logCase(TAG, "clamp symmetry for 49");
      expect(NumberUtils.clamp(-49, -50, 50)).assertEqual(-NumberUtils.clamp(49, -50, 50));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
