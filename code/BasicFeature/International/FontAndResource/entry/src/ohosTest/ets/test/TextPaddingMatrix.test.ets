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

// Registers every matrix case of the TextPaddingMatrixSuite suite.
export default function textPaddingMatrixTest() {
  // Group the cases under the "TextPaddingMatrixSuite" describe block.
  describe('TextPaddingMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'TextPaddingMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_TXTPAD_0100
     * @tc.name      testTextPadStart0001
     * @tc.desc      Verify padStart prepends the pad character up to the target length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTextPadStart0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTextPadStart0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: padStart("7", 3, "0") returns "007".
      logCase(TAG, "padStart 7");
      expect(StringUtils.padStart("7", 3, "0")).assertEqual("007");
      // Vector 2: padStart("abc", 3, "0") returns "abc".
      logCase(TAG, "padStart abc");
      expect(StringUtils.padStart("abc", 3, "0")).assertEqual("abc");
      // Vector 3: padStart("abc", 5, "x") returns "xxabc".
      logCase(TAG, "padStart abc");
      expect(StringUtils.padStart("abc", 5, "x")).assertEqual("xxabc");
      // Vector 4: padStart("", 2, "-") returns "--".
      logCase(TAG, "padStart ");
      expect(StringUtils.padStart("", 2, "-")).assertEqual("--");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_TXTPAD_0200
     * @tc.name      testTextPadEnd0001
     * @tc.desc      Verify padEnd appends the pad character up to the target length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTextPadEnd0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTextPadEnd0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: padEnd("7", 3, "0") returns "700".
      logCase(TAG, "padEnd 7");
      expect(StringUtils.padEnd("7", 3, "0")).assertEqual("700");
      // Vector 2: padEnd("abc", 3, "0") returns "abc".
      logCase(TAG, "padEnd abc");
      expect(StringUtils.padEnd("abc", 3, "0")).assertEqual("abc");
      // Vector 3: padEnd("abc", 5, "x") returns "abcxx".
      logCase(TAG, "padEnd abc");
      expect(StringUtils.padEnd("abc", 5, "x")).assertEqual("abcxx");
      // Vector 4: padEnd("", 2, "-") returns "--".
      logCase(TAG, "padEnd ");
      expect(StringUtils.padEnd("", 2, "-")).assertEqual("--");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_TXTPAD_0300
     * @tc.name      testTextRepeat0001
     * @tc.desc      Verify repeat honours zero and negative repetition counts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTextRepeat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTextRepeat0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: repeat("ab", 3) returns "ababab".
      logCase(TAG, "repeat ab");
      expect(StringUtils.repeat("ab", 3)).assertEqual("ababab");
      // Vector 2: repeat("a", 0) returns "".
      logCase(TAG, "repeat a");
      expect(StringUtils.repeat("a", 0)).assertEqual("");
      // Vector 3: repeat("a", -1) returns "".
      logCase(TAG, "repeat a");
      expect(StringUtils.repeat("a", -1)).assertEqual("");
      // Vector 4: repeat("x", 1) returns "x".
      logCase(TAG, "repeat x");
      expect(StringUtils.repeat("x", 1)).assertEqual("x");
      // Vector 5: repeat("", 5) returns "".
      logCase(TAG, "repeat ");
      expect(StringUtils.repeat("", 5)).assertEqual("");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
