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

// Registers every matrix case of the NumericThousandMatrixSuite suite.
export default function numericThousandMatrixTest() {
  // Group the cases under the "NumericThousandMatrixSuite" describe block.
  describe('NumericThousandMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'NumericThousandMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_THOU_0100
     * @tc.name      testThousandSmall0001
     * @tc.desc      Verify thousandSeparators groups digits with commas and keeps the sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testThousandSmall0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testThousandSmall0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: thousandSeparators(0) returns 0.
      logCase(TAG, "thousandSeparators(0)");
      expect(NumberUtils.thousandSeparators(0)).assertEqual("0");
      // Vector 2: thousandSeparators(1) returns 1.
      logCase(TAG, "thousandSeparators(1)");
      expect(NumberUtils.thousandSeparators(1)).assertEqual("1");
      // Vector 3: thousandSeparators(12) returns 12.
      logCase(TAG, "thousandSeparators(12)");
      expect(NumberUtils.thousandSeparators(12)).assertEqual("12");
      // Vector 4: thousandSeparators(123) returns 123.
      logCase(TAG, "thousandSeparators(123)");
      expect(NumberUtils.thousandSeparators(123)).assertEqual("123");
      // Vector 5: thousandSeparators(999) returns 999.
      logCase(TAG, "thousandSeparators(999)");
      expect(NumberUtils.thousandSeparators(999)).assertEqual("999");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_THOU_0200
     * @tc.name      testThousandGrouped0001
     * @tc.desc      Verify thousandSeparators groups digits with commas and keeps the sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testThousandGrouped0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testThousandGrouped0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: thousandSeparators(1000) returns 1,000.
      logCase(TAG, "thousandSeparators(1000)");
      expect(NumberUtils.thousandSeparators(1000)).assertEqual("1,000");
      // Vector 2: thousandSeparators(1234) returns 1,234.
      logCase(TAG, "thousandSeparators(1234)");
      expect(NumberUtils.thousandSeparators(1234)).assertEqual("1,234");
      // Vector 3: thousandSeparators(12345) returns 12,345.
      logCase(TAG, "thousandSeparators(12345)");
      expect(NumberUtils.thousandSeparators(12345)).assertEqual("12,345");
      // Vector 4: thousandSeparators(123456) returns 123,456.
      logCase(TAG, "thousandSeparators(123456)");
      expect(NumberUtils.thousandSeparators(123456)).assertEqual("123,456");
      // Vector 5: thousandSeparators(1234567) returns 1,234,567.
      logCase(TAG, "thousandSeparators(1234567)");
      expect(NumberUtils.thousandSeparators(1234567)).assertEqual("1,234,567");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_THOU_0300
     * @tc.name      testThousandNegative0001
     * @tc.desc      Verify thousandSeparators groups digits with commas and keeps the sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testThousandNegative0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testThousandNegative0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: thousandSeparators(-1) returns -1.
      logCase(TAG, "thousandSeparators(-1)");
      expect(NumberUtils.thousandSeparators(-1)).assertEqual("-1");
      // Vector 2: thousandSeparators(-999) returns -999.
      logCase(TAG, "thousandSeparators(-999)");
      expect(NumberUtils.thousandSeparators(-999)).assertEqual("-999");
      // Vector 3: thousandSeparators(-1000) returns -1,000.
      logCase(TAG, "thousandSeparators(-1000)");
      expect(NumberUtils.thousandSeparators(-1000)).assertEqual("-1,000");
      // Vector 4: thousandSeparators(-1234567) returns -1,234,567.
      logCase(TAG, "thousandSeparators(-1234567)");
      expect(NumberUtils.thousandSeparators(-1234567)).assertEqual("-1,234,567");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_THOU_0400
     * @tc.name      testThousandLarge0001
     * @tc.desc      Verify thousandSeparators groups digits with commas and keeps the sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testThousandLarge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testThousandLarge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: thousandSeparators(1000000000) returns 1,000,000,000.
      logCase(TAG, "thousandSeparators(1000000000)");
      expect(NumberUtils.thousandSeparators(1000000000)).assertEqual("1,000,000,000");
      // Vector 2: thousandSeparators(1234567890) returns 1,234,567,890.
      logCase(TAG, "thousandSeparators(1234567890)");
      expect(NumberUtils.thousandSeparators(1234567890)).assertEqual("1,234,567,890");
      // Vector 3: thousandSeparators(999999999999) returns 999,999,999,999.
      logCase(TAG, "thousandSeparators(999999999999)");
      expect(NumberUtils.thousandSeparators(999999999999)).assertEqual("999,999,999,999");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_THOU_0500
     * @tc.name      testThousandTruncation0001
     * @tc.desc      Verify thousandSeparators groups digits with commas and keeps the sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testThousandTruncation0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testThousandTruncation0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: thousandSeparators(999.9) returns 999.
      logCase(TAG, "thousandSeparators(999.9)");
      expect(NumberUtils.thousandSeparators(999.9)).assertEqual("999");
      // Vector 2: thousandSeparators(1000.9) returns 1,000.
      logCase(TAG, "thousandSeparators(1000.9)");
      expect(NumberUtils.thousandSeparators(1000.9)).assertEqual("1,000");
      // Vector 3: thousandSeparators(12345.67) returns 12,345.
      logCase(TAG, "thousandSeparators(12345.67)");
      expect(NumberUtils.thousandSeparators(12345.67)).assertEqual("12,345");
      // Vector 4: thousandSeparators(-12345.67) returns -12,345.
      logCase(TAG, "thousandSeparators(-12345.67)");
      expect(NumberUtils.thousandSeparators(-12345.67)).assertEqual("-12,345");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_THOU_0600
     * @tc.name      testThousandCommaCount0001
     * @tc.desc      Verify thousandSeparators emits exactly one comma per three digit group.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testThousandCommaCount0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testThousandCommaCount0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: thousandSeparators(1000) emits the expected comma count.
      logCase(TAG, "thousandSeparators commas 1000");
      expect(NumberUtils.thousandSeparators(1000).split(',').length).assertEqual(2);
      // Vector 2: thousandSeparators(1000000) emits the expected comma count.
      logCase(TAG, "thousandSeparators commas 1000000");
      expect(NumberUtils.thousandSeparators(1000000).split(',').length).assertEqual(3);
      // Vector 3: thousandSeparators(1000000000) emits the expected comma count.
      logCase(TAG, "thousandSeparators commas 1000000000");
      expect(NumberUtils.thousandSeparators(1000000000).split(',').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
