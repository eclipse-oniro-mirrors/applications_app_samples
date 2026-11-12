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

// Registers every matrix case of the NumericBoundaryMatrixSuite suite.
export default function numericBoundaryMatrixTest() {
  // Group the cases under the "NumericBoundaryMatrixSuite" describe block.
  describe('NumericBoundaryMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'NumericBoundaryMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_BOUND_0100
     * @tc.name      testBoundaryFileSizeUnits0001
     * @tc.desc      Verify every 1024 boundary still prints a byte based unit suffix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBoundaryFileSizeUnits0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBoundaryFileSizeUnits0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: fileSizeText boundary 0 keeps a unit suffix.
      logCase(TAG, "fileSizeText boundary 0");
      expect(NumberUtils.fileSizeText(0).indexOf('B') > 0).assertTrue();
      // Vector 2: fileSizeText boundary 1 keeps a unit suffix.
      logCase(TAG, "fileSizeText boundary 1");
      expect(NumberUtils.fileSizeText(1).indexOf('B') > 0).assertTrue();
      // Vector 3: fileSizeText boundary 1023 keeps a unit suffix.
      logCase(TAG, "fileSizeText boundary 1023");
      expect(NumberUtils.fileSizeText(1023).indexOf('B') > 0).assertTrue();
      // Vector 4: fileSizeText boundary 1024 keeps a unit suffix.
      logCase(TAG, "fileSizeText boundary 1024");
      expect(NumberUtils.fileSizeText(1024).indexOf('B') > 0).assertTrue();
      // Vector 5: fileSizeText boundary 1048576 keeps a unit suffix.
      logCase(TAG, "fileSizeText boundary 1048576");
      expect(NumberUtils.fileSizeText(1048576).indexOf('B') > 0).assertTrue();
      // Vector 6: fileSizeText boundary 1073741824 keeps a unit suffix.
      logCase(TAG, "fileSizeText boundary 1073741824");
      expect(NumberUtils.fileSizeText(1073741824).indexOf('B') > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_BOUND_0200
     * @tc.name      testBoundaryPercentSuffix0001
     * @tc.desc      Verify percentText keeps the percent suffix across decimal boundaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBoundaryPercentSuffix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBoundaryPercentSuffix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: percentText boundary 0 keeps the percent suffix.
      logCase(TAG, "percentText boundary 0");
      expect(NumberUtils.percentText(0, 2).indexOf('%') > 0).assertTrue();
      // Vector 2: percentText boundary 0.5 keeps the percent suffix.
      logCase(TAG, "percentText boundary 0.5");
      expect(NumberUtils.percentText(0.5, 2).indexOf('%') > 0).assertTrue();
      // Vector 3: percentText boundary 1 keeps the percent suffix.
      logCase(TAG, "percentText boundary 1");
      expect(NumberUtils.percentText(1, 2).indexOf('%') > 0).assertTrue();
      // Vector 4: percentText boundary 9.99 keeps the percent suffix.
      logCase(TAG, "percentText boundary 9.99");
      expect(NumberUtils.percentText(9.99, 2).indexOf('%') > 0).assertTrue();
      // Vector 5: percentText boundary 10.01 keeps the percent suffix.
      logCase(TAG, "percentText boundary 10.01");
      expect(NumberUtils.percentText(10.01, 2).indexOf('%') > 0).assertTrue();
      // Vector 6: percentText boundary 99.99 keeps the percent suffix.
      logCase(TAG, "percentText boundary 99.99");
      expect(NumberUtils.percentText(99.99, 2).indexOf('%') > 0).assertTrue();
      // Vector 7: percentText boundary 100.01 keeps the percent suffix.
      logCase(TAG, "percentText boundary 100.01");
      expect(NumberUtils.percentText(100.01, 2).indexOf('%') > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_BOUND_0300
     * @tc.name      testBoundaryAngleRoundTrip0001
     * @tc.desc      Verify angle conversion round trips at every quadrant boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBoundaryAngleRoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBoundaryAngleRoundTrip0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: angle boundary 0 round trips within tolerance.
      logCase(TAG, "angle boundary 0");
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(0)) - 0) < 1e-9).assertTrue();
      // Vector 2: angle boundary 1 round trips within tolerance.
      logCase(TAG, "angle boundary 1");
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(1)) - 1) < 1e-9).assertTrue();
      // Vector 3: angle boundary 15 round trips within tolerance.
      logCase(TAG, "angle boundary 15");
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(15)) - 15) < 1e-9).assertTrue();
      // Vector 4: angle boundary 30 round trips within tolerance.
      logCase(TAG, "angle boundary 30");
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(30)) - 30) < 1e-9).assertTrue();
      // Vector 5: angle boundary 45 round trips within tolerance.
      logCase(TAG, "angle boundary 45");
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(45)) - 45) < 1e-9).assertTrue();
      // Vector 6: angle boundary 60 round trips within tolerance.
      logCase(TAG, "angle boundary 60");
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(60)) - 60) < 1e-9).assertTrue();
      // Vector 7: angle boundary 90 round trips within tolerance.
      logCase(TAG, "angle boundary 90");
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(90)) - 90) < 1e-9).assertTrue();
      // Vector 8: angle boundary 180 round trips within tolerance.
      logCase(TAG, "angle boundary 180");
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(180)) - 180) < 1e-9).assertTrue();
      // Vector 9: angle boundary 360 round trips within tolerance.
      logCase(TAG, "angle boundary 360");
      expect(Math.abs(NumberUtils.toDegrees(NumberUtils.toRadians(360)) - 360) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
