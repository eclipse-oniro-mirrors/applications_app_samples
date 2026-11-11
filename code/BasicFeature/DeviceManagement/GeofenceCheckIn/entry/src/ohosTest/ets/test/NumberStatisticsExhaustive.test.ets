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
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_NUMSTEXH]';

interface DatasetCase {
  label: string;
  total: number;
  mean: number;
  median: number;
  range: number;
}

const DATASET_CASES: DatasetCase[] = [
  { label: 'd1', total: 1, mean: 1.0, median: 0, range: 0 },
  { label: 'd2', total: 3, mean: 1.5, median: 0, range: 1 },
  { label: 'd3', total: 6, mean: 2.0, median: 0, range: 2 },
  { label: 'd4', total: 10, mean: 2.5, median: 0, range: 3 },
  { label: 'd5', total: 15, mean: 3.0, median: 0, range: 4 },
  { label: 'd6', total: 21, mean: 3.5, median: 0, range: 5 },
  { label: 'd7', total: 28, mean: 4.0, median: 0, range: 6 },
  { label: 'dataset_8', total: 36, mean: 4.5, median: 0, range: 7 },
  { label: 'd9', total: 45, mean: 5.0, median: 0, range: 8 },
  { label: 'd10', total: 55, mean: 5.5, median: 0, range: 9 },
  { label: 'd11', total: 66, mean: 6.0, median: 0, range: 10 },
  { label: 'd12', total: 78, mean: 6.5, median: 0, range: 11 },
  { label: 'd13', total: 91, mean: 7.0, median: 0, range: 12 },
  { label: 'd14', total: 105, mean: 7.5, median: 0, range: 13 },
  { label: 'd15', total: 120, mean: 8.0, median: 0, range: 14 },
  { label: 'd16', total: 136, mean: 8.5, median: 0, range: 15 },
  { label: 'd17', total: 153, mean: 9.0, median: 0, range: 16 },
  { label: 'd18', total: 171, mean: 9.5, median: 0, range: 17 },
  { label: 'd19', total: 190, mean: 10.0, median: 0, range: 18 },
  { label: 'd20', total: 210, mean: 10.5, median: 0, range: 19 },
  { label: 'd21', total: 231, mean: 11.0, median: 0, range: 20 },
  { label: 'd22', total: 253, mean: 11.5, median: 0, range: 21 },
  { label: 'd23', total: 276, mean: 12.0, median: 0, range: 22 },
  { label: 'd24', total: 300, mean: 12.5, median: 0, range: 23 },
  { label: 'd25', total: 325, mean: 13.0, median: 0, range: 24 },
  { label: 'd26', total: 351, mean: 13.5, median: 0, range: 25 },
  { label: 'd27', total: 378, mean: 14.0, median: 0, range: 26 },
  { label: 'd28', total: 406, mean: 14.5, median: 0, range: 27 },
  { label: 'd29', total: 435, mean: 15.0, median: 0, range: 28 },
  { label: 'd30', total: 465, mean: 15.5, median: 0, range: 29 },
  { label: 'd31', total: 496, mean: 16.0, median: 0, range: 30 },
  { label: 'd32', total: 528, mean: 16.5, median: 0, range: 31 },
  { label: 'd33', total: 561, mean: 17.0, median: 0, range: 32 },
  { label: 'd34', total: 595, mean: 17.5, median: 0, range: 33 },
  { label: 'd35', total: 630, mean: 18.0, median: 0, range: 34 },
  { label: 'd36', total: 666, mean: 18.5, median: 0, range: 35 },
  { label: 'd37', total: 703, mean: 19.0, median: 0, range: 36 },
  { label: 'd38', total: 741, mean: 19.5, median: 0, range: 37 },
  { label: 'd39', total: 780, mean: 20.0, median: 0, range: 38 },
  { label: 'd40', total: 820, mean: 20.5, median: 0, range: 39 },
  { label: 'd41', total: 861, mean: 21.0, median: 0, range: 40 },
  { label: 'd42', total: 903, mean: 21.5, median: 0, range: 41 },
  { label: 'd43', total: 946, mean: 22.0, median: 0, range: 42 },
  { label: 'd44', total: 990, mean: 22.5, median: 0, range: 43 },
  { label: 'd45', total: 1035, mean: 23.0, median: 0, range: 44 },
  { label: 'd46', total: 1081, mean: 23.5, median: 0, range: 45 },
  { label: 'd47', total: 1128, mean: 24.0, median: 0, range: 46 },
  { label: 'd48', total: 1176, mean: 24.5, median: 0, range: 47 },
  { label: 'd49', total: 1225, mean: 25.0, median: 0, range: 48 },
  { label: 'd50', total: 1275, mean: 25.5, median: 0, range: 49 },
  { label: 'd51', total: 1326, mean: 26.0, median: 0, range: 50 },
  { label: 'd52', total: 1378, mean: 26.5, median: 0, range: 51 },
  { label: 'd53', total: 1431, mean: 27.0, median: 0, range: 52 },
  { label: 'd54', total: 1485, mean: 27.5, median: 0, range: 53 },
  { label: 'd55', total: 1540, mean: 28.0, median: 0, range: 54 },
  { label: 'd56', total: 1596, mean: 28.5, median: 0, range: 55 },
  { label: 'd57', total: 1653, mean: 29.0, median: 0, range: 56 },
  { label: 'd58', total: 1711, mean: 29.5, median: 0, range: 57 },
  { label: 'd59', total: 1770, mean: 30.0, median: 0, range: 58 },
  { label: 'd60', total: 1830, mean: 30.5, median: 0, range: 59 },
  { label: 'd61', total: 1891, mean: 31.0, median: 0, range: 60 },
  { label: 'd62', total: 1953, mean: 31.5, median: 0, range: 61 },
  { label: 'd63', total: 2016, mean: 32.0, median: 0, range: 62 },
  { label: 'd64', total: 2080, mean: 32.5, median: 0, range: 63 },
  { label: 'd65', total: 2145, mean: 33.0, median: 0, range: 64 },
  { label: 'd66', total: 2211, mean: 33.5, median: 0, range: 65 },
  { label: 'd67', total: 2278, mean: 34.0, median: 0, range: 66 },
  { label: 'd68', total: 2346, mean: 34.5, median: 0, range: 67 },
  { label: 'd69', total: 2415, mean: 35.0, median: 0, range: 68 },
  { label: 'd70', total: 2485, mean: 35.5, median: 0, range: 69 },
  { label: 'd71', total: 2556, mean: 36.0, median: 0, range: 70 },
  { label: 'd72', total: 2628, mean: 36.5, median: 0, range: 71 },
  { label: 'd73', total: 2701, mean: 37.0, median: 0, range: 72 },
  { label: 'd74', total: 2775, mean: 37.5, median: 0, range: 73 },
  { label: 'd75', total: 2850, mean: 38.0, median: 0, range: 74 },
  { label: 'd76', total: 2926, mean: 38.5, median: 0, range: 75 },
  { label: 'd77', total: 3003, mean: 39.0, median: 0, range: 76 },
  { label: 'd78', total: 3081, mean: 39.5, median: 0, range: 77 },
  { label: 'd79', total: 3160, mean: 40.0, median: 0, range: 78 },
  { label: 'dataset_80', total: 3240, mean: 40.5, median: 0, range: 79 },
  { label: 'dataset_81', total: 3321, mean: 41.0, median: 0, range: 80 },
  { label: 'dataset_82', total: 3403, mean: 41.5, median: 0, range: 81 },
  { label: 'dataset_83', total: 3486, mean: 42.0, median: 0, range: 82 },
  { label: 'dataset_84', total: 3570, mean: 42.5, median: 0, range: 83 },
  { label: 'dataset_85', total: 3655, mean: 43.0, median: 0, range: 84 },
  { label: 'dataset_86', total: 3741, mean: 43.5, median: 0, range: 85 },
  { label: 'dataset_87', total: 3828, mean: 44.0, median: 0, range: 86 },
  { label: 'dataset_88', total: 3916, mean: 44.5, median: 0, range: 87 },
  { label: 'dataset_89', total: 4005, mean: 45.0, median: 0, range: 88 },
  { label: 'd90', total: 4095, mean: 45.5, median: 0, range: 89 },
  { label: 'd91', total: 4186, mean: 46.0, median: 0, range: 90 },
  { label: 'd92', total: 4278, mean: 46.5, median: 0, range: 91 },
  { label: 'd93', total: 4371, mean: 47.0, median: 0, range: 92 },
  { label: 'd94', total: 4465, mean: 47.5, median: 0, range: 93 },
  { label: 'd95', total: 4560, mean: 48.0, median: 0, range: 94 },
  { label: 'd96', total: 4656, mean: 48.5, median: 0, range: 95 },
  { label: 'd97', total: 4753, mean: 49.0, median: 0, range: 96 },
  { label: 'd98', total: 4851, mean: 49.5, median: 0, range: 97 },
  { label: 'd99', total: 4950, mean: 50.0, median: 0, range: 98 },
  { label: 'd100', total: 5050, mean: 50.5, median: 0, range: 99 },
];

export default function numberStatisticsExhaustiveTest() {
  describe('NumberStatisticsExhaustiveTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'NumberStatisticsExhaustiveTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'NumberStatisticsExhaustiveTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTEXH_0100
     * @tc.name      testStatisticsExhaustive0001
     * @tc.desc      Verify total, mean and range for the first one hundred prefix data sets.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testStatisticsExhaustive0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testStatisticsExhaustive0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(DATASET_CASES.length).assertEqual(100);
      let checked: number = 0;
      for (let i = 0; i < DATASET_CASES.length; i++) {
        const row: DatasetCase = DATASET_CASES[i];
        const size: number = i + 1;
        const values: number[] = [];
        for (let k = 1; k <= size; k++) {
          values.push(k);
        }
        expect(NumberStatisticsUtil.total(values)).assertEqual(row.total);
        expect(NumberStatisticsUtil.mean(values)).assertEqual(row.mean);
        expect(NumberStatisticsUtil.range(values)).assertEqual(row.range);
        checked = checked + 1;
      }
      expect(checked).assertEqual(100);
      expect(NumberStatisticsUtil.total([])).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTEXH_0200
     * @tc.name      testMedianExhaustive0002
     * @tc.desc      Verify the median of every prefix data set matches the middle element rule.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testMedianExhaustive0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testMedianExhaustive0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let size = 1; size <= 100; size++) {
        const values: number[] = [];
        for (let k = 1; k <= size; k++) {
          values.push(k);
        }
        const expected: number = size % 2 === 1 ? (size + 1) / 2 : size / 2 + 0.5;
        expect(NumberStatisticsUtil.median(values)).assertEqual(expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(100);
      expect(NumberStatisticsUtil.median([])).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_NUMSTEXH_0300
     * @tc.name      testModeExhaustive0003
     * @tc.desc      Verify the mode of every prefix data set is the smallest most frequent value.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testModeExhaustive0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testModeExhaustive0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let size = 1; size <= 100; size++) {
        const values: number[] = [];
        for (let k = 1; k <= size; k++) {
          values.push(k);
        }
        values.push(1);
        expect(NumberStatisticsUtil.mode(values)).assertEqual(1);
        checked = checked + 1;
      }
      expect(checked).assertEqual(100);
      expect(NumberStatisticsUtil.mode([])).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
