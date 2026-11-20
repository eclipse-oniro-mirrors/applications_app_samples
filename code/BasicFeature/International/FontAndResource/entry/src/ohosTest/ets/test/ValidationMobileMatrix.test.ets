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

// Registers every matrix case of the ValidationMobileMatrixSuite suite.
export default function validationMobileMatrixTest() {
  // Group the cases under the "ValidationMobileMatrixSuite" describe block.
  describe('ValidationMobileMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'ValidationMobileMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_VALMOB_0100
     * @tc.name      testMobileValid0001
     * @tc.desc      Verify isMobile accepts every valid mainland mobile prefix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMobileValid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testMobileValid0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isMobile("13800138000") accepts the valid number.
      logCase(TAG, "isMobile valid 13800138000");
      expect(ValidateUtils.isMobile("13800138000")).assertTrue();
      // Vector 2: isMobile("13912345678") accepts the valid number.
      logCase(TAG, "isMobile valid 13912345678");
      expect(ValidateUtils.isMobile("13912345678")).assertTrue();
      // Vector 3: isMobile("15000000000") accepts the valid number.
      logCase(TAG, "isMobile valid 15000000000");
      expect(ValidateUtils.isMobile("15000000000")).assertTrue();
      // Vector 4: isMobile("17777777777") accepts the valid number.
      logCase(TAG, "isMobile valid 17777777777");
      expect(ValidateUtils.isMobile("17777777777")).assertTrue();
      // Vector 5: isMobile("18888888888") accepts the valid number.
      logCase(TAG, "isMobile valid 18888888888");
      expect(ValidateUtils.isMobile("18888888888")).assertTrue();
      // Vector 6: isMobile("19999999999") accepts the valid number.
      logCase(TAG, "isMobile valid 19999999999");
      expect(ValidateUtils.isMobile("19999999999")).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_VALMOB_0200
     * @tc.name      testMobileInvalid0001
     * @tc.desc      Verify isMobile rejects malformed, short and long numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMobileInvalid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMobileInvalid0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isMobile("") rejects the invalid number.
      logCase(TAG, "isMobile invalid ");
      expect(ValidateUtils.isMobile("")).assertFalse();
      // Vector 2: isMobile("1380013800") rejects the invalid number.
      logCase(TAG, "isMobile invalid 1380013800");
      expect(ValidateUtils.isMobile("1380013800")).assertFalse();
      // Vector 3: isMobile("138001380000") rejects the invalid number.
      logCase(TAG, "isMobile invalid 138001380000");
      expect(ValidateUtils.isMobile("138001380000")).assertFalse();
      // Vector 4: isMobile("12800138000") rejects the invalid number.
      logCase(TAG, "isMobile invalid 12800138000");
      expect(ValidateUtils.isMobile("12800138000")).assertFalse();
      // Vector 5: isMobile("23800138000") rejects the invalid number.
      logCase(TAG, "isMobile invalid 23800138000");
      expect(ValidateUtils.isMobile("23800138000")).assertFalse();
      // Vector 6: isMobile("1380013800a") rejects the invalid number.
      logCase(TAG, "isMobile invalid 1380013800a");
      expect(ValidateUtils.isMobile("1380013800a")).assertFalse();
      // Vector 7: isMobile(" 13800138000") rejects the invalid number.
      logCase(TAG, "isMobile invalid  13800138000");
      expect(ValidateUtils.isMobile(" 13800138000")).assertFalse();
      // Vector 8: isMobile("13800138000 ") rejects the invalid number.
      logCase(TAG, "isMobile invalid 13800138000 ");
      expect(ValidateUtils.isMobile("13800138000 ")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_VALMOB_0300
     * @tc.name      testMobileMatrix0001
     * @tc.desc      Verify isMobile against a mixed valid and invalid matrix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMobileMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMobileMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isMobile("13800138000") matches the expected True.
      logCase(TAG, "isMobile matrix 13800138000");
      expect(ValidateUtils.isMobile("13800138000")).assertTrue();
      // Vector 2: isMobile("13912345678") matches the expected True.
      logCase(TAG, "isMobile matrix 13912345678");
      expect(ValidateUtils.isMobile("13912345678")).assertTrue();
      // Vector 3: isMobile("15000000000") matches the expected True.
      logCase(TAG, "isMobile matrix 15000000000");
      expect(ValidateUtils.isMobile("15000000000")).assertTrue();
      // Vector 4: isMobile("17777777777") matches the expected True.
      logCase(TAG, "isMobile matrix 17777777777");
      expect(ValidateUtils.isMobile("17777777777")).assertTrue();
      // Vector 5: isMobile("18888888888") matches the expected True.
      logCase(TAG, "isMobile matrix 18888888888");
      expect(ValidateUtils.isMobile("18888888888")).assertTrue();
      // Vector 6: isMobile("19999999999") matches the expected True.
      logCase(TAG, "isMobile matrix 19999999999");
      expect(ValidateUtils.isMobile("19999999999")).assertTrue();
      // Vector 7: isMobile("") matches the expected False.
      logCase(TAG, "isMobile matrix ");
      expect(ValidateUtils.isMobile("")).assertFalse();
      // Vector 8: isMobile("1380013800") matches the expected False.
      logCase(TAG, "isMobile matrix 1380013800");
      expect(ValidateUtils.isMobile("1380013800")).assertFalse();
      // Vector 9: isMobile("138001380000") matches the expected False.
      logCase(TAG, "isMobile matrix 138001380000");
      expect(ValidateUtils.isMobile("138001380000")).assertFalse();
      // Vector 10: isMobile("12800138000") matches the expected False.
      logCase(TAG, "isMobile matrix 12800138000");
      expect(ValidateUtils.isMobile("12800138000")).assertFalse();
      // Vector 11: isMobile("23800138000") matches the expected False.
      logCase(TAG, "isMobile matrix 23800138000");
      expect(ValidateUtils.isMobile("23800138000")).assertFalse();
      // Vector 12: isMobile("1380013800a") matches the expected False.
      logCase(TAG, "isMobile matrix 1380013800a");
      expect(ValidateUtils.isMobile("1380013800a")).assertFalse();
      // Vector 13: isMobile(" 13800138000") matches the expected False.
      logCase(TAG, "isMobile matrix  13800138000");
      expect(ValidateUtils.isMobile(" 13800138000")).assertFalse();
      // Vector 14: isMobile("13800138000 ") matches the expected False.
      logCase(TAG, "isMobile matrix 13800138000 ");
      expect(ValidateUtils.isMobile("13800138000 ")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
