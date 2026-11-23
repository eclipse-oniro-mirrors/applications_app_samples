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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../TestYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { heatCityAt } from '../model/CityPickerLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Location]';
const BUNDLE: string = 'Location_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for heatCityAt (24 cases). */
export default function heatCityAt2Test(): void {
  describe('HeatCityAt2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0097
     * @tc.name      Location_HeatCityAt_0097
     * @tc.desc      heatCityAt(index=-7) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0097 begin`);
      const actual: string = heatCityAt(-7);
      logInfo(`heatCityAt(index=-7): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0097 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0098
     * @tc.name      Location_HeatCityAt_0098
     * @tc.desc      heatCityAt(index=-100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0098 begin`);
      const actual: string = heatCityAt(-100);
      logInfo(`heatCityAt(index=-100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0098 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0099
     * @tc.name      Location_HeatCityAt_0099
     * @tc.desc      heatCityAt(index=77.59) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0099 begin`);
      const actual: string = heatCityAt(77.59);
      logInfo(`heatCityAt(index=77.59): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0099 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0100
     * @tc.name      Location_HeatCityAt_0100
     * @tc.desc      heatCityAt(index=-78) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0100 begin`);
      const actual: string = heatCityAt(-78);
      logInfo(`heatCityAt(index=-78): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0100 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0101
     * @tc.name      Location_HeatCityAt_0101
     * @tc.desc      heatCityAt(index=46.3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0101 begin`);
      const actual: string = heatCityAt(46.3);
      logInfo(`heatCityAt(index=46.3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0101 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0102
     * @tc.name      Location_HeatCityAt_0102
     * @tc.desc      heatCityAt(index=9.74) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0102 begin`);
      const actual: string = heatCityAt(9.74);
      logInfo(`heatCityAt(index=9.74): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0102 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0103
     * @tc.name      Location_HeatCityAt_0103
     * @tc.desc      heatCityAt(index=19.19) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0103 begin`);
      const actual: string = heatCityAt(19.19);
      logInfo(`heatCityAt(index=19.19): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0103 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0104
     * @tc.name      Location_HeatCityAt_0104
     * @tc.desc      heatCityAt(index=108) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0104 begin`);
      const actual: string = heatCityAt(108);
      logInfo(`heatCityAt(index=108): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0104 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0105
     * @tc.name      Location_HeatCityAt_0105
     * @tc.desc      heatCityAt(index=177) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0105 begin`);
      const actual: string = heatCityAt(177);
      logInfo(`heatCityAt(index=177): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0105 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0106
     * @tc.name      Location_HeatCityAt_0106
     * @tc.desc      heatCityAt(index=72.26) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0106 begin`);
      const actual: string = heatCityAt(72.26);
      logInfo(`heatCityAt(index=72.26): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0106 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0107
     * @tc.name      Location_HeatCityAt_0107
     * @tc.desc      heatCityAt(index=199) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0107 begin`);
      const actual: string = heatCityAt(199);
      logInfo(`heatCityAt(index=199): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0107 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0108
     * @tc.name      Location_HeatCityAt_0108
     * @tc.desc      heatCityAt(index=79.77) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0108 begin`);
      const actual: string = heatCityAt(79.77);
      logInfo(`heatCityAt(index=79.77): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0108 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0109
     * @tc.name      Location_HeatCityAt_0109
     * @tc.desc      heatCityAt(index=-2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0109 begin`);
      const actual: string = heatCityAt(-2);
      logInfo(`heatCityAt(index=-2): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0109 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0110
     * @tc.name      Location_HeatCityAt_0110
     * @tc.desc      heatCityAt(index=95.17) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0110 begin`);
      const actual: string = heatCityAt(95.17);
      logInfo(`heatCityAt(index=95.17): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0110 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0111
     * @tc.name      Location_HeatCityAt_0111
     * @tc.desc      heatCityAt(index=-47) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0111 begin`);
      const actual: string = heatCityAt(-47);
      logInfo(`heatCityAt(index=-47): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0111 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0112
     * @tc.name      Location_HeatCityAt_0112
     * @tc.desc      heatCityAt(index=8.98) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0112 begin`);
      const actual: string = heatCityAt(8.98);
      logInfo(`heatCityAt(index=8.98): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0112 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0113
     * @tc.name      Location_HeatCityAt_0113
     * @tc.desc      heatCityAt(index=85.16) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0113 begin`);
      const actual: string = heatCityAt(85.16);
      logInfo(`heatCityAt(index=85.16): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0113 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0114
     * @tc.name      Location_HeatCityAt_0114
     * @tc.desc      heatCityAt(index=-70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0114 begin`);
      const actual: string = heatCityAt(-70);
      logInfo(`heatCityAt(index=-70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0114 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0115
     * @tc.name      Location_HeatCityAt_0115
     * @tc.desc      heatCityAt(index=51.08) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0115 begin`);
      const actual: string = heatCityAt(51.08);
      logInfo(`heatCityAt(index=51.08): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0115 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0116
     * @tc.name      Location_HeatCityAt_0116
     * @tc.desc      heatCityAt(index=82.45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0116 begin`);
      const actual: string = heatCityAt(82.45);
      logInfo(`heatCityAt(index=82.45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0116 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0117
     * @tc.name      Location_HeatCityAt_0117
     * @tc.desc      heatCityAt(index=-73) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0117 begin`);
      const actual: string = heatCityAt(-73);
      logInfo(`heatCityAt(index=-73): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0117 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0118
     * @tc.name      Location_HeatCityAt_0118
     * @tc.desc      heatCityAt(index=35.04) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0118 begin`);
      const actual: string = heatCityAt(35.04);
      logInfo(`heatCityAt(index=35.04): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0118 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0119
     * @tc.name      Location_HeatCityAt_0119
     * @tc.desc      heatCityAt(index=57) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0119 begin`);
      const actual: string = heatCityAt(57);
      logInfo(`heatCityAt(index=57): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0119 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0120
     * @tc.name      Location_HeatCityAt_0120
     * @tc.desc      heatCityAt(index=-89) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0120 begin`);
      const actual: string = heatCityAt(-89);
      logInfo(`heatCityAt(index=-89): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0120 end`);
    });
  });
}
