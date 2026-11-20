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
/** Number of entries of the bulk list used by the accumulation checks. */
const BULK_SIZE: number = 1000;

/**
 * Registers edge and extreme input cases of every array helper of the
 * shared library. All methods under test are pure static helpers, no
 * ability context is required.
 */
export default function arrayUtilsEdgeTest() {
  describe('ArrayUtilsEdgeTest', () => {
    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_0100
     * @tc.name      testArrayEdge0001
     * @tc.desc      Verify sum keeps the binary floating point behaviour and
     *               returns the exact IEEE result for fractional input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayEdge0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayEdge0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const fractional: number[] = [0.1, 0.2];
      expect(ArrayUtils.sum(fractional)).assertEqual(0.30000000000000004);
      const halves: number[] = [0.5, 0.25];
      expect(ArrayUtils.sum(halves)).assertEqual(0.75);
      const mixed: number[] = [1, 0.5, 0.5];
      expect(ArrayUtils.sum(mixed)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_0200
     * @tc.name      testArrayEdge0002
     * @tc.desc      Verify sum propagates one NaN entry into a NaN total
     *               because every addition with NaN stays NaN.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayEdge0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testArrayEdge0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const withNan: number[] = [Number.NaN, 1, 2];
      expect(Number.isNaN(ArrayUtils.sum(withNan))).assertTrue();
      const onlyNan: number[] = [Number.NaN];
      expect(Number.isNaN(ArrayUtils.sum(onlyNan))).assertTrue();
      const afterNan: number[] = [1, Number.NaN, -1];
      expect(Number.isNaN(ArrayUtils.sum(afterNan))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_0300
     * @tc.name      testArrayEdge0003
     * @tc.desc      Verify sum handles the largest finite double, opposite
     *               extremes cancelling out and the infinity absorption.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayEdge0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayEdge0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const alone: number[] = [Number.MAX_VALUE];
      expect(ArrayUtils.sum(alone)).assertEqual(Number.MAX_VALUE);
      const canceling: number[] = [Number.MAX_VALUE, -Number.MAX_VALUE];
      expect(ArrayUtils.sum(canceling)).assertEqual(0);
      const infinite: number[] = [Number.POSITIVE_INFINITY, 1];
      expect(ArrayUtils.sum(infinite)).assertEqual(Number.POSITIVE_INFINITY);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_0400
     * @tc.name      testArrayEdge0004
     * @tc.desc      Verify sum accumulates a thousand unit entries into the
     *               exact integer total without drift.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayEdge0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayEdge0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const bulk: number[] = [];
      for (let index = 0; index < BULK_SIZE; index++) {
        bulk.push(1);
      }
      expect(bulk.length).assertEqual(BULK_SIZE);
      expect(ArrayUtils.sum(bulk)).assertEqual(BULK_SIZE);
      expect(ArrayUtils.average(bulk)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_0500
     * @tc.name      testArrayEdge0005
     * @tc.desc      Verify max and min return NaN for an empty list because
     *               no real value can ever be the boundary.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayEdge0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayEdge0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const empty: number[] = [];
      expect(Number.isNaN(ArrayUtils.max(empty))).assertTrue();
      expect(Number.isNaN(ArrayUtils.min(empty))).assertTrue();
      expect(Number.isNaN(ArrayUtils.average(empty))).assertFalse();
      expect(ArrayUtils.average(empty)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_0600
     * @tc.name      testArrayEdge0006
     * @tc.desc      Verify max and min keep the seeded NaN boundary when a
     *               NaN entry leads the list, because comparisons with NaN
     *               are always false.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayEdge0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testArrayEdge0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const leadingNan: number[] = [Number.NaN, 1, 2];
      expect(Number.isNaN(ArrayUtils.max(leadingNan))).assertTrue();
      expect(Number.isNaN(ArrayUtils.min(leadingNan))).assertTrue();
      const trailingNan: number[] = [1, 2, Number.NaN];
      expect(ArrayUtils.max(trailingNan)).assertEqual(2);
      expect(ArrayUtils.min(trailingNan)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_0700
     * @tc.name      testArrayEdge0007
     * @tc.desc      Verify max and min treat the infinite boundaries of the
     *               number range correctly on both sides.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayEdge0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayEdge0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const withInfinity: number[] = [Number.POSITIVE_INFINITY, 1e308];
      expect(ArrayUtils.max(withInfinity)).assertEqual(Number.POSITIVE_INFINITY);
      const withNegativeInfinity: number[] = [Number.NEGATIVE_INFINITY, -1e308];
      expect(ArrayUtils.min(withNegativeInfinity)).assertEqual(Number.NEGATIVE_INFINITY);
      const bounded: number[] = [Number.NEGATIVE_INFINITY, 0, Number.POSITIVE_INFINITY];
      expect(ArrayUtils.max(bounded)).assertEqual(Number.POSITIVE_INFINITY);
      expect(ArrayUtils.min(bounded)).assertEqual(Number.NEGATIVE_INFINITY);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_0800
     * @tc.name      testArrayEdge0008
     * @tc.desc      Verify max and min return the shared value when every
     *               entry of the list is identical.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayEdge0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testArrayEdge0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const equalPositive: number[] = [5, 5, 5, 5];
      expect(ArrayUtils.max(equalPositive)).assertEqual(5);
      expect(ArrayUtils.min(equalPositive)).assertEqual(5);
      const equalNegative: number[] = [-7, -7];
      expect(ArrayUtils.max(equalNegative)).assertEqual(-7);
      expect(ArrayUtils.min(equalNegative)).assertEqual(-7);
      const equalZero: number[] = [0, 0, 0];
      expect(ArrayUtils.max(equalZero)).assertEqual(0);
      expect(ArrayUtils.min(equalZero)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_0900
     * @tc.name      testArrayEdge0009
     * @tc.desc      Verify average propagates NaN and infinity entries in
     *               the same way as the underlying arithmetic does.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayEdge0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testArrayEdge0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const withNan: number[] = [Number.NaN, 1];
      expect(Number.isNaN(ArrayUtils.average(withNan))).assertTrue();
      const withInfinity: number[] = [Number.POSITIVE_INFINITY, 1];
      expect(ArrayUtils.average(withInfinity)).assertEqual(Number.POSITIVE_INFINITY);
      const cancelingInfinity: number[] = [Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY];
      expect(Number.isNaN(ArrayUtils.average(cancelingInfinity))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_1000
     * @tc.name      testArrayEdge0010
     * @tc.desc      Verify average of a single entry equals the entry itself
     *               and repeated equal entries keep that value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayEdge0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayEdge0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const single: number[] = [7];
      expect(ArrayUtils.average(single)).assertEqual(7);
      const repeated: number[] = [4, 4, 4];
      expect(ArrayUtils.average(repeated)).assertEqual(4);
      const singleNegative: number[] = [-9];
      expect(ArrayUtils.average(singleNegative)).assertEqual(-9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_1100
     * @tc.name      testArrayEdge0011
     * @tc.desc      Verify chunk raises a zero or negative group size up to
     *               one so every entry gets its own group.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayEdge0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayEdge0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const list: number[] = [1, 2, 3];
      const zeroSize: number[][] = ArrayUtils.chunk(list, 0);
      expect(zeroSize.length).assertEqual(3);
      expect(zeroSize[0].length).assertEqual(1);
      expect(zeroSize[0][0]).assertEqual(1);
      expect(zeroSize[2][0]).assertEqual(3);
      const negativeSize: number[][] = ArrayUtils.chunk(list, -5);
      expect(negativeSize.length).assertEqual(3);
      expect(negativeSize[0][0]).assertEqual(1);
      expect(negativeSize[2][0]).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_1200
     * @tc.name      testArrayEdge0012
     * @tc.desc      Verify chunk of an empty list is empty and a fractional
     *               size below two is floored to single entry groups.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayEdge0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayEdge0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const empty: number[] = [];
      expect(ArrayUtils.chunk(empty, 3).length).assertEqual(0);
      const list: number[] = [1, 2, 3];
      const fractional: number[][] = ArrayUtils.chunk(list, 1.5);
      expect(fractional.length).assertEqual(3);
      expect(fractional[0][0]).assertEqual(1);
      expect(fractional[1][0]).assertEqual(2);
      expect(fractional[2][0]).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_1300
     * @tc.name      testArrayEdge0013
     * @tc.desc      Verify chunk with a group size far above the list length
     *               keeps the whole list inside one single group.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayEdge0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayEdge0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const list: number[] = [1, 2, 3, 4, 5];
      const huge: number[][] = ArrayUtils.chunk(list, 1000000);
      expect(huge.length).assertEqual(1);
      expect(huge[0].length).assertEqual(5);
      expect(huge[0][0]).assertEqual(1);
      expect(huge[0][4]).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_1400
     * @tc.name      testArrayEdge0014
     * @tc.desc      Verify chunk of a list whose length divides evenly by
     *               the group size produces equally sized groups.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayEdge0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayEdge0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const list: number[] = [1, 2, 3, 4];
      const even: number[][] = ArrayUtils.chunk(list, 2);
      expect(even.length).assertEqual(2);
      expect(even[0].length).assertEqual(2);
      expect(even[1].length).assertEqual(2);
      expect(even[0][0]).assertEqual(1);
      expect(even[0][1]).assertEqual(2);
      expect(even[1][0]).assertEqual(3);
      expect(even[1][1]).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_1500
     * @tc.name      testArrayEdge0015
     * @tc.desc      Verify distinct of an empty list stays empty and NaN
     *               entries collapse into one because the set uses the
     *               same value comparison.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayEdge0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testArrayEdge0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const empty: number[] = [];
      expect(ArrayUtils.distinct(empty).length).assertEqual(0);
      const nanRepeated: number[] = [Number.NaN, Number.NaN, 1];
      const cleaned: number[] = ArrayUtils.distinct(nanRepeated);
      expect(cleaned.length).assertEqual(2);
      expect(Number.isNaN(cleaned[0])).assertTrue();
      expect(cleaned[1]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_1600
     * @tc.name      testArrayEdge0016
     * @tc.desc      Verify distinct treats zero and negative zero as one
     *               value and keeps the first occurrence in place.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayEdge0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testArrayEdge0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const zeros: number[] = [0, -0, 0];
      const cleaned: number[] = ArrayUtils.distinct(zeros);
      expect(cleaned.length).assertEqual(1);
      expect(cleaned[0]).assertEqual(0);
      const mixed: number[] = [0, 1, -0, 2];
      const mixedCleaned: number[] = ArrayUtils.distinct(mixed);
      expect(mixedCleaned.length).assertEqual(3);
      expect(mixedCleaned[0]).assertEqual(0);
      expect(mixedCleaned[1]).assertEqual(1);
      expect(mixedCleaned[2]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_1700
     * @tc.name      testArrayEdge0017
     * @tc.desc      Verify distinct keeps the first occurrence order across
     *               an interleaved list of repeated values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayEdge0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayEdge0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const interleaved: number[] = [1, 2, 1, 3, 2, 4, 1];
      const cleaned: number[] = ArrayUtils.distinct(interleaved);
      expect(cleaned.length).assertEqual(4);
      expect(cleaned[0]).assertEqual(1);
      expect(cleaned[1]).assertEqual(2);
      expect(cleaned[2]).assertEqual(3);
      expect(cleaned[3]).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_1800
     * @tc.name      testArrayEdge0018
     * @tc.desc      Verify flatten of an empty outer list, nested empty
     *               groups and single entry groups stays stable.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayEdge0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayEdge0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const outerEmpty: string[][] = [];
      expect(ArrayUtils.flatten(outerEmpty).length).assertEqual(0);
      const nestedEmpty: string[][] = [[], []];
      expect(ArrayUtils.flatten(nestedEmpty).length).assertEqual(0);
      const partial: string[][] = [['a'], []];
      const flat: string[] = ArrayUtils.flatten(partial);
      expect(flat.length).assertEqual(1);
      expect(flat[0]).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_1900
     * @tc.name      testArrayEdge0019
     * @tc.desc      Verify reverseCopy of an empty and a two entry list and
     *               that the source list keeps its original order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayEdge0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayEdge0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ArrayUtils.reverseCopy([]).length).assertEqual(0);
      const pair: number[] = [1, 2];
      const flipped: number[] = ArrayUtils.reverseCopy(pair);
      expect(flipped[0]).assertEqual(2);
      expect(flipped[1]).assertEqual(1);
      expect(pair[0]).assertEqual(1);
      expect(pair[1]).assertEqual(2);
      expect(pair.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_2000
     * @tc.name      testArrayEdge0020
     * @tc.desc      Verify contains of an empty list is false, NaN can never
     *               be found through indexOf and zero matches negative zero.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayEdge0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayEdge0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const empty: number[] = [];
      expect(ArrayUtils.contains(empty, 5)).assertFalse();
      const nanList: number[] = [Number.NaN];
      expect(ArrayUtils.contains(nanList, Number.NaN)).assertFalse();
      const zeroList: number[] = [0];
      expect(ArrayUtils.contains(zeroList, -0)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_2100
     * @tc.name      testArrayEdge0021
     * @tc.desc      Verify contains finds the value at the first and at the
     *               last index and rejects values outside the list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayEdge0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayEdge0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const list: number[] = [1, 2, 3];
      expect(ArrayUtils.contains(list, 1)).assertTrue();
      expect(ArrayUtils.contains(list, 3)).assertTrue();
      expect(ArrayUtils.contains(list, 2)).assertTrue();
      expect(ArrayUtils.contains(list, 0)).assertFalse();
      expect(ArrayUtils.contains(list, 4)).assertFalse();
      expect(ArrayUtils.contains(list, -1)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_2200
     * @tc.name      testArrayEdge0022
     * @tc.desc      Verify indexOfSafe maps an empty list, a missing value
     *               and missing lists to the minus one sentinel.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayEdge0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayEdge0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ArrayUtils.indexOfSafe([], 0)).assertEqual(-1);
      expect(ArrayUtils.indexOfSafe([4, 5, 6], 7)).assertEqual(-1);
      expect(ArrayUtils.indexOfSafe(undefined, 1)).assertEqual(-1);
      expect(ArrayUtils.indexOfSafe(null, 1)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_2300
     * @tc.name      testArrayEdge0023
     * @tc.desc      Verify indexOfSafe returns the exact index of the value
     *               at the first, middle and last position.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayEdge0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayEdge0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const list: number[] = [7, 8, 9];
      expect(ArrayUtils.indexOfSafe(list, 7)).assertEqual(0);
      expect(ArrayUtils.indexOfSafe(list, 8)).assertEqual(1);
      expect(ArrayUtils.indexOfSafe(list, 9)).assertEqual(2);
      expect(ArrayUtils.indexOfSafe(list, -7)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_2400
     * @tc.name      testArrayEdge0024
     * @tc.desc      Verify join honours an explicitly empty separator by
     *               gluing the numbers together without any gap.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayEdge0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayEdge0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const list: number[] = [1, 2, 3];
      expect(ArrayUtils.join(list, '')).assertEqual('123');
      const negatives: number[] = [-1, -2];
      expect(ArrayUtils.join(negatives, '')).assertEqual('-1-2');
      expect(ArrayUtils.join([], '')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_2500
     * @tc.name      testArrayEdge0025
     * @tc.desc      Verify join falls back to the default two space comma
     *               separator for an undefined separator.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayEdge0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayEdge0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const list: number[] = [1, 2, 3];
      expect(ArrayUtils.join(list, undefined)).assertEqual('1, 2, 3');
      expect(ArrayUtils.join(list)).assertEqual('1, 2, 3');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_2600
     * @tc.name      testArrayEdge0026
     * @tc.desc      Verify join converts very large numbers through the
     *               exponential string form of the platform conversion.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayEdge0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testArrayEdge0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const huge: number[] = [1e21];
      expect(ArrayUtils.join(huge, '')).assertEqual('1e+21');
      const hugePair: number[] = [1e21, 2e21];
      expect(ArrayUtils.join(hugePair, '|')).assertEqual('1e+21|2e+21');
      const small: number[] = [1e-7];
      expect(ArrayUtils.join(small, '')).assertEqual('1e-7');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_2700
     * @tc.name      testArrayEdge0027
     * @tc.desc      Verify take of an empty list, a non positive count and
     *               a count equal to the length stays within the contract.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayEdge0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayEdge0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const empty: number[] = [];
      expect(ArrayUtils.take(empty, 3).length).assertEqual(0);
      const list: number[] = [1, 2, 3];
      expect(ArrayUtils.take(list, -1).length).assertEqual(0);
      expect(ArrayUtils.take(list, 0).length).assertEqual(0);
      const full: number[] = ArrayUtils.take(list, 3);
      expect(full.length).assertEqual(3);
      expect(full[0]).assertEqual(1);
      expect(full[2]).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_2800
     * @tc.name      testArrayEdge0028
     * @tc.desc      Verify take copies the leading part and never touches
     *               the source list content or its length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayEdge0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayEdge0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const list: number[] = [1, 2, 3];
      const head: number[] = ArrayUtils.take(list, 2);
      expect(head.length).assertEqual(2);
      expect(head[0]).assertEqual(1);
      expect(head[1]).assertEqual(2);
      expect(list.length).assertEqual(3);
      expect(list[0]).assertEqual(1);
      expect(list[1]).assertEqual(2);
      expect(list[2]).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_2900
     * @tc.name      testArrayEdge0029
     * @tc.desc      Verify drop of an empty list, a negative count keeping
     *               everything and a count equal to the length clearing all.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayEdge0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayEdge0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ArrayUtils.drop([], 2).length).assertEqual(0);
      const list: number[] = [1, 2, 3];
      const kept: number[] = ArrayUtils.drop(list, -5);
      expect(kept.length).assertEqual(3);
      expect(kept[0]).assertEqual(1);
      expect(kept[2]).assertEqual(3);
      expect(ArrayUtils.drop(list, 3).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_3000
     * @tc.name      testArrayEdge0030
     * @tc.desc      Verify drop with a zero count returns a real copy so a
     *               later write on the copy leaves the source untouched.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayEdge0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testArrayEdge0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const list: number[] = [1, 2, 3];
      const copy: number[] = ArrayUtils.drop(list, 0);
      expect(copy.length).assertEqual(3);
      copy[0] = 99;
      expect(copy[0]).assertEqual(99);
      expect(list[0]).assertEqual(1);
      expect(list.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_3100
     * @tc.name      testArrayEdge0031
     * @tc.desc      Verify firstOrNull keeps an explicit empty string entry
     *               and degrades missing lists to the empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayEdge0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayEdge0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const blankFirst: string[] = ['', 'b'];
      expect(ArrayUtils.firstOrNull(blankFirst)).assertEqual('');
      expect(ArrayUtils.firstOrNull(undefined)).assertEqual('');
      expect(ArrayUtils.firstOrNull(null)).assertEqual('');
      const text: string[] = ['first', 'second'];
      expect(ArrayUtils.firstOrNull(text)).assertEqual('first');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_3200
     * @tc.name      testArrayEdge0032
     * @tc.desc      Verify lastOrNull of a single entry list and missing
     *               lists maps to the entry or the empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayEdge0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayEdge0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const single: string[] = ['x'];
      expect(ArrayUtils.lastOrNull(single)).assertEqual('x');
      expect(ArrayUtils.lastOrNull(undefined)).assertEqual('');
      expect(ArrayUtils.lastOrNull(null)).assertEqual('');
      const blankLast: string[] = ['a', ''];
      expect(ArrayUtils.lastOrNull(blankLast)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_3300
     * @tc.name      testArrayEdge0033
     * @tc.desc      Verify range raises a zero or negative step up to one
     *               so the sequence still advances to the bound.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testArrayEdge0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testArrayEdge0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const zeroStep: number[] = ArrayUtils.range(2, 8, 0);
      expect(zeroStep.length).assertEqual(6);
      expect(zeroStep[0]).assertEqual(2);
      expect(zeroStep[5]).assertEqual(7);
      const negativeStep: number[] = ArrayUtils.range(2, 8, -3);
      expect(negativeStep.length).assertEqual(6);
      expect(negativeStep[0]).assertEqual(2);
      expect(negativeStep[5]).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_3400
     * @tc.name      testArrayEdge0034
     * @tc.desc      Verify range produces no entry when the start equals or
     *               exceeds the exclusive bound.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testArrayEdge0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testArrayEdge0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(ArrayUtils.range(5, 5, 1).length).assertEqual(0);
      expect(ArrayUtils.range(5, 2, 1).length).assertEqual(0);
      expect(ArrayUtils.range(0, 0, 1).length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_3500
     * @tc.name      testArrayEdge0035
     * @tc.desc      Verify range walks negative intervals and floors a
     *               fractional step above one before stepping.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayEdge0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testArrayEdge0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const negative: number[] = ArrayUtils.range(-3, 0, 1);
      expect(negative.length).assertEqual(3);
      expect(negative[0]).assertEqual(-3);
      expect(negative[1]).assertEqual(-2);
      expect(negative[2]).assertEqual(-1);
      const fractional: number[] = ArrayUtils.range(0, 6, 2.5);
      expect(fractional.length).assertEqual(3);
      expect(fractional[0]).assertEqual(0);
      expect(fractional[1]).assertEqual(2);
      expect(fractional[2]).assertEqual(4);
      const tiny: number[] = ArrayUtils.range(1, 10, 1.9);
      expect(tiny.length).assertEqual(9);
      expect(tiny[8]).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_PHOTOPICKER_ARREDGE_3600
     * @tc.name      testArrayEdge0036
     * @tc.desc      Verify isEmpty keeps a list with one empty string entry
     *               non empty and scales to a two hundred entry list.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayEdge0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testArrayEdge0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const blankEntry: string[] = [''];
      expect(ArrayUtils.isEmpty(blankEntry)).assertFalse();
      const longList: number[] = ArrayUtils.range(0, 200, 1);
      expect(longList.length).assertEqual(200);
      expect(ArrayUtils.isEmpty(longList)).assertFalse();
      const emptyList: number[] = [];
      expect(ArrayUtils.isEmpty(emptyList)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
