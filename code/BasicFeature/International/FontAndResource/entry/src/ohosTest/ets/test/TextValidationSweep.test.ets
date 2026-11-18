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

// Registers every matrix case of the TextValidationSweepSuite suite.
export default function textValidationSweepTest() {
  // Group the cases under the "TextValidationSweepSuite" describe block.
  describe('TextValidationSweepSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'TextValidationSweepSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_VAL_0100
     * @tc.name      testValidationSweepMobileValid0001
     * @tc.desc      Verify isMobile accepts representative mainland mobile numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidationSweepMobileValid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidationSweepMobileValid0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isMobile("13800138000") accepts the valid number.
      logCase(TAG, "isMobile(\"13800138000\")");
      expect(ValidateUtils.isMobile("13800138000")).assertTrue();
      // Vector 2: isMobile("13912345678") accepts the valid number.
      logCase(TAG, "isMobile(\"13912345678\")");
      expect(ValidateUtils.isMobile("13912345678")).assertTrue();
      // Vector 3: isMobile("15000000000") accepts the valid number.
      logCase(TAG, "isMobile(\"15000000000\")");
      expect(ValidateUtils.isMobile("15000000000")).assertTrue();
      // Vector 4: isMobile("16666666666") accepts the valid number.
      logCase(TAG, "isMobile(\"16666666666\")");
      expect(ValidateUtils.isMobile("16666666666")).assertTrue();
      // Vector 5: isMobile("17777777777") accepts the valid number.
      logCase(TAG, "isMobile(\"17777777777\")");
      expect(ValidateUtils.isMobile("17777777777")).assertTrue();
      // Vector 6: isMobile("18888888888") accepts the valid number.
      logCase(TAG, "isMobile(\"18888888888\")");
      expect(ValidateUtils.isMobile("18888888888")).assertTrue();
      // Vector 7: isMobile("19999999999") accepts the valid number.
      logCase(TAG, "isMobile(\"19999999999\")");
      expect(ValidateUtils.isMobile("19999999999")).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_VAL_0200
     * @tc.name      testValidationSweepMobileInvalid0001
     * @tc.desc      Verify isMobile rejects malformed mainland mobile numbers.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidationSweepMobileInvalid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidationSweepMobileInvalid0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isMobile("12345678901") rejects the invalid number.
      logCase(TAG, "isMobile(\"12345678901\")");
      expect(ValidateUtils.isMobile("12345678901")).assertFalse();
      // Vector 2: isMobile("1380013800") rejects the invalid number.
      logCase(TAG, "isMobile(\"1380013800\")");
      expect(ValidateUtils.isMobile("1380013800")).assertFalse();
      // Vector 3: isMobile("138001380000") rejects the invalid number.
      logCase(TAG, "isMobile(\"138001380000\")");
      expect(ValidateUtils.isMobile("138001380000")).assertFalse();
      // Vector 4: isMobile("23800138000") rejects the invalid number.
      logCase(TAG, "isMobile(\"23800138000\")");
      expect(ValidateUtils.isMobile("23800138000")).assertFalse();
      // Vector 5: isMobile("1380013800a") rejects the invalid number.
      logCase(TAG, "isMobile(\"1380013800a\")");
      expect(ValidateUtils.isMobile("1380013800a")).assertFalse();
      // Vector 6: isMobile("") rejects the invalid number.
      logCase(TAG, "isMobile(\"\")");
      expect(ValidateUtils.isMobile("")).assertFalse();
      // Vector 7: isMobile(" 13800138000") rejects the invalid number.
      logCase(TAG, "isMobile(\" 13800138000\")");
      expect(ValidateUtils.isMobile(" 13800138000")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_VAL_0300
     * @tc.name      testValidationSweepEmailValid0001
     * @tc.desc      Verify isEmail accepts representative mailbox shapes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidationSweepEmailValid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidationSweepEmailValid0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isEmail("user@example.com") accepts the valid address.
      logCase(TAG, "isEmail(\"user@example.com\")");
      expect(ValidateUtils.isEmail("user@example.com")).assertTrue();
      // Vector 2: isEmail("a.b+c@example.co.uk") accepts the valid address.
      logCase(TAG, "isEmail(\"a.b+c@example.co.uk\")");
      expect(ValidateUtils.isEmail("a.b+c@example.co.uk")).assertTrue();
      // Vector 3: isEmail("first_last@sub.domain.org") accepts the valid address.
      logCase(TAG, "isEmail(\"first_last@sub.domain.org\")");
      expect(ValidateUtils.isEmail("first_last@sub.domain.org")).assertTrue();
      // Vector 4: isEmail("x@y.io") accepts the valid address.
      logCase(TAG, "isEmail(\"x@y.io\")");
      expect(ValidateUtils.isEmail("x@y.io")).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_VAL_0400
     * @tc.name      testValidationSweepEmailInvalid0001
     * @tc.desc      Verify isEmail rejects malformed mailbox shapes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidationSweepEmailInvalid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidationSweepEmailInvalid0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isEmail("user") rejects the invalid address.
      logCase(TAG, "isEmail(\"user\")");
      expect(ValidateUtils.isEmail("user")).assertFalse();
      // Vector 2: isEmail("user@") rejects the invalid address.
      logCase(TAG, "isEmail(\"user@\")");
      expect(ValidateUtils.isEmail("user@")).assertFalse();
      // Vector 3: isEmail("@example.com") rejects the invalid address.
      logCase(TAG, "isEmail(\"@example.com\")");
      expect(ValidateUtils.isEmail("@example.com")).assertFalse();
      // Vector 4: isEmail("user@example") rejects the invalid address.
      logCase(TAG, "isEmail(\"user@example\")");
      expect(ValidateUtils.isEmail("user@example")).assertFalse();
      // Vector 5: isEmail("user@@example.com") rejects the invalid address.
      logCase(TAG, "isEmail(\"user@@example.com\")");
      expect(ValidateUtils.isEmail("user@@example.com")).assertFalse();
      // Vector 6: isEmail("user@example.c") rejects the invalid address.
      logCase(TAG, "isEmail(\"user@example.c\")");
      expect(ValidateUtils.isEmail("user@example.c")).assertFalse();
      // Vector 7: isEmail("") rejects the invalid address.
      logCase(TAG, "isEmail(\"\")");
      expect(ValidateUtils.isEmail("")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_VAL_0500
     * @tc.name      testValidationSweepIpv4Valid0001
     * @tc.desc      Verify isIpv4 accepts representative dotted quad addresses.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidationSweepIpv4Valid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidationSweepIpv4Valid0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isIpv4("0.0.0.0") accepts the valid address.
      logCase(TAG, "isIpv4(\"0.0.0.0\")");
      expect(ValidateUtils.isIpv4("0.0.0.0")).assertTrue();
      // Vector 2: isIpv4("1.2.3.4") accepts the valid address.
      logCase(TAG, "isIpv4(\"1.2.3.4\")");
      expect(ValidateUtils.isIpv4("1.2.3.4")).assertTrue();
      // Vector 3: isIpv4("192.168.1.1") accepts the valid address.
      logCase(TAG, "isIpv4(\"192.168.1.1\")");
      expect(ValidateUtils.isIpv4("192.168.1.1")).assertTrue();
      // Vector 4: isIpv4("255.255.255.255") accepts the valid address.
      logCase(TAG, "isIpv4(\"255.255.255.255\")");
      expect(ValidateUtils.isIpv4("255.255.255.255")).assertTrue();
      // Vector 5: isIpv4("10.0.0.1") accepts the valid address.
      logCase(TAG, "isIpv4(\"10.0.0.1\")");
      expect(ValidateUtils.isIpv4("10.0.0.1")).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_VAL_0600
     * @tc.name      testValidationSweepIpv4Invalid0001
     * @tc.desc      Verify isIpv4 rejects out-of-range octets and malformed shapes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidationSweepIpv4Invalid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidationSweepIpv4Invalid0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isIpv4("256.1.1.1") rejects the invalid address.
      logCase(TAG, "isIpv4(\"256.1.1.1\")");
      expect(ValidateUtils.isIpv4("256.1.1.1")).assertFalse();
      // Vector 2: isIpv4("1.1.1") rejects the invalid address.
      logCase(TAG, "isIpv4(\"1.1.1\")");
      expect(ValidateUtils.isIpv4("1.1.1")).assertFalse();
      // Vector 3: isIpv4("1.1.1.1.1") rejects the invalid address.
      logCase(TAG, "isIpv4(\"1.1.1.1.1\")");
      expect(ValidateUtils.isIpv4("1.1.1.1.1")).assertFalse();
      // Vector 4: isIpv4("01.1.1.1") rejects the invalid address.
      logCase(TAG, "isIpv4(\"01.1.1.1\")");
      expect(ValidateUtils.isIpv4("01.1.1.1")).assertFalse();
      // Vector 5: isIpv4("1.1.1.a") rejects the invalid address.
      logCase(TAG, "isIpv4(\"1.1.1.a\")");
      expect(ValidateUtils.isIpv4("1.1.1.a")).assertFalse();
      // Vector 6: isIpv4("") rejects the invalid address.
      logCase(TAG, "isIpv4(\"\")");
      expect(ValidateUtils.isIpv4("")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_VAL_0700
     * @tc.name      testValidationSweepHexValid0001
     * @tc.desc      Verify isHexColor accepts three, six and eight digit color codes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidationSweepHexValid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidationSweepHexValid0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isHexColor("#fff") accepts the valid color.
      logCase(TAG, "isHexColor(\"#fff\")");
      expect(ValidateUtils.isHexColor("#fff")).assertTrue();
      // Vector 2: isHexColor("#FFF") accepts the valid color.
      logCase(TAG, "isHexColor(\"#FFF\")");
      expect(ValidateUtils.isHexColor("#FFF")).assertTrue();
      // Vector 3: isHexColor("#123456") accepts the valid color.
      logCase(TAG, "isHexColor(\"#123456\")");
      expect(ValidateUtils.isHexColor("#123456")).assertTrue();
      // Vector 4: isHexColor("#abcdef") accepts the valid color.
      logCase(TAG, "isHexColor(\"#abcdef\")");
      expect(ValidateUtils.isHexColor("#abcdef")).assertTrue();
      // Vector 5: isHexColor("#ABCDEF") accepts the valid color.
      logCase(TAG, "isHexColor(\"#ABCDEF\")");
      expect(ValidateUtils.isHexColor("#ABCDEF")).assertTrue();
      // Vector 6: isHexColor("#11223344") accepts the valid color.
      logCase(TAG, "isHexColor(\"#11223344\")");
      expect(ValidateUtils.isHexColor("#11223344")).assertTrue();
      // Vector 7: isHexColor("#aabbccdd") accepts the valid color.
      logCase(TAG, "isHexColor(\"#aabbccdd\")");
      expect(ValidateUtils.isHexColor("#aabbccdd")).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_SW_VAL_0800
     * @tc.name      testValidationSweepHexInvalid0001
     * @tc.desc      Verify isHexColor rejects malformed color codes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidationSweepHexInvalid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testValidationSweepHexInvalid0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Vector 1: isHexColor("fff") rejects the invalid color.
      logCase(TAG, "isHexColor(\"fff\")");
      expect(ValidateUtils.isHexColor("fff")).assertFalse();
      // Vector 2: isHexColor("#ff") rejects the invalid color.
      logCase(TAG, "isHexColor(\"#ff\")");
      expect(ValidateUtils.isHexColor("#ff")).assertFalse();
      // Vector 3: isHexColor("#ffff") rejects the invalid color.
      logCase(TAG, "isHexColor(\"#ffff\")");
      expect(ValidateUtils.isHexColor("#ffff")).assertFalse();
      // Vector 4: isHexColor("#ggg") rejects the invalid color.
      logCase(TAG, "isHexColor(\"#ggg\")");
      expect(ValidateUtils.isHexColor("#ggg")).assertFalse();
      // Vector 5: isHexColor("#12345") rejects the invalid color.
      logCase(TAG, "isHexColor(\"#12345\")");
      expect(ValidateUtils.isHexColor("#12345")).assertFalse();
      // Vector 6: isHexColor("#1234567") rejects the invalid color.
      logCase(TAG, "isHexColor(\"#1234567\")");
      expect(ValidateUtils.isHexColor("#1234567")).assertFalse();
      // Vector 7: isHexColor("") rejects the invalid color.
      logCase(TAG, "isHexColor(\"\")");
      expect(ValidateUtils.isHexColor("")).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
