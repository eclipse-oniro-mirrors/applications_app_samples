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
import { ArrayUtils } from 'photopickersendable';
import { hilog } from '@kit.PerformanceAnalysisKit';

/** Log domain of the sample application. */
const DOMAIN: number = 0xF811;

/**
 * Registers the numeric matrix cases of every array helper of the shared
 * library. All methods under test are pure static helpers without any
 * platform dependency, so no ability context is required.
 */
export default function arrayUtilsMatrixTest() {
  describe('ArrayUtilsMatrixTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_0100
     * @tc.name      testArrayMatrix0001
     * @tc.desc      Verify isEmpty reports true for an empty string list and
     *               false once one single entry is stored.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayMatrix0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const emptyList: string[] = [];
      expect(ArrayUtils.isEmpty(emptyList)).assertTrue();
      const oneEntry: string[] = ['a'];
      expect(ArrayUtils.isEmpty(oneEntry)).assertFalse();
      const manyEntries: string[] = ['a', 'b', 'c'];
      expect(ArrayUtils.isEmpty(manyEntries)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_0200
     * @tc.name      testArrayMatrix0002
     * @tc.desc      Verify isEmpty accepts number and boolean lists plus the
     *               missing list forms undefined and null.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMatrix0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayMatrix0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const emptyNumbers: number[] = [];
      expect(ArrayUtils.isEmpty(emptyNumbers)).assertTrue();
      const filledNumbers: number[] = [1];
      expect(ArrayUtils.isEmpty(filledNumbers)).assertFalse();
      const emptyFlags: boolean[] = [];
      expect(ArrayUtils.isEmpty(emptyFlags)).assertTrue();
      expect(ArrayUtils.isEmpty(undefined)).assertTrue();
      expect(ArrayUtils.isEmpty(null)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_0300
     * @tc.name      testArrayMatrix0003
     * @tc.desc      Verify sum accumulates a list of positive integers into
     *               the exact arithmetic total.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMatrix0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayMatrix0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const small: number[] = [1, 2, 3];
      expect(ArrayUtils.sum(small)).assertEqual(6);
      const tens: number[] = [10, 20, 30, 40];
      expect(ArrayUtils.sum(tens)).assertEqual(100);
      const mixedSizes: number[] = [7];
      expect(ArrayUtils.sum(mixedSizes)).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_0400
     * @tc.name      testArrayMatrix0004
     * @tc.desc      Verify sum handles negative addends and zero entries so
     *               the signed total stays correct.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMatrix0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayMatrix0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const signed: number[] = [5, -3, 2];
      expect(ArrayUtils.sum(signed)).assertEqual(4);
      const allNegative: number[] = [-1, -2, -3];
      expect(ArrayUtils.sum(allNegative)).assertEqual(-6);
      const withZero: number[] = [0, 9, 0];
      expect(ArrayUtils.sum(withZero)).assertEqual(9);
      const cancelling: number[] = [4, -4, 8, -8];
      expect(ArrayUtils.sum(cancelling)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_0500
     * @tc.name      testArrayMatrix0005
     * @tc.desc      Verify sum returns the single entry itself for a one
     *               element list and zero for the empty list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayMatrix0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayMatrix0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const single: number[] = [42];
      expect(ArrayUtils.sum(single)).assertEqual(42);
      const empty: number[] = [];
      expect(ArrayUtils.sum(empty)).assertEqual(0);
      const negativeSingle: number[] = [-7];
      expect(ArrayUtils.sum(negativeSingle)).assertEqual(-7);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_0600
     * @tc.name      testArrayMatrix0006
     * @tc.desc      Verify max picks the greatest entry of a positive list
     *               regardless of the position of the winner.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayMatrix0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const ascending: number[] = [1, 5, 9];
      expect(ArrayUtils.max(ascending)).assertEqual(9);
      const descending: number[] = [9, 5, 1];
      expect(ArrayUtils.max(descending)).assertEqual(9);
      const middlePeak: number[] = [3, 8, 4];
      expect(ArrayUtils.max(middlePeak)).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_0700
     * @tc.name      testArrayMatrix0007
     * @tc.desc      Verify max returns the value closest to zero when every
     *               entry is negative.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMatrix0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayMatrix0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const negatives: number[] = [-5, -2, -9];
      expect(ArrayUtils.max(negatives)).assertEqual(-2);
      const tailWinner: number[] = [-10, -8, -3];
      expect(ArrayUtils.max(tailWinner)).assertEqual(-3);
      const headWinner: number[] = [-1, -6, -7];
      expect(ArrayUtils.max(headWinner)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_0800
     * @tc.name      testArrayMatrix0008
     * @tc.desc      Verify max keeps the first winner for duplicated values
     *               and handles single entry and zero only lists.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayMatrix0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayMatrix0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const duplicated: number[] = [4, 4, 4];
      expect(ArrayUtils.max(duplicated)).assertEqual(4);
      const single: number[] = [12];
      expect(ArrayUtils.max(single)).assertEqual(12);
      const zeros: number[] = [0, 0];
      expect(ArrayUtils.max(zeros)).assertEqual(0);
      const zeroInMiddle: number[] = [-1, 0, -2];
      expect(ArrayUtils.max(zeroInMiddle)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_0900
     * @tc.name      testArrayMatrix0009
     * @tc.desc      Verify min picks the smallest entry for positive and
     *               negative mixed lists.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMatrix0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayMatrix0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const positives: number[] = [2, 7, 4];
      expect(ArrayUtils.min(positives)).assertEqual(2);
      const mixed: number[] = [3, -5, 8];
      expect(ArrayUtils.min(mixed)).assertEqual(-5);
      const deepNegative: number[] = [-9, -4, -1];
      expect(ArrayUtils.min(deepNegative)).assertEqual(-9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_1000
     * @tc.name      testArrayMatrix0010
     * @tc.desc      Verify min keeps the first winner for duplicated values
     *               and handles single entry lists.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayMatrix0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayMatrix0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const duplicated: number[] = [6, 6, 6];
      expect(ArrayUtils.min(duplicated)).assertEqual(6);
      const single: number[] = [-13];
      expect(ArrayUtils.min(single)).assertEqual(-13);
      const zeroTail: number[] = [5, 2, 0];
      expect(ArrayUtils.min(zeroTail)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_1100
     * @tc.name      testArrayMatrix0011
     * @tc.desc      Verify average divides the total evenly when the entry
     *               count divides the sum without remainder.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMatrix0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayMatrix0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const even: number[] = [2, 4, 6];
      expect(ArrayUtils.average(even)).assertEqual(4);
      const symmetric: number[] = [10, 10, 10];
      expect(ArrayUtils.average(symmetric)).assertEqual(10);
      const pair: number[] = [3, 5];
      expect(ArrayUtils.average(pair)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_1200
     * @tc.name      testArrayMatrix0012
     * @tc.desc      Verify average produces the exact fractional mean when
     *               the sum is not divisible by the entry count.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMatrix0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayMatrix0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const halfMean: number[] = [1, 2];
      expect(ArrayUtils.average(halfMean)).assertEqual(1.5);
      const thirdMean: number[] = [1, 1, 1];
      expect(ArrayUtils.average(thirdMean)).assertEqual(1);
      const quarterMean: number[] = [1, 2, 3, 4];
      expect(ArrayUtils.average(quarterMean)).assertEqual(2.5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_1300
     * @tc.name      testArrayMatrix0013
     * @tc.desc      Verify average maps the empty list to zero so callers
     *               never observe NaN and keeps a single entry unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayMatrix0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayMatrix0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const empty: number[] = [];
      expect(ArrayUtils.average(empty)).assertEqual(0);
      const single: number[] = [-9];
      expect(ArrayUtils.average(single)).assertEqual(-9);
      const singleFraction: number[] = [0.5];
      expect(ArrayUtils.average(singleFraction)).assertEqual(0.5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_1400
     * @tc.name      testArrayMatrix0014
     * @tc.desc      Verify average handles negative addends and zero entries
     *               while keeping the signed mean correct.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayMatrix0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayMatrix0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const negativeMean: number[] = [-2, -4];
      expect(ArrayUtils.average(negativeMean)).assertEqual(-3);
      const zeroAnchor: number[] = [0, 4];
      expect(ArrayUtils.average(zeroAnchor)).assertEqual(2);
      const cancelling: number[] = [-5, 5];
      expect(ArrayUtils.average(cancelling)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_1500
     * @tc.name      testArrayMatrix0015
     * @tc.desc      Verify chunk splits an evenly divisible list into groups
     *               of exactly the requested size in original order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMatrix0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayMatrix0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const list: number[] = [1, 2, 3, 4];
      const groups: number[][] = ArrayUtils.chunk(list, 2);
      expect(groups.length).assertEqual(2);
      expect(groups[0].length).assertEqual(2);
      expect(groups[0][0]).assertEqual(1);
      expect(groups[0][1]).assertEqual(2);
      expect(groups[1].length).assertEqual(2);
      expect(groups[1][0]).assertEqual(3);
      expect(groups[1][1]).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_1600
     * @tc.name      testArrayMatrix0016
     * @tc.desc      Verify chunk keeps the trailing remainder as a shorter
     *               final group instead of dropping it.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMatrix0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayMatrix0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const list: number[] = [1, 2, 3, 4, 5];
      const groups: number[][] = ArrayUtils.chunk(list, 2);
      expect(groups.length).assertEqual(3);
      expect(groups[2].length).assertEqual(1);
      expect(groups[2][0]).assertEqual(5);
      const tripletTail: number[][] = ArrayUtils.chunk([1, 2, 3, 4, 5, 6, 7], 3);
      expect(tripletTail.length).assertEqual(3);
      expect(tripletTail[2].length).assertEqual(1);
      expect(tripletTail[2][0]).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_1700
     * @tc.name      testArrayMatrix0017
     * @tc.desc      Verify chunk yields one single group when the requested
     *               size reaches or exceeds the list length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayMatrix0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayMatrix0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const list: number[] = [1, 2, 3];
      const oversized: number[][] = ArrayUtils.chunk(list, 10);
      expect(oversized.length).assertEqual(1);
      expect(oversized[0].length).assertEqual(3);
      const exact: number[][] = ArrayUtils.chunk(list, 3);
      expect(exact.length).assertEqual(1);
      expect(exact[0].length).assertEqual(3);
      expect(exact[0][2]).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_1800
     * @tc.name      testArrayMatrix0018
     * @tc.desc      Verify chunk works for string lists through the generic
     *               parameter and preserves the entry order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayMatrix0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayMatrix0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const words: string[] = ['a', 'b', 'c', 'd', 'e'];
      const groups: string[][] = ArrayUtils.chunk(words, 2);
      expect(groups.length).assertEqual(3);
      expect(groups[0][0]).assertEqual('a');
      expect(groups[0][1]).assertEqual('b');
      expect(groups[1][0]).assertEqual('c');
      expect(groups[1][1]).assertEqual('d');
      expect(groups[2][0]).assertEqual('e');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_1900
     * @tc.name      testArrayMatrix0019
     * @tc.desc      Verify chunk floors a fractional group size before
     *               slicing so 2.9 behaves like the integer two.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayMatrix0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayMatrix0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const list: number[] = [1, 2, 3, 4];
      const groups: number[][] = ArrayUtils.chunk(list, 2.9);
      expect(groups.length).assertEqual(2);
      expect(groups[0].length).assertEqual(2);
      expect(groups[1].length).assertEqual(2);
      const justAboveOne: number[][] = ArrayUtils.chunk([1, 2, 3], 1.5);
      expect(justAboveOne.length).assertEqual(3);
      expect(justAboveOne[0].length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_2000
     * @tc.name      testArrayMatrix0020
     * @tc.desc      Verify distinct removes duplicated numbers while keeping
     *               the first occurrence order of every value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMatrix0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayMatrix0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const duplicated: number[] = [1, 2, 1, 3, 2];
      const unique: number[] = ArrayUtils.distinct(duplicated);
      expect(unique.length).assertEqual(3);
      expect(unique[0]).assertEqual(1);
      expect(unique[1]).assertEqual(2);
      expect(unique[2]).assertEqual(3);
      const interleaved: number[] = [5, 6, 5, 6, 7];
      const cleaned: number[] = ArrayUtils.distinct(interleaved);
      expect(cleaned.length).assertEqual(3);
      expect(cleaned[2]).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_2100
     * @tc.name      testArrayMatrix0021
     * @tc.desc      Verify distinct keeps a list without duplicates untouched
     *               and collapses a fully duplicated list to one entry.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayMatrix0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayMatrix0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const alreadyUnique: number[] = [9, 8, 7];
      const kept: number[] = ArrayUtils.distinct(alreadyUnique);
      expect(kept.length).assertEqual(3);
      expect(kept[0]).assertEqual(9);
      expect(kept[1]).assertEqual(8);
      expect(kept[2]).assertEqual(7);
      const allSame: number[] = [4, 4, 4, 4];
      const collapsed: number[] = ArrayUtils.distinct(allSame);
      expect(collapsed.length).assertEqual(1);
      expect(collapsed[0]).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_2200
     * @tc.name      testArrayMatrix0022
     * @tc.desc      Verify flatten concatenates every nested string group in
     *               order into one level deep list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayMatrix0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const groups: string[][] = [['a', 'b'], ['c'], ['d', 'e']];
      const flat: string[] = ArrayUtils.flatten(groups);
      expect(flat.length).assertEqual(5);
      expect(flat[0]).assertEqual('a');
      expect(flat[1]).assertEqual('b');
      expect(flat[2]).assertEqual('c');
      expect(flat[3]).assertEqual('d');
      expect(flat[4]).assertEqual('e');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_2300
     * @tc.name      testArrayMatrix0023
     * @tc.desc      Verify flatten skips empty inner groups without producing
     *               placeholder entries.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayMatrix0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayMatrix0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const withEmptyGroup: string[][] = [[], ['x'], []];
      const flat: string[] = ArrayUtils.flatten(withEmptyGroup);
      expect(flat.length).assertEqual(1);
      expect(flat[0]).assertEqual('x');
      const allEmpty: string[][] = [[], [], []];
      expect(ArrayUtils.flatten(allEmpty).length).assertEqual(0);
      const noGroups: string[][] = [];
      expect(ArrayUtils.flatten(noGroups).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_2400
     * @tc.name      testArrayMatrix0024
     * @tc.desc      Verify reverseCopy returns a new reversed list and leaves
     *               the input list in its original order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMatrix0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayMatrix0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const original: number[] = [1, 2, 3];
      const reversed: number[] = ArrayUtils.reverseCopy(original);
      expect(reversed.length).assertEqual(3);
      expect(reversed[0]).assertEqual(3);
      expect(reversed[1]).assertEqual(2);
      expect(reversed[2]).assertEqual(1);
      expect(original[0]).assertEqual(1);
      expect(original[1]).assertEqual(2);
      expect(original[2]).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_2500
     * @tc.name      testArrayMatrix0025
     * @tc.desc      Verify reverseCopy works for string lists, keeps a
     *               palindrome stable and maps a single entry to itself.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayMatrix0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayMatrix0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const words: string[] = ['a', 'b', 'c'];
      const reversed: string[] = ArrayUtils.reverseCopy(words);
      expect(reversed[0]).assertEqual('c');
      expect(reversed[1]).assertEqual('b');
      expect(reversed[2]).assertEqual('a');
      const palindrome: string[] = ['x', 'x'];
      const mirrored: string[] = ArrayUtils.reverseCopy(palindrome);
      expect(mirrored[0]).assertEqual('x');
      expect(mirrored[1]).assertEqual('x');
      const single: string[] = ['only'];
      expect(ArrayUtils.reverseCopy(single)[0]).assertEqual('only');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_2600
     * @tc.name      testArrayMatrix0026
     * @tc.desc      Verify contains reports membership for present, absent,
     *               negative and zero values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMatrix0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayMatrix0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const list: number[] = [1, 2, 3];
      expect(ArrayUtils.contains(list, 2)).assertTrue();
      expect(ArrayUtils.contains(list, 9)).assertFalse();
      const signed: number[] = [-1, 0, 1];
      expect(ArrayUtils.contains(signed, -1)).assertTrue();
      expect(ArrayUtils.contains(signed, 0)).assertTrue();
      expect(ArrayUtils.contains(signed, 7)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_2700
     * @tc.name      testArrayMatrix0027
     * @tc.desc      Verify indexOfSafe returns the position of present values
     *               and minus one for absent values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMatrix0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayMatrix0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const list: number[] = [10, 20, 30];
      expect(ArrayUtils.indexOfSafe(list, 10)).assertEqual(0);
      expect(ArrayUtils.indexOfSafe(list, 20)).assertEqual(1);
      expect(ArrayUtils.indexOfSafe(list, 30)).assertEqual(2);
      expect(ArrayUtils.indexOfSafe(list, 99)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_2800
     * @tc.name      testArrayMatrix0028
     * @tc.desc      Verify indexOfSafe degrades missing lists to minus one
     *               instead of throwing for undefined and null inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayMatrix0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayMatrix0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ArrayUtils.indexOfSafe(undefined, 1)).assertEqual(-1);
      expect(ArrayUtils.indexOfSafe(null, 1)).assertEqual(-1);
      const empty: number[] = [];
      expect(ArrayUtils.indexOfSafe(empty, 0)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_2900
     * @tc.name      testArrayMatrix0029
     * @tc.desc      Verify join glues numbers with the default comma space
     *               separator and with a custom one character separator.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMatrix0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayMatrix0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const list: number[] = [1, 2, 3];
      expect(ArrayUtils.join(list)).assertEqual('1, 2, 3');
      expect(ArrayUtils.join(list, '-')).assertEqual('1-2-3');
      expect(ArrayUtils.join(list, '|')).assertEqual('1|2|3');
      expect(ArrayUtils.join(list, '')).assertEqual('123');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_3000
     * @tc.name      testArrayMatrix0030
     * @tc.desc      Verify join renders an empty list as empty text, keeps a
     *               single entry bare and formats signed decimal values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayMatrix0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayMatrix0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const empty: number[] = [];
      expect(ArrayUtils.join(empty, '-')).assertEqual('');
      const single: number[] = [7];
      expect(ArrayUtils.join(single, '-')).assertEqual('7');
      const signed: number[] = [-1, 0, 2.5];
      expect(ArrayUtils.join(signed, ',')).assertEqual('-1,0,2.5');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_3100
     * @tc.name      testArrayMatrix0031
     * @tc.desc      Verify take keeps the requested leading entries and maps
     *               zero or negative counts to an empty list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMatrix0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayMatrix0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const list: number[] = [1, 2, 3, 4];
      const first: number[] = ArrayUtils.take(list, 2);
      expect(first.length).assertEqual(2);
      expect(first[0]).assertEqual(1);
      expect(first[1]).assertEqual(2);
      const overshoot: number[] = ArrayUtils.take(list, 10);
      expect(overshoot.length).assertEqual(4);
      expect(ArrayUtils.take(list, 0).length).assertEqual(0);
      expect(ArrayUtils.take(list, -3).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_3200
     * @tc.name      testArrayMatrix0032
     * @tc.desc      Verify drop removes the requested leading entries, keeps
     *               the whole list for zero counts and empties on overshoot.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayMatrix0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayMatrix0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const list: number[] = [1, 2, 3, 4];
      const dropped: number[] = ArrayUtils.drop(list, 2);
      expect(dropped.length).assertEqual(2);
      expect(dropped[0]).assertEqual(3);
      expect(dropped[1]).assertEqual(4);
      const overshoot: number[] = ArrayUtils.drop(list, 10);
      expect(overshoot.length).assertEqual(0);
      const kept: number[] = ArrayUtils.drop(list, 0);
      expect(kept.length).assertEqual(4);
      expect(kept[0]).assertEqual(1);
      expect(kept[3]).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_3300
     * @tc.name      testArrayMatrix0033
     * @tc.desc      Verify firstOrNull and lastOrNull return the boundary
     *               entries of a filled list and empty text for empty lists.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMatrix0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayMatrix0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const words: string[] = ['a', 'b', 'c'];
      expect(ArrayUtils.firstOrNull(words)).assertEqual('a');
      expect(ArrayUtils.lastOrNull(words)).assertEqual('c');
      const empty: string[] = [];
      expect(ArrayUtils.firstOrNull(empty)).assertEqual('');
      expect(ArrayUtils.lastOrNull(empty)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_3400
     * @tc.name      testArrayMatrix0034
     * @tc.desc      Verify firstOrNull and lastOrNull tolerate missing lists
     *               and single entry lists without throwing.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayMatrix0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayMatrix0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ArrayUtils.firstOrNull(undefined)).assertEqual('');
      expect(ArrayUtils.firstOrNull(null)).assertEqual('');
      expect(ArrayUtils.lastOrNull(undefined)).assertEqual('');
      expect(ArrayUtils.lastOrNull(null)).assertEqual('');
      const single: string[] = ['solo'];
      expect(ArrayUtils.firstOrNull(single)).assertEqual('solo');
      expect(ArrayUtils.lastOrNull(single)).assertEqual('solo');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_3500
     * @tc.name      testArrayMatrix0035
     * @tc.desc      Verify range builds a consecutive integer sequence with
     *               the exclusive upper bound and a custom step.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayMatrix0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayMatrix0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const simple: number[] = ArrayUtils.range(0, 3, 1);
      expect(simple.length).assertEqual(3);
      expect(simple[0]).assertEqual(0);
      expect(simple[1]).assertEqual(1);
      expect(simple[2]).assertEqual(2);
      const stepped: number[] = ArrayUtils.range(0, 5, 2);
      expect(stepped.length).assertEqual(3);
      expect(stepped[0]).assertEqual(0);
      expect(stepped[1]).assertEqual(2);
      expect(stepped[2]).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_3600
     * @tc.name      testArrayMatrix0036
     * @tc.desc      Verify range yields an empty sequence when the bound does
     *               not advance and supports negative start values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayMatrix0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayMatrix0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ArrayUtils.range(5, 5, 1).length).assertEqual(0);
      expect(ArrayUtils.range(5, 2, 1).length).assertEqual(0);
      const negative: number[] = ArrayUtils.range(-3, 1, 1);
      expect(negative.length).assertEqual(4);
      expect(negative[0]).assertEqual(-3);
      expect(negative[1]).assertEqual(-2);
      expect(negative[2]).assertEqual(-1);
      expect(negative[3]).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARRMAT_3700
     * @tc.name      testArrayMatrix0037
     * @tc.desc      Verify composed pipelines such as distinct followed by
     *               sum and reverseCopy followed by join stay consistent.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayMatrix0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testArrayMatrix0037';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const duplicated: number[] = [2, 2, 3];
      const cleaned: number[] = ArrayUtils.distinct(duplicated);
      expect(ArrayUtils.sum(cleaned)).assertEqual(5);
      expect(ArrayUtils.max(cleaned)).assertEqual(3);
      expect(ArrayUtils.min(cleaned)).assertEqual(2);
      const words: string[] = ['a', 'b', 'c'];
      const reversed: string[] = ArrayUtils.reverseCopy(words);
      expect(ArrayUtils.firstOrNull(reversed)).assertEqual('c');
      expect(ArrayUtils.lastOrNull(reversed)).assertEqual('a');
      const numbers: number[] = [5, 6, 7];
      const flipped: number[] = ArrayUtils.reverseCopy(numbers);
      expect(ArrayUtils.join(flipped, '-')).assertEqual('7-6-5');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
