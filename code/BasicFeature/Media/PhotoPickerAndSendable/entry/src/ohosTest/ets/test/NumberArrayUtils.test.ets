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
import { NumberUtils, ArrayUtils } from 'photopickersendable';

/**
 * Registers every numeric and array helper case of the shared library.
 * All methods under test are pure static helpers, no ability context is required.
 */
export default function numberArrayUtilsTest() {
  describe('NumberArrayUtilsTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0100
     * @tc.name      testNumArrayUtil0001
     * @tc.desc      Verify clamp keeps in range values untouched, pulls out of
     *               range values to the bounds, hands NaN back unchanged and
     *               lets the lower bound win for an inverted range.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumArrayUtil0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(NumberUtils.clamp(5, 0, 10)).assertEqual(5);
      expect(NumberUtils.clamp(-3, 0, 10)).assertEqual(0);
      expect(NumberUtils.clamp(15, 0, 10)).assertEqual(10);
      expect(NumberUtils.clamp(2.5, 2.5, 8)).assertEqual(2.5);
      expect(Number.isNaN(NumberUtils.clamp(Number.NaN, 0, 10))).assertTrue();
      expect(NumberUtils.clamp(5, 10, 2)).assertEqual(10);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0101
     * @tc.name      testNumArrayUtil0002
     * @tc.desc      Verify parseSafe converts numeric text, trims padding,
     *               accepts exponent notation and signals NaN for missing or
     *               non numeric text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumArrayUtil0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(NumberUtils.parseSafe('42')).assertEqual(42);
      expect(NumberUtils.parseSafe('  3.5  ')).assertEqual(3.5);
      expect(NumberUtils.parseSafe('1e2')).assertEqual(100);
      expect(Number.isNaN(NumberUtils.parseSafe('abc'))).assertTrue();
      expect(Number.isNaN(NumberUtils.parseSafe(''))).assertTrue();
      expect(Number.isNaN(NumberUtils.parseSafe(undefined))).assertTrue();
      expect(Number.isNaN(NumberUtils.parseSafe(null))).assertTrue();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0102
     * @tc.name      testNumArrayUtil0003
     * @tc.desc      Verify toFixedSafe renders the requested decimals, floors
     *               fractional digit counts, raises negative counts to zero
     *               and reports NaN input as the text NaN.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumArrayUtil0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(NumberUtils.toFixedSafe(3.14159, 2)).assertEqual('3.14');
      expect(NumberUtils.toFixedSafe(10, 0)).assertEqual('10');
      const third: number = 1 / 3;
      expect(NumberUtils.toFixedSafe(third, 3)).assertEqual('0.333');
      expect(NumberUtils.toFixedSafe(7, 2.9)).assertEqual('7.00');
      expect(NumberUtils.toFixedSafe(5, -3)).assertEqual('5');
      expect(NumberUtils.toFixedSafe(Number.NaN, 2)).assertEqual('NaN');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0103
     * @tc.name      testNumArrayUtil0004
     * @tc.desc      Verify isInteger accepts whole numbers including zero and
     *               negatives and rejects fractions, NaN and infinity.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumArrayUtil0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(NumberUtils.isInteger(42)).assertTrue();
      expect(NumberUtils.isInteger(-7)).assertTrue();
      expect(NumberUtils.isInteger(0)).assertTrue();
      expect(NumberUtils.isInteger(42.5)).assertFalse();
      expect(NumberUtils.isInteger(Number.NaN)).assertFalse();
      expect(NumberUtils.isInteger(Number.POSITIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0104
     * @tc.name      testNumArrayUtil0005
     * @tc.desc      Verify isPositive is true only strictly above zero and
     *               false for zero, negatives and NaN.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumArrayUtil0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(NumberUtils.isPositive(0.0001)).assertTrue();
      expect(NumberUtils.isPositive(1000)).assertTrue();
      expect(NumberUtils.isPositive(0)).assertFalse();
      expect(NumberUtils.isPositive(-1)).assertFalse();
      expect(NumberUtils.isPositive(Number.NaN)).assertFalse();
      expect(NumberUtils.isPositive(Number.NEGATIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0105
     * @tc.name      testNumArrayUtil0006
     * @tc.desc      Verify percent converts a part of a total, clamps the
     *               result into 0 to 100 and returns zero for a non positive
     *               total.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumArrayUtil0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(NumberUtils.percent(50, 200)).assertEqual(25);
      expect(NumberUtils.percent(1, 4)).assertEqual(25);
      expect(NumberUtils.percent(75, 50)).assertEqual(100);
      expect(NumberUtils.percent(-20, 100)).assertEqual(0);
      expect(NumberUtils.percent(25, 0)).assertEqual(0);
      expect(NumberUtils.percent(25, -10)).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0106
     * @tc.name      testNumArrayUtil0007
     * @tc.desc      Verify formatThousands groups the integer part in blocks
     *               of three, keeps small values ungrouped, keeps the sign and
     *               the fractional part and reports NaN as text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumArrayUtil0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(NumberUtils.formatThousands(1234567)).assertEqual('1,234,567');
      expect(NumberUtils.formatThousands(999)).assertEqual('999');
      expect(NumberUtils.formatThousands(1000)).assertEqual('1,000');
      expect(NumberUtils.formatThousands(0)).assertEqual('0');
      expect(NumberUtils.formatThousands(-9876)).assertEqual('-9,876');
      expect(NumberUtils.formatThousands(123.45)).assertEqual('123.45');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0107
     * @tc.name      testNumArrayUtil0008
     * @tc.desc      Verify formatThousands groups the maximum safe integer in
     *               six blocks, mirrors the grouping for the negative extreme
     *               and reports NaN as text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumArrayUtil0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const maxSafe: number = 9007199254740991;
      expect(NumberUtils.formatThousands(maxSafe)).assertEqual('9,007,199,254,740,991');
      expect(NumberUtils.formatThousands(-maxSafe)).assertEqual('-9,007,199,254,740,991');
      expect(NumberUtils.formatThousands(Number.NaN)).assertEqual('NaN');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0108
     * @tc.name      testNumArrayUtil0009
     * @tc.desc      Verify roundHalfUp moves exact halves away from zero in
     *               both directions, keeps ordinary values, treats negative
     *               digit counts as zero and reports non finite input as NaN.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumArrayUtil0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(NumberUtils.roundHalfUp(2.5, 0)).assertEqual(3);
      expect(NumberUtils.roundHalfUp(2.4, 0)).assertEqual(2);
      expect(NumberUtils.roundHalfUp(-2.5, 0)).assertEqual(-3);
      expect(NumberUtils.roundHalfUp(0.125, 2)).assertEqual(0.13);
      expect(NumberUtils.roundHalfUp(-0.125, 2)).assertEqual(-0.13);
      expect(NumberUtils.roundHalfUp(123.6, -5)).assertEqual(124);
      expect(Number.isNaN(NumberUtils.roundHalfUp(Number.NaN, 2))).assertTrue();
      expect(Number.isNaN(NumberUtils.roundHalfUp(Number.POSITIVE_INFINITY, 0))).assertTrue();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0109
     * @tc.name      testNumArrayUtil0010
     * @tc.desc      Verify bytesToReadable prints the byte range without
     *               decimals and collapses zero, negative and NaN input to
     *               zero bytes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumArrayUtil0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(NumberUtils.bytesToReadable(0)).assertEqual('0 B');
      expect(NumberUtils.bytesToReadable(-500)).assertEqual('0 B');
      expect(NumberUtils.bytesToReadable(Number.NaN)).assertEqual('0 B');
      expect(NumberUtils.bytesToReadable(512)).assertEqual('512 B');
      expect(NumberUtils.bytesToReadable(1023)).assertEqual('1023 B');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0110
     * @tc.name      testNumArrayUtil0011
     * @tc.desc      Verify bytesToReadable switches to kilobytes and megabytes
     *               at the exact unit boundaries and keeps one decimal.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumArrayUtil0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(NumberUtils.bytesToReadable(1024)).assertEqual('1.0 KB');
      expect(NumberUtils.bytesToReadable(1536)).assertEqual('1.5 KB');
      expect(NumberUtils.bytesToReadable(2047)).assertEqual('2.0 KB');
      expect(NumberUtils.bytesToReadable(1048575)).assertEqual('1024.0 KB');
      expect(NumberUtils.bytesToReadable(1048576)).assertEqual('1.0 MB');
      expect(NumberUtils.bytesToReadable(5242880)).assertEqual('5.0 MB');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0111
     * @tc.name      testNumArrayUtil0012
     * @tc.desc      Verify bytesToReadable switches to gigabytes and terabytes
     *               and keeps scaling beyond one terabyte.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testNumArrayUtil0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      expect(NumberUtils.bytesToReadable(1073741823)).assertEqual('1024.0 MB');
      expect(NumberUtils.bytesToReadable(1073741824)).assertEqual('1.0 GB');
      expect(NumberUtils.bytesToReadable(1073741824 * 3)).assertEqual('3.0 GB');
      expect(NumberUtils.bytesToReadable(1099511627776)).assertEqual('1.0 TB');
      expect(NumberUtils.bytesToReadable(1099511627776 * 2)).assertEqual('2.0 TB');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0112
     * @tc.name      testNumArrayUtil0013
     * @tc.desc      Verify ArrayUtils.isEmpty reports true for missing and
     *               empty lists and false for lists with one entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumArrayUtil0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const emptyStrings: string[] = [];
      expect(ArrayUtils.isEmpty(emptyStrings)).assertTrue();
      expect(ArrayUtils.isEmpty(undefined)).assertTrue();
      expect(ArrayUtils.isEmpty(null)).assertTrue();
      expect(ArrayUtils.isEmpty(['a'])).assertFalse();
      expect(ArrayUtils.isEmpty([0])).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0113
     * @tc.name      testNumArrayUtil0014
     * @tc.desc      Verify ArrayUtils.sum totals positive, negative and
     *               fractional entries and returns zero for an empty list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumArrayUtil0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(ArrayUtils.sum([1, 2, 3])).assertEqual(6);
      const emptyList: number[] = [];
      expect(ArrayUtils.sum(emptyList)).assertEqual(0);
      expect(ArrayUtils.sum([-5, 5])).assertEqual(0);
      expect(ArrayUtils.sum([0.5, 0.25])).assertEqual(0.75);
      expect(ArrayUtils.sum([-1, -2, -3])).assertEqual(-6);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0114
     * @tc.name      testNumArrayUtil0015
     * @tc.desc      Verify ArrayUtils.max picks the greatest value, works for
     *               all negative lists and duplicates and reports NaN for an
     *               empty list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumArrayUtil0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(ArrayUtils.max([3, 1, 9, 2])).assertEqual(9);
      expect(ArrayUtils.max([-5, -1, -9])).assertEqual(-1);
      expect(ArrayUtils.max([5, 5, 5])).assertEqual(5);
      const emptyList: number[] = [];
      expect(Number.isNaN(ArrayUtils.max(emptyList))).assertTrue();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0115
     * @tc.name      testNumArrayUtil0016
     * @tc.desc      Verify ArrayUtils.min picks the smallest value, keeps a
     *               negative fraction and reports NaN for an empty list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumArrayUtil0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(ArrayUtils.min([3, 1, -9, 2])).assertEqual(-9);
      expect(ArrayUtils.min([4, 4, 4])).assertEqual(4);
      expect(ArrayUtils.min([10, 2, 7])).assertEqual(2);
      expect(ArrayUtils.min([0, -0.5])).assertEqual(-0.5);
      const emptyList: number[] = [];
      expect(Number.isNaN(ArrayUtils.min(emptyList))).assertTrue();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0116
     * @tc.name      testNumArrayUtil0017
     * @tc.desc      Verify ArrayUtils.average divides the sum by the entry
     *               count, returns zero for an empty list and handles single
     *               entry and symmetric lists.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumArrayUtil0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(ArrayUtils.average([2, 4, 6])).assertEqual(4);
      const emptyList: number[] = [];
      expect(ArrayUtils.average(emptyList)).assertEqual(0);
      expect(ArrayUtils.average([1, 2])).assertEqual(1.5);
      expect(ArrayUtils.average([7])).assertEqual(7);
      expect(ArrayUtils.average([-3, 3])).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0117
     * @tc.name      testNumArrayUtil0018
     * @tc.desc      Verify ArrayUtils.chunk splits the list into groups of the
     *               requested size and keeps a shorter trailing group.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumArrayUtil0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const groups: number[][] = ArrayUtils.chunk<number>([1, 2, 3, 4, 5], 2);
      expect(groups.length).assertEqual(3);
      expect(groups[0].length).assertEqual(2);
      expect(groups[0][0]).assertEqual(1);
      expect(groups[0][1]).assertEqual(2);
      expect(groups[1][0]).assertEqual(3);
      expect(groups[2].length).assertEqual(1);
      expect(groups[2][0]).assertEqual(5);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0118
     * @tc.name      testNumArrayUtil0019
     * @tc.desc      Verify ArrayUtils.chunk raises a size below one to one,
     *               keeps a whole list as one group for an oversized size and
     *               returns no group for an empty list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumArrayUtil0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const tinyGroups: number[][] = ArrayUtils.chunk<number>([1, 2, 3], 0);
      expect(tinyGroups.length).assertEqual(3);
      expect(tinyGroups[1].length).assertEqual(1);
      expect(tinyGroups[1][0]).assertEqual(2);
      const bigGroups: string[][] = ArrayUtils.chunk<string>(['x', 'y'], 10);
      expect(bigGroups.length).assertEqual(1);
      expect(bigGroups[0].length).assertEqual(2);
      const emptyList: number[] = [];
      expect(ArrayUtils.chunk<number>(emptyList, 3).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0119
     * @tc.name      testNumArrayUtil0020
     * @tc.desc      Verify ArrayUtils.distinct keeps the first occurrence
     *               order, collapses duplicates and preserves negative and
     *               zero values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumArrayUtil0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const unique: number[] = ArrayUtils.distinct([1, 2, 2, 3, 1]);
      expect(unique.length).assertEqual(3);
      expect(unique[0]).assertEqual(1);
      expect(unique[1]).assertEqual(2);
      expect(unique[2]).assertEqual(3);
      expect(ArrayUtils.distinct([-1, -1, 0]).length).assertEqual(2);
      expect(ArrayUtils.distinct([9, 9, 9])[0]).assertEqual(9);
      const emptyList: number[] = [];
      expect(ArrayUtils.distinct(emptyList).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0120
     * @tc.name      testNumArrayUtil0021
     * @tc.desc      Verify ArrayUtils.flatten concatenates nested groups in
     *               order, skips empty groups and returns an empty list for
     *               missing input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumArrayUtil0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const flat: string[] = ArrayUtils.flatten([['a', 'b'], [], ['c']]);
      expect(flat.length).assertEqual(3);
      expect(flat[0]).assertEqual('a');
      expect(flat[1]).assertEqual('b');
      expect(flat[2]).assertEqual('c');
      expect(ArrayUtils.flatten([]).length).assertEqual(0);
      expect(ArrayUtils.flatten([['only']])[0]).assertEqual('only');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0121
     * @tc.name      testNumArrayUtil0022
     * @tc.desc      Verify ArrayUtils.reverseCopy returns a reversed copy for
     *               numbers and strings and leaves the source list untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumArrayUtil0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const source: number[] = [1, 2, 3];
      const reversed: number[] = ArrayUtils.reverseCopy<number>(source);
      expect(reversed.length).assertEqual(3);
      expect(reversed[0]).assertEqual(3);
      expect(reversed[1]).assertEqual(2);
      expect(reversed[2]).assertEqual(1);
      expect(source[0]).assertEqual(1);
      expect(source.length).assertEqual(3);
      const words: string[] = ArrayUtils.reverseCopy<string>(['a', 'b']);
      expect(words[0]).assertEqual('b');
      expect(words[1]).assertEqual('a');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0122
     * @tc.name      testNumArrayUtil0023
     * @tc.desc      Verify ArrayUtils.contains finds present values including
     *               negatives and fractions and rejects absent values and
     *               empty lists.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumArrayUtil0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(ArrayUtils.contains([1, 2, 3], 2)).assertTrue();
      expect(ArrayUtils.contains([-5], -5)).assertTrue();
      expect(ArrayUtils.contains([1.5, 2.5], 2.5)).assertTrue();
      expect(ArrayUtils.contains([1, 2, 3], 9)).assertFalse();
      const emptyList: number[] = [];
      expect(ArrayUtils.contains(emptyList, 1)).assertFalse();
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0123
     * @tc.name      testNumArrayUtil0024
     * @tc.desc      Verify indexOfSafe returns the position of a found value,
     *               minus one for absent values and minus one for a missing
     *               list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumArrayUtil0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      expect(ArrayUtils.indexOfSafe([1, 2, 3], 3)).assertEqual(2);
      expect(ArrayUtils.indexOfSafe([1, 2, 3], 5)).assertEqual(-1);
      expect(ArrayUtils.indexOfSafe(undefined, 1)).assertEqual(-1);
      expect(ArrayUtils.indexOfSafe(null, 1)).assertEqual(-1);
      const emptyList: number[] = [];
      expect(ArrayUtils.indexOfSafe(emptyList, 0)).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0124
     * @tc.name      testNumArrayUtil0025
     * @tc.desc      Verify ArrayUtils.join uses the comma space default,
     *               honours a custom separator, keeps single entries without
     *               separator and maps an empty list to the empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumArrayUtil0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(ArrayUtils.join([1, 2, 3])).assertEqual('1, 2, 3');
      expect(ArrayUtils.join([1, 2], '-')).assertEqual('1-2');
      expect(ArrayUtils.join([10, 20], '|')).assertEqual('10|20');
      expect(ArrayUtils.join([7], ', ')).assertEqual('7');
      const emptyList: number[] = [];
      expect(ArrayUtils.join(emptyList)).assertEqual('');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0125
     * @tc.name      testNumArrayUtil0026
     * @tc.desc      Verify take keeps the leading entries, returns nothing for
     *               a non positive count and caps an oversized count at the
     *               list length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumArrayUtil0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const taken: number[] = ArrayUtils.take<number>([1, 2, 3], 2);
      expect(taken.length).assertEqual(2);
      expect(taken[0]).assertEqual(1);
      expect(taken[1]).assertEqual(2);
      expect(ArrayUtils.take<number>([1, 2, 3], 0).length).assertEqual(0);
      expect(ArrayUtils.take<number>([1, 2, 3], -1).length).assertEqual(0);
      const capped: number[] = ArrayUtils.take<number>([1, 2, 3], 99);
      expect(capped.length).assertEqual(3);
      expect(capped[2]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0126
     * @tc.name      testNumArrayUtil0027
     * @tc.desc      Verify drop removes the leading entries, keeps the whole
     *               list for a non positive count, empties on an oversized
     *               count and never mutates the source list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumArrayUtil0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const source: number[] = [1, 2, 3, 4];
      const dropped: number[] = ArrayUtils.drop<number>(source, 2);
      expect(dropped.length).assertEqual(2);
      expect(dropped[0]).assertEqual(3);
      expect(dropped[1]).assertEqual(4);
      const kept: number[] = ArrayUtils.drop<number>(source, 0);
      expect(kept.length).assertEqual(4);
      expect(kept[0]).assertEqual(1);
      expect(ArrayUtils.drop<number>(source, 99).length).assertEqual(0);
      expect(ArrayUtils.drop<number>(source, -2).length).assertEqual(4);
      expect(source.length).assertEqual(4);
      expect(source[0]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0127
     * @tc.name      testNumArrayUtil0028
     * @tc.desc      Verify firstOrNull and lastOrNull return the boundary
     *               entries and degrade missing, empty and single entry lists
     *               to the empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumArrayUtil0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(ArrayUtils.firstOrNull(['a', 'b', 'c'])).assertEqual('a');
      expect(ArrayUtils.lastOrNull(['a', 'b', 'c'])).assertEqual('c');
      const emptyList: string[] = [];
      expect(ArrayUtils.firstOrNull(emptyList)).assertEqual('');
      expect(ArrayUtils.lastOrNull(emptyList)).assertEqual('');
      expect(ArrayUtils.firstOrNull(null)).assertEqual('');
      expect(ArrayUtils.lastOrNull(undefined)).assertEqual('');
      expect(ArrayUtils.firstOrNull(['only'])).assertEqual('only');
      expect(ArrayUtils.lastOrNull(['only'])).assertEqual('only');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_NUMARRAY_0128
     * @tc.name      testNumArrayUtil0029
     * @tc.desc      Verify range builds a half open integer sequence with the
     *               requested stride, raises a stride below one to one and
     *               returns nothing when start reaches end.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumArrayUtil0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      expect(ArrayUtils.range(0, 5, 1).length).assertEqual(5);
      const sparse: number[] = ArrayUtils.range(0, 5, 2);
      expect(sparse.length).assertEqual(3);
      expect(sparse[0]).assertEqual(0);
      expect(sparse[1]).assertEqual(2);
      expect(sparse[2]).assertEqual(4);
      expect(ArrayUtils.range(5, 5, 1).length).assertEqual(0);
      expect(ArrayUtils.range(3, 0, 1).length).assertEqual(0);
      const wideStride: number[] = ArrayUtils.range(2, 9, 3);
      expect(wideStride.length).assertEqual(3);
      expect(wideStride[2]).assertEqual(8);
      const zeroStride: number[] = ArrayUtils.range(0, 3, 0);
      expect(zeroStride.length).assertEqual(3);
      expect(zeroStride[0]).assertEqual(0);
    });
  });
}
