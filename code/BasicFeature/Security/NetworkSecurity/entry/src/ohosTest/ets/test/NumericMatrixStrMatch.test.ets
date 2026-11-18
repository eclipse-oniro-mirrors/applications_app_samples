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

// Registers the numeric matrix test suite for the matching and blank string helpers.
export default function numericMatrixStrMatchTest() {
  describe('NumericMatrixStrMatchSuite', () => {
    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_0100
     * @tc.name      testNumStrMatch0001
     * @tc.desc      Verify isEmpty reports true for undefined input and false for visible text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrMatch0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrMatch0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Missing input counts as empty.
      expect(StringUtils.isEmpty(undefined)).assertTrue();
      // The empty string counts as empty as well.
      expect(StringUtils.isEmpty('')).assertTrue();
      // A one character value is not empty.
      expect(StringUtils.isEmpty('a')).assertFalse();
      // A single space still holds a character and is not empty.
      expect(StringUtils.isEmpty(' ')).assertFalse();
      // A two character value is not empty either.
      expect(StringUtils.isEmpty('ab')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_0200
     * @tc.name      testNumStrMatch0002
     * @tc.desc      Verify isEmpty reports true only for the exact empty string among short values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrMatch0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrMatch0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty string has length zero and counts as empty.
      expect(StringUtils.isEmpty('')).assertTrue();
      // One character makes the value non empty.
      expect(StringUtils.isEmpty('x')).assertFalse();
      // Two characters are also non empty.
      expect(StringUtils.isEmpty('xy')).assertFalse();
      // Ten characters are non empty.
      expect(StringUtils.isEmpty('0123456789')).assertFalse();
      // Eleven characters stay non empty beyond the round number.
      expect(StringUtils.isEmpty('01234567890')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_0300
     * @tc.name      testNumStrMatch0003
     * @tc.desc      Verify isEmpty keeps whitespace-only values non empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrMatch0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrMatch0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One space has length one and is not empty.
      expect(StringUtils.isEmpty(' ')).assertFalse();
      // Two spaces have length two and are not empty.
      expect(StringUtils.isEmpty('  ')).assertFalse();
      // Three spaces have length three and are not empty.
      expect(StringUtils.isEmpty('   ')).assertFalse();
      // isBlank treats the same three spaces as blank for contrast.
      expect(StringUtils.isBlank('   ')).assertTrue();
      // The empty string alone counts as empty for contrast.
      expect(StringUtils.isEmpty('')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_0400
     * @tc.name      testNumStrMatch0004
     * @tc.desc      Verify isEmpty keeps tab and line break characters non empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A tab holds one character and is not empty.
      expect(StringUtils.isEmpty('\t')).assertFalse();
      // A line feed holds one character and is not empty.
      expect(StringUtils.isEmpty('\n')).assertFalse();
      // A carriage return holds one character and is not empty.
      expect(StringUtils.isEmpty('\r')).assertFalse();
      // A tab followed by a line feed holds two characters.
      expect(StringUtils.isEmpty('\t\n')).assertFalse();
      // The empty string alone counts as empty for contrast.
      expect(StringUtils.isEmpty('')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_0500
     * @tc.name      testNumStrMatch0005
     * @tc.desc      Verify isEmpty keeps the zero digit as a non empty value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single zero digit holds a character and is not empty.
      expect(StringUtils.isEmpty('0')).assertFalse();
      // Two zero digits hold two characters and are not empty.
      expect(StringUtils.isEmpty('00')).assertFalse();
      // A zero followed by a space holds two characters.
      expect(StringUtils.isEmpty('0 ')).assertFalse();
      // A space followed by a zero holds two characters too.
      expect(StringUtils.isEmpty(' 0')).assertFalse();
      // The empty string counts as empty for contrast.
      expect(StringUtils.isEmpty('')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_0600
     * @tc.name      testNumStrMatch0006
     * @tc.desc      Verify isEmpty keeps ten character digit and letter values non empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Ten digits hold ten characters and are not empty.
      expect(StringUtils.isEmpty('0123456789')).assertFalse();
      // Ten letters hold ten characters and are not empty.
      expect(StringUtils.isEmpty('abcdefghij')).assertFalse();
      // One digit is already non empty.
      expect(StringUtils.isEmpty('1')).assertFalse();
      // Nine digits are non empty as well.
      expect(StringUtils.isEmpty('012345678')).assertFalse();
      // Eleven characters stay non empty beyond the round number.
      expect(StringUtils.isEmpty('01234567890')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_0700
     * @tc.name      testNumStrMatch0007
     * @tc.desc      Verify isEmpty keeps values with inner spaces non empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A value with an inner space holds three characters.
      expect(StringUtils.isEmpty('a b')).assertFalse();
      // A leading space plus a letter holds two characters.
      expect(StringUtils.isEmpty(' a')).assertFalse();
      // A letter plus a trailing space holds two characters.
      expect(StringUtils.isEmpty('a ')).assertFalse();
      // Two letters with two inner spaces hold four characters.
      expect(StringUtils.isEmpty('a  b')).assertFalse();
      // Only the truly empty string counts as empty.
      expect(StringUtils.isEmpty('')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_0800
     * @tc.name      testNumStrMatch0008
     * @tc.desc      Verify isEmpty keeps a hundred character generated value non empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const longText: string = StringUtils.repeat('ab', 50);
      // Fifty copies of two characters build one hundred characters.
      expect(longText.length).assertEqual(100);
      // The long value is far from empty.
      expect(StringUtils.isEmpty(longText)).assertFalse();
      // A thousand copies build two thousand characters and stay non empty.
      expect(StringUtils.isEmpty(StringUtils.repeat('ab', 1000))).assertFalse();
      // The empty string alone counts as empty for contrast.
      expect(StringUtils.isEmpty('')).assertTrue();
      // A single copy of the value is already non empty.
      expect(StringUtils.isEmpty('ab')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_0900
     * @tc.name      testNumStrMatch0009
     * @tc.desc      Verify isEmpty treats the literal words null and undefined as non empty text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The literal word null is visible text and not empty.
      expect(StringUtils.isEmpty('null')).assertFalse();
      // The literal word undefined is visible text and not empty.
      expect(StringUtils.isEmpty('undefined')).assertFalse();
      // The real undefined value counts as empty for contrast.
      expect(StringUtils.isEmpty(undefined)).assertTrue();
      // The uppercase word NULL is visible text and not empty.
      expect(StringUtils.isEmpty('NULL')).assertFalse();
      // The empty string counts as empty for contrast.
      expect(StringUtils.isEmpty('')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_1000
     * @tc.name      testNumStrMatch0010
     * @tc.desc      Verify isEmpty keeps mixed whitespace runs non empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A tab, line feed, space and return run holds four characters.
      expect(StringUtils.isEmpty('\t\n \r')).assertFalse();
      // A space tab space run holds three characters.
      expect(StringUtils.isEmpty(' \t ')).assertFalse();
      // Two line feeds hold two characters.
      expect(StringUtils.isEmpty('\n\n')).assertFalse();
      // The same runs are blank for contrast.
      expect(StringUtils.isBlank('\t\n \r')).assertTrue();
      // The empty string counts as empty for contrast.
      expect(StringUtils.isEmpty('')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_1100
     * @tc.name      testNumStrMatch0011
     * @tc.desc      Verify isEmpty boundary table for undefined, empty, one and two character values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Undefined input is the first empty boundary.
      expect(StringUtils.isEmpty(undefined)).assertTrue();
      // The empty string is the second empty boundary.
      expect(StringUtils.isEmpty('')).assertTrue();
      // One character is the first non empty boundary.
      expect(StringUtils.isEmpty('x')).assertFalse();
      // Two characters stay non empty.
      expect(StringUtils.isEmpty('xy')).assertFalse();
      // Whitespace text stays non empty at every width.
      expect(StringUtils.isEmpty('  ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_1200
     * @tc.name      testNumStrMatch0012
     * @tc.desc      Verify isBlank reports true for undefined and whitespace-only inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrMatch0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrMatch0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Missing input counts as blank.
      expect(StringUtils.isBlank(undefined)).assertTrue();
      // The empty string trims to nothing and counts as blank.
      expect(StringUtils.isBlank('')).assertTrue();
      // A single space trims to nothing and counts as blank.
      expect(StringUtils.isBlank(' ')).assertTrue();
      // A letter makes the value non blank.
      expect(StringUtils.isBlank('a')).assertFalse();
      // A digit makes the value non blank too.
      expect(StringUtils.isBlank('0')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_1300
     * @tc.name      testNumStrMatch0013
     * @tc.desc      Verify isBlank separates the empty string from single character values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrMatch0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrMatch0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty string is blank.
      expect(StringUtils.isBlank('')).assertTrue();
      // A single letter is not blank.
      expect(StringUtils.isBlank('a')).assertFalse();
      // A single digit is not blank.
      expect(StringUtils.isBlank('0')).assertFalse();
      // A single space is blank after trimming.
      expect(StringUtils.isBlank(' ')).assertTrue();
      // A single dash is not blank.
      expect(StringUtils.isBlank('-')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_1400
     * @tc.name      testNumStrMatch0014
     * @tc.desc      Verify isBlank trims padded letters before judging emptiness.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrMatch0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrMatch0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three spaces trim to nothing and count as blank.
      expect(StringUtils.isBlank('   ')).assertTrue();
      // Five spaces trim to nothing and count as blank too.
      expect(StringUtils.isBlank('     ')).assertTrue();
      // A letter padded with spaces stays visible after trimming.
      expect(StringUtils.isBlank('  a  ')).assertFalse();
      // A digit padded with spaces stays visible as well.
      expect(StringUtils.isBlank(' 0 ')).assertFalse();
      // Ten spaces are still blank.
      expect(StringUtils.isBlank('          ')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_1500
     * @tc.name      testNumStrMatch0015
     * @tc.desc      Verify isBlank treats tab, return and line feed runs as blank.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A tab, return and line feed run trims to nothing.
      expect(StringUtils.isBlank('\t\r\n')).assertTrue();
      // The same run with extra spaces still trims to nothing.
      expect(StringUtils.isBlank('\t \r\n ')).assertTrue();
      // A letter after the run keeps the value non blank.
      expect(StringUtils.isBlank('\t\r\na')).assertFalse();
      // A single tab trims to nothing and counts as blank.
      expect(StringUtils.isBlank('\t')).assertTrue();
      // The empty string counts as blank for contrast.
      expect(StringUtils.isBlank('')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_1600
     * @tc.name      testNumStrMatch0016
     * @tc.desc      Verify isBlank keeps padded single letters non blank.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A letter padded on both sides stays non blank.
      expect(StringUtils.isBlank(' a ')).assertFalse();
      // A letter with a leading space stays non blank.
      expect(StringUtils.isBlank(' a')).assertFalse();
      // A letter with a trailing space stays non blank.
      expect(StringUtils.isBlank('a ')).assertFalse();
      // The trimmed text keeps exactly one character.
      expect(StringUtils.trimToNull(' a ')).assertEqual('a');
      // A space alone is blank for contrast.
      expect(StringUtils.isBlank(' ')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_1700
     * @tc.name      testNumStrMatch0017
     * @tc.desc      Verify isBlank treats mixed tab and space runs as blank and digits as non blank.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two spaces, a tab and two more spaces trim to nothing.
      expect(StringUtils.isBlank('  \t  ')).assertTrue();
      // A mixed run of four whitespace kinds trims to nothing.
      expect(StringUtils.isBlank(' \t\n\r ')).assertTrue();
      // A digit inside whitespace keeps the value non blank.
      expect(StringUtils.isBlank(' \t0')).assertFalse();
      // The digit zero alone is non blank.
      expect(StringUtils.isBlank('0')).assertFalse();
      // The mixed run collapses to null when trimmed for contrast.
      expect(StringUtils.trimToNull('  \t  ')).assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_1800
     * @tc.name      testNumStrMatch0018
     * @tc.desc      Verify isBlank keeps words with inner spaces non blank.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two letters with an inner space stay non blank.
      expect(StringUtils.isBlank('x y')).assertFalse();
      // A single space is blank for contrast.
      expect(StringUtils.isBlank(' ')).assertTrue();
      // Two letters without a space stay non blank.
      expect(StringUtils.isBlank('xy')).assertFalse();
      // Three words with spaces stay non blank.
      expect(StringUtils.isBlank('a b c')).assertFalse();
      // A word with a digit stays non blank too.
      expect(StringUtils.isBlank('x 7 y')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_1900
     * @tc.name      testNumStrMatch0019
     * @tc.desc      Verify isBlank collapses long mixed whitespace runs to blank.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A five part whitespace run trims to nothing.
      expect(StringUtils.isBlank(' \t\n \t ')).assertTrue();
      // Two line feeds with surrounding spaces trim to nothing.
      expect(StringUtils.isBlank('  \r\n  ')).assertTrue();
      // A single letter breaks the blankness.
      expect(StringUtils.isBlank(' \t\n a')).assertFalse();
      // The long run collapses to null when trimmed.
      expect(StringUtils.trimToNull(' \t\n \t ')).assertNull();
      // The empty string is blank for contrast.
      expect(StringUtils.isBlank('')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_2000
     * @tc.name      testNumStrMatch0020
     * @tc.desc      Verify isBlank keeps the zero digit non blank even when padded.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A bare zero digit is non blank.
      expect(StringUtils.isBlank('0')).assertFalse();
      // A zero padded with spaces is non blank too.
      expect(StringUtils.isBlank(' 0 ')).assertFalse();
      // A zero with a leading space is non blank.
      expect(StringUtils.isBlank(' 0')).assertFalse();
      // The padded zero trims to the bare digit.
      expect(StringUtils.trimToNull(' 0 ')).assertEqual('0');
      // The space alone is blank for contrast.
      expect(StringUtils.isBlank(' ')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_2100
     * @tc.name      testNumStrMatch0021
     * @tc.desc      Verify isBlank keeps padded two digit numbers non blank.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The number forty-two padded with spaces is non blank.
      expect(StringUtils.isBlank('   42   ')).assertFalse();
      // The bare number is non blank too.
      expect(StringUtils.isBlank('42')).assertFalse();
      // A number with an inner space is non blank.
      expect(StringUtils.isBlank('4 2')).assertFalse();
      // The padded number trims to its bare digits.
      expect(StringUtils.trimToNull('   42   ')).assertEqual('42');
      // The empty string is blank for contrast.
      expect(StringUtils.isBlank('')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_2200
     * @tc.name      testNumStrMatch0022
     * @tc.desc      Verify isBlank boundary table for undefined, empty, spaces and words.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Undefined input is the first blank boundary.
      expect(StringUtils.isBlank(undefined)).assertTrue();
      // The empty string is the second blank boundary.
      expect(StringUtils.isBlank('')).assertTrue();
      // The single space is the third blank boundary.
      expect(StringUtils.isBlank(' ')).assertTrue();
      // A short word crosses into non blank territory.
      expect(StringUtils.isBlank('text')).assertFalse();
      // A word padded with spaces stays non blank.
      expect(StringUtils.isBlank(' text ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_2300
     * @tc.name      testNumStrMatch0023
     * @tc.desc      Verify trimToNull collapses undefined, empty and whitespace-only inputs to null.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrMatch0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrMatch0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Missing input collapses to null.
      expect(StringUtils.trimToNull(undefined)).assertNull();
      // The empty string collapses to null.
      expect(StringUtils.trimToNull('')).assertNull();
      // Three spaces trim to nothing and collapse to null.
      expect(StringUtils.trimToNull('   ')).assertNull();
      // A single space collapses to null too.
      expect(StringUtils.trimToNull(' ')).assertNull();
      // A letter survives the trim as visible text.
      expect(StringUtils.trimToNull('a')).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_2400
     * @tc.name      testNumStrMatch0024
     * @tc.desc      Verify trimToNull collapses the empty string and single space to null.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrMatch0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrMatch0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty string has nothing left after trimming.
      expect(StringUtils.trimToNull('')).assertNull();
      // A single space trims to the empty string and collapses.
      expect(StringUtils.trimToNull(' ')).assertNull();
      // A single letter trims to itself.
      expect(StringUtils.trimToNull('a')).assertEqual('a');
      // A single digit trims to itself.
      expect(StringUtils.trimToNull('0')).assertEqual('0');
      // The kept letter is not empty for contrast.
      expect(StringUtils.isEmpty('a')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_2500
     * @tc.name      testNumStrMatch0025
     * @tc.desc      Verify trimToNull collapses every pure whitespace kind to null.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrMatch0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrMatch0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A tab collapses to null.
      expect(StringUtils.trimToNull('\t')).assertNull();
      // A return and line feed pair collapses to null.
      expect(StringUtils.trimToNull('\n\r')).assertNull();
      // A mixed whitespace run collapses to null.
      expect(StringUtils.trimToNull(' \t \r\n ')).assertNull();
      // A wide run of spaces collapses to null too.
      expect(StringUtils.trimToNull('      ')).assertNull();
      // A letter inside whitespace survives as the trimmed text.
      expect(StringUtils.trimToNull(' \ta\t ')).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_2600
     * @tc.name      testNumStrMatch0026
     * @tc.desc      Verify trimToNull strips padding around a token value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrMatch0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrMatch0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Padding on both sides is stripped from the token.
      expect(StringUtils.trimToNull('  token-42 ')).assertEqual('token-42');
      // A token without padding passes through unchanged.
      expect(StringUtils.trimToNull('token-42')).assertEqual('token-42');
      // Only the leading padding is stripped in this variant.
      expect(StringUtils.trimToNull(' token-42')).assertEqual('token-42');
      // Only the trailing padding is stripped in this variant.
      expect(StringUtils.trimToNull('token-42 ')).assertEqual('token-42');
      // The trimmed token keeps its eight characters.
      expect(StringUtils.trimToNull('  token-42 ')!.length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_2700
     * @tc.name      testNumStrMatch0027
     * @tc.desc      Verify trimToNull passes a plain word through unchanged for every padding side.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A plain word without padding stays unchanged.
      expect(StringUtils.trimToNull('plain')).assertEqual('plain');
      // A leading space is stripped.
      expect(StringUtils.trimToNull(' plain')).assertEqual('plain');
      // A trailing space is stripped.
      expect(StringUtils.trimToNull('plain ')).assertEqual('plain');
      // Padding on both sides is stripped.
      expect(StringUtils.trimToNull(' plain ')).assertEqual('plain');
      // Two spaces on each side are stripped as well.
      expect(StringUtils.trimToNull('  plain  ')).assertEqual('plain');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_2800
     * @tc.name      testNumStrMatch0028
     * @tc.desc      Verify trimToNull strips mixed whitespace padding around a word.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Tab and line feed padding around the word is stripped.
      expect(StringUtils.trimToNull('\t\n tabbed \r\n')).assertEqual('tabbed');
      // The bare word passes through unchanged.
      expect(StringUtils.trimToNull('tabbed')).assertEqual('tabbed');
      // The trimmed word keeps its six characters.
      expect(StringUtils.trimToNull('\t\n tabbed \r\n')!.length).assertEqual(6);
      // A tab alone collapses to null.
      expect(StringUtils.trimToNull('\t')).assertNull();
      // The word inside whitespace stays non empty for contrast.
      expect(StringUtils.isEmpty('tabbed')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_2900
     * @tc.name      testNumStrMatch0029
     * @tc.desc      Verify trimToNull keeps digit values intact after trimming.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The zero digit survives the trim as visible text.
      expect(StringUtils.trimToNull('0')).assertEqual('0');
      // A padded zero digit trims to the bare digit.
      expect(StringUtils.trimToNull(' 0 ')).assertEqual('0');
      // A run of three zeros stays intact.
      expect(StringUtils.trimToNull('000')).assertEqual('000');
      // A padded run of zeros trims to the bare run.
      expect(StringUtils.trimToNull(' 000 ')).assertEqual('000');
      // The trimmed run keeps three characters.
      expect(StringUtils.trimToNull(' 000 ')!.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_3000
     * @tc.name      testNumStrMatch0030
     * @tc.desc      Verify trimToNull handles one-sided whitespace padding on letters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two leading spaces trim away and leave the letter.
      expect(StringUtils.trimToNull('  a')).assertEqual('a');
      // Two trailing spaces trim away and leave the letter.
      expect(StringUtils.trimToNull('a  ')).assertEqual('a');
      // Two spaces alone collapse to null.
      expect(StringUtils.trimToNull('  ')).assertNull();
      // The one-sided results keep a single character.
      expect(StringUtils.trimToNull('  a')!.length).assertEqual(1);
      // The bare letter matches the trimmed outcome.
      expect(StringUtils.trimToNull('a')).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_3100
     * @tc.name      testNumStrMatch0031
     * @tc.desc      Verify trimToNull keeps inner spaces while trimming outer padding.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A padded zero digit trims to the bare digit.
      expect(StringUtils.trimToNull('  0 ')).assertEqual('0');
      // Two digits with an inner space keep the inner space.
      expect(StringUtils.trimToNull(' 0 0')).assertEqual('0 0');
      // The trailing space is stripped while the inner one stays.
      expect(StringUtils.trimToNull('0 0 ')).assertEqual('0 0');
      // The kept result holds three characters.
      expect(StringUtils.trimToNull(' 0 0')!.length).assertEqual(3);
      // A space only value still collapses to null.
      expect(StringUtils.trimToNull('  ')).assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_3200
     * @tc.name      testNumStrMatch0032
     * @tc.desc      Verify trimToNull preserves inner whitespace inside a phrase.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Outer padding is stripped but the double inner space survives.
      expect(StringUtils.trimToNull(' inner  text ')).assertEqual('inner  text');
      // The trimmed phrase keeps eleven characters.
      expect(StringUtils.trimToNull(' inner  text ')!.length).assertEqual(11);
      // The phrase without padding passes through unchanged.
      expect(StringUtils.trimToNull('inner  text')).assertEqual('inner  text');
      // The inner double space is still at positions five and six.
      expect(StringUtils.trimToNull(' inner  text ')!.substring(5, 7)).assertEqual('  ');
      // A single inner space is preserved the same way.
      expect(StringUtils.trimToNull(' inner text ')).assertEqual('inner text');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_3300
     * @tc.name      testNumStrMatch0033
     * @tc.desc      Verify trimToNull keeps a spaced sequence intact across padding variants.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The spaced sequence without padding passes through unchanged.
      expect(StringUtils.trimToNull('a b c')).assertEqual('a b c');
      // Padding on both sides is stripped from the sequence.
      expect(StringUtils.trimToNull('  a b c  ')).assertEqual('a b c');
      // The trimmed sequence keeps five characters.
      expect(StringUtils.trimToNull('  a b c  ')!.length).assertEqual(5);
      // The empty string collapses to null for contrast.
      expect(StringUtils.trimToNull('')).assertNull();
      // The kept sequence is not empty for contrast.
      expect(StringUtils.isEmpty('a b c')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_3400
     * @tc.name      testNumStrMatch0034
     * @tc.desc      Verify startsWithIgnoreCase matches a prefix in lower and upper case variants.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrMatch0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrMatch0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A lowercase prefix matches an uppercase head ignoring case.
      expect(StringUtils.startsWithIgnoreCase('NetworkSecurity', 'network')).assertTrue();
      // An uppercase prefix matches the same head too.
      expect(StringUtils.startsWithIgnoreCase('NetworkSecurity', 'NETWORK')).assertTrue();
      // The exact case prefix matches directly.
      expect(StringUtils.startsWithIgnoreCase('NetworkSecurity', 'Network')).assertTrue();
      // A different word as prefix does not match.
      expect(StringUtils.startsWithIgnoreCase('NetworkSecurity', 'storage')).assertFalse();
      // A seven character prefix covering the whole head word matches.
      expect(StringUtils.startsWithIgnoreCase('NetworkSecurity', 'networks')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_3500
     * @tc.name      testNumStrMatch0035
     * @tc.desc      Verify startsWithIgnoreCase matches mixed case prefix spellings.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A mixed case prefix matches the same head ignoring case.
      expect(StringUtils.startsWithIgnoreCase('NetworkSecurity', 'NeTwOrK')).assertTrue();
      // Another mixed case spelling matches too.
      expect(StringUtils.startsWithIgnoreCase('NetworkSecurity', 'nEtWoRk')).assertTrue();
      // The full name in mixed case matches the full value.
      expect(StringUtils.startsWithIgnoreCase('NetworkSecurity', 'NetworkSeCuRiTy')).assertTrue();
      // A mixed case prefix with an extra letter does not match.
      expect(StringUtils.startsWithIgnoreCase('NetworkSecurity', 'NeTwOrKx')).assertFalse();
      // The exact case full name matches as well.
      expect(StringUtils.startsWithIgnoreCase('NetworkSecurity', 'NetworkSecurity')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_3600
     * @tc.name      testNumStrMatch0036
     * @tc.desc      Verify startsWithIgnoreCase at the full length boundary and beyond.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A prefix of the exact value length matches the whole value.
      expect(StringUtils.startsWithIgnoreCase('NetworkSecurity', 'networksecurity')).assertTrue();
      // The same prefix in upper case matches as well.
      expect(StringUtils.startsWithIgnoreCase('NetworkSecurity', 'NETWORKSECURITY')).assertTrue();
      // One extra character makes the prefix too long to match.
      expect(StringUtils.startsWithIgnoreCase('NetworkSecurity', 'networksecurityx')).assertFalse();
      // A prefix one character shorter still matches at the boundary.
      expect(StringUtils.startsWithIgnoreCase('NetworkSecurity', 'networksecurit')).assertTrue();
      // A prefix five characters shorter matches the head part.
      expect(StringUtils.startsWithIgnoreCase('NetworkSecurity', 'NETWO')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_3700
     * @tc.name      testNumStrMatch0037
     * @tc.desc      Verify startsWithIgnoreCase rejects prefixes longer than the value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0037';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A four character prefix cannot match a three character value.
      expect(StringUtils.startsWithIgnoreCase('abc', 'abcd')).assertFalse();
      // A one character prefix cannot match an empty value.
      expect(StringUtils.startsWithIgnoreCase('', 'a')).assertFalse();
      // A three character prefix cannot match a two character value.
      expect(StringUtils.startsWithIgnoreCase('ab', 'abc')).assertFalse();
      // The equal length prefix matches for contrast.
      expect(StringUtils.startsWithIgnoreCase('abc', 'ABC')).assertTrue();
      // A much longer prefix is rejected as well.
      expect(StringUtils.startsWithIgnoreCase('ab', 'abcdefghij')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_3800
     * @tc.name      testNumStrMatch0038
     * @tc.desc      Verify startsWithIgnoreCase handles empty value and empty prefix boundaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0038';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two empty values match because both sides are empty strings.
      expect(StringUtils.startsWithIgnoreCase('', '')).assertTrue();
      // An empty prefix matches any value.
      expect(StringUtils.startsWithIgnoreCase('a', '')).assertTrue();
      // An empty value cannot match a non empty prefix.
      expect(StringUtils.startsWithIgnoreCase('', 'x')).assertFalse();
      // An empty value with an upper case prefix is rejected too.
      expect(StringUtils.startsWithIgnoreCase('', 'X')).assertFalse();
      // A single letter value matches its own upper cased prefix.
      expect(StringUtils.startsWithIgnoreCase('a', 'A')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_3900
     * @tc.name      testNumStrMatch0039
     * @tc.desc      Verify startsWithIgnoreCase matches a URL scheme ignoring case.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0039';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The upper case scheme prefix matches the lower case URL.
      expect(StringUtils.startsWithIgnoreCase('https://example.com', 'HTTPS://')).assertTrue();
      // The exact scheme prefix matches directly.
      expect(StringUtils.startsWithIgnoreCase('https://example.com', 'https://')).assertTrue();
      // A different scheme does not match.
      expect(StringUtils.startsWithIgnoreCase('https://example.com', 'HTTP://')).assertFalse();
      // The host part also matches ignoring case.
      expect(StringUtils.startsWithIgnoreCase('https://example.com', 'HTTPS://EXAMPLE')).assertTrue();
      // A wrong host prefix does not match.
      expect(StringUtils.startsWithIgnoreCase('https://example.com', 'HTTPS://EXAMPLES')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_4000
     * @tc.name      testNumStrMatch0040
     * @tc.desc      Verify startsWithIgnoreCase matches digit led mixed case heads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0040';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A digit led lower case prefix matches the upper case head.
      expect(StringUtils.startsWithIgnoreCase('1A2B3C', '1a2b')).assertTrue();
      // The full value in lower case matches too.
      expect(StringUtils.startsWithIgnoreCase('1A2B3C', '1a2b3c')).assertTrue();
      // A wrong digit prefix does not match.
      expect(StringUtils.startsWithIgnoreCase('1A2B3C', '2b')).assertFalse();
      // The digit led head matches its upper case prefix.
      expect(StringUtils.startsWithIgnoreCase('1A2B3C', '1A2B')).assertTrue();
      // A prefix of one digit matches the single digit head.
      expect(StringUtils.startsWithIgnoreCase('1A2B3C', '1')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_4100
     * @tc.name      testNumStrMatch0041
     * @tc.desc      Verify startsWithIgnoreCase compares equal length prefixes by content only.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0041';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Equal length prefixes with different content do not match.
      expect(StringUtils.startsWithIgnoreCase('abc', 'abd')).assertFalse();
      // The same letters in upper case match ignoring case.
      expect(StringUtils.startsWithIgnoreCase('abc', 'ABC')).assertTrue();
      // Mixed case spellings match as well.
      expect(StringUtils.startsWithIgnoreCase('abc', 'Abc')).assertTrue();
      // A different final letter in upper case still fails.
      expect(StringUtils.startsWithIgnoreCase('abc', 'ABD')).assertFalse();
      // A single letter prefix matches the single letter head.
      expect(StringUtils.startsWithIgnoreCase('abc', 'A')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_4200
     * @tc.name      testNumStrMatch0042
     * @tc.desc      Verify startsWithIgnoreCase matches two letter mixed case heads.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0042';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A two letter mixed case prefix matches the same letters.
      expect(StringUtils.startsWithIgnoreCase('xff', 'xF')).assertTrue();
      // The exact case prefix matches directly.
      expect(StringUtils.startsWithIgnoreCase('xff', 'xf')).assertTrue();
      // Reversed letters do not match.
      expect(StringUtils.startsWithIgnoreCase('xff', 'FX')).assertFalse();
      // The full value in upper case matches as well.
      expect(StringUtils.startsWithIgnoreCase('xff', 'XFF')).assertTrue();
      // A single letter prefix matches the first letter.
      expect(StringUtils.startsWithIgnoreCase('xff', 'X')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_4300
     * @tc.name      testNumStrMatch0043
     * @tc.desc      Verify startsWithIgnoreCase matches dotted address prefixes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0043';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A dotted prefix matches the address head.
      expect(StringUtils.startsWithIgnoreCase('0.1.2.3', '0.1.')).assertTrue();
      // A wrong octet prefix does not match.
      expect(StringUtils.startsWithIgnoreCase('0.1.2.3', '0.2.')).assertFalse();
      // A shorter dotted prefix matches as well.
      expect(StringUtils.startsWithIgnoreCase('0.1.2.3', '0.1')).assertTrue();
      // The full address matches itself.
      expect(StringUtils.startsWithIgnoreCase('0.1.2.3', '0.1.2.3')).assertTrue();
      // A longer prefix is rejected.
      expect(StringUtils.startsWithIgnoreCase('0.1.2.3', '0.1.2.3.4')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_4400
     * @tc.name      testNumStrMatch0044
     * @tc.desc      Verify startsWithIgnoreCase matches hyphenated key prefixes ignoring case.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0044';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A lower case prefix matches the upper case head of the key.
      expect(StringUtils.startsWithIgnoreCase('Session-Key-2026', 'session')).assertTrue();
      // The longer prefix including the dash matches too.
      expect(StringUtils.startsWithIgnoreCase('Session-Key-2026', 'SESSION-KEY')).assertTrue();
      // The second word alone does not match the head.
      expect(StringUtils.startsWithIgnoreCase('Session-Key-2026', 'key')).assertFalse();
      // The full key matches itself ignoring case.
      expect(StringUtils.startsWithIgnoreCase('Session-Key-2026', 'session-key-2026')).assertTrue();
      // The numeric tail alone does not match the head.
      expect(StringUtils.startsWithIgnoreCase('Session-Key-2026', '2026')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_4500
     * @tc.name      testNumStrMatch0045
     * @tc.desc      Verify endWithIgnoreCase matches a file extension in any letter case.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrMatch0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrMatch0045';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A lower case extension matches the upper case suffix.
      expect(StringUtils.endWithIgnoreCase('report.TXT', '.txt')).assertTrue();
      // The exact case extension matches directly.
      expect(StringUtils.endWithIgnoreCase('report.TXT', '.TXT')).assertTrue();
      // A mixed case extension matches as well.
      expect(StringUtils.endWithIgnoreCase('report.TXT', '.Txt')).assertTrue();
      // A different extension does not match.
      expect(StringUtils.endWithIgnoreCase('report.TXT', '.pdf')).assertFalse();
      // The name part alone does not match the tail.
      expect(StringUtils.endWithIgnoreCase('report.TXT', 'report')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_4600
     * @tc.name      testNumStrMatch0046
     * @tc.desc      Verify endWithIgnoreCase matches the bare extension letters and rejects reversals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0046';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The bare extension letters match the tail ignoring case.
      expect(StringUtils.endWithIgnoreCase('report.TXT', 'TXT')).assertTrue();
      // The lower case variant matches too.
      expect(StringUtils.endWithIgnoreCase('report.TXT', 'txt')).assertTrue();
      // The reversed letter pair does not match the tail.
      expect(StringUtils.endWithIgnoreCase('report.TXT', 'TX')).assertFalse();
      // The two letter tail without the dot matches ignoring case.
      expect(StringUtils.endWithIgnoreCase('report.TXT', 'XT')).assertTrue();
      // A single letter suffix matches the final letter.
      expect(StringUtils.endWithIgnoreCase('report.TXT', 'T')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_4700
     * @tc.name      testNumStrMatch0047
     * @tc.desc      Verify endWithIgnoreCase rejects wrong extensions and accepts the empty suffix.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0047';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A wrong extension does not match the tail.
      expect(StringUtils.endWithIgnoreCase('report.TXT', '.log')).assertFalse();
      // An empty suffix always matches the tail of any value.
      expect(StringUtils.endWithIgnoreCase('report.TXT', '')).assertTrue();
      // An empty suffix matches an empty value as well.
      expect(StringUtils.endWithIgnoreCase('', '')).assertTrue();
      // A wrong extension on an empty value is rejected.
      expect(StringUtils.endWithIgnoreCase('', '.log')).assertFalse();
      // The extension letters without the dot still match.
      expect(StringUtils.endWithIgnoreCase('report.TXT', 'TXT')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_4800
     * @tc.name      testNumStrMatch0048
     * @tc.desc      Verify endWithIgnoreCase handles empty value and equal length boundaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0048';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two empty values match at the boundary.
      expect(StringUtils.endWithIgnoreCase('', '')).assertTrue();
      // A non empty suffix cannot match an empty value.
      expect(StringUtils.endWithIgnoreCase('', 'x')).assertFalse();
      // A value matches a suffix of its own full length.
      expect(StringUtils.endWithIgnoreCase('abc', 'abc')).assertTrue();
      // The same match works in upper case too.
      expect(StringUtils.endWithIgnoreCase('abc', 'ABC')).assertTrue();
      // A longer suffix cannot match a shorter value.
      expect(StringUtils.endWithIgnoreCase('abc', 'abcd')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_4900
     * @tc.name      testNumStrMatch0049
     * @tc.desc      Verify endWithIgnoreCase rejects suffixes longer than the value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0049';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A four character suffix cannot match a three character value.
      expect(StringUtils.endWithIgnoreCase('abc', 'abcd')).assertFalse();
      // A one character suffix cannot match an empty value.
      expect(StringUtils.endWithIgnoreCase('', 'a')).assertFalse();
      // A ten character suffix cannot match a two character value.
      expect(StringUtils.endWithIgnoreCase('ab', 'cdefghijkl')).assertFalse();
      // The equal length suffix matches for contrast.
      expect(StringUtils.endWithIgnoreCase('ab', 'AB')).assertTrue();
      // A single character suffix matches the last character.
      expect(StringUtils.endWithIgnoreCase('ab', 'B')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_5000
     * @tc.name      testNumStrMatch0050
     * @tc.desc      Verify endWithIgnoreCase matches a year suffix on an upper case id.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0050';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The lower case id suffix matches the upper case tail.
      expect(StringUtils.endWithIgnoreCase('CERT2026', 'cert2026')).assertTrue();
      // A mixed case spelling matches as well.
      expect(StringUtils.endWithIgnoreCase('CERT2026', 'Cert2026')).assertTrue();
      // The bare year digits match the numeric tail.
      expect(StringUtils.endWithIgnoreCase('CERT2026', '2026')).assertTrue();
      // The last two digits alone match too.
      expect(StringUtils.endWithIgnoreCase('CERT2026', '26')).assertTrue();
      // A wrong year does not match.
      expect(StringUtils.endWithIgnoreCase('CERT2026', '2025')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_5100
     * @tc.name      testNumStrMatch0051
     * @tc.desc      Verify endWithIgnoreCase matches three letter mixed case tails.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0051';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A mixed case suffix matches the tail letters.
      expect(StringUtils.endWithIgnoreCase('aBcD', 'BcD')).assertTrue();
      // The lower case variant matches too.
      expect(StringUtils.endWithIgnoreCase('aBcD', 'bcd')).assertTrue();
      // The full value in upper case matches as well.
      expect(StringUtils.endWithIgnoreCase('aBcD', 'ABCD')).assertTrue();
      // A wrong letter order does not match.
      expect(StringUtils.endWithIgnoreCase('aBcD', 'DcB')).assertFalse();
      // The first letter alone does not match the tail.
      expect(StringUtils.endWithIgnoreCase('aBcD', 'A')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_5200
     * @tc.name      testNumStrMatch0052
     * @tc.desc      Verify endWithIgnoreCase matches numeric dotted address tails.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0052';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The dotted last octet matches the address tail.
      expect(StringUtils.endWithIgnoreCase('1.2.3.4', '.4')).assertTrue();
      // The bare last digit matches too.
      expect(StringUtils.endWithIgnoreCase('1.2.3.4', '4')).assertTrue();
      // A wrong octet does not match.
      expect(StringUtils.endWithIgnoreCase('1.2.3.4', '.3')).assertFalse();
      // The last two octets match as a longer suffix.
      expect(StringUtils.endWithIgnoreCase('1.2.3.4', '3.4')).assertTrue();
      // The first octet alone does not match the tail.
      expect(StringUtils.endWithIgnoreCase('1.2.3.4', '1.')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_5300
     * @tc.name      testNumStrMatch0053
     * @tc.desc      Verify endWithIgnoreCase with near miss suffixes on a dotted address.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0053';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A three character suffix with a wrong dot position does not match.
      expect(StringUtils.endWithIgnoreCase('1.2.3.4', '.34')).assertFalse();
      // A three character suffix that repeats the last octet fails.
      expect(StringUtils.endWithIgnoreCase('1.2.3.4', '.44')).assertFalse();
      // The correct three character suffix matches the tail.
      expect(StringUtils.endWithIgnoreCase('1.2.3.4', '3.4')).assertTrue();
      // The four character tail with the leading dot matches too.
      expect(StringUtils.endWithIgnoreCase('1.2.3.4', '.3.4')).assertTrue();
      // A longer suffix than the value is rejected.
      expect(StringUtils.endWithIgnoreCase('1.2.3.4', '2.3.4.5')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_5400
     * @tc.name      testNumStrMatch0054
     * @tc.desc      Verify endWithIgnoreCase matches a host suffix ignoring case.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0054';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The lower case host matches the upper case tail.
      expect(StringUtils.endWithIgnoreCase('HTTP://EXAMPLE.COM', 'example.com')).assertTrue();
      // A mixed case host matches as well.
      expect(StringUtils.endWithIgnoreCase('HTTP://EXAMPLE.COM', 'Example.Com')).assertTrue();
      // A wrong top level domain does not match.
      expect(StringUtils.endWithIgnoreCase('HTTP://EXAMPLE.COM', 'example.org')).assertFalse();
      // The top level domain alone matches the tail.
      expect(StringUtils.endWithIgnoreCase('HTTP://EXAMPLE.COM', '.com')).assertTrue();
      // The scheme part does not match the tail.
      expect(StringUtils.endWithIgnoreCase('HTTP://EXAMPLE.COM', 'http://')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_5500
     * @tc.name      testNumStrMatch0055
     * @tc.desc      Verify endWithIgnoreCase matches source file extensions ignoring case.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0055';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The lower case extension matches the upper case suffix.
      expect(StringUtils.endWithIgnoreCase('file.ETS', '.ets')).assertTrue();
      // The exact case extension matches directly.
      expect(StringUtils.endWithIgnoreCase('file.ETS', '.ETS')).assertTrue();
      // The bare extension letters match too.
      expect(StringUtils.endWithIgnoreCase('file.ETS', 'ets')).assertTrue();
      // A wrong longer extension does not match.
      expect(StringUtils.endWithIgnoreCase('file.ETS', '.ets7')).assertFalse();
      // The file name alone does not match the tail.
      expect(StringUtils.endWithIgnoreCase('file.ETS', 'file')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_5600
     * @tc.name      testNumStrMatch0056
     * @tc.desc      Verify countMatches counts single letter hits case sensitively.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrMatch0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrMatch0056';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The uppercase letter appears twice in the five character value.
      expect(StringUtils.countMatches('aXbXc', 'X')).assertEqual(2);
      // The lowercase letter never matches the uppercase hits.
      expect(StringUtils.countMatches('aXbXc', 'x')).assertEqual(0);
      // The leading letter appears once.
      expect(StringUtils.countMatches('aXbXc', 'a')).assertEqual(1);
      // A missing letter has zero matches.
      expect(StringUtils.countMatches('aXbXc', 'z')).assertEqual(0);
      // A two letter pattern covering two neighbors appears once.
      expect(StringUtils.countMatches('aXbXc', 'Xb')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_5700
     * @tc.name      testNumStrMatch0057
     * @tc.desc      Verify countMatches skips overlapping hits when counting.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrMatch0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrMatch0057';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three letters fit one non overlapping two letter pattern.
      expect(StringUtils.countMatches('aaa', 'aa')).assertEqual(1);
      // Four letters fit two non overlapping hits.
      expect(StringUtils.countMatches('aaaa', 'aa')).assertEqual(2);
      // Five letters still fit only two hits.
      expect(StringUtils.countMatches('aaaaa', 'aa')).assertEqual(2);
      // Six letters fit three hits.
      expect(StringUtils.countMatches('aaaaaa', 'aa')).assertEqual(3);
      // A single letter cannot fit a two letter pattern.
      expect(StringUtils.countMatches('a', 'aa')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_5800
     * @tc.name      testNumStrMatch0058
     * @tc.desc      Verify countMatches guards against empty patterns.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumStrMatch0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumStrMatch0058';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty pattern never matches inside a non empty value.
      expect(StringUtils.countMatches('abc', '')).assertEqual(0);
      // An empty pattern inside an empty value also yields zero.
      expect(StringUtils.countMatches('', '')).assertEqual(0);
      // An empty pattern inside a single character yields zero.
      expect(StringUtils.countMatches('a', '')).assertEqual(0);
      // An empty pattern inside a long value still yields zero.
      expect(StringUtils.countMatches('0123456789', '')).assertEqual(0);
      // A real pattern in the same value finds its hits.
      expect(StringUtils.countMatches('0123456789', '0')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_5900
     * @tc.name      testNumStrMatch0059
     * @tc.desc      Verify countMatches on an empty value always yields zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0059';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single letter pattern finds nothing in an empty value.
      expect(StringUtils.countMatches('', 'x')).assertEqual(0);
      // A two letter pattern finds nothing as well.
      expect(StringUtils.countMatches('', 'xx')).assertEqual(0);
      // An empty pattern in an empty value yields zero by the guard.
      expect(StringUtils.countMatches('', '')).assertEqual(0);
      // A real hit in a one character value contrasts the empty case.
      expect(StringUtils.countMatches('x', 'x')).assertEqual(1);
      // A longer pattern than the value also yields zero.
      expect(StringUtils.countMatches('x', 'xx')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_6000
     * @tc.name      testNumStrMatch0060
     * @tc.desc      Verify countMatches counts three letter pattern hits across repeated words.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0060';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two concatenated words hold two three letter hits.
      expect(StringUtils.countMatches('abcabc', 'abc')).assertEqual(2);
      // Three concatenated words hold three hits.
      expect(StringUtils.countMatches('abcabcabc', 'abc')).assertEqual(3);
      // A single word holds exactly one hit.
      expect(StringUtils.countMatches('abc', 'abc')).assertEqual(1);
      // The whole value matches itself once.
      expect(StringUtils.countMatches('abcabc', 'abcabc')).assertEqual(1);
      // A longer pattern than the value yields zero.
      expect(StringUtils.countMatches('abc', 'abcabc')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_6100
     * @tc.name      testNumStrMatch0061
     * @tc.desc      Verify countMatches with a doubled letter pattern on short values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0061';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A single letter cannot hold a two letter pattern.
      expect(StringUtils.countMatches('x', 'xx')).assertEqual(0);
      // Two letters hold exactly one hit.
      expect(StringUtils.countMatches('xx', 'xx')).assertEqual(1);
      // Three letters still hold one non overlapping hit.
      expect(StringUtils.countMatches('xxx', 'xx')).assertEqual(1);
      // Four letters hold two hits.
      expect(StringUtils.countMatches('xxxx', 'xx')).assertEqual(2);
      // Five letters hold two hits with one letter left over.
      expect(StringUtils.countMatches('xxxxx', 'xx')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_6200
     * @tc.name      testNumStrMatch0062
     * @tc.desc      Verify countMatches with a doubled dot pattern across dot runs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0062';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Five dots hold two non overlapping double dot hits.
      expect(StringUtils.countMatches('.....', '..')).assertEqual(2);
      // Six dots hold three hits.
      expect(StringUtils.countMatches('......', '..')).assertEqual(3);
      // Four dots hold two hits.
      expect(StringUtils.countMatches('....', '..')).assertEqual(2);
      // Three dots hold one hit.
      expect(StringUtils.countMatches('...', '..')).assertEqual(1);
      // Two dots hold exactly one hit.
      expect(StringUtils.countMatches('..', '..')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_6300
     * @tc.name      testNumStrMatch0063
     * @tc.desc      Verify countMatches counts every occurrence of a single digit.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0063';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three ones in a row hold three single digit hits.
      expect(StringUtils.countMatches('111', '1')).assertEqual(3);
      // Four ones hold four hits.
      expect(StringUtils.countMatches('1111', '1')).assertEqual(4);
      // A one zero one pattern holds two hits.
      expect(StringUtils.countMatches('101', '1')).assertEqual(2);
      // A two digit pattern fits once in three ones.
      expect(StringUtils.countMatches('111', '11')).assertEqual(1);
      // A missing digit yields zero hits.
      expect(StringUtils.countMatches('101', '2')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_6400
     * @tc.name      testNumStrMatch0064
     * @tc.desc      Verify countMatches with a three character pattern crossing digit separators.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0064';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The second candidate overlaps the first and must not be counted.
      expect(StringUtils.countMatches('0-0-0-0', '-0-')).assertEqual(1);
      // The pattern alone matches itself once.
      expect(StringUtils.countMatches('-0-', '-0-')).assertEqual(1);
      // A shorter alternating value holds one hit.
      expect(StringUtils.countMatches('0-0-0', '-0-')).assertEqual(1);
      // The two character dash digit pattern hits three times.
      expect(StringUtils.countMatches('0-0-0-0', '-0')).assertEqual(3);
      // The single dash appears three times as well.
      expect(StringUtils.countMatches('0-0-0-0', '-')).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_6500
     * @tc.name      testNumStrMatch0065
     * @tc.desc      Verify countMatches with a triple letter pattern across letter runs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0065';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Six letters hold two non overlapping three letter hits.
      expect(StringUtils.countMatches('aaaaaa', 'aaa')).assertEqual(2);
      // Seven letters still hold two hits.
      expect(StringUtils.countMatches('aaaaaaa', 'aaa')).assertEqual(2);
      // Nine letters hold three hits.
      expect(StringUtils.countMatches('aaaaaaaaa', 'aaa')).assertEqual(3);
      // Five letters hold one hit with two letters left over.
      expect(StringUtils.countMatches('aaaaa', 'aaa')).assertEqual(1);
      // Three letters hold exactly one hit.
      expect(StringUtils.countMatches('aaa', 'aaa')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_6600
     * @tc.name      testNumStrMatch0066
     * @tc.desc      Verify countMatches counts word hits case sensitively.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0066';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two concatenated title case words hold two word hits.
      expect(StringUtils.countMatches('NetworkSecurityNetworkSecurity', 'Network')).assertEqual(2);
      // A single title case word holds one hit.
      expect(StringUtils.countMatches('NetworkSecurity', 'Network')).assertEqual(1);
      // A lower and upper case mix never matches the title case word.
      expect(StringUtils.countMatches('networkNETWORK', 'Network')).assertEqual(0);
      // The lower case word matches a lower case pattern once.
      expect(StringUtils.countMatches('networkNETWORK', 'network')).assertEqual(1);
      // The upper case word matches an upper case pattern once.
      expect(StringUtils.countMatches('networkNETWORK', 'NETWORK')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_6700
     * @tc.name      testNumStrMatch0067
     * @tc.desc      Verify startsWithIgnoreCase and endWithIgnoreCase agree on a URL from both ends.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0067';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const url: string = 'https://example.com';
      // The upper case scheme matches at the head of the URL.
      expect(StringUtils.startsWithIgnoreCase(url, 'HTTPS')).assertTrue();
      // The lower case domain matches at the tail of the URL.
      expect(StringUtils.endWithIgnoreCase(url, '.com')).assertTrue();
      // A wrong head candidate does not match.
      expect(StringUtils.startsWithIgnoreCase(url, 'http://x')).assertFalse();
      // A wrong tail candidate does not match.
      expect(StringUtils.endWithIgnoreCase(url, '.org')).assertFalse();
      // Both ends match simultaneously for the same value.
      expect(StringUtils.startsWithIgnoreCase(url, 'https://') && StringUtils.endWithIgnoreCase(url, 'le.com')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_6800
     * @tc.name      testNumStrMatch0068
     * @tc.desc      Verify isEmpty, isBlank and trimToNull agree on the same boundary inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0068';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Whitespace only input is blank and collapses to null but is not empty.
      expect(StringUtils.isBlank('   ')).assertTrue();
      expect(StringUtils.trimToNull('   ')).assertNull();
      expect(StringUtils.isEmpty('   ')).assertFalse();
      // Padded text survives trimming and stays visible and non blank.
      expect(StringUtils.trimToNull(' value ')).assertEqual('value');
      expect(StringUtils.isBlank(' value ')).assertFalse();
      expect(StringUtils.isEmpty(' value ')).assertFalse();
      // The empty string sits at the intersection of all three helpers.
      expect(StringUtils.isEmpty('')).assertTrue();
      expect(StringUtils.isBlank('')).assertTrue();
      expect(StringUtils.trimToNull('')).assertNull();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_STRMATCH_6900
     * @tc.name      testNumStrMatch0069
     * @tc.desc      Verify countMatches counts hits inside repeated runs built by repeat.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumStrMatch0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumStrMatch0069';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const fourCopies: string = StringUtils.repeat('ab', 4);
      // Four copies of two characters build an eight character run.
      expect(fourCopies.length).assertEqual(8);
      // Each copy contributes exactly one non overlapping hit.
      expect(StringUtils.countMatches(fourCopies, 'ab')).assertEqual(4);
      // Five letters hold two two letter hits with one letter left over.
      expect(StringUtils.countMatches(StringUtils.repeat('a', 5), 'aa')).assertEqual(2);
      // A missing pattern finds nothing inside the repeated run.
      expect(StringUtils.countMatches(StringUtils.repeat('x', 3), 'y')).assertEqual(0);
      // Zero repetitions build an empty value with zero hits.
      expect(StringUtils.countMatches(StringUtils.repeat('ab', 0), 'ab')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
