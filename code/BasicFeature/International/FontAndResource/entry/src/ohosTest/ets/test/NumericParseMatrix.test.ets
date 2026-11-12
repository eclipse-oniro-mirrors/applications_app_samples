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

// Registers every matrix case of the NumericParseMatrixSuite suite.
export default function numericParseMatrixTest() {
  // Group the cases under the "NumericParseMatrixSuite" describe block.
  describe('NumericParseMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'NumericParseMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_PARSE_0100
     * @tc.name      testParseIntPlain0001
     * @tc.desc      Verify parseIntSafe follows base-ten integer parsing with a fallback.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseIntPlain0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseIntPlain0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: parseIntSafe("0", -1) returns 0.
      logCase(TAG, "parseIntSafe(0)");
      expect(NumberUtils.parseIntSafe("0", -1)).assertEqual(0);
      // Vector 2: parseIntSafe("1", -1) returns 1.
      logCase(TAG, "parseIntSafe(1)");
      expect(NumberUtils.parseIntSafe("1", -1)).assertEqual(1);
      // Vector 3: parseIntSafe("42", -1) returns 42.
      logCase(TAG, "parseIntSafe(42)");
      expect(NumberUtils.parseIntSafe("42", -1)).assertEqual(42);
      // Vector 4: parseIntSafe("123456", -1) returns 123456.
      logCase(TAG, "parseIntSafe(123456)");
      expect(NumberUtils.parseIntSafe("123456", -1)).assertEqual(123456);
      // Vector 5: parseIntSafe("-17", -1) returns -17.
      logCase(TAG, "parseIntSafe(-17)");
      expect(NumberUtils.parseIntSafe("-17", -1)).assertEqual(-17);
      // Vector 6: parseIntSafe("+9", -1) returns 9.
      logCase(TAG, "parseIntSafe(+9)");
      expect(NumberUtils.parseIntSafe("+9", -1)).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_PARSE_0200
     * @tc.name      testParseIntPrefix0001
     * @tc.desc      Verify parseIntSafe follows base-ten integer parsing with a fallback.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseIntPrefix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseIntPrefix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: parseIntSafe("12abc", -1) returns 12.
      logCase(TAG, "parseIntSafe(12abc)");
      expect(NumberUtils.parseIntSafe("12abc", -1)).assertEqual(12);
      // Vector 2: parseIntSafe("42px", -1) returns 42.
      logCase(TAG, "parseIntSafe(42px)");
      expect(NumberUtils.parseIntSafe("42px", -1)).assertEqual(42);
      // Vector 3: parseIntSafe("7 days", -1) returns 7.
      logCase(TAG, "parseIntSafe(7 days)");
      expect(NumberUtils.parseIntSafe("7 days", -1)).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_PARSE_0300
     * @tc.name      testParseIntFailure0001
     * @tc.desc      Verify parseIntSafe follows base-ten integer parsing with a fallback.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseIntFailure0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseIntFailure0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: parseIntSafe("", -1) returns -1.
      logCase(TAG, "parseIntSafe()");
      expect(NumberUtils.parseIntSafe("", -1)).assertEqual(-1);
      // Vector 2: parseIntSafe("abc", -1) returns -1.
      logCase(TAG, "parseIntSafe(abc)");
      expect(NumberUtils.parseIntSafe("abc", -1)).assertEqual(-1);
      // Vector 3: parseIntSafe("  ", -1) returns -1.
      logCase(TAG, "parseIntSafe(  )");
      expect(NumberUtils.parseIntSafe("  ", -1)).assertEqual(-1);
      // Vector 4: parseIntSafe("x42", -1) returns -1.
      logCase(TAG, "parseIntSafe(x42)");
      expect(NumberUtils.parseIntSafe("x42", -1)).assertEqual(-1);
      // Vector 5: parseIntSafe(".5", -1) returns -1.
      logCase(TAG, "parseIntSafe(.5)");
      expect(NumberUtils.parseIntSafe(".5", -1)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_PARSE_0400
     * @tc.name      testParseIntWhitespace0001
     * @tc.desc      Verify parseIntSafe follows base-ten integer parsing with a fallback.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseIntWhitespace0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseIntWhitespace0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: parseIntSafe(" 42 ", -1) returns 42.
      logCase(TAG, "parseIntSafe( 42 )");
      expect(NumberUtils.parseIntSafe(" 42 ", -1)).assertEqual(42);
      // Vector 2: parseIntSafe("\t7", -1) returns 7.
      logCase(TAG, "parseIntSafe(\t7)");
      expect(NumberUtils.parseIntSafe("\t7", -1)).assertEqual(7);
      // Vector 3: parseIntSafe("\n9", -1) returns 9.
      logCase(TAG, "parseIntSafe(\n9)");
      expect(NumberUtils.parseIntSafe("\n9", -1)).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_PARSE_0500
     * @tc.name      testParseIntRadix0001
     * @tc.desc      Verify parseIntSafe follows base-ten integer parsing with a fallback.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseIntRadix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseIntRadix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: parseIntSafe("0x10", -1) returns 0.
      logCase(TAG, "parseIntSafe(0x10)");
      expect(NumberUtils.parseIntSafe("0x10", -1)).assertEqual(0);
      // Vector 2: parseIntSafe("010", -1) returns 10.
      logCase(TAG, "parseIntSafe(010)");
      expect(NumberUtils.parseIntSafe("010", -1)).assertEqual(10);
      // Vector 3: parseIntSafe("08", -1) returns 8.
      logCase(TAG, "parseIntSafe(08)");
      expect(NumberUtils.parseIntSafe("08", -1)).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_PARSE_0600
     * @tc.name      testParseFloatPlain0001
     * @tc.desc      Verify parseFloatSafe parses decimal and exponent text with a fallback.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseFloatPlain0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseFloatPlain0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: parseFloatSafe("0", -1) returns 0.
      logCase(TAG, "parseFloatSafe(0)");
      expect(NumberUtils.parseFloatSafe("0", -1)).assertEqual(0);
      // Vector 2: parseFloatSafe("3.14", -1) returns 3.14.
      logCase(TAG, "parseFloatSafe(3.14)");
      expect(NumberUtils.parseFloatSafe("3.14", -1)).assertEqual(3.14);
      // Vector 3: parseFloatSafe("-2.5", -1) returns -2.5.
      logCase(TAG, "parseFloatSafe(-2.5)");
      expect(NumberUtils.parseFloatSafe("-2.5", -1)).assertEqual(-2.5);
      // Vector 4: parseFloatSafe("0.001", -1) returns 0.001.
      logCase(TAG, "parseFloatSafe(0.001)");
      expect(NumberUtils.parseFloatSafe("0.001", -1)).assertEqual(0.001);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_PARSE_0700
     * @tc.name      testParseFloatExponent0001
     * @tc.desc      Verify parseFloatSafe parses decimal and exponent text with a fallback.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseFloatExponent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseFloatExponent0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: parseFloatSafe("1e3", -1) returns 1000.
      logCase(TAG, "parseFloatSafe(1e3)");
      expect(NumberUtils.parseFloatSafe("1e3", -1)).assertEqual(1000);
      // Vector 2: parseFloatSafe("1.5e2", -1) returns 150.
      logCase(TAG, "parseFloatSafe(1.5e2)");
      expect(NumberUtils.parseFloatSafe("1.5e2", -1)).assertEqual(150);
      // Vector 3: parseFloatSafe("2E-2", -1) returns 0.02.
      logCase(TAG, "parseFloatSafe(2E-2)");
      expect(NumberUtils.parseFloatSafe("2E-2", -1)).assertEqual(0.02);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_PARSE_0800
     * @tc.name      testParseFloatPrefix0001
     * @tc.desc      Verify parseFloatSafe parses decimal and exponent text with a fallback.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseFloatPrefix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseFloatPrefix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: parseFloatSafe("2.5abc", -1) returns 2.5.
      logCase(TAG, "parseFloatSafe(2.5abc)");
      expect(NumberUtils.parseFloatSafe("2.5abc", -1)).assertEqual(2.5);
      // Vector 2: parseFloatSafe("9.9px", -1) returns 9.9.
      logCase(TAG, "parseFloatSafe(9.9px)");
      expect(NumberUtils.parseFloatSafe("9.9px", -1)).assertEqual(9.9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_PARSE_0900
     * @tc.name      testParseFloatFailure0001
     * @tc.desc      Verify parseFloatSafe parses decimal and exponent text with a fallback.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseFloatFailure0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseFloatFailure0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: parseFloatSafe("", -1) returns -1.
      logCase(TAG, "parseFloatSafe()");
      expect(NumberUtils.parseFloatSafe("", -1)).assertEqual(-1);
      // Vector 2: parseFloatSafe("abc", -1) returns -1.
      logCase(TAG, "parseFloatSafe(abc)");
      expect(NumberUtils.parseFloatSafe("abc", -1)).assertEqual(-1);
      // Vector 3: parseFloatSafe("  ", -1) returns -1.
      logCase(TAG, "parseFloatSafe(  )");
      expect(NumberUtils.parseFloatSafe("  ", -1)).assertEqual(-1);
      // Vector 4: parseFloatSafe("e3", -1) returns -1.
      logCase(TAG, "parseFloatSafe(e3)");
      expect(NumberUtils.parseFloatSafe("e3", -1)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
