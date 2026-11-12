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

// Registers every matrix case of the NumericMathSweepSuite suite.
export default function numericMathSweepTest() {
  // Group the cases under the "NumericMathSweepSuite" describe block.
  describe('NumericMathSweepSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'NumericMathSweepSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_MATH_0100
     * @tc.name      testMathSweepToRadians0001
     * @tc.desc      Verify toRadians converts a representative angle sweep into radians.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMathSweepToRadians0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMathSweepToRadians0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: toRadians(0) converts degrees into radians.
      logCase(TAG, "toRadians(0)");
      expect(Math.abs(NumberUtils.toRadians(0) - 0) < 1e-9).assertTrue();
      // Vector 2: toRadians(1) converts degrees into radians.
      logCase(TAG, "toRadians(1)");
      expect(Math.abs(NumberUtils.toRadians(1) - 0.017453292519943295) < 1e-9).assertTrue();
      // Vector 3: toRadians(15) converts degrees into radians.
      logCase(TAG, "toRadians(15)");
      expect(Math.abs(NumberUtils.toRadians(15) - 0.2617993877991494) < 1e-9).assertTrue();
      // Vector 4: toRadians(30) converts degrees into radians.
      logCase(TAG, "toRadians(30)");
      expect(Math.abs(NumberUtils.toRadians(30) - 0.5235987755982988) < 1e-9).assertTrue();
      // Vector 5: toRadians(45) converts degrees into radians.
      logCase(TAG, "toRadians(45)");
      expect(Math.abs(NumberUtils.toRadians(45) - 0.7853981633974483) < 1e-9).assertTrue();
      // Vector 6: toRadians(60) converts degrees into radians.
      logCase(TAG, "toRadians(60)");
      expect(Math.abs(NumberUtils.toRadians(60) - 1.0471975511965976) < 1e-9).assertTrue();
      // Vector 7: toRadians(90) converts degrees into radians.
      logCase(TAG, "toRadians(90)");
      expect(Math.abs(NumberUtils.toRadians(90) - 1.5707963267948966) < 1e-9).assertTrue();
      // Vector 8: toRadians(120) converts degrees into radians.
      logCase(TAG, "toRadians(120)");
      expect(Math.abs(NumberUtils.toRadians(120) - 2.0943951023931953) < 1e-9).assertTrue();
      // Vector 9: toRadians(135) converts degrees into radians.
      logCase(TAG, "toRadians(135)");
      expect(Math.abs(NumberUtils.toRadians(135) - 2.356194490192345) < 1e-9).assertTrue();
      // Vector 10: toRadians(150) converts degrees into radians.
      logCase(TAG, "toRadians(150)");
      expect(Math.abs(NumberUtils.toRadians(150) - 2.6179938779914944) < 1e-9).assertTrue();
      // Vector 11: toRadians(180) converts degrees into radians.
      logCase(TAG, "toRadians(180)");
      expect(Math.abs(NumberUtils.toRadians(180) - 3.141592653589793) < 1e-9).assertTrue();
      // Vector 12: toRadians(210) converts degrees into radians.
      logCase(TAG, "toRadians(210)");
      expect(Math.abs(NumberUtils.toRadians(210) - 3.6651914291880923) < 1e-9).assertTrue();
      // Vector 13: toRadians(270) converts degrees into radians.
      logCase(TAG, "toRadians(270)");
      expect(Math.abs(NumberUtils.toRadians(270) - 4.71238898038469) < 1e-9).assertTrue();
      // Vector 14: toRadians(300) converts degrees into radians.
      logCase(TAG, "toRadians(300)");
      expect(Math.abs(NumberUtils.toRadians(300) - 5.235987755982989) < 1e-9).assertTrue();
      // Vector 15: toRadians(330) converts degrees into radians.
      logCase(TAG, "toRadians(330)");
      expect(Math.abs(NumberUtils.toRadians(330) - 5.759586531581287) < 1e-9).assertTrue();
      // Vector 16: toRadians(360) converts degrees into radians.
      logCase(TAG, "toRadians(360)");
      expect(Math.abs(NumberUtils.toRadians(360) - 6.283185307179586) < 1e-9).assertTrue();
      // Vector 17: toRadians(720) converts degrees into radians.
      logCase(TAG, "toRadians(720)");
      expect(Math.abs(NumberUtils.toRadians(720) - 12.566370614359172) < 1e-9).assertTrue();
      // Vector 18: toRadians(-45) converts degrees into radians.
      logCase(TAG, "toRadians(-45)");
      expect(Math.abs(NumberUtils.toRadians(-45) - -0.7853981633974483) < 1e-9).assertTrue();
      // Vector 19: toRadians(-90) converts degrees into radians.
      logCase(TAG, "toRadians(-90)");
      expect(Math.abs(NumberUtils.toRadians(-90) - -1.5707963267948966) < 1e-9).assertTrue();
      // Vector 20: toRadians(-180) converts degrees into radians.
      logCase(TAG, "toRadians(-180)");
      expect(Math.abs(NumberUtils.toRadians(-180) - -3.141592653589793) < 1e-9).assertTrue();
      // Vector 21: toRadians(-360) converts degrees into radians.
      logCase(TAG, "toRadians(-360)");
      expect(Math.abs(NumberUtils.toRadians(-360) - -6.283185307179586) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_MATH_0200
     * @tc.name      testMathSweepToDegrees0001
     * @tc.desc      Verify toDegrees converts a representative radian sweep into degrees.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMathSweepToDegrees0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMathSweepToDegrees0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: toDegrees(0) converts radians into degrees.
      logCase(TAG, "toDegrees(0)");
      expect(Math.abs(NumberUtils.toDegrees(0) - 0) < 1e-9).assertTrue();
      // Vector 2: toDegrees(0.1) converts radians into degrees.
      logCase(TAG, "toDegrees(0.1)");
      expect(Math.abs(NumberUtils.toDegrees(0.1) - 5.729577951308233) < 1e-9).assertTrue();
      // Vector 3: toDegrees(0.5) converts radians into degrees.
      logCase(TAG, "toDegrees(0.5)");
      expect(Math.abs(NumberUtils.toDegrees(0.5) - 28.64788975654116) < 1e-9).assertTrue();
      // Vector 4: toDegrees(1) converts radians into degrees.
      logCase(TAG, "toDegrees(1)");
      expect(Math.abs(NumberUtils.toDegrees(1) - 57.29577951308232) < 1e-9).assertTrue();
      // Vector 5: toDegrees(1.5707963267948966) converts radians into degrees.
      logCase(TAG, "toDegrees(1.5707963267948966)");
      expect(Math.abs(NumberUtils.toDegrees(1.5707963267948966) - 90) < 1e-9).assertTrue();
      // Vector 6: toDegrees(2) converts radians into degrees.
      logCase(TAG, "toDegrees(2)");
      expect(Math.abs(NumberUtils.toDegrees(2) - 114.59155902616465) < 1e-9).assertTrue();
      // Vector 7: toDegrees(3.141592653589793) converts radians into degrees.
      logCase(TAG, "toDegrees(3.141592653589793)");
      expect(Math.abs(NumberUtils.toDegrees(3.141592653589793) - 180) < 1e-9).assertTrue();
      // Vector 8: toDegrees(4) converts radians into degrees.
      logCase(TAG, "toDegrees(4)");
      expect(Math.abs(NumberUtils.toDegrees(4) - 229.1831180523293) < 1e-9).assertTrue();
      // Vector 9: toDegrees(6.283185307179586) converts radians into degrees.
      logCase(TAG, "toDegrees(6.283185307179586)");
      expect(Math.abs(NumberUtils.toDegrees(6.283185307179586) - 360) < 1e-9).assertTrue();
      // Vector 10: toDegrees(-1) converts radians into degrees.
      logCase(TAG, "toDegrees(-1)");
      expect(Math.abs(NumberUtils.toDegrees(-1) - -57.29577951308232) < 1e-9).assertTrue();
      // Vector 11: toDegrees(-3.141592653589793) converts radians into degrees.
      logCase(TAG, "toDegrees(-3.141592653589793)");
      expect(Math.abs(NumberUtils.toDegrees(-3.141592653589793) - -180) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_MATH_0300
     * @tc.name      testMathSweepPercent0001
     * @tc.desc      Verify percentText formats ratios at zero through four decimal digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMathSweepPercent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMathSweepPercent0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: percentText(0, 0) formats the ratio.
      logCase(TAG, "percentText(0, 0)");
      expect(NumberUtils.percentText(0, 0)).assertEqual("0%");
      // Vector 2: percentText(0.01, 0) formats the ratio.
      logCase(TAG, "percentText(0.01, 0)");
      expect(NumberUtils.percentText(0.01, 0)).assertEqual("1%");
      // Vector 3: percentText(0.1, 0) formats the ratio.
      logCase(TAG, "percentText(0.1, 0)");
      expect(NumberUtils.percentText(0.1, 0)).assertEqual("10%");
      // Vector 4: percentText(0.125, 0) formats the ratio.
      logCase(TAG, "percentText(0.125, 0)");
      expect(NumberUtils.percentText(0.125, 0)).assertEqual("13%");
      // Vector 5: percentText(0.25, 0) formats the ratio.
      logCase(TAG, "percentText(0.25, 0)");
      expect(NumberUtils.percentText(0.25, 0)).assertEqual("25%");
      // Vector 6: percentText(0.3333, 0) formats the ratio.
      logCase(TAG, "percentText(0.3333, 0)");
      expect(NumberUtils.percentText(0.3333, 0)).assertEqual("33%");
      // Vector 7: percentText(0.5, 0) formats the ratio.
      logCase(TAG, "percentText(0.5, 0)");
      expect(NumberUtils.percentText(0.5, 0)).assertEqual("50%");
      // Vector 8: percentText(0.75, 0) formats the ratio.
      logCase(TAG, "percentText(0.75, 0)");
      expect(NumberUtils.percentText(0.75, 0)).assertEqual("75%");
      // Vector 9: percentText(0.999, 0) formats the ratio.
      logCase(TAG, "percentText(0.999, 0)");
      expect(NumberUtils.percentText(0.999, 0)).assertEqual("100%");
      // Vector 10: percentText(1, 0) formats the ratio.
      logCase(TAG, "percentText(1, 0)");
      expect(NumberUtils.percentText(1, 0)).assertEqual("100%");
      // Vector 11: percentText(1.5, 0) formats the ratio.
      logCase(TAG, "percentText(1.5, 0)");
      expect(NumberUtils.percentText(1.5, 0)).assertEqual("150%");
      // Vector 12: percentText(-0.25, 0) formats the ratio.
      logCase(TAG, "percentText(-0.25, 0)");
      expect(NumberUtils.percentText(-0.25, 0)).assertEqual("-25%");
      // Vector 13: percentText(0, 1) formats the ratio.
      logCase(TAG, "percentText(0, 1)");
      expect(NumberUtils.percentText(0, 1)).assertEqual("0%");
      // Vector 14: percentText(0.01, 1) formats the ratio.
      logCase(TAG, "percentText(0.01, 1)");
      expect(NumberUtils.percentText(0.01, 1)).assertEqual("1%");
      // Vector 15: percentText(0.1, 1) formats the ratio.
      logCase(TAG, "percentText(0.1, 1)");
      expect(NumberUtils.percentText(0.1, 1)).assertEqual("10%");
      // Vector 16: percentText(0.125, 1) formats the ratio.
      logCase(TAG, "percentText(0.125, 1)");
      expect(NumberUtils.percentText(0.125, 1)).assertEqual("12.5%");
      // Vector 17: percentText(0.25, 1) formats the ratio.
      logCase(TAG, "percentText(0.25, 1)");
      expect(NumberUtils.percentText(0.25, 1)).assertEqual("25%");
      // Vector 18: percentText(0.3333, 1) formats the ratio.
      logCase(TAG, "percentText(0.3333, 1)");
      expect(NumberUtils.percentText(0.3333, 1)).assertEqual("33.3%");
      // Vector 19: percentText(0.5, 1) formats the ratio.
      logCase(TAG, "percentText(0.5, 1)");
      expect(NumberUtils.percentText(0.5, 1)).assertEqual("50%");
      // Vector 20: percentText(0.75, 1) formats the ratio.
      logCase(TAG, "percentText(0.75, 1)");
      expect(NumberUtils.percentText(0.75, 1)).assertEqual("75%");
      // Vector 21: percentText(0.999, 1) formats the ratio.
      logCase(TAG, "percentText(0.999, 1)");
      expect(NumberUtils.percentText(0.999, 1)).assertEqual("99.9%");
      // Vector 22: percentText(1, 1) formats the ratio.
      logCase(TAG, "percentText(1, 1)");
      expect(NumberUtils.percentText(1, 1)).assertEqual("100%");
      // Vector 23: percentText(1.5, 1) formats the ratio.
      logCase(TAG, "percentText(1.5, 1)");
      expect(NumberUtils.percentText(1.5, 1)).assertEqual("150%");
      // Vector 24: percentText(-0.25, 1) formats the ratio.
      logCase(TAG, "percentText(-0.25, 1)");
      expect(NumberUtils.percentText(-0.25, 1)).assertEqual("-25%");
      // Vector 25: percentText(0, 2) formats the ratio.
      logCase(TAG, "percentText(0, 2)");
      expect(NumberUtils.percentText(0, 2)).assertEqual("0%");
      // Vector 26: percentText(0.01, 2) formats the ratio.
      logCase(TAG, "percentText(0.01, 2)");
      expect(NumberUtils.percentText(0.01, 2)).assertEqual("1%");
      // Vector 27: percentText(0.1, 2) formats the ratio.
      logCase(TAG, "percentText(0.1, 2)");
      expect(NumberUtils.percentText(0.1, 2)).assertEqual("10%");
      // Vector 28: percentText(0.125, 2) formats the ratio.
      logCase(TAG, "percentText(0.125, 2)");
      expect(NumberUtils.percentText(0.125, 2)).assertEqual("12.5%");
      // Vector 29: percentText(0.25, 2) formats the ratio.
      logCase(TAG, "percentText(0.25, 2)");
      expect(NumberUtils.percentText(0.25, 2)).assertEqual("25%");
      // Vector 30: percentText(0.3333, 2) formats the ratio.
      logCase(TAG, "percentText(0.3333, 2)");
      expect(NumberUtils.percentText(0.3333, 2)).assertEqual("33.33%");
      // Vector 31: percentText(0.5, 2) formats the ratio.
      logCase(TAG, "percentText(0.5, 2)");
      expect(NumberUtils.percentText(0.5, 2)).assertEqual("50%");
      // Vector 32: percentText(0.75, 2) formats the ratio.
      logCase(TAG, "percentText(0.75, 2)");
      expect(NumberUtils.percentText(0.75, 2)).assertEqual("75%");
      // Vector 33: percentText(0.999, 2) formats the ratio.
      logCase(TAG, "percentText(0.999, 2)");
      expect(NumberUtils.percentText(0.999, 2)).assertEqual("99.9%");
      // Vector 34: percentText(1, 2) formats the ratio.
      logCase(TAG, "percentText(1, 2)");
      expect(NumberUtils.percentText(1, 2)).assertEqual("100%");
      // Vector 35: percentText(1.5, 2) formats the ratio.
      logCase(TAG, "percentText(1.5, 2)");
      expect(NumberUtils.percentText(1.5, 2)).assertEqual("150%");
      // Vector 36: percentText(-0.25, 2) formats the ratio.
      logCase(TAG, "percentText(-0.25, 2)");
      expect(NumberUtils.percentText(-0.25, 2)).assertEqual("-25%");
      // Vector 37: percentText(0, 3) formats the ratio.
      logCase(TAG, "percentText(0, 3)");
      expect(NumberUtils.percentText(0, 3)).assertEqual("0%");
      // Vector 38: percentText(0.01, 3) formats the ratio.
      logCase(TAG, "percentText(0.01, 3)");
      expect(NumberUtils.percentText(0.01, 3)).assertEqual("1%");
      // Vector 39: percentText(0.1, 3) formats the ratio.
      logCase(TAG, "percentText(0.1, 3)");
      expect(NumberUtils.percentText(0.1, 3)).assertEqual("10%");
      // Vector 40: percentText(0.125, 3) formats the ratio.
      logCase(TAG, "percentText(0.125, 3)");
      expect(NumberUtils.percentText(0.125, 3)).assertEqual("12.5%");
      // Vector 41: percentText(0.25, 3) formats the ratio.
      logCase(TAG, "percentText(0.25, 3)");
      expect(NumberUtils.percentText(0.25, 3)).assertEqual("25%");
      // Vector 42: percentText(0.3333, 3) formats the ratio.
      logCase(TAG, "percentText(0.3333, 3)");
      expect(NumberUtils.percentText(0.3333, 3)).assertEqual("33.33%");
      // Vector 43: percentText(0.5, 3) formats the ratio.
      logCase(TAG, "percentText(0.5, 3)");
      expect(NumberUtils.percentText(0.5, 3)).assertEqual("50%");
      // Vector 44: percentText(0.75, 3) formats the ratio.
      logCase(TAG, "percentText(0.75, 3)");
      expect(NumberUtils.percentText(0.75, 3)).assertEqual("75%");
      // Vector 45: percentText(0.999, 3) formats the ratio.
      logCase(TAG, "percentText(0.999, 3)");
      expect(NumberUtils.percentText(0.999, 3)).assertEqual("99.9%");
      // Vector 46: percentText(1, 3) formats the ratio.
      logCase(TAG, "percentText(1, 3)");
      expect(NumberUtils.percentText(1, 3)).assertEqual("100%");
      // Vector 47: percentText(1.5, 3) formats the ratio.
      logCase(TAG, "percentText(1.5, 3)");
      expect(NumberUtils.percentText(1.5, 3)).assertEqual("150%");
      // Vector 48: percentText(-0.25, 3) formats the ratio.
      logCase(TAG, "percentText(-0.25, 3)");
      expect(NumberUtils.percentText(-0.25, 3)).assertEqual("-25%");
      // Vector 49: percentText(0, 4) formats the ratio.
      logCase(TAG, "percentText(0, 4)");
      expect(NumberUtils.percentText(0, 4)).assertEqual("0%");
      // Vector 50: percentText(0.01, 4) formats the ratio.
      logCase(TAG, "percentText(0.01, 4)");
      expect(NumberUtils.percentText(0.01, 4)).assertEqual("1%");
      // Vector 51: percentText(0.1, 4) formats the ratio.
      logCase(TAG, "percentText(0.1, 4)");
      expect(NumberUtils.percentText(0.1, 4)).assertEqual("10%");
      // Vector 52: percentText(0.125, 4) formats the ratio.
      logCase(TAG, "percentText(0.125, 4)");
      expect(NumberUtils.percentText(0.125, 4)).assertEqual("12.5%");
      // Vector 53: percentText(0.25, 4) formats the ratio.
      logCase(TAG, "percentText(0.25, 4)");
      expect(NumberUtils.percentText(0.25, 4)).assertEqual("25%");
      // Vector 54: percentText(0.3333, 4) formats the ratio.
      logCase(TAG, "percentText(0.3333, 4)");
      expect(NumberUtils.percentText(0.3333, 4)).assertEqual("33.33%");
      // Vector 55: percentText(0.5, 4) formats the ratio.
      logCase(TAG, "percentText(0.5, 4)");
      expect(NumberUtils.percentText(0.5, 4)).assertEqual("50%");
      // Vector 56: percentText(0.75, 4) formats the ratio.
      logCase(TAG, "percentText(0.75, 4)");
      expect(NumberUtils.percentText(0.75, 4)).assertEqual("75%");
      // Vector 57: percentText(0.999, 4) formats the ratio.
      logCase(TAG, "percentText(0.999, 4)");
      expect(NumberUtils.percentText(0.999, 4)).assertEqual("99.9%");
      // Vector 58: percentText(1, 4) formats the ratio.
      logCase(TAG, "percentText(1, 4)");
      expect(NumberUtils.percentText(1, 4)).assertEqual("100%");
      // Vector 59: percentText(1.5, 4) formats the ratio.
      logCase(TAG, "percentText(1.5, 4)");
      expect(NumberUtils.percentText(1.5, 4)).assertEqual("150%");
      // Vector 60: percentText(-0.25, 4) formats the ratio.
      logCase(TAG, "percentText(-0.25, 4)");
      expect(NumberUtils.percentText(-0.25, 4)).assertEqual("-25%");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
