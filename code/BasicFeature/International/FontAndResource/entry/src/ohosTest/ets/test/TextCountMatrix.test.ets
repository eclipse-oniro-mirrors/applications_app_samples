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
// Import the StringUtils helpers under test from the library HAR package.
import { StringUtils } from 'library';

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

// Registers every matrix case of the TextCountMatrixSuite suite.
export default function textCountMatrixTest() {
  // Group the cases under the "TextCountMatrixSuite" describe block.
  describe('TextCountMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'TextCountMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_TXTCOUNT_0100
     * @tc.name      testTextCountMatches0001
     * @tc.desc      Verify countMatches counts non-overlapping occurrences.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTextCountMatches0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTextCountMatches0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: countMatches("banana", "a") returns 3.
      logCase(TAG, "countMatches banana/a");
      expect(StringUtils.countMatches("banana", "a")).assertEqual(3);
      // Vector 2: countMatches("aaaa", "aa") returns 2.
      logCase(TAG, "countMatches aaaa/aa");
      expect(StringUtils.countMatches("aaaa", "aa")).assertEqual(2);
      // Vector 3: countMatches("abc", "z") returns 0.
      logCase(TAG, "countMatches abc/z");
      expect(StringUtils.countMatches("abc", "z")).assertEqual(0);
      // Vector 4: countMatches("abc", "") returns 0.
      logCase(TAG, "countMatches abc/");
      expect(StringUtils.countMatches("abc", "")).assertEqual(0);
      // Vector 5: countMatches("", "a") returns 0.
      logCase(TAG, "countMatches /a");
      expect(StringUtils.countMatches("", "a")).assertEqual(0);
      // Vector 6: countMatches("ababab", "ab") returns 3.
      logCase(TAG, "countMatches ababab/ab");
      expect(StringUtils.countMatches("ababab", "ab")).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_TXTCOUNT_0200
     * @tc.name      testTextJoinSkipEmpty0001
     * @tc.desc      Verify joinSkipEmpty drops empty parts before joining.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTextJoinSkipEmpty0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTextJoinSkipEmpty0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: joinSkipEmpty(",", ["a", "", "b"]) returns "a,b".
      logCase(TAG, "joinSkipEmpty ,");
      expect(StringUtils.joinSkipEmpty(",", ["a", "", "b"])).assertEqual("a,b");
      // Vector 2: joinSkipEmpty("-", ["", "", ""]) returns "".
      logCase(TAG, "joinSkipEmpty -");
      expect(StringUtils.joinSkipEmpty("-", ["", "", ""])).assertEqual("");
      // Vector 3: joinSkipEmpty("|", ["x"]) returns "x".
      logCase(TAG, "joinSkipEmpty |");
      expect(StringUtils.joinSkipEmpty("|", ["x"])).assertEqual("x");
      // Vector 4: joinSkipEmpty("", ["a", "b"]) returns "ab".
      logCase(TAG, "joinSkipEmpty ");
      expect(StringUtils.joinSkipEmpty("", ["a", "b"])).assertEqual("ab");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_TXTCOUNT_0300
     * @tc.name      testTextDefaultIfEmpty0001
     * @tc.desc      Verify defaultIfEmpty replaces only truly empty values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTextDefaultIfEmpty0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTextDefaultIfEmpty0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: defaultIfEmpty("", "fallback") returns "fallback".
      logCase(TAG, "defaultIfEmpty ");
      expect(StringUtils.defaultIfEmpty("", "fallback")).assertEqual("fallback");
      // Vector 2: defaultIfEmpty("value", "fallback") returns "value".
      logCase(TAG, "defaultIfEmpty value");
      expect(StringUtils.defaultIfEmpty("value", "fallback")).assertEqual("value");
      // Vector 3: defaultIfEmpty(" ", "fallback") returns " ".
      logCase(TAG, "defaultIfEmpty  ");
      expect(StringUtils.defaultIfEmpty(" ", "fallback")).assertEqual(" ");
      // Vector 4: defaultIfEmpty("0", "fallback") returns "0".
      logCase(TAG, "defaultIfEmpty 0");
      expect(StringUtils.defaultIfEmpty("0", "fallback")).assertEqual("0");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_TXTCOUNT_0400
     * @tc.name      testTextBlankAndEmpty0001
     * @tc.desc      Verify isBlank and isEmpty agree on the empty boundary only.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTextBlankAndEmpty0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTextBlankAndEmpty0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isBlank("") returns True.
      logCase(TAG, "isBlank ");
      expect(StringUtils.isBlank("")).assertTrue();
      expect(StringUtils.isEmpty("")).assertTrue();
      // Vector 2: isBlank("   ") returns True.
      logCase(TAG, "isBlank    ");
      expect(StringUtils.isBlank("   ")).assertTrue();
      expect(StringUtils.isEmpty("   ")).assertFalse();
      // Vector 3: isBlank("\t\n") returns True.
      logCase(TAG, "isBlank \t\n");
      expect(StringUtils.isBlank("\t\n")).assertTrue();
      expect(StringUtils.isEmpty("\t\n")).assertFalse();
      // Vector 4: isBlank("a") returns False.
      logCase(TAG, "isBlank a");
      expect(StringUtils.isBlank("a")).assertFalse();
      expect(StringUtils.isEmpty("a")).assertFalse();
      // Vector 5: isBlank(" a ") returns False.
      logCase(TAG, "isBlank  a ");
      expect(StringUtils.isBlank(" a ")).assertFalse();
      expect(StringUtils.isEmpty(" a ")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
