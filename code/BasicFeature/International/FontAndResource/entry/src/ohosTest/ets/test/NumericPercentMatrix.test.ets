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

// Registers every matrix case of the NumericPercentMatrixSuite suite.
export default function numericPercentMatrixTest() {
  // Group the cases under the "NumericPercentMatrixSuite" describe block.
  describe('NumericPercentMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'NumericPercentMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_PCT_0100
     * @tc.name      testPercentZeroPlaces0001
     * @tc.desc      Verify percentText scales the ratio and appends the percent suffix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPercentZeroPlaces0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPercentZeroPlaces0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: percentText(0, 0) returns 0%.
      logCase(TAG, "percentText(0, 0)");
      expect(NumberUtils.percentText(0, 0)).assertEqual("0%");
      // Vector 2: percentText(0.001, 0) returns 0%.
      logCase(TAG, "percentText(0.001, 0)");
      expect(NumberUtils.percentText(0.001, 0)).assertEqual("0%");
      // Vector 3: percentText(0.01, 0) returns 1%.
      logCase(TAG, "percentText(0.01, 0)");
      expect(NumberUtils.percentText(0.01, 0)).assertEqual("1%");
      // Vector 4: percentText(0.1, 0) returns 10%.
      logCase(TAG, "percentText(0.1, 0)");
      expect(NumberUtils.percentText(0.1, 0)).assertEqual("10%");
      // Vector 5: percentText(0.5, 0) returns 50%.
      logCase(TAG, "percentText(0.5, 0)");
      expect(NumberUtils.percentText(0.5, 0)).assertEqual("50%");
      // Vector 6: percentText(1, 0) returns 100%.
      logCase(TAG, "percentText(1, 0)");
      expect(NumberUtils.percentText(1, 0)).assertEqual("100%");
      // Vector 7: percentText(1.5, 0) returns 150%.
      logCase(TAG, "percentText(1.5, 0)");
      expect(NumberUtils.percentText(1.5, 0)).assertEqual("150%");
      // Vector 8: percentText(-0.25, 0) returns -25%.
      logCase(TAG, "percentText(-0.25, 0)");
      expect(NumberUtils.percentText(-0.25, 0)).assertEqual("-25%");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_PCT_0200
     * @tc.name      testPercentOnePlace0001
     * @tc.desc      Verify percentText scales the ratio and appends the percent suffix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPercentOnePlace0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPercentOnePlace0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: percentText(0, 1) returns 0%.
      logCase(TAG, "percentText(0, 1)");
      expect(NumberUtils.percentText(0, 1)).assertEqual("0%");
      // Vector 2: percentText(0.001, 1) returns 0.1%.
      logCase(TAG, "percentText(0.001, 1)");
      expect(NumberUtils.percentText(0.001, 1)).assertEqual("0.1%");
      // Vector 3: percentText(0.01, 1) returns 1%.
      logCase(TAG, "percentText(0.01, 1)");
      expect(NumberUtils.percentText(0.01, 1)).assertEqual("1%");
      // Vector 4: percentText(0.1, 1) returns 10%.
      logCase(TAG, "percentText(0.1, 1)");
      expect(NumberUtils.percentText(0.1, 1)).assertEqual("10%");
      // Vector 5: percentText(0.123, 1) returns 12.3%.
      logCase(TAG, "percentText(0.123, 1)");
      expect(NumberUtils.percentText(0.123, 1)).assertEqual("12.3%");
      // Vector 6: percentText(0.999, 1) returns 99.9%.
      logCase(TAG, "percentText(0.999, 1)");
      expect(NumberUtils.percentText(0.999, 1)).assertEqual("99.9%");
      // Vector 7: percentText(1, 1) returns 100%.
      logCase(TAG, "percentText(1, 1)");
      expect(NumberUtils.percentText(1, 1)).assertEqual("100%");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_PCT_0300
     * @tc.name      testPercentTwoPlaces0001
     * @tc.desc      Verify percentText scales the ratio and appends the percent suffix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPercentTwoPlaces0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPercentTwoPlaces0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: percentText(0, 2) returns 0%.
      logCase(TAG, "percentText(0, 2)");
      expect(NumberUtils.percentText(0, 2)).assertEqual("0%");
      // Vector 2: percentText(0.001, 2) returns 0.1%.
      logCase(TAG, "percentText(0.001, 2)");
      expect(NumberUtils.percentText(0.001, 2)).assertEqual("0.1%");
      // Vector 3: percentText(0.0123, 2) returns 1.23%.
      logCase(TAG, "percentText(0.0123, 2)");
      expect(NumberUtils.percentText(0.0123, 2)).assertEqual("1.23%");
      // Vector 4: percentText(0.1234, 2) returns 12.34%.
      logCase(TAG, "percentText(0.1234, 2)");
      expect(NumberUtils.percentText(0.1234, 2)).assertEqual("12.34%");
      // Vector 5: percentText(0.9999, 2) returns 99.99%.
      logCase(TAG, "percentText(0.9999, 2)");
      expect(NumberUtils.percentText(0.9999, 2)).assertEqual("99.99%");
      // Vector 6: percentText(1, 2) returns 100%.
      logCase(TAG, "percentText(1, 2)");
      expect(NumberUtils.percentText(1, 2)).assertEqual("100%");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_PCT_0400
     * @tc.name      testPercentThreePlaces0001
     * @tc.desc      Verify percentText scales the ratio and appends the percent suffix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPercentThreePlaces0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPercentThreePlaces0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: percentText(0, 3) returns 0%.
      logCase(TAG, "percentText(0, 3)");
      expect(NumberUtils.percentText(0, 3)).assertEqual("0%");
      // Vector 2: percentText(0.0001, 3) returns 0.01%.
      logCase(TAG, "percentText(0.0001, 3)");
      expect(NumberUtils.percentText(0.0001, 3)).assertEqual("0.01%");
      // Vector 3: percentText(0.00123, 3) returns 0.123%.
      logCase(TAG, "percentText(0.00123, 3)");
      expect(NumberUtils.percentText(0.00123, 3)).assertEqual("0.123%");
      // Vector 4: percentText(0.12345, 3) returns 12.345%.
      logCase(TAG, "percentText(0.12345, 3)");
      expect(NumberUtils.percentText(0.12345, 3)).assertEqual("12.345%");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_PCT_0500
     * @tc.name      testPercentNegative0001
     * @tc.desc      Verify percentText scales the ratio and appends the percent suffix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPercentNegative0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPercentNegative0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: percentText(-0.01, 2) returns -1%.
      logCase(TAG, "percentText(-0.01, 2)");
      expect(NumberUtils.percentText(-0.01, 2)).assertEqual("-1%");
      // Vector 2: percentText(-0.1, 2) returns -10%.
      logCase(TAG, "percentText(-0.1, 2)");
      expect(NumberUtils.percentText(-0.1, 2)).assertEqual("-10%");
      // Vector 3: percentText(-0.5, 2) returns -50%.
      logCase(TAG, "percentText(-0.5, 2)");
      expect(NumberUtils.percentText(-0.5, 2)).assertEqual("-50%");
      // Vector 4: percentText(-1, 2) returns -100%.
      logCase(TAG, "percentText(-1, 2)");
      expect(NumberUtils.percentText(-1, 2)).assertEqual("-100%");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_PCT_0600
     * @tc.name      testPercentLarge0001
     * @tc.desc      Verify percentText scales the ratio and appends the percent suffix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPercentLarge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPercentLarge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: percentText(2, 1) returns 200%.
      logCase(TAG, "percentText(2, 1)");
      expect(NumberUtils.percentText(2, 1)).assertEqual("200%");
      // Vector 2: percentText(10, 1) returns 1000%.
      logCase(TAG, "percentText(10, 1)");
      expect(NumberUtils.percentText(10, 1)).assertEqual("1000%");
      // Vector 3: percentText(100, 1) returns 10000%.
      logCase(TAG, "percentText(100, 1)");
      expect(NumberUtils.percentText(100, 1)).assertEqual("10000%");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
