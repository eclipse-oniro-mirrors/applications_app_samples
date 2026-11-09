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
import { hilog } from '@kit.PerformanceAnalysisKit';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;

/**
 * Registers the Chinese text, emoji and long input matrix cases of the
 * string helpers of the shared library. All methods under test are pure
 * static helpers, so no ability context is required.
 */
export default function stringUtilsMatrixTest() {
  describe('StringUtilsMatrixTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_0100
     * @tc.name      testStrMatrix0001
     * @tc.desc      Verify isEmpty keeps Chinese text, surrogate pair emoji,
     *               a NUL character and a long buffer non empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One Chinese character is a visible character.
      expect(StringUtils.isEmpty('\u4E2D')).assertFalse();
      // A surrogate pair emoji carries two code units and is not empty.
      expect(StringUtils.isEmpty('\uD83D\uDE00')).assertFalse();
      // The NUL character is a real character even though it prints blank.
      expect(StringUtils.isEmpty('\u0000')).assertFalse();
      // Build a long buffer of four hundred characters.
      let longText: string = '';
      for (let index: number = 0; index < 200; index++) {
        longText = longText + 'ab';
      }
      expect(longText.length).assertEqual(400);
      expect(StringUtils.isEmpty(longText)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_0200
     * @tc.name      testStrMatrix0002
     * @tc.desc      Verify isBlank treats the ideographic space and every
     *               whitespace mix as blank while one Chinese character is
     *               not blank.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrMatrix0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The ideographic space U+3000 is whitespace for the platform trim.
      expect(StringUtils.isBlank('\u3000')).assertTrue();
      // A mix of tab, newline and carriage return is blank as well.
      expect(StringUtils.isBlank('\t\n\r ')).assertTrue();
      // Two ideographic spaces stay blank.
      expect(StringUtils.isBlank('\u3000\u3000')).assertTrue();
      // One Chinese character is visible content.
      expect(StringUtils.isBlank('\u4E2D\u6587')).assertFalse();
      // A Chinese character surrounded by spaces is not blank.
      expect(StringUtils.isBlank(' \u4E2D ')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_0300
     * @tc.name      testStrMatrix0003
     * @tc.desc      Verify trim removes leading and trailing whitespace of
     *               Chinese text and mixed whitespace but keeps inner spaces.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrMatrix0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Chinese text loses the surrounding spaces only.
      expect(StringUtils.trim(' \u4E2D\u6587 ')).assertEqual('\u4E2D\u6587');
      // Every control whitespace at both ends disappears.
      expect(StringUtils.trim('\t\n\rx\r\n\t')).assertEqual('x');
      // Ideographic spaces at both ends disappear too.
      expect(StringUtils.trim('\u3000a\u3000')).assertEqual('a');
      // The inner space between two words is kept.
      expect(StringUtils.trim(' a b ')).assertEqual('a b');
      // Whitespace only text trims to the empty string.
      expect(StringUtils.trim('   ')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_0400
     * @tc.name      testStrMatrix0004
     * @tc.desc      Verify upperFirst keeps Chinese text, emoji leads, digit
     *               leads and underscore leads unchanged and uppercases a
     *               single lowercase letter.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrMatrix0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Chinese characters have no case, the text is returned unchanged.
      expect(StringUtils.upperFirst('\u4E2D\u6587')).assertEqual('\u4E2D\u6587');
      // The high surrogate has no case mapping so the emoji lead is stable.
      expect(StringUtils.upperFirst('\uD83D\uDE00abc')).assertEqual('\uD83D\uDE00abc');
      // A leading digit stays a digit.
      expect(StringUtils.upperFirst('9lives')).assertEqual('9lives');
      // A leading underscore is not a letter.
      expect(StringUtils.upperFirst('_private')).assertEqual('_private');
      // One lowercase letter becomes uppercase.
      expect(StringUtils.upperFirst('x')).assertEqual('X');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_0500
     * @tc.name      testStrMatrix0005
     * @tc.desc      Verify lowerFirst keeps Chinese text, digit leads and the
     *               empty string unchanged and lowercases one uppercase and
     *               one camel case input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrMatrix0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Chinese characters have no case, the text is returned unchanged.
      expect(StringUtils.lowerFirst('\u4E2D\u6587')).assertEqual('\u4E2D\u6587');
      // The leading uppercase letter drops to lowercase, the tail stays.
      expect(StringUtils.lowerFirst('AbcDef')).assertEqual('abcDef');
      // A leading digit is not a letter and stays unchanged.
      expect(StringUtils.lowerFirst('9lives')).assertEqual('9lives');
      // One uppercase letter becomes lowercase.
      expect(StringUtils.lowerFirst('A')).assertEqual('a');
      // Empty input returns the empty string.
      expect(StringUtils.lowerFirst('')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_0600
     * @tc.name      testStrMatrix0006
     * @tc.desc      Verify repeat concatenates Chinese text, keeps a single
     *           repetition and repeats an emoji by code units.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrMatrix0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three Chinese characters are concatenated in order.
      expect(StringUtils.repeat('\u4E2D', 3)).assertEqual('\u4E2D\u4E2D\u4E2D');
      // One repetition returns the input text itself.
      expect(StringUtils.repeat('ab', 1)).assertEqual('ab');
      // The emoji has two code units, three repetitions keep six.
      expect(StringUtils.repeat('\uD83D\uDE00', 3).length).assertEqual(6);
      // Repeating the empty string stays empty for any count.
      expect(StringUtils.repeat('', 5)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_0700
     * @tc.name      testStrMatrix0007
     * @tc.desc      Verify repeat floors fractional counts, maps non positive
     *               counts to the empty string and scales the length of a
     *               large repetition linearly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStrMatrix0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A fraction below one floors to zero repetitions.
      expect(StringUtils.repeat('ab', 0.5)).assertEqual('');
      // A fraction above one floors down to the lower repetition count.
      expect(StringUtils.repeat('ab', 1.9)).assertEqual('ab');
      expect(StringUtils.repeat('ab', 2.9)).assertEqual('abab');
      // Zero and negative counts produce the empty string.
      expect(StringUtils.repeat('ab', 0)).assertEqual('');
      expect(StringUtils.repeat('ab', -3)).assertEqual('');
      // Five hundred repetitions of a two character text keep one thousand units.
      expect(StringUtils.repeat('ab', 500).length).assertEqual(1000);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_0800
     * @tc.name      testStrMatrix0008
     * @tc.desc      Verify padStart pads Chinese text with a custom filler,
     *               cycles a multi character filler and pads the space
     *               default before Chinese text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrMatrix0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The zero filler goes before the Chinese character.
      expect(StringUtils.padStart('\u4E2D', 3, '0')).assertEqual('00\u4E2D');
      // A two character filler is cut at the requested length.
      expect(StringUtils.padStart('abc', 5, 'xy')).assertEqual('xyabc');
      // The filler cycles and is truncated inside the cycle.
      expect(StringUtils.padStart('1', 4, 'ab')).assertEqual('aba1');
      // The default filler is a space.
      expect(StringUtils.padStart('\u4E2D\u6587', 5)).assertEqual('   \u4E2D\u6587');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_0900
     * @tc.name      testStrMatrix0009
     * @tc.desc      Verify padEnd pads Chinese text with a custom filler,
     *               cycles a multi character filler and appends the space
     *               default after Chinese text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrMatrix0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The zero filler goes after the Chinese character.
      expect(StringUtils.padEnd('\u4E2D', 3, '0')).assertEqual('\u4E2D00');
      // A two character filler is cut at the requested length.
      expect(StringUtils.padEnd('abc', 5, 'xy')).assertEqual('abcxy');
      // The filler cycles and is truncated inside the cycle.
      expect(StringUtils.padEnd('1', 4, 'ab')).assertEqual('1aba');
      // The default filler is a space.
      expect(StringUtils.padEnd('\u4E2D\u6587', 5)).assertEqual('\u4E2D\u6587   ');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_1000
     * @tc.name      testStrMatrix0010
     * @tc.desc      Verify an empty filler falls back to spaces for both pad
     *               helpers and that text longer than the target length is
     *               never shortened.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStrMatrix0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty filler falls back to the space default on the left side.
      expect(StringUtils.padStart('9', 3, '')).assertEqual('  9');
      // The empty filler falls back to the space default on the right side.
      expect(StringUtils.padEnd('9', 3, '')).assertEqual('9  ');
      // Text already longer than the target is never shortened on the left.
      expect(StringUtils.padStart('abc', 2, 'x')).assertEqual('abc');
      // Text already longer than the target is never shortened on the right.
      expect(StringUtils.padEnd('abc', 2, 'x')).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_1100
     * @tc.name      testStrMatrix0011
     * @tc.desc      Verify reverse flips Chinese basic multilingual plane
     *               characters, mixed words, single characters and keeps a
     *               palindrome stable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrMatrix0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two Chinese BMP characters swap their order.
      expect(StringUtils.reverse('\u4E2D\u6587')).assertEqual('\u6587\u4E2D');
      // The Chinese character moves to the front of the latin letters.
      expect(StringUtils.reverse('ab\u4E2D')).assertEqual('\u4E2Dba');
      // A single character reverse maps to itself.
      expect(StringUtils.reverse('x')).assertEqual('x');
      // A palindrome maps to itself.
      expect(StringUtils.reverse('abba')).assertEqual('abba');
      // A space inside the text moves to the other side.
      expect(StringUtils.reverse('a b')).assertEqual('b a');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_1200
     * @tc.name      testStrMatrix0012
     * @tc.desc      Verify reverse keeps the code unit count of surrogate
     *               pair emoji input stable even though the pair order is
     *               flipped by the code unit based algorithm.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStrMatrix0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The emoji has two code units and the reversed text keeps two units.
      expect(StringUtils.reverse('\uD83D\uDE00').length).assertEqual(2);
      // Text with two emoji and one letter keeps four code units.
      expect(StringUtils.reverse('a\uD83D\uDE00b').length).assertEqual(4);
      // The empty string keeps zero code units.
      expect(StringUtils.reverse('').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_1300
     * @tc.name      testStrMatrix0013
     * @tc.desc      Verify capitalize keeps Chinese text and digit leads
     *               unchanged, normalises a mixed case tail and keeps the
     *               leading space of an indented input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrMatrix0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Chinese characters have no case, the text is returned unchanged.
      expect(StringUtils.capitalize('\u4E2D\u6587')).assertEqual('\u4E2D\u6587');
      // The first letter is uppercased and the tail is lowercased.
      expect(StringUtils.capitalize('aBC')).assertEqual('Abc');
      // A digit lead stays a digit and the tail is lowercased.
      expect(StringUtils.capitalize('9abc')).assertEqual('9abc');
      // The leading space has no case and the tail is lowercased.
      expect(StringUtils.capitalize(' hELLO')).assertEqual(' hello');
      // One uppercase letter maps to itself.
      expect(StringUtils.capitalize('A')).assertEqual('A');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_1400
     * @tc.name      testStrMatrix0014
     * @tc.desc      Verify containsIgnoreCase finds Chinese targets, mixed
     *               Chinese and latin targets and rejects a reordered target.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrMatrix0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The Chinese target appears inside the mixed source text.
      expect(StringUtils.containsIgnoreCase('Hello\u4E16\u754C', '\u4E16\u754C')).assertTrue();
      // The latin part of a mixed text matches case insensitive.
      expect(StringUtils.containsIgnoreCase('\u6D4B\u8BD5Test', 'TEST')).assertTrue();
      // A reordered Chinese target is not contained.
      expect(StringUtils.containsIgnoreCase('\u6D4B\u8BD5', '\u8BD5\u6D4B')).assertFalse();
      // A single uppercase letter matches the lowercase occurrence.
      expect(StringUtils.containsIgnoreCase('aBc', 'B')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_1500
     * @tc.name      testStrMatrix0015
     * @tc.desc      Verify containsIgnoreCase reports false for every missing
     *               argument combination and for an empty target.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStrMatrix0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A missing source never matches.
      expect(StringUtils.containsIgnoreCase(null, 'a')).assertFalse();
      // A missing target never matches.
      expect(StringUtils.containsIgnoreCase('abc', null)).assertFalse();
      // Two missing arguments never match.
      expect(StringUtils.containsIgnoreCase(undefined, undefined)).assertFalse();
      // An empty source cannot contain the target.
      expect(StringUtils.containsIgnoreCase('', 'a')).assertFalse();
      // A blank target is rejected by design.
      expect(StringUtils.containsIgnoreCase('abc', '')).assertFalse();
      // Two empty arguments never match.
      expect(StringUtils.containsIgnoreCase('', '')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_1600
     * @tc.name      testStrMatrix0016
     * @tc.desc      Verify joinWith glues Chinese entries, keeps empty string
     *               entries as real entries and joins an emoji entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrMatrix0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two Chinese entries are glued with the dash separator.
      expect(StringUtils.joinWith(['\u4E2D\u6587', '\u6D4B\u8BD5'], '-'))
        .assertEqual('\u4E2D\u6587-\u6D4B\u8BD5');
      // An empty string entry is a real entry, it produces a doubled separator.
      expect(StringUtils.joinWith(['a', '', 'b'], '-')).assertEqual('a--b');
      // An emoji entry is joined like any other text entry.
      expect(StringUtils.joinWith(['\uD83D\uDE00', 'ok'], '+')).assertEqual('\uD83D\uDE00+ok');
      // A single entry carries no separator.
      expect(StringUtils.joinWith(['x'], ',')).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_1700
     * @tc.name      testStrMatrix0017
     * @tc.desc      Verify joinWith supports the empty separator, the
     *               ideographic comma, a multi character separator and an
     *               emoji separator.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStrMatrix0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty separator glues the entries directly.
      expect(StringUtils.joinWith(['a', 'b', 'c'], '')).assertEqual('abc');
      // The ideographic comma is a valid separator.
      expect(StringUtils.joinWith(['a', 'b'], '\uFF0C')).assertEqual('a\uFF0Cb');
      // A multi character separator is inserted between the entries.
      expect(StringUtils.joinWith(['a', 'b'], '::')).assertEqual('a::b');
      // An emoji is a valid separator text.
      expect(StringUtils.joinWith(['a', 'b'], '\uD83D\uDE00')).assertEqual('a\uD83D\uDE00b');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_1800
     * @tc.name      testStrMatrix0018
     * @tc.desc      Verify splitSafe splits Chinese text, honours the
     *               ideographic comma separator and keeps a text without the
     *               separator as one part.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrMatrix0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The Chinese text splits into two parts at the comma.
      const chinese: string[] = StringUtils.splitSafe('\u4E2D\u6587,\u6D4B\u8BD5', ',');
      expect(chinese.length).assertEqual(2);
      expect(chinese[0]).assertEqual('\u4E2D\u6587');
      expect(chinese[1]).assertEqual('\u6D4B\u8BD5');
      // The ideographic comma is a valid separator.
      const wide: string[] = StringUtils.splitSafe('a\uFF0Cb\uFF0Cc', '\uFF0C');
      expect(wide.length).assertEqual(3);
      expect(wide[2]).assertEqual('c');
      // A text without the separator stays one part.
      expect(StringUtils.splitSafe('\u4E2D\u6587', ',').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_1900
     * @tc.name      testStrMatrix0019
     * @tc.desc      Verify splitSafe drops parts between consecutive
     *               separators, drops whitespace only parts, splits by the
     *               empty separator per character and by the space separator.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStrMatrix0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty part between two commas is dropped.
      expect(StringUtils.splitSafe('a,,b', ',').length).assertEqual(2);
      // Whitespace only parts are dropped after trimming.
      expect(StringUtils.splitSafe(' , , ', ',').length).assertEqual(0);
      // The empty separator splits the text per character.
      const chars: string[] = StringUtils.splitSafe('abc', '');
      expect(chars.length).assertEqual(3);
      expect(chars[0]).assertEqual('a');
      expect(chars[2]).assertEqual('c');
      // The space separator splits the words after trimming.
      expect(StringUtils.splitSafe('a b c', ' ').length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_2000
     * @tc.name      testStrMatrix0020
     * @tc.desc      Verify replaceAll swaps every occurrence around Chinese
     *               text, replaces a Chinese search text and maps an empty
     *               input to the empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrMatrix0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Both dashes around the Chinese text are replaced.
      expect(StringUtils.replaceAll('\u4E2D\u6587-\u6D4B\u8BD5-\u4E2D', '-', '+'))
        .assertEqual('\u4E2D\u6587+\u6D4B\u8BD5+\u4E2D');
      // The latin search text between the Chinese parts is replaced.
      expect(StringUtils.replaceAll('\u6D4B\u8BD5abc\u6D4B\u8BD5', 'abc', 'XY'))
        .assertEqual('\u6D4B\u8BD5XY\u6D4B\u8BD5');
      // A Chinese search text is replaced by another Chinese character.
      expect(StringUtils.replaceAll('\u4E2D', '\u4E2D', '\u6587')).assertEqual('\u6587');
      // An empty input cannot be replaced and is returned untouched.
      expect(StringUtils.replaceAll('', 'a', 'b')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_2100
     * @tc.name      testStrMatrix0021
     * @tc.desc      Verify replaceAll treats regex like search texts as plain
     *               characters, respects the overlap semantics of split join
     *               and stays case sensitive.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStrMatrix0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The dot is a plain character, no regex semantics apply.
      expect(StringUtils.replaceAll('a.b.c', '.', '-')).assertEqual('a-b-c');
      // The star is a plain character.
      expect(StringUtils.replaceAll('a*b', '*', '+')).assertEqual('a+b');
      // The question mark is a plain character.
      expect(StringUtils.replaceAll('a?b?c', '?', '!')).assertEqual('a!b!c');
      // Overlapping occurrences are consumed left to right by split join.
      expect(StringUtils.replaceAll('aaa', 'aa', 'b')).assertEqual('ba');
      expect(StringUtils.replaceAll('aaaa', 'aa', 'b')).assertEqual('bb');
      // The replacement is case sensitive.
      expect(StringUtils.replaceAll('AbcAbc', 'Abc', 'x')).assertEqual('xx');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_2200
     * @tc.name      testStrMatrix0022
     * @tc.desc      Verify toCharCodeHex renders the code point of a Chinese
     *               character, the high surrogate of an emoji, the space, the
     *               tilde and a latin one letter.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrMatrix0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The Chinese character U+4E2D renders as four lowercase hex digits.
      expect(StringUtils.toCharCodeHex('\u4E2D')).assertEqual('4e2d');
      // The high surrogate of the emoji U+1F600 renders as d83d.
      expect(StringUtils.toCharCodeHex('\uD83D\uDE00')).assertEqual('d83d');
      // The space U+0020 renders as 20.
      expect(StringUtils.toCharCodeHex(' ')).assertEqual('20');
      // The tilde U+007E renders as 7e.
      expect(StringUtils.toCharCodeHex('~')).assertEqual('7e');
      // The latin small letter y with diaeresis U+00FF renders as ff.
      expect(StringUtils.toCharCodeHex('\u00FF')).assertEqual('ff');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_2300
     * @tc.name      testStrMatrix0023
     * @tc.desc      Verify toCharCodeHex pads codes below sixteen with a
     *               leading zero and switches to the plain hex digits from
     *               sixteen upwards.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrMatrix0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The NUL code point renders with a leading zero.
      expect(StringUtils.toCharCodeHex('\u0000')).assertEqual('00');
      // Code one renders with a leading zero.
      expect(StringUtils.toCharCodeHex('\u0001')).assertEqual('01');
      // The tab code nine renders with a leading zero.
      expect(StringUtils.toCharCodeHex('\u0009')).assertEqual('09');
      // Code fifteen still needs the leading zero.
      expect(StringUtils.toCharCodeHex('\u000F')).assertEqual('0f');
      // Code sixteen switches to the plain two digit form.
      expect(StringUtils.toCharCodeHex('\u0010')).assertEqual('10');
      // The empty string carries no character and returns empty.
      expect(StringUtils.toCharCodeHex('')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_2400
     * @tc.name      testStrMatrix0024
     * @tc.desc      Verify ellipsis shortens long Chinese text to the limit
     *               with the marker, keeps text at the boundary unchanged and
     *               cuts to one character for tiny limits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrMatrix0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Seven Chinese characters cut to two characters plus the marker.
      expect(StringUtils.ellipsis('\u4E2D\u6587\u6D4B\u8BD5\u5B57\u7B26\u4E32', 5))
        .assertEqual('\u4E2D\u6587...');
      // Four Chinese characters stay inside a limit of ten.
      expect(StringUtils.ellipsis('\u4E2D\u6587\u5B57\u7B26', 10))
        .assertEqual('\u4E2D\u6587\u5B57\u7B26');
      // Two Chinese characters at a limit of two stay unchanged.
      expect(StringUtils.ellipsis('\u4E2D\u6587', 2)).assertEqual('\u4E2D\u6587');
      // Seven latin characters at a limit of six cut to three plus the marker.
      expect(StringUtils.ellipsis('abcdefg', 6)).assertEqual('abc...');
      // Six latin characters at a limit of six stay unchanged.
      expect(StringUtils.ellipsis('abcdef', 6)).assertEqual('abcdef');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_2500
     * @tc.name      testStrMatrix0025
     * @tc.desc      Verify ellipsis keeps the surrogate based length of emoji
     *               input, caps long input at the limit and maps missing or
     *               invalid limits to the empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStrMatrix0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Four emoji carry eight code units and cut to one surrogate plus marker.
      expect(StringUtils.ellipsis('\uD83D\uDE00\uD83D\uDE00\uD83D\uDE00\uD83D\uDE00', 3).length)
        .assertEqual(4);
      // Build a long buffer and cut it to exactly the limit length.
      let longText: string = '';
      for (let index: number = 0; index < 40; index++) {
        longText = longText + 'ab';
      }
      expect(StringUtils.ellipsis(longText, 10).length).assertEqual(10);
      // The empty string stays empty.
      expect(StringUtils.ellipsis('', 5)).assertEqual('');
      // Missing text maps to the empty string.
      expect(StringUtils.ellipsis(null, 5)).assertEqual('');
      expect(StringUtils.ellipsis(undefined, 5)).assertEqual('');
      // Non positive limits leave nothing to display.
      expect(StringUtils.ellipsis('abc', 0)).assertEqual('');
      expect(StringUtils.ellipsis('abc', -1)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STRMAT_2600
     * @tc.name      testStrMatrix0026
     * @tc.desc      Verify trim, containsIgnoreCase, ellipsis and padStart
     *               behave correctly on one shared long buffer of four
     *               hundred characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStrMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStrMatrix0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Build a long buffer of four hundred a and b characters.
      const longText: string = StringUtils.repeat('ab', 200);
      expect(longText.length).assertEqual(400);
      // Trim removes the added surrounding spaces only.
      expect(StringUtils.trim('  ' + longText + '  ')).assertEqual(longText);
      // A suffix appended to the long buffer is found case insensitive.
      expect(StringUtils.containsIgnoreCase(longText + 'XY', 'xy')).assertTrue();
      // The ellipsis of the long buffer keeps seven characters plus the marker.
      expect(StringUtils.ellipsis(longText, 10)).assertEqual('abababa...');
      // A long buffer is never shortened by a smaller pad target.
      expect(StringUtils.padStart(longText, 5, '0')).assertEqual(longText);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
