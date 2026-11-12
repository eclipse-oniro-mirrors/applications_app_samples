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

// The plain ASCII sample reused by several cases.
const PLAIN: string = 'hello world';
// The mixed Chinese and ASCII sample reused by several cases.
const MIXED_TEXT: string = '你好abc';
// The pure Chinese sample reused by several cases.
const CHINESE: string = '中文字符';
// The single space sample used by the whitespace cases.
const ONE_SPACE: string = ' ';
// The tab and newline sample used by the whitespace cases.
const TAB_NEWLINE: string = '\t\n';
// The mixed whitespace sample used by the blank detection cases.
const MIXED_WHITESPACE: string = ' \t\n  ';
// The blank string padded with spaces used by the blank detection cases.
const PAD_BLANK: string = '   ';
// The camelCase identifier used by the kebab conversion cases.
const CAMEL_ID: string = 'helloWorldExample';
// The PascalCase identifier used by the kebab conversion cases.
const PASCAL_ID: string = 'HelloWorld';
// The single word identifier used by the case conversion cases.
const SINGLE_WORD: string = 'hello';
// The upper case identifier used by the kebab conversion cases.
const UPPER_ID: string = 'HTTPServer';
// The kebab case identifier used by the camel conversion cases.
const KEBAB_ID: string = 'hello-world-example';
// The snake case identifier used by the camel conversion cases.
const SNAKE_ID: string = 'hello_world_example';
// The single separator identifier used by the camel conversion cases.
const SINGLE_KEBAB: string = 'hello-world';
// The mixed separator identifier used by the camel conversion cases.
const MIXED_SEPARATOR_ID: string = 'hello-world_test';
// The long ASCII sentence used by the truncation cases.
const LONG_SENTENCE: string = 'The quick brown fox jumps over the lazy dog';
// The three dot suffix used by the truncation cases.
const ELLIPSIS: string = '...';
// The single character pad used by the padding cases.
const PAD_ZERO: string = '0';
// The asterisk pad used by the padding cases.
const PAD_STAR: string = '*';
// The dash pad used by the padding cases.
const PAD_DASH: string = '-';
// The haystack used by the match counting cases.
const HAYSTACK: string = 'ababab';
// The needle used by the match counting cases.
const NEEDLE: string = 'ab';
// The single character needle used by the match counting cases.
const NEEDLE_CHAR: string = 'a';
// The multi character needle used by the match counting cases.
const NEEDLE_LONG: string = 'aba';
// The separator used by the join cases.
const SEPARATOR: string = ',';
// The alternate separator used by the join cases.
const SEPARATOR_DASH: string = '-';
// The empty separator used by the join edge cases.
const SEPARATOR_EMPTY: string = '';
// The repeated token used by the repetition cases.
const TOKEN: string = 'ab';
// The single character token used by the repetition cases.
const TOKEN_ONE: string = 'x';
// The fallback text used by the default value cases.
const FALLBACK: string = 'fallback';
// The alternative fallback text used by the default value cases.
const FALLBACK_TWO: string = 'unknown';

// Logs one structured case progress line into hilog under the case TAG.
function logCase(tag: string, detail: string): void {
  // Compose and print the case detail line.
  hilog.info(DOMAIN, tag, '%{public}s', BUNDLE + tag + ', ' + detail);
}

// Builds a text of the requested length by repeating the fill marker.
function buildText(length: number, marker: string): string {
  // Accumulate the repeated marker until the requested length is reached.
  let text: string = '';
  // Keep appending while the text is still too short.
  while (text.length < length) {
    // Append one more copy of the marker.
    text += marker;
  }
  // Cut the composed text down to the exact requested length.
  return text.substring(0, length);
}

// Registers every on-device logic test case of the advanced string helpers.
export default function stringUtilsAdvancedTest() {
  // Group the cases under the "StringUtilsAdvancedSuite" describe block.
  describe('StringUtilsAdvancedSuite', () => {
    // Log the suite start marker before the first case runs.
    beforeAll(async () => {
      // Print the suite begin line into hilog.
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', BUNDLE + 'StringUtilsAdvancedSuite, begin');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STRX_0100
     * @tc.name      testStrxEmptyMatrix0001
     * @tc.desc      Verify isEmpty over a full input matrix of null, undefined, empty, whitespace and visible text values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrxEmptyMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrxEmptyMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the null shaped input of the matrix.
      const nullValue: string | null = null;
      // Prepare the undefined shaped input of the matrix.
      const undefinedValue: string | undefined = undefined;
      // Declare the emptiness results of the matrix rows.
      const results: boolean[] = [];
      // Evaluate the null row of the matrix.
      results.push(StringUtils.isEmpty(nullValue));
      // Evaluate the undefined row of the matrix.
      results.push(StringUtils.isEmpty(undefinedValue));
      // Evaluate the empty string row of the matrix.
      results.push(StringUtils.isEmpty(''));
      // Evaluate the single space row of the matrix.
      results.push(StringUtils.isEmpty(ONE_SPACE));
      // Evaluate the mixed whitespace row of the matrix.
      results.push(StringUtils.isEmpty(MIXED_WHITESPACE));
      // Evaluate the visible text row of the matrix.
      results.push(StringUtils.isEmpty(PLAIN));
      // Evaluate the Chinese text row of the matrix.
      results.push(StringUtils.isEmpty(CHINESE));
      // Log the complete emptiness result matrix.
      logCase(TAG, 'isEmpty matrix: ' + results.join(','));

      // Expect the null row to be reported as empty.
      expect(results[0]).assertTrue();
      // Expect the undefined row to be reported as empty.
      expect(results[1]).assertTrue();
      // Expect the empty string row to be reported as empty.
      expect(results[2]).assertTrue();
      // Expect the single space row to stay non empty because isEmpty ignores whitespace.
      expect(results[3]).assertFalse();
      // Expect the mixed whitespace row to stay non empty.
      expect(results[4]).assertFalse();
      // Expect the visible text row to stay non empty.
      expect(results[5]).assertFalse();
      // Expect the Chinese text row to stay non empty.
      expect(results[6]).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STRX_0200
     * @tc.name      testStrxBlankMatrix0001
     * @tc.desc      Verify isBlank over a matrix of empty, single space, tab, newline and padded whitespace values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrxBlankMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrxBlankMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the null shaped input of the blank matrix.
      const nullValue: string | null = null;
      // Prepare the blank input matrix that must all report blank.
      const blankInputs: string[] = ['', ONE_SPACE, TAB_NEWLINE, MIXED_WHITESPACE, PAD_BLANK];
      // Prepare the haystack input matrix that must all report non blank.
      const visibleInputs: string[] = [' a', PLAIN, CHINESE, MIXED_TEXT, '0'];
      // Walk the blank input matrix.
      for (let i: number = 0; i < blankInputs.length; i++) {
        // Evaluate the current blank candidate.
        const blankResult: boolean = StringUtils.isBlank(blankInputs[i]);
        // Log the blank candidate result with its escaped length.
        logCase(TAG, 'isBlank(blank[' + i + '], len ' + blankInputs[i].length + '): ' + blankResult);
        // Expect the candidate to be reported as blank.
        expect(blankResult).assertTrue();
      }
      // Expect the null input to be reported as blank as well.
      expect(StringUtils.isBlank(nullValue)).assertTrue();
      // Walk the visible input matrix.
      for (let i: number = 0; i < visibleInputs.length; i++) {
        // Evaluate the current visible candidate.
        const visibleResult: boolean = StringUtils.isBlank(visibleInputs[i]);
        // Log the visible candidate result.
        logCase(TAG, 'isBlank(visible[' + i + ']): ' + visibleResult);
        // Expect the candidate to be reported as non blank.
        expect(visibleResult).assertFalse();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STRX_0300
     * @tc.name      testStrxDefaultIfEmpty0001
     * @tc.desc      Verify defaultIfEmpty returns the fallback for null, undefined and empty inputs and keeps visible text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrxDefaultIfEmpty0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrxDefaultIfEmpty0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the null shaped input of the fallback cases.
      const nullValue: string | null = null;
      // Prepare the undefined shaped input of the fallback cases.
      const undefinedValue: string | undefined = undefined;

      // Resolve the fallback for the null input.
      const nullResult: string = StringUtils.defaultIfEmpty(nullValue, FALLBACK);
      // Log the null input resolution.
      logCase(TAG, 'defaultIfEmpty(null): ' + nullResult);
      // Expect the null input to resolve to the fallback.
      expect(nullResult).assertEqual(FALLBACK);

      // Resolve the fallback for the undefined input.
      const undefinedResult: string = StringUtils.defaultIfEmpty(undefinedValue, FALLBACK);
      // Log the undefined input resolution.
      logCase(TAG, 'defaultIfEmpty(undefined): ' + undefinedResult);
      // Expect the undefined input to resolve to the fallback.
      expect(undefinedResult).assertEqual(FALLBACK);

      // Resolve the fallback for the empty string input.
      const emptyResult: string = StringUtils.defaultIfEmpty('', FALLBACK);
      // Log the empty string resolution.
      logCase(TAG, "defaultIfEmpty(''): " + emptyResult);
      // Expect the empty string input to resolve to the fallback.
      expect(emptyResult).assertEqual(FALLBACK);

      // A whitespace only input is not empty and therefore survives.
      const spaceResult: string = StringUtils.defaultIfEmpty(ONE_SPACE, FALLBACK);
      // Log the whitespace input resolution.
      logCase(TAG, 'defaultIfEmpty(space) length: ' + spaceResult.length);
      // Expect the whitespace input to be returned unchanged.
      expect(spaceResult).assertEqual(ONE_SPACE);
      // Expect the whitespace input not to be replaced by the fallback.
      expect(spaceResult === FALLBACK).assertFalse();

      // A visible text input survives untouched.
      const textResult: string = StringUtils.defaultIfEmpty(PLAIN, FALLBACK_TWO);
      // Log the visible text resolution.
      logCase(TAG, 'defaultIfEmpty(plain): ' + textResult);
      // Expect the visible text to be returned unchanged.
      expect(textResult).assertEqual(PLAIN);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STRX_0400
     * @tc.name      testStrxReverse0001
     * @tc.desc      Verify reverse flips short ASCII text, keeps palindromes, reverses multi byte text and rejects double reversal drift.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrxReverse0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrxReverse0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the ASCII reversal matrix of input and expected pairs.
      const asciiInputs: string[] = ['abc', 'ab', 'a', '', 'hello'];
      // Prepare the expected reversal results of the ASCII matrix.
      const asciiExpected: string[] = ['cba', 'ba', 'a', '', 'olleh'];
      // Walk the ASCII reversal matrix.
      for (let i: number = 0; i < asciiInputs.length; i++) {
        // Reverse the current ASCII input.
        const reversed: string = StringUtils.reverse(asciiInputs[i]);
        // Log the current ASCII reversal pair.
        logCase(TAG, 'reverse(ascii[' + i + ']): [' + reversed + ']');
        // Expect the reversal to hit the prepared result.
        expect(reversed).assertEqual(asciiExpected[i]);
      }

      // A palindrome must survive the reversal unchanged.
      const palindrome: string = 'level';
      // Log the palindrome reversal result.
      logCase(TAG, 'reverse(palindrome): ' + StringUtils.reverse(palindrome));
      // Expect the palindrome to be rebuilt identically.
      expect(StringUtils.reverse(palindrome)).assertEqual(palindrome);

      // Reversing twice must restore the original text.
      const doubleReversed: string = StringUtils.reverse(StringUtils.reverse(LONG_SENTENCE));
      // Log the double reversal result length.
      logCase(TAG, 'double reverse length: ' + doubleReversed.length);
      // Expect the double reversal to restore the sentence.
      expect(doubleReversed).assertEqual(LONG_SENTENCE);

      // Reversing multi byte text keeps the code unit count stable.
      const reversedChinese: string = StringUtils.reverse(CHINESE);
      // Log the multi byte reversal result.
      logCase(TAG, 'reverse(chinese): ' + reversedChinese);
      // Expect the multi byte reversal to keep the length.
      expect(reversedChinese.length).assertEqual(CHINESE.length);
      // Expect the multi byte reversal to actually change the text order.
      expect(reversedChinese === CHINESE).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STRX_0500
     * @tc.name      testStrxCapitalize0001
     * @tc.desc      Verify capitalize upper-cases the first character, lower-cases nothing else and handles empty inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrxCapitalize0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrxCapitalize0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the capitalization matrix of input and expected pairs.
      const inputs: string[] = ['hello', 'Hello', 'a', 'hELLO', ''];
      // Prepare the expected capitalization results.
      const expected: string[] = ['Hello', 'Hello', 'A', 'HELLO', ''];
      // Walk the capitalization matrix.
      for (let i: number = 0; i < inputs.length; i++) {
        // Capitalize the current input.
        const result: string = StringUtils.capitalize(inputs[i]);
        // Log the current capitalization pair.
        logCase(TAG, 'capitalize(inputs[' + i + ']): [' + result + ']');
        // Expect the capitalization to hit the prepared result.
        expect(result).assertEqual(expected[i]);
      }

      // Capitalizing an already capitalized text must be idempotent.
      const twice: string = StringUtils.capitalize(StringUtils.capitalize('world'));
      // Log the idempotent capitalization result.
      logCase(TAG, 'double capitalize: ' + twice);
      // Expect the second capitalization pass to change nothing.
      expect(twice).assertEqual('World');

      // Capitalizing a digit first text keeps the digit and the tail.
      const digitFirst: string = StringUtils.capitalize('9lives');
      // Log the digit first capitalization result.
      logCase(TAG, 'capitalize(9lives): ' + digitFirst);
      // Expect the digit first text to stay unchanged.
      expect(digitFirst).assertEqual('9lives');

      // Capitalizing keeps the total length of the text.
      expect(StringUtils.capitalize(LONG_SENTENCE).length).assertEqual(LONG_SENTENCE.length);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STRX_0600
     * @tc.name      testStrxKebabCase0001
     * @tc.desc      Verify toKebabCase inserts a dash before every upper case letter and lower-cases the whole identifier.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrxKebabCase0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrxKebabCase0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the kebab conversion matrix of input and expected pairs.
      const inputs: string[] = [CAMEL_ID, PASCAL_ID, SINGLE_WORD, UPPER_ID, '', 'aB'];
      // Prepare the expected kebab results of the matrix.
      const expected: string[] = ['hello-world-example', '-hello-world', 'hello', '-h-t-t-p-server', '', 'a-b'];
      // Walk the kebab conversion matrix.
      for (let i: number = 0; i < inputs.length; i++) {
        // Convert the current identifier into kebab case.
        const result: string = StringUtils.toKebabCase(inputs[i]);
        // Log the current kebab conversion pair.
        logCase(TAG, 'toKebabCase(inputs[' + i + ']): [' + result + ']');
        // Expect the conversion to hit the prepared result.
        expect(result).assertEqual(expected[i]);
      }

      // The converted identifier must never keep an upper case letter.
      const converted: string = StringUtils.toKebabCase(CAMEL_ID);
      // Log the lower case comparison.
      logCase(TAG, 'kebab equals its lower case: ' + (converted === converted.toLowerCase()));
      // Expect the converted identifier to be fully lower case.
      expect(converted === converted.toLowerCase()).assertTrue();
      // Expect every word of the source identifier to be separated by a dash.
      expect(converted.indexOf('-') > 0).assertTrue();
      // Expect the converted identifier to contain exactly two dashes.
      expect(StringUtils.countMatches(converted, '-')).assertEqual(2);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STRX_0700
     * @tc.name      testStrxCamelCase0001
     * @tc.desc      Verify toCamelCase drops dashes and underscores, upper-cases the following letter and keeps digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrxCamelCase0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrxCamelCase0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the camel conversion matrix of input and expected pairs.
      const inputs: string[] = [KEBAB_ID, SNAKE_ID, SINGLE_KEBAB, MIXED_SEPARATOR_ID, '', SINGLE_WORD];
      // Prepare the expected camel results of the matrix.
      const expected: string[] = ['helloWorldExample', 'helloWorldExample', 'helloWorld', 'helloWorldTest', '',
        'hello'];
      // Walk the camel conversion matrix.
      for (let i: number = 0; i < inputs.length; i++) {
        // Convert the current identifier into camel case.
        const result: string = StringUtils.toCamelCase(inputs[i]);
        // Log the current camel conversion pair.
        logCase(TAG, 'toCamelCase(inputs[' + i + ']): [' + result + ']');
        // Expect the conversion to hit the prepared result.
        expect(result).assertEqual(expected[i]);
      }

      // Conversion drops every separator from the output.
      const converted: string = StringUtils.toCamelCase(MIXED_SEPARATOR_ID);
      // Log the separator removal summary.
      logCase(TAG, 'camel dash count: ' + StringUtils.countMatches(converted, '-') + ', underscore count: ' +
        StringUtils.countMatches(converted, '_'));
      // Expect no dash to survive the conversion.
      expect(StringUtils.countMatches(converted, '-')).assertEqual(0);
      // Expect no underscore to survive the conversion.
      expect(StringUtils.countMatches(converted, '_')).assertEqual(0);

      // A leading separator is dropped before the first letter.
      const leading: string = StringUtils.toCamelCase('-abc');
      // Log the leading separator result.
      logCase(TAG, 'toCamelCase(-abc): ' + leading);
      // Expect the leading separator to be consumed with its upper case letter.
      expect(leading).assertEqual('Abc');

      // A digit after the separator is kept as is.
      const digitTail: string = StringUtils.toCamelCase('a-1b');
      // Log the digit tail result.
      logCase(TAG, 'toCamelCase(a-1b): ' + digitTail);
      // Expect the digit to survive the conversion.
      expect(digitTail).assertEqual('a1b');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STRX_0800
     * @tc.name      testStrxTruncate0001
     * @tc.desc      Verify truncate keeps text inside the limit, cuts text above it and tolerates zero and negative limits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrxTruncate0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrxTruncate0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Text shorter than the limit must be returned untouched.
      const shortResult: string = StringUtils.truncate('abc', 10, ELLIPSIS);
      // Log the short input result.
      logCase(TAG, 'truncate(abc, 10): ' + shortResult);
      // Expect the short input to stay unchanged without a suffix.
      expect(shortResult).assertEqual('abc');

      // Text exactly at the limit must be returned untouched.
      const exactResult: string = StringUtils.truncate('abc', 3, ELLIPSIS);
      // Log the exact limit result.
      logCase(TAG, 'truncate(abc, 3): ' + exactResult);
      // Expect the exact limit input to stay unchanged.
      expect(exactResult).assertEqual('abc');
      // Expect the exact limit input not to gain the suffix.
      expect(exactResult.indexOf(ELLIPSIS)).assertEqual(-1);

      // Text above the limit must be cut and suffixed.
      const cutResult: string = StringUtils.truncate('abcdef', 3, ELLIPSIS);
      // Log the cut result.
      logCase(TAG, 'truncate(abcdef, 3): ' + cutResult);
      // Expect the cut text to keep only the first three characters plus the suffix.
      expect(cutResult).assertEqual('abc' + ELLIPSIS);
      // Expect the cut text to end with the suffix.
      expect(cutResult.endsWith(ELLIPSIS)).assertTrue();

      // A zero limit keeps only the suffix.
      const zeroResult: string = StringUtils.truncate(LONG_SENTENCE, 0, ELLIPSIS);
      // Log the zero limit result.
      logCase(TAG, 'truncate(long, 0): ' + zeroResult);
      // Expect the zero limit result to be the bare suffix.
      expect(zeroResult).assertEqual(ELLIPSIS);

      // A negative limit behaves like a zero limit through substring.
      const negativeResult: string = StringUtils.truncate(LONG_SENTENCE, -1, ELLIPSIS);
      // Log the negative limit result length.
      logCase(TAG, 'truncate(long, -1) length: ' + negativeResult.length);
      // Expect the negative limit result to keep the suffix.
      expect(negativeResult.endsWith(ELLIPSIS)).assertTrue();

      // An empty suffix performs a plain cut.
      const plainCut: string = StringUtils.truncate(LONG_SENTENCE, 5, '');
      // Log the plain cut result.
      logCase(TAG, 'truncate(long, 5, empty): ' + plainCut);
      // Expect the plain cut to keep exactly the first five characters.
      expect(plainCut).assertEqual('The q');
      // Expect the plain cut to drop the remaining characters.
      expect(plainCut.length).assertEqual(5);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STRX_0900
     * @tc.name      testStrxPadStart0001
     * @tc.desc      Verify padStart prepends the pad character up to the target length and leaves longer values untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrxPadStart0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrxPadStart0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Pad the digit sample up to five characters.
      const fiveResult: string = StringUtils.padStart('42', 5, PAD_ZERO);
      // Log the five character padding result.
      logCase(TAG, 'padStart(42, 5, 0): ' + fiveResult);
      // Expect the digit sample to gain three leading zeros.
      expect(fiveResult).assertEqual('00042');
      // Expect the padding result to reach the target length.
      expect(fiveResult.length).assertEqual(5);

      // A value that already reaches the target length is returned untouched.
      const longResult: string = StringUtils.padStart('abcd', 2, PAD_STAR);
      // Log the already long padding result.
      logCase(TAG, 'padStart(abcd, 2): ' + longResult);
      // Expect the long value to stay unchanged.
      expect(longResult).assertEqual('abcd');
      // Expect no pad character to be inserted.
      expect(longResult.indexOf(PAD_STAR)).assertEqual(-1);

      // The exact target length is a no op boundary.
      const exactResult: string = StringUtils.padStart('abc', 3, PAD_DASH);
      // Log the exact boundary result.
      logCase(TAG, 'padStart(abc, 3): ' + exactResult);
      // Expect the exact boundary value to stay unchanged.
      expect(exactResult).assertEqual('abc');

      // An empty value is padded entirely from the pad character.
      const emptyResult: string = StringUtils.padStart('', 4, PAD_STAR);
      // Log the empty value padding result.
      logCase(TAG, 'padStart(empty, 4): ' + emptyResult);
      // Expect the empty value to become four pad characters.
      expect(emptyResult).assertEqual('****');
      // Expect the empty value padding to reach the target length.
      expect(emptyResult.length).assertEqual(4);

      // Padding never truncates an already longer value.
      const neverCut: string = StringUtils.padStart(LONG_SENTENCE, 5, PAD_ZERO);
      // Log the never cut length.
      logCase(TAG, 'padStart(long, 5) length: ' + neverCut.length);
      // Expect the long sentence to keep its original length.
      expect(neverCut.length).assertEqual(LONG_SENTENCE.length);

      // Padding a multi byte value counts code units instead of glyphs.
      const chinesePad: string = StringUtils.padStart('字', 3, PAD_ZERO);
      // Log the multi byte padding result.
      logCase(TAG, 'padStart(chinese, 3): ' + chinesePad);
      // Expect the multi byte padding to reach the target length.
      expect(chinesePad.length).assertEqual(3);
      // Expect the multi byte padding to place the pad characters first.
      expect(chinesePad.endsWith('字')).assertTrue();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STRX_1000
     * @tc.name      testStrxPadEnd0001
     * @tc.desc      Verify padEnd appends the pad character up to the target length and mirrors the padStart boundaries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrxPadEnd0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrxPadEnd0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Pad the short text up to six characters on the right.
      const sixResult: string = StringUtils.padEnd('ab', 6, PAD_STAR);
      // Log the right padding result.
      logCase(TAG, 'padEnd(ab, 6, *): ' + sixResult);
      // Expect the short text to gain four trailing stars.
      expect(sixResult).assertEqual('ab****');
      // Expect the right padding result to reach the target length.
      expect(sixResult.length).assertEqual(6);
      // Expect the original text to stay at the front.
      expect(sixResult.indexOf('ab')).assertEqual(0);

      // A value longer than the target length is returned untouched.
      const longResult: string = StringUtils.padEnd('abcdef', 3, PAD_DASH);
      // Log the long right padding result.
      logCase(TAG, 'padEnd(abcdef, 3): ' + longResult);
      // Expect the long value to stay unchanged.
      expect(longResult).assertEqual('abcdef');

      // The exact target length is a no op boundary as well.
      const exactResult: string = StringUtils.padEnd('abc', 3, PAD_DASH);
      // Log the exact boundary result.
      logCase(TAG, 'padEnd(abc, 3): ' + exactResult);
      // Expect the exact boundary value to stay unchanged.
      expect(exactResult).assertEqual('abc');

      // An empty value is padded entirely on the right.
      const emptyResult: string = StringUtils.padEnd('', 3, PAD_ZERO);
      // Log the empty value right padding result.
      logCase(TAG, 'padEnd(empty, 3): ' + emptyResult);
      // Expect the empty value to become three zeros.
      expect(emptyResult).assertEqual('000');

      // The two padding helpers must mirror each other on the same input.
      const startResult: string = StringUtils.padStart('xy', 5, PAD_DASH);
      // Compute the right padding of the same input.
      const endResult: string = StringUtils.padEnd('xy', 5, PAD_DASH);
      // Log both mirrored padding results.
      logCase(TAG, 'mirror start: ' + startResult + ', end: ' + endResult);
      // Expect both mirrored results to keep the same length.
      expect(startResult.length).assertEqual(endResult.length);
      // Expect the mirrored results to differ in the pad placement.
      expect(startResult === endResult).assertFalse();
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STRX_1100
     * @tc.name      testStrxCountMatches0001
     * @tc.desc      Verify countMatches counts non overlapping hits and returns zero for empty haystacks or empty needles.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrxCountMatches0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrxCountMatches0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Count the two character needle inside the repeated haystack.
      const pairCount: number = StringUtils.countMatches(HAYSTACK, NEEDLE);
      // Log the pair needle count.
      logCase(TAG, 'countMatches(ababab, ab): ' + pairCount);
      // Expect three non overlapping pairs to be counted.
      expect(pairCount).assertEqual(3);

      // Count the overlapping capable needle which must only count non overlapping hits.
      const longNeedleCount: number = StringUtils.countMatches(HAYSTACK, NEEDLE_LONG);
      // Log the long needle count.
      logCase(TAG, 'countMatches(ababab, aba): ' + longNeedleCount);
      // Expect one non overlapping hit of the long needle.
      expect(longNeedleCount).assertEqual(1);

      // Count the single character needle inside the same haystack.
      const charCount: number = StringUtils.countMatches(HAYSTACK, NEEDLE_CHAR);
      // Log the single character count.
      logCase(TAG, 'countMatches(ababab, a): ' + charCount);
      // Expect three single character hits.
      expect(charCount).assertEqual(3);

      // An empty haystack has nothing to count.
      const emptyHaystack: number = StringUtils.countMatches('', NEEDLE);
      // Log the empty haystack count.
      logCase(TAG, "countMatches('', ab): " + emptyHaystack);
      // Expect the empty haystack to count zero matches.
      expect(emptyHaystack).assertEqual(0);

      // An empty needle is rejected to avoid an endless scan.
      const emptyNeedle: number = StringUtils.countMatches(HAYSTACK, '');
      // Log the empty needle count.
      logCase(TAG, "countMatches(ababab, ''): " + emptyNeedle);
      // Expect the empty needle to count zero matches.
      expect(emptyNeedle).assertEqual(0);

      // A missing needle inside a visible haystack counts zero.
      const missing: number = StringUtils.countMatches(HAYSTACK, 'z');
      // Log the missing needle count.
      logCase(TAG, 'countMatches(ababab, z): ' + missing);
      // Expect the missing needle to count zero matches.
      expect(missing).assertEqual(0);

      // Counting the whole haystack as needle returns exactly one hit.
      const whole: number = StringUtils.countMatches(HAYSTACK, HAYSTACK);
      // Log the whole haystack count.
      logCase(TAG, 'countMatches(ababab, ababab): ' + whole);
      // Expect the whole haystack match to be counted once.
      expect(whole).assertEqual(1);

      // The multi byte text counts per occurrence of the needle.
      const chineseCount: number = StringUtils.countMatches(CHINESE + CHINESE, CHINESE);
      // Log the multi byte count.
      logCase(TAG, 'countMatches(chinese x2, chinese): ' + chineseCount);
      // Expect the doubled multi byte text to count two hits.
      expect(chineseCount).assertEqual(2);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STRX_1200
     * @tc.name      testStrxRepeat0001
     * @tc.desc      Verify repeat builds the requested number of copies and returns the empty string for zero or negative counts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrxRepeat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrxRepeat0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Repeat the token three times.
      const threeResult: string = StringUtils.repeat(TOKEN, 3);
      // Log the triple repetition result.
      logCase(TAG, 'repeat(ab, 3): ' + threeResult);
      // Expect the triple repetition to compose the expected text.
      expect(threeResult).assertEqual('ababab');
      // Expect the triple repetition to reach six characters.
      expect(threeResult.length).assertEqual(6);

      // A single repetition returns the token itself.
      const oneResult: string = StringUtils.repeat(TOKEN, 1);
      // Log the single repetition result.
      logCase(TAG, 'repeat(ab, 1): ' + oneResult);
      // Expect the single repetition to equal the token.
      expect(oneResult).assertEqual(TOKEN);

      // Zero repetitions produce the empty string.
      const zeroResult: string = StringUtils.repeat(TOKEN, 0);
      // Log the zero repetition result length.
      logCase(TAG, 'repeat(ab, 0) length: ' + zeroResult.length);
      // Expect the zero repetition to be empty.
      expect(zeroResult).assertEqual('');

      // Negative repetitions are treated like zero.
      const negativeResult: string = StringUtils.repeat(TOKEN, -3);
      // Log the negative repetition result length.
      logCase(TAG, 'repeat(ab, -3) length: ' + negativeResult.length);
      // Expect the negative repetition to be empty.
      expect(negativeResult).assertEqual('');

      // Repeating the empty value never grows the text.
      const emptyResult: string = StringUtils.repeat('', 5);
      // Log the empty value repetition result.
      logCase(TAG, 'repeat(empty, 5): [' + emptyResult + ']');
      // Expect the empty value repetition to stay empty.
      expect(emptyResult).assertEqual('');

      // The repetition count equals the counted match number for a single character token.
      const manyResult: string = StringUtils.repeat(TOKEN_ONE, 7);
      // Log the many repetition result.
      logCase(TAG, 'repeat(x, 7): ' + manyResult);
      // Expect the long repetition to reach seven characters.
      expect(manyResult.length).assertEqual(7);
      // Expect the single character token count to match the repetition number.
      expect(StringUtils.countMatches(manyResult, TOKEN_ONE)).assertEqual(7);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STRX_1300
     * @tc.name      testStrxJoinSkipEmpty0001
     * @tc.desc      Verify joinSkipEmpty drops empty parts, keeps whitespace parts and handles empty part lists and empty separators.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStrxJoinSkipEmpty0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrxJoinSkipEmpty0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Join a mixed part list that contains empty entries.
      const mixedParts: string[] = ['a', '', 'b', '', 'c'];
      // Join the mixed part list with the comma separator.
      const mixedResult: string = StringUtils.joinSkipEmpty(SEPARATOR, mixedParts);
      // Log the mixed join result.
      logCase(TAG, 'joinSkipEmpty(mixed): ' + mixedResult);
      // Expect the empty parts to be dropped and the rest joined.
      expect(mixedResult).assertEqual('a,b,c');

      // Join a part list where every part is empty.
      const allEmpty: string[] = ['', '', ''];
      // Join the fully empty part list with the dash separator.
      const allEmptyResult: string = StringUtils.joinSkipEmpty(SEPARATOR_DASH, allEmpty);
      // Log the fully empty join result.
      logCase(TAG, 'joinSkipEmpty(all empty): [' + allEmptyResult + ']');
      // Expect the fully empty part list to produce the empty string.
      expect(allEmptyResult).assertEqual('');

      // Join an empty part list which has no parts at all.
      const noParts: string[] = [];
      // Join the empty part list with the comma separator.
      const noPartsResult: string = StringUtils.joinSkipEmpty(SEPARATOR, noParts);
      // Log the empty part list result.
      logCase(TAG, 'joinSkipEmpty(no parts): [' + noPartsResult + ']');
      // Expect the empty part list to produce the empty string.
      expect(noPartsResult).assertEqual('');

      // A whitespace part is not empty and therefore survives the filter.
      const spaceParts: string[] = ['a', ONE_SPACE, 'b'];
      // Join the space part list with the dash separator.
      const spaceResult: string = StringUtils.joinSkipEmpty(SEPARATOR_DASH, spaceParts);
      // Log the space part join result length.
      logCase(TAG, 'joinSkipEmpty(space parts) length: ' + spaceResult.length);
      // Expect the whitespace part to be kept between the two letters.
      expect(spaceResult.length).assertEqual(5);

      // An empty separator concatenates the kept parts directly.
      const concatResult: string = StringUtils.joinSkipEmpty(SEPARATOR_EMPTY, mixedParts);
      // Log the empty separator join result.
      logCase(TAG, 'joinSkipEmpty(empty separator): ' + concatResult);
      // Expect the empty separator to concatenate the kept parts.
      expect(concatResult).assertEqual('abc');

      // A single surviving part must not gain a separator.
      const singleParts: string[] = ['', 'only', ''];
      // Join the single surviving part list.
      const singleResult: string = StringUtils.joinSkipEmpty(SEPARATOR, singleParts);
      // Log the single part join result.
      logCase(TAG, 'joinSkipEmpty(single part): ' + singleResult);
      // Expect the single part result to equal the surviving part.
      expect(singleResult).assertEqual('only');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STRX_1400
     * @tc.name      testStrxLengthMatrix0001
     * @tc.desc      Verify the length behaviour of truncate, padStart, padEnd and repeat over a matrix of target lengths.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStrxLengthMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrxLengthMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the target length matrix that drives the padding cases.
      const lengths: number[] = [0, 1, 2, 4, 8, 16];
      // Prepare the base text that is padded inside the matrix.
      const base: string = 'abc';
      // Walk the target length matrix.
      for (let i: number = 0; i < lengths.length; i++) {
        // Read the current target length.
        const target: number = lengths[i];
        // Pad the base text on the left up to the target length.
        const startPadded: string = StringUtils.padStart(base, target, PAD_ZERO);
        // Pad the base text on the right up to the target length.
        const endPadded: string = StringUtils.padEnd(base, target, PAD_STAR);
        // Log the current padding matrix row.
        logCase(TAG, 'padding row ' + target + ': start len ' + startPadded.length + ', end len ' +
          endPadded.length);
        // Expect the left padding to respect the target length as a lower bound.
        expect(startPadded.length >= target || startPadded.length === base.length).assertTrue();
        // Expect the right padding to respect the target length as a lower bound.
        expect(endPadded.length >= target || endPadded.length === base.length).assertTrue();
        // Expect the left padding to never lose characters.
        expect(startPadded.length >= base.length).assertTrue();
        // Expect the right padding to never lose characters.
        expect(endPadded.length >= base.length).assertTrue();
        // Expect the left padding to keep the base text at the tail.
        expect(startPadded.endsWith(base)).assertTrue();
        // Expect the right padding to keep the base text at the head.
        expect(endPadded.indexOf(base)).assertEqual(0);
      }

      // Walk the repetition matrix and check the composed length formula.
      const repeatMatrix: number[] = [0, 1, 2, 5, 10];
      // Walk the repetition matrix.
      for (let i: number = 0; i < repeatMatrix.length; i++) {
        // Read the current repetition count.
        const times: number = repeatMatrix[i];
        // Repeat the two character token the requested number of times.
        const repeated: string = StringUtils.repeat(TOKEN, times);
        // Log the repetition matrix row.
        logCase(TAG, 'repeat row ' + times + ': length ' + repeated.length);
        // Expect the repetition to honour the fixed token width.
        expect(repeated.length).assertEqual(TOKEN.length * times);
      }

      // Walk the truncation matrix and check the produced length bound.
      const limits: number[] = [0, 1, 3, 7];
      // Walk the truncation matrix.
      for (let i: number = 0; i < limits.length; i++) {
        // Read the current truncation limit.
        const limit: number = limits[i];
        // Truncate the long sentence to the current limit.
        const truncated: string = StringUtils.truncate(LONG_SENTENCE, limit, ELLIPSIS);
        // Log the truncation matrix row.
        logCase(TAG, 'truncate row ' + limit + ': length ' + truncated.length);
        // Expect the truncated text to stay inside the limit plus the suffix width.
        expect(truncated.length <= limit + ELLIPSIS.length).assertTrue();
        // Expect the truncated text to end with the suffix because the sentence is long.
        expect(truncated.endsWith(ELLIPSIS)).assertTrue();
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STRX_1500
     * @tc.name      testStrxTextMatrix0001
     * @tc.desc      Verify the emptiness, blank and reversal helpers stay consistent over a shared text sample matrix.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStrxTextMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrxTextMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the shared text sample matrix of the cross helper checks.
      const samples: string[] = ['', ONE_SPACE, MIXED_WHITESPACE, PLAIN, CHINESE, MIXED_TEXT, LONG_SENTENCE];
      // Prepare the expected emptiness flags of the shared matrix.
      const expectedEmpty: boolean[] = [true, false, false, false, false, false, false];
      // Prepare the expected blank flags of the shared matrix.
      const expectedBlank: boolean[] = [true, true, true, false, false, false, false];
      // Walk the shared text sample matrix.
      for (let i: number = 0; i < samples.length; i++) {
        // Read the current sample.
        const sample: string = samples[i];
        // Evaluate the emptiness of the current sample.
        const emptyFlag: boolean = StringUtils.isEmpty(sample);
        // Evaluate the blankness of the current sample.
        const blankFlag: boolean = StringUtils.isBlank(sample);
        // Reverse the current sample twice to check stability.
        const doubleReversed: string = StringUtils.reverse(StringUtils.reverse(sample));
        // Log the current shared matrix row.
        logCase(TAG, 'text matrix[' + i + '] empty ' + emptyFlag + ', blank ' + blankFlag + ', stable ' +
          (doubleReversed === sample));
        // Expect the emptiness flag to match the prepared table.
        expect(emptyFlag).assertEqual(expectedEmpty[i]);
        // Expect the blankness flag to match the prepared table.
        expect(blankFlag).assertEqual(expectedBlank[i]);
        // Expect the double reversal to restore the sample.
        expect(doubleReversed).assertEqual(sample);
        // Expect a blank sample to shift the length with the reversal only by nothing.
        expect(StringUtils.reverse(sample).length).assertEqual(sample.length);
      }

      // A blank sample always defaults to the fallback value.
      for (let i: number = 0; i < samples.length; i++) {
        // Resolve the default value of the current sample.
        const resolved: string = StringUtils.defaultIfEmpty(samples[i], FALLBACK);
        // Log the resolved default value length.
        logCase(TAG, 'default row[' + i + '] length ' + resolved.length);
        // Expect the empty samples to resolve to the fallback.
        if (expectedEmpty[i]) {
          // The empty sample must fall back.
          expect(resolved).assertEqual(FALLBACK);
        } else {
          // The visible sample must survive untouched.
          expect(resolved).assertEqual(samples[i]);
        }
      }
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STRX_1600
     * @tc.name      testStrxIdentifierMatrix0001
     * @tc.desc      Verify the kebab and camel conversions round trip over an identifier matrix built from the same words.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStrxIdentifierMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrxIdentifierMatrix0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Prepare the identifier matrix that drives the camel to kebab conversions.
      const camelIds: string[] = ['helloWorld', 'helloWorldExample', 'a', 'abc', 'fontResourceSample'];
      // Walk the identifier matrix.
      for (let i: number = 0; i < camelIds.length; i++) {
        // Read the current camel identifier.
        const camelId: string = camelIds[i];
        // Convert the identifier into kebab case first.
        const kebabId: string = StringUtils.toKebabCase(camelId);
        // Convert the kebab identifier back into camel case.
        const roundTrip: string = StringUtils.toCamelCase(kebabId);
        // Log the identifier round trip row.
        logCase(TAG, 'identifier row[' + i + '] kebab ' + kebabId + ', back ' + roundTrip);
        // Expect the kebab form to be fully lower case.
        expect(kebabId === kebabId.toLowerCase()).assertTrue();
        // Expect the round trip to restore the camel identifier apart from a leading dash case.
        expect(roundTrip.length > 0).assertTrue();
        // Expect the round trip to keep the character count minus the dashes.
        expect(roundTrip.length).assertEqual(camelId.length);
      }

      // Prepare the kebab matrix that drives the kebab to camel conversions.
      const kebabIds: string[] = ['alpha-beta', 'one-two-three', 'single', 'x-y-z', 'a-b-c-d'];
      // Walk the kebab matrix.
      for (let i: number = 0; i < kebabIds.length; i++) {
        // Read the current kebab identifier.
        const kebabId: string = kebabIds[i];
        // Convert the kebab identifier into camel case.
        const camelId: string = StringUtils.toCamelCase(kebabId);
        // Count the separators of the kebab identifier.
        const separatorCount: number = StringUtils.countMatches(kebabId, '-');
        // Log the reverse identifier row summary.
        logCase(TAG, 'kebab row[' + i + '] length ' + camelId.length + ', separators ' + separatorCount);
        // Expect the camel form to drop every separator.
        expect(StringUtils.countMatches(camelId, '-')).assertEqual(0);
        // Expect the camel form to keep the character count minus the separators.
        expect(camelId.length).assertEqual(kebabId.length - separatorCount);
      }

      // The conversion of a single word identifier is a no op in both directions.
      const singleKebab: string = StringUtils.toKebabCase('single');
      // Log the single word conversion.
      logCase(TAG, 'single word kebab: ' + singleKebab);
      // Expect the single word to stay unchanged in kebab case.
      expect(singleKebab).assertEqual('single');
      // Expect the single word to stay unchanged in camel case.
      expect(StringUtils.toCamelCase('single')).assertEqual('single');
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_FONTRESOURCE_LT_STRX_1700
     * @tc.name      testStrxBoundaryLengths0001
     * @tc.desc      Verify the string helpers at the exact length boundaries of one, zero and the full sentence width.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStrxBoundaryLengths0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      // The hilog tag of this case, identical to the it name and the @tc.name value.
      const TAG: string = 'testStrxBoundaryLengths0001';
      // Log the case start line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');

      // Build a text of one character and verify every helper keeps the width.
      const oneChar: string = buildText(1, TOKEN_ONE);
      // Log the one character text width.
      logCase(TAG, 'one char width: ' + oneChar.length);
      // Expect the built text to hold exactly one character.
      expect(oneChar.length).assertEqual(1);
      // Expect a one character text to be non empty.
      expect(StringUtils.isEmpty(oneChar)).assertFalse();
      // Expect a one character text to be non blank.
      expect(StringUtils.isBlank(oneChar)).assertFalse();
      // Expect the one character reversal to be stable.
      expect(StringUtils.reverse(oneChar)).assertEqual(oneChar);

      // Build a text of forty three characters and check the truncation boundaries.
      const fullWidth: number = LONG_SENTENCE.length;
      // Truncate the sentence at its own width.
      const atWidth: string = StringUtils.truncate(LONG_SENTENCE, fullWidth, ELLIPSIS);
      // Log the sentence width and the truncation result width.
      logCase(TAG, 'sentence width ' + fullWidth + ', truncated width ' + atWidth.length);
      // Expect the sentence to survive truncation at its own width.
      expect(atWidth).assertEqual(LONG_SENTENCE);
      // Expect the truncation at one character less to cut the text.
      expect(StringUtils.truncate(LONG_SENTENCE, fullWidth - 1, ELLIPSIS) === LONG_SENTENCE).assertFalse();

      // Build a long text and verify the repetition width formula.
      const longText: string = buildText(100, TOKEN_ONE);
      // Repeat the long text twice through the helper.
      const repeatedLong: string = StringUtils.repeat(longText, 2);
      // Log the repeated long text width.
      logCase(TAG, 'repeated long width: ' + repeatedLong.length);
      // Expect the repeated long text to double the width.
      expect(repeatedLong.length).assertEqual(200);
      // Expect the repeated long text to start with the original text.
      expect(repeatedLong.indexOf(longText)).assertEqual(0);

      // Count the character occurrences inside the long text.
      const occurrences: number = StringUtils.countMatches(longText, TOKEN_ONE);
      // Log the long text occurrence count.
      logCase(TAG, 'long text occurrences: ' + occurrences);
      // Expect the occurrence count to equal the text width.
      expect(occurrences).assertEqual(100);
      // Log the case end line.
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}

// Also expose the suite function as a named export so either registration style works.
export { stringUtilsAdvancedTest };
