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

// Registers every matrix case of the NumericAngleMatrixSuite suite.
export default function numericAngleMatrixTest() {
  // Group the cases under the "NumericAngleMatrixSuite" describe block.
  describe('NumericAngleMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'NumericAngleMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_ANGLE_0100
     * @tc.name      testAngleToRadians0001
     * @tc.desc      Verify toRadians converts degrees into radians precisely.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAngleToRadians0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testAngleToRadians0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: toRadians(0) matches the mathematical conversion.
      logCase(TAG, "toRadians(0)");
      expect(Math.abs(NumberUtils.toRadians(0) - 0) < 1e-9).assertTrue();
      // Vector 2: toRadians(30) matches the mathematical conversion.
      logCase(TAG, "toRadians(30)");
      expect(Math.abs(NumberUtils.toRadians(30) - 0.5235987755982988) < 1e-9).assertTrue();
      // Vector 3: toRadians(45) matches the mathematical conversion.
      logCase(TAG, "toRadians(45)");
      expect(Math.abs(NumberUtils.toRadians(45) - 0.7853981633974483) < 1e-9).assertTrue();
      // Vector 4: toRadians(60) matches the mathematical conversion.
      logCase(TAG, "toRadians(60)");
      expect(Math.abs(NumberUtils.toRadians(60) - 1.0471975511965976) < 1e-9).assertTrue();
      // Vector 5: toRadians(90) matches the mathematical conversion.
      logCase(TAG, "toRadians(90)");
      expect(Math.abs(NumberUtils.toRadians(90) - 1.5707963267948966) < 1e-9).assertTrue();
      // Vector 6: toRadians(180) matches the mathematical conversion.
      logCase(TAG, "toRadians(180)");
      expect(Math.abs(NumberUtils.toRadians(180) - 3.141592653589793) < 1e-9).assertTrue();
      // Vector 7: toRadians(270) matches the mathematical conversion.
      logCase(TAG, "toRadians(270)");
      expect(Math.abs(NumberUtils.toRadians(270) - 4.71238898038469) < 1e-9).assertTrue();
      // Vector 8: toRadians(360) matches the mathematical conversion.
      logCase(TAG, "toRadians(360)");
      expect(Math.abs(NumberUtils.toRadians(360) - 6.283185307179586) < 1e-9).assertTrue();
      // Vector 9: toRadians(-90) matches the mathematical conversion.
      logCase(TAG, "toRadians(-90)");
      expect(Math.abs(NumberUtils.toRadians(-90) - -1.5707963267948966) < 1e-9).assertTrue();
      // Vector 10: toRadians(-180) matches the mathematical conversion.
      logCase(TAG, "toRadians(-180)");
      expect(Math.abs(NumberUtils.toRadians(-180) - -3.141592653589793) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_ANGLE_0200
     * @tc.name      testAngleToDegrees0001
     * @tc.desc      Verify toDegrees converts radians into degrees precisely.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAngleToDegrees0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testAngleToDegrees0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: toDegrees(0) matches the mathematical conversion.
      logCase(TAG, "toDegrees(0)");
      expect(Math.abs(NumberUtils.toDegrees(0) - 0) < 1e-9).assertTrue();
      // Vector 2: toDegrees(0.5235987755982988) matches the mathematical conversion.
      logCase(TAG, "toDegrees(0.5235987755982988)");
      expect(Math.abs(NumberUtils.toDegrees(0.5235987755982988) - 29.999999999999996) < 1e-9).assertTrue();
      // Vector 3: toDegrees(0.7853981633974483) matches the mathematical conversion.
      logCase(TAG, "toDegrees(0.7853981633974483)");
      expect(Math.abs(NumberUtils.toDegrees(0.7853981633974483) - 45) < 1e-9).assertTrue();
      // Vector 4: toDegrees(1.0471975511965976) matches the mathematical conversion.
      logCase(TAG, "toDegrees(1.0471975511965976)");
      expect(Math.abs(NumberUtils.toDegrees(1.0471975511965976) - 59.99999999999999) < 1e-9).assertTrue();
      // Vector 5: toDegrees(1.5707963267948966) matches the mathematical conversion.
      logCase(TAG, "toDegrees(1.5707963267948966)");
      expect(Math.abs(NumberUtils.toDegrees(1.5707963267948966) - 90) < 1e-9).assertTrue();
      // Vector 6: toDegrees(3.141592653589793) matches the mathematical conversion.
      logCase(TAG, "toDegrees(3.141592653589793)");
      expect(Math.abs(NumberUtils.toDegrees(3.141592653589793) - 180) < 1e-9).assertTrue();
      // Vector 7: toDegrees(6.283185307179586) matches the mathematical conversion.
      logCase(TAG, "toDegrees(6.283185307179586)");
      expect(Math.abs(NumberUtils.toDegrees(6.283185307179586) - 360) < 1e-9).assertTrue();
      // Vector 8: toDegrees(-1.5707963267948966) matches the mathematical conversion.
      logCase(TAG, "toDegrees(-1.5707963267948966)");
      expect(Math.abs(NumberUtils.toDegrees(-1.5707963267948966) - -90) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_ANGLE_0300
     * @tc.name      testAngleRoundTrip0001
     * @tc.desc      Verify the degree to radian round trip preserves the original value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAngleRoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testAngleRoundTrip0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: degree to radian to degree round trip for 0.
      logCase(TAG, "angle round trip 0");
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(0)) - 0) < 1e-9).assertTrue();
      // Vector 2: degree to radian to degree round trip for 15.
      logCase(TAG, "angle round trip 15");
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(15)) - 15) < 1e-9).assertTrue();
      // Vector 3: degree to radian to degree round trip for 30.
      logCase(TAG, "angle round trip 30");
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(30)) - 30) < 1e-9).assertTrue();
      // Vector 4: degree to radian to degree round trip for 45.
      logCase(TAG, "angle round trip 45");
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(45)) - 45) < 1e-9).assertTrue();
      // Vector 5: degree to radian to degree round trip for 60.
      logCase(TAG, "angle round trip 60");
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(60)) - 60) < 1e-9).assertTrue();
      // Vector 6: degree to radian to degree round trip for 90.
      logCase(TAG, "angle round trip 90");
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(90)) - 90) < 1e-9).assertTrue();
      // Vector 7: degree to radian to degree round trip for 120.
      logCase(TAG, "angle round trip 120");
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(120)) - 120) < 1e-9).assertTrue();
      // Vector 8: degree to radian to degree round trip for 180.
      logCase(TAG, "angle round trip 180");
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(180)) - 180) < 1e-9).assertTrue();
      // Vector 9: degree to radian to degree round trip for 270.
      logCase(TAG, "angle round trip 270");
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(270)) - 270) < 1e-9).assertTrue();
      // Vector 10: degree to radian to degree round trip for 360.
      logCase(TAG, "angle round trip 360");
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(360)) - 360) < 1e-9).assertTrue();
      // Vector 11: degree to radian to degree round trip for -45.
      logCase(TAG, "angle round trip -45");
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(-45)) - -45) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
