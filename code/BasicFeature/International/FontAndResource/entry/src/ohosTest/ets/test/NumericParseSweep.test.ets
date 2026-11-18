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

// Registers every matrix case of the NumericParseSweepSuite suite.
export default function numericParseSweepTest() {
  // Group the cases under the "NumericParseSweepSuite" describe block.
  describe('NumericParseSweepSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'NumericParseSweepSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_PARSE_0100
     * @tc.name      testParseSweepIntValid0001
     * @tc.desc      Verify parseIntSafe accepts ordinary decimal integers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseSweepIntValid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseSweepIntValid0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: parseIntSafe("0", -1) parses the decimal prefix.
      logCase(TAG, "parseIntSafe(\"0\", -1)");
      expect(NumberUtils.parseIntSafe("0", -1)).assertEqual(0);
      // Vector 2: parseIntSafe("1", -1) parses the decimal prefix.
      logCase(TAG, "parseIntSafe(\"1\", -1)");
      expect(NumberUtils.parseIntSafe("1", -1)).assertEqual(1);
      // Vector 3: parseIntSafe("42", -1) parses the decimal prefix.
      logCase(TAG, "parseIntSafe(\"42\", -1)");
      expect(NumberUtils.parseIntSafe("42", -1)).assertEqual(42);
      // Vector 4: parseIntSafe("999", -1) parses the decimal prefix.
      logCase(TAG, "parseIntSafe(\"999\", -1)");
      expect(NumberUtils.parseIntSafe("999", -1)).assertEqual(999);
      // Vector 5: parseIntSafe("-17", -1) parses the decimal prefix.
      logCase(TAG, "parseIntSafe(\"-17\", -1)");
      expect(NumberUtils.parseIntSafe("-17", -1)).assertEqual(-17);
      // Vector 6: parseIntSafe("+9", -1) parses the decimal prefix.
      logCase(TAG, "parseIntSafe(\"+9\", -1)");
      expect(NumberUtils.parseIntSafe("+9", -1)).assertEqual(9);
      // Vector 7: parseIntSafe(" 42 ", -1) parses the decimal prefix.
      logCase(TAG, "parseIntSafe(\" 42 \", -1)");
      expect(NumberUtils.parseIntSafe(" 42 ", -1)).assertEqual(42);
      // Vector 8: parseIntSafe("0007", -1) parses the decimal prefix.
      logCase(TAG, "parseIntSafe(\"0007\", -1)");
      expect(NumberUtils.parseIntSafe("0007", -1)).assertEqual(7);
      // Vector 9: parseIntSafe("123456789", -1) parses the decimal prefix.
      logCase(TAG, "parseIntSafe(\"123456789\", -1)");
      expect(NumberUtils.parseIntSafe("123456789", -1)).assertEqual(123456789);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_PARSE_0200
     * @tc.name      testParseSweepIntPrefix0001
     * @tc.desc      Verify parseIntSafe stops at the first non-digit character and rejects exponent shaped literals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseSweepIntPrefix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseSweepIntPrefix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: parseIntSafe("12abc", -1) parses the decimal prefix.
      logCase(TAG, "parseIntSafe(\"12abc\", -1)");
      expect(NumberUtils.parseIntSafe("12abc", -1)).assertEqual(12);
      // Vector 2: parseIntSafe("3.9", -1) parses the decimal prefix.
      logCase(TAG, "parseIntSafe(\"3.9\", -1)");
      expect(NumberUtils.parseIntSafe("3.9", -1)).assertEqual(3);
      // Vector 3: parseIntSafe("7e2", -1) rejects the exponent shaped literal and returns the fallback.
      logCase(TAG, "parseIntSafe(\"7e2\", -1)");
      expect(NumberUtils.parseIntSafe("7e2", -1)).assertEqual(-1);
      // Vector 4: parseIntSafe("42px", -1) parses the decimal prefix.
      logCase(TAG, "parseIntSafe(\"42px\", -1)");
      expect(NumberUtils.parseIntSafe("42px", -1)).assertEqual(42);
      // Vector 5: parseIntSafe("9 items", -1) parses the decimal prefix.
      logCase(TAG, "parseIntSafe(\"9 items\", -1)");
      expect(NumberUtils.parseIntSafe("9 items", -1)).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_PARSE_0300
     * @tc.name      testParseSweepIntHex0001
     * @tc.desc      Verify parseIntSafe parses hexadecimal text with radix ten semantics.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseSweepIntHex0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseSweepIntHex0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: parseIntSafe("0x10", -1) parses the decimal prefix.
      logCase(TAG, "parseIntSafe(\"0x10\", -1)");
      expect(NumberUtils.parseIntSafe("0x10", -1)).assertEqual(0);
      // Vector 2: parseIntSafe("0XFF", -1) parses the decimal prefix.
      logCase(TAG, "parseIntSafe(\"0XFF\", -1)");
      expect(NumberUtils.parseIntSafe("0XFF", -1)).assertEqual(0);
      // Vector 3: parseIntSafe("0b101", -1) parses the decimal prefix.
      logCase(TAG, "parseIntSafe(\"0b101\", -1)");
      expect(NumberUtils.parseIntSafe("0b101", -1)).assertEqual(0);
      // Vector 4: parseIntSafe("0o17", -1) parses the decimal prefix.
      logCase(TAG, "parseIntSafe(\"0o17\", -1)");
      expect(NumberUtils.parseIntSafe("0o17", -1)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_PARSE_0400
     * @tc.name      testParseSweepIntFallback0001
     * @tc.desc      Verify parseIntSafe returns the fallback for text without a decimal prefix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseSweepIntFallback0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseSweepIntFallback0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: parseIntSafe("", -7) falls back for invalid text.
      logCase(TAG, "parseIntSafe(\"\", -7)");
      expect(NumberUtils.parseIntSafe("", -7)).assertEqual(-7);
      // Vector 2: parseIntSafe("abc", -7) falls back for invalid text.
      logCase(TAG, "parseIntSafe(\"abc\", -7)");
      expect(NumberUtils.parseIntSafe("abc", -7)).assertEqual(-7);
      // Vector 3: parseIntSafe("--1", -7) falls back for invalid text.
      logCase(TAG, "parseIntSafe(\"--1\", -7)");
      expect(NumberUtils.parseIntSafe("--1", -7)).assertEqual(-7);
      // Vector 4: parseIntSafe("abc123", -7) falls back for invalid text.
      logCase(TAG, "parseIntSafe(\"abc123\", -7)");
      expect(NumberUtils.parseIntSafe("abc123", -7)).assertEqual(-7);
      // Vector 5: parseIntSafe("   ", -7) falls back for invalid text.
      logCase(TAG, "parseIntSafe(\"   \", -7)");
      expect(NumberUtils.parseIntSafe("   ", -7)).assertEqual(-7);
      // Vector 6: parseIntSafe("null", -7) falls back for invalid text.
      logCase(TAG, "parseIntSafe(\"null\", -7)");
      expect(NumberUtils.parseIntSafe("null", -7)).assertEqual(-7);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_PARSE_0500
     * @tc.name      testParseSweepFloatValid0001
     * @tc.desc      Verify parseFloatSafe accepts ordinary decimal fractions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseSweepFloatValid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseSweepFloatValid0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: parseFloatSafe("0", -1) parses the decimal prefix.
      logCase(TAG, "parseFloatSafe(\"0\", -1)");
      expect(NumberUtils.parseFloatSafe("0", -1)).assertEqual(0);
      // Vector 2: parseFloatSafe("0.5", -1) parses the decimal prefix.
      logCase(TAG, "parseFloatSafe(\"0.5\", -1)");
      expect(NumberUtils.parseFloatSafe("0.5", -1)).assertEqual(0.5);
      // Vector 3: parseFloatSafe("1.25", -1) parses the decimal prefix.
      logCase(TAG, "parseFloatSafe(\"1.25\", -1)");
      expect(NumberUtils.parseFloatSafe("1.25", -1)).assertEqual(1.25);
      // Vector 4: parseFloatSafe("-3.75", -1) parses the decimal prefix.
      logCase(TAG, "parseFloatSafe(\"-3.75\", -1)");
      expect(NumberUtils.parseFloatSafe("-3.75", -1)).assertEqual(-3.75);
      // Vector 5: parseFloatSafe("+2.5", -1) parses the decimal prefix.
      logCase(TAG, "parseFloatSafe(\"+2.5\", -1)");
      expect(NumberUtils.parseFloatSafe("+2.5", -1)).assertEqual(2.5);
      // Vector 6: parseFloatSafe(" 42.75 ", -1) parses the decimal prefix.
      logCase(TAG, "parseFloatSafe(\" 42.75 \", -1)");
      expect(NumberUtils.parseFloatSafe(" 42.75 ", -1)).assertEqual(42.75);
      // Vector 7: parseFloatSafe(".5", -1) parses the decimal prefix.
      logCase(TAG, "parseFloatSafe(\".5\", -1)");
      expect(NumberUtils.parseFloatSafe(".5", -1)).assertEqual(0.5);
      // Vector 8: parseFloatSafe("3.14159", -1) parses the decimal prefix.
      logCase(TAG, "parseFloatSafe(\"3.14159\", -1)");
      expect(NumberUtils.parseFloatSafe("3.14159", -1)).assertEqual(3.14159);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_PARSE_0600
     * @tc.name      testParseSweepFloatExponent0001
     * @tc.desc      Verify parseFloatSafe accepts exponent notation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseSweepFloatExponent0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseSweepFloatExponent0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: parseFloatSafe("1e3", -1) parses the decimal prefix.
      logCase(TAG, "parseFloatSafe(\"1e3\", -1)");
      expect(NumberUtils.parseFloatSafe("1e3", -1)).assertEqual(1000);
      // Vector 2: parseFloatSafe("1E3", -1) parses the decimal prefix.
      logCase(TAG, "parseFloatSafe(\"1E3\", -1)");
      expect(NumberUtils.parseFloatSafe("1E3", -1)).assertEqual(1000);
      // Vector 3: parseFloatSafe("2.5e-2", -1) parses the decimal prefix.
      logCase(TAG, "parseFloatSafe(\"2.5e-2\", -1)");
      expect(NumberUtils.parseFloatSafe("2.5e-2", -1)).assertEqual(0.025);
      // Vector 4: parseFloatSafe("1e+2", -1) parses the decimal prefix.
      logCase(TAG, "parseFloatSafe(\"1e+2\", -1)");
      expect(NumberUtils.parseFloatSafe("1e+2", -1)).assertEqual(100);
      // Vector 5: parseFloatSafe("-4.5e2", -1) parses the decimal prefix.
      logCase(TAG, "parseFloatSafe(\"-4.5e2\", -1)");
      expect(NumberUtils.parseFloatSafe("-4.5e2", -1)).assertEqual(-450);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_PARSE_0700
     * @tc.name      testParseSweepFloatPrefix0001
     * @tc.desc      Verify parseFloatSafe stops at the first invalid character.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseSweepFloatPrefix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseSweepFloatPrefix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: parseFloatSafe("2.5abc", -1) parses the decimal prefix.
      logCase(TAG, "parseFloatSafe(\"2.5abc\", -1)");
      expect(NumberUtils.parseFloatSafe("2.5abc", -1)).assertEqual(2.5);
      // Vector 2: parseFloatSafe("3.14px", -1) parses the decimal prefix.
      logCase(TAG, "parseFloatSafe(\"3.14px\", -1)");
      expect(NumberUtils.parseFloatSafe("3.14px", -1)).assertEqual(3.14);
      // Vector 3: parseFloatSafe("1.2.3", -1) parses the decimal prefix.
      logCase(TAG, "parseFloatSafe(\"1.2.3\", -1)");
      expect(NumberUtils.parseFloatSafe("1.2.3", -1)).assertEqual(1.2);
      // Vector 4: parseFloatSafe("9 items", -1) parses the decimal prefix.
      logCase(TAG, "parseFloatSafe(\"9 items\", -1)");
      expect(NumberUtils.parseFloatSafe("9 items", -1)).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_PARSE_0800
     * @tc.name      testParseSweepFloatFallback0001
     * @tc.desc      Verify parseFloatSafe returns the fallback for text without a decimal prefix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParseSweepFloatFallback0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testParseSweepFloatFallback0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: parseFloatSafe("", -2.5) falls back for invalid text.
      logCase(TAG, "parseFloatSafe(\"\", -2.5)");
      expect(NumberUtils.parseFloatSafe("", -2.5)).assertEqual(-2.5);
      // Vector 2: parseFloatSafe("abc", -2.5) falls back for invalid text.
      logCase(TAG, "parseFloatSafe(\"abc\", -2.5)");
      expect(NumberUtils.parseFloatSafe("abc", -2.5)).assertEqual(-2.5);
      // Vector 3: parseFloatSafe("--", -2.5) falls back for invalid text.
      logCase(TAG, "parseFloatSafe(\"--\", -2.5)");
      expect(NumberUtils.parseFloatSafe("--", -2.5)).assertEqual(-2.5);
      // Vector 4: parseFloatSafe("NaN?", -2.5) falls back for invalid text.
      logCase(TAG, "parseFloatSafe(\"NaN?\", -2.5)");
      expect(NumberUtils.parseFloatSafe("NaN?", -2.5)).assertEqual(-2.5);
      // Vector 5: parseFloatSafe("  ", -2.5) falls back for invalid text.
      logCase(TAG, "parseFloatSafe(\"  \", -2.5)");
      expect(NumberUtils.parseFloatSafe("  ", -2.5)).assertEqual(-2.5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
