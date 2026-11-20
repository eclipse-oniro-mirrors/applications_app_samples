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

// Registers every matrix case of the TextNormalizeMatrixSuite suite.
export default function textNormalizeMatrixTest() {
  // Group the cases under the "TextNormalizeMatrixSuite" describe block.
  describe('TextNormalizeMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'TextNormalizeMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_NORM_0100
     * @tc.name      testNormalizeEmpty0001
     * @tc.desc      Verify isEmpty distinguishes the empty string from whitespace.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNormalizeEmpty0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNormalizeEmpty0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isEmpty("") returns True.
      logCase(TAG, "isEmpty ");
      expect(StringUtils.isEmpty("")).assertTrue();
      // Vector 2: isEmpty(" ") returns False.
      logCase(TAG, "isEmpty  ");
      expect(StringUtils.isEmpty(" ")).assertFalse();
      // Vector 3: isEmpty("  ") returns False.
      logCase(TAG, "isEmpty   ");
      expect(StringUtils.isEmpty("  ")).assertFalse();
      // Vector 4: isEmpty("\t") returns False.
      logCase(TAG, "isEmpty \t");
      expect(StringUtils.isEmpty("\t")).assertFalse();
      // Vector 5: isEmpty("\n") returns False.
      logCase(TAG, "isEmpty \n");
      expect(StringUtils.isEmpty("\n")).assertFalse();
      // Vector 6: isEmpty("a") returns False.
      logCase(TAG, "isEmpty a");
      expect(StringUtils.isEmpty("a")).assertFalse();
      // Vector 7: isEmpty(" a ") returns False.
      logCase(TAG, "isEmpty  a ");
      expect(StringUtils.isEmpty(" a ")).assertFalse();
      // Vector 8: isEmpty("0") returns False.
      logCase(TAG, "isEmpty 0");
      expect(StringUtils.isEmpty("0")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_NORM_0200
     * @tc.name      testNormalizeBlank0001
     * @tc.desc      Verify isBlank accepts every whitespace-only shape.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNormalizeBlank0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNormalizeBlank0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isBlank("") returns True.
      logCase(TAG, "isBlank ");
      expect(StringUtils.isBlank("")).assertTrue();
      // Vector 2: isBlank(" ") returns True.
      logCase(TAG, "isBlank  ");
      expect(StringUtils.isBlank(" ")).assertTrue();
      // Vector 3: isBlank("  ") returns True.
      logCase(TAG, "isBlank   ");
      expect(StringUtils.isBlank("  ")).assertTrue();
      // Vector 4: isBlank("\t") returns True.
      logCase(TAG, "isBlank \t");
      expect(StringUtils.isBlank("\t")).assertTrue();
      // Vector 5: isBlank("\n") returns True.
      logCase(TAG, "isBlank \n");
      expect(StringUtils.isBlank("\n")).assertTrue();
      // Vector 6: isBlank("a") returns False.
      logCase(TAG, "isBlank a");
      expect(StringUtils.isBlank("a")).assertFalse();
      // Vector 7: isBlank(" a ") returns False.
      logCase(TAG, "isBlank  a ");
      expect(StringUtils.isBlank(" a ")).assertFalse();
      // Vector 8: isBlank("0") returns False.
      logCase(TAG, "isBlank 0");
      expect(StringUtils.isBlank("0")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_NORM_0300
     * @tc.name      testNormalizeDefault0001
     * @tc.desc      Verify defaultIfEmpty keeps whitespace values and replaces only empty text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNormalizeDefault0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNormalizeDefault0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: defaultIfEmpty("") returns "fallback".
      logCase(TAG, "defaultIfEmpty normalize ");
      expect(StringUtils.defaultIfEmpty("", 'fallback')).assertEqual("fallback");
      // Vector 2: defaultIfEmpty(" ") returns " ".
      logCase(TAG, "defaultIfEmpty normalize  ");
      expect(StringUtils.defaultIfEmpty(" ", 'fallback')).assertEqual(" ");
      // Vector 3: defaultIfEmpty("  ") returns "  ".
      logCase(TAG, "defaultIfEmpty normalize   ");
      expect(StringUtils.defaultIfEmpty("  ", 'fallback')).assertEqual("  ");
      // Vector 4: defaultIfEmpty("\t") returns "\t".
      logCase(TAG, "defaultIfEmpty normalize \t");
      expect(StringUtils.defaultIfEmpty("\t", 'fallback')).assertEqual("\t");
      // Vector 5: defaultIfEmpty("\n") returns "\n".
      logCase(TAG, "defaultIfEmpty normalize \n");
      expect(StringUtils.defaultIfEmpty("\n", 'fallback')).assertEqual("\n");
      // Vector 6: defaultIfEmpty("a") returns "a".
      logCase(TAG, "defaultIfEmpty normalize a");
      expect(StringUtils.defaultIfEmpty("a", 'fallback')).assertEqual("a");
      // Vector 7: defaultIfEmpty(" a ") returns " a ".
      logCase(TAG, "defaultIfEmpty normalize  a ");
      expect(StringUtils.defaultIfEmpty(" a ", 'fallback')).assertEqual(" a ");
      // Vector 8: defaultIfEmpty("0") returns "0".
      logCase(TAG, "defaultIfEmpty normalize 0");
      expect(StringUtils.defaultIfEmpty("0", 'fallback')).assertEqual("0");
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
