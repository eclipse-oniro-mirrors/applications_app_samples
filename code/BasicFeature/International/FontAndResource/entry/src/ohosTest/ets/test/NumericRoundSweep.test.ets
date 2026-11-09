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

// Registers every matrix case of the NumericRoundSweepSuite suite.
export default function numericRoundSweepTest() {
  // Group the cases under the "NumericRoundSweepSuite" describe block.
  describe('NumericRoundSweepSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'NumericRoundSweepSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_ROUND_0100
     * @tc.name      testRoundSweepPlaces0000
     * @tc.desc      Verify round at 0 decimal places across a representative value sweep.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoundSweepPlaces0000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoundSweepPlaces0000';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: round(0, 0) follows half-up rounding.
      logCase(TAG, "round(0, 0)");
      expect(NumberUtils.round(0, 0)).assertEqual(0);
      // Vector 2: round(0.04, 0) follows half-up rounding.
      logCase(TAG, "round(0.04, 0)");
      expect(NumberUtils.round(0.04, 0)).assertEqual(0);
      // Vector 3: round(0.05, 0) follows half-up rounding.
      logCase(TAG, "round(0.05, 0)");
      expect(NumberUtils.round(0.05, 0)).assertEqual(0);
      // Vector 4: round(0.14, 0) follows half-up rounding.
      logCase(TAG, "round(0.14, 0)");
      expect(NumberUtils.round(0.14, 0)).assertEqual(0);
      // Vector 5: round(0.15, 0) follows half-up rounding.
      logCase(TAG, "round(0.15, 0)");
      expect(NumberUtils.round(0.15, 0)).assertEqual(0);
      // Vector 6: round(0.25, 0) follows half-up rounding.
      logCase(TAG, "round(0.25, 0)");
      expect(NumberUtils.round(0.25, 0)).assertEqual(0);
      // Vector 7: round(0.35, 0) follows half-up rounding.
      logCase(TAG, "round(0.35, 0)");
      expect(NumberUtils.round(0.35, 0)).assertEqual(0);
      // Vector 8: round(0.45, 0) follows half-up rounding.
      logCase(TAG, "round(0.45, 0)");
      expect(NumberUtils.round(0.45, 0)).assertEqual(0);
      // Vector 9: round(0.55, 0) follows half-up rounding.
      logCase(TAG, "round(0.55, 0)");
      expect(NumberUtils.round(0.55, 0)).assertEqual(1);
      // Vector 10: round(1.04, 0) follows half-up rounding.
      logCase(TAG, "round(1.04, 0)");
      expect(NumberUtils.round(1.04, 0)).assertEqual(1);
      // Vector 11: round(1.05, 0) follows half-up rounding.
      logCase(TAG, "round(1.05, 0)");
      expect(NumberUtils.round(1.05, 0)).assertEqual(1);
      // Vector 12: round(1.15, 0) follows half-up rounding.
      logCase(TAG, "round(1.15, 0)");
      expect(NumberUtils.round(1.15, 0)).assertEqual(1);
      // Vector 13: round(1.25, 0) follows half-up rounding.
      logCase(TAG, "round(1.25, 0)");
      expect(NumberUtils.round(1.25, 0)).assertEqual(1);
      // Vector 14: round(2.5, 0) follows half-up rounding.
      logCase(TAG, "round(2.5, 0)");
      expect(NumberUtils.round(2.5, 0)).assertEqual(3);
      // Vector 15: round(3.14159, 0) follows half-up rounding.
      logCase(TAG, "round(3.14159, 0)");
      expect(NumberUtils.round(3.14159, 0)).assertEqual(3);
      // Vector 16: round(9.999, 0) follows half-up rounding.
      logCase(TAG, "round(9.999, 0)");
      expect(NumberUtils.round(9.999, 0)).assertEqual(10);
      // Vector 17: round(10.05, 0) follows half-up rounding.
      logCase(TAG, "round(10.05, 0)");
      expect(NumberUtils.round(10.05, 0)).assertEqual(10);
      // Vector 18: round(123.456, 0) follows half-up rounding.
      logCase(TAG, "round(123.456, 0)");
      expect(NumberUtils.round(123.456, 0)).assertEqual(123);
      // Vector 19: round(999.999, 0) follows half-up rounding.
      logCase(TAG, "round(999.999, 0)");
      expect(NumberUtils.round(999.999, 0)).assertEqual(1000);
      // Vector 20: round(1234.5678, 0) follows half-up rounding.
      logCase(TAG, "round(1234.5678, 0)");
      expect(NumberUtils.round(1234.5678, 0)).assertEqual(1235);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_ROUND_0200
     * @tc.name      testRoundSweepPlaces0001
     * @tc.desc      Verify round at 1 decimal places across a representative value sweep.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoundSweepPlaces0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoundSweepPlaces0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: round(0, 1) follows half-up rounding.
      logCase(TAG, "round(0, 1)");
      expect(NumberUtils.round(0, 1)).assertEqual(0);
      // Vector 2: round(0.04, 1) follows half-up rounding.
      logCase(TAG, "round(0.04, 1)");
      expect(NumberUtils.round(0.04, 1)).assertEqual(0);
      // Vector 3: round(0.05, 1) follows half-up rounding.
      logCase(TAG, "round(0.05, 1)");
      expect(NumberUtils.round(0.05, 1)).assertEqual(0.1);
      // Vector 4: round(0.14, 1) follows half-up rounding.
      logCase(TAG, "round(0.14, 1)");
      expect(NumberUtils.round(0.14, 1)).assertEqual(0.1);
      // Vector 5: round(0.15, 1) follows half-up rounding.
      logCase(TAG, "round(0.15, 1)");
      expect(NumberUtils.round(0.15, 1)).assertEqual(0.2);
      // Vector 6: round(0.25, 1) follows half-up rounding.
      logCase(TAG, "round(0.25, 1)");
      expect(NumberUtils.round(0.25, 1)).assertEqual(0.3);
      // Vector 7: round(0.35, 1) follows half-up rounding.
      logCase(TAG, "round(0.35, 1)");
      expect(NumberUtils.round(0.35, 1)).assertEqual(0.4);
      // Vector 8: round(0.45, 1) follows half-up rounding.
      logCase(TAG, "round(0.45, 1)");
      expect(NumberUtils.round(0.45, 1)).assertEqual(0.5);
      // Vector 9: round(0.55, 1) follows half-up rounding.
      logCase(TAG, "round(0.55, 1)");
      expect(NumberUtils.round(0.55, 1)).assertEqual(0.6);
      // Vector 10: round(1.04, 1) follows half-up rounding.
      logCase(TAG, "round(1.04, 1)");
      expect(NumberUtils.round(1.04, 1)).assertEqual(1);
      // Vector 11: round(1.05, 1) follows half-up rounding.
      logCase(TAG, "round(1.05, 1)");
      expect(NumberUtils.round(1.05, 1)).assertEqual(1.1);
      // Vector 12: round(1.15, 1) follows half-up rounding.
      logCase(TAG, "round(1.15, 1)");
      expect(NumberUtils.round(1.15, 1)).assertEqual(1.2);
      // Vector 13: round(1.25, 1) follows half-up rounding.
      logCase(TAG, "round(1.25, 1)");
      expect(NumberUtils.round(1.25, 1)).assertEqual(1.3);
      // Vector 14: round(2.5, 1) follows half-up rounding.
      logCase(TAG, "round(2.5, 1)");
      expect(NumberUtils.round(2.5, 1)).assertEqual(2.5);
      // Vector 15: round(3.14159, 1) follows half-up rounding.
      logCase(TAG, "round(3.14159, 1)");
      expect(NumberUtils.round(3.14159, 1)).assertEqual(3.1);
      // Vector 16: round(9.999, 1) follows half-up rounding.
      logCase(TAG, "round(9.999, 1)");
      expect(NumberUtils.round(9.999, 1)).assertEqual(10);
      // Vector 17: round(10.05, 1) follows half-up rounding.
      logCase(TAG, "round(10.05, 1)");
      expect(NumberUtils.round(10.05, 1)).assertEqual(10.1);
      // Vector 18: round(123.456, 1) follows half-up rounding.
      logCase(TAG, "round(123.456, 1)");
      expect(NumberUtils.round(123.456, 1)).assertEqual(123.5);
      // Vector 19: round(999.999, 1) follows half-up rounding.
      logCase(TAG, "round(999.999, 1)");
      expect(NumberUtils.round(999.999, 1)).assertEqual(1000);
      // Vector 20: round(1234.5678, 1) follows half-up rounding.
      logCase(TAG, "round(1234.5678, 1)");
      expect(NumberUtils.round(1234.5678, 1)).assertEqual(1234.6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_ROUND_0300
     * @tc.name      testRoundSweepPlaces0002
     * @tc.desc      Verify round at 2 decimal places across a representative value sweep.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoundSweepPlaces0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoundSweepPlaces0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: round(0, 2) follows half-up rounding.
      logCase(TAG, "round(0, 2)");
      expect(NumberUtils.round(0, 2)).assertEqual(0);
      // Vector 2: round(0.04, 2) follows half-up rounding.
      logCase(TAG, "round(0.04, 2)");
      expect(NumberUtils.round(0.04, 2)).assertEqual(0.04);
      // Vector 3: round(0.05, 2) follows half-up rounding.
      logCase(TAG, "round(0.05, 2)");
      expect(NumberUtils.round(0.05, 2)).assertEqual(0.05);
      // Vector 4: round(0.14, 2) follows half-up rounding.
      logCase(TAG, "round(0.14, 2)");
      expect(NumberUtils.round(0.14, 2)).assertEqual(0.14);
      // Vector 5: round(0.15, 2) follows half-up rounding.
      logCase(TAG, "round(0.15, 2)");
      expect(NumberUtils.round(0.15, 2)).assertEqual(0.15);
      // Vector 6: round(0.25, 2) follows half-up rounding.
      logCase(TAG, "round(0.25, 2)");
      expect(NumberUtils.round(0.25, 2)).assertEqual(0.25);
      // Vector 7: round(0.35, 2) follows half-up rounding.
      logCase(TAG, "round(0.35, 2)");
      expect(NumberUtils.round(0.35, 2)).assertEqual(0.35);
      // Vector 8: round(0.45, 2) follows half-up rounding.
      logCase(TAG, "round(0.45, 2)");
      expect(NumberUtils.round(0.45, 2)).assertEqual(0.45);
      // Vector 9: round(0.55, 2) follows half-up rounding.
      logCase(TAG, "round(0.55, 2)");
      expect(NumberUtils.round(0.55, 2)).assertEqual(0.55);
      // Vector 10: round(1.04, 2) follows half-up rounding.
      logCase(TAG, "round(1.04, 2)");
      expect(NumberUtils.round(1.04, 2)).assertEqual(1.04);
      // Vector 11: round(1.05, 2) follows half-up rounding.
      logCase(TAG, "round(1.05, 2)");
      expect(NumberUtils.round(1.05, 2)).assertEqual(1.05);
      // Vector 12: round(1.15, 2) follows half-up rounding.
      logCase(TAG, "round(1.15, 2)");
      expect(NumberUtils.round(1.15, 2)).assertEqual(1.15);
      // Vector 13: round(1.25, 2) follows half-up rounding.
      logCase(TAG, "round(1.25, 2)");
      expect(NumberUtils.round(1.25, 2)).assertEqual(1.25);
      // Vector 14: round(2.5, 2) follows half-up rounding.
      logCase(TAG, "round(2.5, 2)");
      expect(NumberUtils.round(2.5, 2)).assertEqual(2.5);
      // Vector 15: round(3.14159, 2) follows half-up rounding.
      logCase(TAG, "round(3.14159, 2)");
      expect(NumberUtils.round(3.14159, 2)).assertEqual(3.14);
      // Vector 16: round(9.999, 2) follows half-up rounding.
      logCase(TAG, "round(9.999, 2)");
      expect(NumberUtils.round(9.999, 2)).assertEqual(10);
      // Vector 17: round(10.05, 2) follows half-up rounding.
      logCase(TAG, "round(10.05, 2)");
      expect(NumberUtils.round(10.05, 2)).assertEqual(10.05);
      // Vector 18: round(123.456, 2) follows half-up rounding.
      logCase(TAG, "round(123.456, 2)");
      expect(NumberUtils.round(123.456, 2)).assertEqual(123.46);
      // Vector 19: round(999.999, 2) follows half-up rounding.
      logCase(TAG, "round(999.999, 2)");
      expect(NumberUtils.round(999.999, 2)).assertEqual(1000);
      // Vector 20: round(1234.5678, 2) follows half-up rounding.
      logCase(TAG, "round(1234.5678, 2)");
      expect(NumberUtils.round(1234.5678, 2)).assertEqual(1234.57);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_ROUND_0400
     * @tc.name      testRoundSweepPlaces0003
     * @tc.desc      Verify round at 3 decimal places across a representative value sweep.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoundSweepPlaces0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoundSweepPlaces0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: round(0, 3) follows half-up rounding.
      logCase(TAG, "round(0, 3)");
      expect(NumberUtils.round(0, 3)).assertEqual(0);
      // Vector 2: round(0.04, 3) follows half-up rounding.
      logCase(TAG, "round(0.04, 3)");
      expect(NumberUtils.round(0.04, 3)).assertEqual(0.04);
      // Vector 3: round(0.05, 3) follows half-up rounding.
      logCase(TAG, "round(0.05, 3)");
      expect(NumberUtils.round(0.05, 3)).assertEqual(0.05);
      // Vector 4: round(0.14, 3) follows half-up rounding.
      logCase(TAG, "round(0.14, 3)");
      expect(NumberUtils.round(0.14, 3)).assertEqual(0.14);
      // Vector 5: round(0.15, 3) follows half-up rounding.
      logCase(TAG, "round(0.15, 3)");
      expect(NumberUtils.round(0.15, 3)).assertEqual(0.15);
      // Vector 6: round(0.25, 3) follows half-up rounding.
      logCase(TAG, "round(0.25, 3)");
      expect(NumberUtils.round(0.25, 3)).assertEqual(0.25);
      // Vector 7: round(0.35, 3) follows half-up rounding.
      logCase(TAG, "round(0.35, 3)");
      expect(NumberUtils.round(0.35, 3)).assertEqual(0.35);
      // Vector 8: round(0.45, 3) follows half-up rounding.
      logCase(TAG, "round(0.45, 3)");
      expect(NumberUtils.round(0.45, 3)).assertEqual(0.45);
      // Vector 9: round(0.55, 3) follows half-up rounding.
      logCase(TAG, "round(0.55, 3)");
      expect(NumberUtils.round(0.55, 3)).assertEqual(0.55);
      // Vector 10: round(1.04, 3) follows half-up rounding.
      logCase(TAG, "round(1.04, 3)");
      expect(NumberUtils.round(1.04, 3)).assertEqual(1.04);
      // Vector 11: round(1.05, 3) follows half-up rounding.
      logCase(TAG, "round(1.05, 3)");
      expect(NumberUtils.round(1.05, 3)).assertEqual(1.05);
      // Vector 12: round(1.15, 3) follows half-up rounding.
      logCase(TAG, "round(1.15, 3)");
      expect(NumberUtils.round(1.15, 3)).assertEqual(1.15);
      // Vector 13: round(1.25, 3) follows half-up rounding.
      logCase(TAG, "round(1.25, 3)");
      expect(NumberUtils.round(1.25, 3)).assertEqual(1.25);
      // Vector 14: round(2.5, 3) follows half-up rounding.
      logCase(TAG, "round(2.5, 3)");
      expect(NumberUtils.round(2.5, 3)).assertEqual(2.5);
      // Vector 15: round(3.14159, 3) follows half-up rounding.
      logCase(TAG, "round(3.14159, 3)");
      expect(NumberUtils.round(3.14159, 3)).assertEqual(3.142);
      // Vector 16: round(9.999, 3) follows half-up rounding.
      logCase(TAG, "round(9.999, 3)");
      expect(NumberUtils.round(9.999, 3)).assertEqual(9.999);
      // Vector 17: round(10.05, 3) follows half-up rounding.
      logCase(TAG, "round(10.05, 3)");
      expect(NumberUtils.round(10.05, 3)).assertEqual(10.05);
      // Vector 18: round(123.456, 3) follows half-up rounding.
      logCase(TAG, "round(123.456, 3)");
      expect(NumberUtils.round(123.456, 3)).assertEqual(123.456);
      // Vector 19: round(999.999, 3) follows half-up rounding.
      logCase(TAG, "round(999.999, 3)");
      expect(NumberUtils.round(999.999, 3)).assertEqual(999.999);
      // Vector 20: round(1234.5678, 3) follows half-up rounding.
      logCase(TAG, "round(1234.5678, 3)");
      expect(NumberUtils.round(1234.5678, 3)).assertEqual(1234.568);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_ROUND_0500
     * @tc.name      testRoundSweepPlaces0004
     * @tc.desc      Verify round at 4 decimal places across a representative value sweep.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoundSweepPlaces0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoundSweepPlaces0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: round(0, 4) follows half-up rounding.
      logCase(TAG, "round(0, 4)");
      expect(NumberUtils.round(0, 4)).assertEqual(0);
      // Vector 2: round(0.04, 4) follows half-up rounding.
      logCase(TAG, "round(0.04, 4)");
      expect(NumberUtils.round(0.04, 4)).assertEqual(0.04);
      // Vector 3: round(0.05, 4) follows half-up rounding.
      logCase(TAG, "round(0.05, 4)");
      expect(NumberUtils.round(0.05, 4)).assertEqual(0.05);
      // Vector 4: round(0.14, 4) follows half-up rounding.
      logCase(TAG, "round(0.14, 4)");
      expect(NumberUtils.round(0.14, 4)).assertEqual(0.14);
      // Vector 5: round(0.15, 4) follows half-up rounding.
      logCase(TAG, "round(0.15, 4)");
      expect(NumberUtils.round(0.15, 4)).assertEqual(0.15);
      // Vector 6: round(0.25, 4) follows half-up rounding.
      logCase(TAG, "round(0.25, 4)");
      expect(NumberUtils.round(0.25, 4)).assertEqual(0.25);
      // Vector 7: round(0.35, 4) follows half-up rounding.
      logCase(TAG, "round(0.35, 4)");
      expect(NumberUtils.round(0.35, 4)).assertEqual(0.35);
      // Vector 8: round(0.45, 4) follows half-up rounding.
      logCase(TAG, "round(0.45, 4)");
      expect(NumberUtils.round(0.45, 4)).assertEqual(0.45);
      // Vector 9: round(0.55, 4) follows half-up rounding.
      logCase(TAG, "round(0.55, 4)");
      expect(NumberUtils.round(0.55, 4)).assertEqual(0.55);
      // Vector 10: round(1.04, 4) follows half-up rounding.
      logCase(TAG, "round(1.04, 4)");
      expect(NumberUtils.round(1.04, 4)).assertEqual(1.04);
      // Vector 11: round(1.05, 4) follows half-up rounding.
      logCase(TAG, "round(1.05, 4)");
      expect(NumberUtils.round(1.05, 4)).assertEqual(1.05);
      // Vector 12: round(1.15, 4) follows half-up rounding.
      logCase(TAG, "round(1.15, 4)");
      expect(NumberUtils.round(1.15, 4)).assertEqual(1.15);
      // Vector 13: round(1.25, 4) follows half-up rounding.
      logCase(TAG, "round(1.25, 4)");
      expect(NumberUtils.round(1.25, 4)).assertEqual(1.25);
      // Vector 14: round(2.5, 4) follows half-up rounding.
      logCase(TAG, "round(2.5, 4)");
      expect(NumberUtils.round(2.5, 4)).assertEqual(2.5);
      // Vector 15: round(3.14159, 4) follows half-up rounding.
      logCase(TAG, "round(3.14159, 4)");
      expect(NumberUtils.round(3.14159, 4)).assertEqual(3.1416);
      // Vector 16: round(9.999, 4) follows half-up rounding.
      logCase(TAG, "round(9.999, 4)");
      expect(NumberUtils.round(9.999, 4)).assertEqual(9.999);
      // Vector 17: round(10.05, 4) follows half-up rounding.
      logCase(TAG, "round(10.05, 4)");
      expect(NumberUtils.round(10.05, 4)).assertEqual(10.05);
      // Vector 18: round(123.456, 4) follows half-up rounding.
      logCase(TAG, "round(123.456, 4)");
      expect(NumberUtils.round(123.456, 4)).assertEqual(123.456);
      // Vector 19: round(999.999, 4) follows half-up rounding.
      logCase(TAG, "round(999.999, 4)");
      expect(NumberUtils.round(999.999, 4)).assertEqual(999.999);
      // Vector 20: round(1234.5678, 4) follows half-up rounding.
      logCase(TAG, "round(1234.5678, 4)");
      expect(NumberUtils.round(1234.5678, 4)).assertEqual(1234.5678);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_ROUND_0600
     * @tc.name      testRoundSweepNegative0001
     * @tc.desc      Verify round handles a negative sweep without flipping the sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoundSweepNegative0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoundSweepNegative0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: round(-0.04, 2) handles negative values.
      logCase(TAG, "round(-0.04, 2)");
      expect(NumberUtils.round(-0.04, 2)).assertEqual(-0.04);
      // Vector 2: round(-0.05, 2) handles negative values.
      logCase(TAG, "round(-0.05, 2)");
      expect(NumberUtils.round(-0.05, 2)).assertEqual(-0.05);
      // Vector 3: round(-0.14, 2) handles negative values.
      logCase(TAG, "round(-0.14, 2)");
      expect(NumberUtils.round(-0.14, 2)).assertEqual(-0.14);
      // Vector 4: round(-0.15, 2) handles negative values.
      logCase(TAG, "round(-0.15, 2)");
      expect(NumberUtils.round(-0.15, 2)).assertEqual(-0.15);
      // Vector 5: round(-0.25, 2) handles negative values.
      logCase(TAG, "round(-0.25, 2)");
      expect(NumberUtils.round(-0.25, 2)).assertEqual(-0.25);
      // Vector 6: round(-0.35, 2) handles negative values.
      logCase(TAG, "round(-0.35, 2)");
      expect(NumberUtils.round(-0.35, 2)).assertEqual(-0.35);
      // Vector 7: round(-0.45, 2) handles negative values.
      logCase(TAG, "round(-0.45, 2)");
      expect(NumberUtils.round(-0.45, 2)).assertEqual(-0.45);
      // Vector 8: round(-1.04, 2) handles negative values.
      logCase(TAG, "round(-1.04, 2)");
      expect(NumberUtils.round(-1.04, 2)).assertEqual(-1.04);
      // Vector 9: round(-1.05, 2) handles negative values.
      logCase(TAG, "round(-1.05, 2)");
      expect(NumberUtils.round(-1.05, 2)).assertEqual(-1.05);
      // Vector 10: round(-1.25, 2) handles negative values.
      logCase(TAG, "round(-1.25, 2)");
      expect(NumberUtils.round(-1.25, 2)).assertEqual(-1.25);
      // Vector 11: round(-2.5, 2) handles negative values.
      logCase(TAG, "round(-2.5, 2)");
      expect(NumberUtils.round(-2.5, 2)).assertEqual(-2.5);
      // Vector 12: round(-3.14159, 2) handles negative values.
      logCase(TAG, "round(-3.14159, 2)");
      expect(NumberUtils.round(-3.14159, 2)).assertEqual(-3.14);
      // Vector 13: round(-9.999, 2) handles negative values.
      logCase(TAG, "round(-9.999, 2)");
      expect(NumberUtils.round(-9.999, 2)).assertEqual(-10);
      // Vector 14: round(-123.456, 2) handles negative values.
      logCase(TAG, "round(-123.456, 2)");
      expect(NumberUtils.round(-123.456, 2)).assertEqual(-123.46);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_ROUND_0700
     * @tc.name      testRoundSweepIntegers0001
     * @tc.desc      Verify round leaves a representative set of exact integers unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoundSweepIntegers0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoundSweepIntegers0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: round(0, 3) leaves exact integers unchanged.
      logCase(TAG, "round(0, 3)");
      expect(NumberUtils.round(0, 3)).assertEqual(0);
      // Vector 2: round(1, 3) leaves exact integers unchanged.
      logCase(TAG, "round(1, 3)");
      expect(NumberUtils.round(1, 3)).assertEqual(1);
      // Vector 3: round(2, 3) leaves exact integers unchanged.
      logCase(TAG, "round(2, 3)");
      expect(NumberUtils.round(2, 3)).assertEqual(2);
      // Vector 4: round(10, 3) leaves exact integers unchanged.
      logCase(TAG, "round(10, 3)");
      expect(NumberUtils.round(10, 3)).assertEqual(10);
      // Vector 5: round(100, 3) leaves exact integers unchanged.
      logCase(TAG, "round(100, 3)");
      expect(NumberUtils.round(100, 3)).assertEqual(100);
      // Vector 6: round(1000, 3) leaves exact integers unchanged.
      logCase(TAG, "round(1000, 3)");
      expect(NumberUtils.round(1000, 3)).assertEqual(1000);
      // Vector 7: round(99999, 3) leaves exact integers unchanged.
      logCase(TAG, "round(99999, 3)");
      expect(NumberUtils.round(99999, 3)).assertEqual(99999);
      // Vector 8: round(1000000, 3) leaves exact integers unchanged.
      logCase(TAG, "round(1000000, 3)");
      expect(NumberUtils.round(1000000, 3)).assertEqual(1000000);
      // Vector 9: round(123456789, 3) leaves exact integers unchanged.
      logCase(TAG, "round(123456789, 3)");
      expect(NumberUtils.round(123456789, 3)).assertEqual(123456789);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_ROUND_0800
     * @tc.name      testRoundSweepLarge0001
     * @tc.desc      Verify round stays correct for large magnitudes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoundSweepLarge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoundSweepLarge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: round(1000000.5, 0) handles large magnitudes.
      logCase(TAG, "round(1000000.5, 0)");
      expect(NumberUtils.round(1000000.5, 0)).assertEqual(1000001);
      // Vector 2: round(1000001.5, 0) handles large magnitudes.
      logCase(TAG, "round(1000001.5, 0)");
      expect(NumberUtils.round(1000001.5, 0)).assertEqual(1000002);
      // Vector 3: round(999999.5, 0) handles large magnitudes.
      logCase(TAG, "round(999999.5, 0)");
      expect(NumberUtils.round(999999.5, 0)).assertEqual(1000000);
      // Vector 4: round(1234567.891, 0) handles large magnitudes.
      logCase(TAG, "round(1234567.891, 0)");
      expect(NumberUtils.round(1234567.891, 0)).assertEqual(1234568);
      // Vector 5: round(7654321.234, 0) handles large magnitudes.
      logCase(TAG, "round(7654321.234, 0)");
      expect(NumberUtils.round(7654321.234, 0)).assertEqual(7654321);
      // Vector 6: round(9999999.999, 0) handles large magnitudes.
      logCase(TAG, "round(9999999.999, 0)");
      expect(NumberUtils.round(9999999.999, 0)).assertEqual(10000000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
