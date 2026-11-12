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

// Registers every matrix case of the ValidationNetworkMatrixSuite suite.
export default function validationNetworkMatrixTest() {
  // Group the cases under the "ValidationNetworkMatrixSuite" describe block.
  describe('ValidationNetworkMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'ValidationNetworkMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_VALNET_0100
     * @tc.name      testEmailMatrix0001
     * @tc.desc      Verify isEmail accepts common shapes and rejects malformed addresses.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testEmailMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testEmailMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isEmail("a@b.co") returns True.
      logCase(TAG, "isEmail a@b.co");
      expect(ValidateUtils.isEmail("a@b.co")).assertTrue();
      // Vector 2: isEmail("user.name+tag@example.com") returns True.
      logCase(TAG, "isEmail user.name+tag@example.com");
      expect(ValidateUtils.isEmail("user.name+tag@example.com")).assertTrue();
      // Vector 3: isEmail("USER_99@sub.domain.cn") returns True.
      logCase(TAG, "isEmail USER_99@sub.domain.cn");
      expect(ValidateUtils.isEmail("USER_99@sub.domain.cn")).assertTrue();
      // Vector 4: isEmail("a@b") returns False.
      logCase(TAG, "isEmail a@b");
      expect(ValidateUtils.isEmail("a@b")).assertFalse();
      // Vector 5: isEmail("@b.com") returns False.
      logCase(TAG, "isEmail @b.com");
      expect(ValidateUtils.isEmail("@b.com")).assertFalse();
      // Vector 6: isEmail("a@.com") returns False.
      logCase(TAG, "isEmail a@.com");
      expect(ValidateUtils.isEmail("a@.com")).assertFalse();
      // Vector 7: isEmail("a b@c.com") returns False.
      logCase(TAG, "isEmail a b@c.com");
      expect(ValidateUtils.isEmail("a b@c.com")).assertFalse();
      // Vector 8: isEmail("a@b.c") returns False.
      logCase(TAG, "isEmail a@b.c");
      expect(ValidateUtils.isEmail("a@b.c")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_VALNET_0200
     * @tc.name      testIpv4Matrix0001
     * @tc.desc      Verify isIpv4 checks the shape and every octet range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIpv4Matrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIpv4Matrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isIpv4("0.0.0.0") returns True.
      logCase(TAG, "isIpv4 0.0.0.0");
      expect(ValidateUtils.isIpv4("0.0.0.0")).assertTrue();
      // Vector 2: isIpv4("255.255.255.255") returns True.
      logCase(TAG, "isIpv4 255.255.255.255");
      expect(ValidateUtils.isIpv4("255.255.255.255")).assertTrue();
      // Vector 3: isIpv4("192.168.1.1") returns True.
      logCase(TAG, "isIpv4 192.168.1.1");
      expect(ValidateUtils.isIpv4("192.168.1.1")).assertTrue();
      // Vector 4: isIpv4("10.0.0.1") returns True.
      logCase(TAG, "isIpv4 10.0.0.1");
      expect(ValidateUtils.isIpv4("10.0.0.1")).assertTrue();
      // Vector 5: isIpv4("256.1.1.1") returns False.
      logCase(TAG, "isIpv4 256.1.1.1");
      expect(ValidateUtils.isIpv4("256.1.1.1")).assertFalse();
      // Vector 6: isIpv4("1.2.3") returns False.
      logCase(TAG, "isIpv4 1.2.3");
      expect(ValidateUtils.isIpv4("1.2.3")).assertFalse();
      // Vector 7: isIpv4("1.2.3.4.5") returns False.
      logCase(TAG, "isIpv4 1.2.3.4.5");
      expect(ValidateUtils.isIpv4("1.2.3.4.5")).assertFalse();
      // Vector 8: isIpv4("01.2.3.4") returns False.
      logCase(TAG, "isIpv4 01.2.3.4");
      expect(ValidateUtils.isIpv4("01.2.3.4")).assertFalse();
      // Vector 9: isIpv4("1.2.3.a") returns False.
      logCase(TAG, "isIpv4 1.2.3.a");
      expect(ValidateUtils.isIpv4("1.2.3.a")).assertFalse();
      // Vector 10: isIpv4("1.2.3.256") returns False.
      logCase(TAG, "isIpv4 1.2.3.256");
      expect(ValidateUtils.isIpv4("1.2.3.256")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_MX_VALNET_0300
     * @tc.name      testHexColorMatrix0001
     * @tc.desc      Verify isHexColor accepts only 3, 6 or 8 hexadecimal digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testHexColorMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testHexColorMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isHexColor("#fff") returns True.
      logCase(TAG, "isHexColor #fff");
      expect(ValidateUtils.isHexColor("#fff")).assertTrue();
      // Vector 2: isHexColor("#FFF") returns True.
      logCase(TAG, "isHexColor #FFF");
      expect(ValidateUtils.isHexColor("#FFF")).assertTrue();
      // Vector 3: isHexColor("#ffffff") returns True.
      logCase(TAG, "isHexColor #ffffff");
      expect(ValidateUtils.isHexColor("#ffffff")).assertTrue();
      // Vector 4: isHexColor("#000000") returns True.
      logCase(TAG, "isHexColor #000000");
      expect(ValidateUtils.isHexColor("#000000")).assertTrue();
      // Vector 5: isHexColor("#FFFFFFFF") returns True.
      logCase(TAG, "isHexColor #FFFFFFFF");
      expect(ValidateUtils.isHexColor("#FFFFFFFF")).assertTrue();
      // Vector 6: isHexColor("#ggg") returns False.
      logCase(TAG, "isHexColor #ggg");
      expect(ValidateUtils.isHexColor("#ggg")).assertFalse();
      // Vector 7: isHexColor("fff") returns False.
      logCase(TAG, "isHexColor fff");
      expect(ValidateUtils.isHexColor("fff")).assertFalse();
      // Vector 8: isHexColor("#ff") returns False.
      logCase(TAG, "isHexColor #ff");
      expect(ValidateUtils.isHexColor("#ff")).assertFalse();
      // Vector 9: isHexColor("#fffff") returns False.
      logCase(TAG, "isHexColor #fffff");
      expect(ValidateUtils.isHexColor("#fffff")).assertFalse();
      // Vector 10: isHexColor("#fffffff") returns False.
      logCase(TAG, "isHexColor #fffffff");
      expect(ValidateUtils.isHexColor("#fffffff")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
