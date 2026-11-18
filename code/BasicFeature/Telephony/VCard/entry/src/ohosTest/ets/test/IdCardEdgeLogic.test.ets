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
import { IdCardUtils } from '../testutils/IdCardUtils';

const DOMAIN: number = 0xF811;

export default function idCardEdgeLogicTest() {
  describe('IdCardEdgeLogicTest', () => {
    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_0100
     * @tc.name      testIdCardLenEdge0001
     * @tc.desc      Verify isValidIdCard() rejects seventeen and nineteen
     *               character inputs that differ from a valid card by one
     *               character in length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardLenEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardLenEdge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Dropping the checksum character yields seventeen characters.
      expect(IdCardUtils.isValidIdCard('11010519491231002')).assertFalse();
      // Appending a letter yields nineteen characters.
      expect(IdCardUtils.isValidIdCard('11010519491231002XX')).assertFalse();
      // Appending a digit yields nineteen characters too.
      expect(IdCardUtils.isValidIdCard('1101051949123100211')).assertFalse();
      // A letter inside a seventeen character body still fails.
      expect(IdCardUtils.isValidIdCard('1101051949123100X')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_0200
     * @tc.name      testIdCardLenEdge0002
     * @tc.desc      Verify isValidIdCard() rejects extreme lengths of one,
     *               two and twenty-five characters outright.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardLenEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardLenEdge0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single digit is far too short.
      expect(IdCardUtils.isValidIdCard('1')).assertFalse();
      // Two digits are still far too short.
      expect(IdCardUtils.isValidIdCard('11')).assertFalse();
      // A twenty-five character body is far too long.
      expect(IdCardUtils.isValidIdCard('11010519491231002X012345')).assertFalse();
      // Repeating one digit twenty-five times also fails.
      expect(IdCardUtils.isValidIdCard('1111111111111111111111111')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_0300
     * @tc.name      testIdCardSpaceEdge0001
     * @tc.desc      Verify isValidIdCard() rejects cards containing ordinary
     *               spaces at the head, tail or middle positions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardSpaceEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardSpaceEdge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A space inside the region block breaks the digit rule.
      expect(IdCardUtils.isValidIdCard('110105 19491231002X')).assertFalse();
      // A trailing space extends the length beyond eighteen.
      expect(IdCardUtils.isValidIdCard('11010519491231002X ')).assertFalse();
      // A leading space extends the length beyond eighteen too.
      expect(IdCardUtils.isValidIdCard(' 11010519491231002X')).assertFalse();
      // A space before the sequence block breaks the digit rule.
      expect(IdCardUtils.isValidIdCard('1101051949 1231002X')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_0400
     * @tc.name      testIdCardSpaceEdge0002
     * @tc.desc      Verify isValidIdCard() rejects tab, newline and full width
     *               space padding around an otherwise valid card.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardSpaceEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardSpaceEdge0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A trailing tab breaks the length contract.
      expect(IdCardUtils.isValidIdCard('11010519491231002X\t')).assertFalse();
      // A trailing newline breaks the length contract too.
      expect(IdCardUtils.isValidIdCard('11010519491231002X\n')).assertFalse();
      // A full width space in the middle breaks the digit rule.
      const fullwidth: string = '110105' + '\u3000' + '19491231002X';
      expect(IdCardUtils.isValidIdCard(fullwidth)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_0500
     * @tc.name      testIdCardLowerX0001
     * @tc.desc      Verify isValidIdCard() accepts the lowercase letter x as
     *               the checksum character when the expected digit is X.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardLowerX0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardLowerX0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The classic sample with uppercase X validates.
      expect(IdCardUtils.isValidIdCard('11010519491231002X')).assertTrue();
      // The same sample with lowercase x validates as well.
      expect(IdCardUtils.isValidIdCard('11010519491231002x')).assertTrue();
      // The all-ones payload with trailing seven expects X.
      expect(IdCardUtils.isValidIdCard('11111111111111117X')).assertTrue();
      // Its lowercase variant validates too.
      expect(IdCardUtils.isValidIdCard('11111111111111117x')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_0600
     * @tc.name      testIdCardLowerX0002
     * @tc.desc      Verify isValidIdCard() rejects letters X or x when the
     *               computed checksum digit is a decimal digit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardLowerX0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardLowerX0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The payload expects digit two, so uppercase X fails.
      expect(IdCardUtils.isValidIdCard('11010119900307751X')).assertFalse();
      // The same payload with lowercase x fails too.
      expect(IdCardUtils.isValidIdCard('11010119900307751x')).assertFalse();
      // The all-ones payload expects digit two for trailing one.
      expect(IdCardUtils.isValidIdCard('11111111111111111X')).assertFalse();
      // Its lowercase variant fails as well.
      expect(IdCardUtils.isValidIdCard('11111111111111111x')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_0700
     * @tc.name      testIdCardLowerX0003
     * @tc.desc      Verify extractBirthday(), extractGenderDigit() and
     *               maskIdCard() handle a lowercase x checksum uniformly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardLowerX0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardLowerX0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The lowercase sample still exposes its birthday.
      expect(IdCardUtils.extractBirthday('11010519491231002x')).assertEqual('1949-12-31');
      // The gender digit stays even for the lowercase sample.
      expect(IdCardUtils.extractGenderDigit('11010519491231002x')).assertEqual(0);
      // The mask keeps the lowercase letter in the tail.
      expect(IdCardUtils.maskIdCard('11010519491231002x')).assertEqual('110105********002x');
      // The gender label remains female for the lowercase sample.
      expect(IdCardUtils.genderLabelOf('11010519491231002x')).assertEqual('female');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_0800
     * @tc.name      testIdCardMonthEdge0001
     * @tc.desc      Verify the helpers keep month thirteen cards valid and
     *               render the raw month without calendar validation.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardMonthEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardMonthEdge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Month thirteen passes the checksum based validation.
      expect(IdCardUtils.isValidIdCard('110101198013150010')).assertTrue();
      // The birthday renders month thirteen verbatim.
      expect(IdCardUtils.extractBirthday('110101198013150010')).assertEqual('1980-13-15');
      // The gender digit stays odd for the seventeenth digit one.
      expect(IdCardUtils.extractGenderDigit('110101198013150010')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_0900
     * @tc.name      testIdCardMonthEdge0002
     * @tc.desc      Verify the helpers keep month zero cards valid and render
     *               the raw zero month and day slices verbatim.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardMonthEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardMonthEdge0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Month zero with day ten passes checksum validation.
      expect(IdCardUtils.isValidIdCard('110101198000100014')).assertTrue();
      // The birthday renders month zero verbatim.
      expect(IdCardUtils.extractBirthday('110101198000100014')).assertEqual('1980-00-10');
      // The gender digit stays odd for the seventeenth digit one.
      expect(IdCardUtils.extractGenderDigit('110101198000100014')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_1000
     * @tc.name      testIdCardMonthEdge0003
     * @tc.desc      Verify a leap day birthday in 2000 stays valid and the
     *               region prefix of that sample passes the region check.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardMonthEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardMonthEdge0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The February twenty-ninth sample passes checksum validation.
      expect(IdCardUtils.isValidIdCard('440301200002290111')).assertTrue();
      // The birthday renders the leap day verbatim.
      expect(IdCardUtils.extractBirthday('440301200002290111')).assertEqual('2000-02-29');
      // Its region prefix passes the two digit region check.
      expect(IdCardUtils.isValidRegionCode('440301')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_1100
     * @tc.name      testIdCardCheckEdge0001
     * @tc.desc      Verify isValidIdCard() rejects every wrong checksum digit
     *               at the last position of otherwise valid bodies.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardCheckEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardCheckEdge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The classic sample expects X, so digit one fails.
      expect(IdCardUtils.isValidIdCard('110105194912310021')).assertFalse();
      // The classic sample with digit nine also fails.
      expect(IdCardUtils.isValidIdCard('110105194912310029')).assertFalse();
      // The Shanghai sample expects two, so digit three fails.
      expect(IdCardUtils.isValidIdCard('110101199003077513')).assertFalse();
      // The Hebei sample expects zero, so letter X fails.
      expect(IdCardUtils.isValidIdCard('13050319670101001X')).assertFalse();
      // The Guangdong sample expects four, so digit five fails.
      expect(IdCardUtils.isValidIdCard('440524188001010015')).assertFalse();
      // The correct Guangdong sample still validates as control.
      expect(IdCardUtils.isValidIdCard('440524188001010014')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_1200
     * @tc.name      testIdCardCheckEdge0002
     * @tc.desc      Verify that flipping one body digit shifts the expected
     *               checksum and the original last character now fails.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardCheckEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardCheckEdge0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Raising the fifth body digit moves the check to digit two.
      expect(IdCardUtils.isValidIdCard('11011519491231002X')).assertFalse();
      expect(IdCardUtils.isValidIdCard('110115194912310022')).assertTrue();
      // Raising the ninth body digit moves the check to digit eight.
      expect(IdCardUtils.isValidIdCard('11010519891231002X')).assertFalse();
      expect(IdCardUtils.isValidIdCard('110105198912310028')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_1300
     * @tc.name      testIdCardCheckEdge0003
     * @tc.desc      Verify checksumDigit() guards length sixteen, eighteen,
     *               empty input and a letter inside the payload.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardCheckEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardCheckEdge0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Sixteen digits are one digit short.
      expect(IdCardUtils.checksumDigit('1234567890123456')).assertEqual('');
      // Eighteen digits are one digit long.
      expect(IdCardUtils.checksumDigit('123456789012345678')).assertEqual('');
      // Empty input has no digits to weight.
      expect(IdCardUtils.checksumDigit('')).assertEqual('');
      // A letter in the last position breaks the digit rule.
      expect(IdCardUtils.checksumDigit('1234567890123456a')).assertEqual('');
      // The full seventeen digit body maps to check digit seven.
      expect(IdCardUtils.checksumDigit('12345678901234567')).assertEqual('7');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_1400
     * @tc.name      testIdCardRegionEdge0001
     * @tc.desc      Verify isValidRegionCode() accepts first digits one
     *               through nine and rejects a leading zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardRegionEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardRegionEdge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // First digit one is the smallest legal province head.
      expect(IdCardUtils.isValidRegionCode('100000')).assertTrue();
      // First digit nine is the largest legal province head.
      expect(IdCardUtils.isValidRegionCode('900000')).assertTrue();
      // Both digits nine stay legal.
      expect(IdCardUtils.isValidRegionCode('990000')).assertTrue();
      // A leading zero is never a legal province head.
      expect(IdCardUtils.isValidRegionCode('010101')).assertFalse();
      // All zeros fail on the first digit.
      expect(IdCardUtils.isValidRegionCode('000000')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_1500
     * @tc.name      testIdCardRegionEdge0002
     * @tc.desc      Verify isValidRegionCode() only inspects length plus the
     *               first two digits, so trailing letters pass by design.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardRegionEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardRegionEdge0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two digits are too short for a region code.
      expect(IdCardUtils.isValidRegionCode('11')).assertFalse();
      // Seven digits are one digit too long.
      expect(IdCardUtils.isValidRegionCode('1101010')).assertFalse();
      // A trailing letter after two leading digits passes by design.
      expect(IdCardUtils.isValidRegionCode('11010a')).assertTrue();
      // A letter in the second position fails the second digit rule.
      expect(IdCardUtils.isValidRegionCode('1a0101')).assertFalse();
      // Letters in the first two positions fail both rules.
      expect(IdCardUtils.isValidRegionCode('aa1010')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_1600
     * @tc.name      testIdCardRegionEdge0003
     * @tc.desc      Verify every province prefix extended by 0000 passes the
     *               region check, covering the whole prefix table.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardRegionEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardRegionEdge0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const table: string[] = IdCardUtils.regionPrefixTable();
      let okCount: number = 0;
      // Extend each two digit prefix with four zeros.
      for (let i = 0; i < table.length; i++) {
        const code: string = table[i] + '0000';
        if (IdCardUtils.isValidRegionCode(code)) {
          okCount = okCount + 1;
        }
      }
      // Every entry must pass because heads are one through nine.
      expect(okCount).assertEqual(31);
      // Spot checks confirm the first and last table entries.
      expect(IdCardUtils.isValidRegionCode('110000')).assertTrue();
      expect(IdCardUtils.isValidRegionCode('650000')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_1700
     * @tc.name      testIdCardMaskEdge0001
     * @tc.desc      Verify maskIdCard() returns inputs of length seventeen,
     *               nineteen and zero unchanged without masking.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardMaskEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardMaskEdge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Seventeen characters are returned unchanged.
      expect(IdCardUtils.maskIdCard('11010519491231002')).assertEqual('11010519491231002');
      // Nineteen characters are returned unchanged.
      expect(IdCardUtils.maskIdCard('11010519491231002X1')).assertEqual('11010519491231002X1');
      // Empty input stays empty.
      expect(IdCardUtils.maskIdCard('')).assertEqual('');
      // A single character stays a single character.
      expect(IdCardUtils.maskIdCard('x')).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_1800
     * @tc.name      testIdCardMaskEdge0002
     * @tc.desc      Verify maskIdCard() masks repeated digits and letters
     *               uniformly while keeping head and tail slices.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardMaskEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardMaskEdge0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // All zeros keep the head and tail zeros around eight stars.
      expect(IdCardUtils.maskIdCard('000000000000000000')).assertEqual('000000********0000');
      // All nines behave the same way.
      expect(IdCardUtils.maskIdCard('999999999999999999')).assertEqual('999999********9999');
      // Letters are masked without digit semantics.
      expect(IdCardUtils.maskIdCard('AAAAAAAAAAAAAAAAAA')).assertEqual('AAAAAA********AAAA');
      // Masked outputs always stay eighteen characters long.
      expect(IdCardUtils.maskIdCard('AAAAAAAAAAAAAAAAAA').length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_1900
     * @tc.name      testIdCardGenderEdge0001
     * @tc.desc      Verify extractGenderDigit() returns minus one for empty,
     *               broken checksum and short inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardGenderEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardGenderEdge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Empty input carries no gender digit.
      expect(IdCardUtils.extractGenderDigit('')).assertEqual(-1);
      // A wrong checksum digit blocks the extraction.
      expect(IdCardUtils.extractGenderDigit('110105194912310021')).assertEqual(-1);
      // A seventeen character input blocks the extraction.
      expect(IdCardUtils.extractGenderDigit('11010519491231002')).assertEqual(-1);
      // The empty label mirrors the error marker.
      expect(IdCardUtils.genderLabelOf('')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_2000
     * @tc.name      testIdCardGenderEdge0002
     * @tc.desc      Verify extractGenderDigit() at the boundary digits zero
     *               and nine maps to female and male respectively.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardGenderEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardGenderEdge0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Digit zero is the smallest even boundary and maps to female.
      expect(IdCardUtils.extractGenderDigit('440301197801110004')).assertEqual(0);
      expect(IdCardUtils.genderLabelOf('440301197801110004')).assertEqual('female');
      // Digit nine is the largest odd boundary and maps to male.
      expect(IdCardUtils.extractGenderDigit('440301197801110098')).assertEqual(1);
      expect(IdCardUtils.genderLabelOf('440301197801110098')).assertEqual('male');
      // Digit four confirms the female branch again.
      expect(IdCardUtils.extractGenderDigit('310101198001010042')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_2100
     * @tc.name      testIdCardBirthdayEdge0001
     * @tc.desc      Verify extractBirthday() returns the empty string for
     *               broken checksums, wrong lengths and tiny inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardBirthdayEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardBirthdayEdge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A wrong last digit blocks the extraction.
      expect(IdCardUtils.extractBirthday('110101198013150011')).assertEqual('');
      // A trailing space extends the length beyond eighteen.
      expect(IdCardUtils.extractBirthday('11010519491231002X ')).assertEqual('');
      // A tiny input has no birthday slice at all.
      expect(IdCardUtils.extractBirthday('123')).assertEqual('');
      // Month zero still renders once the checksum is right.
      expect(IdCardUtils.extractBirthday('110101198000100014')).assertEqual('1980-00-10');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_2200
     * @tc.name      testIdCardBirthdayEdge0002
     * @tc.desc      Verify extractBirthday() renders nineteenth and twentieth
     *               century birthdays across century boundaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardBirthdayEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardBirthdayEdge0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The 1880 sample renders the nineteenth century date.
      expect(IdCardUtils.extractBirthday('440524188001010014')).assertEqual('1880-01-01');
      // The 2000 sample renders the twentieth to twenty-first boundary.
      expect(IdCardUtils.extractBirthday('440301200002290111')).assertEqual('2000-02-29');
      // Both samples stay valid as controls.
      expect(IdCardUtils.isValidIdCard('440524188001010014')).assertTrue();
      expect(IdCardUtils.isValidIdCard('440301200002290111')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_2300
     * @tc.name      testIdCardCombEdge0001
     * @tc.desc      Verify isValidIdCard() rejects letters X inside the body
     *               even when the trailing checksum letter is correct.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardCombEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardCombEdge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // X inside the middle of the body fails.
      expect(IdCardUtils.isValidIdCard('110105X9491231002X')).assertFalse();
      // X in the very first position fails as well.
      expect(IdCardUtils.isValidIdCard('X10519491231002X11')).assertFalse();
      // X in the seventeenth position belongs to the body and fails.
      expect(IdCardUtils.isValidIdCard('1101051949123100XX')).assertFalse();
      // The lowercase checksum sample stays valid as control.
      expect(IdCardUtils.isValidIdCard('11010519491231002x')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_2400
     * @tc.name      testIdCardCombEdge0002
     * @tc.desc      Verify degenerate all-zero and all-nine numbers validate
     *               only when their checksum digit matches.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardCombEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardCombEdge0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // All zeros with checksum one validate.
      expect(IdCardUtils.isValidIdCard('000000000000000001')).assertTrue();
      // All zeros with checksum zero fail.
      expect(IdCardUtils.isValidIdCard('000000000000000000')).assertFalse();
      // All nines with checksum three validate.
      expect(IdCardUtils.isValidIdCard('999999999999999993')).assertTrue();
      // All nines with checksum nine fail.
      expect(IdCardUtils.isValidIdCard('999999999999999999')).assertFalse();
      // The zero card renders a fully zero birthday.
      expect(IdCardUtils.extractBirthday('000000000000000001')).assertEqual('0000-00-00');
      // The zero card maps its zero gender digit to female.
      expect(IdCardUtils.extractGenderDigit('000000000000000001')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_2500
     * @tc.name      testIdCardCombEdge0003
     * @tc.desc      Verify buildValidIdCard() returns the empty string when
     *               any part has a wrong length or a letter inside.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardCombEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardCombEdge0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A five digit region code is too short.
      expect(IdCardUtils.buildValidIdCard('11010', '19800101', '001')).assertEqual('');
      // A six digit birthday is too short.
      expect(IdCardUtils.buildValidIdCard('110101', '198001', '001')).assertEqual('');
      // A two digit sequence is too short.
      expect(IdCardUtils.buildValidIdCard('110101', '19800101', '01')).assertEqual('');
      // A four digit sequence is too long.
      expect(IdCardUtils.buildValidIdCard('110101', '19800101', '001a')).assertEqual('');
      // A letter inside the region breaks the digit rule.
      expect(IdCardUtils.buildValidIdCard('1101a1', '19800101', '001')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_2600
     * @tc.name      testIdCardLenEdge0003
     * @tc.desc      Verify buildValidIdCard() emits the exact expected number
     *               for the Beijing sample and length guards around it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardLenEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardLenEdge0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const built: string = IdCardUtils.buildValidIdCard('110101', '19800101', '001');
      // The composed number matches the hand computed sample.
      expect(built).assertEqual('110101198001010010');
      // The composed number validates end to end.
      expect(IdCardUtils.isValidIdCard(built)).assertTrue();
      // Dropping the checksum leaves seventeen characters.
      expect(IdCardUtils.isValidIdCard('11010119800101001')).assertFalse();
      // Appending a zero leaves nineteen characters.
      expect(IdCardUtils.isValidIdCard(built + '0')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_2700
     * @tc.name      testIdCardSpaceEdge0003
     * @tc.desc      Verify checksumDigit() rejects seventeen character
     *               payloads that embed spaces in several positions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardSpaceEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardSpaceEdge0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A space after the region block fails.
      expect(IdCardUtils.checksumDigit('110105 94912310 02')).assertEqual('');
      // A space before the sequence block fails.
      expect(IdCardUtils.checksumDigit('11010519491231 02')).assertEqual('');
      // A leading space fails.
      expect(IdCardUtils.checksumDigit(' 11010519491231002')).assertEqual('');
      // A trailing space fails.
      expect(IdCardUtils.checksumDigit('11010519491231002 ')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_2800
     * @tc.name      testIdCardCheckEdge0004
     * @tc.desc      Verify isValidIdCard() over a loop that flips the last
     *               digit of a valid card through all wrong candidates.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardCheckEdge0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardCheckEdge0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const body: string = '11010119900307751';
      // The correct checksum digit for this body is two.
      expect(IdCardUtils.checksumDigit(body)).assertEqual('2');
      let wrongCount: number = 0;
      // Every candidate except digit two must fail.
      const candidates: string[] = ['0', '1', '3', '4', '5', '6', '7', '8', '9', 'X', 'x'];
      for (let i = 0; i < candidates.length; i++) {
        if (!IdCardUtils.isValidIdCard(body + candidates[i])) {
          wrongCount = wrongCount + 1;
        }
      }
      expect(wrongCount).assertEqual(11);
      // The digit two candidate must pass.
      expect(IdCardUtils.isValidIdCard(body + '2')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_2900
     * @tc.name      testIdCardMaskEdge0003
     * @tc.desc      Verify maskIdCard() masks arbitrary eighteen character
     *               payloads without inspecting the character content.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardMaskEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardMaskEdge0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The classic sample keeps head six and tail four.
      expect(IdCardUtils.maskIdCard('11010519491231002X')).assertEqual('110105********002X');
      // Letters anywhere in the body are masked without complaint.
      expect(IdCardUtils.maskIdCard('x105194912310002X1')).assertEqual('x10519********02X1');
      // Alphabetic payloads are masked with the same slices.
      expect(IdCardUtils.maskIdCard('ABCDEFGHIJKLMNO123')).assertEqual('ABCDEF********O123');
      // An all-zero payload keeps its zero head and tail.
      expect(IdCardUtils.maskIdCard('000000000000000000')).assertEqual('000000********0000');
      // Every masked result keeps the original length.
      const masked: string = IdCardUtils.maskIdCard('ABCDEFGHIJKLMNO123');
      expect(masked.length).assertEqual(18);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_3000
     * @tc.name      testIdCardRegionEdge0004
     * @tc.desc      Verify isValidRegionCode() over the province table loop:
     *               two digit prefixes alone fail and six digit extensions
     *               pass for all thirty one entries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardRegionEdge0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardRegionEdge0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const table: string[] = IdCardUtils.regionPrefixTable();
      let okCount: number = 0;
      let shortCount: number = 0;
      // Every two digit prefix must be extended to six digits to pass.
      for (let i = 0; i < table.length; i++) {
        if (IdCardUtils.isValidRegionCode(table[i] + '0101')) {
          okCount = okCount + 1;
        }
        if (!IdCardUtils.isValidRegionCode(table[i])) {
          shortCount = shortCount + 1;
        }
      }
      expect(okCount).assertEqual(31);
      expect(shortCount).assertEqual(31);
      // The Beijing extension keeps working on its own.
      expect(IdCardUtils.isValidRegionCode('110101')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_3100
     * @tc.name      testIdCardBirthdayEdge0003
     * @tc.desc      Verify extractBirthday() handles lower case x and rejects
     *               spaced or overlong variants with the empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardBirthdayEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardBirthdayEdge0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Lower case x still validates and extracts the birthday.
      expect(IdCardUtils.extractBirthday('11010519491231002x')).assertEqual('1949-12-31');
      // A trailing space extends the length and fails.
      expect(IdCardUtils.extractBirthday('11010519491231002X ')).assertEqual('');
      // An embedded space extends the length and fails.
      expect(IdCardUtils.extractBirthday('110105 19491231002X')).assertEqual('');
      // The Guangdong century sample extracts normally.
      expect(IdCardUtils.extractBirthday('440524188001010014')).assertEqual('1880-01-01');
      // The region-shifted Beijing sample keeps the same birthday slice.
      expect(IdCardUtils.extractBirthday('110115194912310022')).assertEqual('1949-12-31');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_3200
     * @tc.name      testIdCardGenderEdge0003
     * @tc.desc      Verify extractGenderDigit() handles lower case x, letter
     *               checksum bodies and returns -1 for spaced variants.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardGenderEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardGenderEdge0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Lower case x keeps the female mapping.
      expect(IdCardUtils.extractGenderDigit('11010519491231002x')).assertEqual(0);
      // Odd digit seven maps to male even with an X checksum.
      expect(IdCardUtils.extractGenderDigit('11111111111111117X')).assertEqual(1);
      // Zero gender digit maps to female.
      expect(IdCardUtils.extractGenderDigit('111111111111111102')).assertEqual(0);
      // A leading space breaks the length and returns the error marker.
      expect(IdCardUtils.extractGenderDigit(' 11010519491231002X')).assertEqual(-1);
      // A trailing tab breaks the length and returns the error marker.
      expect(IdCardUtils.extractGenderDigit('11010519491231002X\t')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_3300
     * @tc.name      testIdCardLowerX0004
     * @tc.desc      Verify that lowering the letter X checksum keeps exactly
     *               one valid number across the ten remainder candidates.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardLowerX0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardLowerX0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const suffixes: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
      let lowerValidCount: number = 0;
      let upperValidCount: number = 0;
      // Walk the sixteen ones body with every trailing digit.
      for (let i = 0; i < suffixes.length; i++) {
        const first17: string = '1111111111111111' + suffixes[i];
        const check: string = IdCardUtils.checksumDigit(first17);
        if (IdCardUtils.isValidIdCard(first17 + check)) {
          upperValidCount = upperValidCount + 1;
        }
        if (check === 'X' && IdCardUtils.isValidIdCard((first17 + check).toLowerCase())) {
          lowerValidCount = lowerValidCount + 1;
        }
      }
      // All ten composed numbers validate with their own checksum.
      expect(upperValidCount).assertEqual(10);
      // Only the X checksum body keeps validating after lowering.
      expect(lowerValidCount).assertEqual(1);
      // The letter X body is the digit seven candidate.
      expect(IdCardUtils.checksumDigit('11111111111111117')).assertEqual('X');
      expect(IdCardUtils.isValidIdCard('11111111111111117x')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_3400
     * @tc.name      testIdCardMonthEdge0004
     * @tc.desc      Verify that out-of-range day values 32 and 00 still pass
     *               the algorithmic check and are rendered verbatim.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardMonthEdge0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardMonthEdge0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Day thirty two passes because no calendar check is applied.
      expect(IdCardUtils.isValidIdCard('110101198012320014')).assertTrue();
      expect(IdCardUtils.extractBirthday('110101198012320014')).assertEqual('1980-12-32');
      // Day zero passes the same way and renders as 00.
      expect(IdCardUtils.isValidIdCard('110101198012000010')).assertTrue();
      expect(IdCardUtils.extractBirthday('110101198012000010')).assertEqual('1980-12-00');
      // Gender extraction still works on both samples.
      expect(IdCardUtils.extractGenderDigit('110101198012320014')).assertEqual(1);
      expect(IdCardUtils.extractGenderDigit('110101198012000010')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_3500
     * @tc.name      testIdCardCheckEdge0005
     * @tc.desc      Verify checksumDigit() across the full ten candidate
     *               table of the sixteen ones body, covering every mapping.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardCheckEdge0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardCheckEdge0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Remainder ten maps to digit two.
      expect(IdCardUtils.checksumDigit('11111111111111110')).assertEqual('2');
      // Remainder one maps to digit zero.
      expect(IdCardUtils.checksumDigit('11111111111111111')).assertEqual('0');
      // Remainder three maps to digit nine.
      expect(IdCardUtils.checksumDigit('11111111111111112')).assertEqual('9');
      // Remainder five maps to digit seven.
      expect(IdCardUtils.checksumDigit('11111111111111113')).assertEqual('7');
      // Remainder seven maps to digit five.
      expect(IdCardUtils.checksumDigit('11111111111111114')).assertEqual('5');
      // Remainder nine maps to digit three.
      expect(IdCardUtils.checksumDigit('11111111111111115')).assertEqual('3');
      // Remainder zero maps to digit one.
      expect(IdCardUtils.checksumDigit('11111111111111116')).assertEqual('1');
      // Remainder eight maps to digit eight.
      expect(IdCardUtils.checksumDigit('11111111111111118')).assertEqual('8');
      // Remainder six maps to digit six.
      expect(IdCardUtils.checksumDigit('11111111111111119')).assertEqual('6');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_LOGIC_IDXE_3600
     * @tc.name      testIdCardPositive0001
     * @tc.desc      Verify a consolidated matrix of valid numbers including
     *               the X checksum, lower case x and century birthdays.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIdCardPositive0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testIdCardPositive0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The classic letter X sample validates.
      expect(IdCardUtils.isValidIdCard('11010519491231002X')).assertTrue();
      // Its lower case twin validates as well.
      expect(IdCardUtils.isValidIdCard('11010519491231002x')).assertTrue();
      // The remainder ten Shanghai sample validates.
      expect(IdCardUtils.isValidIdCard('110101199003077512')).assertTrue();
      // The century Guangdong sample validates.
      expect(IdCardUtils.isValidIdCard('440524188001010014')).assertTrue();
      // The leap year sample validates.
      expect(IdCardUtils.isValidIdCard('440301200002290111')).assertTrue();
      // The region shifted sample validates.
      expect(IdCardUtils.isValidIdCard('110115194912310022')).assertTrue();
      // The digit shifted sample validates.
      expect(IdCardUtils.isValidIdCard('110105198912310028')).assertTrue();
      // The all zero body with checksum one validates.
      expect(IdCardUtils.isValidIdCard('000000000000000001')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
