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

// Import the string helpers under test from the library HAR package.
import { StringUtils } from 'library';
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

// Registers every on-device logic test case of the string helpers.
export function stringUtilsTest() {
  // Group the cases under the "StringUtilsSuite" describe block.
  describe('StringUtilsSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'StringUtilsSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STR_0100
     * @tc.name      testStrIsEmpty0100
     * @tc.desc      Verify isEmpty reports true for null, undefined and the empty string and false for a one character string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrIsEmpty0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrIsEmpty0100';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare the null shaped input for the emptiness check.
      const nullValue: string | null = null;
      // Prepare the undefined shaped input for the emptiness check.
      const undefinedValue: string | undefined = undefined;

      // Compute the emptiness result for the null input.
      const nullResult: boolean = StringUtils.isEmpty(nullValue);
      // Log the null input result.
      logCase(TAG, 'isEmpty(null): ' + nullResult);
      // Expect the null input to be reported as empty.
      expect(nullResult).assertTrue();

      // Compute the emptiness result for the undefined input.
      const undefinedResult: boolean = StringUtils.isEmpty(undefinedValue);
      // Log the undefined input result.
      logCase(TAG, 'isEmpty(undefined): ' + undefinedResult);
      // Expect the undefined input to be reported as empty.
      expect(undefinedResult).assertTrue();

      // Compute the emptiness result for the zero length string.
      const emptyResult: boolean = StringUtils.isEmpty('');
      // Log the zero length string result.
      logCase(TAG, "isEmpty(''): " + emptyResult);
      // Expect the zero length string to be reported as empty.
      expect(emptyResult).assertTrue();

      // Compute the emptiness result for the one character string.
      const textResult: boolean = StringUtils.isEmpty('a');
      // Log the one character string result.
      logCase(TAG, "isEmpty('a'): " + textResult);
      // Expect the one character string to be reported as not empty.
      expect(textResult).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STR_0200
     * @tc.name      testStrIsBlank0110
     * @tc.desc      Verify isBlank reports true for whitespace only strings and the empty string and false for a string with visible characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrIsBlank0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrIsBlank0110';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Compute the blank result for the single space string.
      const spaceResult: boolean = StringUtils.isBlank(' ');
      // Log the single space result.
      logCase(TAG, 'isBlank(one space): ' + spaceResult);
      // Expect the single space string to be reported as blank.
      expect(spaceResult).assertTrue();

      // Compute the blank result for the tab character string.
      const tabResult: boolean = StringUtils.isBlank('\t');
      // Log the tab character result.
      logCase(TAG, 'isBlank(tab): ' + tabResult);
      // Expect the tab character string to be reported as blank.
      expect(tabResult).assertTrue();

      // Compute the blank result for a string with visible characters around a space.
      const textResult: boolean = StringUtils.isBlank('a b');
      // Log the visible characters result.
      logCase(TAG, "isBlank('a b'): " + textResult);
      // Expect the string with visible characters to be reported as not blank.
      expect(textResult).assertFalse();

      // Compute the blank result for the zero length string.
      const emptyResult: boolean = StringUtils.isBlank('');
      // Log the zero length string result.
      logCase(TAG, "isBlank(''): " + emptyResult);
      // Expect the zero length string to be reported as blank.
      expect(emptyResult).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STR_0300
     * @tc.name      testStrDefaultIfEmpty0120
     * @tc.desc      Verify defaultIfEmpty returns the fallback for empty, null and undefined inputs and keeps a non-empty original value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrDefaultIfEmpty0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrDefaultIfEmpty0120';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare the undefined shaped input for the fallback check.
      const undefinedInput: string | undefined = undefined;
      // Prepare the null shaped input for the fallback check.
      const nullInput: string | null = null;

      // Compute the fallback result for the zero length string.
      const emptyFallback: string = StringUtils.defaultIfEmpty('', 'fallback');
      // Log the zero length string fallback result.
      logCase(TAG, 'defaultIfEmpty(empty): ' + emptyFallback);
      // Expect the fallback value for the zero length string.
      expect(emptyFallback).assertEqual('fallback');

      // Compute the fallback result for the undefined input.
      const undefinedFallback: string = StringUtils.defaultIfEmpty(undefinedInput, 'fallback');
      // Expect the fallback value for the undefined input.
      expect(undefinedFallback).assertEqual('fallback');

      // Compute the fallback result for the null input.
      const nullFallback: string = StringUtils.defaultIfEmpty(nullInput, 'fallback');
      // Expect the fallback value for the null input.
      expect(nullFallback).assertEqual('fallback');

      // Compute the passthrough result for a non-empty original value.
      const keptOriginal: string = StringUtils.defaultIfEmpty('value', 'fallback');
      // Log the passthrough result.
      logCase(TAG, 'defaultIfEmpty(value): ' + keptOriginal);
      // Expect the original value to be kept for the non-empty input.
      expect(keptOriginal).assertEqual('value');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STR_0400
     * @tc.name      testStrReverse0130
     * @tc.desc      Verify reverse flips the character order for normal inputs and keeps palindromes and the empty string unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrReverse0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrReverse0130';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Compute the reversed result for a three character input.
      const reversedText: string = StringUtils.reverse('abc');
      // Log the reversed result.
      logCase(TAG, "reverse('abc'): " + reversedText);
      // Expect the characters to appear in the opposite order.
      expect(reversedText).assertEqual('cba');

      // Expect a two character input to be swapped as well.
      expect(StringUtils.reverse('ab')).assertEqual('ba');
      // Expect a palindrome to map onto itself.
      expect(StringUtils.reverse('aba')).assertEqual('aba');
      // Expect the zero length string to stay the zero length string.
      expect(StringUtils.reverse('')).assertEqual('');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STR_0500
     * @tc.name      testStrCapitalize0140
     * @tc.desc      Verify capitalize keeps the empty string empty, upper-cases the first letter and leaves an already capitalized word unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrCapitalize0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrCapitalize0140';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Compute the capitalization result for the zero length string.
      const emptyResult: string = StringUtils.capitalize('');
      // Log the zero length string result.
      logCase(TAG, 'capitalize(empty): ' + emptyResult);
      // Expect the zero length string to stay empty.
      expect(emptyResult).assertEqual('');

      // Expect a lower case word to gain an upper case first letter.
      expect(StringUtils.capitalize('hello')).assertEqual('Hello');
      // Expect an already capitalized word to stay unchanged.
      expect(StringUtils.capitalize('Hello')).assertEqual('Hello');
      // Expect only the first character to change in a two word phrase.
      expect(StringUtils.capitalize('hello world')).assertEqual('Hello world');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STR_0600
     * @tc.name      testStrToKebabCase0150
     * @tc.desc      Verify toKebabCase splits camelCase words with dashes into lower case output and keeps plain lower case words unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrToKebabCase0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrToKebabCase0150';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Compute the kebab-case result for a camelCase identifier.
      const kebabText: string = StringUtils.toKebabCase('helloWorld');
      // Log the kebab-case result.
      logCase(TAG, 'toKebabCase(helloWorld): ' + kebabText);
      // Expect a dash between the words and lower case letters overall.
      expect(kebabText).assertEqual('hello-world');

      // Expect a plain lower case word without upper case letters to stay unchanged.
      expect(StringUtils.toKebabCase('hello')).assertEqual('hello');
      // Expect every upper case letter to introduce one dash.
      expect(StringUtils.toKebabCase('helloWorldAgain')).assertEqual('hello-world-again');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STR_0700
     * @tc.name      testStrToCamelCase0160
     * @tc.desc      Verify toCamelCase merges kebab-case and snake_case separators into upper case word starts and lowers a leading upper case letter.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrToCamelCase0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrToCamelCase0160';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Compute the camelCase result for a kebab-case identifier.
      const camelFromKebab: string = StringUtils.toCamelCase('hello-world');
      // Log the kebab-case conversion result.
      logCase(TAG, 'toCamelCase(hello-world): ' + camelFromKebab);
      // Expect the dash to vanish and the second word to start upper case.
      expect(camelFromKebab).assertEqual('helloWorld');

      // Expect the snake_case separator to be handled like the dash.
      expect(StringUtils.toCamelCase('hello_world')).assertEqual('helloWorld');
      // Expect every separator position to merge the following word.
      expect(StringUtils.toCamelCase('font_resource_name')).assertEqual('fontResourceName');
      // Expect a leading upper case letter to be lowered when no separator exists.
      expect(StringUtils.toCamelCase('Hello')).assertEqual('hello');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STR_0800
     * @tc.name      testStrTruncate0170
     * @tc.desc      Verify truncate cuts an overlong value at the limit and appends the suffix and returns shorter or exact limit values untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrTruncate0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrTruncate0170';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Compute the truncation result for an overlong value.
      const cutText: string = StringUtils.truncate('abcdef', 3, '...');
      // Log the truncation result.
      logCase(TAG, 'truncate(abcdef,3): ' + cutText);
      // Expect the head up to the limit followed by the suffix.
      expect(cutText).assertEqual('abc...');

      // Expect a value below the limit to be returned untouched.
      expect(StringUtils.truncate('abc', 5, '...')).assertEqual('abc');
      // Expect a value exactly at the limit to be returned untouched.
      expect(StringUtils.truncate('abc', 3, '...')).assertEqual('abc');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STR_0900
     * @tc.name      testStrPad0180
     * @tc.desc      Verify padStart and padEnd fill missing positions with the pad character and keep values that already reach the target length untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrPad0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrPad0180';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Compute the left padded result for a short value.
      const startPadded: string = StringUtils.padStart('7', 3, '0');
      // Log the left padded result.
      logCase(TAG, 'padStart(7,3): ' + startPadded);
      // Expect the pad characters in front of the value.
      expect(startPadded).assertEqual('007');

      // Expect padStart to keep a value that already matches the target length.
      expect(StringUtils.padStart('123', 3, '0')).assertEqual('123');
      // Expect padStart to keep a value longer than the target length.
      expect(StringUtils.padStart('abcd', 2, '0')).assertEqual('abcd');

      // Expect padEnd to place the pad characters behind the value.
      expect(StringUtils.padEnd('7', 3, '0')).assertEqual('700');
      // Expect padEnd to keep a value that already matches the target length.
      expect(StringUtils.padEnd('123', 3, '0')).assertEqual('123');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STR_1000
     * @tc.name      testStrCountMatches0190
     * @tc.desc      Verify countMatches counts every occurrence, returns zero without a match or an empty search and never overlaps matches.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrCountMatches0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrCountMatches0190';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Compute the match count for a repeating single character.
      const singleCount: number = StringUtils.countMatches('aaa', 'a');
      // Log the single character match count.
      logCase(TAG, "countMatches('aaa','a'): " + singleCount);
      // Expect one count per occurrence.
      expect(singleCount).assertEqual(3);

      // Expect zero for a search text that never occurs.
      expect(StringUtils.countMatches('abc', 'z')).assertEqual(0);
      // Expect zero for an empty search text.
      expect(StringUtils.countMatches('abc', '')).assertEqual(0);
      // Expect non-overlapping counting for a double length search text.
      expect(StringUtils.countMatches('aaaa', 'aa')).assertEqual(2);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STR_1100
     * @tc.name      testStrRepeat0200
     * @tc.desc      Verify repeat returns an empty string for zero and negative counts and concatenates the value once per positive count.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrRepeat0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrRepeat0200';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Compute the repeat result for zero repetitions.
      const zeroRepeat: string = StringUtils.repeat('ab', 0);
      // Log the zero repetition result.
      logCase(TAG, 'repeat(ab,0): ' + zeroRepeat);
      // Expect an empty string for zero repetitions.
      expect(zeroRepeat).assertEqual('');

      // Expect an empty string for a negative repetition count.
      expect(StringUtils.repeat('ab', -3)).assertEqual('');
      // Expect two repetitions to concatenate the value twice.
      expect(StringUtils.repeat('ab', 2)).assertEqual('abab');
      // Expect three repetitions of a single character to build a three character result.
      expect(StringUtils.repeat('x', 3)).assertEqual('xxx');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STR_1200
     * @tc.name      testStrJoinSkipEmpty0210
     * @tc.desc      Verify joinSkipEmpty drops empty parts, keeps the surviving order with separators and yields an empty string when nothing survives.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrJoinSkipEmpty0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrJoinSkipEmpty0210';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Prepare the parts list containing empty entries to skip.
      const mixedParts: string[] = ['a', '', 'b'];

      // Compute the joined result over the mixed parts list.
      const mixedJoined: string = StringUtils.joinSkipEmpty('-', mixedParts);
      // Log the mixed parts join result.
      logCase(TAG, 'joinSkipEmpty(a,empty,b): ' + mixedJoined);
      // Expect the empty part to be skipped and the rest kept in order.
      expect(mixedJoined).assertEqual('a-b');

      // Prepare the parts list containing only empty entries.
      const emptyParts: string[] = ['', '', ''];
      // Expect an empty string when every part is skipped.
      expect(StringUtils.joinSkipEmpty('-', emptyParts)).assertEqual('');
      // Expect a single surviving part to be returned without any separator.
      expect(StringUtils.joinSkipEmpty('-', ['', 'c'])).assertEqual('c');
      // Expect the given separator between every kept part.
      expect(StringUtils.joinSkipEmpty(', ', ['x', 'y'])).assertEqual('x, y');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
