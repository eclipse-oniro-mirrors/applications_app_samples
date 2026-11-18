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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { hotCityAt } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for hotCityAt (96 cases). */
export default function hotCityAt2Test(): void {
  describe('HotCityAt2Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0097
     * @tc.name      CitySearch_HotCityAt_0097
     * @tc.desc      hotCityAt(index=69) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0097 begin`);
      const actual: string = hotCityAt(69);
      logInfo(`hotCityAt(index=69): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0097 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0098
     * @tc.name      CitySearch_HotCityAt_0098
     * @tc.desc      hotCityAt(index=-7) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0098 begin`);
      const actual: string = hotCityAt(-7);
      logInfo(`hotCityAt(index=-7): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0098 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0099
     * @tc.name      CitySearch_HotCityAt_0099
     * @tc.desc      hotCityAt(index=68.07) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0099 begin`);
      const actual: string = hotCityAt(68.07);
      logInfo(`hotCityAt(index=68.07): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0099 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0100
     * @tc.name      CitySearch_HotCityAt_0100
     * @tc.desc      hotCityAt(index=69.33) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0100 begin`);
      const actual: string = hotCityAt(69.33);
      logInfo(`hotCityAt(index=69.33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0100 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0101
     * @tc.name      CitySearch_HotCityAt_0101
     * @tc.desc      hotCityAt(index=188) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0101 begin`);
      const actual: string = hotCityAt(188);
      logInfo(`hotCityAt(index=188): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0101 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0102
     * @tc.name      CitySearch_HotCityAt_0102
     * @tc.desc      hotCityAt(index=-58) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0102 begin`);
      const actual: string = hotCityAt(-58);
      logInfo(`hotCityAt(index=-58): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0102 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0103
     * @tc.name      CitySearch_HotCityAt_0103
     * @tc.desc      hotCityAt(index=-8) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0103 begin`);
      const actual: string = hotCityAt(-8);
      logInfo(`hotCityAt(index=-8): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0103 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0104
     * @tc.name      CitySearch_HotCityAt_0104
     * @tc.desc      hotCityAt(index=72.38) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0104 begin`);
      const actual: string = hotCityAt(72.38);
      logInfo(`hotCityAt(index=72.38): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0104 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0105
     * @tc.name      CitySearch_HotCityAt_0105
     * @tc.desc      hotCityAt(index=-74) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0105 begin`);
      const actual: string = hotCityAt(-74);
      logInfo(`hotCityAt(index=-74): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0105 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0106
     * @tc.name      CitySearch_HotCityAt_0106
     * @tc.desc      hotCityAt(index=78.17) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0106 begin`);
      const actual: string = hotCityAt(78.17);
      logInfo(`hotCityAt(index=78.17): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0106 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0107
     * @tc.name      CitySearch_HotCityAt_0107
     * @tc.desc      hotCityAt(index=101) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0107 begin`);
      const actual: string = hotCityAt(101);
      logInfo(`hotCityAt(index=101): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0107 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0108
     * @tc.name      CitySearch_HotCityAt_0108
     * @tc.desc      hotCityAt(index=-4) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0108 begin`);
      const actual: string = hotCityAt(-4);
      logInfo(`hotCityAt(index=-4): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0108 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0109
     * @tc.name      CitySearch_HotCityAt_0109
     * @tc.desc      hotCityAt(index=3.86) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0109 begin`);
      const actual: string = hotCityAt(3.86);
      logInfo(`hotCityAt(index=3.86): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0109 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0110
     * @tc.name      CitySearch_HotCityAt_0110
     * @tc.desc      hotCityAt(index=42) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0110 begin`);
      const actual: string = hotCityAt(42);
      logInfo(`hotCityAt(index=42): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0110 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0111
     * @tc.name      CitySearch_HotCityAt_0111
     * @tc.desc      hotCityAt(index=122) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0111 begin`);
      const actual: string = hotCityAt(122);
      logInfo(`hotCityAt(index=122): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0111 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0112
     * @tc.name      CitySearch_HotCityAt_0112
     * @tc.desc      hotCityAt(index=174) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0112 begin`);
      const actual: string = hotCityAt(174);
      logInfo(`hotCityAt(index=174): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0112 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0113
     * @tc.name      CitySearch_HotCityAt_0113
     * @tc.desc      hotCityAt(index=-2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0113 begin`);
      const actual: string = hotCityAt(-2);
      logInfo(`hotCityAt(index=-2): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0113 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0114
     * @tc.name      CitySearch_HotCityAt_0114
     * @tc.desc      hotCityAt(index=37) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0114 begin`);
      const actual: string = hotCityAt(37);
      logInfo(`hotCityAt(index=37): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0114 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0115
     * @tc.name      CitySearch_HotCityAt_0115
     * @tc.desc      hotCityAt(index=49) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0115 begin`);
      const actual: string = hotCityAt(49);
      logInfo(`hotCityAt(index=49): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0115 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0116
     * @tc.name      CitySearch_HotCityAt_0116
     * @tc.desc      hotCityAt(index=-3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0116 begin`);
      const actual: string = hotCityAt(-3);
      logInfo(`hotCityAt(index=-3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0116 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0117
     * @tc.name      CitySearch_HotCityAt_0117
     * @tc.desc      hotCityAt(index=158) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0117 begin`);
      const actual: string = hotCityAt(158);
      logInfo(`hotCityAt(index=158): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0117 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0118
     * @tc.name      CitySearch_HotCityAt_0118
     * @tc.desc      hotCityAt(index=63) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0118 begin`);
      const actual: string = hotCityAt(63);
      logInfo(`hotCityAt(index=63): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0118 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0119
     * @tc.name      CitySearch_HotCityAt_0119
     * @tc.desc      hotCityAt(index=3.52) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0119 begin`);
      const actual: string = hotCityAt(3.52);
      logInfo(`hotCityAt(index=3.52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0119 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0120
     * @tc.name      CitySearch_HotCityAt_0120
     * @tc.desc      hotCityAt(index=-33) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0120 begin`);
      const actual: string = hotCityAt(-33);
      logInfo(`hotCityAt(index=-33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0120 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0121
     * @tc.name      CitySearch_HotCityAt_0121
     * @tc.desc      hotCityAt(index=41.91) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0121 begin`);
      const actual: string = hotCityAt(41.91);
      logInfo(`hotCityAt(index=41.91): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0121 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0122
     * @tc.name      CitySearch_HotCityAt_0122
     * @tc.desc      hotCityAt(index=168) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0122 begin`);
      const actual: string = hotCityAt(168);
      logInfo(`hotCityAt(index=168): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0122 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0123
     * @tc.name      CitySearch_HotCityAt_0123
     * @tc.desc      hotCityAt(index=80.7) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0123 begin`);
      const actual: string = hotCityAt(80.7);
      logInfo(`hotCityAt(index=80.7): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0123 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0124
     * @tc.name      CitySearch_HotCityAt_0124
     * @tc.desc      hotCityAt(index=48) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0124 begin`);
      const actual: string = hotCityAt(48);
      logInfo(`hotCityAt(index=48): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0124 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0125
     * @tc.name      CitySearch_HotCityAt_0125
     * @tc.desc      hotCityAt(index=129) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0125 begin`);
      const actual: string = hotCityAt(129);
      logInfo(`hotCityAt(index=129): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0125 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0126
     * @tc.name      CitySearch_HotCityAt_0126
     * @tc.desc      hotCityAt(index=76.63) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0126 begin`);
      const actual: string = hotCityAt(76.63);
      logInfo(`hotCityAt(index=76.63): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0126 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0127
     * @tc.name      CitySearch_HotCityAt_0127
     * @tc.desc      hotCityAt(index=133) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0127 begin`);
      const actual: string = hotCityAt(133);
      logInfo(`hotCityAt(index=133): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0127 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0128
     * @tc.name      CitySearch_HotCityAt_0128
     * @tc.desc      hotCityAt(index=92) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0128 begin`);
      const actual: string = hotCityAt(92);
      logInfo(`hotCityAt(index=92): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0128 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0129
     * @tc.name      CitySearch_HotCityAt_0129
     * @tc.desc      hotCityAt(index=-78) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0129 begin`);
      const actual: string = hotCityAt(-78);
      logInfo(`hotCityAt(index=-78): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0129 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0130
     * @tc.name      CitySearch_HotCityAt_0130
     * @tc.desc      hotCityAt(index=109) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0130 begin`);
      const actual: string = hotCityAt(109);
      logInfo(`hotCityAt(index=109): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0130 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0131
     * @tc.name      CitySearch_HotCityAt_0131
     * @tc.desc      hotCityAt(index=94) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0131 begin`);
      const actual: string = hotCityAt(94);
      logInfo(`hotCityAt(index=94): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0131 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0132
     * @tc.name      CitySearch_HotCityAt_0132
     * @tc.desc      hotCityAt(index=-84) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0132 begin`);
      const actual: string = hotCityAt(-84);
      logInfo(`hotCityAt(index=-84): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0132 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0133
     * @tc.name      CitySearch_HotCityAt_0133
     * @tc.desc      hotCityAt(index=17) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0133 begin`);
      const actual: string = hotCityAt(17);
      logInfo(`hotCityAt(index=17): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0133 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0134
     * @tc.name      CitySearch_HotCityAt_0134
     * @tc.desc      hotCityAt(index=53) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0134 begin`);
      const actual: string = hotCityAt(53);
      logInfo(`hotCityAt(index=53): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0134 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0135
     * @tc.name      CitySearch_HotCityAt_0135
     * @tc.desc      hotCityAt(index=83) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0135 begin`);
      const actual: string = hotCityAt(83);
      logInfo(`hotCityAt(index=83): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0135 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0136
     * @tc.name      CitySearch_HotCityAt_0136
     * @tc.desc      hotCityAt(index=192) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0136 begin`);
      const actual: string = hotCityAt(192);
      logInfo(`hotCityAt(index=192): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0136 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0137
     * @tc.name      CitySearch_HotCityAt_0137
     * @tc.desc      hotCityAt(index=137) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0137 begin`);
      const actual: string = hotCityAt(137);
      logInfo(`hotCityAt(index=137): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0137 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0138
     * @tc.name      CitySearch_HotCityAt_0138
     * @tc.desc      hotCityAt(index=-46) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0138 begin`);
      const actual: string = hotCityAt(-46);
      logInfo(`hotCityAt(index=-46): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0138 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0139
     * @tc.name      CitySearch_HotCityAt_0139
     * @tc.desc      hotCityAt(index=64.29) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0139 begin`);
      const actual: string = hotCityAt(64.29);
      logInfo(`hotCityAt(index=64.29): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0139 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0140
     * @tc.name      CitySearch_HotCityAt_0140
     * @tc.desc      hotCityAt(index=-96) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0140 begin`);
      const actual: string = hotCityAt(-96);
      logInfo(`hotCityAt(index=-96): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0140 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0141
     * @tc.name      CitySearch_HotCityAt_0141
     * @tc.desc      hotCityAt(index=78) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0141 begin`);
      const actual: string = hotCityAt(78);
      logInfo(`hotCityAt(index=78): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0141 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0142
     * @tc.name      CitySearch_HotCityAt_0142
     * @tc.desc      hotCityAt(index=43.36) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0142 begin`);
      const actual: string = hotCityAt(43.36);
      logInfo(`hotCityAt(index=43.36): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0142 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0143
     * @tc.name      CitySearch_HotCityAt_0143
     * @tc.desc      hotCityAt(index=-38) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0143 begin`);
      const actual: string = hotCityAt(-38);
      logInfo(`hotCityAt(index=-38): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0143 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0144
     * @tc.name      CitySearch_HotCityAt_0144
     * @tc.desc      hotCityAt(index=127) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0144 begin`);
      const actual: string = hotCityAt(127);
      logInfo(`hotCityAt(index=127): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0144 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0145
     * @tc.name      CitySearch_HotCityAt_0145
     * @tc.desc      hotCityAt(index=-98) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0145 begin`);
      const actual: string = hotCityAt(-98);
      logInfo(`hotCityAt(index=-98): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0145 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0146
     * @tc.name      CitySearch_HotCityAt_0146
     * @tc.desc      hotCityAt(index=118) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0146 begin`);
      const actual: string = hotCityAt(118);
      logInfo(`hotCityAt(index=118): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0146 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0147
     * @tc.name      CitySearch_HotCityAt_0147
     * @tc.desc      hotCityAt(index=8.66) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0147 begin`);
      const actual: string = hotCityAt(8.66);
      logInfo(`hotCityAt(index=8.66): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0147 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0148
     * @tc.name      CitySearch_HotCityAt_0148
     * @tc.desc      hotCityAt(index=91) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0148 begin`);
      const actual: string = hotCityAt(91);
      logInfo(`hotCityAt(index=91): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0148 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0149
     * @tc.name      CitySearch_HotCityAt_0149
     * @tc.desc      hotCityAt(index=-36) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0149 begin`);
      const actual: string = hotCityAt(-36);
      logInfo(`hotCityAt(index=-36): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0149 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0150
     * @tc.name      CitySearch_HotCityAt_0150
     * @tc.desc      hotCityAt(index=5.17) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0150 begin`);
      const actual: string = hotCityAt(5.17);
      logInfo(`hotCityAt(index=5.17): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0150 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0151
     * @tc.name      CitySearch_HotCityAt_0151
     * @tc.desc      hotCityAt(index=68.28) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0151 begin`);
      const actual: string = hotCityAt(68.28);
      logInfo(`hotCityAt(index=68.28): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0151 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0152
     * @tc.name      CitySearch_HotCityAt_0152
     * @tc.desc      hotCityAt(index=54) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0152 begin`);
      const actual: string = hotCityAt(54);
      logInfo(`hotCityAt(index=54): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0152 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0153
     * @tc.name      CitySearch_HotCityAt_0153
     * @tc.desc      hotCityAt(index=-37) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0153 begin`);
      const actual: string = hotCityAt(-37);
      logInfo(`hotCityAt(index=-37): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0153 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0154
     * @tc.name      CitySearch_HotCityAt_0154
     * @tc.desc      hotCityAt(index=93.61) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0154 begin`);
      const actual: string = hotCityAt(93.61);
      logInfo(`hotCityAt(index=93.61): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0154 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0155
     * @tc.name      CitySearch_HotCityAt_0155
     * @tc.desc      hotCityAt(index=62.9) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0155 begin`);
      const actual: string = hotCityAt(62.9);
      logInfo(`hotCityAt(index=62.9): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0155 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0156
     * @tc.name      CitySearch_HotCityAt_0156
     * @tc.desc      hotCityAt(index=154) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0156 begin`);
      const actual: string = hotCityAt(154);
      logInfo(`hotCityAt(index=154): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0156 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0157
     * @tc.name      CitySearch_HotCityAt_0157
     * @tc.desc      hotCityAt(index=19) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0157 begin`);
      const actual: string = hotCityAt(19);
      logInfo(`hotCityAt(index=19): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0157 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0158
     * @tc.name      CitySearch_HotCityAt_0158
     * @tc.desc      hotCityAt(index=183) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0158 begin`);
      const actual: string = hotCityAt(183);
      logInfo(`hotCityAt(index=183): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0158 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0159
     * @tc.name      CitySearch_HotCityAt_0159
     * @tc.desc      hotCityAt(index=-67) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0159 begin`);
      const actual: string = hotCityAt(-67);
      logInfo(`hotCityAt(index=-67): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0159 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0160
     * @tc.name      CitySearch_HotCityAt_0160
     * @tc.desc      hotCityAt(index=104) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0160 begin`);
      const actual: string = hotCityAt(104);
      logInfo(`hotCityAt(index=104): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0160 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0161
     * @tc.name      CitySearch_HotCityAt_0161
     * @tc.desc      hotCityAt(index=19.41) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0161 begin`);
      const actual: string = hotCityAt(19.41);
      logInfo(`hotCityAt(index=19.41): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0161 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0162
     * @tc.name      CitySearch_HotCityAt_0162
     * @tc.desc      hotCityAt(index=177) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0162 begin`);
      const actual: string = hotCityAt(177);
      logInfo(`hotCityAt(index=177): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0162 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0163
     * @tc.name      CitySearch_HotCityAt_0163
     * @tc.desc      hotCityAt(index=73.66) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0163 begin`);
      const actual: string = hotCityAt(73.66);
      logInfo(`hotCityAt(index=73.66): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0163 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0164
     * @tc.name      CitySearch_HotCityAt_0164
     * @tc.desc      hotCityAt(index=18) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0164 begin`);
      const actual: string = hotCityAt(18);
      logInfo(`hotCityAt(index=18): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0164 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0165
     * @tc.name      CitySearch_HotCityAt_0165
     * @tc.desc      hotCityAt(index=18.06) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0165 begin`);
      const actual: string = hotCityAt(18.06);
      logInfo(`hotCityAt(index=18.06): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0165 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0166
     * @tc.name      CitySearch_HotCityAt_0166
     * @tc.desc      hotCityAt(index=88) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0166 begin`);
      const actual: string = hotCityAt(88);
      logInfo(`hotCityAt(index=88): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0166 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0167
     * @tc.name      CitySearch_HotCityAt_0167
     * @tc.desc      hotCityAt(index=-18) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0167 begin`);
      const actual: string = hotCityAt(-18);
      logInfo(`hotCityAt(index=-18): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0167 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0168
     * @tc.name      CitySearch_HotCityAt_0168
     * @tc.desc      hotCityAt(index=98.82) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0168 begin`);
      const actual: string = hotCityAt(98.82);
      logInfo(`hotCityAt(index=98.82): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0168 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0169
     * @tc.name      CitySearch_HotCityAt_0169
     * @tc.desc      hotCityAt(index=22.43) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0169 begin`);
      const actual: string = hotCityAt(22.43);
      logInfo(`hotCityAt(index=22.43): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0169 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0170
     * @tc.name      CitySearch_HotCityAt_0170
     * @tc.desc      hotCityAt(index=35.1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0170 begin`);
      const actual: string = hotCityAt(35.1);
      logInfo(`hotCityAt(index=35.1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0170 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0171
     * @tc.name      CitySearch_HotCityAt_0171
     * @tc.desc      hotCityAt(index=144) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0171 begin`);
      const actual: string = hotCityAt(144);
      logInfo(`hotCityAt(index=144): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0171 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0172
     * @tc.name      CitySearch_HotCityAt_0172
     * @tc.desc      hotCityAt(index=75.98) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0172 begin`);
      const actual: string = hotCityAt(75.98);
      logInfo(`hotCityAt(index=75.98): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0172 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0173
     * @tc.name      CitySearch_HotCityAt_0173
     * @tc.desc      hotCityAt(index=107) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0173 begin`);
      const actual: string = hotCityAt(107);
      logInfo(`hotCityAt(index=107): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0173 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0174
     * @tc.name      CitySearch_HotCityAt_0174
     * @tc.desc      hotCityAt(index=-13) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0174 begin`);
      const actual: string = hotCityAt(-13);
      logInfo(`hotCityAt(index=-13): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0174 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0175
     * @tc.name      CitySearch_HotCityAt_0175
     * @tc.desc      hotCityAt(index=31) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0175 begin`);
      const actual: string = hotCityAt(31);
      logInfo(`hotCityAt(index=31): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0175 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0176
     * @tc.name      CitySearch_HotCityAt_0176
     * @tc.desc      hotCityAt(index=97) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0176 begin`);
      const actual: string = hotCityAt(97);
      logInfo(`hotCityAt(index=97): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0176 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0177
     * @tc.name      CitySearch_HotCityAt_0177
     * @tc.desc      hotCityAt(index=-9) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0177 begin`);
      const actual: string = hotCityAt(-9);
      logInfo(`hotCityAt(index=-9): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0177 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0178
     * @tc.name      CitySearch_HotCityAt_0178
     * @tc.desc      hotCityAt(index=-60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0178 begin`);
      const actual: string = hotCityAt(-60);
      logInfo(`hotCityAt(index=-60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0178 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0179
     * @tc.name      CitySearch_HotCityAt_0179
     * @tc.desc      hotCityAt(index=169) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0179 begin`);
      const actual: string = hotCityAt(169);
      logInfo(`hotCityAt(index=169): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0179 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0180
     * @tc.name      CitySearch_HotCityAt_0180
     * @tc.desc      hotCityAt(index=-76) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0180 begin`);
      const actual: string = hotCityAt(-76);
      logInfo(`hotCityAt(index=-76): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0180 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0181
     * @tc.name      CitySearch_HotCityAt_0181
     * @tc.desc      hotCityAt(index=36.6) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0181 begin`);
      const actual: string = hotCityAt(36.6);
      logInfo(`hotCityAt(index=36.6): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0181 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0182
     * @tc.name      CitySearch_HotCityAt_0182
     * @tc.desc      hotCityAt(index=-68) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0182 begin`);
      const actual: string = hotCityAt(-68);
      logInfo(`hotCityAt(index=-68): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0182 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0183
     * @tc.name      CitySearch_HotCityAt_0183
     * @tc.desc      hotCityAt(index=-6) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0183 begin`);
      const actual: string = hotCityAt(-6);
      logInfo(`hotCityAt(index=-6): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0183 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0184
     * @tc.name      CitySearch_HotCityAt_0184
     * @tc.desc      hotCityAt(index=111) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0184 begin`);
      const actual: string = hotCityAt(111);
      logInfo(`hotCityAt(index=111): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0184 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0185
     * @tc.name      CitySearch_HotCityAt_0185
     * @tc.desc      hotCityAt(index=119) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0185 begin`);
      const actual: string = hotCityAt(119);
      logInfo(`hotCityAt(index=119): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0185 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0186
     * @tc.name      CitySearch_HotCityAt_0186
     * @tc.desc      hotCityAt(index=82.6) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0186 begin`);
      const actual: string = hotCityAt(82.6);
      logInfo(`hotCityAt(index=82.6): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0186 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0187
     * @tc.name      CitySearch_HotCityAt_0187
     * @tc.desc      hotCityAt(index=98) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0187 begin`);
      const actual: string = hotCityAt(98);
      logInfo(`hotCityAt(index=98): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0187 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0188
     * @tc.name      CitySearch_HotCityAt_0188
     * @tc.desc      hotCityAt(index=-61) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0188 begin`);
      const actual: string = hotCityAt(-61);
      logInfo(`hotCityAt(index=-61): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0188 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0189
     * @tc.name      CitySearch_HotCityAt_0189
     * @tc.desc      hotCityAt(index=56) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0189 begin`);
      const actual: string = hotCityAt(56);
      logInfo(`hotCityAt(index=56): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0189 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0190
     * @tc.name      CitySearch_HotCityAt_0190
     * @tc.desc      hotCityAt(index=55.56) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0190 begin`);
      const actual: string = hotCityAt(55.56);
      logInfo(`hotCityAt(index=55.56): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0190 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0191
     * @tc.name      CitySearch_HotCityAt_0191
     * @tc.desc      hotCityAt(index=152) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0191 begin`);
      const actual: string = hotCityAt(152);
      logInfo(`hotCityAt(index=152): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0191 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0192
     * @tc.name      CitySearch_HotCityAt_0192
     * @tc.desc      hotCityAt(index=172) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0192 begin`);
      const actual: string = hotCityAt(172);
      logInfo(`hotCityAt(index=172): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0192 end`);
    });
  });
}
