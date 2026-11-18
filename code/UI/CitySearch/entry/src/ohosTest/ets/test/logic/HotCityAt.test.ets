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
export default function hotCityAtTest(): void {
  describe('HotCityAtTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0001
     * @tc.name      CitySearch_HotCityAt_0001
     * @tc.desc      hotCityAt(index=0) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_HotCityAt_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}HotCityAt_0001 begin`);
      const actual: string = hotCityAt(0);
      logInfo(`hotCityAt(index=0): actual=${actual}`);
      expect(actual).assertEqual('\u5317\u4eac');
      logInfo(`${BUNDLE}HotCityAt_0001 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0002
     * @tc.name      CitySearch_HotCityAt_0002
     * @tc.desc      hotCityAt(index=1) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_HotCityAt_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}HotCityAt_0002 begin`);
      const actual: string = hotCityAt(1);
      logInfo(`hotCityAt(index=1): actual=${actual}`);
      expect(actual).assertEqual('\u4e0a\u6d77');
      logInfo(`${BUNDLE}HotCityAt_0002 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0003
     * @tc.name      CitySearch_HotCityAt_0003
     * @tc.desc      hotCityAt(index=-1) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CitySearch_HotCityAt_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HotCityAt_0003 begin`);
      const actual: string = hotCityAt(-1);
      logInfo(`hotCityAt(index=-1): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0003 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0004
     * @tc.name      CitySearch_HotCityAt_0004
     * @tc.desc      hotCityAt(index=11) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CitySearch_HotCityAt_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HotCityAt_0004 begin`);
      const actual: string = hotCityAt(11);
      logInfo(`hotCityAt(index=11): actual=${actual}`);
      expect(actual).assertEqual('\u6210\u90fd');
      logInfo(`${BUNDLE}HotCityAt_0004 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0005
     * @tc.name      CitySearch_HotCityAt_0005
     * @tc.desc      hotCityAt(index=6) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0005 begin`);
      const actual: string = hotCityAt(6);
      logInfo(`hotCityAt(index=6): actual=${actual}`);
      expect(actual).assertEqual('\u82cf\u5dde');
      logInfo(`${BUNDLE}HotCityAt_0005 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0006
     * @tc.name      CitySearch_HotCityAt_0006
     * @tc.desc      hotCityAt(index=2) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0006 begin`);
      const actual: string = hotCityAt(2);
      logInfo(`hotCityAt(index=2): actual=${actual}`);
      expect(actual).assertEqual('\u5e7f\u5dde');
      logInfo(`${BUNDLE}HotCityAt_0006 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0007
     * @tc.name      CitySearch_HotCityAt_0007
     * @tc.desc      hotCityAt(index=5) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0007 begin`);
      const actual: string = hotCityAt(5);
      logInfo(`hotCityAt(index=5): actual=${actual}`);
      expect(actual).assertEqual('\u5357\u4eac');
      logInfo(`${BUNDLE}HotCityAt_0007 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0008
     * @tc.name      CitySearch_HotCityAt_0008
     * @tc.desc      hotCityAt(index=10) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0008 begin`);
      const actual: string = hotCityAt(10);
      logInfo(`hotCityAt(index=10): actual=${actual}`);
      expect(actual).assertEqual('\u91cd\u5e86');
      logInfo(`${BUNDLE}HotCityAt_0008 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0009
     * @tc.name      CitySearch_HotCityAt_0009
     * @tc.desc      hotCityAt(index=3) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0009 begin`);
      const actual: string = hotCityAt(3);
      logInfo(`hotCityAt(index=3): actual=${actual}`);
      expect(actual).assertEqual('\u6df1\u5733');
      logInfo(`${BUNDLE}HotCityAt_0009 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0010
     * @tc.name      CitySearch_HotCityAt_0010
     * @tc.desc      hotCityAt(index=8) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0010 begin`);
      const actual: string = hotCityAt(8);
      logInfo(`hotCityAt(index=8): actual=${actual}`);
      expect(actual).assertEqual('\u6b66\u6c49');
      logInfo(`${BUNDLE}HotCityAt_0010 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0011
     * @tc.name      CitySearch_HotCityAt_0011
     * @tc.desc      hotCityAt(index=4) returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0011 begin`);
      const actual: string = hotCityAt(4);
      logInfo(`hotCityAt(index=4): actual=${actual}`);
      expect(actual).assertEqual('\u676d\u5dde');
      logInfo(`${BUNDLE}HotCityAt_0011 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0012
     * @tc.name      CitySearch_HotCityAt_0012
     * @tc.desc      hotCityAt(index=12) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CitySearch_HotCityAt_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HotCityAt_0012 begin`);
      const actual: string = hotCityAt(12);
      logInfo(`hotCityAt(index=12): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0012 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0013
     * @tc.name      CitySearch_HotCityAt_0013
     * @tc.desc      hotCityAt(index=13) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('CitySearch_HotCityAt_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}HotCityAt_0013 begin`);
      const actual: string = hotCityAt(13);
      logInfo(`hotCityAt(index=13): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0013 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0014
     * @tc.name      CitySearch_HotCityAt_0014
     * @tc.desc      hotCityAt(index=24) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0014 begin`);
      const actual: string = hotCityAt(24);
      logInfo(`hotCityAt(index=24): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0014 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0015
     * @tc.name      CitySearch_HotCityAt_0015
     * @tc.desc      hotCityAt(index=100) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0015 begin`);
      const actual: string = hotCityAt(100);
      logInfo(`hotCityAt(index=100): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0015 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0016
     * @tc.name      CitySearch_HotCityAt_0016
     * @tc.desc      hotCityAt(index=15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0016 begin`);
      const actual: string = hotCityAt(15);
      logInfo(`hotCityAt(index=15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0016 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0017
     * @tc.name      CitySearch_HotCityAt_0017
     * @tc.desc      hotCityAt(index=20) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0017 begin`);
      const actual: string = hotCityAt(20);
      logInfo(`hotCityAt(index=20): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0017 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0018
     * @tc.name      CitySearch_HotCityAt_0018
     * @tc.desc      hotCityAt(index=25) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0018 begin`);
      const actual: string = hotCityAt(25);
      logInfo(`hotCityAt(index=25): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0018 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0019
     * @tc.name      CitySearch_HotCityAt_0019
     * @tc.desc      hotCityAt(index=30) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0019 begin`);
      const actual: string = hotCityAt(30);
      logInfo(`hotCityAt(index=30): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0019 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0020
     * @tc.name      CitySearch_HotCityAt_0020
     * @tc.desc      hotCityAt(index=35) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0020 begin`);
      const actual: string = hotCityAt(35);
      logInfo(`hotCityAt(index=35): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0020 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0021
     * @tc.name      CitySearch_HotCityAt_0021
     * @tc.desc      hotCityAt(index=40) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0021 begin`);
      const actual: string = hotCityAt(40);
      logInfo(`hotCityAt(index=40): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0021 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0022
     * @tc.name      CitySearch_HotCityAt_0022
     * @tc.desc      hotCityAt(index=45) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0022 begin`);
      const actual: string = hotCityAt(45);
      logInfo(`hotCityAt(index=45): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0022 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0023
     * @tc.name      CitySearch_HotCityAt_0023
     * @tc.desc      hotCityAt(index=50) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0023 begin`);
      const actual: string = hotCityAt(50);
      logInfo(`hotCityAt(index=50): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0023 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0024
     * @tc.name      CitySearch_HotCityAt_0024
     * @tc.desc      hotCityAt(index=55) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0024 begin`);
      const actual: string = hotCityAt(55);
      logInfo(`hotCityAt(index=55): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0024 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0025
     * @tc.name      CitySearch_HotCityAt_0025
     * @tc.desc      hotCityAt(index=60) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0025 begin`);
      const actual: string = hotCityAt(60);
      logInfo(`hotCityAt(index=60): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0025 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0026
     * @tc.name      CitySearch_HotCityAt_0026
     * @tc.desc      hotCityAt(index=65) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0026 begin`);
      const actual: string = hotCityAt(65);
      logInfo(`hotCityAt(index=65): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0026 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0027
     * @tc.name      CitySearch_HotCityAt_0027
     * @tc.desc      hotCityAt(index=70) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0027 begin`);
      const actual: string = hotCityAt(70);
      logInfo(`hotCityAt(index=70): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0027 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0028
     * @tc.name      CitySearch_HotCityAt_0028
     * @tc.desc      hotCityAt(index=75) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0028 begin`);
      const actual: string = hotCityAt(75);
      logInfo(`hotCityAt(index=75): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0028 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0029
     * @tc.name      CitySearch_HotCityAt_0029
     * @tc.desc      hotCityAt(index=80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0029 begin`);
      const actual: string = hotCityAt(80);
      logInfo(`hotCityAt(index=80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0029 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0030
     * @tc.name      CitySearch_HotCityAt_0030
     * @tc.desc      hotCityAt(index=85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0030 begin`);
      const actual: string = hotCityAt(85);
      logInfo(`hotCityAt(index=85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0030 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0031
     * @tc.name      CitySearch_HotCityAt_0031
     * @tc.desc      hotCityAt(index=90) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0031 begin`);
      const actual: string = hotCityAt(90);
      logInfo(`hotCityAt(index=90): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0031 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0032
     * @tc.name      CitySearch_HotCityAt_0032
     * @tc.desc      hotCityAt(index=95) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0032 begin`);
      const actual: string = hotCityAt(95);
      logInfo(`hotCityAt(index=95): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0032 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0033
     * @tc.name      CitySearch_HotCityAt_0033
     * @tc.desc      hotCityAt(index=105) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0033 begin`);
      const actual: string = hotCityAt(105);
      logInfo(`hotCityAt(index=105): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0033 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0034
     * @tc.name      CitySearch_HotCityAt_0034
     * @tc.desc      hotCityAt(index=110) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0034 begin`);
      const actual: string = hotCityAt(110);
      logInfo(`hotCityAt(index=110): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0034 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0035
     * @tc.name      CitySearch_HotCityAt_0035
     * @tc.desc      hotCityAt(index=115) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0035 begin`);
      const actual: string = hotCityAt(115);
      logInfo(`hotCityAt(index=115): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0035 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0036
     * @tc.name      CitySearch_HotCityAt_0036
     * @tc.desc      hotCityAt(index=120) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0036 begin`);
      const actual: string = hotCityAt(120);
      logInfo(`hotCityAt(index=120): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0036 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0037
     * @tc.name      CitySearch_HotCityAt_0037
     * @tc.desc      hotCityAt(index=125) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0037 begin`);
      const actual: string = hotCityAt(125);
      logInfo(`hotCityAt(index=125): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0037 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0038
     * @tc.name      CitySearch_HotCityAt_0038
     * @tc.desc      hotCityAt(index=130) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0038 begin`);
      const actual: string = hotCityAt(130);
      logInfo(`hotCityAt(index=130): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0038 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0039
     * @tc.name      CitySearch_HotCityAt_0039
     * @tc.desc      hotCityAt(index=135) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0039 begin`);
      const actual: string = hotCityAt(135);
      logInfo(`hotCityAt(index=135): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0039 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0040
     * @tc.name      CitySearch_HotCityAt_0040
     * @tc.desc      hotCityAt(index=140) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0040 begin`);
      const actual: string = hotCityAt(140);
      logInfo(`hotCityAt(index=140): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0040 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0041
     * @tc.name      CitySearch_HotCityAt_0041
     * @tc.desc      hotCityAt(index=145) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0041 begin`);
      const actual: string = hotCityAt(145);
      logInfo(`hotCityAt(index=145): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0041 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0042
     * @tc.name      CitySearch_HotCityAt_0042
     * @tc.desc      hotCityAt(index=150) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0042 begin`);
      const actual: string = hotCityAt(150);
      logInfo(`hotCityAt(index=150): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0042 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0043
     * @tc.name      CitySearch_HotCityAt_0043
     * @tc.desc      hotCityAt(index=155) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0043 begin`);
      const actual: string = hotCityAt(155);
      logInfo(`hotCityAt(index=155): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0043 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0044
     * @tc.name      CitySearch_HotCityAt_0044
     * @tc.desc      hotCityAt(index=160) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0044 begin`);
      const actual: string = hotCityAt(160);
      logInfo(`hotCityAt(index=160): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0044 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0045
     * @tc.name      CitySearch_HotCityAt_0045
     * @tc.desc      hotCityAt(index=165) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0045 begin`);
      const actual: string = hotCityAt(165);
      logInfo(`hotCityAt(index=165): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0045 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0046
     * @tc.name      CitySearch_HotCityAt_0046
     * @tc.desc      hotCityAt(index=170) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0046 begin`);
      const actual: string = hotCityAt(170);
      logInfo(`hotCityAt(index=170): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0046 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0047
     * @tc.name      CitySearch_HotCityAt_0047
     * @tc.desc      hotCityAt(index=175) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0047 begin`);
      const actual: string = hotCityAt(175);
      logInfo(`hotCityAt(index=175): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0047 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0048
     * @tc.name      CitySearch_HotCityAt_0048
     * @tc.desc      hotCityAt(index=180) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0048 begin`);
      const actual: string = hotCityAt(180);
      logInfo(`hotCityAt(index=180): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0048 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0049
     * @tc.name      CitySearch_HotCityAt_0049
     * @tc.desc      hotCityAt(index=185) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0049 begin`);
      const actual: string = hotCityAt(185);
      logInfo(`hotCityAt(index=185): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0049 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0050
     * @tc.name      CitySearch_HotCityAt_0050
     * @tc.desc      hotCityAt(index=190) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0050 begin`);
      const actual: string = hotCityAt(190);
      logInfo(`hotCityAt(index=190): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0050 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0051
     * @tc.name      CitySearch_HotCityAt_0051
     * @tc.desc      hotCityAt(index=195) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0051 begin`);
      const actual: string = hotCityAt(195);
      logInfo(`hotCityAt(index=195): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0051 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0052
     * @tc.name      CitySearch_HotCityAt_0052
     * @tc.desc      hotCityAt(index=200) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0052 begin`);
      const actual: string = hotCityAt(200);
      logInfo(`hotCityAt(index=200): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0052 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0053
     * @tc.name      CitySearch_HotCityAt_0053
     * @tc.desc      hotCityAt(index=-16) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0053 begin`);
      const actual: string = hotCityAt(-16);
      logInfo(`hotCityAt(index=-16): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0053 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0054
     * @tc.name      CitySearch_HotCityAt_0054
     * @tc.desc      hotCityAt(index=73.18) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0054 begin`);
      const actual: string = hotCityAt(73.18);
      logInfo(`hotCityAt(index=73.18): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0054 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0055
     * @tc.name      CitySearch_HotCityAt_0055
     * @tc.desc      hotCityAt(index=-27) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0055 begin`);
      const actual: string = hotCityAt(-27);
      logInfo(`hotCityAt(index=-27): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0055 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0056
     * @tc.name      CitySearch_HotCityAt_0056
     * @tc.desc      hotCityAt(index=47) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0056 begin`);
      const actual: string = hotCityAt(47);
      logInfo(`hotCityAt(index=47): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0056 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0057
     * @tc.name      CitySearch_HotCityAt_0057
     * @tc.desc      hotCityAt(index=136) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0057 begin`);
      const actual: string = hotCityAt(136);
      logInfo(`hotCityAt(index=136): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0057 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0058
     * @tc.name      CitySearch_HotCityAt_0058
     * @tc.desc      hotCityAt(index=-12) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0058 begin`);
      const actual: string = hotCityAt(-12);
      logInfo(`hotCityAt(index=-12): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0058 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0059
     * @tc.name      CitySearch_HotCityAt_0059
     * @tc.desc      hotCityAt(index=-71) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0059 begin`);
      const actual: string = hotCityAt(-71);
      logInfo(`hotCityAt(index=-71): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0059 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0060
     * @tc.name      CitySearch_HotCityAt_0060
     * @tc.desc      hotCityAt(index=-62) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0060 begin`);
      const actual: string = hotCityAt(-62);
      logInfo(`hotCityAt(index=-62): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0060 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0061
     * @tc.name      CitySearch_HotCityAt_0061
     * @tc.desc      hotCityAt(index=-10) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0061 begin`);
      const actual: string = hotCityAt(-10);
      logInfo(`hotCityAt(index=-10): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0061 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0062
     * @tc.name      CitySearch_HotCityAt_0062
     * @tc.desc      hotCityAt(index=79) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0062 begin`);
      const actual: string = hotCityAt(79);
      logInfo(`hotCityAt(index=79): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0062 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0063
     * @tc.name      CitySearch_HotCityAt_0063
     * @tc.desc      hotCityAt(index=57.07) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0063 begin`);
      const actual: string = hotCityAt(57.07);
      logInfo(`hotCityAt(index=57.07): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0063 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0064
     * @tc.name      CitySearch_HotCityAt_0064
     * @tc.desc      hotCityAt(index=85.86) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0064 begin`);
      const actual: string = hotCityAt(85.86);
      logInfo(`hotCityAt(index=85.86): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0064 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0065
     * @tc.name      CitySearch_HotCityAt_0065
     * @tc.desc      hotCityAt(index=27.72) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0065 begin`);
      const actual: string = hotCityAt(27.72);
      logInfo(`hotCityAt(index=27.72): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0065 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0066
     * @tc.name      CitySearch_HotCityAt_0066
     * @tc.desc      hotCityAt(index=112) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0066 begin`);
      const actual: string = hotCityAt(112);
      logInfo(`hotCityAt(index=112): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0066 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0067
     * @tc.name      CitySearch_HotCityAt_0067
     * @tc.desc      hotCityAt(index=-80) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0067 begin`);
      const actual: string = hotCityAt(-80);
      logInfo(`hotCityAt(index=-80): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0067 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0068
     * @tc.name      CitySearch_HotCityAt_0068
     * @tc.desc      hotCityAt(index=69.09) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0068 begin`);
      const actual: string = hotCityAt(69.09);
      logInfo(`hotCityAt(index=69.09): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0068 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0069
     * @tc.name      CitySearch_HotCityAt_0069
     * @tc.desc      hotCityAt(index=106) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0069 begin`);
      const actual: string = hotCityAt(106);
      logInfo(`hotCityAt(index=106): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0069 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0070
     * @tc.name      CitySearch_HotCityAt_0070
     * @tc.desc      hotCityAt(index=-49) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0070 begin`);
      const actual: string = hotCityAt(-49);
      logInfo(`hotCityAt(index=-49): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0070 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0071
     * @tc.name      CitySearch_HotCityAt_0071
     * @tc.desc      hotCityAt(index=52) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0071 begin`);
      const actual: string = hotCityAt(52);
      logInfo(`hotCityAt(index=52): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0071 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0072
     * @tc.name      CitySearch_HotCityAt_0072
     * @tc.desc      hotCityAt(index=108) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0072 begin`);
      const actual: string = hotCityAt(108);
      logInfo(`hotCityAt(index=108): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0072 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0073
     * @tc.name      CitySearch_HotCityAt_0073
     * @tc.desc      hotCityAt(index=124) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0073 begin`);
      const actual: string = hotCityAt(124);
      logInfo(`hotCityAt(index=124): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0073 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0074
     * @tc.name      CitySearch_HotCityAt_0074
     * @tc.desc      hotCityAt(index=197) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0074 begin`);
      const actual: string = hotCityAt(197);
      logInfo(`hotCityAt(index=197): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0074 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0075
     * @tc.name      CitySearch_HotCityAt_0075
     * @tc.desc      hotCityAt(index=113) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0075 begin`);
      const actual: string = hotCityAt(113);
      logInfo(`hotCityAt(index=113): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0075 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0076
     * @tc.name      CitySearch_HotCityAt_0076
     * @tc.desc      hotCityAt(index=182) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0076 begin`);
      const actual: string = hotCityAt(182);
      logInfo(`hotCityAt(index=182): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0076 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0077
     * @tc.name      CitySearch_HotCityAt_0077
     * @tc.desc      hotCityAt(index=166) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0077 begin`);
      const actual: string = hotCityAt(166);
      logInfo(`hotCityAt(index=166): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0077 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0078
     * @tc.name      CitySearch_HotCityAt_0078
     * @tc.desc      hotCityAt(index=41.3) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0078 begin`);
      const actual: string = hotCityAt(41.3);
      logInfo(`hotCityAt(index=41.3): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0078 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0079
     * @tc.name      CitySearch_HotCityAt_0079
     * @tc.desc      hotCityAt(index=46.72) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0079 begin`);
      const actual: string = hotCityAt(46.72);
      logInfo(`hotCityAt(index=46.72): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0079 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0080
     * @tc.name      CitySearch_HotCityAt_0080
     * @tc.desc      hotCityAt(index=81) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0080 begin`);
      const actual: string = hotCityAt(81);
      logInfo(`hotCityAt(index=81): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0080 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0081
     * @tc.name      CitySearch_HotCityAt_0081
     * @tc.desc      hotCityAt(index=64.98) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0081 begin`);
      const actual: string = hotCityAt(64.98);
      logInfo(`hotCityAt(index=64.98): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0081 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0082
     * @tc.name      CitySearch_HotCityAt_0082
     * @tc.desc      hotCityAt(index=-99) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0082 begin`);
      const actual: string = hotCityAt(-99);
      logInfo(`hotCityAt(index=-99): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0082 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0083
     * @tc.name      CitySearch_HotCityAt_0083
     * @tc.desc      hotCityAt(index=20.69) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0083 begin`);
      const actual: string = hotCityAt(20.69);
      logInfo(`hotCityAt(index=20.69): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0083 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0084
     * @tc.name      CitySearch_HotCityAt_0084
     * @tc.desc      hotCityAt(index=161) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0084 begin`);
      const actual: string = hotCityAt(161);
      logInfo(`hotCityAt(index=161): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0084 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0085
     * @tc.name      CitySearch_HotCityAt_0085
     * @tc.desc      hotCityAt(index=-15) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0085 begin`);
      const actual: string = hotCityAt(-15);
      logInfo(`hotCityAt(index=-15): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0085 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0086
     * @tc.name      CitySearch_HotCityAt_0086
     * @tc.desc      hotCityAt(index=146) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0086 begin`);
      const actual: string = hotCityAt(146);
      logInfo(`hotCityAt(index=146): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0086 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0087
     * @tc.name      CitySearch_HotCityAt_0087
     * @tc.desc      hotCityAt(index=52.85) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0087 begin`);
      const actual: string = hotCityAt(52.85);
      logInfo(`hotCityAt(index=52.85): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0087 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0088
     * @tc.name      CitySearch_HotCityAt_0088
     * @tc.desc      hotCityAt(index=23) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0088 begin`);
      const actual: string = hotCityAt(23);
      logInfo(`hotCityAt(index=23): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0088 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0089
     * @tc.name      CitySearch_HotCityAt_0089
     * @tc.desc      hotCityAt(index=-17) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0089 begin`);
      const actual: string = hotCityAt(-17);
      logInfo(`hotCityAt(index=-17): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0089 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0090
     * @tc.name      CitySearch_HotCityAt_0090
     * @tc.desc      hotCityAt(index=153) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0090 begin`);
      const actual: string = hotCityAt(153);
      logInfo(`hotCityAt(index=153): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0090 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0091
     * @tc.name      CitySearch_HotCityAt_0091
     * @tc.desc      hotCityAt(index=20.5) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0091 begin`);
      const actual: string = hotCityAt(20.5);
      logInfo(`hotCityAt(index=20.5): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0091 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0092
     * @tc.name      CitySearch_HotCityAt_0092
     * @tc.desc      hotCityAt(index=-26) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_HotCityAt_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}HotCityAt_0092 begin`);
      const actual: string = hotCityAt(-26);
      logInfo(`hotCityAt(index=-26): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0092 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0093
     * @tc.name      CitySearch_HotCityAt_0093
     * @tc.desc      hotCityAt(index=121) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0093 begin`);
      const actual: string = hotCityAt(121);
      logInfo(`hotCityAt(index=121): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0093 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0094
     * @tc.name      CitySearch_HotCityAt_0094
     * @tc.desc      hotCityAt(index=47.07) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0094 begin`);
      const actual: string = hotCityAt(47.07);
      logInfo(`hotCityAt(index=47.07): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0094 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0095
     * @tc.name      CitySearch_HotCityAt_0095
     * @tc.desc      hotCityAt(index=71.61) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0095 begin`);
      const actual: string = hotCityAt(71.61);
      logInfo(`hotCityAt(index=71.61): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0095 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_HOT_CITY_AT_0096
     * @tc.name      CitySearch_HotCityAt_0096
     * @tc.desc      hotCityAt(index=147) returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_HotCityAt_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}HotCityAt_0096 begin`);
      const actual: string = hotCityAt(147);
      logInfo(`hotCityAt(index=147): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}HotCityAt_0096 end`);
    });
  });
}
