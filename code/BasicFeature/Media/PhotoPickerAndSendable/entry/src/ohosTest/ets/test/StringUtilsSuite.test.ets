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
import { StringUtils } from 'photopickersendable';

/**
 * Registers every text helper case of the shared library.
 * All methods under test are pure static helpers, no ability context is required.
 */
export default function stringUtilsSuiteTest() {
  describe('StringUtilsSuiteTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_STRINGUTIL_0100
     * @tc.name      testStringUtils0001
     * @tc.desc      Verify isEmpty reports true for undefined, null and the
     *               empty string while any visible character keeps it false.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(StringUtils.isEmpty('')).assertTrue();
      expect(StringUtils.isEmpty(undefined)).assertTrue();
      expect(StringUtils.isEmpty(null)).assertTrue();
      expect(StringUtils.isEmpty('a')).assertFalse();
      expect(StringUtils.isEmpty(' ')).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRINGUTIL_0101
     * @tc.name      testStringUtils0002
     * @tc.desc      Verify isBlank treats whitespace only text as blank and
     *               keeps text with one visible character non blank.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(StringUtils.isBlank('   ')).assertTrue();
      expect(StringUtils.isBlank(' \t ')).assertTrue();
      expect(StringUtils.isBlank(undefined)).assertTrue();
      expect(StringUtils.isBlank(null)).assertTrue();
      expect(StringUtils.isBlank(' x ')).assertFalse();
      expect(StringUtils.isBlank('.')).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRINGUTIL_0102
     * @tc.name      testStringUtils0003
     * @tc.desc      Verify trim removes leading and trailing whitespace and
     *               degrades missing text to the empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(StringUtils.trim('  ab  ')).assertEqual('ab');
      expect(StringUtils.trim(' \t\nx\n\t ')).assertEqual('x');
      expect(StringUtils.trim(undefined)).assertEqual('');
      expect(StringUtils.trim(null)).assertEqual('');
      expect(StringUtils.trim('')).assertEqual('');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRINGUTIL_0103
     * @tc.name      testStringUtils0004
     * @tc.desc      Verify upperFirst uppercases only the first character and
     *               returns the empty string for empty input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(StringUtils.upperFirst('hello')).assertEqual('Hello');
      expect(StringUtils.upperFirst('iPhone')).assertEqual('IPhone');
      expect(StringUtils.upperFirst('hELLO')).assertEqual('HELLO');
      expect(StringUtils.upperFirst('9abc')).assertEqual('9abc');
      expect(StringUtils.upperFirst('')).assertEqual('');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRINGUTIL_0104
     * @tc.name      testStringUtils0005
     * @tc.desc      Verify lowerFirst lowercases only the first character and
     *               leaves a leading digit and the tail untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(StringUtils.lowerFirst('Hello')).assertEqual('hello');
      expect(StringUtils.lowerFirst('UPPER')).assertEqual('uPPER');
      expect(StringUtils.lowerFirst('CamelCase')).assertEqual('camelCase');
      expect(StringUtils.lowerFirst('9abc')).assertEqual('9abc');
      expect(StringUtils.lowerFirst('')).assertEqual('');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRINGUTIL_0105
     * @tc.name      testStringUtils0006
     * @tc.desc      Verify repeat concatenates the text, treats non positive
     *               counts as zero repetitions and floors fractional counts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(StringUtils.repeat('ab', 3)).assertEqual('ababab');
      expect(StringUtils.repeat('x', 5)).assertEqual('xxxxx');
      expect(StringUtils.repeat('ab', 2.9)).assertEqual('abab');
      expect(StringUtils.repeat('ab', 0)).assertEqual('');
      expect(StringUtils.repeat('ab', -2)).assertEqual('');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRINGUTIL_0106
     * @tc.name      testStringUtils0007
     * @tc.desc      Verify padStart fills the left side with the space default,
     *               honours a custom filler and keeps long text unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(StringUtils.padStart('7', 3)).assertEqual('  7');
      expect(StringUtils.padStart('7', 3, '0')).assertEqual('007');
      expect(StringUtils.padStart('ab', 2, 'x')).assertEqual('ab');
      expect(StringUtils.padStart('12345', 3, '0')).assertEqual('12345');
      expect(StringUtils.padStart('9', 3, '')).assertEqual('  9');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRINGUTIL_0107
     * @tc.name      testStringUtils0008
     * @tc.desc      Verify padEnd fills the right side, falls back to spaces
     *               for an empty filler and never shortens the input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(StringUtils.padEnd('7', 3)).assertEqual('7  ');
      expect(StringUtils.padEnd('7', 3, '.')).assertEqual('7..');
      expect(StringUtils.padEnd('9', 4, '')).assertEqual('9   ');
      expect(StringUtils.padEnd('12345', 3)).assertEqual('12345');
      expect(StringUtils.padEnd('ab', 2)).assertEqual('ab');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRINGUTIL_0108
     * @tc.name      testStringUtils0009
     * @tc.desc      Verify reverse flips the character order, keeps a
     *               palindrome stable and maps empty text to empty text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(StringUtils.reverse('abc')).assertEqual('cba');
      expect(StringUtils.reverse('ab')).assertEqual('ba');
      expect(StringUtils.reverse('racecar')).assertEqual('racecar');
      expect(StringUtils.reverse('hello world')).assertEqual('dlrow olleh');
      expect(StringUtils.reverse('')).assertEqual('');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRINGUTIL_0109
     * @tc.name      testStringUtils0010
     * @tc.desc      Verify capitalize uppercases the first character and
     *               lowercases every remaining character.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(StringUtils.capitalize('hELLO world')).assertEqual('Hello world');
      expect(StringUtils.capitalize('javaScript ROCKS')).assertEqual('Javascript rocks');
      expect(StringUtils.capitalize('ABC')).assertEqual('Abc');
      expect(StringUtils.capitalize('a')).assertEqual('A');
      expect(StringUtils.capitalize('')).assertEqual('');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRINGUTIL_0110
     * @tc.name      testStringUtils0011
     * @tc.desc      Verify containsIgnoreCase matches mixed case targets,
     *               rejects a blank target and reports false for missing text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(StringUtils.containsIgnoreCase('Hello World', 'WORLD')).assertTrue();
      expect(StringUtils.containsIgnoreCase('hello', 'LLO')).assertTrue();
      expect(StringUtils.containsIgnoreCase('Hello', 'xyz')).assertFalse();
      expect(StringUtils.containsIgnoreCase('Hello', '')).assertFalse();
      expect(StringUtils.containsIgnoreCase(undefined, 'a')).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRINGUTIL_0111
     * @tc.name      testStringUtils0012
     * @tc.desc      Verify joinWith glues entries with the separator, keeps a
     *               single entry without separator and maps missing lists to
     *               the empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(StringUtils.joinWith(['a', 'b', 'c'], '-')).assertEqual('a-b-c');
      expect(StringUtils.joinWith(['x'], ',')).assertEqual('x');
      const emptyList: string[] = [];
      expect(StringUtils.joinWith(emptyList, ',')).assertEqual('');
      expect(StringUtils.joinWith(undefined, '-')).assertEqual('');
      expect(StringUtils.joinWith(null, ',')).assertEqual('');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRINGUTIL_0112
     * @tc.name      testStringUtils0013
     * @tc.desc      Verify splitSafe drops blank parts, trims the remaining
     *               parts and maps missing text to an empty list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const cleaned: string[] = StringUtils.splitSafe('a, b,,c', ',');
      expect(cleaned.length).assertEqual(3);
      expect(cleaned[0]).assertEqual('a');
      expect(cleaned[1]).assertEqual('b');
      expect(cleaned[2]).assertEqual('c');
      const spaced: string[] = StringUtils.splitSafe(' x | y ', '|');
      expect(spaced.length).assertEqual(2);
      expect(spaced[0]).assertEqual('x');
      expect(spaced[1]).assertEqual('y');
      expect(StringUtils.splitSafe('nosplit', '-').length).assertEqual(1);
      expect(StringUtils.splitSafe('', ',').length).assertEqual(0);
      expect(StringUtils.splitSafe(undefined, ',').length).assertEqual(0);
      expect(StringUtils.splitSafe(null, ',').length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRINGUTIL_0113
     * @tc.name      testStringUtils0014
     * @tc.desc      Verify replaceAll swaps every non overlapping occurrence,
     *               keeps the input for an empty search and returns empty text
     *               for empty input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStringUtils0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(StringUtils.replaceAll('a-b-c', '-', '+')).assertEqual('a+b+c');
      expect(StringUtils.replaceAll('xxyxxy', 'xy', 'z')).assertEqual('xzxz');
      expect(StringUtils.replaceAll('aaa', 'aa', 'b')).assertEqual('ba');
      expect(StringUtils.replaceAll('abc', '', 'x')).assertEqual('abc');
      expect(StringUtils.replaceAll('', 'a', 'b')).assertEqual('');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRINGUTIL_0114
     * @tc.name      testStringUtils0015
     * @tc.desc      Verify toCharCodeHex renders the first character code as
     *               two lowercase hex digits and pads codes below sixteen.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(StringUtils.toCharCodeHex('A')).assertEqual('41');
      expect(StringUtils.toCharCodeHex('a')).assertEqual('61');
      expect(StringUtils.toCharCodeHex('0')).assertEqual('30');
      expect(StringUtils.toCharCodeHex('\t')).assertEqual('09');
      expect(StringUtils.toCharCodeHex('ABC')).assertEqual('41');
      expect(StringUtils.toCharCodeHex('')).assertEqual('');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRINGUTIL_0115
     * @tc.name      testStringUtils0016
     * @tc.desc      Verify ellipsis shortens long text to the limit with the
     *               marker, keeps text at or below the limit unchanged and
     *               maps missing text to the empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStringUtils0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(StringUtils.ellipsis('abcdefghijkl', 8)).assertEqual('abcde...');
      expect(StringUtils.ellipsis('abcdefg', 7)).assertEqual('abcdefg');
      expect(StringUtils.ellipsis('short', 10)).assertEqual('short');
      expect(StringUtils.ellipsis('abc', 0)).assertEqual('');
      expect(StringUtils.ellipsis('abcdef', -5)).assertEqual('');
      expect(StringUtils.ellipsis(undefined, 10)).assertEqual('');
      expect(StringUtils.ellipsis(null, 10)).assertEqual('');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRINGUTIL_0116
     * @tc.name      testStringUtils0017
     * @tc.desc      Verify ellipsis with a tiny limit of at most three still
     *               cuts one character and appends the three dot marker.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(StringUtils.ellipsis('abcdef', 3)).assertEqual('a...');
      expect(StringUtils.ellipsis('abcdef', 2)).assertEqual('a...');
      expect(StringUtils.ellipsis('abcdef', 1)).assertEqual('a...');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRINGUTIL_0117
     * @tc.name      testStringUtils0018
     * @tc.desc      Verify isAsciiAlphanumeric accepts only digit codes and
     *               the hexadecimal letter block a to f after case folding.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStringUtils0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(StringUtils.isAsciiAlphanumeric(65, 48)).assertTrue();
      expect(StringUtils.isAsciiAlphanumeric(97, 102)).assertTrue();
      expect(StringUtils.isAsciiAlphanumeric(48, 57)).assertTrue();
      expect(StringUtils.isAsciiAlphanumeric(71, 48)).assertFalse();
      expect(StringUtils.isAsciiAlphanumeric(103, 48)).assertFalse();
      expect(StringUtils.isAsciiAlphanumeric(45, 48)).assertFalse();
    });
  });
}
