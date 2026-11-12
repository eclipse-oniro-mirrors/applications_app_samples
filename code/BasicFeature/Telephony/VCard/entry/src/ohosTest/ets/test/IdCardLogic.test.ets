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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { IdCardParts, IdCardUtils } from '../testutils/IdCardUtils';

const DOMAIN: number = 0xF811;

export default function idCardLogicTest() {
  describe('IdCardLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_0100
     * @tc.name      testIdCardChecksum0001
     * @tc.desc      Verify checksumDigit() returns the exact check character
     *               for well known seventeen digit payloads, covering digit
     *               results and the letter X remainder mapping.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardChecksum0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardChecksum0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Classic Beijing sample, weighted sum 167, remainder 2 maps to X.
      expect(IdCardUtils.checksumDigit('11010519491231002')).assertEqual('X');
      // Shanghai sample with remainder 10 mapping to the digit 2.
      expect(IdCardUtils.checksumDigit('11010119900307751')).assertEqual('2');
      // Guangdong sample with remainder 8 mapping to the digit 4.
      expect(IdCardUtils.checksumDigit('44052418800101001')).assertEqual('4');
      // Hebei sample with remainder 1 mapping to the digit 0.
      expect(IdCardUtils.checksumDigit('13050319670101001')).assertEqual('0');
      // Ascending ramp payload with remainder 5 mapping to the digit 7.
      expect(IdCardUtils.checksumDigit('12345678901234567')).assertEqual('7');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_0200
     * @tc.name      testIdCardChecksum0002
     * @tc.desc      Verify checksumDigit() returns the empty string for
     *               payloads whose length is not seventeen or which contain
     *               letters, spaces or other non-digit characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardChecksum0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardChecksum0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Empty input has the wrong length and no digits at all.
      expect(IdCardUtils.checksumDigit('')).assertEqual('');
      // Sixteen digit payload is one character short.
      expect(IdCardUtils.checksumDigit('1101051949123100')).assertEqual('');
      // Eighteen digit payload already contains the check position.
      expect(IdCardUtils.checksumDigit('110105194912310021')).assertEqual('');
      // Trailing letter breaks the all-digit contract.
      expect(IdCardUtils.checksumDigit('1101051949123100a')).assertEqual('');
      // Inner space breaks the all-digit contract.
      expect(IdCardUtils.checksumDigit('11010519491231 02')).assertEqual('');
      // Letter X inside the payload is not an accepted digit.
      expect(IdCardUtils.checksumDigit('1101051949123100X')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_0300
     * @tc.name      testIdCardChecksum0003
     * @tc.desc      Verify checksumDigit() walks through the remainder table
     *               by feeding payloads made of sixteen ones plus one trailing
     *               digit, which produces ten distinct remainders.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardChecksum0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardChecksum0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Seventeen ones give weighted sum 100 and remainder 1.
      expect(IdCardUtils.checksumDigit('11111111111111111')).assertEqual('0');
      // Remainder 10 maps to the digit 2.
      expect(IdCardUtils.checksumDigit('11111111111111110')).assertEqual('2');
      // Remainder 3 maps to the digit 9.
      expect(IdCardUtils.checksumDigit('11111111111111112')).assertEqual('9');
      // Remainder 7 maps to the digit 5.
      expect(IdCardUtils.checksumDigit('11111111111111114')).assertEqual('5');
      // Remainder 0 maps to the digit 1.
      expect(IdCardUtils.checksumDigit('11111111111111116')).assertEqual('1');
      // Remainder 2 maps to the letter X.
      expect(IdCardUtils.checksumDigit('11111111111111117')).assertEqual('X');
      // Remainder 6 maps to the digit 6.
      expect(IdCardUtils.checksumDigit('11111111111111119')).assertEqual('6');
      // A fifteenth digit of six lifts the sum to 140 and remainder 8.
      expect(IdCardUtils.checksumDigit('11111111111111611')).assertEqual('4');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_0400
     * @tc.name      testIdCardValid0001
     * @tc.desc      Verify isValidIdCard() accepts a matrix of checksum
     *               correct eighteen digit numbers built by hand and by the
     *               checksumDigit helper itself.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardValid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardValid0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Well known Beijing sample ending with letter X.
      expect(IdCardUtils.isValidIdCard('11010519491231002X')).assertTrue();
      // Hand computed sample with digit check character.
      expect(IdCardUtils.isValidIdCard('110101199003077512')).assertTrue();
      // Historical century birthday sample.
      expect(IdCardUtils.isValidIdCard('440524188001010014')).assertTrue();
      // Nineteen sixties birthday sample.
      expect(IdCardUtils.isValidIdCard('130503196701010010')).assertTrue();
      // Ones ramp sample whose checksum lands on the digit two.
      expect(IdCardUtils.isValidIdCard('111111111111111102')).assertTrue();
      // Ascending ramp sample whose checksum lands on the digit seven.
      expect(IdCardUtils.isValidIdCard('123456789012345677')).assertTrue();
      // Zero filled sample whose checksum lands on the digit one.
      expect(IdCardUtils.isValidIdCard('000000000000000001')).assertTrue();
      // Nine filled sample whose checksum lands on the digit three.
      expect(IdCardUtils.isValidIdCard('999999999999999993')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_0500
     * @tc.name      testIdCardValid0002
     * @tc.desc      Verify isValidIdCard() rejects numbers whose final
     *               character differs from the computed checksum digit while
     *               every other position stays unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardValid0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardValid0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Correct sample for reference, check digit is X.
      expect(IdCardUtils.isValidIdCard('11010519491231002X')).assertTrue();
      // Replacing X with digit one breaks the checksum.
      expect(IdCardUtils.isValidIdCard('110105194912310021')).assertFalse();
      // Replacing X with digit nine breaks the checksum.
      expect(IdCardUtils.isValidIdCard('110105194912310029')).assertFalse();
      // Correct sample for reference, check digit is two.
      expect(IdCardUtils.isValidIdCard('110101199003077512')).assertTrue();
      // Off by one check digit is rejected.
      expect(IdCardUtils.isValidIdCard('110101199003077513')).assertFalse();
      // Guandong sample with a broken trailing digit is rejected.
      expect(IdCardUtils.isValidIdCard('440524188001010015')).assertFalse();
      // Ascending ramp sample with the wrong trailing digit is rejected.
      expect(IdCardUtils.isValidIdCard('123456789012345678')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_0600
     * @tc.name      testIdCardValid0003
     * @tc.desc      Verify isValidIdCard() treats the eighteenth position
     *               exactly: upper X and lower x are accepted only when the
     *               checksum is X, other symbols are always rejected.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardValid0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardValid0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Upper X matches the computed checksum letter.
      expect(IdCardUtils.isValidIdCard('11010519491231002X')).assertTrue();
      // Lower x is normalised and also accepted.
      expect(IdCardUtils.isValidIdCard('11010519491231002x')).assertTrue();
      // This payload computes to digit two, so letter x is wrong here.
      expect(IdCardUtils.isValidIdCard('11010119900307751x')).assertFalse();
      // Same payload with upper X is wrong too.
      expect(IdCardUtils.isValidIdCard('11010119900307751X')).assertFalse();
      // Dash in the last position is not a digit nor a letter X.
      expect(IdCardUtils.isValidIdCard('11010519491231002-')).assertFalse();
      // Star in the last position is rejected as well.
      expect(IdCardUtils.isValidIdCard('11010519491231002*')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_0700
     * @tc.name      testIdCardValid0004
     * @tc.desc      Verify isValidIdCard() enforces the exact length of
     *               eighteen characters and rejects empty, short, long and
     *               seventeen digit near misses.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardValid0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardValid0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Empty string fails the length gate immediately.
      expect(IdCardUtils.isValidIdCard('')).assertFalse();
      // Ten digit fragment is far too short.
      expect(IdCardUtils.isValidIdCard('1101051949')).assertFalse();
      // Seventeen digits are exactly one character short.
      expect(IdCardUtils.isValidIdCard('11010519491231002')).assertFalse();
      // Nineteen digits are one character too long.
      expect(IdCardUtils.isValidIdCard('11010519491231002X1')).assertFalse();
      // The matching eighteen digit number built from the same body passes.
      expect(IdCardUtils.isValidIdCard('11010519491231002X')).assertTrue();
      // Ascending ramp sample confirms eighteen digits are still accepted.
      expect(IdCardUtils.isValidIdCard('123456789012345677')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_0800
     * @tc.name      testIdCardRegion0001
     * @tc.desc      Verify isValidRegionCode() accepts six character codes
     *               whose first digit lies in 1-9 and whose second digit is
     *               any decimal digit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardRegion0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardRegion0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Beijing municipality prefix.
      expect(IdCardUtils.isValidRegionCode('110101')).assertTrue();
      // Guangdong province prefix.
      expect(IdCardUtils.isValidRegionCode('440301')).assertTrue();
      // Shanghai municipality prefix.
      expect(IdCardUtils.isValidRegionCode('310101')).assertTrue();
      // Xinjiang prefix starting with six.
      expect(IdCardUtils.isValidRegionCode('650102')).assertTrue();
      // Highest legal leading digit nine.
      expect(IdCardUtils.isValidRegionCode('990101')).assertTrue();
      // Lowest legal leading digit one with a trailing letter tail.
      expect(IdCardUtils.isValidRegionCode('100000')).assertTrue();
      // Mid range province digit four.
      expect(IdCardUtils.isValidRegionCode('440524')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_0900
     * @tc.name      testIdCardRegion0002
     * @tc.desc      Verify isValidRegionCode() rejects empty strings, wrong
     *               lengths, leading zero codes and non-digit leading or
     *               second characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardRegion0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardRegion0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Empty string fails the length gate.
      expect(IdCardUtils.isValidRegionCode('')).assertFalse();
      // Five characters are one short.
      expect(IdCardUtils.isValidRegionCode('11010')).assertFalse();
      // Seven characters are one long.
      expect(IdCardUtils.isValidRegionCode('1101011')).assertFalse();
      // Leading zero is outside the legal 1-9 range.
      expect(IdCardUtils.isValidRegionCode('010101')).assertFalse();
      // Letter in the leading position is rejected.
      expect(IdCardUtils.isValidRegionCode('a10101')).assertFalse();
      // Letter in the second position is rejected.
      expect(IdCardUtils.isValidRegionCode('1a0101')).assertFalse();
      // Leading zero combined with a letter is rejected.
      expect(IdCardUtils.isValidRegionCode('0a0101')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_1000
     * @tc.name      testIdCardBirthday0001
     * @tc.desc      Verify extractBirthday() renders yyyy-MM-dd for valid
     *               cards spanning four different decades including a
     *               historical 1880 sample.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardBirthday0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardBirthday0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Year end birthday taken from the classic Beijing sample.
      expect(IdCardUtils.extractBirthday('11010519491231002X')).assertEqual('1949-12-31');
      // Spring birthday from the Shanghai sample.
      expect(IdCardUtils.extractBirthday('110101199003077512')).assertEqual('1990-03-07');
      // First day of 1880 from the historical sample.
      expect(IdCardUtils.extractBirthday('440524188001010014')).assertEqual('1880-01-01');
      // Double digit month and day from the Shaanxi sample.
      expect(IdCardUtils.extractBirthday('610102198012120033')).assertEqual('1980-12-12');
      // Mid June birthday from the Fujian sample.
      expect(IdCardUtils.extractBirthday('350102198006190015')).assertEqual('1980-06-19');
      // New year day birthday from the second Beijing sample.
      expect(IdCardUtils.extractBirthday('110101199002010025')).assertEqual('1990-02-01');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_1100
     * @tc.name      testIdCardBirthday0002
     * @tc.desc      Verify extractBirthday() returns the empty string for
     *               invalid cards including checksum failures, wrong lengths
     *               and empty input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardBirthday0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardBirthday0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Empty input is not a valid card.
      expect(IdCardUtils.extractBirthday('')).assertEqual('');
      // Broken checksum digit blocks extraction.
      expect(IdCardUtils.extractBirthday('110105194912310021')).assertEqual('');
      // Seventeen digit body has no check position and is rejected.
      expect(IdCardUtils.extractBirthday('11010519491231002')).assertEqual('');
      // Trailing space makes the length nineteen and fails validation.
      expect(IdCardUtils.extractBirthday('11010519491231002X ')).assertEqual('');
      // Off by one check digit blocks extraction.
      expect(IdCardUtils.extractBirthday('110101199003077513')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_1200
     * @tc.name      testIdCardGender0001
     * @tc.desc      Verify extractGenderDigit() maps odd seventeenth digits
     *               one, three and nine to the male value one for valid
     *               cards.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardGender0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardGender0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Seventeenth digit one maps to male.
      expect(IdCardUtils.extractGenderDigit('110101199003077512')).assertEqual(1);
      // Seventeenth digit one again from the Shanghai sample.
      expect(IdCardUtils.extractGenderDigit('310101198001010018')).assertEqual(1);
      // Seventeenth digit nine still maps to male.
      expect(IdCardUtils.extractGenderDigit('510101199011119393')).assertEqual(1);
      // Seventeenth digit three maps to male.
      expect(IdCardUtils.extractGenderDigit('610102198012120033')).assertEqual(1);
      // Seventeenth digit one from the Fujian sample.
      expect(IdCardUtils.extractGenderDigit('350102198006190015')).assertEqual(1);
      // The label helper agrees with the numeric value.
      expect(IdCardUtils.genderLabelOf('110101199003077512')).assertEqual('male');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_1300
     * @tc.name      testIdCardGender0002
     * @tc.desc      Verify extractGenderDigit() maps even seventeenth digits
     *               zero, two and four to the female value zero for valid
     *               cards.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardGender0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardGender0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Seventeenth digit two before the X check character.
      expect(IdCardUtils.extractGenderDigit('11010519491231002X')).assertEqual(0);
      // Seventeenth digit two in the second Beijing sample.
      expect(IdCardUtils.extractGenderDigit('110101199002010025')).assertEqual(0);
      // Seventeenth digit four maps to female too.
      expect(IdCardUtils.extractGenderDigit('310101198001010042')).assertEqual(0);
      // Seventeenth digit zero from the hand built sample.
      expect(IdCardUtils.extractGenderDigit('440301197801110004')).assertEqual(0);
      // The label helper agrees with the numeric value.
      expect(IdCardUtils.genderLabelOf('11010519491231002X')).assertEqual('female');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_1400
     * @tc.name      testIdCardMask0001
     * @tc.desc      Verify maskIdCard() keeps the first six and last four
     *               characters and replaces exactly the middle eight
     *               characters with asterisks.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardMask0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardMask0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Classic sample keeps region head and X tail.
      expect(IdCardUtils.maskIdCard('11010519491231002X')).assertEqual('110105********002X');
      // Digit tail sample keeps the last four digits.
      expect(IdCardUtils.maskIdCard('440301197801110012')).assertEqual('440301********0012');
      // Female sample keeps its four digit tail.
      expect(IdCardUtils.maskIdCard('310101198001010042')).assertEqual('310101********0042');
      // Masked output keeps the eighteen character length.
      expect(IdCardUtils.maskIdCard('11010519491231002X').length).assertEqual(18);
      // First six characters survive unchanged.
      expect(IdCardUtils.maskIdCard('11010519491231002X').substring(0, 6)).assertEqual('110105');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_1500
     * @tc.name      testIdCardMask0002
     * @tc.desc      Verify maskIdCard() returns every input whose length
     *               differs from eighteen unchanged, including empty and
     *               oversized strings.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardMask0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardMask0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Empty string is returned as is.
      expect(IdCardUtils.maskIdCard('')).assertEqual('');
      // Ten digit fragment is returned as is.
      expect(IdCardUtils.maskIdCard('1101051949')).assertEqual('1101051949');
      // Seventeen digit body is returned as is.
      expect(IdCardUtils.maskIdCard('11010519491231002')).assertEqual('11010519491231002');
      // Nineteen digit string is returned as is.
      expect(IdCardUtils.maskIdCard('1101051949123100211')).assertEqual('1101051949123100211');
      // Sixteen digit string is returned as is.
      expect(IdCardUtils.maskIdCard('1234567890123456')).assertEqual('1234567890123456');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_1600
     * @tc.name      testIdCardRegionTable0001
     * @tc.desc      Verify regionPrefixTable() exposes thirty one entries
     *               with the expected boundary members in the expected
     *               order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardRegionTable0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardRegionTable0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const table: string[] = IdCardUtils.regionPrefixTable();
      // The administrative table lists thirty one province level codes.
      expect(table.length).assertEqual(31);
      // First entry is Beijing.
      expect(table[0]).assertEqual('11');
      // Third entry is Hebei.
      expect(table[2]).assertEqual('13');
      // Liaoning sits at index five.
      expect(table[5]).assertEqual('21');
      // Heilongjiang sits at index seven.
      expect(table[7]).assertEqual('23');
      // Chongqing opens the south-west block.
      expect(table[21]).assertEqual('50');
      // Shaanxi opens the north-west block.
      expect(table[26]).assertEqual('61');
      // Xinjiang closes the table.
      expect(table[30]).assertEqual('65');
      expect(table).assertContain('11');
      expect(table).assertContain('65');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_1700
     * @tc.name      testIdCardRegionTable0002
     * @tc.desc      Verify regionPrefixTable() contains no duplicate codes
     *               and every entry is exactly two decimal digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardRegionTable0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardRegionTable0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const table: string[] = IdCardUtils.regionPrefixTable();
      let duplicateCount: number = 0;
      for (let i = 0; i < table.length; i++) {
        for (let j = i + 1; j < table.length; j++) {
          if (table[i] === table[j]) {
            duplicateCount = duplicateCount + 1;
          }
        }
      }
      // No code may appear twice in the province table.
      expect(duplicateCount).assertEqual(0);
      let badLengthCount: number = 0;
      let nonDigitCount: number = 0;
      for (let i = 0; i < table.length; i++) {
        const item: string = table[i];
        if (item.length !== 2) {
          badLengthCount = badLengthCount + 1;
        }
        for (let k = 0; k < item.length; k++) {
          const ch: string = item.charAt(k);
          if (ch < '0' || ch > '9') {
            nonDigitCount = nonDigitCount + 1;
          }
        }
      }
      // Every entry is exactly two characters wide.
      expect(badLengthCount).assertEqual(0);
      // Every character is a decimal digit.
      expect(nonDigitCount).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_1800
     * @tc.name      testIdCardRoundTrip0001
     * @tc.desc      Verify the checksum-validate-extract pipeline: a body
     *           built from region, birthday and sequence validates, and
     *               birthday plus gender can be read back unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardRoundTrip0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardRoundTrip0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Glue the fixed width fields into a seventeen digit body.
      const first17: string = '440301' + '19780111' + '001';
      const check: string = IdCardUtils.checksumDigit(first17);
      // The helper must produce exactly one check character.
      expect(check.length).assertEqual(1);
      const full: string = first17 + check;
      // The assembled number must validate as a whole.
      expect(IdCardUtils.isValidIdCard(full)).assertTrue();
      // The length stays at eighteen after appending one character.
      expect(full.length).assertEqual(18);
      // Birthday extraction returns the injected date.
      expect(IdCardUtils.extractBirthday(full)).assertEqual('1978-01-11');
      // Sequence ending in one is male.
      expect(IdCardUtils.extractGenderDigit(full)).assertEqual(1);
      // The label helper reports the same gender.
      expect(IdCardUtils.genderLabelOf(full)).assertEqual('male');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_1900
     * @tc.name      testIdCardRoundTrip0002
     * @tc.desc      Verify buildValidIdCard() produces an eighteen digit
     *               number that validates, extracts and masks consistently.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardRoundTrip0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardRoundTrip0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a Shanghai sample with an odd sequence.
      const built: string = IdCardUtils.buildValidIdCard('510101', '19901111', '939');
      // The builder returns exactly eighteen characters.
      expect(built.length).assertEqual(18);
      // The generated number passes the full validation.
      expect(IdCardUtils.isValidIdCard(built)).assertTrue();
      // Birthday round trip returns the injected date.
      expect(IdCardUtils.extractBirthday(built)).assertEqual('1990-11-11');
      // Sequence ending in nine is male.
      expect(IdCardUtils.extractGenderDigit(built)).assertEqual(1);
      // Masking keeps the region head and the nine three nine three tail.
      expect(IdCardUtils.maskIdCard(built)).assertEqual('510101********9393');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_2000
     * @tc.name      testIdCardChecksum0004
     * @tc.desc      Verify that for the first eight province prefixes the
     *               checksum helper yields one character and the assembled
     *               full number always validates.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardChecksum0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardChecksum0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const table: string[] = IdCardUtils.regionPrefixTable();
      let validCount: number = 0;
      let singleCharCount: number = 0;
      for (let i = 0; i < 8; i++) {
        const region6: string = table[i] + '0101';
        const first17: string = region6 + '19800101' + '001';
        const check: string = IdCardUtils.checksumDigit(first17);
        if (check.length === 1) {
          singleCharCount = singleCharCount + 1;
        }
        const full: string = first17 + check;
        if (IdCardUtils.isValidIdCard(full)) {
          validCount = validCount + 1;
        }
      }
      // Every checksum is a single character, never the empty error marker.
      expect(singleCharCount).assertEqual(8);
      // Every assembled number passes validation by construction.
      expect(validCount).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_2100
     * @tc.name      testIdCardRegion0003
     * @tc.desc      Verify isValidRegionCode() accepts every province prefix
     *               from the table once it is padded to six characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardRegion0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardRegion0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const table: string[] = IdCardUtils.regionPrefixTable();
      let okCount: number = 0;
      for (let i = 0; i < table.length; i++) {
        const code: string = table[i] + '0101';
        // Padding with 0101 keeps the six digit length and legal head.
        if (IdCardUtils.isValidRegionCode(code)) {
          okCount = okCount + 1;
        }
      }
      // All thirty one padded province codes pass the region check.
      expect(okCount).assertEqual(31);
      // Spot checks for the first and the last table member.
      expect(IdCardUtils.isValidRegionCode('110000')).assertTrue();
      expect(IdCardUtils.isValidRegionCode('650000')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_2200
     * @tc.name      testIdCardGender0003
     * @tc.desc      Verify extractGenderDigit() at the digit boundaries
     *               zero and nine and that genderLabelOf translates both
     *               boundary values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardGender0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardGender0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Seventeenth digit zero is the smallest even boundary.
      expect(IdCardUtils.isValidIdCard('440301197801110004')).assertTrue();
      expect(IdCardUtils.extractGenderDigit('440301197801110004')).assertEqual(0);
      expect(IdCardUtils.genderLabelOf('440301197801110004')).assertEqual('female');
      // Seventeenth digit nine is the largest odd boundary.
      expect(IdCardUtils.isValidIdCard('440301197801110098')).assertTrue();
      expect(IdCardUtils.extractGenderDigit('440301197801110098')).assertEqual(1);
      expect(IdCardUtils.genderLabelOf('440301197801110098')).assertEqual('male');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_2300
     * @tc.name      testIdCardMask0003
     * @tc.desc      Verify maskIdCard() and maskKeep() preserve the head and
     *               tail slices and insert exactly the expected number of
     *               asterisks in between.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardMask0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardMask0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const masked: string = IdCardUtils.maskIdCard('11010519491231002X');
      // The head slice of six characters survives.
      expect(masked.substring(0, 6)).assertEqual('110105');
      // The tail slice of four characters survives.
      expect(masked.substring(14, 18)).assertEqual('002X');
      // The middle slice is exactly eight asterisks.
      expect(masked.substring(6, 14)).assertEqual('********');
      // The total length is unchanged.
      expect(masked.length).assertEqual(18);
      // maskKeep with head length eight leaves six stars in the middle.
      const kept: string = IdCardUtils.maskKeep('11010519491231002X', 8);
      expect(kept).assertEqual('11010519******002X');
      // Short inputs are returned unchanged by maskKeep.
      expect(IdCardUtils.maskKeep('123', 8)).assertEqual('123');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_2400
     * @tc.name      testIdCardValid0005
     * @tc.desc      Verify isValidIdCard() rejects letters inside the first
     *               seventeen positions and strings padded with spaces or
     *               tabs on either side.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardValid0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardValid0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Letter X inside the digit body breaks the all-digit rule.
      expect(IdCardUtils.isValidIdCard('110105X9491231002X')).assertFalse();
      // Letter X in the very first position fails too.
      expect(IdCardUtils.isValidIdCard('X10519491231002X11')).assertFalse();
      // A trailing space makes the length nineteen.
      expect(IdCardUtils.isValidIdCard('11010519491231002X ')).assertFalse();
      // A leading space makes the length nineteen as well.
      expect(IdCardUtils.isValidIdCard(' 11010519491231002X')).assertFalse();
      // A trailing tab character also breaks the length contract.
      expect(IdCardUtils.isValidIdCard('11010519491231002X\t')).assertFalse();
      // A trailing digit extends the length to nineteen.
      expect(IdCardUtils.isValidIdCard('11010519491231002X1')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_2500
     * @tc.name      testIdCardBirthday0003
     * @tc.desc      Verify extractBirthday() output shape: length ten, dash
     *               separators at positions four and seven and digit only
     *               remaining fields.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardBirthday0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardBirthday0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const birthday: string = IdCardUtils.extractBirthday('610102198012120033');
      // The rendered date occupies exactly ten characters.
      expect(birthday.length).assertEqual(10);
      // The first dash separates year and month.
      expect(birthday.charAt(4)).assertEqual('-');
      // The second dash separates month and day.
      expect(birthday.charAt(7)).assertEqual('-');
      // The year slice keeps four digits.
      expect(birthday.substring(0, 4)).assertEqual('1980');
      // The month slice keeps two digits.
      expect(birthday.substring(5, 7)).assertEqual('12');
      // The day slice keeps two digits.
      expect(birthday.substring(8, 10)).assertEqual('12');
      // Additional samples confirm the same shape for other decades.
      expect(IdCardUtils.extractBirthday('350102198006190015')).assertEqual('1980-06-19');
      expect(IdCardUtils.extractBirthday('130503196701010010')).assertEqual('1967-01-01');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_2600
     * @tc.name      testIdCardRoundTrip0003
     * @tc.desc      Verify splitIdCard() returns the four fixed width fields
     *               of a valid card and null for an invalid one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardRoundTrip0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardRoundTrip0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const parts: IdCardParts | null = IdCardUtils.splitIdCard('11010519491231002X');
      // A valid card always produces a parts object.
      expect(parts).not().assertNull();
      // Region keeps the six digit administrative code.
      expect(parts !== null && parts.region === '110105').assertTrue();
      // Birthday keeps the raw eight digit slice.
      expect(parts !== null && parts.birthday === '19491231').assertTrue();
      // Sequence keeps the three digit slice including leading zeros.
      expect(parts !== null && parts.seq === '002').assertTrue();
      // Check keeps the final letter X.
      expect(parts !== null && parts.check === 'X').assertTrue();
      // A broken checksum yields null instead of partial data.
      const broken: IdCardParts | null = IdCardUtils.splitIdCard('110105194912310021');
      expect(broken).assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_2700
     * @tc.name      testIdCardChecksum0005
     * @tc.desc      Verify checksumDigit() feeds buildValidIdCard() style
     *               samples for the first eight province prefixes and every
     *               composed number passes isValidIdCard().
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardChecksum0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardChecksum0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const table: string[] = IdCardUtils.regionPrefixTable();
      let validCount: number = 0;
      // Compose region 110101 style samples from the first eight prefixes.
      for (let i = 0; i < 8; i++) {
        const first17: string = table[i] + '0101' + '19800101' + '001';
        const check: string = IdCardUtils.checksumDigit(first17);
        // The check digit is a single non-empty character.
        expect(check.length).assertEqual(1);
        expect(check !== '').assertTrue();
        const full: string = first17 + check;
        // Every composed number must validate end to end.
        if (IdCardUtils.isValidIdCard(full)) {
          validCount = validCount + 1;
        }
      }
      expect(validCount).assertEqual(8);
      // The trailing digit three payload maps to check digit seven.
      expect(IdCardUtils.checksumDigit('11111111111111113')).assertEqual('7');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_2800
     * @tc.name      testIdCardValid0006
     * @tc.desc      Verify isValidIdCard() accepts a consolidated matrix of
     *               eight independently hand verified valid numbers that
     *               span provinces, centuries and edge digit patterns.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardValid0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardValid0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Shanghai male sample from the 1980s.
      expect(IdCardUtils.isValidIdCard('310101198001010018')).assertTrue();
      // Shanghai female sample derived from the same body.
      expect(IdCardUtils.isValidIdCard('310101198001010042')).assertTrue();
      // Fujian sample from the same decade.
      expect(IdCardUtils.isValidIdCard('350102198006190015')).assertTrue();
      // Shaanxi sample born in December.
      expect(IdCardUtils.isValidIdCard('610102198012120033')).assertTrue();
      // Sichuan sample with a high sequence digit.
      expect(IdCardUtils.isValidIdCard('510101199011119393')).assertTrue();
      // Guangdong sample with remainder zero mapping.
      expect(IdCardUtils.isValidIdCard('440301197801110012')).assertTrue();
      // All-zero body whose checksum digit is one.
      expect(IdCardUtils.isValidIdCard('000000000000000001')).assertTrue();
      // All-nine body whose checksum digit is three.
      expect(IdCardUtils.isValidIdCard('999999999999999993')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_2900
     * @tc.name      testIdCardGender0004
     * @tc.desc      Verify genderLabelOf() renders male, female and the empty
     *               string for every branch of extractGenderDigit().
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardGender0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardGender0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Even seventeenth digit two renders the female label.
      expect(IdCardUtils.genderLabelOf('11010519491231002X')).assertEqual('female');
      // Odd seventeenth digit one renders the male label.
      expect(IdCardUtils.genderLabelOf('110101199003077512')).assertEqual('male');
      // Even digit four from the female sample renders female as well.
      expect(IdCardUtils.genderLabelOf('310101198001010042')).assertEqual('female');
      // Digit nine renders male because nine is odd.
      expect(IdCardUtils.genderLabelOf('440301197801110098')).assertEqual('male');
      // Empty input carries no gender label at all.
      expect(IdCardUtils.genderLabelOf('')).assertEqual('');
      // A broken checksum falls back to the empty label.
      expect(IdCardUtils.genderLabelOf('110105194912310021')).assertEqual('');
      // A too short input falls back to the empty label.
      expect(IdCardUtils.genderLabelOf('11010519491231002')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDCD_3000
     * @tc.name      testIdCardRoundTrip0004
     * @tc.desc      Verify maskKeep() star placement across head lengths
     *               zero, six, fourteen, fifteen and the negative fallback.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardRoundTrip0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardRoundTrip0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Keeping zero head characters yields fourteen stars.
      expect(IdCardUtils.maskKeep('11010519491231002X', 0)).assertEqual('**************002X');
      // Keeping six head characters matches maskIdCard exactly.
      expect(IdCardUtils.maskKeep('11010519491231002X', 6)).assertEqual('110105********002X');
      // Keeping fourteen head characters leaves no room for stars.
      expect(IdCardUtils.maskKeep('11010519491231002X', 14)).assertEqual('11010519491231002X');
      // Keeping fifteen head characters is beyond the guard bound.
      expect(IdCardUtils.maskKeep('11010519491231002X', 15)).assertEqual('11010519491231002X');
      // A negative keep request is returned unchanged.
      expect(IdCardUtils.maskKeep('11010519491231002X', -1)).assertEqual('11010519491231002X');
      // Eight character input with keep four has no star gap.
      expect(IdCardUtils.maskKeep('12345678', 4)).assertEqual('12345678');
      // Nine character input with keep four shows a single star.
      expect(IdCardUtils.maskKeep('123456789', 4)).assertEqual('1234*6789');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
