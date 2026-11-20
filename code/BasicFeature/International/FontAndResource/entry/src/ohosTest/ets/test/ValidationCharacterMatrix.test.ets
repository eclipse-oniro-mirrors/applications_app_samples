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
// Import the ValidateUtils helpers under test from the library HAR package.
import { ValidateUtils } from 'library';

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

// Registers every matrix case of the ValidationCharacterMatrixSuite suite.
export default function validationCharacterMatrixTest() {
  // Group the cases under the "ValidationCharacterMatrixSuite" describe block.
  describe('ValidationCharacterMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'ValidationCharacterMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_VALCHR_0100
     * @tc.name      testDigitsMatrix0001
     * @tc.desc      Verify isDigits accepts only non-empty decimal digit text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDigitsMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDigitsMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isDigits("0") returns True.
      logCase(TAG, "isDigits 0");
      expect(ValidateUtils.isDigits("0")).assertTrue();
      // Vector 2: isDigits("123") returns True.
      logCase(TAG, "isDigits 123");
      expect(ValidateUtils.isDigits("123")).assertTrue();
      // Vector 3: isDigits("00123") returns True.
      logCase(TAG, "isDigits 00123");
      expect(ValidateUtils.isDigits("00123")).assertTrue();
      // Vector 4: isDigits("") returns False.
      logCase(TAG, "isDigits ");
      expect(ValidateUtils.isDigits("")).assertFalse();
      // Vector 5: isDigits("12a") returns False.
      logCase(TAG, "isDigits 12a");
      expect(ValidateUtils.isDigits("12a")).assertFalse();
      // Vector 6: isDigits(" 1") returns False.
      logCase(TAG, "isDigits  1");
      expect(ValidateUtils.isDigits(" 1")).assertFalse();
      // Vector 7: isDigits("-1") returns False.
      logCase(TAG, "isDigits -1");
      expect(ValidateUtils.isDigits("-1")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_VALCHR_0200
     * @tc.name      testAlphaMatrix0001
     * @tc.desc      Verify isAlpha accepts only non-empty ASCII letter text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testAlphaMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testAlphaMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isAlpha("a") returns True.
      logCase(TAG, "isAlpha a");
      expect(ValidateUtils.isAlpha("a")).assertTrue();
      // Vector 2: isAlpha("abc") returns True.
      logCase(TAG, "isAlpha abc");
      expect(ValidateUtils.isAlpha("abc")).assertTrue();
      // Vector 3: isAlpha("ABC") returns True.
      logCase(TAG, "isAlpha ABC");
      expect(ValidateUtils.isAlpha("ABC")).assertTrue();
      // Vector 4: isAlpha("AbC") returns True.
      logCase(TAG, "isAlpha AbC");
      expect(ValidateUtils.isAlpha("AbC")).assertTrue();
      // Vector 5: isAlpha("") returns False.
      logCase(TAG, "isAlpha ");
      expect(ValidateUtils.isAlpha("")).assertFalse();
      // Vector 6: isAlpha("a1") returns False.
      logCase(TAG, "isAlpha a1");
      expect(ValidateUtils.isAlpha("a1")).assertFalse();
      // Vector 7: isAlpha("a b") returns False.
      logCase(TAG, "isAlpha a b");
      expect(ValidateUtils.isAlpha("a b")).assertFalse();
      // Vector 8: isAlpha("字体") returns False.
      logCase(TAG, "isAlpha 字体");
      expect(ValidateUtils.isAlpha("字体")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_VALCHR_0300
     * @tc.name      testIdCardMatrix0001
     * @tc.desc      Verify isIdCard18 checks the 18 character shape and checksum letter.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIdCardMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isIdCard18("11010519491231002X") returns True.
      logCase(TAG, "isIdCard18 11010519491231002X");
      expect(ValidateUtils.isIdCard18("11010519491231002X")).assertTrue();
      // Vector 2: isIdCard18("110105194912310021") returns True.
      logCase(TAG, "isIdCard18 110105194912310021");
      expect(ValidateUtils.isIdCard18("110105194912310021")).assertTrue();
      // Vector 3: isIdCard18("11010519491231002x") returns False.
      logCase(TAG, "isIdCard18 11010519491231002x");
      expect(ValidateUtils.isIdCard18("11010519491231002x")).assertFalse();
      // Vector 4: isIdCard18("11010519491231002") returns False.
      logCase(TAG, "isIdCard18 11010519491231002");
      expect(ValidateUtils.isIdCard18("11010519491231002")).assertFalse();
      // Vector 5: isIdCard18("1101051949123100211") returns False.
      logCase(TAG, "isIdCard18 1101051949123100211");
      expect(ValidateUtils.isIdCard18("1101051949123100211")).assertFalse();
      // Vector 6: isIdCard18("1101051949123100XX") returns False.
      logCase(TAG, "isIdCard18 1101051949123100XX");
      expect(ValidateUtils.isIdCard18("1101051949123100XX")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_VALCHR_0400
     * @tc.name      testLengthBetweenMatrix0001
     * @tc.desc      Verify lengthBetween compares the text length against inclusive bounds.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testLengthBetweenMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testLengthBetweenMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: lengthBetween("abc", 0, 3) returns True.
      logCase(TAG, "lengthBetween abc");
      expect(ValidateUtils.lengthBetween("abc", 0, 3)).assertTrue();
      // Vector 2: lengthBetween("abc", 3, 3) returns True.
      logCase(TAG, "lengthBetween abc");
      expect(ValidateUtils.lengthBetween("abc", 3, 3)).assertTrue();
      // Vector 3: lengthBetween("abc", 4, 9) returns False.
      logCase(TAG, "lengthBetween abc");
      expect(ValidateUtils.lengthBetween("abc", 4, 9)).assertFalse();
      // Vector 4: lengthBetween("", 0, 0) returns True.
      logCase(TAG, "lengthBetween ");
      expect(ValidateUtils.lengthBetween("", 0, 0)).assertTrue();
      // Vector 5: lengthBetween("abcd", 2, 3) returns False.
      logCase(TAG, "lengthBetween abcd");
      expect(ValidateUtils.lengthBetween("abcd", 2, 3)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
