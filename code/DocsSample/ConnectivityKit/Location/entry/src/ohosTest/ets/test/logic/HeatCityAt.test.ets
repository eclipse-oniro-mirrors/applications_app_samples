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

/** Logic checks for heatCityAt (96 cases). */
export default function heatCityAtTest(): void {
  describe('HeatCityAtTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0001
     * @tc.name      Location_HeatCityAt_0001
     * @tc.desc      heatCityAt(index=0) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_HeatCityAt_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}HeatCityAt_0001 begin`);
      const actual: string = heatCityAt(0);
      logInfo(`heatCityAt(index=0): actual=${actual}`);
      expect(actual).assertEqual('\u5317\u4eac');
      logInfo(`${BUNDLE}HeatCityAt_0001 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0002
     * @tc.name      Location_HeatCityAt_0002
     * @tc.desc      heatCityAt(index=1) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_HeatCityAt_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}HeatCityAt_0002 begin`);
      const actual: string = heatCityAt(1);
      logInfo(`heatCityAt(index=1): actual=${actual}`);
      expect(actual).assertEqual('\u4e0a\u6d77');
      logInfo(`${BUNDLE}HeatCityAt_0002 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0003
     * @tc.name      Location_HeatCityAt_0003
     * @tc.desc      heatCityAt(index=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_HeatCityAt_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeatCityAt_0003 begin`);
      const actual: string = heatCityAt(-1);
      logInfo(`heatCityAt(index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0003 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0004
     * @tc.name      Location_HeatCityAt_0004
     * @tc.desc      heatCityAt(index=11) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_HeatCityAt_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeatCityAt_0004 begin`);
      const actual: string = heatCityAt(11);
      logInfo(`heatCityAt(index=11): actual=${actual}`);
      expect(actual).assertEqual('\u6210\u90fd');
      logInfo(`${BUNDLE}HeatCityAt_0004 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0005
     * @tc.name      Location_HeatCityAt_0005
     * @tc.desc      heatCityAt(index=6) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0005 begin`);
      const actual: string = heatCityAt(6);
      logInfo(`heatCityAt(index=6): actual=${actual}`);
      expect(actual).assertEqual('\u82cf\u5dde');
      logInfo(`${BUNDLE}HeatCityAt_0005 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0006
     * @tc.name      Location_HeatCityAt_0006
     * @tc.desc      heatCityAt(index=2) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0006 begin`);
      const actual: string = heatCityAt(2);
      logInfo(`heatCityAt(index=2): actual=${actual}`);
      expect(actual).assertEqual('\u5e7f\u5dde');
      logInfo(`${BUNDLE}HeatCityAt_0006 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0007
     * @tc.name      Location_HeatCityAt_0007
     * @tc.desc      heatCityAt(index=5) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0007 begin`);
      const actual: string = heatCityAt(5);
      logInfo(`heatCityAt(index=5): actual=${actual}`);
      expect(actual).assertEqual('\u5357\u4eac');
      logInfo(`${BUNDLE}HeatCityAt_0007 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0008
     * @tc.name      Location_HeatCityAt_0008
     * @tc.desc      heatCityAt(index=10) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0008 begin`);
      const actual: string = heatCityAt(10);
      logInfo(`heatCityAt(index=10): actual=${actual}`);
      expect(actual).assertEqual('\u91cd\u5e86');
      logInfo(`${BUNDLE}HeatCityAt_0008 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0009
     * @tc.name      Location_HeatCityAt_0009
     * @tc.desc      heatCityAt(index=3) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0009 begin`);
      const actual: string = heatCityAt(3);
      logInfo(`heatCityAt(index=3): actual=${actual}`);
      expect(actual).assertEqual('\u6df1\u5733');
      logInfo(`${BUNDLE}HeatCityAt_0009 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0010
     * @tc.name      Location_HeatCityAt_0010
     * @tc.desc      heatCityAt(index=8) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0010 begin`);
      const actual: string = heatCityAt(8);
      logInfo(`heatCityAt(index=8): actual=${actual}`);
      expect(actual).assertEqual('\u6b66\u6c49');
      logInfo(`${BUNDLE}HeatCityAt_0010 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0011
     * @tc.name      Location_HeatCityAt_0011
     * @tc.desc      heatCityAt(index=12) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_HeatCityAt_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeatCityAt_0011 begin`);
      const actual: string = heatCityAt(12);
      logInfo(`heatCityAt(index=12): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0011 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0012
     * @tc.name      Location_HeatCityAt_0012
     * @tc.desc      heatCityAt(index=13) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_HeatCityAt_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HeatCityAt_0012 begin`);
      const actual: string = heatCityAt(13);
      logInfo(`heatCityAt(index=13): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0012 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0013
     * @tc.name      Location_HeatCityAt_0013
     * @tc.desc      heatCityAt(index=24) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0013 begin`);
      const actual: string = heatCityAt(24);
      logInfo(`heatCityAt(index=24): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0013 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0014
     * @tc.name      Location_HeatCityAt_0014
     * @tc.desc      heatCityAt(index=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0014 begin`);
      const actual: string = heatCityAt(100);
      logInfo(`heatCityAt(index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0014 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0015
     * @tc.name      Location_HeatCityAt_0015
     * @tc.desc      heatCityAt(index=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0015 begin`);
      const actual: string = heatCityAt(15);
      logInfo(`heatCityAt(index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0015 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0016
     * @tc.name      Location_HeatCityAt_0016
     * @tc.desc      heatCityAt(index=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0016 begin`);
      const actual: string = heatCityAt(20);
      logInfo(`heatCityAt(index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0016 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0017
     * @tc.name      Location_HeatCityAt_0017
     * @tc.desc      heatCityAt(index=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0017 begin`);
      const actual: string = heatCityAt(25);
      logInfo(`heatCityAt(index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0017 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0018
     * @tc.name      Location_HeatCityAt_0018
     * @tc.desc      heatCityAt(index=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0018 begin`);
      const actual: string = heatCityAt(30);
      logInfo(`heatCityAt(index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0018 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0019
     * @tc.name      Location_HeatCityAt_0019
     * @tc.desc      heatCityAt(index=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0019 begin`);
      const actual: string = heatCityAt(35);
      logInfo(`heatCityAt(index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0019 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0020
     * @tc.name      Location_HeatCityAt_0020
     * @tc.desc      heatCityAt(index=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0020 begin`);
      const actual: string = heatCityAt(40);
      logInfo(`heatCityAt(index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0020 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0021
     * @tc.name      Location_HeatCityAt_0021
     * @tc.desc      heatCityAt(index=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0021 begin`);
      const actual: string = heatCityAt(45);
      logInfo(`heatCityAt(index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0021 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0022
     * @tc.name      Location_HeatCityAt_0022
     * @tc.desc      heatCityAt(index=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0022 begin`);
      const actual: string = heatCityAt(50);
      logInfo(`heatCityAt(index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0022 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0023
     * @tc.name      Location_HeatCityAt_0023
     * @tc.desc      heatCityAt(index=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0023 begin`);
      const actual: string = heatCityAt(55);
      logInfo(`heatCityAt(index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0023 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0024
     * @tc.name      Location_HeatCityAt_0024
     * @tc.desc      heatCityAt(index=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0024 begin`);
      const actual: string = heatCityAt(60);
      logInfo(`heatCityAt(index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0024 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0025
     * @tc.name      Location_HeatCityAt_0025
     * @tc.desc      heatCityAt(index=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0025 begin`);
      const actual: string = heatCityAt(65);
      logInfo(`heatCityAt(index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0025 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0026
     * @tc.name      Location_HeatCityAt_0026
     * @tc.desc      heatCityAt(index=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0026 begin`);
      const actual: string = heatCityAt(70);
      logInfo(`heatCityAt(index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0026 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0027
     * @tc.name      Location_HeatCityAt_0027
     * @tc.desc      heatCityAt(index=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0027 begin`);
      const actual: string = heatCityAt(75);
      logInfo(`heatCityAt(index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0027 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0028
     * @tc.name      Location_HeatCityAt_0028
     * @tc.desc      heatCityAt(index=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0028 begin`);
      const actual: string = heatCityAt(80);
      logInfo(`heatCityAt(index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0028 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0029
     * @tc.name      Location_HeatCityAt_0029
     * @tc.desc      heatCityAt(index=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0029 begin`);
      const actual: string = heatCityAt(85);
      logInfo(`heatCityAt(index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0029 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0030
     * @tc.name      Location_HeatCityAt_0030
     * @tc.desc      heatCityAt(index=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0030 begin`);
      const actual: string = heatCityAt(90);
      logInfo(`heatCityAt(index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0030 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0031
     * @tc.name      Location_HeatCityAt_0031
     * @tc.desc      heatCityAt(index=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0031 begin`);
      const actual: string = heatCityAt(95);
      logInfo(`heatCityAt(index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0031 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0032
     * @tc.name      Location_HeatCityAt_0032
     * @tc.desc      heatCityAt(index=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0032 begin`);
      const actual: string = heatCityAt(105);
      logInfo(`heatCityAt(index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0032 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0033
     * @tc.name      Location_HeatCityAt_0033
     * @tc.desc      heatCityAt(index=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0033 begin`);
      const actual: string = heatCityAt(110);
      logInfo(`heatCityAt(index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0033 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0034
     * @tc.name      Location_HeatCityAt_0034
     * @tc.desc      heatCityAt(index=115) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0034 begin`);
      const actual: string = heatCityAt(115);
      logInfo(`heatCityAt(index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0034 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0035
     * @tc.name      Location_HeatCityAt_0035
     * @tc.desc      heatCityAt(index=120) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0035 begin`);
      const actual: string = heatCityAt(120);
      logInfo(`heatCityAt(index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0035 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0036
     * @tc.name      Location_HeatCityAt_0036
     * @tc.desc      heatCityAt(index=125) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0036 begin`);
      const actual: string = heatCityAt(125);
      logInfo(`heatCityAt(index=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0036 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0037
     * @tc.name      Location_HeatCityAt_0037
     * @tc.desc      heatCityAt(index=130) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0037 begin`);
      const actual: string = heatCityAt(130);
      logInfo(`heatCityAt(index=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0037 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0038
     * @tc.name      Location_HeatCityAt_0038
     * @tc.desc      heatCityAt(index=135) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0038 begin`);
      const actual: string = heatCityAt(135);
      logInfo(`heatCityAt(index=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0038 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0039
     * @tc.name      Location_HeatCityAt_0039
     * @tc.desc      heatCityAt(index=140) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0039 begin`);
      const actual: string = heatCityAt(140);
      logInfo(`heatCityAt(index=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0039 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0040
     * @tc.name      Location_HeatCityAt_0040
     * @tc.desc      heatCityAt(index=145) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0040 begin`);
      const actual: string = heatCityAt(145);
      logInfo(`heatCityAt(index=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0040 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0041
     * @tc.name      Location_HeatCityAt_0041
     * @tc.desc      heatCityAt(index=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0041 begin`);
      const actual: string = heatCityAt(150);
      logInfo(`heatCityAt(index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0041 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0042
     * @tc.name      Location_HeatCityAt_0042
     * @tc.desc      heatCityAt(index=155) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0042 begin`);
      const actual: string = heatCityAt(155);
      logInfo(`heatCityAt(index=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0042 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0043
     * @tc.name      Location_HeatCityAt_0043
     * @tc.desc      heatCityAt(index=160) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0043 begin`);
      const actual: string = heatCityAt(160);
      logInfo(`heatCityAt(index=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0043 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0044
     * @tc.name      Location_HeatCityAt_0044
     * @tc.desc      heatCityAt(index=165) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0044 begin`);
      const actual: string = heatCityAt(165);
      logInfo(`heatCityAt(index=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0044 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0045
     * @tc.name      Location_HeatCityAt_0045
     * @tc.desc      heatCityAt(index=170) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0045 begin`);
      const actual: string = heatCityAt(170);
      logInfo(`heatCityAt(index=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0045 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0046
     * @tc.name      Location_HeatCityAt_0046
     * @tc.desc      heatCityAt(index=175) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0046 begin`);
      const actual: string = heatCityAt(175);
      logInfo(`heatCityAt(index=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0046 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0047
     * @tc.name      Location_HeatCityAt_0047
     * @tc.desc      heatCityAt(index=180) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0047 begin`);
      const actual: string = heatCityAt(180);
      logInfo(`heatCityAt(index=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0047 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0048
     * @tc.name      Location_HeatCityAt_0048
     * @tc.desc      heatCityAt(index=185) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0048 begin`);
      const actual: string = heatCityAt(185);
      logInfo(`heatCityAt(index=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0048 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0049
     * @tc.name      Location_HeatCityAt_0049
     * @tc.desc      heatCityAt(index=190) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0049 begin`);
      const actual: string = heatCityAt(190);
      logInfo(`heatCityAt(index=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0049 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0050
     * @tc.name      Location_HeatCityAt_0050
     * @tc.desc      heatCityAt(index=195) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0050 begin`);
      const actual: string = heatCityAt(195);
      logInfo(`heatCityAt(index=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0050 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0051
     * @tc.name      Location_HeatCityAt_0051
     * @tc.desc      heatCityAt(index=200) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0051 begin`);
      const actual: string = heatCityAt(200);
      logInfo(`heatCityAt(index=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0051 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0052
     * @tc.name      Location_HeatCityAt_0052
     * @tc.desc      heatCityAt(index=57.23) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0052 begin`);
      const actual: string = heatCityAt(57.23);
      logInfo(`heatCityAt(index=57.23): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0052 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0053
     * @tc.name      Location_HeatCityAt_0053
     * @tc.desc      heatCityAt(index=53) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0053 begin`);
      const actual: string = heatCityAt(53);
      logInfo(`heatCityAt(index=53): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0053 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0054
     * @tc.name      Location_HeatCityAt_0054
     * @tc.desc      heatCityAt(index=84.41) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0054 begin`);
      const actual: string = heatCityAt(84.41);
      logInfo(`heatCityAt(index=84.41): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0054 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0055
     * @tc.name      Location_HeatCityAt_0055
     * @tc.desc      heatCityAt(index=73.94) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0055 begin`);
      const actual: string = heatCityAt(73.94);
      logInfo(`heatCityAt(index=73.94): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0055 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0056
     * @tc.name      Location_HeatCityAt_0056
     * @tc.desc      heatCityAt(index=55.19) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0056 begin`);
      const actual: string = heatCityAt(55.19);
      logInfo(`heatCityAt(index=55.19): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0056 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0057
     * @tc.name      Location_HeatCityAt_0057
     * @tc.desc      heatCityAt(index=52.4) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0057 begin`);
      const actual: string = heatCityAt(52.4);
      logInfo(`heatCityAt(index=52.4): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0057 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0058
     * @tc.name      Location_HeatCityAt_0058
     * @tc.desc      heatCityAt(index=93.94) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0058 begin`);
      const actual: string = heatCityAt(93.94);
      logInfo(`heatCityAt(index=93.94): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0058 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0059
     * @tc.name      Location_HeatCityAt_0059
     * @tc.desc      heatCityAt(index=29.59) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0059 begin`);
      const actual: string = heatCityAt(29.59);
      logInfo(`heatCityAt(index=29.59): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0059 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0060
     * @tc.name      Location_HeatCityAt_0060
     * @tc.desc      heatCityAt(index=188) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0060 begin`);
      const actual: string = heatCityAt(188);
      logInfo(`heatCityAt(index=188): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0060 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0061
     * @tc.name      Location_HeatCityAt_0061
     * @tc.desc      heatCityAt(index=-55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0061 begin`);
      const actual: string = heatCityAt(-55);
      logInfo(`heatCityAt(index=-55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0061 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0062
     * @tc.name      Location_HeatCityAt_0062
     * @tc.desc      heatCityAt(index=88) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0062 begin`);
      const actual: string = heatCityAt(88);
      logInfo(`heatCityAt(index=88): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0062 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0063
     * @tc.name      Location_HeatCityAt_0063
     * @tc.desc      heatCityAt(index=-82) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0063 begin`);
      const actual: string = heatCityAt(-82);
      logInfo(`heatCityAt(index=-82): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0063 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0064
     * @tc.name      Location_HeatCityAt_0064
     * @tc.desc      heatCityAt(index=166) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0064 begin`);
      const actual: string = heatCityAt(166);
      logInfo(`heatCityAt(index=166): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0064 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0065
     * @tc.name      Location_HeatCityAt_0065
     * @tc.desc      heatCityAt(index=7.53) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0065 begin`);
      const actual: string = heatCityAt(7.53);
      logInfo(`heatCityAt(index=7.53): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0065 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0066
     * @tc.name      Location_HeatCityAt_0066
     * @tc.desc      heatCityAt(index=-58) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0066 begin`);
      const actual: string = heatCityAt(-58);
      logInfo(`heatCityAt(index=-58): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0066 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0067
     * @tc.name      Location_HeatCityAt_0067
     * @tc.desc      heatCityAt(index=71) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0067 begin`);
      const actual: string = heatCityAt(71);
      logInfo(`heatCityAt(index=71): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0067 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0068
     * @tc.name      Location_HeatCityAt_0068
     * @tc.desc      heatCityAt(index=14.25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0068 begin`);
      const actual: string = heatCityAt(14.25);
      logInfo(`heatCityAt(index=14.25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0068 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0069
     * @tc.name      Location_HeatCityAt_0069
     * @tc.desc      heatCityAt(index=33) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0069 begin`);
      const actual: string = heatCityAt(33);
      logInfo(`heatCityAt(index=33): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0069 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0070
     * @tc.name      Location_HeatCityAt_0070
     * @tc.desc      heatCityAt(index=9.52) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0070 begin`);
      const actual: string = heatCityAt(9.52);
      logInfo(`heatCityAt(index=9.52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0070 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0071
     * @tc.name      Location_HeatCityAt_0071
     * @tc.desc      heatCityAt(index=-74) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0071 begin`);
      const actual: string = heatCityAt(-74);
      logInfo(`heatCityAt(index=-74): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0071 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0072
     * @tc.name      Location_HeatCityAt_0072
     * @tc.desc      heatCityAt(index=14) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0072 begin`);
      const actual: string = heatCityAt(14);
      logInfo(`heatCityAt(index=14): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0072 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0073
     * @tc.name      Location_HeatCityAt_0073
     * @tc.desc      heatCityAt(index=128) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0073 begin`);
      const actual: string = heatCityAt(128);
      logInfo(`heatCityAt(index=128): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0073 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0074
     * @tc.name      Location_HeatCityAt_0074
     * @tc.desc      heatCityAt(index=187) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0074 begin`);
      const actual: string = heatCityAt(187);
      logInfo(`heatCityAt(index=187): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0074 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0075
     * @tc.name      Location_HeatCityAt_0075
     * @tc.desc      heatCityAt(index=72) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0075 begin`);
      const actual: string = heatCityAt(72);
      logInfo(`heatCityAt(index=72): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0075 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0076
     * @tc.name      Location_HeatCityAt_0076
     * @tc.desc      heatCityAt(index=89) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0076 begin`);
      const actual: string = heatCityAt(89);
      logInfo(`heatCityAt(index=89): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0076 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0077
     * @tc.name      Location_HeatCityAt_0077
     * @tc.desc      heatCityAt(index=-10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0077 begin`);
      const actual: string = heatCityAt(-10);
      logInfo(`heatCityAt(index=-10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0077 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0078
     * @tc.name      Location_HeatCityAt_0078
     * @tc.desc      heatCityAt(index=133) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0078 begin`);
      const actual: string = heatCityAt(133);
      logInfo(`heatCityAt(index=133): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0078 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0079
     * @tc.name      Location_HeatCityAt_0079
     * @tc.desc      heatCityAt(index=111) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0079 begin`);
      const actual: string = heatCityAt(111);
      logInfo(`heatCityAt(index=111): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0079 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0080
     * @tc.name      Location_HeatCityAt_0080
     * @tc.desc      heatCityAt(index=-41) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0080 begin`);
      const actual: string = heatCityAt(-41);
      logInfo(`heatCityAt(index=-41): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0080 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0081
     * @tc.name      Location_HeatCityAt_0081
     * @tc.desc      heatCityAt(index=42.45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0081 begin`);
      const actual: string = heatCityAt(42.45);
      logInfo(`heatCityAt(index=42.45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0081 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0082
     * @tc.name      Location_HeatCityAt_0082
     * @tc.desc      heatCityAt(index=5.24) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0082 begin`);
      const actual: string = heatCityAt(5.24);
      logInfo(`heatCityAt(index=5.24): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0082 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0083
     * @tc.name      Location_HeatCityAt_0083
     * @tc.desc      heatCityAt(index=-25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0083 begin`);
      const actual: string = heatCityAt(-25);
      logInfo(`heatCityAt(index=-25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0083 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0084
     * @tc.name      Location_HeatCityAt_0084
     * @tc.desc      heatCityAt(index=-44) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0084 begin`);
      const actual: string = heatCityAt(-44);
      logInfo(`heatCityAt(index=-44): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0084 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0085
     * @tc.name      Location_HeatCityAt_0085
     * @tc.desc      heatCityAt(index=191) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0085 begin`);
      const actual: string = heatCityAt(191);
      logInfo(`heatCityAt(index=191): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0085 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0086
     * @tc.name      Location_HeatCityAt_0086
     * @tc.desc      heatCityAt(index=-97) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0086 begin`);
      const actual: string = heatCityAt(-97);
      logInfo(`heatCityAt(index=-97): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0086 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0087
     * @tc.name      Location_HeatCityAt_0087
     * @tc.desc      heatCityAt(index=34) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0087 begin`);
      const actual: string = heatCityAt(34);
      logInfo(`heatCityAt(index=34): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0087 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0088
     * @tc.name      Location_HeatCityAt_0088
     * @tc.desc      heatCityAt(index=-57) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0088 begin`);
      const actual: string = heatCityAt(-57);
      logInfo(`heatCityAt(index=-57): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0088 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0089
     * @tc.name      Location_HeatCityAt_0089
     * @tc.desc      heatCityAt(index=-30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0089 begin`);
      const actual: string = heatCityAt(-30);
      logInfo(`heatCityAt(index=-30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0089 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0090
     * @tc.name      Location_HeatCityAt_0090
     * @tc.desc      heatCityAt(index=48) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0090 begin`);
      const actual: string = heatCityAt(48);
      logInfo(`heatCityAt(index=48): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0090 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0091
     * @tc.name      Location_HeatCityAt_0091
     * @tc.desc      heatCityAt(index=189) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0091 begin`);
      const actual: string = heatCityAt(189);
      logInfo(`heatCityAt(index=189): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0091 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0092
     * @tc.name      Location_HeatCityAt_0092
     * @tc.desc      heatCityAt(index=63.2) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0092 begin`);
      const actual: string = heatCityAt(63.2);
      logInfo(`heatCityAt(index=63.2): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0092 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0093
     * @tc.name      Location_HeatCityAt_0093
     * @tc.desc      heatCityAt(index=-52) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0093 begin`);
      const actual: string = heatCityAt(-52);
      logInfo(`heatCityAt(index=-52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0093 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0094
     * @tc.name      Location_HeatCityAt_0094
     * @tc.desc      heatCityAt(index=23.59) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0094 begin`);
      const actual: string = heatCityAt(23.59);
      logInfo(`heatCityAt(index=23.59): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0094 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0095
     * @tc.name      Location_HeatCityAt_0095
     * @tc.desc      heatCityAt(index=-76) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_HeatCityAt_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HeatCityAt_0095 begin`);
      const actual: string = heatCityAt(-76);
      logInfo(`heatCityAt(index=-76): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0095 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_HEAT_CITY_AT_0096
     * @tc.name      Location_HeatCityAt_0096
     * @tc.desc      heatCityAt(index=90.89) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_HeatCityAt_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HeatCityAt_0096 begin`);
      const actual: string = heatCityAt(90.89);
      logInfo(`heatCityAt(index=90.89): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HeatCityAt_0096 end`);
    });
  });
}
