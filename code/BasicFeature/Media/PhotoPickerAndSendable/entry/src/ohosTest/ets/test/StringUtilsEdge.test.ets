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
 * Registers the boundary and edge cases of every string helper of the
 * shared library. All methods under test are pure static helpers without
 * any platform dependency, so no ability context is required.
 */
export default function stringUtilsEdgeTest() {
  describe('StringUtilsEdgeTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_0100
     * @tc.name      testStrEdge0001
     * @tc.desc      Verify isEmpty accepts the missing forms undefined and
     *               null plus the empty string and rejects a NUL character.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrEdge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Every missing form counts as empty.
      expect(StringUtils.isEmpty(undefined)).assertTrue();
      expect(StringUtils.isEmpty(null)).assertTrue();
      expect(StringUtils.isEmpty('')).assertTrue();
      // The NUL character is one code unit and not empty.
      expect(StringUtils.isEmpty('\u0000')).assertFalse();
      // One space and one letter are not empty.
      expect(StringUtils.isEmpty(' ')).assertFalse();
      expect(StringUtils.isEmpty('a')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_0200
     * @tc.name      testStrEdge0002
     * @tc.desc      Verify isBlank treats every single whitespace character
     *               including the ideographic space as blank and keeps the
     *               NUL character non blank.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrEdge0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Missing forms are blank.
      expect(StringUtils.isBlank(undefined)).assertTrue();
      expect(StringUtils.isBlank(null)).assertTrue();
      expect(StringUtils.isBlank('')).assertTrue();
      // Every single whitespace character is blank after trimming.
      expect(StringUtils.isBlank(' ')).assertTrue();
      expect(StringUtils.isBlank('\t')).assertTrue();
      expect(StringUtils.isBlank('\n')).assertTrue();
      expect(StringUtils.isBlank('\r')).assertTrue();
      expect(StringUtils.isBlank('\u3000')).assertTrue();
      // The NUL character survives trimming and is not blank.
      expect(StringUtils.isBlank('\u0000')).assertFalse();
      // A dot is a visible character.
      expect(StringUtils.isBlank('.')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_0300
     * @tc.name      testStrEdge0003
     * @tc.desc      Verify trim degrades missing text to the empty string and
     *               keeps inner whitespace while removing the outer one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrEdge0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Missing text degrades to the empty string.
      expect(StringUtils.trim(undefined)).assertEqual('');
      expect(StringUtils.trim(null)).assertEqual('');
      // Empty and whitespace only text collapse to the empty string.
      expect(StringUtils.trim('')).assertEqual('');
      expect(StringUtils.trim('   ')).assertEqual('');
      // Inner whitespace stays in place.
      expect(StringUtils.trim(' a b ')).assertEqual('a b');
      expect(StringUtils.trim('\t x \n')).assertEqual('x');
      // The ideographic space is trimmed on both sides.
      expect(StringUtils.trim('\u3000x\u3000')).assertEqual('x');
      // Text without whitespace stays unchanged.
      expect(StringUtils.trim('x')).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_0400
     * @tc.name      testStrEdge0004
     * @tc.desc      Verify upperFirst keeps an unchanged first character, a
     *               leading digit and a leading space intact.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrEdge0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrEdge0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Empty text has no first character.
      expect(StringUtils.upperFirst('')).assertEqual('');
      // Single letters uppercase to themselves.
      expect(StringUtils.upperFirst('a')).assertEqual('A');
      expect(StringUtils.upperFirst('A')).assertEqual('A');
      expect(StringUtils.upperFirst('z')).assertEqual('Z');
      // A leading digit and a leading underscore stay untouched.
      expect(StringUtils.upperFirst('1abc')).assertEqual('1abc');
      expect(StringUtils.upperFirst('_private')).assertEqual('_private');
      // A leading space uppercases to itself and the tail stays untouched.
      expect(StringUtils.upperFirst(' aBc')).assertEqual(' aBc');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_0500
     * @tc.name      testStrEdge0005
     * @tc.desc      Verify lowerFirst keeps an unchanged first character, a
     *               leading digit and a leading space intact.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrEdge0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrEdge0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Empty text has no first character.
      expect(StringUtils.lowerFirst('')).assertEqual('');
      // Single letters lowercase to themselves.
      expect(StringUtils.lowerFirst('A')).assertEqual('a');
      expect(StringUtils.lowerFirst('a')).assertEqual('a');
      expect(StringUtils.lowerFirst('Z')).assertEqual('z');
      // A leading digit and a leading underscore stay untouched.
      expect(StringUtils.lowerFirst('9xyz')).assertEqual('9xyz');
      expect(StringUtils.lowerFirst('_private')).assertEqual('_private');
      // A leading space lowercases to itself and the tail stays untouched.
      expect(StringUtils.lowerFirst(' Abc')).assertEqual(' Abc');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_0600
     * @tc.name      testStrEdge0006
     * @tc.desc      Verify repeat maps non positive and sub unit counts to
     *               the empty string and floors fractional counts above one.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrEdge0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrEdge0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Zero and negative counts repeat to the empty string.
      expect(StringUtils.repeat('x', 0)).assertEqual('');
      expect(StringUtils.repeat('x', -1)).assertEqual('');
      expect(StringUtils.repeat('x', -1000)).assertEqual('');
      // Sub unit counts floor to zero repetitions.
      expect(StringUtils.repeat('x', 0.5)).assertEqual('');
      expect(StringUtils.repeat('x', 0.99)).assertEqual('');
      // One repetition keeps the text once.
      expect(StringUtils.repeat('x', 1)).assertEqual('x');
      // A fractional count above one floors down.
      expect(StringUtils.repeat('x', 1.5)).assertEqual('x');
      // The empty string repeats to the empty string.
      expect(StringUtils.repeat('', 5)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_0700
     * @tc.name      testStrEdge0007
     * @tc.desc      Verify repeat of a large count produces the exact code
     *               unit length for latin and Chinese input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrEdge0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStrEdge0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One thousand repetitions of two characters carry two thousand units.
      expect(StringUtils.repeat('ab', 1000).length).assertEqual(2000);
      // One thousand Chinese characters stay at one thousand units.
      expect(StringUtils.repeat('\u4E2D', 1000).length).assertEqual(1000);
      // One count below the round block misses exactly two units.
      expect(StringUtils.repeat('ab', 999).length).assertEqual(1998);
      // The repeated buffer starts with the pattern.
      expect(StringUtils.repeat('ab', 1000).substring(0, 2)).assertEqual('ab');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_0800
     * @tc.name      testStrEdge0008
     * @tc.desc      Verify padStart keeps short targets, honours the exact
     *               boundary length and pads an empty value completely.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrEdge0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrEdge0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Targets at or below the text length never change the text.
      expect(StringUtils.padStart('abc', 0)).assertEqual('abc');
      expect(StringUtils.padStart('abc', -5)).assertEqual('abc');
      expect(StringUtils.padStart('abc', 3)).assertEqual('abc');
      // One missing character is filled once.
      expect(StringUtils.padStart('abc', 4, '0')).assertEqual('0abc');
      // An empty value is filled completely.
      expect(StringUtils.padStart('', 3, '0')).assertEqual('000');
      expect(StringUtils.padStart('', 0)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_0900
     * @tc.name      testStrEdge0009
     * @tc.desc      Verify padEnd keeps short targets, honours the exact
     *               boundary length and pads an empty value completely.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrEdge0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrEdge0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Targets at or below the text length never change the text.
      expect(StringUtils.padEnd('abc', 0)).assertEqual('abc');
      expect(StringUtils.padEnd('abc', -5)).assertEqual('abc');
      expect(StringUtils.padEnd('abc', 3)).assertEqual('abc');
      // One missing character is filled once.
      expect(StringUtils.padEnd('abc', 4, '0')).assertEqual('abc0');
      // An empty value is filled completely.
      expect(StringUtils.padEnd('', 3, '0')).assertEqual('000');
      expect(StringUtils.padEnd('', 0)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_1000
     * @tc.name      testStrEdge0010
     * @tc.desc      Verify both pad helpers fall back to the space filler for
     *               an empty filler and tile a multi character filler.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrEdge0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStrEdge0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty filler falls back to spaces on both sides.
      expect(StringUtils.padStart('9', 3, '')).assertEqual('  9');
      expect(StringUtils.padEnd('9', 3, '')).assertEqual('9  ');
      // A two character filler tiles into the missing span.
      expect(StringUtils.padStart('9', 5, '01')).assertEqual('01019');
      expect(StringUtils.padEnd('9', 5, '01')).assertEqual('90101');
      // A three character filler is cut at the missing span.
      expect(StringUtils.padStart('ab', 6, 'xyz')).assertEqual('xyzxab');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_1100
     * @tc.name      testStrEdge0011
     * @tc.desc      Verify reverse keeps single characters and palindromes
     *               stable and flips short and spaced text exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrEdge0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrEdge0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Single characters stay stable.
      expect(StringUtils.reverse('x')).assertEqual('x');
      // Two characters flip exactly.
      expect(StringUtils.reverse('xy')).assertEqual('yx');
      // Palindromes stay stable.
      expect(StringUtils.reverse('abba')).assertEqual('abba');
      expect(StringUtils.reverse('abc cba')).assertEqual('abc cba');
      // Surrounding spaces move to the other side.
      expect(StringUtils.reverse(' hello ')).assertEqual(' olleh ');
      // The empty string stays empty.
      expect(StringUtils.reverse('')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_1200
     * @tc.name      testStrEdge0012
     * @tc.desc      Verify reverse keeps the code unit length of surrogate
     *               pair input and flips Chinese basic plane text exactly.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrEdge0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStrEdge0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One emoji carries two code units and keeps its length after reversing.
      expect(StringUtils.reverse('\uD83D\uDE00').length).assertEqual(2);
      // Two emoji keep four code units.
      expect(StringUtils.reverse('\uD83D\uDE00\uD83D\uDE00').length).assertEqual(4);
      // Chinese basic plane characters flip exactly.
      expect(StringUtils.reverse('\u4E2D\u6587')).assertEqual('\u6587\u4E2D');
      // Mixed latin and Chinese flips around the Chinese character.
      expect(StringUtils.reverse('ab\u4E2D')).assertEqual('\u4E2Dba');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_1300
     * @tc.name      testStrEdge0013
     * @tc.desc      Verify capitalize maps single characters, keeps digits
     *               and spaces as first character and leaves Chinese text
     *               unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrEdge0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrEdge0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Empty text stays empty.
      expect(StringUtils.capitalize('')).assertEqual('');
      // Single characters uppercase or keep their case.
      expect(StringUtils.capitalize('a')).assertEqual('A');
      expect(StringUtils.capitalize('A')).assertEqual('A');
      expect(StringUtils.capitalize('9')).assertEqual('9');
      expect(StringUtils.capitalize(' ')).assertEqual(' ');
      // The tail lowercases while digits and punctuation stay untouched.
      expect(StringUtils.capitalize('aB9c')).assertEqual('Ab9c');
      // Chinese text has no case and stays unchanged.
      expect(StringUtils.capitalize('\u4E2D\u6587')).assertEqual('\u4E2D\u6587');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_1400
     * @tc.name      testStrEdge0014
     * @tc.desc      Verify containsIgnoreCase returns false for every missing
     *               argument combination and for an empty target.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrEdge0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrEdge0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A missing source rejects every target.
      expect(StringUtils.containsIgnoreCase(undefined, 'a')).assertFalse();
      expect(StringUtils.containsIgnoreCase(null, 'a')).assertFalse();
      // A missing target rejects every source.
      expect(StringUtils.containsIgnoreCase('abc', undefined)).assertFalse();
      expect(StringUtils.containsIgnoreCase('abc', null)).assertFalse();
      // Both arguments missing reject as well.
      expect(StringUtils.containsIgnoreCase(undefined, null)).assertFalse();
      // An empty source or an empty target never matches.
      expect(StringUtils.containsIgnoreCase('', '')).assertFalse();
      expect(StringUtils.containsIgnoreCase('abc', '')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_1500
     * @tc.name      testStrEdge0015
     * @tc.desc      Verify containsIgnoreCase folds digits and punctuation
     *               the same way as letters and rejects a near match.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrEdge0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStrEdge0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Digit blocks fold caseless in both directions.
      expect(StringUtils.containsIgnoreCase('ABC123', 'abc123')).assertTrue();
      expect(StringUtils.containsIgnoreCase('abc123', 'ABC123')).assertTrue();
      // A longer target never matches a shorter source.
      expect(StringUtils.containsIgnoreCase('ABC123', 'ABC1234')).assertFalse();
      // Punctuation folds caseless too.
      expect(StringUtils.containsIgnoreCase('a-b_c', 'A-B_C')).assertTrue();
      // A full phrase matches caseless once.
      expect(StringUtils.containsIgnoreCase('Hello World', 'hello world')).assertTrue();
      // A doubled space breaks the match.
      expect(StringUtils.containsIgnoreCase('Hello World', 'hello  world')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_1600
     * @tc.name      testStrEdge0016
     * @tc.desc      Verify joinWith maps missing and empty lists to the empty
     *               string and keeps a single entry without separator.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrEdge0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrEdge0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Missing lists join to the empty string.
      expect(StringUtils.joinWith(undefined, '-')).assertEqual('');
      expect(StringUtils.joinWith(null, '-')).assertEqual('');
      // An empty list joins to the empty string.
      const emptyList: string[] = [];
      expect(StringUtils.joinWith(emptyList, '-')).assertEqual('');
      // A single entry never receives a separator.
      expect(StringUtils.joinWith(['a'], '-')).assertEqual('a');
      // An empty separator glues without a gap.
      expect(StringUtils.joinWith(['a'], '')).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_1700
     * @tc.name      testStrEdge0017
     * @tc.desc      Verify joinWith keeps empty string entries as separators
     *               neighbours and produces consecutive separators.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrEdge0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStrEdge0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two entries join with one separator.
      expect(StringUtils.joinWith(['a', 'b'], '-')).assertEqual('a-b');
      // An empty entry is kept because it is not missing.
      expect(StringUtils.joinWith(['a', '', 'b'], '-')).assertEqual('a--b');
      // Only empty entries produce consecutive separators.
      expect(StringUtils.joinWith(['', '', ''], '-')).assertEqual('--');
      // A single empty entry produces the empty string.
      expect(StringUtils.joinWith([''], '-')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_1800
     * @tc.name      testStrEdge0018
     * @tc.desc      Verify splitSafe maps missing and empty text to an empty
     *               list for every separator.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrEdge0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrEdge0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Missing text splits to an empty list.
      expect(StringUtils.splitSafe(undefined, ',').length).assertEqual(0);
      expect(StringUtils.splitSafe(null, ',').length).assertEqual(0);
      // The empty string splits to an empty list.
      expect(StringUtils.splitSafe('', ',').length).assertEqual(0);
      // The separator choice does not change the missing case.
      expect(StringUtils.splitSafe(undefined, '').length).assertEqual(0);
      expect(StringUtils.splitSafe(null, 'ab').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_1900
     * @tc.name      testStrEdge0019
     * @tc.desc      Verify splitSafe drops blank parts from leading, trailing
     *               and consecutive separators and keeps a partless input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrEdge0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStrEdge0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Blank parts around separators are dropped.
      expect(StringUtils.splitSafe(' , , ', ',').length).assertEqual(0);
      // Consecutive separators produce no parts.
      expect(StringUtils.splitSafe(',,,', ',').length).assertEqual(0);
      // Real parts survive surrounded by blanks.
      const parts: string[] = StringUtils.splitSafe(' a , b , ', ',');
      expect(parts.length).assertEqual(2);
      expect(parts[0]).assertEqual('a');
      expect(parts[1]).assertEqual('b');
      // Tab separators trim the parts too.
      expect(StringUtils.splitSafe('\t\ta\t\t', '\t').length).assertEqual(1);
      // An input without the separator keeps one part.
      expect(StringUtils.splitSafe('no-sep', ',').length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_2000
     * @tc.name      testStrEdge0020
     * @tc.desc      Verify replaceAll keeps empty values and empty searches
     *               untouched, deletes a matched search and expands one
     *               character into two.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrEdge0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrEdge0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // An empty value returns the empty value.
      expect(StringUtils.replaceAll('', 'a', 'b')).assertEqual('');
      // An empty search returns the value untouched.
      expect(StringUtils.replaceAll('abc', '', 'x')).assertEqual('abc');
      // Both empty arguments return the empty string.
      expect(StringUtils.replaceAll('', '', 'x')).assertEqual('');
      // Replacing with the empty string deletes the match.
      expect(StringUtils.replaceAll('abc', 'a', '')).assertEqual('bc');
      // Replacing one character with two expands the text.
      expect(StringUtils.replaceAll('aaa', 'a', 'aa')).assertEqual('aaaaaa');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_2100
     * @tc.name      testStrEdge0021
     * @tc.desc      Verify replaceAll consumes non overlapping occurrences
     *               from the left and keeps the text when search and
     *               replacement are equal.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrEdge0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStrEdge0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two pairs of two consume the whole buffer.
      expect(StringUtils.replaceAll('aaaa', 'aa', 'b')).assertEqual('bb');
      // An odd tail leaves one unmatched character.
      expect(StringUtils.replaceAll('aaaaa', 'aa', 'b')).assertEqual('bba');
      // Equal search and replacement keep the text unchanged.
      expect(StringUtils.replaceAll('ababab', 'ab', 'ab')).assertEqual('ababab');
      // A single match in the middle is removed.
      expect(StringUtils.replaceAll('xax', 'a', '')).assertEqual('xx');
      // An even tail of three pairs consumes completely.
      expect(StringUtils.replaceAll('aaaaaa', 'aa', 'b')).assertEqual('bbb');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_2200
     * @tc.name      testStrEdge0022
     * @tc.desc      Verify replaceAll treats the search as a literal text so
     *               regular expression metacharacters are replaced as is.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrEdge0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStrEdge0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The dot is a literal character here.
      expect(StringUtils.replaceAll('a.b.c', '.', '-')).assertEqual('a-b-c');
      // The star is a literal character here.
      expect(StringUtils.replaceAll('a*b', '*', '+')).assertEqual('a+b');
      // The question mark is a literal character here.
      expect(StringUtils.replaceAll('a?b?c', '?', '!')).assertEqual('a!b!c');
      // A bracket is replaced at its position only.
      expect(StringUtils.replaceAll('a[b]c', '[', '(')).assertEqual('a(b]c');
      // The dollar sign is a literal character here.
      expect(StringUtils.replaceAll('a$b', '$', '#')).assertEqual('a#b');
      // The backslash is replaced literally.
      expect(StringUtils.replaceAll('a\\b', '\\', '/')).assertEqual('a/b');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_2300
     * @tc.name      testStrEdge0023
     * @tc.desc      Verify toCharCodeHex pads the whole control block below
     *               sixteen and switches to plain digits from sixteen up.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrEdge0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrEdge0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The NUL code point carries a leading zero.
      expect(StringUtils.toCharCodeHex('\u0000')).assertEqual('00');
      // Code one carries a leading zero.
      expect(StringUtils.toCharCodeHex('\u0001')).assertEqual('01');
      // Code nine carries a leading zero.
      expect(StringUtils.toCharCodeHex('\u0009')).assertEqual('09');
      // Code fifteen is the last padded code.
      expect(StringUtils.toCharCodeHex('\u000F')).assertEqual('0f');
      // Code sixteen starts the plain two digit form.
      expect(StringUtils.toCharCodeHex('\u0010')).assertEqual('10');
      // The empty string carries no code.
      expect(StringUtils.toCharCodeHex('')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_2400
     * @tc.name      testStrEdge0024
     * @tc.desc      Verify toCharCodeHex renders space, tilde, the DEL code,
     *               a Latin one byte, Chinese and the high surrogate of an
     *               emoji as lowercase hex digits.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrEdge0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStrEdge0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The space code renders as twenty.
      expect(StringUtils.toCharCodeHex(' ')).assertEqual('20');
      // The tilde code renders as 7e.
      expect(StringUtils.toCharCodeHex('~')).assertEqual('7e');
      // The DEL code renders as 7f.
      expect(StringUtils.toCharCodeHex('\u007F')).assertEqual('7f');
      // The Latin small y with diaeresis renders as ff.
      expect(StringUtils.toCharCodeHex('\u00FF')).assertEqual('ff');
      // The Chinese zhong character renders as 4e2d.
      expect(StringUtils.toCharCodeHex('\u4E2D')).assertEqual('4e2d');
      // The high surrogate of the grinning face renders as d83d.
      expect(StringUtils.toCharCodeHex('\uD83D\uDE00')).assertEqual('d83d');
      // The maximum BMP code renders as ffff.
      expect(StringUtils.toCharCodeHex('\uFFFF')).assertEqual('ffff');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_2500
     * @tc.name      testStrEdge0025
     * @tc.desc      Verify ellipsis with tiny limits keeps one character plus
     *               the three dot marker and returns the input unchanged once
     *               the limit covers the length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testStrEdge0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testStrEdge0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Tiny limits keep one character plus the marker.
      expect(StringUtils.ellipsis('abcdef', 3)).assertEqual('a...');
      expect(StringUtils.ellipsis('abcdef', 2)).assertEqual('a...');
      expect(StringUtils.ellipsis('abcdef', 1)).assertEqual('a...');
      // Limits of four and five still keep one or two characters.
      expect(StringUtils.ellipsis('abcdef', 4)).assertEqual('a...');
      expect(StringUtils.ellipsis('abcdef', 5)).assertEqual('ab...');
      // A limit above the length returns the input unchanged.
      expect(StringUtils.ellipsis('abcdef', 7)).assertEqual('abcdef');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_2600
     * @tc.name      testStrEdge0026
     * @tc.desc      Verify ellipsis treats the exact length boundary as no op
     *               and maps non positive limits and missing text to the
     *               empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStrEdge0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStrEdge0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The exact length boundary returns the input unchanged.
      expect(StringUtils.ellipsis('abcdef', 6)).assertEqual('abcdef');
      // One below the length cuts to two characters plus the marker.
      expect(StringUtils.ellipsis('abcdef', 5)).assertEqual('ab...');
      // Non positive limits leave nothing.
      expect(StringUtils.ellipsis('abcdef', 0)).assertEqual('');
      expect(StringUtils.ellipsis('abcdef', -1)).assertEqual('');
      // Missing text maps to the empty string.
      expect(StringUtils.ellipsis(null, 10)).assertEqual('');
      expect(StringUtils.ellipsis(undefined, 10)).assertEqual('');
      // The empty string stays empty even with a generous limit.
      expect(StringUtils.ellipsis('', 10)).assertEqual('');
      // A generous limit never changes the text.
      expect(StringUtils.ellipsis('abcdef', 100)).assertEqual('abcdef');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_2700
     * @tc.name      testStrEdge0027
     * @tc.desc      Verify isAsciiAlphanumeric accepts only the decimal digit
     *               block and rejects the neighbours below and above it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStrEdge0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStrEdge0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Both ends of the digit block are accepted.
      expect(StringUtils.isAsciiAlphanumeric(48, 57)).assertTrue();
      expect(StringUtils.isAsciiAlphanumeric(48, 48)).assertTrue();
      // The slash below the digit block is rejected.
      expect(StringUtils.isAsciiAlphanumeric(47, 48)).assertFalse();
      expect(StringUtils.isAsciiAlphanumeric(48, 47)).assertFalse();
      // The colon above the digit block is rejected.
      expect(StringUtils.isAsciiAlphanumeric(58, 48)).assertFalse();
      // The zero code point is rejected.
      expect(StringUtils.isAsciiAlphanumeric(0, 0)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_2800
     * @tc.name      testStrEdge0028
     * @tc.desc      Verify isAsciiAlphanumeric folds only the uppercase A to
     *               F block into the lowercase hex block and rejects letters
     *               outside both blocks.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStrEdge0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStrEdge0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The lowercase hex block ends are accepted.
      expect(StringUtils.isAsciiAlphanumeric(97, 102)).assertTrue();
      // Uppercase A and F fold into the accepted block.
      expect(StringUtils.isAsciiAlphanumeric(65, 48)).assertTrue();
      expect(StringUtils.isAsciiAlphanumeric(70, 65)).assertTrue();
      expect(StringUtils.isAsciiAlphanumeric(102, 70)).assertTrue();
      // G above F is rejected on both cases.
      expect(StringUtils.isAsciiAlphanumeric(71, 48)).assertFalse();
      expect(StringUtils.isAsciiAlphanumeric(103, 48)).assertFalse();
      // The grave accent below lowercase a is rejected.
      expect(StringUtils.isAsciiAlphanumeric(96, 48)).assertFalse();
      // The brace above lowercase f is rejected.
      expect(StringUtils.isAsciiAlphanumeric(123, 97)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_2900
     * @tc.name      testStrEdge0029
     * @tc.desc      Verify both pad helpers tile a multi character filler up
     *               to a large target length and keep the exact result size.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStrEdge0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStrEdge0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A two character filler tiles up to a target of ten.
      const padded: string = StringUtils.padStart('a', 10, 'ab');
      expect(padded.length).assertEqual(10);
      // The tiled buffer starts with the filler pattern.
      expect(padded.charAt(0)).assertEqual('a');
      expect(padded.charAt(9)).assertEqual('a');
      // A large single character target keeps fifty units.
      expect(StringUtils.padStart('a', 50, '0').length).assertEqual(50);
      // The end helper keeps fifty units with a two character filler.
      expect(StringUtils.padEnd('a', 50, '01').length).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_STREDGE_3000
     * @tc.name      testStrEdge0030
     * @tc.desc      Verify ellipsis with a limit below three still appends
     *               the fixed marker so the result can exceed the requested
     *               limit length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testStrEdge0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testStrEdge0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A one character input inside a limit of one stays unchanged.
      expect(StringUtils.ellipsis('x', 1)).assertEqual('x');
      // A two character input with a limit of one keeps one character plus
      // the fixed three dot marker, so the result exceeds the limit.
      expect(StringUtils.ellipsis('xy', 1)).assertEqual('x...');
      // The exact boundary of two keeps both characters.
      expect(StringUtils.ellipsis('xy', 2)).assertEqual('xy');
      // Three characters with a limit of two keep one plus the marker.
      expect(StringUtils.ellipsis('xyz', 2)).assertEqual('x...');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
