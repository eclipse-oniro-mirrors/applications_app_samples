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


import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { NumberStatisticsUtil } from './support/NumberStatisticsUtil';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_NUMSTAT]';

const DATA_SETS: number[][] = [
  [],
  [5],
  [1, 2],
  [1, 2, 3],
  [1, 2, 3, 4],
  [4, 3, 2, 1],
  [2, 2, 2],
  [1, 1, 2, 2, 3],
  [1, 2, 2, 3, 3],
  [-1, 1],
  [-3, -2, -1],
  [0, 0, 0],
  [10, 20, 30, 40, 50],
  [1.5, 2.5, 3.5],
  [100, 200, 300],
  [7],
  [9, 9],
  [5, 4, 3, 2, 1],
  [1, 3, 5, 7, 9],
  [2, 4, 6, 8, 10],
];

interface TotalCase {
  index: number;
  expected: number;
}

const TOTAL_CASES: TotalCase[] = [
  { index: 0, expected: 0 },
  { index: 1, expected: 5 },
  { index: 2, expected: 3 },
  { index: 3, expected: 6 },
  { index: 4, expected: 10 },
  { index: 5, expected: 10 },
  { index: 6, expected: 6 },
  { index: 7, expected: 9 },
  { index: 8, expected: 11 },
  { index: 9, expected: 0 },
  { index: 10, expected: -6 },
  { index: 11, expected: 0 },
  { index: 12, expected: 150 },
  { index: 13, expected: 7.5 },
  { index: 14, expected: 600 },
  { index: 15, expected: 7 },
  { index: 16, expected: 18 },
  { index: 17, expected: 15 },
  { index: 18, expected: 25 },
  { index: 19, expected: 30 },
];

interface MeanCase {
  index: number;
  expected: number;
}

const MEAN_CASES: MeanCase[] = [
  { index: 0, expected: 0 },
  { index: 1, expected: 5.0 },
  { index: 2, expected: 1.5 },
  { index: 3, expected: 2.0 },
  { index: 4, expected: 2.5 },
  { index: 5, expected: 2.5 },
  { index: 6, expected: 2.0 },
  { index: 7, expected: 1.8 },
  { index: 8, expected: 2.2 },
  { index: 9, expected: 0.0 },
  { index: 10, expected: -2.0 },
  { index: 11, expected: 0.0 },
  { index: 12, expected: 30.0 },
  { index: 13, expected: 2.5 },
  { index: 14, expected: 200.0 },
  { index: 15, expected: 7.0 },
  { index: 16, expected: 9.0 },
  { index: 17, expected: 3.0 },
  { index: 18, expected: 5.0 },
  { index: 19, expected: 6.0 },
];

interface MedianCase {
  index: number;
  expected: number;
}

const MEDIAN_CASES: MedianCase[] = [
  { index: 0, expected: 0 },
  { index: 1, expected: 5 },
  { index: 2, expected: 1.5 },
  { index: 3, expected: 2 },
  { index: 4, expected: 2.5 },
  { index: 5, expected: 2.5 },
  { index: 6, expected: 2 },
  { index: 7, expected: 2 },
  { index: 8, expected: 2 },
  { index: 9, expected: 0.0 },
  { index: 10, expected: -2 },
  { index: 11, expected: 0 },
  { index: 12, expected: 30 },
  { index: 13, expected: 2.5 },
  { index: 14, expected: 200 },
  { index: 15, expected: 7 },
  { index: 16, expected: 9.0 },
  { index: 17, expected: 3 },
  { index: 18, expected: 5 },
  { index: 19, expected: 6 },
];

interface ModeCase {
  index: number;
  expected: number;
}

const MODE_CASES: ModeCase[] = [
  { index: 0, expected: 0 },
  { index: 1, expected: 5 },
  { index: 2, expected: 1 },
  { index: 3, expected: 1 },
  { index: 4, expected: 1 },
  { index: 5, expected: 1 },
  { index: 6, expected: 2 },
  { index: 7, expected: 1 },
  { index: 8, expected: 2 },
  { index: 9, expected: -1 },
  { index: 10, expected: -3 },
  { index: 11, expected: 0 },
  { index: 12, expected: 10 },
  { index: 13, expected: 1.5 },
  { index: 14, expected: 100 },
  { index: 15, expected: 7 },
  { index: 16, expected: 9 },
  { index: 17, expected: 1 },
  { index: 18, expected: 1 },
  { index: 19, expected: 2 },
];

interface RangeCase {
  index: number;
  expected: number;
}

const RANGE_CASES: RangeCase[] = [
  { index: 0, expected: 0 },
  { index: 1, expected: 0 },
  { index: 2, expected: 1 },
  { index: 3, expected: 2 },
  { index: 4, expected: 3 },
  { index: 5, expected: 3 },
  { index: 6, expected: 0 },
  { index: 7, expected: 2 },
  { index: 8, expected: 2 },
  { index: 9, expected: 2 },
  { index: 10, expected: 2 },
  { index: 11, expected: 0 },
  { index: 12, expected: 40 },
  { index: 13, expected: 2.0 },
  { index: 14, expected: 200 },
  { index: 15, expected: 0 },
  { index: 16, expected: 0 },
  { index: 17, expected: 4 },
  { index: 18, expected: 8 },
  { index: 19, expected: 8 },
];

interface VarianceCase {
  index: number;
  expected: number;
}

const VARIANCE_CASES: VarianceCase[] = [
  { index: 0, expected: 0 },
  { index: 1, expected: 0.0 },
  { index: 2, expected: 0.25 },
  { index: 3, expected: 0.6666666666666666 },
  { index: 4, expected: 1.25 },
  { index: 5, expected: 1.25 },
  { index: 6, expected: 0.0 },
  { index: 7, expected: 0.56 },
  { index: 8, expected: 0.5599999999999999 },
  { index: 9, expected: 1.0 },
  { index: 10, expected: 0.6666666666666666 },
  { index: 11, expected: 0.0 },
  { index: 12, expected: 200.0 },
  { index: 13, expected: 0.6666666666666666 },
  { index: 14, expected: 6666.666666666667 },
  { index: 15, expected: 0.0 },
  { index: 16, expected: 0.0 },
  { index: 17, expected: 2.0 },
  { index: 18, expected: 8.0 },
  { index: 19, expected: 8.0 },
];

interface CountCase {
  index: number;
  expected: number;
}

const COUNT_CASES: CountCase[] = [
  { index: 0, expected: 0 },
  { index: 1, expected: 1 },
  { index: 2, expected: 0 },
  { index: 3, expected: 0 },
  { index: 4, expected: 1 },
  { index: 5, expected: 1 },
  { index: 6, expected: 0 },
  { index: 7, expected: 0 },
  { index: 8, expected: 0 },
  { index: 9, expected: 0 },
  { index: 10, expected: 0 },
  { index: 11, expected: 0 },
  { index: 12, expected: 5 },
  { index: 13, expected: 1 },
  { index: 14, expected: 3 },
  { index: 15, expected: 1 },
  { index: 16, expected: 2 },
  { index: 17, expected: 2 },
  { index: 18, expected: 3 },
  { index: 19, expected: 4 },
];

export default function numberStatisticsMatrixTest() {
  describe('NumberStatisticsMatrixTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'NumberStatisticsMatrixTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'NumberStatisticsMatrixTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTAT_0100
     * @tc.name      testTotal0001
     * @tc.desc      Verify total sums every data set including the empty and negative sets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testTotal0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testTotal0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < TOTAL_CASES.length; i++) {
        const row: TotalCase = TOTAL_CASES[i];
        const values: number[] = DATA_SETS[row.index];
        expect(Math.abs(NumberStatisticsUtil.total(values) - row.expected) < 0.000001).assertTrue();
        checked = checked + 1;
      }
      expect(checked).assertEqual(TOTAL_CASES.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'total rows checked: ' + checked);
      expect(NumberStatisticsUtil.total([])).assertEqual(0);
      expect(NumberStatisticsUtil.total([1])).assertEqual(1);
      expect(NumberStatisticsUtil.total([1, 2, 3])).assertEqual(6);
      expect(NumberStatisticsUtil.total([-1, 1])).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTAT_0200
     * @tc.name      testMean0002
     * @tc.desc      Verify mean averages each data set and returns zero for the empty set.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMean0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMean0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < MEAN_CASES.length; i++) {
        const row: MeanCase = MEAN_CASES[i];
        const values: number[] = DATA_SETS[row.index];
        expect(Math.abs(NumberStatisticsUtil.mean(values) - row.expected) < 0.000001).assertTrue();
        checked = checked + 1;
      }
      expect(checked).assertEqual(MEAN_CASES.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'mean rows checked: ' + checked);
      expect(NumberStatisticsUtil.mean([])).assertEqual(0);
      expect(NumberStatisticsUtil.mean([2])).assertEqual(2);
      expect(NumberStatisticsUtil.mean([1, 2, 3])).assertEqual(2);
      expect(NumberStatisticsUtil.mean([-1, 1])).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTAT_0300
     * @tc.name      testMedian0003
     * @tc.desc      Verify median handles odd, even, duplicated and empty data sets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMedian0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMedian0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < MEDIAN_CASES.length; i++) {
        const row: MedianCase = MEDIAN_CASES[i];
        const values: number[] = DATA_SETS[row.index];
        expect(Math.abs(NumberStatisticsUtil.median(values) - row.expected) < 0.000001).assertTrue();
        checked = checked + 1;
      }
      expect(checked).assertEqual(MEDIAN_CASES.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'median rows checked: ' + checked);
      expect(NumberStatisticsUtil.median([])).assertEqual(0);
      expect(NumberStatisticsUtil.median([3, 1, 2])).assertEqual(2);
      expect(NumberStatisticsUtil.median([4, 1, 3, 2])).assertEqual(2.5);
      expect(NumberStatisticsUtil.median([5, 5, 5])).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTAT_0400
     * @tc.name      testMode0004
     * @tc.desc      Verify mode prefers the most frequent value and the smallest value on frequency ties.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMode0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMode0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < MODE_CASES.length; i++) {
        const row: ModeCase = MODE_CASES[i];
        const values: number[] = DATA_SETS[row.index];
        expect(Math.abs(NumberStatisticsUtil.mode(values) - row.expected) < 0.000001).assertTrue();
        checked = checked + 1;
      }
      expect(checked).assertEqual(MODE_CASES.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'mode rows checked: ' + checked);
      expect(NumberStatisticsUtil.mode([])).assertEqual(0);
      expect(NumberStatisticsUtil.mode([1, 1, 2])).assertEqual(1);
      expect(NumberStatisticsUtil.mode([2, 1, 2, 1])).assertEqual(1);
      expect(NumberStatisticsUtil.mode([9])).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTAT_0500
     * @tc.name      testRange0005
     * @tc.desc      Verify range reports the difference between the maximum and minimum values.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRange0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRange0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < RANGE_CASES.length; i++) {
        const row: RangeCase = RANGE_CASES[i];
        const values: number[] = DATA_SETS[row.index];
        expect(Math.abs(NumberStatisticsUtil.range(values) - row.expected) < 0.000001).assertTrue();
        checked = checked + 1;
      }
      expect(checked).assertEqual(RANGE_CASES.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'range rows checked: ' + checked);
      expect(NumberStatisticsUtil.range([])).assertEqual(0);
      expect(NumberStatisticsUtil.range([7])).assertEqual(0);
      expect(NumberStatisticsUtil.range([1, 5])).assertEqual(4);
      expect(NumberStatisticsUtil.range([-5, 5])).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTAT_0600
     * @tc.name      testMinMax0006
     * @tc.desc      Verify minValue and maxValue scan the whole data set and return zero when empty.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMinMax0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMinMax0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberStatisticsUtil.minValue([])).assertEqual(0);
      expect(NumberStatisticsUtil.maxValue([])).assertEqual(0);
      expect(NumberStatisticsUtil.minValue([3, 1, 2])).assertEqual(1);
      expect(NumberStatisticsUtil.maxValue([3, 1, 2])).assertEqual(3);
      expect(NumberStatisticsUtil.minValue([-3, -1, -2])).assertEqual(-3);
      expect(NumberStatisticsUtil.maxValue([-3, -1, -2])).assertEqual(-1);
      expect(NumberStatisticsUtil.minValue([5])).assertEqual(5);
      expect(NumberStatisticsUtil.maxValue([5])).assertEqual(5);
      expect(NumberStatisticsUtil.minValue([1, 1, 1])).assertEqual(1);
      expect(NumberStatisticsUtil.maxValue([1, 1, 1])).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTAT_0700
     * @tc.name      testVariance0007
     * @tc.desc      Verify variance and stdDev use the population formula across the data sets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testVariance0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testVariance0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < VARIANCE_CASES.length; i++) {
        const row: VarianceCase = VARIANCE_CASES[i];
        const values: number[] = DATA_SETS[row.index];
        expect(Math.abs(NumberStatisticsUtil.variance(values) - row.expected) < 0.000001).assertTrue();
        checked = checked + 1;
      }
      expect(checked).assertEqual(VARIANCE_CASES.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'variance rows checked: ' + checked);
      expect(NumberStatisticsUtil.variance([])).assertEqual(0);
      expect(NumberStatisticsUtil.variance([5])).assertEqual(0);
      expect(NumberStatisticsUtil.variance([1, 3])).assertEqual(1);
      expect(Math.abs(NumberStatisticsUtil.stdDev([1, 3]) - 1) < 0.000001).assertTrue();
      expect(NumberStatisticsUtil.stdDev([])).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTAT_0800
     * @tc.name      testPercentile0008
     * @tc.desc      Verify percentile uses the nearest rank rule and clamps the requested percentile.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testPercentile0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testPercentile0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberStatisticsUtil.percentile([], 50)).assertEqual(0);
      expect(NumberStatisticsUtil.percentile([5], 50)).assertEqual(5);
      expect(NumberStatisticsUtil.percentile([1, 2, 3, 4], 0)).assertEqual(1);
      expect(NumberStatisticsUtil.percentile([1, 2, 3, 4], 25)).assertEqual(1);
      expect(NumberStatisticsUtil.percentile([1, 2, 3, 4], 50)).assertEqual(2);
      expect(NumberStatisticsUtil.percentile([1, 2, 3, 4], 75)).assertEqual(3);
      expect(NumberStatisticsUtil.percentile([1, 2, 3, 4], 100)).assertEqual(4);
      expect(NumberStatisticsUtil.percentile([4, 3, 2, 1], 50)).assertEqual(2);
      expect(NumberStatisticsUtil.percentile([1, 2, 3, 4], -10)).assertEqual(1);
      expect(NumberStatisticsUtil.percentile([1, 2, 3, 4], 150)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTAT_0900
     * @tc.name      testCountAbove0009
     * @tc.desc      Verify countAbove and countBelow split the data set around the requested threshold.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testCountAbove0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testCountAbove0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < COUNT_CASES.length; i++) {
        const row: CountCase = COUNT_CASES[i];
        const values: number[] = DATA_SETS[row.index];
        expect(Math.abs(NumberStatisticsUtil.countAbove(values, 3) - row.expected) < 0.000001).assertTrue();
        checked = checked + 1;
      }
      expect(checked).assertEqual(COUNT_CASES.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'countAbove rows checked: ' + checked);
      expect(NumberStatisticsUtil.countAbove([], 3)).assertEqual(0);
      expect(NumberStatisticsUtil.countAbove([4, 5], 3)).assertEqual(2);
      expect(NumberStatisticsUtil.countBelow([1, 2], 3)).assertEqual(2);
      expect(NumberStatisticsUtil.countBelow([], 3)).assertEqual(0);
      expect(NumberStatisticsUtil.countAbove([3], 3)).assertEqual(0);
      expect(NumberStatisticsUtil.countBelow([3], 3)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTAT_1000
     * @tc.name      testNormalize0010
     * @tc.desc      Verify normalize maps values into the zero to one range and handles flat data sets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNormalize0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNormalize0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const flat: number[] = NumberStatisticsUtil.normalize([1, 2, 3]);
      expect(flat.length).assertEqual(3);
      expect(flat[0]).assertEqual(0);
      expect(flat[1]).assertEqual(0.5);
      expect(flat[2]).assertEqual(1);
      const same: number[] = NumberStatisticsUtil.normalize([5, 5, 5]);
      expect(same[0]).assertEqual(0);
      expect(same[1]).assertEqual(0);
      expect(same[2]).assertEqual(0);
      expect(NumberStatisticsUtil.normalize([]).length).assertEqual(0);
      expect(NumberStatisticsUtil.normalize([-1, 1])[0]).assertEqual(0);
      expect(NumberStatisticsUtil.normalize([-1, 1])[1]).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTAT_1100
     * @tc.name      testDistinctCount0011
     * @tc.desc      Verify distinctCount reports the number of unique values in each data set.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testDistinctCount0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testDistinctCount0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(NumberStatisticsUtil.distinctCount([])).assertEqual(0);
      expect(NumberStatisticsUtil.distinctCount([1])).assertEqual(1);
      expect(NumberStatisticsUtil.distinctCount([1, 1, 1])).assertEqual(1);
      expect(NumberStatisticsUtil.distinctCount([1, 2, 3])).assertEqual(3);
      expect(NumberStatisticsUtil.distinctCount([1, 2, 1, 2])).assertEqual(2);
      expect(NumberStatisticsUtil.distinctCount([-1, 1])).assertEqual(2);
      expect(NumberStatisticsUtil.distinctCount([0, 0, 0])).assertEqual(1);
      expect(NumberStatisticsUtil.distinctCount([1, 2, 3, 4, 5])).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
