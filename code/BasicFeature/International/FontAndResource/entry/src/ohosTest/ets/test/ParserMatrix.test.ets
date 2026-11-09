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

// The address sample that is accepted without a leading zero.
const IP_OK_BASE: string = '192.168.1.1';
// The address sample that uses the two hundred and fifty five octet.
const IP_OK_TOP: string = '255.255.255.255';
// The address sample that uses the two hundred and fifty four octet.
const IP_OK_HIGH: string = '254.1.1.1';
// The address sample whose last octet is one hundred.
const IP_OK_LAST: string = '10.0.0.100';
// The address sample that uses the one octet in the first position.
const IP_OK_FIRST: string = '1.1.1.1';
// The address sample that mixes two and three digit octets.
const IP_OK_MIX: string = '172.16.254.1';
// The address sample of the local network.
const IP_OK_LOCAL: string = '127.0.0.1';
// The address sample that ends with the two hundred and fifty five octet.
const IP_OK_END: string = '8.8.8.255';
// The address sample that starts with the two hundred octet.
const IP_OK_START: string = '200.100.50.25';
// The address sample of the private range.
const IP_OK_PRIVATE: string = '10.10.10.10';
// The address sample of the link local range.
const IP_OK_LINK: string = '169.254.1.1';
// The address sample of the broadcast range.
const IP_OK_BROADCAST: string = '0.0.0.0';
// The address sample whose first octet equals two hundred and fifty six.
const IP_BAD_FIRST_OVER: string = '256.1.1.1';
// The address sample whose last octet equals two hundred and fifty six.
const IP_BAD_LAST_OVER: string = '1.1.1.256';
// The address sample whose second octet equals nine hundred ninety nine.
const IP_BAD_MIDDLE_OVER: string = '1.999.1.1';
// The address sample that keeps a leading zero in the second octet.
const IP_BAD_LEADING_ZERO: string = '1.01.1.1';
// The address sample that keeps a leading zero in the first octet.
const IP_BAD_LEADING_HEAD: string = '01.1.1.1';
// The address sample that keeps a leading zero in the last octet.
const IP_BAD_LEADING_TAIL: string = '1.1.1.01';
// The address sample with only three octets.
const IP_BAD_THREE: string = '1.1.1';
// The address sample with five octets.
const IP_BAD_FIVE: string = '1.1.1.1.1';
// The address sample whose octet is a negative number.
const IP_BAD_NEGATIVE: string = '-1.1.1.1';
// The address sample whose octet is a letter.
const IP_BAD_LETTER: string = 'a.1.1.1';
// The address sample whose octet is quoted.
const IP_BAD_QUOTED: string = '1.1.1.1a';
// The address sample whose octet is an empty cell.
const IP_BAD_EMPTY: string = '1..1.1';
// The address sample whose octet unit is a double number.
const IP_BAD_FLOAT: string = '1.1.1.1.5';

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Returns true when every character of the text is a lowercase hexadecimal digit.
function isLowerHexText(text: string): boolean {
  // The lowercase hexadecimal alphabet of the shape checks.
  const alphabet: string = '0123456789abcdef';
  // Walk every character of the text.
  for (let i: number = 0; i < text.length; i++) {
    // Check whether the current character belongs to the alphabet.
    if (alphabet.indexOf(text.charAt(i)) < 0) {
      // Report the first offending character.
      return false;
    }
  }
  // Every character was a lowercase hexadecimal digit.
  return true;
}

// Counts how many entries of the verdict list equal the expected value.
function countVerdict(verdicts: boolean[], expected: boolean): number {
  // Track the number of matching entries.
  let count: number = 0;
  // Walk the verdict list.
  for (let i: number = 0; i < verdicts.length; i++) {
    // Compare the entry against the expectation.
    if (verdicts[i] === expected) {
      // Register one matching entry.
      count += 1;
    }
  }
  // Return the matching entry count.
  return count;
}

// Returns true when every character of the text is an ASCII letter.
function isAsciiAlpha(text: string): boolean {
  // The accepted letter set of the digit and alpha matrix.
  const letters: string = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  // Walk every character of the text.
  for (let i: number = 0; i < text.length; i++) {
    // Check whether the current character is a letter.
    if (letters.indexOf(text.charAt(i)) < 0) {
      // Report the first offending character.
      return false;
    }
  }
  // Every character was an ASCII letter.
  return true;
}

// Returns true when every character of the text is a decimal digit.
function isDigitOnly(text: string): boolean {
  // The accepted digit set of the digit and alpha matrix.
  const digits: string = '0123456789';
  // Walk every character of the text.
  for (let i: number = 0; i < text.length; i++) {
    // Check whether the current character is a digit.
    if (digits.indexOf(text.charAt(i)) < 0) {
      // Report the first offending character.
      return false;
    }
  }
  // Every character was a decimal digit.
  return true;
}

// Registers every on-device logic test case of the parser matrices.
export default function parserMatrixTest() {
  // Group the cases under the "ParserMatrixSuite" describe block.
  describe('ParserMatrixSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'ParserMatrixSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PARSEMX_0100
     * @tc.name      testParsemxIpv4AcceptTable0001
     * @tc.desc      Verify the IPv4 parser accepts the well formed dotted quad addresses of the accept table.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParsemxIpv4AcceptTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testParsemxIpv4AcceptTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the accept table of the address parser.
      const accepts: string[] = [IP_OK_BASE, IP_OK_TOP, IP_OK_HIGH, IP_OK_LAST, IP_OK_FIRST, IP_OK_MIX,
        IP_OK_LOCAL, IP_OK_END, IP_OK_START, IP_OK_PRIVATE, IP_OK_LINK, IP_OK_BROADCAST];
      // Walk the accept table in order.
      for (let i: number = 0; i < accepts.length; i++) {
        // Read the current accepted address.
        const address: string = accepts[i];
        // Run the address parser on the current row.
        const verdict: boolean = ValidateUtils.isIpv4(address);
        // Log the accept row verdict.
        logCase(TAG, 'accept row[' + i + '] ' + address + ' -> ' + verdict);
        // Expect the address parser to accept the row.
        expect(verdict).assertTrue();
        // Expect the accepted address to keep the four octet shape.
        expect(address.split('.').length).assertEqual(4);
      }
      // Count the accepted rows of the table.
      const acceptedCount: number = accepts.length;
      // Log the accepted row count.
      logCase(TAG, 'accept table size ' + acceptedCount);
      // Expect the accept table to hold twelve rows.
      expect(acceptedCount).assertEqual(12);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PARSEMX_0200
     * @tc.name      testParsemxIpv4RejectTable0001
     * @tc.desc      Verify the IPv4 parser refuses octets above two hundred and fifty five, leading zeros and wrong octet counts.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParsemxIpv4RejectTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testParsemxIpv4RejectTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the reject table of the address parser.
      const rejects: string[] = [IP_BAD_FIRST_OVER, IP_BAD_LAST_OVER, IP_BAD_MIDDLE_OVER, IP_BAD_LEADING_ZERO,
        IP_BAD_LEADING_HEAD, IP_BAD_LEADING_TAIL, IP_BAD_THREE, IP_BAD_FIVE, IP_BAD_NEGATIVE, IP_BAD_LETTER,
        IP_BAD_QUOTED, IP_BAD_EMPTY, IP_BAD_FLOAT];
      // Walk the reject table in order.
      for (let i: number = 0; i < rejects.length; i++) {
        // Read the current rejected address.
        const address: string = rejects[i];
        // Run the address parser on the current row.
        const verdict: boolean = ValidateUtils.isIpv4(address);
        // Log the reject row verdict.
        logCase(TAG, 'reject row[' + i + '] ' + address + ' -> ' + verdict);
        // Expect the address parser to refuse the row.
        expect(verdict).assertFalse();
      }
      // Count the refused rows of the table.
      const rejectedCount: number = rejects.length;
      // Log the refused row count.
      logCase(TAG, 'reject table size ' + rejectedCount);
      // Expect the reject table to hold thirteen rows.
      expect(rejectedCount).assertEqual(13);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PARSEMX_0300
     * @tc.name      testParsemxIpv4BoundarySweep0001
     * @tc.desc      Verify the IPv4 parser at the exact octet boundary values of zero, one, two hundred and fifty five and two hundred and fifty six.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testParsemxIpv4BoundarySweep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testParsemxIpv4BoundarySweep0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the octet values of the boundary sweep.
      const octets: number[] = [0, 1, 2, 99, 100, 199, 200, 254, 255, 256, 300];
      // Walk the octet boundary sweep in order.
      for (let i: number = 0; i < octets.length; i++) {
        // Read the current octet value.
        const octet: number = octets[i];
        // Compose the address whose last octet holds the current value.
        const address: string = '10.10.10.' + octet;
        // Run the address parser on the composed address.
        const verdict: boolean = ValidateUtils.isIpv4(address);
        // Log the octet boundary row.
        logCase(TAG, 'octet row[' + i + '] ' + octet + ' -> ' + verdict);
        // Expect the octet to be accepted up to two hundred and fifty five.
        expect(verdict).assertEqual(octet <= 255);
      }

      // Compose the zero broadcast address and expect the parser to accept it.
      const zeroAddress: string = '0.0.0.0';
      // Run the address parser on the zero broadcast address.
      const zeroVerdict: boolean = ValidateUtils.isIpv4(zeroAddress);
      // Log the zero broadcast verdict.
      logCase(TAG, 'zero address verdict ' + zeroVerdict);
      // Expect the zero broadcast address to be accepted.
      expect(zeroVerdict).assertTrue();
      // Expect the upper boundary of the all high octet address to be accepted.
      expect(ValidateUtils.isIpv4('255.255.255.255')).assertTrue();
      // Expect the address one above the upper boundary to be refused.
      expect(ValidateUtils.isIpv4('255.255.255.256')).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PARSEMX_0400
     * @tc.name      testParsemxHexColorTable0001
     * @tc.desc      Verify the colour parser accepts three, six and eight digit codes and refuses wrong widths and letters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParsemxHexColorTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testParsemxHexColorTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the accepted colour codes of the shape matrix.
      const accepts: string[] = ['#fff', '#FFF', '#000', '#fa0', '#FFFFFF', '#000000', '#1a2B3c',
        '#FFFFFFFF', '#00000000', '#11223344'];
      // Walk the accepted colour codes.
      for (let i: number = 0; i < accepts.length; i++) {
        // Read the current accepted colour code.
        const color: string = accepts[i];
        // Run the colour parser on the current code.
        const verdict: boolean = ValidateUtils.isHexColor(color);
        // Log the accepted colour row.
        logCase(TAG, 'color accept row[' + i + '] ' + color + ' -> ' + verdict);
        // Expect the colour parser to accept the code.
        expect(verdict).assertTrue();
        // Expect the accepted code to start with the hash sign.
        expect(color.charAt(0)).assertEqual('#');
      }

      // Prepare the refused colour codes of the shape matrix.
      const rejects: string[] = ['#ff', '#ffff', '#fffff', '#fffffff', '#ggg', '#GGG', 'fff', '#', '',
        '#12345g', ' #fff', '#fff '];
      // Walk the refused colour codes.
      for (let i: number = 0; i < rejects.length; i++) {
        // Read the current refused colour code.
        const color: string = rejects[i];
        // Run the colour parser on the current code.
        const verdict: boolean = ValidateUtils.isHexColor(color);
        // Log the refused colour row.
        logCase(TAG, 'color reject row[' + i + '] ' + color + ' -> ' + verdict);
        // Expect the colour parser to refuse the code.
        expect(verdict).assertFalse();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PARSEMX_0500
     * @tc.name      testParsemxHexColorBoundary0001
     * @tc.desc      Verify the colour parser at the exact width boundaries of two, three, six, eight and nine digits.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testParsemxHexColorBoundary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testParsemxHexColorBoundary0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the width sweep of the colour parser.
      const widths: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      // Walk the width sweep in order.
      for (let i: number = 0; i < widths.length; i++) {
        // Read the current digit width.
        const width: number = widths[i];
        // Compose the code of the current width from the letter a.
        const color: string = '#';
        // Build the digit tail of the current width.
        let tail: string = '';
        // Append one hexadecimal digit per requested position.
        for (let j: number = 0; j < width; j++) {
          // Append one hexadecimal digit of the tail.
          tail += 'a';
        }
        // Compose the full colour code of the current width.
        const fullColor: string = color + tail;
        // Run the colour parser on the composed code.
        const verdict: boolean = ValidateUtils.isHexColor(fullColor);
        // Log the colour width row.
        logCase(TAG, 'color width row[' + i + '] width ' + width + ' -> ' + verdict);
        // Expect only the three, six and eight digit widths to be accepted.
        expect(verdict).assertEqual(width === 3 || width === 6 || width === 8);
      }

      // Confirm the mixed case code is accepted at the width six.
      const mixedCase: string = '#aBcDeF';
      // Log the mixed case code verdict.
      logCase(TAG, 'mixed case code verdict ' + ValidateUtils.isHexColor(mixedCase));
      // Expect the mixed case six digit code to be accepted.
      expect(ValidateUtils.isHexColor(mixedCase)).assertTrue();
      // Expect the hash less code to be refused even at the width six.
      expect(ValidateUtils.isHexColor('aBcDeF')).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PARSEMX_0600
     * @tc.name      testParsemxIdCardTable0001
     * @tc.desc      Verify the identity parser accepts eighteen character bodies and refuses wrong widths, lowercase checks and letters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParsemxIdCardTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testParsemxIdCardTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the accepted identity numbers of the shape matrix.
      const accepts: string[] = ['110101199003071234', '11010119900307123X', '000000000000000000',
        '999999999999999999', '110101199003071230', '440301198001019876'];
      // Walk the accepted identity numbers.
      for (let i: number = 0; i < accepts.length; i++) {
        // Read the current accepted identity number.
        const idCard: string = accepts[i];
        // Run the identity parser on the current number.
        const verdict: boolean = ValidateUtils.isIdCard18(idCard);
        // Log the accepted identity row.
        logCase(TAG, 'id accept row[' + i + '] ' + idCard + ' -> ' + verdict);
        // Expect the identity parser to accept the number.
        expect(verdict).assertTrue();
        // Expect the accepted number to keep the eighteen character width.
        expect(idCard.length).assertEqual(18);
      }

      // Prepare the refused identity numbers of the shape matrix.
      const rejects: string[] = ['11010119900307123', '1101011990030712345', '11010119900307123x',
        '11010119900307123Y', '11010119900307123a', '', '11010119900307 123', 'X10101199003071234',
        '11010119900307123-'];
      // Walk the refused identity numbers.
      for (let i: number = 0; i < rejects.length; i++) {
        // Read the current refused identity number.
        const idCard: string = rejects[i];
        // Run the identity parser on the current number.
        const verdict: boolean = ValidateUtils.isIdCard18(idCard);
        // Log the refused identity row.
        logCase(TAG, 'id reject row[' + i + '] ' + idCard + ' -> ' + verdict);
        // Expect the identity parser to refuse the number.
        expect(verdict).assertFalse();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PARSEMX_0700
     * @tc.name      testParsemxIdCardWidthSweep0001
     * @tc.desc      Verify the identity parser over the width sweep from sixteen to twenty and the checksum character variants.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testParsemxIdCardWidthSweep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testParsemxIdCardWidthSweep0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the width sweep of the identity parser.
      const widths: number[] = [16, 17, 18, 19, 20];
      // The accepted width verdicts collected during the sweep.
      const verdicts: boolean[] = [];
      // Walk the width sweep in order.
      for (let i: number = 0; i < widths.length; i++) {
        // Read the current identity width.
        const width: number = widths[i];
        // Build a digit body of the current width.
        let body: string = '';
        // Append one digit per requested position.
        for (let j: number = 0; j < width; j++) {
          // Append one digit of the identity body.
          body += '1';
        }
        // Run the identity parser on the composed body.
        const verdict: boolean = ValidateUtils.isIdCard18(body);
        // Append the verdict of the current width.
        verdicts.push(verdict);
        // Log the identity width row.
        logCase(TAG, 'id width row[' + i + '] width ' + width + ' -> ' + verdict);
      }
      // Count the accepted widths of the sweep.
      const acceptedWidths: number = countVerdict(verdicts, true);
      // Log the accepted width count.
      logCase(TAG, 'accepted id widths ' + acceptedWidths);
      // Expect exactly one width of the sweep to be accepted.
      expect(acceptedWidths).assertEqual(1);
      // Expect the eighteen digit body to be accepted.
      expect(verdicts[2]).assertTrue();
      // Expect the seventeen digit body to be refused.
      expect(verdicts[1]).assertFalse();
      // Expect the nineteen digit body to be refused.
      expect(verdicts[3]).assertFalse();

      // Confirm the uppercase checksum character is accepted.
      const upperCheck: string = '11010119900307123X';
      // Log the uppercase checksum verdict.
      logCase(TAG, 'uppercase checksum verdict ' + ValidateUtils.isIdCard18(upperCheck));
      // Expect the uppercase checksum character to be accepted.
      expect(ValidateUtils.isIdCard18(upperCheck)).assertTrue();
      // Expect the lowercase checksum character to be refused.
      expect(ValidateUtils.isIdCard18('11010119900307123x')).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PARSEMX_0800
     * @tc.name      testParsemxDigitsAlphaTable0001
     * @tc.desc      Verify the digit and letter parsers over a table of digit only, letter only and mixed texts.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParsemxDigitsAlphaTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testParsemxDigitsAlphaTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the digit only table of the parser matrix.
      const digitRows: string[] = ['0', '1234567890', '000', '9', '42'];
      // Walk the digit only table.
      for (let i: number = 0; i < digitRows.length; i++) {
        // Read the current digit row.
        const row: string = digitRows[i];
        // Run the digit parser on the current row.
        const verdict: boolean = ValidateUtils.isDigits(row);
        // Log the digit row verdict.
        logCase(TAG, 'digit row[' + i + '] ' + row + ' -> ' + verdict);
        // Expect the digit parser to accept the row.
        expect(verdict).assertTrue();
        // Expect the accepted row to hold digits only.
        expect(isDigitOnly(row)).assertTrue();
        // Expect the accepted row to be refused by the letter parser.
        expect(ValidateUtils.isAlpha(row)).assertFalse();
      }

      // Prepare the letter only table of the parser matrix.
      const alphaRows: string[] = ['a', 'Z', 'abcXYZ', 'Hello'];
      // Walk the letter only table.
      for (let i: number = 0; i < alphaRows.length; i++) {
        // Read the current letter row.
        const row: string = alphaRows[i];
        // Run the letter parser on the current row.
        const verdict: boolean = ValidateUtils.isAlpha(row);
        // Log the letter row verdict.
        logCase(TAG, 'alpha row[' + i + '] ' + row + ' -> ' + verdict);
        // Expect the letter parser to accept the row.
        expect(verdict).assertTrue();
        // Expect the accepted row to hold letters only.
        expect(isAsciiAlpha(row)).assertTrue();
        // Expect the accepted row to be refused by the digit parser.
        expect(ValidateUtils.isDigits(row)).assertFalse();
      }

      // Prepare the mixed table that both parsers must refuse.
      const mixedRows: string[] = ['a1', '1a', 'Hello World', '1 2', 'a-b', '中文', ''];
      // Walk the mixed table.
      for (let i: number = 0; i < mixedRows.length; i++) {
        // Read the current mixed row.
        const row: string = mixedRows[i];
        // Run both parsers on the current row.
        const digitVerdict: boolean = ValidateUtils.isDigits(row);
        // Run the letter parser on the current row.
        const alphaVerdict: boolean = ValidateUtils.isAlpha(row);
        // Log the mixed row verdicts.
        logCase(TAG, 'mixed row[' + i + '] digits ' + digitVerdict + ', alpha ' + alphaVerdict);
        // Expect the digit parser to refuse the mixed row.
        expect(digitVerdict).assertFalse();
        // Expect the letter parser to refuse the mixed row.
        expect(alphaVerdict).assertFalse();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PARSEMX_0900
     * @tc.name      testParsemxLengthBoundaryTable0001
     * @tc.desc      Verify lengthBetween over the inclusive minimum and maximum boundaries and the one step outside range.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testParsemxLengthBoundaryTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testParsemxLengthBoundaryTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Bound the range of the inclusive length checks.
      const minWidth: number = 3;
      // Bound the upper range of the inclusive length checks.
      const maxWidth: number = 6;
      // Prepare the width sweep around the inclusive range.
      const widths: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8];
      // Walk the width sweep in order.
      for (let i: number = 0; i < widths.length; i++) {
        // Read the current width.
        const width: number = widths[i];
        // Build the text of the current width.
        let text: string = '';
        // Append one character per requested position.
        for (let j: number = 0; j < width; j++) {
          // Append one character of the length sweep.
          text += 'x';
        }
        // Validate the composed text against the inclusive range.
        const verdict: boolean = ValidateUtils.lengthBetween(text, minWidth, maxWidth);
        // Log the length sweep row.
        logCase(TAG, 'length row[' + i + '] width ' + width + ' -> ' + verdict);
        // Expect the inclusive range to accept the widths from three to six only.
        expect(verdict).assertEqual(width >= minWidth && width <= maxWidth);
      }

      // Confirm the exact minimum boundary is accepted.
      const minBoundary: string = 'abc';
      // Log the minimum boundary verdict.
      logCase(TAG, 'minimum boundary verdict ' + ValidateUtils.lengthBetween(minBoundary, 3, 6));
      // Expect the exact minimum boundary to be accepted.
      expect(ValidateUtils.lengthBetween(minBoundary, 3, 6)).assertTrue();
      // Expect the exact maximum boundary to be accepted.
      expect(ValidateUtils.lengthBetween('abcdef', 3, 6)).assertTrue();
      // Expect the width one below the minimum to be refused.
      expect(ValidateUtils.lengthBetween('ab', 3, 6)).assertFalse();
      // Expect the width one above the maximum to be refused.
      expect(ValidateUtils.lengthBetween('abcdefg', 3, 6)).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PARSEMX_1000
     * @tc.name      testParsemxEmailParserTable0001
     * @tc.desc      Verify the email parser accepts ordinary addresses and refuses addresses without the at sign or the top level domain.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testParsemxEmailParserTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testParsemxEmailParserTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the accepted addresses of the email table.
      const accepts: string[] = ['a@b.cn', 'user.name@example.com', 'user+tag@example.co',
        'first_last@sub.example.org', 'A1@B2.IO'];
      // Walk the accepted addresses.
      for (let i: number = 0; i < accepts.length; i++) {
        // Read the current accepted address.
        const address: string = accepts[i];
        // Run the email parser on the current address.
        const verdict: boolean = ValidateUtils.isEmail(address);
        // Log the accepted email row.
        logCase(TAG, 'email accept row[' + i + '] ' + address + ' -> ' + verdict);
        // Expect the email parser to accept the address.
        expect(verdict).assertTrue();
        // Expect the accepted address to hold the at sign.
        expect(address.indexOf('@') > 0).assertTrue();
      }

      // Prepare the refused addresses of the email table.
      const rejects: string[] = ['plain', 'a@b', 'a@b.c', '@b.cn', 'a@.cn', 'a b@c.cn', 'a@@b.cn', '',
        'a@b.cn ', ' a@b.cn'];
      // Walk the refused addresses.
      for (let i: number = 0; i < rejects.length; i++) {
        // Read the current refused address.
        const address: string = rejects[i];
        // Run the email parser on the current address.
        const verdict: boolean = ValidateUtils.isEmail(address);
        // Log the refused email row.
        logCase(TAG, 'email reject row[' + i + '] ' + address + ' -> ' + verdict);
        // Expect the email parser to refuse the address.
        expect(verdict).assertFalse();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PARSEMX_1100
     * @tc.name      testParsemxMobileParserTable0001
     * @tc.desc      Verify the mobile parser accepts the supported prefixes and refuses wrong lengths and wrong second digits.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testParsemxMobileParserTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testParsemxMobileParserTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the accepted mobile numbers of the prefix table.
      const accepts: string[] = ['13000000000', '14000000000', '15000000000', '16600000000',
        '17700000000', '18800000000', '19900000000'];
      // Walk the accepted mobile numbers.
      for (let i: number = 0; i < accepts.length; i++) {
        // Read the current accepted number.
        const mobile: string = accepts[i];
        // Run the mobile parser on the current number.
        const verdict: boolean = ValidateUtils.isMobile(mobile);
        // Log the accepted mobile row.
        logCase(TAG, 'mobile accept row[' + i + '] ' + mobile + ' -> ' + verdict);
        // Expect the mobile parser to accept the number.
        expect(verdict).assertTrue();
        // Expect the accepted number to keep the eleven digit width.
        expect(mobile.length).assertEqual(11);
      }

      // Prepare the refused mobile numbers of the prefix table.
      const rejects: string[] = ['12000000000', '11000000000', '10000000000', '20000000000',
        '1300000000', '130000000000', 'abc00000000', '', '1300000000a'];
      // Walk the refused mobile numbers.
      for (let i: number = 0; i < rejects.length; i++) {
        // Read the current refused number.
        const mobile: string = rejects[i];
        // Run the mobile parser on the current number.
        const verdict: boolean = ValidateUtils.isMobile(mobile);
        // Log the refused mobile row.
        logCase(TAG, 'mobile reject row[' + i + '] ' + mobile + ' -> ' + verdict);
        // Expect the mobile parser to refuse the number.
        expect(verdict).assertFalse();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PARSEMX_1200
     * @tc.name      testParsemxShapeDisjoint0001
     * @tc.desc      Verify the five shape parsers are pairwise disjoint over well formed and plain text rows.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testParsemxShapeDisjoint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testParsemxShapeDisjoint0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the well formed rows that one single parser must accept each.
      const singleRows: string[] = ['13800000000', 'user@example.com', '10.0.0.1', '#a1b2c3',
        '110101199003071234'];
      // Walk the single acceptance rows.
      for (let i: number = 0; i < singleRows.length; i++) {
        // Read the current single acceptance row.
        const row: string = singleRows[i];
        // Run the five shape parsers on the row.
        const verdicts: boolean[] = [ValidateUtils.isMobile(row), ValidateUtils.isEmail(row),
          ValidateUtils.isIpv4(row), ValidateUtils.isHexColor(row), ValidateUtils.isIdCard18(row)];
        // Count the accepted verdicts of the row.
        const accepted: number = countVerdict(verdicts, true);
        // Log the single acceptance row summary.
        logCase(TAG, 'single row[' + i + '] accepted by ' + accepted + ' parsers');
        // Expect exactly one parser to accept the row.
        expect(accepted).assertEqual(1);
        // Expect the row to be accepted by its own parser only.
        expect(verdicts[i]).assertTrue();
      }

      // Prepare the plain rows that every parser must refuse.
      const plainRows: string[] = ['hello', 'Hello World', '', '   ', 'not-a-value', '12345'];
      // Walk the plain rows.
      for (let i: number = 0; i < plainRows.length; i++) {
        // Read the current plain row.
        const row: string = plainRows[i];
        // Run the five shape parsers on the plain row.
        const anyAccepted: boolean = ValidateUtils.isMobile(row) || ValidateUtils.isEmail(row) ||
          ValidateUtils.isIpv4(row) || ValidateUtils.isHexColor(row) || ValidateUtils.isIdCard18(row);
        // Log the plain row verdict.
        logCase(TAG, 'plain row[' + i + '] accepted ' + anyAccepted);
        // Expect the plain row to be refused by every parser.
        expect(anyAccepted).assertFalse();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PARSEMX_1300
     * @tc.name      testParsemxCrossFormatTable0001
     * @tc.desc      Verify the parser verdicts stay stable when the same text is fed to the digit, letter and length parsers as well.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testParsemxCrossFormatTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testParsemxCrossFormatTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the cross format rows of the matrix.
      const rows: string[] = ['13800000000', '123456789012345678', 'abcdef', '10.0.0.1', '#fff'];
      // Walk the cross format rows.
      for (let i: number = 0; i < rows.length; i++) {
        // Read the current cross format row.
        const row: string = rows[i];
        // Run the digit, letter and length parsers on the row.
        const digitVerdict: boolean = ValidateUtils.isDigits(row);
        // Run the letter parser on the row.
        const alphaVerdict: boolean = ValidateUtils.isAlpha(row);
        // Run the length parser on the row with a wide range.
        const lengthVerdict: boolean = ValidateUtils.lengthBetween(row, 1, 30);
        // Log the cross format row verdicts.
        logCase(TAG, 'cross row[' + i + '] digits ' + digitVerdict + ', alpha ' + alphaVerdict +
          ', length ' + lengthVerdict);
        // Expect the digit and letter verdicts to be mutually exclusive.
        expect(digitVerdict && alphaVerdict).assertFalse();
        // Expect the row to stay inside the wide length range.
        expect(lengthVerdict).assertTrue();
        // Expect the digit verdict to match the manual digit scan.
        expect(digitVerdict).assertEqual(isDigitOnly(row));
        // Expect the letter verdict to match the manual letter scan.
        expect(alphaVerdict).assertEqual(isAsciiAlpha(row));
      }

      // Prepare the hexadecimal rows of the digest style checks.
      const hexRows: string[] = ['0123456789abcdef', 'deadbeef', '00ff00'];
      // Walk the hexadecimal rows.
      for (let i: number = 0; i < hexRows.length; i++) {
        // Read the current hexadecimal row.
        const row: string = hexRows[i];
        // Check the row against the lowercase hexadecimal alphabet.
        const verdict: boolean = isLowerHexText(row);
        // Log the hexadecimal row verdict.
        logCase(TAG, 'hex row[' + i + '] ' + row + ' -> ' + verdict);
        // Expect the hexadecimal row to use lowercase letters and digits only.
        expect(verdict).assertTrue();
        // Expect the hexadecimal row to be refused by the colour parser.
        expect(ValidateUtils.isHexColor(row)).assertFalse();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
    /**
     * @tc.number    SUB_FONTRESOURCE_LT_PARSEMX_1400
     * @tc.name      testParsemxWhitespaceTable0001
     * @tc.desc      Verify no shape parser trims the input, so leading and trailing whitespace always rejects the row.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testParsemxWhitespaceTable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testParsemxWhitespaceTable0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the whitespace decorated rows that share the plain prefixes.
      const decoratedRows: string[] = [' 13800000000', '13800000000 ', ' user@example.com', '#fff ',
        ' 110101199003071234'];
      // Prepare the plain counterparts that must be accepted instead.
      const plainRows: string[] = ['13800000000', '13800000000', 'user@example.com', '#fff',
        '110101199003071234'];
      // Walk the whitespace decorated rows.
      for (let i: number = 0; i < decoratedRows.length; i++) {
        // Read the current decorated row.
        const decorated: string = decoratedRows[i];
        // Read the matching plain row.
        const plain: string = plainRows[i];
        // Run the five shape parsers on the decorated row.
        const decoratedVerdicts: boolean[] = [ValidateUtils.isMobile(decorated), ValidateUtils.isEmail(decorated),
          ValidateUtils.isIpv4(decorated), ValidateUtils.isHexColor(decorated),
          ValidateUtils.isIdCard18(decorated)];
        // Run the five shape parsers on the plain row.
        const plainVerdicts: boolean[] = [ValidateUtils.isMobile(plain), ValidateUtils.isEmail(plain),
          ValidateUtils.isIpv4(plain), ValidateUtils.isHexColor(plain), ValidateUtils.isIdCard18(plain)];
        // Count the accepted verdicts of the decorated row.
        const decoratedAccepted: number = countVerdict(decoratedVerdicts, true);
        // Count the accepted verdicts of the plain row.
        const plainAccepted: number = countVerdict(plainVerdicts, true);
        // Log the whitespace row summary.
        logCase(TAG, 'whitespace row[' + i + '] decorated ' + decoratedAccepted + ', plain ' + plainAccepted);
        // Expect the decorated row to be refused by every parser.
        expect(decoratedAccepted).assertEqual(0);
        // Expect the plain row to be accepted by exactly one parser.
        expect(plainAccepted).assertEqual(1);
        // Expect the digit parser to refuse the decorated row as well.
        expect(ValidateUtils.isDigits(decorated)).assertFalse();
        // Expect the letter parser to refuse the decorated row as well.
        expect(ValidateUtils.isAlpha(decorated)).assertFalse();
      }

      // Confirm the length parser still measures the whitespace as characters.
      const decoratedLength: number = ' 13800000000'.length;
      // Log the decorated length measurement.
      logCase(TAG, 'decorated length ' + decoratedLength);
      // Expect the decorated text to be one character wider than the plain text.
      expect(decoratedLength).assertEqual('13800000000'.length + 1);
      // Expect the length parser to accept the decorated text inside the wide range.
      expect(ValidateUtils.lengthBetween(' 13800000000', 1, 30)).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}

// Also expose the suite function as a named export so either registration style works.
export { parserMatrixTest };
