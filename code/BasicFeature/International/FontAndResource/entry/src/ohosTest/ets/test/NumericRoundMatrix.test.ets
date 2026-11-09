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

// Registers every matrix case of the NumericRoundMatrixSuite suite.
export default function numericRoundMatrixTest() {
  // Group the cases under the "NumericRoundMatrixSuite" describe block.
  describe('NumericRoundMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'NumericRoundMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_ROUND_0100
     * @tc.name      testRoundPlaces0000
     * @tc.desc      Verify round with 0 decimal places across representative values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoundPlaces0000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoundPlaces0000';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: round(0, 0) follows half-up rounding.
      logCase(TAG, "round(0, 0)");
      expect(NumberUtils.round(0, 0)).assertEqual(0);
      // Vector 2: round(0.1, 0) follows half-up rounding.
      logCase(TAG, "round(0.1, 0)");
      expect(NumberUtils.round(0.1, 0)).assertEqual(0);
      // Vector 3: round(0.4, 0) follows half-up rounding.
      logCase(TAG, "round(0.4, 0)");
      expect(NumberUtils.round(0.4, 0)).assertEqual(0);
      // Vector 4: round(0.5, 0) follows half-up rounding.
      logCase(TAG, "round(0.5, 0)");
      expect(NumberUtils.round(0.5, 0)).assertEqual(1);
      // Vector 5: round(0.6, 0) follows half-up rounding.
      logCase(TAG, "round(0.6, 0)");
      expect(NumberUtils.round(0.6, 0)).assertEqual(1);
      // Vector 6: round(1.4, 0) follows half-up rounding.
      logCase(TAG, "round(1.4, 0)");
      expect(NumberUtils.round(1.4, 0)).assertEqual(1);
      // Vector 7: round(1.5, 0) follows half-up rounding.
      logCase(TAG, "round(1.5, 0)");
      expect(NumberUtils.round(1.5, 0)).assertEqual(2);
      // Vector 8: round(2.5, 0) follows half-up rounding.
      logCase(TAG, "round(2.5, 0)");
      expect(NumberUtils.round(2.5, 0)).assertEqual(3);
      // Vector 9: round(3.14159, 0) follows half-up rounding.
      logCase(TAG, "round(3.14159, 0)");
      expect(NumberUtils.round(3.14159, 0)).assertEqual(3);
      // Vector 10: round(9.999, 0) follows half-up rounding.
      logCase(TAG, "round(9.999, 0)");
      expect(NumberUtils.round(9.999, 0)).assertEqual(10);
      // Vector 11: round(10.05, 0) follows half-up rounding.
      logCase(TAG, "round(10.05, 0)");
      expect(NumberUtils.round(10.05, 0)).assertEqual(10);
      // Vector 12: round(123.456, 0) follows half-up rounding.
      logCase(TAG, "round(123.456, 0)");
      expect(NumberUtils.round(123.456, 0)).assertEqual(123);
      // Vector 13: round(999.999, 0) follows half-up rounding.
      logCase(TAG, "round(999.999, 0)");
      expect(NumberUtils.round(999.999, 0)).assertEqual(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_ROUND_0200
     * @tc.name      testRoundPlaces0001
     * @tc.desc      Verify round with 1 decimal places across representative values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoundPlaces0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoundPlaces0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: round(0, 1) follows half-up rounding.
      logCase(TAG, "round(0, 1)");
      expect(NumberUtils.round(0, 1)).assertEqual(0);
      // Vector 2: round(0.1, 1) follows half-up rounding.
      logCase(TAG, "round(0.1, 1)");
      expect(NumberUtils.round(0.1, 1)).assertEqual(0.1);
      // Vector 3: round(0.4, 1) follows half-up rounding.
      logCase(TAG, "round(0.4, 1)");
      expect(NumberUtils.round(0.4, 1)).assertEqual(0.4);
      // Vector 4: round(0.5, 1) follows half-up rounding.
      logCase(TAG, "round(0.5, 1)");
      expect(NumberUtils.round(0.5, 1)).assertEqual(0.5);
      // Vector 5: round(0.6, 1) follows half-up rounding.
      logCase(TAG, "round(0.6, 1)");
      expect(NumberUtils.round(0.6, 1)).assertEqual(0.6);
      // Vector 6: round(1.4, 1) follows half-up rounding.
      logCase(TAG, "round(1.4, 1)");
      expect(NumberUtils.round(1.4, 1)).assertEqual(1.4);
      // Vector 7: round(1.5, 1) follows half-up rounding.
      logCase(TAG, "round(1.5, 1)");
      expect(NumberUtils.round(1.5, 1)).assertEqual(1.5);
      // Vector 8: round(2.5, 1) follows half-up rounding.
      logCase(TAG, "round(2.5, 1)");
      expect(NumberUtils.round(2.5, 1)).assertEqual(2.5);
      // Vector 9: round(3.14159, 1) follows half-up rounding.
      logCase(TAG, "round(3.14159, 1)");
      expect(NumberUtils.round(3.14159, 1)).assertEqual(3.1);
      // Vector 10: round(9.999, 1) follows half-up rounding.
      logCase(TAG, "round(9.999, 1)");
      expect(NumberUtils.round(9.999, 1)).assertEqual(10);
      // Vector 11: round(10.05, 1) follows half-up rounding.
      logCase(TAG, "round(10.05, 1)");
      expect(NumberUtils.round(10.05, 1)).assertEqual(10.1);
      // Vector 12: round(123.456, 1) follows half-up rounding.
      logCase(TAG, "round(123.456, 1)");
      expect(NumberUtils.round(123.456, 1)).assertEqual(123.5);
      // Vector 13: round(999.999, 1) follows half-up rounding.
      logCase(TAG, "round(999.999, 1)");
      expect(NumberUtils.round(999.999, 1)).assertEqual(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_ROUND_0300
     * @tc.name      testRoundPlaces0002
     * @tc.desc      Verify round with 2 decimal places across representative values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testRoundPlaces0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testRoundPlaces0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: round(0, 2) follows half-up rounding.
      logCase(TAG, "round(0, 2)");
      expect(NumberUtils.round(0, 2)).assertEqual(0);
      // Vector 2: round(0.1, 2) follows half-up rounding.
      logCase(TAG, "round(0.1, 2)");
      expect(NumberUtils.round(0.1, 2)).assertEqual(0.1);
      // Vector 3: round(0.4, 2) follows half-up rounding.
      logCase(TAG, "round(0.4, 2)");
      expect(NumberUtils.round(0.4, 2)).assertEqual(0.4);
      // Vector 4: round(0.5, 2) follows half-up rounding.
      logCase(TAG, "round(0.5, 2)");
      expect(NumberUtils.round(0.5, 2)).assertEqual(0.5);
      // Vector 5: round(0.6, 2) follows half-up rounding.
      logCase(TAG, "round(0.6, 2)");
      expect(NumberUtils.round(0.6, 2)).assertEqual(0.6);
      // Vector 6: round(1.4, 2) follows half-up rounding.
      logCase(TAG, "round(1.4, 2)");
      expect(NumberUtils.round(1.4, 2)).assertEqual(1.4);
      // Vector 7: round(1.5, 2) follows half-up rounding.
      logCase(TAG, "round(1.5, 2)");
      expect(NumberUtils.round(1.5, 2)).assertEqual(1.5);
      // Vector 8: round(2.5, 2) follows half-up rounding.
      logCase(TAG, "round(2.5, 2)");
      expect(NumberUtils.round(2.5, 2)).assertEqual(2.5);
      // Vector 9: round(3.14159, 2) follows half-up rounding.
      logCase(TAG, "round(3.14159, 2)");
      expect(NumberUtils.round(3.14159, 2)).assertEqual(3.14);
      // Vector 10: round(9.999, 2) follows half-up rounding.
      logCase(TAG, "round(9.999, 2)");
      expect(NumberUtils.round(9.999, 2)).assertEqual(10);
      // Vector 11: round(10.05, 2) follows half-up rounding.
      logCase(TAG, "round(10.05, 2)");
      expect(NumberUtils.round(10.05, 2)).assertEqual(10.05);
      // Vector 12: round(123.456, 2) follows half-up rounding.
      logCase(TAG, "round(123.456, 2)");
      expect(NumberUtils.round(123.456, 2)).assertEqual(123.46);
      // Vector 13: round(999.999, 2) follows half-up rounding.
      logCase(TAG, "round(999.999, 2)");
      expect(NumberUtils.round(999.999, 2)).assertEqual(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_ROUND_0400
     * @tc.name      testRoundPlaces0003
     * @tc.desc      Verify round with 3 decimal places across representative values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoundPlaces0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoundPlaces0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: round(0, 3) follows half-up rounding.
      logCase(TAG, "round(0, 3)");
      expect(NumberUtils.round(0, 3)).assertEqual(0);
      // Vector 2: round(0.1, 3) follows half-up rounding.
      logCase(TAG, "round(0.1, 3)");
      expect(NumberUtils.round(0.1, 3)).assertEqual(0.1);
      // Vector 3: round(0.4, 3) follows half-up rounding.
      logCase(TAG, "round(0.4, 3)");
      expect(NumberUtils.round(0.4, 3)).assertEqual(0.4);
      // Vector 4: round(0.5, 3) follows half-up rounding.
      logCase(TAG, "round(0.5, 3)");
      expect(NumberUtils.round(0.5, 3)).assertEqual(0.5);
      // Vector 5: round(0.6, 3) follows half-up rounding.
      logCase(TAG, "round(0.6, 3)");
      expect(NumberUtils.round(0.6, 3)).assertEqual(0.6);
      // Vector 6: round(1.4, 3) follows half-up rounding.
      logCase(TAG, "round(1.4, 3)");
      expect(NumberUtils.round(1.4, 3)).assertEqual(1.4);
      // Vector 7: round(1.5, 3) follows half-up rounding.
      logCase(TAG, "round(1.5, 3)");
      expect(NumberUtils.round(1.5, 3)).assertEqual(1.5);
      // Vector 8: round(2.5, 3) follows half-up rounding.
      logCase(TAG, "round(2.5, 3)");
      expect(NumberUtils.round(2.5, 3)).assertEqual(2.5);
      // Vector 9: round(3.14159, 3) follows half-up rounding.
      logCase(TAG, "round(3.14159, 3)");
      expect(NumberUtils.round(3.14159, 3)).assertEqual(3.142);
      // Vector 10: round(9.999, 3) follows half-up rounding.
      logCase(TAG, "round(9.999, 3)");
      expect(NumberUtils.round(9.999, 3)).assertEqual(9.999);
      // Vector 11: round(10.05, 3) follows half-up rounding.
      logCase(TAG, "round(10.05, 3)");
      expect(NumberUtils.round(10.05, 3)).assertEqual(10.05);
      // Vector 12: round(123.456, 3) follows half-up rounding.
      logCase(TAG, "round(123.456, 3)");
      expect(NumberUtils.round(123.456, 3)).assertEqual(123.456);
      // Vector 13: round(999.999, 3) follows half-up rounding.
      logCase(TAG, "round(999.999, 3)");
      expect(NumberUtils.round(999.999, 3)).assertEqual(999.999);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_ROUND_0500
     * @tc.name      testRoundPlaces0004
     * @tc.desc      Verify round with 4 decimal places across representative values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoundPlaces0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoundPlaces0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: round(0, 4) follows half-up rounding.
      logCase(TAG, "round(0, 4)");
      expect(NumberUtils.round(0, 4)).assertEqual(0);
      // Vector 2: round(0.1, 4) follows half-up rounding.
      logCase(TAG, "round(0.1, 4)");
      expect(NumberUtils.round(0.1, 4)).assertEqual(0.1);
      // Vector 3: round(0.4, 4) follows half-up rounding.
      logCase(TAG, "round(0.4, 4)");
      expect(NumberUtils.round(0.4, 4)).assertEqual(0.4);
      // Vector 4: round(0.5, 4) follows half-up rounding.
      logCase(TAG, "round(0.5, 4)");
      expect(NumberUtils.round(0.5, 4)).assertEqual(0.5);
      // Vector 5: round(0.6, 4) follows half-up rounding.
      logCase(TAG, "round(0.6, 4)");
      expect(NumberUtils.round(0.6, 4)).assertEqual(0.6);
      // Vector 6: round(1.4, 4) follows half-up rounding.
      logCase(TAG, "round(1.4, 4)");
      expect(NumberUtils.round(1.4, 4)).assertEqual(1.4);
      // Vector 7: round(1.5, 4) follows half-up rounding.
      logCase(TAG, "round(1.5, 4)");
      expect(NumberUtils.round(1.5, 4)).assertEqual(1.5);
      // Vector 8: round(2.5, 4) follows half-up rounding.
      logCase(TAG, "round(2.5, 4)");
      expect(NumberUtils.round(2.5, 4)).assertEqual(2.5);
      // Vector 9: round(3.14159, 4) follows half-up rounding.
      logCase(TAG, "round(3.14159, 4)");
      expect(NumberUtils.round(3.14159, 4)).assertEqual(3.1416);
      // Vector 10: round(9.999, 4) follows half-up rounding.
      logCase(TAG, "round(9.999, 4)");
      expect(NumberUtils.round(9.999, 4)).assertEqual(9.999);
      // Vector 11: round(10.05, 4) follows half-up rounding.
      logCase(TAG, "round(10.05, 4)");
      expect(NumberUtils.round(10.05, 4)).assertEqual(10.05);
      // Vector 12: round(123.456, 4) follows half-up rounding.
      logCase(TAG, "round(123.456, 4)");
      expect(NumberUtils.round(123.456, 4)).assertEqual(123.456);
      // Vector 13: round(999.999, 4) follows half-up rounding.
      logCase(TAG, "round(999.999, 4)");
      expect(NumberUtils.round(999.999, 4)).assertEqual(999.999);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_ROUND_0600
     * @tc.name      testRoundNegative0001
     * @tc.desc      Verify round handles negative values without flipping the sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoundNegative0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoundNegative0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: round(-0.1, 2) handles negative values.
      logCase(TAG, "round(-0.1, 2)");
      expect(NumberUtils.round(-0.1, 2)).assertEqual(-0.1);
      // Vector 2: round(-0.5, 2) handles negative values.
      logCase(TAG, "round(-0.5, 2)");
      expect(NumberUtils.round(-0.5, 2)).assertEqual(-0.5);
      // Vector 3: round(-1.4, 2) handles negative values.
      logCase(TAG, "round(-1.4, 2)");
      expect(NumberUtils.round(-1.4, 2)).assertEqual(-1.4);
      // Vector 4: round(-2.5, 2) handles negative values.
      logCase(TAG, "round(-2.5, 2)");
      expect(NumberUtils.round(-2.5, 2)).assertEqual(-2.5);
      // Vector 5: round(-3.14159, 2) handles negative values.
      logCase(TAG, "round(-3.14159, 2)");
      expect(NumberUtils.round(-3.14159, 2)).assertEqual(-3.14);
      // Vector 6: round(-9.999, 2) handles negative values.
      logCase(TAG, "round(-9.999, 2)");
      expect(NumberUtils.round(-9.999, 2)).assertEqual(-10);
      // Vector 7: round(-123.456, 2) handles negative values.
      logCase(TAG, "round(-123.456, 2)");
      expect(NumberUtils.round(-123.456, 2)).assertEqual(-123.46);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_ROUND_0700
     * @tc.name      testRoundExactIntegers0001
     * @tc.desc      Verify round leaves exact integer values unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoundExactIntegers0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoundExactIntegers0001';
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
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_ROUND_0800
     * @tc.name      testRoundLargeMagnitude0001
     * @tc.desc      Verify round stays correct for large magnitudes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRoundLargeMagnitude0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRoundLargeMagnitude0001';
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
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
