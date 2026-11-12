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

// The valid mainland mobile number used by the positive cases.
const MOBILE_VALID: string = '13812345678';
// A second valid mobile number that starts with the ninteen prefix.
const MOBILE_VALID_TWO: string = '19912345678';
// A third valid mobile number that uses the seventeen prefix.
const MOBILE_VALID_THREE: string = '17012345678';
// The eleven digit text that uses an unsupported second digit.
const MOBILE_BAD_PREFIX: string = '12812345678';
// The eleven digit text that starts with two instead of one.
const MOBILE_BAD_HEAD: string = '23812345678';
// The ten digit text that is one character short of a mobile number.
const MOBILE_SHORT: string = '1381234567';
// The twelve digit text that is one character longer than a mobile number.
const MOBILE_LONG: string = '138123456789';
// The mobile shaped text that contains a letter instead of a digit.
const MOBILE_LETTER: string = '1381234567a';
// The mobile shaped text that carries a plus prefix.
const MOBILE_PLUS: string = '+8613812345678';
// The mobile shaped text that carries a space separator.
const MOBILE_SPACE: string = '138 1234 5678';

// The ordinary email address used by the positive cases.
const EMAIL_PLAIN: string = 'user@example.com';
// The email address that mixes dots, underscores and a plus tag.
const EMAIL_TAGGED: string = 'first.last+tag_1@mail.example.org';
// The email address that uses a two letter top level domain.
const EMAIL_SHORT_TLD: string = 'a@b.cn';
// The email address that misses the at sign.
const EMAIL_NO_AT: string = 'userexample.com';
// The email address that misses the local part.
const EMAIL_NO_LOCAL: string = '@example.com';
// The email address that misses the domain part.
const EMAIL_NO_DOMAIN: string = 'user@';
// The email address whose top level domain is a single letter.
const EMAIL_ONE_LETTER_TLD: string = 'user@example.c';
// The email address that keeps a trailing dot at the end of the domain.
const EMAIL_TRAILING_DOT: string = 'user@example.com.';
// The email address that contains an inner space.
const EMAIL_INNER_SPACE: string = 'us er@example.com';

// The lowest IPv4 address of the address space.
const IPV4_ZERO: string = '0.0.0.0';
// The highest IPv4 address of the address space.
const IPV4_MAX: string = '255.255.255.255';
// An ordinary IPv4 address used by the positive cases.
const IPV4_NORMAL: string = '192.168.1.1';
// The IPv4 address that exceeds the octet upper bound in the first octet.
const IPV4_OCTET_OVER: string = '256.1.1.1';
// The IPv4 address whose first octet carries a leading zero.
const IPV4_LEADING_ZERO: string = '01.1.1.1';
// The IPv4 address that only has three octets.
const IPV4_THREE_OCTETS: string = '1.1.1';
// The IPv4 address that carries five octets.
const IPV4_FIVE_OCTETS: string = '1.1.1.1.1';
// The IPv4 address whose last octet is empty.
const IPV4_EMPTY_OCTET: string = '1.1.1.';
// The IPv4 address whose second octet is beyond the upper bound.
const IPV4_OCTET_OVER_TWO: string = '1.300.1.1';

// The short hexadecimal colour used by the positive cases.
const COLOR_SHORT: string = '#fff';
// The six digit hexadecimal colour used by the positive cases.
const COLOR_SIX: string = '#FFFFFF';
// The eight digit hexadecimal colour that carries the alpha channel.
const COLOR_EIGHT: string = '#FFFFFFFF';
// The mixed case six digit colour used by the positive cases.
const COLOR_MIXED: string = '#aBcDeF';
// The colour whose digits fall outside the hexadecimal alphabet.
const COLOR_BAD_LETTER: string = '#GGG';
// The colour that misses the leading hash.
const COLOR_NO_HASH: string = 'fff';
// The colour with four digits that matches no accepted width.
const COLOR_FOUR: string = '#ffff';
// The colour with five digits that matches no accepted width.
const COLOR_FIVE: string = '#fffff';
// The colour with seven digits that matches no accepted width.
const COLOR_SEVEN: string = '#fffffff';
// The colour with nine digits that matches no accepted width.
const COLOR_NINE: string = '#fffffffff';
// The colour that carries an inner space.
const COLOR_SPACE: string = '#fff fff';

// The valid eighteen digit identity number without a checksum letter.
const ID_VALID_DIGIT: string = '110105194912310021';
// The valid eighteen digit identity number that ends with the letter X.
const ID_VALID_UPPER_X: string = '11010519491231002X';
// The eighteen digit identity number that ends with a lower case x.
const ID_LOWER_X: string = '11010519491231002x';
// The seventeen digit identity number that is one character short.
const ID_SHORT: string = '11010519491231002';
// The nineteen digit identity number that is one character long.
const ID_LONG: string = '1101051949123100211';
// The eighteen character identity number that holds a letter inside the body.
const ID_LETTER_BODY: string = '11010519491231002A';
// The eighteen character identity number whose third character is a dash.
const ID_DASH: string = '11-105194912310021';

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Counts how often the expected verdict appears in the result table of one matrix case.
function countVerdict(results: boolean[], expected: boolean): number {
  // Track the number of rows that matched the expected verdict.
  let matched: number = 0;
  // Walk every result of the table.
  for (let i: number = 0; i < results.length; i++) {
    // Register one more match when the verdict equals the expectation.
    if (results[i] === expected) {
      // Count the matching row.
      matched += 1;
    }
  }
  // Return the total number of matching rows.
  return matched;
}

// Registers every on-device logic test case of the validation helpers.
export default function validateUtilsAdvancedTest() {
  // Group the cases under the "ValidateUtilsAdvancedSuite" describe block.
  describe('ValidateUtilsAdvancedSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'ValidateUtilsAdvancedSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_VALX_0100
     * @tc.name      testValxMobileMatrix0001
     * @tc.desc      Verify isMobile accepts the supported prefixes and rejects wrong prefixes, wrong lengths and non digit characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValxMobileMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testValxMobileMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the accepted mobile matrix.
      const validMobiles: string[] = [MOBILE_VALID, MOBILE_VALID_TWO, MOBILE_VALID_THREE, '13000000000',
        '14512345678', '16612345678', '18812345678'];
      // Walk the accepted matrix.
      for (let i: number = 0; i < validMobiles.length; i++) {
        // Validate the current accepted mobile number.
        const accepted: boolean = ValidateUtils.isMobile(validMobiles[i]);
        // Log the accepted mobile verdict.
        logCase(TAG, 'isMobile(' + validMobiles[i] + '): ' + accepted);
        // Expect the accepted mobile number to validate.
        expect(accepted).assertTrue();
      }

      // Prepare the rejected mobile matrix.
      const rejectedMobiles: string[] = [MOBILE_BAD_PREFIX, MOBILE_BAD_HEAD, MOBILE_SHORT, MOBILE_LONG,
        MOBILE_LETTER, MOBILE_PLUS, MOBILE_SPACE, '', ' 13812345678', '13812345678 '];
      // Walk the rejected matrix.
      for (let i: number = 0; i < rejectedMobiles.length; i++) {
        // Validate the current rejected mobile text.
        const rejected: boolean = ValidateUtils.isMobile(rejectedMobiles[i]);
        // Log the rejected mobile verdict.
        logCase(TAG, 'isMobile(reject ' + i + '): ' + rejected);
        // Expect the rejected mobile text to be refused.
        expect(rejected).assertFalse();
      }

      // Count the accepted verdicts inside the accepted matrix.
      const acceptedList: boolean[] = [];
      // Walk the accepted matrix again to build the verdict table.
      for (let i: number = 0; i < validMobiles.length; i++) {
        // Append the verdict of the current accepted number.
        acceptedList.push(ValidateUtils.isMobile(validMobiles[i]));
      }
      // Log the accepted verdict count.
      logCase(TAG, 'accepted verdict count: ' + countVerdict(acceptedList, true));
      // Expect every row of the accepted matrix to validate.
      expect(countVerdict(acceptedList, true)).assertEqual(validMobiles.length);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_VALX_0200
     * @tc.name      testValxEmailMatrix0001
     * @tc.desc      Verify isEmail accepts the common address shapes and rejects addresses without at sign, domain, tld or with spaces.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValxEmailMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testValxEmailMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the accepted email matrix.
      const validEmails: string[] = [EMAIL_PLAIN, EMAIL_TAGGED, EMAIL_SHORT_TLD, 'a@b.co',
        'user_name@sub.domain.com', 'USER@EXAMPLE.COM'];
      // Walk the accepted matrix.
      for (let i: number = 0; i < validEmails.length; i++) {
        // Validate the current accepted email address.
        const accepted: boolean = ValidateUtils.isEmail(validEmails[i]);
        // Log the accepted email verdict.
        logCase(TAG, 'isEmail(' + validEmails[i] + '): ' + accepted);
        // Expect the accepted email address to validate.
        expect(accepted).assertTrue();
      }

      // Prepare the rejected email matrix.
      const rejectedEmails: string[] = [EMAIL_NO_AT, EMAIL_NO_LOCAL, EMAIL_NO_DOMAIN, EMAIL_ONE_LETTER_TLD,
        EMAIL_TRAILING_DOT, EMAIL_INNER_SPACE, '', 'user@@example.com'];
      // Walk the rejected matrix.
      for (let i: number = 0; i < rejectedEmails.length; i++) {
        // Validate the current rejected email address.
        const rejected: boolean = ValidateUtils.isEmail(rejectedEmails[i]);
        // Log the rejected email verdict.
        logCase(TAG, 'isEmail(reject ' + i + '): ' + rejected);
        // Expect the rejected email address to be refused.
        expect(rejected).assertFalse();
      }

      // Table driven validation of the email local part characters.
      const localPartEmails: string[] = ['a.b@c.de', 'a-b@c.de', 'a_b@c.de', 'a%b@c.de', 'a+b@c.de'];
      // Walk the local part table.
      for (let i: number = 0; i < localPartEmails.length; i++) {
        // Validate the current local part sample.
        const accepted: boolean = ValidateUtils.isEmail(localPartEmails[i]);
        // Log the local part verdict.
        logCase(TAG, 'local part row[' + i + ']: ' + accepted);
        // Expect every accepted local part character to validate.
        expect(accepted).assertTrue();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_VALX_0300
     * @tc.name      testValxIpv4Boundary0001
     * @tc.desc      Verify isIpv4 accepts the zero and maximum address, rejects octets above 255 and rejects leading zero octets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValxIpv4Boundary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testValxIpv4Boundary0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Validate the lowest address of the space.
      const zeroVerdict: boolean = ValidateUtils.isIpv4(IPV4_ZERO);
      // Log the zero address verdict.
      logCase(TAG, 'isIpv4(' + IPV4_ZERO + '): ' + zeroVerdict);
      // Expect the zero address to validate.
      expect(zeroVerdict).assertTrue();

      // Validate the highest address of the space.
      const maxVerdict: boolean = ValidateUtils.isIpv4(IPV4_MAX);
      // Log the maximum address verdict.
      logCase(TAG, 'isIpv4(' + IPV4_MAX + '): ' + maxVerdict);
      // Expect the maximum address to validate.
      expect(maxVerdict).assertTrue();

      // Validate an ordinary private address.
      const normalVerdict: boolean = ValidateUtils.isIpv4(IPV4_NORMAL);
      // Log the ordinary address verdict.
      logCase(TAG, 'isIpv4(' + IPV4_NORMAL + '): ' + normalVerdict);
      // Expect the ordinary address to validate.
      expect(normalVerdict).assertTrue();

      // Validate the address whose first octet exceeds the upper bound.
      const overVerdict: boolean = ValidateUtils.isIpv4(IPV4_OCTET_OVER);
      // Log the out of range octet verdict.
      logCase(TAG, 'isIpv4(' + IPV4_OCTET_OVER + '): ' + overVerdict);
      // Expect the out of range octet to be refused.
      expect(overVerdict).assertFalse();

      // Validate the address whose second octet exceeds the upper bound.
      const overTwoVerdict: boolean = ValidateUtils.isIpv4(IPV4_OCTET_OVER_TWO);
      // Log the second out of range octet verdict.
      logCase(TAG, 'isIpv4(' + IPV4_OCTET_OVER_TWO + '): ' + overTwoVerdict);
      // Expect the second out of range octet to be refused.
      expect(overTwoVerdict).assertFalse();

      // Validate the address whose first octet carries a leading zero.
      const leadingZeroVerdict: boolean = ValidateUtils.isIpv4(IPV4_LEADING_ZERO);
      // Log the leading zero verdict.
      logCase(TAG, 'isIpv4(' + IPV4_LEADING_ZERO + '): ' + leadingZeroVerdict);
      // Expect the leading zero octet to be refused.
      expect(leadingZeroVerdict).assertFalse();

      // Validate the address that only has three octets.
      const threeOctetVerdict: boolean = ValidateUtils.isIpv4(IPV4_THREE_OCTETS);
      // Log the three octet verdict.
      logCase(TAG, 'isIpv4(' + IPV4_THREE_OCTETS + '): ' + threeOctetVerdict);
      // Expect the three octet address to be refused.
      expect(threeOctetVerdict).assertFalse();

      // Validate the address that carries five octets.
      const fiveOctetVerdict: boolean = ValidateUtils.isIpv4(IPV4_FIVE_OCTETS);
      // Log the five octet verdict.
      logCase(TAG, 'isIpv4(' + IPV4_FIVE_OCTETS + '): ' + fiveOctetVerdict);
      // Expect the five octet address to be refused.
      expect(fiveOctetVerdict).assertFalse();

      // Validate the address whose last octet is empty.
      const emptyOctetVerdict: boolean = ValidateUtils.isIpv4(IPV4_EMPTY_OCTET);
      // Log the empty octet verdict.
      logCase(TAG, 'isIpv4(' + IPV4_EMPTY_OCTET + '): ' + emptyOctetVerdict);
      // Expect the empty octet address to be refused.
      expect(emptyOctetVerdict).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_VALX_0400
     * @tc.name      testValxHexColorMatrix0001
     * @tc.desc      Verify isHexColor accepts three, six and eight digit colours and rejects other widths, bad letters and missing hash.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testValxHexColorMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testValxHexColorMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the accepted colour matrix with the three supported widths.
      const validColors: string[] = [COLOR_SHORT, COLOR_SIX, COLOR_EIGHT, COLOR_MIXED, '#000', '#000000',
        '#00000000'];
      // Walk the accepted colour matrix.
      for (let i: number = 0; i < validColors.length; i++) {
        // Validate the current accepted colour.
        const accepted: boolean = ValidateUtils.isHexColor(validColors[i]);
        // Log the accepted colour verdict.
        logCase(TAG, 'isHexColor(' + validColors[i] + '): ' + accepted);
        // Expect the accepted colour to validate.
        expect(accepted).assertTrue();
      }

      // Prepare the rejected colour matrix that mixes widths and bad letters.
      const rejectedColors: string[] = [COLOR_BAD_LETTER, COLOR_NO_HASH, COLOR_FOUR, COLOR_FIVE, COLOR_SEVEN,
        COLOR_NINE, COLOR_SPACE, '', '#'];
      // Walk the rejected colour matrix.
      for (let i: number = 0; i < rejectedColors.length; i++) {
        // Validate the current rejected colour.
        const rejected: boolean = ValidateUtils.isHexColor(rejectedColors[i]);
        // Log the rejected colour verdict.
        logCase(TAG, 'isHexColor(reject ' + i + '): ' + rejected);
        // Expect the rejected colour to be refused.
        expect(rejected).assertFalse();
      }

      // Confirm the accepted width set by counting the accepted rows.
      const colorVerdicts: boolean[] = [];
      // Walk the accepted colour matrix once more.
      for (let i: number = 0; i < validColors.length; i++) {
        // Append the verdict of the current colour.
        colorVerdicts.push(ValidateUtils.isHexColor(validColors[i]));
      }
      // Log the accepted colour count.
      logCase(TAG, 'accepted colour count: ' + countVerdict(colorVerdicts, true));
      // Expect every accepted colour row to validate.
      expect(countVerdict(colorVerdicts, true)).assertEqual(validColors.length);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_VALX_0500
     * @tc.name      testValxDigitsAlpha0001
     * @tc.desc      Verify isDigits and isAlpha accept only the pure ASCII alphabets and reject empty or mixed text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValxDigitsAlpha0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testValxDigitsAlpha0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the digit only matrix that must validate.
      const digitsAccepted: string[] = ['0', '9', '1234567890', '0000', '007'];
      // Walk the digit only matrix.
      for (let i: number = 0; i < digitsAccepted.length; i++) {
        // Validate the current digit sample.
        const accepted: boolean = ValidateUtils.isDigits(digitsAccepted[i]);
        // Log the digit sample verdict.
        logCase(TAG, 'isDigits(' + digitsAccepted[i] + '): ' + accepted);
        // Expect the pure digit sample to validate.
        expect(accepted).assertTrue();
      }

      // Prepare the rejected digit matrix that mixes letters and symbols.
      const digitsRejected: string[] = ['', '12a', 'a12', '1.2', '1 2', '-1', '１２３', '1e5'];
      // Walk the rejected digit matrix.
      for (let i: number = 0; i < digitsRejected.length; i++) {
        // Validate the current rejected digit sample.
        const rejected: boolean = ValidateUtils.isDigits(digitsRejected[i]);
        // Log the rejected digit verdict.
        logCase(TAG, 'isDigits(reject ' + i + '): ' + rejected);
        // Expect the rejected digit sample to be refused.
        expect(rejected).assertFalse();
      }

      // Prepare the letter only matrix that must validate.
      const alphaAccepted: string[] = ['a', 'Z', 'abcXYZ', 'Sample'];
      // Walk the letter only matrix.
      for (let i: number = 0; i < alphaAccepted.length; i++) {
        // Validate the current letter sample.
        const accepted: boolean = ValidateUtils.isAlpha(alphaAccepted[i]);
        // Log the letter sample verdict.
        logCase(TAG, 'isAlpha(' + alphaAccepted[i] + '): ' + accepted);
        // Expect the pure letter sample to validate.
        expect(accepted).assertTrue();
      }

      // Prepare the rejected letter matrix that mixes digits, symbols and non ASCII letters.
      const alphaRejected: string[] = ['', 'abc1', '1abc', 'a b', 'a-b', 'a_b', '中文', 'aé'];
      // Walk the rejected letter matrix.
      for (let i: number = 0; i < alphaRejected.length; i++) {
        // Validate the current rejected letter sample.
        const rejected: boolean = ValidateUtils.isAlpha(alphaRejected[i]);
        // Log the rejected letter verdict.
        logCase(TAG, 'isAlpha(reject ' + i + '): ' + rejected);
        // Expect the rejected letter sample to be refused.
        expect(rejected).assertFalse();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_VALX_0600
     * @tc.name      testValxIdCardLength0001
     * @tc.desc      Verify isIdCard18 requires exactly eighteen characters and accepts both the digit and the upper X checksum.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValxIdCardLength0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testValxIdCardLength0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Validate the eighteen digit identity number with a digit checksum.
      const digitVerdict: boolean = ValidateUtils.isIdCard18(ID_VALID_DIGIT);
      // Log the digit checksum verdict.
      logCase(TAG, 'isIdCard18(digit checksum): ' + digitVerdict);
      // Expect the digit checksum identity number to validate.
      expect(digitVerdict).assertTrue();

      // Validate the eighteen digit identity number with an upper case X.
      const upperXVerdict: boolean = ValidateUtils.isIdCard18(ID_VALID_UPPER_X);
      // Log the upper case X verdict.
      logCase(TAG, 'isIdCard18(upper X): ' + upperXVerdict);
      // Expect the upper case X identity number to validate.
      expect(upperXVerdict).assertTrue();

      // Validate the eighteen digit identity number with a lower case x.
      const lowerXVerdict: boolean = ValidateUtils.isIdCard18(ID_LOWER_X);
      // Log the lower case x verdict.
      logCase(TAG, 'isIdCard18(lower x): ' + lowerXVerdict);
      // Expect the lower case x identity number to be refused.
      expect(lowerXVerdict).assertFalse();

      // Validate the seventeen digit identity number.
      const shortVerdict: boolean = ValidateUtils.isIdCard18(ID_SHORT);
      // Log the short identity number verdict.
      logCase(TAG, 'isIdCard18(17 digits): ' + shortVerdict);
      // Expect the seventeen digit identity number to be refused.
      expect(shortVerdict).assertFalse();

      // Validate the nineteen digit identity number.
      const longVerdict: boolean = ValidateUtils.isIdCard18(ID_LONG);
      // Log the long identity number verdict.
      logCase(TAG, 'isIdCard18(19 digits): ' + longVerdict);
      // Expect the nineteen digit identity number to be refused.
      expect(longVerdict).assertFalse();

      // Validate the identity number that carries a letter inside the body.
      const bodyLetterVerdict: boolean = ValidateUtils.isIdCard18(ID_LETTER_BODY);
      // Log the body letter verdict.
      logCase(TAG, 'isIdCard18(letter in body): ' + bodyLetterVerdict);
      // Expect the body letter identity number to be refused.
      expect(bodyLetterVerdict).assertFalse();

      // Validate the identity number that carries a dash inside the body.
      const dashVerdict: boolean = ValidateUtils.isIdCard18(ID_DASH);
      // Log the dash verdict.
      logCase(TAG, 'isIdCard18(dash in body): ' + dashVerdict);
      // Expect the dash identity number to be refused.
      expect(dashVerdict).assertFalse();

      // Validate the empty identity number.
      const emptyVerdict: boolean = ValidateUtils.isIdCard18('');
      // Log the empty identity number verdict.
      logCase(TAG, 'isIdCard18(empty): ' + emptyVerdict);
      // Expect the empty identity number to be refused.
      expect(emptyVerdict).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_VALX_0700
     * @tc.name      testValxLengthBetween0001
     * @tc.desc      Verify lengthBetween accepts the inclusive minimum and maximum and rejects one character outside the range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testValxLengthBetween0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testValxLengthBetween0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Build the text that matches the inclusive lower bound exactly.
      const atMin: string = 'abc';
      // Build the text that matches the inclusive upper bound exactly.
      const atMax: string = 'abcdef';
      // Build the text that is one character shorter than the lower bound.
      const belowMin: string = 'ab';
      // Build the text that is one character longer than the upper bound.
      const aboveMax: string = 'abcdefg';

      // Check the inclusive lower bound.
      const minVerdict: boolean = ValidateUtils.lengthBetween(atMin, 3, 6);
      // Log the lower bound verdict.
      logCase(TAG, 'lengthBetween(3, 3, 6): ' + minVerdict);
      // Expect the lower bound to be accepted.
      expect(minVerdict).assertTrue();

      // Check the inclusive upper bound.
      const maxVerdict: boolean = ValidateUtils.lengthBetween(atMax, 3, 6);
      // Log the upper bound verdict.
      logCase(TAG, 'lengthBetween(6, 3, 6): ' + maxVerdict);
      // Expect the upper bound to be accepted.
      expect(maxVerdict).assertTrue();

      // Check the text below the lower bound.
      const belowVerdict: boolean = ValidateUtils.lengthBetween(belowMin, 3, 6);
      // Log the below bound verdict.
      logCase(TAG, 'lengthBetween(2, 3, 6): ' + belowVerdict);
      // Expect the below bound text to be refused.
      expect(belowVerdict).assertFalse();

      // Check the text above the upper bound.
      const aboveVerdict: boolean = ValidateUtils.lengthBetween(aboveMax, 3, 6);
      // Log the above bound verdict.
      logCase(TAG, 'lengthBetween(7, 3, 6): ' + aboveVerdict);
      // Expect the above bound text to be refused.
      expect(aboveVerdict).assertFalse();

      // Check the degenerate range where the minimum equals the maximum.
      const exactVerdict: boolean = ValidateUtils.lengthBetween(atMin, 3, 3);
      // Log the degenerate range verdict.
      logCase(TAG, 'lengthBetween(3, 3, 3): ' + exactVerdict);
      // Expect the exact width text to be accepted.
      expect(exactVerdict).assertTrue();

      // Check the empty text against a range that starts at zero.
      const emptyVerdict: boolean = ValidateUtils.lengthBetween('', 0, 6);
      // Log the empty text verdict.
      logCase(TAG, 'lengthBetween(0, 0, 6): ' + emptyVerdict);
      // Expect the empty text to be accepted by the zero based range.
      expect(emptyVerdict).assertTrue();

      // Check the empty text against a range that starts at one.
      const emptyRejected: boolean = ValidateUtils.lengthBetween('', 1, 6);
      // Log the empty text rejection verdict.
      logCase(TAG, 'lengthBetween(0, 1, 6): ' + emptyRejected);
      // Expect the empty text to be refused by the one based range.
      expect(emptyRejected).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_VALX_0800
     * @tc.name      testValxMobilePrefixSweep0001
     * @tc.desc      Verify the second digit of an eleven digit mobile number decides the verdict across the whole prefix sweep.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testValxMobilePrefixSweep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testValxMobilePrefixSweep0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Sweep the second digit from zero to nine together with the fixed one prefix.
      let acceptedCount: number = 0;
      // Walk the ten candidate second digits.
      for (let second: number = 0; second < 10; second++) {
        // Compose the candidate mobile number of the sweep.
        const candidate: string = '1' + second.toString() + '012345678';
        // Validate the candidate mobile number.
        const verdict: boolean = ValidateUtils.isMobile(candidate);
        // Log the sweep verdict of the current candidate.
        logCase(TAG, 'prefix sweep 1' + second + ': ' + verdict);
        // Add the accepted verdict to the counter.
        if (verdict) {
          // Count one accepted prefix.
          acceptedCount += 1;
        }
        // Expect the prefixes three to nine to be accepted and the others refused.
        expect(verdict).assertEqual(second >= 3 && second <= 9);
      }
      // Log the accepted prefix count.
      logCase(TAG, 'accepted prefix count: ' + acceptedCount);
      // Expect exactly seven prefixes to be accepted.
      expect(acceptedCount).assertEqual(7);

      // Sweep the first digit from zero to nine to prove only the one prefix is accepted.
      let headAcceptedCount: number = 0;
      // Walk the ten candidate first digits.
      for (let head: number = 0; head < 10; head++) {
        // Compose the candidate mobile number of the head sweep.
        const candidate: string = head.toString() + '3012345678';
        // Validate the candidate mobile number.
        const verdict: boolean = ValidateUtils.isMobile(candidate);
        // Register the accepted verdict.
        if (verdict) {
          // Count one accepted head digit.
          headAcceptedCount += 1;
        }
      }
      // Log the accepted head digit count.
      logCase(TAG, 'accepted head digit count: ' + headAcceptedCount);
      // Expect exactly one head digit to be accepted.
      expect(headAcceptedCount).assertEqual(1);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_VALX_0900
     * @tc.name      testValxIpv4OctetSweep0001
     * @tc.desc      Verify the octet boundary of isIpv4 by sweeping the last octet from 253 to 257 and the leading zero variants.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testValxIpv4OctetSweep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testValxIpv4OctetSweep0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Sweep the last octet around the upper boundary of the octet range.
      for (let last: number = 253; last <= 257; last++) {
        // Compose the candidate address of the sweep.
        const candidate: string = '10.0.0.' + last.toString();
        // Validate the candidate address.
        const verdict: boolean = ValidateUtils.isIpv4(candidate);
        // Log the octet sweep verdict.
        logCase(TAG, 'octet sweep ' + candidate + ': ' + verdict);
        // Expect the octets up to the boundary to be accepted and the rest refused.
        expect(verdict).assertEqual(last <= 255);
      }

      // Sweep the octet width values that carry a leading zero.
      const leadingZeroOctets: string[] = ['010.0.0.1', '10.00.0.1', '10.0.01.1', '10.0.0.01', '010.010.010.010'];
      // Walk the leading zero table.
      for (let i: number = 0; i < leadingZeroOctets.length; i++) {
        // Validate the current leading zero address.
        const verdict: boolean = ValidateUtils.isIpv4(leadingZeroOctets[i]);
        // Log the leading zero verdict.
        logCase(TAG, 'leading zero row[' + i + ']: ' + verdict);
        // Expect every leading zero address to be refused.
        expect(verdict).assertFalse();
      }

      // Sweep the three digit octets that stay inside the range.
      const inRangeOctets: string[] = ['100.100.100.100', '200.200.200.200', '255.0.255.0', '0.255.0.255'];
      // Walk the in range table.
      for (let i: number = 0; i < inRangeOctets.length; i++) {
        // Validate the current in range address.
        const verdict: boolean = ValidateUtils.isIpv4(inRangeOctets[i]);
        // Log the in range verdict.
        logCase(TAG, 'in range row[' + i + ']: ' + verdict);
        // Expect every in range address to validate.
        expect(verdict).assertTrue();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_VALX_1000
     * @tc.name      testValxTextMatrix0001
     * @tc.desc      Verify the text validators over a shared input matrix that mixes mobile, email, address, colour and identity shapes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testValxTextMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testValxTextMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the shared text matrix of the cross validator checks.
      const sharedTexts: string[] = [MOBILE_VALID, EMAIL_PLAIN, IPV4_NORMAL, COLOR_SIX, ID_VALID_DIGIT];
      // Walk the shared matrix and check that exactly one validator accepts each row.
      for (let i: number = 0; i < sharedTexts.length; i++) {
        // Read the current shared text.
        const text: string = sharedTexts[i];
        // Run all five shape validators on the current text.
        const mobileVerdict: boolean = ValidateUtils.isMobile(text);
        // Run the email validator on the current text.
        const emailVerdict: boolean = ValidateUtils.isEmail(text);
        // Run the address validator on the current text.
        const ipv4Verdict: boolean = ValidateUtils.isIpv4(text);
        // Run the colour validator on the current text.
        const colorVerdict: boolean = ValidateUtils.isHexColor(text);
        // Run the identity validator on the current text.
        const idVerdict: boolean = ValidateUtils.isIdCard18(text);
        // Sum the accepted verdicts of the row.
        let acceptedRows: number = 0;
        // Count the accepted verdicts one by one.
        if (mobileVerdict) {
          // Count the mobile acceptance.
          acceptedRows += 1;
        }
        if (emailVerdict) {
          // Count the email acceptance.
          acceptedRows += 1;
        }
        if (ipv4Verdict) {
          // Count the address acceptance.
          acceptedRows += 1;
        }
        if (colorVerdict) {
          // Count the colour acceptance.
          acceptedRows += 1;
        }
        if (idVerdict) {
          // Count the identity acceptance.
          acceptedRows += 1;
        }
        // Log the shared row acceptance count.
        logCase(TAG, 'shared row[' + i + '] accepted by ' + acceptedRows + ' validators');
        // Expect each well formed row to be accepted by exactly one validator.
        expect(acceptedRows).assertEqual(1);
      }

      // Prepare the plain text matrix that no shape validator accepts.
      const plainTexts: string[] = ['hello', 'Hello World', '', '  ', 'not-an-email', '999.999.999.999'];
      // Walk the plain matrix.
      for (let i: number = 0; i < plainTexts.length; i++) {
        // Read the current plain text.
        const text: string = plainTexts[i];
        // Combine the five verdicts into one acceptance flag.
        const anyAccepted: boolean = ValidateUtils.isMobile(text) || ValidateUtils.isEmail(text) ||
          ValidateUtils.isIpv4(text) || ValidateUtils.isHexColor(text) || ValidateUtils.isIdCard18(text);
        // Log the plain text verdict.
        logCase(TAG, 'plain row[' + i + '] accepted: ' + anyAccepted);
        // Expect the plain text to be refused by every validator.
        expect(anyAccepted).assertFalse();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_VALX_1100
     * @tc.name      testValxLengthTable0001
     * @tc.desc      Verify lengthBetween over a table of ranges and widths, including the zero width range and the inverted range.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testValxLengthTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testValxLengthTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the widths that drive the length table.
      const widths: number[] = [0, 1, 2, 3, 4, 5];
      // Prepare the accepted section of the table.
      const insideVerdicts: boolean[] = [];
      // Walk the width table against the range from two to four.
      for (let i: number = 0; i < widths.length; i++) {
        // Compose the text of the current width.
        let text: string = '';
        // Append one character per requested position.
        for (let j: number = 0; j < widths[i]; j++) {
          // Append one character of the width table.
          text += 'x';
        }
        // Validate the composed text against the range from two to four.
        const verdict: boolean = ValidateUtils.lengthBetween(text, 2, 4);
        // Append the verdict of the current width.
        insideVerdicts.push(verdict);
        // Log the width table row.
        logCase(TAG, 'width ' + widths[i] + ' in [2, 4]: ' + verdict);
      }
      // Count the accepted widths of the table.
      const insideCount: number = countVerdict(insideVerdicts, true);
      // Log the accepted width count.
      logCase(TAG, 'accepted width count: ' + insideCount);
      // Expect exactly the widths two, three and four to be accepted.
      expect(insideCount).assertEqual(3);
      // Expect the width zero to be refused by the range from two to four.
      expect(insideVerdicts[0]).assertFalse();
      // Expect the width two to be accepted by the range from two to four.
      expect(insideVerdicts[2]).assertTrue();
      // Expect the width four to be accepted by the range from two to four.
      expect(insideVerdicts[4]).assertTrue();
      // Expect the width five to be refused by the range from two to four.
      expect(insideVerdicts[5]).assertFalse();

      // Check the zero width range that only accepts the empty text.
      const zeroRangeEmpty: boolean = ValidateUtils.lengthBetween('', 0, 0);
      // Log the zero width range verdict of the empty text.
      logCase(TAG, 'zero range empty verdict: ' + zeroRangeEmpty);
      // Expect the empty text to be accepted by the zero width range.
      expect(zeroRangeEmpty).assertTrue();
      // Expect a one character text to be refused by the zero width range.
      expect(ValidateUtils.lengthBetween('x', 0, 0)).assertFalse();

      // Check the inverted range where the minimum exceeds the maximum.
      const invertedVerdict: boolean = ValidateUtils.lengthBetween('abc', 5, 2);
      // Log the inverted range verdict.
      logCase(TAG, 'inverted range verdict: ' + invertedVerdict);
      // Expect the inverted range to refuse every text.
      expect(invertedVerdict).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}

// Also expose the suite function as a named export so either registration style works.
export { validateUtilsAdvancedTest };
