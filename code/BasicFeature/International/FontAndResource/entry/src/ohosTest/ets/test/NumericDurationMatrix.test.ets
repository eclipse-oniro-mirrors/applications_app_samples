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

// Registers every matrix case of the NumericDurationMatrixSuite suite.
export default function numericDurationMatrixTest() {
  // Group the cases under the "NumericDurationMatrixSuite" describe block.
  describe('NumericDurationMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'NumericDurationMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DUR_0100
     * @tc.name      testDurationSubSecond0001
     * @tc.desc      Verify durationMsText formatting across the millisecond range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDurationSubSecond0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDurationSubSecond0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: durationMsText(0) returns 0 ms.
      logCase(TAG, "durationMsText(0)");
      expect(NumberUtils.durationMsText(0)).assertEqual("0 ms");
      // Vector 2: durationMsText(0.1) returns 0.1 ms.
      logCase(TAG, "durationMsText(0.1)");
      expect(NumberUtils.durationMsText(0.1)).assertEqual("0.1 ms");
      // Vector 3: durationMsText(0.5) returns 0.5 ms.
      logCase(TAG, "durationMsText(0.5)");
      expect(NumberUtils.durationMsText(0.5)).assertEqual("0.5 ms");
      // Vector 4: durationMsText(0.9) returns 0.9 ms.
      logCase(TAG, "durationMsText(0.9)");
      expect(NumberUtils.durationMsText(0.9)).assertEqual("0.9 ms");
      // Vector 5: durationMsText(1) returns 1 ms.
      logCase(TAG, "durationMsText(1)");
      expect(NumberUtils.durationMsText(1)).assertEqual("1 ms");
      // Vector 6: durationMsText(1.4) returns 1.4 ms.
      logCase(TAG, "durationMsText(1.4)");
      expect(NumberUtils.durationMsText(1.4)).assertEqual("1.4 ms");
      // Vector 7: durationMsText(1.5) returns 1.5 ms.
      logCase(TAG, "durationMsText(1.5)");
      expect(NumberUtils.durationMsText(1.5)).assertEqual("1.5 ms");
      // Vector 8: durationMsText(1.6) returns 1.6 ms.
      logCase(TAG, "durationMsText(1.6)");
      expect(NumberUtils.durationMsText(1.6)).assertEqual("1.6 ms");
      // Vector 9: durationMsText(9.9) returns 9.9 ms.
      logCase(TAG, "durationMsText(9.9)");
      expect(NumberUtils.durationMsText(9.9)).assertEqual("9.9 ms");
      // Vector 10: durationMsText(99.9) returns 99.9 ms.
      logCase(TAG, "durationMsText(99.9)");
      expect(NumberUtils.durationMsText(99.9)).assertEqual("99.9 ms");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DUR_0200
     * @tc.name      testDurationMillis0001
     * @tc.desc      Verify durationMsText formatting across the millisecond range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDurationMillis0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDurationMillis0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: durationMsText(100) returns 100 ms.
      logCase(TAG, "durationMsText(100)");
      expect(NumberUtils.durationMsText(100)).assertEqual("100 ms");
      // Vector 2: durationMsText(250) returns 250 ms.
      logCase(TAG, "durationMsText(250)");
      expect(NumberUtils.durationMsText(250)).assertEqual("250 ms");
      // Vector 3: durationMsText(999) returns 999 ms.
      logCase(TAG, "durationMsText(999)");
      expect(NumberUtils.durationMsText(999)).assertEqual("999 ms");
      // Vector 4: durationMsText(1000) returns 1000 ms.
      logCase(TAG, "durationMsText(1000)");
      expect(NumberUtils.durationMsText(1000)).assertEqual("1000 ms");
      // Vector 5: durationMsText(1234) returns 1234 ms.
      logCase(TAG, "durationMsText(1234)");
      expect(NumberUtils.durationMsText(1234)).assertEqual("1234 ms");
      // Vector 6: durationMsText(5000) returns 5000 ms.
      logCase(TAG, "durationMsText(5000)");
      expect(NumberUtils.durationMsText(5000)).assertEqual("5000 ms");
      // Vector 7: durationMsText(59999) returns 59999 ms.
      logCase(TAG, "durationMsText(59999)");
      expect(NumberUtils.durationMsText(59999)).assertEqual("59999 ms");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DUR_0300
     * @tc.name      testDurationFraction0001
     * @tc.desc      Verify durationMsText formatting across the millisecond range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDurationFraction0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDurationFraction0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: durationMsText(0.04) returns 0 ms.
      logCase(TAG, "durationMsText(0.04)");
      expect(NumberUtils.durationMsText(0.04)).assertEqual("0 ms");
      // Vector 2: durationMsText(0.05) returns 0.1 ms.
      logCase(TAG, "durationMsText(0.05)");
      expect(NumberUtils.durationMsText(0.05)).assertEqual("0.1 ms");
      // Vector 3: durationMsText(0.06) returns 0.1 ms.
      logCase(TAG, "durationMsText(0.06)");
      expect(NumberUtils.durationMsText(0.06)).assertEqual("0.1 ms");
      // Vector 4: durationMsText(1.04) returns 1 ms.
      logCase(TAG, "durationMsText(1.04)");
      expect(NumberUtils.durationMsText(1.04)).assertEqual("1 ms");
      // Vector 5: durationMsText(1.05) returns 1.1 ms.
      logCase(TAG, "durationMsText(1.05)");
      expect(NumberUtils.durationMsText(1.05)).assertEqual("1.1 ms");
      // Vector 6: durationMsText(1.06) returns 1.1 ms.
      logCase(TAG, "durationMsText(1.06)");
      expect(NumberUtils.durationMsText(1.06)).assertEqual("1.1 ms");
      // Vector 7: durationMsText(12.34) returns 12.3 ms.
      logCase(TAG, "durationMsText(12.34)");
      expect(NumberUtils.durationMsText(12.34)).assertEqual("12.3 ms");
      // Vector 8: durationMsText(12.35) returns 12.4 ms.
      logCase(TAG, "durationMsText(12.35)");
      expect(NumberUtils.durationMsText(12.35)).assertEqual("12.4 ms");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DUR_0400
     * @tc.name      testDurationNegative0001
     * @tc.desc      Verify durationMsText formatting across the millisecond range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDurationNegative0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDurationNegative0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: durationMsText(-1) returns -1 ms.
      logCase(TAG, "durationMsText(-1)");
      expect(NumberUtils.durationMsText(-1)).assertEqual("-1 ms");
      // Vector 2: durationMsText(-0.5) returns -0.5 ms.
      logCase(TAG, "durationMsText(-0.5)");
      expect(NumberUtils.durationMsText(-0.5)).assertEqual("-0.5 ms");
      // Vector 3: durationMsText(-100) returns -100 ms.
      logCase(TAG, "durationMsText(-100)");
      expect(NumberUtils.durationMsText(-100)).assertEqual("-100 ms");
      // Vector 4: durationMsText(-1234) returns -1234 ms.
      logCase(TAG, "durationMsText(-1234)");
      expect(NumberUtils.durationMsText(-1234)).assertEqual("-1234 ms");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DUR_0500
     * @tc.name      testDurationLarge0001
     * @tc.desc      Verify durationMsText formatting across the millisecond range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDurationLarge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDurationLarge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: durationMsText(100000) returns 100000 ms.
      logCase(TAG, "durationMsText(100000)");
      expect(NumberUtils.durationMsText(100000)).assertEqual("100000 ms");
      // Vector 2: durationMsText(600000) returns 600000 ms.
      logCase(TAG, "durationMsText(600000)");
      expect(NumberUtils.durationMsText(600000)).assertEqual("600000 ms");
      // Vector 3: durationMsText(3600000) returns 3600000 ms.
      logCase(TAG, "durationMsText(3600000)");
      expect(NumberUtils.durationMsText(3600000)).assertEqual("3600000 ms");
      // Vector 4: durationMsText(86400000) returns 86400000 ms.
      logCase(TAG, "durationMsText(86400000)");
      expect(NumberUtils.durationMsText(86400000)).assertEqual("86400000 ms");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_DUR_0600
     * @tc.name      testDurationSuffix0001
     * @tc.desc      Verify every durationMsText result ends with the ms suffix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDurationSuffix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDurationSuffix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: durationMsText(0) contains the ms suffix.
      logCase(TAG, "durationMsText suffix 0");
      expect(NumberUtils.durationMsText(0).indexOf(' ms') > 0).assertTrue();
      // Vector 2: durationMsText(1) contains the ms suffix.
      logCase(TAG, "durationMsText suffix 1");
      expect(NumberUtils.durationMsText(1).indexOf(' ms') > 0).assertTrue();
      // Vector 3: durationMsText(10) contains the ms suffix.
      logCase(TAG, "durationMsText suffix 10");
      expect(NumberUtils.durationMsText(10).indexOf(' ms') > 0).assertTrue();
      // Vector 4: durationMsText(100) contains the ms suffix.
      logCase(TAG, "durationMsText suffix 100");
      expect(NumberUtils.durationMsText(100).indexOf(' ms') > 0).assertTrue();
      // Vector 5: durationMsText(1000) contains the ms suffix.
      logCase(TAG, "durationMsText suffix 1000");
      expect(NumberUtils.durationMsText(1000).indexOf(' ms') > 0).assertTrue();
      // Vector 6: durationMsText(10000) contains the ms suffix.
      logCase(TAG, "durationMsText suffix 10000");
      expect(NumberUtils.durationMsText(10000).indexOf(' ms') > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
