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

// Import the validation helpers under test from the library HAR package.
import { ValidateUtils } from 'library';
// Import hilog directly for device side test logging.
import { hilog } from '@kit.PerformanceAnalysisKit';
// Import the hypium test framework primitives used by this suite.
import { beforeAll, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

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

// Registers every on-device logic test case of the validation helpers.
export function validateUtilsTest() {
  // Group the cases under the "ValidateUtilsSuite" describe block.
  describe('ValidateUtilsSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'ValidateUtilsSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_VALIDATE_0100
     * @tc.name      testValidateIsMobile0100
     * @tc.desc      Verify isMobile accepts an eleven digit mainland number with a 3-9 second digit and rejects wrong prefixes and wrong lengths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateIsMobile0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testValidateIsMobile0100';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Compute the mobile result for a valid eleven digit number.
      const validResult: boolean = ValidateUtils.isMobile('13800138000');
      // Log the valid number result.
      logCase(TAG, 'isMobile(13800138000): ' + validResult);
      // Expect the valid mainland number to be accepted.
      expect(validResult).assertTrue();

      // Expect a number whose second digit is outside 3-9 to be rejected.
      expect(ValidateUtils.isMobile('12345678901')).assertFalse();
      // Expect a ten digit number to be too short for the eleven digit pattern.
      expect(ValidateUtils.isMobile('1380013800')).assertFalse();
      // Expect a twelve digit number to be too long for the eleven digit pattern.
      expect(ValidateUtils.isMobile('138001380001')).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_VALIDATE_0200
     * @tc.name      testValidateIsEmail0110
     * @tc.desc      Verify isEmail accepts a local part with a dotted domain and rejects a missing domain dot and a missing local part.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateIsEmail0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testValidateIsEmail0110';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Compute the email result for a plain valid address.
      const validResult: boolean = ValidateUtils.isEmail('user@ex.com');
      // Log the valid address result.
      logCase(TAG, 'isEmail(user@ex.com): ' + validResult);
      // Expect the plain valid address to be accepted.
      expect(validResult).assertTrue();

      // Expect a domain without a dotted top level part to be rejected.
      expect(ValidateUtils.isEmail('user@ex')).assertFalse();
      // Expect a missing local part before the at sign to be rejected.
      expect(ValidateUtils.isEmail('@ex.com')).assertFalse();
      // Expect dots inside the local part to be accepted.
      expect(ValidateUtils.isEmail('user.name@ex.com')).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_VALIDATE_0300
     * @tc.name      testValidateIsIpv4Valid0120
     * @tc.desc      Verify isIpv4 accepts zero octets, the maximum octet value and a common mixed address.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateIsIpv4Valid0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testValidateIsIpv4Valid0120';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Compute the address result for the all zero address.
      const zerosResult: boolean = ValidateUtils.isIpv4('0.0.0.0');
      // Log the all zero address result.
      logCase(TAG, 'isIpv4(0.0.0.0): ' + zerosResult);
      // Expect the all zero address to be accepted.
      expect(zerosResult).assertTrue();

      // Expect the maximum octet value in every position to be accepted.
      expect(ValidateUtils.isIpv4('255.255.255.255')).assertTrue();
      // Expect a common mixed address to pass the shape and range checks.
      expect(ValidateUtils.isIpv4('192.168.1.1')).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_VALIDATE_0400
     * @tc.name      testValidateIsIpv4Invalid0130
     * @tc.desc      Verify isIpv4 rejects an octet above 255, a leading zero octet and wrong dotted quad part counts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateIsIpv4Invalid0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testValidateIsIpv4Invalid0130';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Compute the address result for an octet above the maximum value.
      const overflowResult: boolean = ValidateUtils.isIpv4('256.1.1.1');
      // Log the overflow octet result.
      logCase(TAG, 'isIpv4(256.1.1.1): ' + overflowResult);
      // Expect the octet above 255 to be rejected.
      expect(overflowResult).assertFalse();

      // Expect a leading zero octet to be rejected.
      expect(ValidateUtils.isIpv4('01.1.1.1')).assertFalse();
      // Expect a three part address to fail the dotted quad shape.
      expect(ValidateUtils.isIpv4('1.1.1')).assertFalse();
      // Expect a five part address to fail the dotted quad shape.
      expect(ValidateUtils.isIpv4('1.1.1.1.1')).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_VALIDATE_0500
     * @tc.name      testValidateIsHexColor0140
     * @tc.desc      Verify isHexColor accepts three, six and eight digit hex codes and rejects non hex characters and a four digit length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateIsHexColor0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testValidateIsHexColor0140';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Compute the color result for the three digit shorthand form.
      const shortResult: boolean = ValidateUtils.isHexColor('#fff');
      // Log the shorthand form result.
      logCase(TAG, 'isHexColor(#fff): ' + shortResult);
      // Expect the three digit shorthand form to be accepted.
      expect(shortResult).assertTrue();

      // Expect the six digit upper case form to be accepted.
      expect(ValidateUtils.isHexColor('#FFFFFF')).assertTrue();
      // Expect the eight digit form with alpha channel to be accepted.
      expect(ValidateUtils.isHexColor('#FFFFFFFF')).assertTrue();
      // Expect characters outside the hexadecimal alphabet to be rejected.
      expect(ValidateUtils.isHexColor('#GGG')).assertFalse();
      // Expect a four digit length to be rejected.
      expect(ValidateUtils.isHexColor('#ffff')).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_VALIDATE_0600
     * @tc.name      testValidateIsDigits0150
     * @tc.desc      Verify isDigits accepts pure decimal digit strings and rejects the empty string and any non digit character.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateIsDigits0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testValidateIsDigits0150';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Compute the digit result for a pure digit string.
      const digitsResult: boolean = ValidateUtils.isDigits('123');
      // Log the pure digit string result.
      logCase(TAG, "isDigits('123'): " + digitsResult);
      // Expect the pure digit string to be accepted.
      expect(digitsResult).assertTrue();

      // Expect the empty string to be rejected.
      expect(ValidateUtils.isDigits('')).assertFalse();
      // Expect a trailing letter to break the digit only requirement.
      expect(ValidateUtils.isDigits('12a')).assertFalse();
      // Expect a space between digits to break the digit only requirement.
      expect(ValidateUtils.isDigits('1 2')).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_VALIDATE_0700
     * @tc.name      testValidateIsAlpha0160
     * @tc.desc      Verify isAlpha accepts mixed case ASCII letters and rejects the empty string and any non letter character.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValidateIsAlpha0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testValidateIsAlpha0160';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Compute the alpha result for mixed lower and upper case letters.
      const lettersResult: boolean = ValidateUtils.isAlpha('abcABC');
      // Log the mixed case letters result.
      logCase(TAG, "isAlpha('abcABC'): " + lettersResult);
      // Expect the mixed case letters to be accepted.
      expect(lettersResult).assertTrue();

      // Expect the empty string to be rejected.
      expect(ValidateUtils.isAlpha('')).assertFalse();
      // Expect a digit inside the text to break the letter only requirement.
      expect(ValidateUtils.isAlpha('ab1')).assertFalse();
      // Expect a space inside the text to break the letter only requirement.
      expect(ValidateUtils.isAlpha('a b')).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_VALIDATE_0800
     * @tc.name      testValidateIsIdCard0170
     * @tc.desc      Verify isIdCard18 accepts an upper case X or a digit checksum and rejects a lower case x, a wrong length and a non digit body character.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateIsIdCard0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testValidateIsIdCard0170';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare a valid eighteen character id number ending with the upper case X checksum.
      const idWithUpperX: string = '11010519491231002X';
      // Prepare a valid eighteen character id number ending with a digit checksum.
      const idWithDigit: string = '110105194912310023';
      // Prepare an eighteen character id number whose checksum is the lower case x.
      const idWithLowerX: string = '11010519491231002x';
      // Prepare a seventeen digit body without the checksum position.
      const idTooShort: string = '11010519491231002';
      // Prepare an eighteen character id number with a letter inside the digit body.
      const idWithLetterBody: string = '1101051949123100X3';

      // Compute the id result for the upper case X checksum.
      const withUpperXResult: boolean = ValidateUtils.isIdCard18(idWithUpperX);
      // Log the upper case X checksum result.
      logCase(TAG, 'isIdCard18(body17+X): ' + withUpperXResult);
      // Expect the upper case X checksum to be accepted.
      expect(withUpperXResult).assertTrue();

      // Expect the digit checksum to be accepted.
      expect(ValidateUtils.isIdCard18(idWithDigit)).assertTrue();
      // Expect the lower case x checksum to be rejected.
      expect(ValidateUtils.isIdCard18(idWithLowerX)).assertFalse();
      // Expect the seventeen digit body to fail the exact length rule.
      expect(ValidateUtils.isIdCard18(idTooShort)).assertFalse();
      // Expect a letter inside the digit body to be rejected.
      expect(ValidateUtils.isIdCard18(idWithLetterBody)).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_VALIDATE_0900
     * @tc.name      testValidateLengthBetween0180
     * @tc.desc      Verify lengthBetween treats both bounds inclusively and rejects lengths below the minimum or above the maximum.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValidateLengthBetween0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testValidateLengthBetween0180';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Compute the range result for a length equal to the minimum bound.
      const atMinResult: boolean = ValidateUtils.lengthBetween('abc', 3, 5);
      // Log the minimum bound result.
      logCase(TAG, 'lengthBetween(len3,[3,5]): ' + atMinResult);
      // Expect the minimum bound to be included in the range.
      expect(atMinResult).assertTrue();

      // Expect the maximum bound to be included in the range.
      expect(ValidateUtils.lengthBetween('abcde', 3, 5)).assertTrue();
      // Expect a length below the minimum bound to be rejected.
      expect(ValidateUtils.lengthBetween('ab', 3, 5)).assertFalse();
      // Expect a length above the maximum bound to be rejected.
      expect(ValidateUtils.lengthBetween('abcdef', 3, 5)).assertFalse();
      // Expect a zero length string to satisfy a zero width range.
      expect(ValidateUtils.lengthBetween('', 0, 0)).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
