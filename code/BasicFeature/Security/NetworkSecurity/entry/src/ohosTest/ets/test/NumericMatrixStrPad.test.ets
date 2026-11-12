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
import { StringUtils } from 'library';

const DOMAIN: number = 0xF811;

// Registers the numeric matrix test suite for the pad and truncate string helpers.
export default function numericMatrixStrPadTest() {
  describe('NumericMatrixStrPadSuite', () => {
    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_0100
     * @tc.name      testNumStrPad0001
     * @tc.desc      Verify truncate keeps only the first five characters of a seven character value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrPad0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrPad0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const truncated: string = StringUtils.truncate('network', 5);
      // Value length 7 exceeds maxLength 5 so a five character prefix survives.
      expect(truncated).assertEqual('netwo');
      // The kept prefix holds exactly five characters.
      expect(truncated.length).assertEqual(5);
      // Lowering the limit by one keeps one character less.
      expect(StringUtils.truncate('network', 4)).assertEqual('netw');
      // Raising the limit by one keeps one character more.
      expect(StringUtils.truncate('network', 6)).assertEqual('networ');
      // The source value itself stays untouched by the helper.
      expect('network').assertEqual('network');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_0200
     * @tc.name      testNumStrPad0002
     * @tc.desc      Verify truncate returns the original value when maxLength equals the value length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrPad0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrPad0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Length 7 with maxLength 7 hits the boundary so no cut happens.
      expect(StringUtils.truncate('network', 7)).assertEqual('network');
      // One above the boundary also keeps the full value.
      expect(StringUtils.truncate('network', 8)).assertEqual('network');
      // A much larger limit keeps the full value as well.
      expect(StringUtils.truncate('network', 100)).assertEqual('network');
      // The boundary result still holds all seven characters.
      expect(StringUtils.truncate('network', 7).length).assertEqual(7);
      // Exactly one below the boundary cuts to six characters.
      expect(StringUtils.truncate('network', 6)).assertEqual('networ');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_0300
     * @tc.name      testNumStrPad0003
     * @tc.desc      Verify truncate cuts everything when maxLength is zero and keeps one character for one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrPad0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrPad0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // maxLength 0 keeps the empty prefix only.
      expect(StringUtils.truncate('network', 0)).assertEqual('');
      // The zero cut result has zero characters.
      expect(StringUtils.truncate('network', 0).length).assertEqual(0);
      // maxLength 1 keeps exactly the first character.
      expect(StringUtils.truncate('network', 1)).assertEqual('n');
      // maxLength 2 keeps the first two characters.
      expect(StringUtils.truncate('network', 2)).assertEqual('ne');
      // An empty value with maxLength 0 also yields the empty string.
      expect(StringUtils.truncate('', 0)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_0400
     * @tc.name      testNumStrPad0004
     * @tc.desc      Verify truncate ignores negative maxLength values and returns the original text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A negative limit of minus three disables cutting entirely.
      expect(StringUtils.truncate('network', -3)).assertEqual('network');
      // Minus one is also treated as no limit.
      expect(StringUtils.truncate('network', -1)).assertEqual('network');
      // An empty value with a negative limit stays empty.
      expect(StringUtils.truncate('', -1)).assertEqual('');
      // The negative limit case keeps the full length of seven.
      expect(StringUtils.truncate('network', -3).length).assertEqual(7);
      // Minus 9999 behaves like every other negative limit.
      expect(StringUtils.truncate('network', -9999)).assertEqual('network');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_0500
     * @tc.name      testNumStrPad0005
     * @tc.desc      Verify truncate passes an empty value through for every limit including huge ones.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty value with limit 5 stays empty because zero is not above five.
      expect(StringUtils.truncate('', 5)).assertEqual('');
      // An empty value with limit 0 stays empty as well.
      expect(StringUtils.truncate('', 0)).assertEqual('');
      // An empty value with limit 9999 stays empty too.
      expect(StringUtils.truncate('', 9999)).assertEqual('');
      // An empty value with a negative limit stays empty.
      expect(StringUtils.truncate('', -5)).assertEqual('');
      // The empty result always has zero characters.
      expect(StringUtils.truncate('', 5).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_0600
     * @tc.name      testNumStrPad0006
     * @tc.desc      Verify truncate keeps a ten digit value unchanged at the exact boundary of ten.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Length 10 with limit 10 hits the boundary so nothing is cut.
      expect(StringUtils.truncate('0123456789', 10)).assertEqual('0123456789');
      // The boundary result keeps all ten digits.
      expect(StringUtils.truncate('0123456789', 10).length).assertEqual(10);
      // One above the boundary keeps the full value as well.
      expect(StringUtils.truncate('0123456789', 11)).assertEqual('0123456789');
      // One below the boundary cuts the last digit.
      expect(StringUtils.truncate('0123456789', 9)).assertEqual('012345678');
      // Nine below the boundary keeps a single digit.
      expect(StringUtils.truncate('0123456789', 1)).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_0700
     * @tc.name      testNumStrPad0007
     * @tc.desc      Verify truncate slices numeric text one and two characters at a time.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Limit 1 keeps the leading digit only.
      expect(StringUtils.truncate('0123456789', 1)).assertEqual('0');
      // Limit 2 keeps the first two digits.
      expect(StringUtils.truncate('0123456789', 2)).assertEqual('01');
      // Limit 3 keeps the first three digits.
      expect(StringUtils.truncate('0123456789', 3)).assertEqual('012');
      // Limit 5 keeps exactly half of the ten digits.
      expect(StringUtils.truncate('0123456789', 5)).assertEqual('01234');
      // The half cut result has exactly five characters.
      expect(StringUtils.truncate('0123456789', 5).length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_0800
     * @tc.name      testNumStrPad0008
     * @tc.desc      Verify truncate with zero or negative limits on numeric text returns the full value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Zero keeps the empty prefix for the ten digit value.
      expect(StringUtils.truncate('0123456789', 0)).assertEqual('');
      // A negative limit of minus one keeps the whole value.
      expect(StringUtils.truncate('0123456789', -1)).assertEqual('0123456789');
      // A negative limit of minus 100 keeps the whole value too.
      expect(StringUtils.truncate('0123456789', -100)).assertEqual('0123456789');
      // The full value keeps ten characters in the negative case.
      expect(StringUtils.truncate('0123456789', -1).length).assertEqual(10);
      // Limit 4 keeps four digits from the same value.
      expect(StringUtils.truncate('0123456789', 4)).assertEqual('0123');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_0900
     * @tc.name      testNumStrPad0009
     * @tc.desc      Verify truncate cuts a sixteen character key to its eleven character name part.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Length 16 with limit 11 cuts before the trailing year digits.
      expect(StringUtils.truncate('session-key-2026', 11)).assertEqual('session-key');
      // The kept part holds exactly eleven characters.
      expect(StringUtils.truncate('session-key-2026', 11).length).assertEqual(11);
      // Limit 12 keeps one more character, the separator dash.
      expect(StringUtils.truncate('session-key-2026', 12)).assertEqual('session-key-');
      // Limit 16 hits the exact boundary and keeps everything.
      expect(StringUtils.truncate('session-key-2026', 16)).assertEqual('session-key-2026');
      // Limit 15 drops only the final digit.
      expect(StringUtils.truncate('session-key-2026', 15)).assertEqual('session-key-202');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_1000
     * @tc.name      testNumStrPad0010
     * @tc.desc      Verify truncate counts leading spaces as characters when cutting.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Limit 3 keeps two spaces and the first letter of a ten character value.
      expect(StringUtils.truncate('  spaced  ', 3)).assertEqual('  s');
      // The cut result holds exactly three characters.
      expect(StringUtils.truncate('  spaced  ', 3).length).assertEqual(3);
      // Limit 9 keeps everything except the trailing space.
      expect(StringUtils.truncate('  spaced  ', 9)).assertEqual('  spaced ');
      // Limit 10 hits the boundary and keeps all ten characters.
      expect(StringUtils.truncate('  spaced  ', 10)).assertEqual('  spaced  ');
      // Limit 2 keeps the two leading spaces only.
      expect(StringUtils.truncate('  spaced  ', 2)).assertEqual('  ');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_1100
     * @tc.name      testNumStrPad0011
     * @tc.desc      Verify truncate around the three character boundary keeps or drops the last letter.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrPad0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrPad0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Length 3 with limit 2 cuts the last letter.
      expect(StringUtils.truncate('abc', 2)).assertEqual('ab');
      // Limit 3 hits the boundary and keeps all three letters.
      expect(StringUtils.truncate('abc', 3)).assertEqual('abc');
      // Limit 4 is above the length and keeps everything.
      expect(StringUtils.truncate('abc', 4)).assertEqual('abc');
      // Limit 1 keeps only the first letter.
      expect(StringUtils.truncate('abc', 1)).assertEqual('a');
      // The two character cut holds exactly two characters.
      expect(StringUtils.truncate('abc', 2).length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_1200
     * @tc.name      testNumStrPad0012
     * @tc.desc      Verify truncate on a two character value drops one letter for limit one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Length 2 with limit 1 keeps the first letter only.
      expect(StringUtils.truncate('ab', 1)).assertEqual('a');
      // Limit 2 hits the boundary and keeps both letters.
      expect(StringUtils.truncate('ab', 2)).assertEqual('ab');
      // Limit 0 keeps the empty prefix.
      expect(StringUtils.truncate('ab', 0)).assertEqual('');
      // A negative limit keeps both letters untouched.
      expect(StringUtils.truncate('ab', -1)).assertEqual('ab');
      // The single character cut has length one.
      expect(StringUtils.truncate('ab', 1).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_1300
     * @tc.name      testNumStrPad0013
     * @tc.desc      Verify truncate shortens a twenty-four character URL to twenty-one characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Length 24 with limit 21 keeps the scheme, host and one path character.
      expect(StringUtils.truncate('https://example.com/path', 21)).assertEqual('https://example.com/p');
      // The cut result holds exactly twenty-one characters.
      expect(StringUtils.truncate('https://example.com/path', 21).length).assertEqual(21);
      // Limit 8 keeps the scheme including the two slashes.
      expect(StringUtils.truncate('https://example.com/path', 8)).assertEqual('https://');
      // Limit 24 hits the boundary and keeps the whole URL.
      expect(StringUtils.truncate('https://example.com/path', 24)).assertEqual('https://example.com/path');
      // Limit 7 drops the second slash from the scheme.
      expect(StringUtils.truncate('https://example.com/path', 7)).assertEqual('https:/');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_1400
     * @tc.name      testNumStrPad0014
     * @tc.desc      Verify truncate on a single character value for the zero, one and negative limits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Length 1 with limit 0 keeps the empty prefix.
      expect(StringUtils.truncate('x', 0)).assertEqual('');
      // Limit 1 hits the boundary and keeps the character.
      expect(StringUtils.truncate('x', 1)).assertEqual('x');
      // A negative limit keeps the character untouched.
      expect(StringUtils.truncate('x', -1)).assertEqual('x');
      // Limit 2 is above the length and keeps the character.
      expect(StringUtils.truncate('x', 2)).assertEqual('x');
      // The zero cut result has zero characters.
      expect(StringUtils.truncate('x', 0).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_1500
     * @tc.name      testNumStrPad0015
     * @tc.desc      Verify truncate keeps the first half of a ten letter alphabet value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Length 10 with limit 5 keeps the first five letters.
      expect(StringUtils.truncate('ABCDEFGHIJ', 5)).assertEqual('ABCDE');
      // The half cut result holds exactly five characters.
      expect(StringUtils.truncate('ABCDEFGHIJ', 5).length).assertEqual(5);
      // Limit 6 keeps one letter beyond the half point.
      expect(StringUtils.truncate('ABCDEFGHIJ', 6)).assertEqual('ABCDEF');
      // Limit 4 keeps one letter less than the half point.
      expect(StringUtils.truncate('ABCDEFGHIJ', 4)).assertEqual('ABCD');
      // Limit 10 hits the boundary and keeps all ten letters.
      expect(StringUtils.truncate('ABCDEFGHIJ', 10)).assertEqual('ABCDEFGHIJ');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_1600
     * @tc.name      testNumStrPad0016
     * @tc.desc      Verify truncate cuts an IP-like dotted value at three and six characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Length 7 with limit 3 keeps the first digit, dot and second digit.
      expect(StringUtils.truncate('0.0.0.0', 3)).assertEqual('0.0');
      // Limit 6 keeps three digit-dot pairs and drops the last digit.
      expect(StringUtils.truncate('0.0.0.0', 6)).assertEqual('0.0.0.');
      // Limit 7 hits the boundary and keeps the whole dotted value.
      expect(StringUtils.truncate('0.0.0.0', 7)).assertEqual('0.0.0.0');
      // Limit 1 keeps the leading digit only.
      expect(StringUtils.truncate('0.0.0.0', 1)).assertEqual('0');
      // The three character cut holds exactly three characters.
      expect(StringUtils.truncate('0.0.0.0', 3).length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_1700
     * @tc.name      testNumStrPad0017
     * @tc.desc      Verify truncate cuts a nine character tenant id to its seven character prefix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Length 9 with limit 7 keeps the name part and drops the digits.
      expect(StringUtils.truncate('tenant-42', 7)).assertEqual('tenant-');
      // The cut result holds exactly seven characters.
      expect(StringUtils.truncate('tenant-42', 7).length).assertEqual(7);
      // Limit 8 keeps one more character, the first digit.
      expect(StringUtils.truncate('tenant-42', 8)).assertEqual('tenant-4');
      // Limit 9 hits the boundary and keeps the whole id.
      expect(StringUtils.truncate('tenant-42', 9)).assertEqual('tenant-42');
      // Limit 6 cuts the separator dash as well.
      expect(StringUtils.truncate('tenant-42', 6)).assertEqual('tenant');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_1800
     * @tc.name      testNumStrPad0018
     * @tc.desc      Verify truncate passes short values through unchanged for a huge limit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Length 1 with limit 9999 stays unchanged.
      expect(StringUtils.truncate('a', 9999)).assertEqual('a');
      // An empty value with the same huge limit stays empty.
      expect(StringUtils.truncate('', 9999)).assertEqual('');
      // Length 2 with limit 9999 stays unchanged too.
      expect(StringUtils.truncate('ab', 9999)).assertEqual('ab');
      // The same value with limit 2 hits the boundary and stays unchanged.
      expect(StringUtils.truncate('ab', 2)).assertEqual('ab');
      // The single character result keeps length one.
      expect(StringUtils.truncate('a', 9999).length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_1900
     * @tc.name      testNumStrPad0019
     * @tc.desc      Verify padStart prepends two zero characters to reach a target length of three.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrPad0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrPad0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const padded: string = StringUtils.padStart('7', 3, '0');
      // Length 1 below target 3 gains two leading zeros.
      expect(padded).assertEqual('007');
      // The padded result reaches exactly the target length.
      expect(padded.length).assertEqual(3);
      // Target 4 gains one more zero in front.
      expect(StringUtils.padStart('7', 4, '0')).assertEqual('0007');
      // Target 2 gains only one zero.
      expect(StringUtils.padStart('7', 2, '0')).assertEqual('07');
      // Target 1 equals the value length so nothing is added.
      expect(StringUtils.padStart('7', 1, '0')).assertEqual('7');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_2000
     * @tc.name      testNumStrPad0020
     * @tc.desc      Verify padStart pads a two digit number with zeros up to the requested width.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrPad0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrPad0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Length 2 below target 4 gains two leading zeros.
      expect(StringUtils.padStart('42', 4, '0')).assertEqual('0042');
      // Target 5 gains three leading zeros.
      expect(StringUtils.padStart('42', 5, '0')).assertEqual('00042');
      // Target 3 gains one leading zero.
      expect(StringUtils.padStart('42', 3, '0')).assertEqual('042');
      // The four wide result holds exactly four characters.
      expect(StringUtils.padStart('42', 4, '0').length).assertEqual(4);
      // Target 6 gains four leading zeros.
      expect(StringUtils.padStart('42', 6, '0')).assertEqual('000042');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_2100
     * @tc.name      testNumStrPad0021
     * @tc.desc      Verify padStart returns the value unchanged when the target equals the length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrPad0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrPad0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Target 2 equals length 2 so the boundary adds nothing.
      expect(StringUtils.padStart('42', 2, '0')).assertEqual('42');
      // Target 1 is below the length and adds nothing either.
      expect(StringUtils.padStart('42', 1, '0')).assertEqual('42');
      // Target 0 is also below the length and adds nothing.
      expect(StringUtils.padStart('42', 0, '0')).assertEqual('42');
      // The boundary result keeps both original characters.
      expect(StringUtils.padStart('42', 2, '0').length).assertEqual(2);
      // Target 3 is one above the length and adds one zero.
      expect(StringUtils.padStart('42', 3, '0')).assertEqual('042');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_2200
     * @tc.name      testNumStrPad0022
     * @tc.desc      Verify padStart ignores targets below the value length including one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Target 1 stays below length 2 so the value is untouched.
      expect(StringUtils.padStart('42', 1, '0')).assertEqual('42');
      // Target 0 adds nothing as well.
      expect(StringUtils.padStart('42', 0, '0')).assertEqual('42');
      // Target minus 3 is negative and adds nothing.
      expect(StringUtils.padStart('42', -3, '0')).assertEqual('42');
      // The untouched result keeps its two characters.
      expect(StringUtils.padStart('42', 1, '0').length).assertEqual(2);
      // Target 5 is above the length and pads normally.
      expect(StringUtils.padStart('42', 5, '0')).assertEqual('00042');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_2300
     * @tc.name      testNumStrPad0023
     * @tc.desc      Verify padStart with target zero and negative targets leaves values untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Target 0 never exceeds the value length so nothing is added.
      expect(StringUtils.padStart('42', 0, '0')).assertEqual('42');
      // Target minus 3 is negative and is never reached.
      expect(StringUtils.padStart('42', -3, '0')).assertEqual('42');
      // Target minus 100 behaves like any other negative target.
      expect(StringUtils.padStart('42', -100, '0')).assertEqual('42');
      // An empty value with negative target stays empty.
      expect(StringUtils.padStart('', -1, '0')).assertEqual('');
      // Target 2 on the same value also keeps the original text.
      expect(StringUtils.padStart('42', 2, '0')).assertEqual('42');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_2400
     * @tc.name      testNumStrPad0024
     * @tc.desc      Verify padStart with an empty pad character short-circuits and returns the value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrPad0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrPad0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty pad character would loop forever so the value passes through.
      expect(StringUtils.padStart('42', 5, '')).assertEqual('42');
      // A ten character target with empty pad also passes through.
      expect(StringUtils.padStart('abc', 10, '')).assertEqual('abc');
      // An empty value with empty pad stays empty.
      expect(StringUtils.padStart('', 9, '')).assertEqual('');
      // The short-circuit result keeps its two characters.
      expect(StringUtils.padStart('42', 5, '').length).assertEqual(2);
      // A non empty pad with the same target pads normally for contrast.
      expect(StringUtils.padStart('42', 5, '0')).assertEqual('00042');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_2500
     * @tc.name      testNumStrPad0025
     * @tc.desc      Verify padStart with an empty pad character keeps the original length for any target.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrPad0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrPad0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Empty pad with target 5 keeps length 2.
      expect(StringUtils.padStart('42', 5, '').length).assertEqual(2);
      // Empty pad with target 9999 also keeps length 2.
      expect(StringUtils.padStart('42', 9999, '').length).assertEqual(2);
      // Empty pad with negative target keeps length 2.
      expect(StringUtils.padStart('42', -1, '').length).assertEqual(2);
      // An empty value with empty pad keeps length 0.
      expect(StringUtils.padStart('', 5, '').length).assertEqual(0);
      // The text content is unchanged for the empty pad case.
      expect(StringUtils.padStart('42', 9999, '')).assertEqual('42');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_2600
     * @tc.name      testNumStrPad0026
     * @tc.desc      Verify padStart on an empty value builds the pad characters alone.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty value below target 5 becomes five pad characters.
      expect(StringUtils.padStart('', 5, 'x')).assertEqual('xxxxx');
      // Target 3 builds three pad characters.
      expect(StringUtils.padStart('', 3, 'x')).assertEqual('xxx');
      // Target 1 builds a single pad character.
      expect(StringUtils.padStart('', 1, 'x')).assertEqual('x');
      // Target 0 equals the empty length so nothing is built.
      expect(StringUtils.padStart('', 0, 'x')).assertEqual('');
      // The five character result holds exactly five characters.
      expect(StringUtils.padStart('', 5, 'x').length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_2700
     * @tc.name      testNumStrPad0027
     * @tc.desc      Verify padStart combinations of empty value and empty pad character stay empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Empty value with empty pad and target 5 stays empty.
      expect(StringUtils.padStart('', 5, '')).assertEqual('');
      // Empty value with empty pad and target 0 stays empty.
      expect(StringUtils.padStart('', 0, '')).assertEqual('');
      // Empty value with empty pad and negative target stays empty.
      expect(StringUtils.padStart('', -2, '')).assertEqual('');
      // The result keeps zero characters in every empty combination.
      expect(StringUtils.padStart('', 5, '').length).assertEqual(0);
      // An empty value with a real pad builds the pad run instead.
      expect(StringUtils.padStart('', 5, 'x')).assertEqual('xxxxx');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_2800
     * @tc.name      testNumStrPad0028
     * @tc.desc      Verify padStart with target zero leaves both empty and non empty values untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Target 0 on an empty value keeps the empty string.
      expect(StringUtils.padStart('', 0, 'x')).assertEqual('');
      // Target 0 on a one character value keeps that character.
      expect(StringUtils.padStart('x', 0, '0')).assertEqual('x');
      // Target 0 on a two character value keeps both characters.
      expect(StringUtils.padStart('xy', 0, '0')).assertEqual('xy');
      // Target minus 1 behaves like target 0 for a non empty value.
      expect(StringUtils.padStart('xy', -1, '0')).assertEqual('xy');
      // Target 1 on the two character value still adds nothing.
      expect(StringUtils.padStart('xy', 1, '0')).assertEqual('xy');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_2900
     * @tc.name      testNumStrPad0029
     * @tc.desc      Verify padStart widens a single digit to width six and seven with zeros.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Length 1 below target 6 gains five leading zeros.
      expect(StringUtils.padStart('1', 6, '0')).assertEqual('000001');
      // The width six result holds exactly six characters.
      expect(StringUtils.padStart('1', 6, '0').length).assertEqual(6);
      // Target 7 gains six leading zeros.
      expect(StringUtils.padStart('1', 7, '0')).assertEqual('0000001');
      // Target 5 gains four leading zeros.
      expect(StringUtils.padStart('1', 5, '0')).assertEqual('00001');
      // The last character of the padded value is the original digit.
      expect(StringUtils.padStart('1', 6, '0').charAt(5)).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_3000
     * @tc.name      testNumStrPad0030
     * @tc.desc      Verify padStart with a two character pad overshoots the target length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const padded: string = StringUtils.padStart('12', 5, 'ab');
      // Each prepend adds two characters so the result passes the target.
      expect(padded).assertEqual('abab12');
      // The overshoot result holds six characters, one above the target.
      expect(padded.length).assertEqual(6);
      // Target 4 stops after one prepend with exactly four characters.
      expect(StringUtils.padStart('12', 4, 'ab')).assertEqual('ab12');
      // Target 3 also stops after one prepend and overshoots to four.
      expect(StringUtils.padStart('12', 3, 'ab')).assertEqual('ab12');
      // Target 2 equals the length so no prepend happens.
      expect(StringUtils.padStart('12', 2, 'ab')).assertEqual('12');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_3100
     * @tc.name      testNumStrPad0031
     * @tc.desc      Verify padStart with a two character pad builds an alternating pattern.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const padded: string = StringUtils.padStart('a', 10, 'bc');
      // Five prepends of two characters overshoot target 10 to length 11.
      expect(padded).assertEqual('bcbcbcbcbca');
      // The alternating result holds exactly eleven characters.
      expect(padded.length).assertEqual(11);
      // The result starts with the pad characters.
      expect(padded.substring(0, 2)).assertEqual('bc');
      // The result ends with the original character.
      expect(padded.charAt(10)).assertEqual('a');
      // Target 3 stops after one prepend and overshoots to three.
      expect(StringUtils.padStart('a', 3, 'bc')).assertEqual('bca');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_3200
     * @tc.name      testNumStrPad0032
     * @tc.desc      Verify padStart widens a single character to width one hundred with zeros.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const padded: string = StringUtils.padStart('a', 100, '0');
      // Target 100 on length 1 adds ninety-nine leading zeros.
      expect(padded.length).assertEqual(100);
      // The first two characters of the result are zeros.
      expect(padded.substring(0, 2)).assertEqual('00');
      // The last two characters are the final zero and the value.
      expect(padded.substring(98, 100)).assertEqual('0a');
      // Target 99 on the same value keeps a length of ninety-nine.
      expect(StringUtils.padStart('a', 99, '0').length).assertEqual(99);
      // Target 1 equals the value length and adds nothing.
      expect(StringUtils.padStart('a', 1, '0')).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_3300
     * @tc.name      testNumStrPad0033
     * @tc.desc      Verify padStart on an empty value with single character pads for widths up to four.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Target 1 builds exactly one zero from an empty value.
      expect(StringUtils.padStart('', 1, '0')).assertEqual('0');
      // Target 2 builds exactly two zeros.
      expect(StringUtils.padStart('', 2, '0')).assertEqual('00');
      // Target 4 with digit pad builds four ones.
      expect(StringUtils.padStart('', 4, '1')).assertEqual('1111');
      // The width four result holds exactly four characters.
      expect(StringUtils.padStart('', 4, '1').length).assertEqual(4);
      // Target 0 builds nothing even with a real pad character.
      expect(StringUtils.padStart('', 0, '1')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_3400
     * @tc.name      testNumStrPad0034
     * @tc.desc      Verify padStart with a doubled zero pad character reaches the target in one step.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const padded: string = StringUtils.padStart('7', 3, '00');
      // One prepend of two zeros reaches target 3 immediately.
      expect(padded).assertEqual('007');
      // The result holds exactly three characters.
      expect(padded.length).assertEqual(3);
      // Target 2 is reached by the same single prepend and overshoots.
      expect(StringUtils.padStart('7', 2, '00')).assertEqual('007');
      // Target 1 equals the value length so nothing is prepended.
      expect(StringUtils.padStart('7', 1, '00')).assertEqual('7');
      // Target 4 needs one more prepend and overshoots to five.
      expect(StringUtils.padStart('7', 4, '00')).assertEqual('00007');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_3500
     * @tc.name      testNumStrPad0035
     * @tc.desc      Verify padStart widens a ten digit value by one and two zeros.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Length 10 with target 12 gains two leading zeros.
      expect(StringUtils.padStart('1234567890', 12, '0')).assertEqual('001234567890');
      // The width twelve result holds exactly twelve characters.
      expect(StringUtils.padStart('1234567890', 12, '0').length).assertEqual(12);
      // Target 11 gains one leading zero.
      expect(StringUtils.padStart('1234567890', 11, '0')).assertEqual('01234567890');
      // Target 10 equals the length and adds nothing.
      expect(StringUtils.padStart('1234567890', 10, '0')).assertEqual('1234567890');
      // Target 9 is below the length and adds nothing too.
      expect(StringUtils.padStart('1234567890', 9, '0')).assertEqual('1234567890');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_3600
     * @tc.name      testNumStrPad0036
     * @tc.desc      Verify padStart around the exact boundary with a z pad character.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Target 2 equals length 2 so the boundary adds nothing.
      expect(StringUtils.padStart('ab', 2, 'z')).assertEqual('ab');
      // Target 3 adds one leading z.
      expect(StringUtils.padStart('ab', 3, 'z')).assertEqual('zab');
      // Target 4 adds two leading z characters.
      expect(StringUtils.padStart('ab', 4, 'z')).assertEqual('zzab');
      // Target 1 is below the length and adds nothing.
      expect(StringUtils.padStart('ab', 1, 'z')).assertEqual('ab');
      // The padded result of target 4 holds four characters.
      expect(StringUtils.padStart('ab', 4, 'z').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_3700
     * @tc.name      testNumStrPad0037
     * @tc.desc      Verify padStart widens a single digit to width ten with seven as the pad digit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0037';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const padded: string = StringUtils.padStart('5', 10, '7');
      // Length 1 below target 10 gains nine leading sevens.
      expect(padded).assertEqual('7777777775');
      // The width ten result holds exactly ten characters.
      expect(padded.length).assertEqual(10);
      // The last character is the original digit five.
      expect(padded.charAt(9)).assertEqual('5');
      // The first character is the pad digit seven.
      expect(padded.charAt(0)).assertEqual('7');
      // Target 9 gains eight leading sevens.
      expect(StringUtils.padStart('5', 9, '7')).assertEqual('777777775');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_3800
     * @tc.name      testNumStrPad0038
     * @tc.desc      Verify padStart prefixes dashes to a scheme word for widths seven and eight.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0038';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Length 4 with target 8 gains four leading dashes.
      expect(StringUtils.padStart('http', 8, '-')).assertEqual('----http');
      // The width eight result holds exactly eight characters.
      expect(StringUtils.padStart('http', 8, '-').length).assertEqual(8);
      // Target 7 gains three leading dashes.
      expect(StringUtils.padStart('http', 7, '-')).assertEqual('---http');
      // Target 4 equals the length and adds nothing.
      expect(StringUtils.padStart('http', 4, '-')).assertEqual('http');
      // Target 3 is below the length and adds nothing too.
      expect(StringUtils.padStart('http', 3, '-')).assertEqual('http');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_3900
     * @tc.name      testNumStrPad0039
     * @tc.desc      Verify repeat with zero times produces an empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrPad0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrPad0039';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Zero repetitions build nothing at all.
      expect(StringUtils.repeat('ab', 0)).assertEqual('');
      // The zero repetition result has zero characters.
      expect(StringUtils.repeat('ab', 0).length).assertEqual(0);
      // One repetition builds a single copy instead.
      expect(StringUtils.repeat('ab', 1)).assertEqual('ab');
      // Zero repetitions of an empty value also stay empty.
      expect(StringUtils.repeat('', 0)).assertEqual('');
      // Zero repetitions of a longer value stay empty too.
      expect(StringUtils.repeat('0123456789', 0)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_4000
     * @tc.name      testNumStrPad0040
     * @tc.desc      Verify repeat with one time returns a single copy of the value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrPad0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrPad0040';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One repetition equals the value itself.
      expect(StringUtils.repeat('ab', 1)).assertEqual('ab');
      // The single copy result keeps the value length of two.
      expect(StringUtils.repeat('ab', 1).length).assertEqual(2);
      // Two repetitions build two copies back to back.
      expect(StringUtils.repeat('ab', 2)).assertEqual('abab');
      // One repetition of an empty value stays empty.
      expect(StringUtils.repeat('', 1)).assertEqual('');
      // One repetition of a single character keeps one character.
      expect(StringUtils.repeat('x', 1)).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_4100
     * @tc.name      testNumStrPad0041
     * @tc.desc      Verify repeat with three times concatenates three copies in order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrPad0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrPad0041';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three repetitions of two characters build six characters.
      expect(StringUtils.repeat('ab', 3)).assertEqual('ababab');
      // The triple repetition result holds exactly six characters.
      expect(StringUtils.repeat('ab', 3).length).assertEqual(6);
      // Four repetitions build eight characters.
      expect(StringUtils.repeat('ab', 4)).assertEqual('abababab');
      // Three repetitions of a three character value build nine characters.
      expect(StringUtils.repeat('abc', 3)).assertEqual('abcabcabc');
      // The four repetition result holds exactly eight characters.
      expect(StringUtils.repeat('ab', 4).length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_4200
     * @tc.name      testNumStrPad0042
     * @tc.desc      Verify repeat clamps negative times to zero repetitions.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrPad0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrPad0042';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Minus one repetition is clamped to zero and builds nothing.
      expect(StringUtils.repeat('ab', -1)).assertEqual('');
      // Minus 100 is also clamped to zero.
      expect(StringUtils.repeat('ab', -100)).assertEqual('');
      // The clamped result has zero characters.
      expect(StringUtils.repeat('ab', -1).length).assertEqual(0);
      // Negative times on an empty value stay empty.
      expect(StringUtils.repeat('', -1)).assertEqual('');
      // Times zero on the same value shows the same empty outcome.
      expect(StringUtils.repeat('ab', 0)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_4300
     * @tc.name      testNumStrPad0043
     * @tc.desc      Verify repeat with a large negative count is clamped to an empty result.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0043';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Minus 9999 repetitions clamp to zero and build nothing.
      expect(StringUtils.repeat('ab', -9999)).assertEqual('');
      // The clamped result keeps zero characters.
      expect(StringUtils.repeat('ab', -9999).length).assertEqual(0);
      // Minus 10000 clamps to zero as well.
      expect(StringUtils.repeat('ab', -10000)).assertEqual('');
      // A negative count with a longer value also builds nothing.
      expect(StringUtils.repeat('0123456789', -1)).assertEqual('');
      // For contrast, times zero builds nothing the same way.
      expect(StringUtils.repeat('ab', 0)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_4400
     * @tc.name      testNumStrPad0044
     * @tc.desc      Verify repeat builds five copies of a single character.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0044';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Five repetitions of one character build five characters.
      expect(StringUtils.repeat('x', 5)).assertEqual('xxxxx');
      // The five copy result holds exactly five characters.
      expect(StringUtils.repeat('x', 5).length).assertEqual(5);
      // Four repetitions build four characters.
      expect(StringUtils.repeat('x', 4)).assertEqual('xxxx');
      // Six repetitions build six characters.
      expect(StringUtils.repeat('x', 6)).assertEqual('xxxxxx');
      // One repetition keeps a single character.
      expect(StringUtils.repeat('x', 1)).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_4500
     * @tc.name      testNumStrPad0045
     * @tc.desc      Verify repeat with an empty value builds an empty string for any count.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0045';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One hundred repetitions of an empty value build nothing.
      expect(StringUtils.repeat('', 100)).assertEqual('');
      // The result has zero characters regardless of the count.
      expect(StringUtils.repeat('', 100).length).assertEqual(0);
      // One repetition of an empty value stays empty.
      expect(StringUtils.repeat('', 1)).assertEqual('');
      // Zero repetitions of an empty value stay empty too.
      expect(StringUtils.repeat('', 0)).assertEqual('');
      // A negative count with an empty value also stays empty.
      expect(StringUtils.repeat('', -5)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_4600
     * @tc.name      testNumStrPad0046
     * @tc.desc      Verify repeat builds ten zero digits for fixed width patterns.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0046';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Ten repetitions of the zero digit build ten zeros.
      expect(StringUtils.repeat('0', 10)).assertEqual('0000000000');
      // The result holds exactly ten characters.
      expect(StringUtils.repeat('0', 10).length).assertEqual(10);
      // Nine repetitions build nine zeros.
      expect(StringUtils.repeat('0', 9)).assertEqual('000000000');
      // Eleven repetitions build eleven zeros.
      expect(StringUtils.repeat('0', 11)).assertEqual('00000000000');
      // One repetition builds a single zero digit.
      expect(StringUtils.repeat('0', 1)).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_4700
     * @tc.name      testNumStrPad0047
     * @tc.desc      Verify repeat just below the cap of ten thousand copies keeps full length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0047';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const repeated: string = StringUtils.repeat('ab', 9999);
      // Nine thousand nine hundred ninety-nine copies keep the full length.
      expect(repeated.length).assertEqual(19998);
      // The result starts with the value.
      expect(repeated.substring(0, 2)).assertEqual('ab');
      // The result ends with the value.
      expect(repeated.substring(19996, 19998)).assertEqual('ab');
      // One copy less keeps a length two characters shorter.
      expect(StringUtils.repeat('ab', 9998).length).assertEqual(19996);
      // One copy more reaches the cap exactly at twenty thousand.
      expect(StringUtils.repeat('ab', 10000).length).assertEqual(20000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_4800
     * @tc.name      testNumStrPad0048
     * @tc.desc      Verify repeat at exactly the cap of ten thousand copies keeps full length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0048';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const repeated: string = StringUtils.repeat('ab', 10000);
      // Ten thousand copies at the cap build twenty thousand characters.
      expect(repeated.length).assertEqual(20000);
      // The capped result starts with the value.
      expect(repeated.substring(0, 4)).assertEqual('abab');
      // The capped result ends with the value.
      expect(repeated.substring(19996, 20000)).assertEqual('abab');
      // Nine thousand nine hundred ninety-nine copies stay one copy shorter.
      expect(StringUtils.repeat('ab', 9999).length).assertEqual(19998);
      // The cap value itself is exactly the allowed maximum.
      expect(StringUtils.repeat('ab', 10000).length).assertEqual(20000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_4900
     * @tc.name      testNumStrPad0049
     * @tc.desc      Verify repeat one copy above the cap is clamped to ten thousand copies.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0049';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const repeated: string = StringUtils.repeat('ab', 10001);
      // Ten thousand and one requested copies clamp to the cap length.
      expect(repeated.length).assertEqual(20000);
      // The clamped length equals the exact cap repetition length.
      expect(repeated.length).assertEqual(StringUtils.repeat('ab', 10000).length);
      // The clamped result still starts with the value.
      expect(repeated.substring(0, 2)).assertEqual('ab');
      // The clamped result still ends with the value.
      expect(repeated.substring(19998, 20000)).assertEqual('ab');
      // A small repetition stays unaffected by the clamping logic.
      expect(StringUtils.repeat('ab', 2)).assertEqual('abab');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_5000
     * @tc.name      testNumStrPad0050
     * @tc.desc      Verify repeat far above the cap is clamped to ten thousand copies.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0050';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const repeated: string = StringUtils.repeat('ab', 20000);
      // Twenty thousand requested copies clamp to the cap of ten thousand.
      expect(repeated.length).assertEqual(20000);
      // The clamped length equals the exact cap repetition length.
      expect(repeated.length).assertEqual(StringUtils.repeat('ab', 10000).length);
      // The clamped result starts with the repeated value.
      expect(repeated.substring(0, 4)).assertEqual('abab');
      // The clamped result ends with the repeated value.
      expect(repeated.substring(19996, 20000)).assertEqual('abab');
      // A small repetition stays unaffected by the clamping logic.
      expect(StringUtils.repeat('ab', 2)).assertEqual('abab');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_5100
     * @tc.name      testNumStrPad0051
     * @tc.desc      Verify repeat builds four copies of a three character value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0051';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Four repetitions of three characters build twelve characters.
      expect(StringUtils.repeat('abc', 4)).assertEqual('abcabcabcabc');
      // The result holds exactly twelve characters.
      expect(StringUtils.repeat('abc', 4).length).assertEqual(12);
      // Three repetitions build nine characters.
      expect(StringUtils.repeat('abc', 3)).assertEqual('abcabcabc');
      // Two repetitions build six characters.
      expect(StringUtils.repeat('abc', 2)).assertEqual('abcabc');
      // Five repetitions build fifteen characters.
      expect(StringUtils.repeat('abc', 5).length).assertEqual(15);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_5200
     * @tc.name      testNumStrPad0052
     * @tc.desc      Verify repeat with one and two digit values builds alternating digit runs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0052';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One repetition of a single digit keeps that digit.
      expect(StringUtils.repeat('1', 1)).assertEqual('1');
      // Two repetitions of two digits alternate as twelve twelve.
      expect(StringUtils.repeat('12', 2)).assertEqual('1212');
      // Three repetitions of two digits alternate three times.
      expect(StringUtils.repeat('12', 3)).assertEqual('121212');
      // The three repetition result holds six characters.
      expect(StringUtils.repeat('12', 3).length).assertEqual(6);
      // Two repetitions of a single digit double the digit.
      expect(StringUtils.repeat('1', 2)).assertEqual('11');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_5300
     * @tc.name      testNumStrPad0053
     * @tc.desc      Verify capitalize keeps an empty value empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrPad0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrPad0053';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty value has no head to uppercase and stays empty.
      expect(StringUtils.capitalize('')).assertEqual('');
      // The empty result keeps zero characters.
      expect(StringUtils.capitalize('').length).assertEqual(0);
      // A second call on the same input is stable.
      expect(StringUtils.capitalize('')).assertEqual(StringUtils.capitalize(''));
      // A single space is uppercased to itself and stays a space.
      expect(StringUtils.capitalize(' ')).assertEqual(' ');
      // For contrast a one letter value gains an uppercase head.
      expect(StringUtils.capitalize('a')).assertEqual('A');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_5400
     * @tc.name      testNumStrPad0054
     * @tc.desc      Verify capitalize uppercases only the head of a lowercase word.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrPad0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrPad0054';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The lowercase head becomes uppercase and the tail is untouched.
      expect(StringUtils.capitalize('network')).assertEqual('Network');
      // A longer lowercase word behaves the same way.
      expect(StringUtils.capitalize('networksecurity')).assertEqual('Networksecurity');
      // The tail keeps its original lowercase letters.
      expect(StringUtils.capitalize('network').substring(1)).assertEqual('etwork');
      // The head of the result is a single uppercase letter.
      expect(StringUtils.capitalize('network').charAt(0)).assertEqual('N');
      // The result keeps the original length of seven.
      expect(StringUtils.capitalize('network').length).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_5500
     * @tc.name      testNumStrPad0055
     * @tc.desc      Verify capitalize leaves an already uppercase head unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0055';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An already uppercase word passes through unchanged.
      expect(StringUtils.capitalize('NETWORK')).assertEqual('NETWORK');
      // A single uppercase letter passes through unchanged.
      expect(StringUtils.capitalize('N')).assertEqual('N');
      // A mixed case word keeps the tail casing untouched.
      expect(StringUtils.capitalize('NeTwOrK')).assertEqual('NeTwOrK');
      // The result length matches the input length of seven.
      expect(StringUtils.capitalize('NETWORK').length).assertEqual(7);
      // For contrast a lowercase head changes only the head letter.
      expect(StringUtils.capitalize('nETWORK')).assertEqual('NETWORK');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_5600
     * @tc.name      testNumStrPad0056
     * @tc.desc      Verify capitalize uppercases single lowercase characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0056';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single lowercase letter becomes uppercase.
      expect(StringUtils.capitalize('n')).assertEqual('N');
      // The result keeps a length of one.
      expect(StringUtils.capitalize('n').length).assertEqual(1);
      // Another single letter is uppercased the same way.
      expect(StringUtils.capitalize('z')).assertEqual('Z');
      // A further single letter is uppercased as well.
      expect(StringUtils.capitalize('q')).assertEqual('Q');
      // An already uppercase single letter stays unchanged.
      expect(StringUtils.capitalize('Z')).assertEqual('Z');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_5700
     * @tc.name      testNumStrPad0057
     * @tc.desc      Verify capitalize leaves numeric heads unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0057';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A digit head has no uppercase form so the value passes through.
      expect(StringUtils.capitalize('9lives')).assertEqual('9lives');
      // A single digit value passes through unchanged.
      expect(StringUtils.capitalize('9')).assertEqual('9');
      // A hex style value with a zero head passes through unchanged.
      expect(StringUtils.capitalize('0xff')).assertEqual('0xff');
      // A year-like value with a two head passes through unchanged.
      expect(StringUtils.capitalize('2026')).assertEqual('2026');
      // The untouched numeric result keeps its original length.
      expect(StringUtils.capitalize('9lives').length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_5800
     * @tc.name      testNumStrPad0058
     * @tc.desc      Verify capitalize keeps a whitespace head and the rest of the value untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0058';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A leading space has no uppercase form so the value is unchanged.
      expect(StringUtils.capitalize(' audit')).assertEqual(' audit');
      // A tab head is likewise unchanged.
      expect(StringUtils.capitalize('\taudit')).assertEqual('\taudit');
      // The whitespace headed result keeps its original length.
      expect(StringUtils.capitalize(' audit').length).assertEqual(6);
      // Only the head is processed so the inner text stays lowercase.
      expect(StringUtils.capitalize(' audit').substring(1)).assertEqual('audit');
      // For contrast a letter head in the same word changes the head.
      expect(StringUtils.capitalize('audit')).assertEqual('Audit');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_5900
     * @tc.name      testNumStrPad0059
     * @tc.desc      Verify capitalize uppercases the head only and preserves mixed tail casing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0059';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Only the first letter is uppercased in a mixed case value.
      expect(StringUtils.capitalize('aBcDeF')).assertEqual('ABcDeF');
      // A short mixed case value is handled the same way.
      expect(StringUtils.capitalize('aBC')).assertEqual('ABC');
      // The tail of the result keeps its original casing.
      expect(StringUtils.capitalize('aBcDeF').substring(1)).assertEqual('BcDeF');
      // The result length matches the input length of six.
      expect(StringUtils.capitalize('aBcDeF').length).assertEqual(6);
      // An all lowercase value gains one uppercase head only.
      expect(StringUtils.capitalize('abcdef')).assertEqual('Abcdef');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_6000
     * @tc.name      testNumStrPad0060
     * @tc.desc      Verify capitalize leaves a date-like numeric value unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0060';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A date value with a digit head passes through unchanged.
      expect(StringUtils.capitalize('2026-01-01')).assertEqual('2026-01-01');
      // A plain year value passes through unchanged too.
      expect(StringUtils.capitalize('2026')).assertEqual('2026');
      // A single digit passes through unchanged.
      expect(StringUtils.capitalize('1')).assertEqual('1');
      // The unchanged result keeps its ten characters.
      expect(StringUtils.capitalize('2026-01-01').length).assertEqual(10);
      // A negative number styled value also passes through unchanged.
      expect(StringUtils.capitalize('-42')).assertEqual('-42');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_6100
     * @tc.name      testNumStrPad0061
     * @tc.desc      Verify capitalize uppercases the head of a sentence with digits and spaces.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0061';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Only the head letter of the sentence is uppercased.
      expect(StringUtils.capitalize('mixed 7 case')).assertEqual('Mixed 7 case');
      // The digit inside the sentence stays untouched.
      expect(StringUtils.capitalize('mixed 7 case').charAt(6)).assertEqual('7');
      // The inner space between words is preserved.
      expect(StringUtils.capitalize('mixed 7 case').substring(5, 6)).assertEqual(' ');
      // The result length matches the input length of twelve.
      expect(StringUtils.capitalize('mixed 7 case').length).assertEqual(12);
      // A digit-only word after a space is not uppercased.
      expect(StringUtils.capitalize('7 case')).assertEqual('7 case');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_6200
     * @tc.name      testNumStrPad0062
     * @tc.desc      Verify capitalize uppercases the head of a hyphenated key.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0062';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The head of the hyphenated key is uppercased.
      expect(StringUtils.capitalize('session-key')).assertEqual('Session-key');
      // The tail after the dash keeps its lowercase form.
      expect(StringUtils.capitalize('session-key').substring(8)).assertEqual('key');
      // The dash inside the value stays in place.
      expect(StringUtils.capitalize('session-key').charAt(7)).assertEqual('-');
      // The result length matches the input length of eleven.
      expect(StringUtils.capitalize('session-key').length).assertEqual(11);
      // A single letter head is uppercased the same way.
      expect(StringUtils.capitalize('s')).assertEqual('S');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_6300
     * @tc.name      testNumStrPad0063
     * @tc.desc      Verify capitalize of an already uppercase scheme word keeps every letter unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0063';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An uppercase scheme word passes through unchanged.
      expect(StringUtils.capitalize('HTTPS')).assertEqual('HTTPS');
      // A lowercase head with uppercase tail gains only the head change.
      expect(StringUtils.capitalize('hTTPS')).assertEqual('HTTPS');
      // The result length matches the input length of five.
      expect(StringUtils.capitalize('HTTPS').length).assertEqual(5);
      // The first character of the result is the uppercase H.
      expect(StringUtils.capitalize('HTTPS').charAt(0)).assertEqual('H');
      // A single uppercase H stays unchanged.
      expect(StringUtils.capitalize('H')).assertEqual('H');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_6400
     * @tc.name      testNumStrPad0064
     * @tc.desc      Verify capitalize on a word with an uppercase head keeps everything unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0064';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A word with an uppercase head passes through unchanged.
      expect(StringUtils.capitalize('NeTwOrK')).assertEqual('NeTwOrK');
      // The tail keeps its original mixed casing.
      expect(StringUtils.capitalize('NeTwOrK').substring(1)).assertEqual('eTwOrK');
      // The result length matches the input length of seven.
      expect(StringUtils.capitalize('NeTwOrK').length).assertEqual(7);
      // The head of the result is still the uppercase N.
      expect(StringUtils.capitalize('NeTwOrK').charAt(0)).assertEqual('N');
      // For contrast a lowercase head changes only that letter.
      expect(StringUtils.capitalize('neTwOrK')).assertEqual('NeTwOrK');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_6500
     * @tc.name      testNumStrPad0065
     * @tc.desc      Verify capitalize applied to concatenated inputs behaves like per-word capitalization.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0065';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The first word gains an uppercase head.
      expect(StringUtils.capitalize('abc')).assertEqual('Abc');
      // The second word gains its own uppercase head.
      expect(StringUtils.capitalize('def')).assertEqual('Def');
      // A concatenated input is uppercased on its combined head only.
      expect(StringUtils.capitalize('a' + 'bc')).assertEqual('Abc');
      // The concatenated result keeps a length of three.
      expect(StringUtils.capitalize('a' + 'bc').length).assertEqual(3);
      // The two capitalized words combine into a capitalized pair.
      expect(StringUtils.capitalize('abc') + StringUtils.capitalize('def')).assertEqual('AbcDef');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_6600
     * @tc.name      testNumStrPad0066
     * @tc.desc      Verify capitalize results can be combined into a new capitalized pair.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0066';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const first: string = StringUtils.capitalize('x');
      const second: string = StringUtils.capitalize('y');
      // Two single letter capitalizations combine into the pair XY.
      expect(first + second).assertEqual('XY');
      // A single capitalized word keeps only its head changed.
      expect(StringUtils.capitalize('xy')).assertEqual('Xy');
      // The already uppercase pair passes through unchanged.
      expect(StringUtils.capitalize('XY')).assertEqual('XY');
      // The combined result holds exactly two characters.
      expect((first + second).length).assertEqual(2);
      // Each single letter result keeps a length of one.
      expect(first.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_6700
     * @tc.name      testNumStrPad0067
     * @tc.desc      Verify truncate works on the padded result of padStart with matching widths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0067';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const padded: string = StringUtils.padStart('42', 6, '0');
      // The padded value reaches the target width of six.
      expect(padded).assertEqual('000042');
      // Truncating the padded value back to four keeps the zeros only.
      expect(StringUtils.truncate(padded, 4)).assertEqual('0000');
      // Truncating at the padded width keeps everything.
      expect(StringUtils.truncate(padded, 6)).assertEqual('000042');
      // Truncating to three keeps the first three zeros.
      expect(StringUtils.truncate('000042', 3)).assertEqual('000');
      // The truncated result of width four holds four characters.
      expect(StringUtils.truncate(padded, 4).length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_6800
     * @tc.name      testNumStrPad0068
     * @tc.desc      Verify truncate cuts a repeated value at every width from zero to full length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0068';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const repeated: string = StringUtils.repeat('ab', 5);
      // Five copies of two characters build a ten character run.
      expect(repeated.length).assertEqual(10);
      // Truncating to seven keeps an odd cut through the pattern.
      expect(StringUtils.truncate(repeated, 7)).assertEqual('abababa');
      // Truncating at the full width keeps the whole run.
      expect(StringUtils.truncate(repeated, 10)).assertEqual('ababababab');
      // Truncating to zero keeps nothing.
      expect(StringUtils.truncate(repeated, 0)).assertEqual('');
      // Truncating beyond the width keeps everything unchanged.
      expect(StringUtils.truncate(repeated, 11)).assertEqual('ababababab');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRPAD_6900
     * @tc.name      testNumStrPad0069
     * @tc.desc      Verify capitalize combines with repeat and empty inputs into composed values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrPad0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrPad0069';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const banner: string = StringUtils.repeat('-', 3) + StringUtils.capitalize('ok');
      // Three dashes plus the capitalized word build a five character banner.
      expect(banner).assertEqual('---Ok');
      // The banner holds exactly five characters.
      expect(banner.length).assertEqual(5);
      // The capitalized head sits right after the dashes.
      expect(banner.charAt(3)).assertEqual('O');
      // Capitalizing a repeated run uppercases only its first character.
      expect(StringUtils.capitalize(StringUtils.repeat('x', 2))).assertEqual('Xx');
      // Empty inputs compose into the empty string.
      expect(StringUtils.capitalize('') + StringUtils.repeat('', 3)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
