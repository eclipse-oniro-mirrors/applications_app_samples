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
import { searchCities } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for searchCities (55 cases). */
export default function searchCities2Test(): void {
  describe('SearchCities2Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0096
     * @tc.name      CitySearch_SearchCities_0096
     * @tc.desc      searchCities(value="8p") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0096 begin`);
      const actual: string[] = searchCities('8p');
      logInfo(`searchCities(value="8p"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0096 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0097
     * @tc.name      CitySearch_SearchCities_0097
     * @tc.desc      searchCities(value="fqSoNR") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0097 begin`);
      const actual: string[] = searchCities('fqSoNR');
      logInfo(`searchCities(value="fqSoNR"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0097 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0098
     * @tc.name      CitySearch_SearchCities_0098
     * @tc.desc      searchCities(value="1GxLvn3A1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0098 begin`);
      const actual: string[] = searchCities('1GxLvn3A1');
      logInfo(`searchCities(value="1GxLvn3A1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0098 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0099
     * @tc.name      CitySearch_SearchCities_0099
     * @tc.desc      searchCities(value="lY2fI") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0099 begin`);
      const actual: string[] = searchCities('lY2fI');
      logInfo(`searchCities(value="lY2fI"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0099 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0100
     * @tc.name      CitySearch_SearchCities_0100
     * @tc.desc      searchCities(value="8QS") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0100 begin`);
      const actual: string[] = searchCities('8QS');
      logInfo(`searchCities(value="8QS"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0100 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0101
     * @tc.name      CitySearch_SearchCities_0101
     * @tc.desc      searchCities(value="sSg4H3v1Ca1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0101 begin`);
      const actual: string[] = searchCities('sSg4H3v1Ca1');
      logInfo(`searchCities(value="sSg4H3v1Ca1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0101 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0102
     * @tc.name      CitySearch_SearchCities_0102
     * @tc.desc      searchCities(value="r9o9v3M") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0102 begin`);
      const actual: string[] = searchCities('r9o9v3M');
      logInfo(`searchCities(value="r9o9v3M"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0102 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0103
     * @tc.name      CitySearch_SearchCities_0103
     * @tc.desc      searchCities(value="nZ3fGq6Z6w") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0103 begin`);
      const actual: string[] = searchCities('nZ3fGq6Z6w');
      logInfo(`searchCities(value="nZ3fGq6Z6w"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0103 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0104
     * @tc.name      CitySearch_SearchCities_0104
     * @tc.desc      searchCities(value="ZHErd") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0104 begin`);
      const actual: string[] = searchCities('ZHErd');
      logInfo(`searchCities(value="ZHErd"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0104 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0105
     * @tc.name      CitySearch_SearchCities_0105
     * @tc.desc      searchCities(value="Pd") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0105 begin`);
      const actual: string[] = searchCities('Pd');
      logInfo(`searchCities(value="Pd"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0105 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0106
     * @tc.name      CitySearch_SearchCities_0106
     * @tc.desc      searchCities(value="sc4ifhZF14Y") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0106 begin`);
      const actual: string[] = searchCities('sc4ifhZF14Y');
      logInfo(`searchCities(value="sc4ifhZF14Y"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0106 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0107
     * @tc.name      CitySearch_SearchCities_0107
     * @tc.desc      searchCities(value="NAauIU") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0107 begin`);
      const actual: string[] = searchCities('NAauIU');
      logInfo(`searchCities(value="NAauIU"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0107 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0108
     * @tc.name      CitySearch_SearchCities_0108
     * @tc.desc      searchCities(value="5RCQN") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0108 begin`);
      const actual: string[] = searchCities('5RCQN');
      logInfo(`searchCities(value="5RCQN"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0108 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0109
     * @tc.name      CitySearch_SearchCities_0109
     * @tc.desc      searchCities(value="lN") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0109 begin`);
      const actual: string[] = searchCities('lN');
      logInfo(`searchCities(value="lN"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0109 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0110
     * @tc.name      CitySearch_SearchCities_0110
     * @tc.desc      searchCities(value="LI4bxXs1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0110 begin`);
      const actual: string[] = searchCities('LI4bxXs1');
      logInfo(`searchCities(value="LI4bxXs1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0110 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0111
     * @tc.name      CitySearch_SearchCities_0111
     * @tc.desc      searchCities(value="Tb14Xks") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0111 begin`);
      const actual: string[] = searchCities('Tb14Xks');
      logInfo(`searchCities(value="Tb14Xks"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0111 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0112
     * @tc.name      CitySearch_SearchCities_0112
     * @tc.desc      searchCities(value="wB") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0112 begin`);
      const actual: string[] = searchCities('wB');
      logInfo(`searchCities(value="wB"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0112 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0113
     * @tc.name      CitySearch_SearchCities_0113
     * @tc.desc      searchCities(value="5JO42G") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0113 begin`);
      const actual: string[] = searchCities('5JO42G');
      logInfo(`searchCities(value="5JO42G"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0113 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0114
     * @tc.name      CitySearch_SearchCities_0114
     * @tc.desc      searchCities(value="H1brrz31") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0114 begin`);
      const actual: string[] = searchCities('H1brrz31');
      logInfo(`searchCities(value="H1brrz31"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0114 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0115
     * @tc.name      CitySearch_SearchCities_0115
     * @tc.desc      searchCities(value="p") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0115 begin`);
      const actual: string[] = searchCities('p');
      logInfo(`searchCities(value="p"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0115 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0116
     * @tc.name      CitySearch_SearchCities_0116
     * @tc.desc      searchCities(value="VDJOjSQm4Y") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0116 begin`);
      const actual: string[] = searchCities('VDJOjSQm4Y');
      logInfo(`searchCities(value="VDJOjSQm4Y"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0116 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0117
     * @tc.name      CitySearch_SearchCities_0117
     * @tc.desc      searchCities(value="8sOZ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0117 begin`);
      const actual: string[] = searchCities('8sOZ');
      logInfo(`searchCities(value="8sOZ"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0117 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0118
     * @tc.name      CitySearch_SearchCities_0118
     * @tc.desc      searchCities(value="77MUYoG") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0118 begin`);
      const actual: string[] = searchCities('77MUYoG');
      logInfo(`searchCities(value="77MUYoG"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0118 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0119
     * @tc.name      CitySearch_SearchCities_0119
     * @tc.desc      searchCities(value="LpBXLGq") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0119 begin`);
      const actual: string[] = searchCities('LpBXLGq');
      logInfo(`searchCities(value="LpBXLGq"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0119 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0120
     * @tc.name      CitySearch_SearchCities_0120
     * @tc.desc      searchCities(value="9") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0120 begin`);
      const actual: string[] = searchCities('9');
      logInfo(`searchCities(value="9"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0120 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0121
     * @tc.name      CitySearch_SearchCities_0121
     * @tc.desc      searchCities(value="vcVquAGOHlq") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0121 begin`);
      const actual: string[] = searchCities('vcVquAGOHlq');
      logInfo(`searchCities(value="vcVquAGOHlq"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0121 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0122
     * @tc.name      CitySearch_SearchCities_0122
     * @tc.desc      searchCities(value="1jvsLqf") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0122 begin`);
      const actual: string[] = searchCities('1jvsLqf');
      logInfo(`searchCities(value="1jvsLqf"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0122 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0123
     * @tc.name      CitySearch_SearchCities_0123
     * @tc.desc      searchCities(value="IAdumx") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0123 begin`);
      const actual: string[] = searchCities('IAdumx');
      logInfo(`searchCities(value="IAdumx"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0123 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0124
     * @tc.name      CitySearch_SearchCities_0124
     * @tc.desc      searchCities(value="iCFHo5mKUwBj") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0124 begin`);
      const actual: string[] = searchCities('iCFHo5mKUwBj');
      logInfo(`searchCities(value="iCFHo5mKUwBj"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0124 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0125
     * @tc.name      CitySearch_SearchCities_0125
     * @tc.desc      searchCities(value="UMJWsRdHPf") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0125 begin`);
      const actual: string[] = searchCities('UMJWsRdHPf');
      logInfo(`searchCities(value="UMJWsRdHPf"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0125 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0126
     * @tc.name      CitySearch_SearchCities_0126
     * @tc.desc      searchCities(value="kQInJ") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0126 begin`);
      const actual: string[] = searchCities('kQInJ');
      logInfo(`searchCities(value="kQInJ"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0126 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0127
     * @tc.name      CitySearch_SearchCities_0127
     * @tc.desc      searchCities(value="wM3r") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0127 begin`);
      const actual: string[] = searchCities('wM3r');
      logInfo(`searchCities(value="wM3r"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0127 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0128
     * @tc.name      CitySearch_SearchCities_0128
     * @tc.desc      searchCities(value="d0MET6F") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0128 begin`);
      const actual: string[] = searchCities('d0MET6F');
      logInfo(`searchCities(value="d0MET6F"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0128 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0129
     * @tc.name      CitySearch_SearchCities_0129
     * @tc.desc      searchCities(value="hBzudQQKDxyN") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0129 begin`);
      const actual: string[] = searchCities('hBzudQQKDxyN');
      logInfo(`searchCities(value="hBzudQQKDxyN"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0129 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0130
     * @tc.name      CitySearch_SearchCities_0130
     * @tc.desc      searchCities(value="znly8N6g5J7") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0130 begin`);
      const actual: string[] = searchCities('znly8N6g5J7');
      logInfo(`searchCities(value="znly8N6g5J7"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0130 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0131
     * @tc.name      CitySearch_SearchCities_0131
     * @tc.desc      searchCities(value="owxaLVGXH2") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0131 begin`);
      const actual: string[] = searchCities('owxaLVGXH2');
      logInfo(`searchCities(value="owxaLVGXH2"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0131 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0132
     * @tc.name      CitySearch_SearchCities_0132
     * @tc.desc      searchCities(value="MqF1tw") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0132 begin`);
      const actual: string[] = searchCities('MqF1tw');
      logInfo(`searchCities(value="MqF1tw"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0132 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0133
     * @tc.name      CitySearch_SearchCities_0133
     * @tc.desc      searchCities(value="AfS") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0133 begin`);
      const actual: string[] = searchCities('AfS');
      logInfo(`searchCities(value="AfS"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0133 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0134
     * @tc.name      CitySearch_SearchCities_0134
     * @tc.desc      searchCities(value="RADBZF5hs") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0134 begin`);
      const actual: string[] = searchCities('RADBZF5hs');
      logInfo(`searchCities(value="RADBZF5hs"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0134 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0135
     * @tc.name      CitySearch_SearchCities_0135
     * @tc.desc      searchCities(value="TKMR42jnUE") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0135 begin`);
      const actual: string[] = searchCities('TKMR42jnUE');
      logInfo(`searchCities(value="TKMR42jnUE"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0135 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0136
     * @tc.name      CitySearch_SearchCities_0136
     * @tc.desc      searchCities(value="gA5Cp") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0136 begin`);
      const actual: string[] = searchCities('gA5Cp');
      logInfo(`searchCities(value="gA5Cp"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0136 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0137
     * @tc.name      CitySearch_SearchCities_0137
     * @tc.desc      searchCities(value="7E4sDy") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0137 begin`);
      const actual: string[] = searchCities('7E4sDy');
      logInfo(`searchCities(value="7E4sDy"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0137 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0138
     * @tc.name      CitySearch_SearchCities_0138
     * @tc.desc      searchCities(value="NjPX6ghmsj") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0138 begin`);
      const actual: string[] = searchCities('NjPX6ghmsj');
      logInfo(`searchCities(value="NjPX6ghmsj"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0138 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0139
     * @tc.name      CitySearch_SearchCities_0139
     * @tc.desc      searchCities(value="6XESI") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0139 begin`);
      const actual: string[] = searchCities('6XESI');
      logInfo(`searchCities(value="6XESI"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0139 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0140
     * @tc.name      CitySearch_SearchCities_0140
     * @tc.desc      searchCities(value="HbqZulTkWi") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0140 begin`);
      const actual: string[] = searchCities('HbqZulTkWi');
      logInfo(`searchCities(value="HbqZulTkWi"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0140 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0141
     * @tc.name      CitySearch_SearchCities_0141
     * @tc.desc      searchCities(value="2") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0141 begin`);
      const actual: string[] = searchCities('2');
      logInfo(`searchCities(value="2"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0141 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0142
     * @tc.name      CitySearch_SearchCities_0142
     * @tc.desc      searchCities(value="ntzm5smpezsG") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0142 begin`);
      const actual: string[] = searchCities('ntzm5smpezsG');
      logInfo(`searchCities(value="ntzm5smpezsG"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0142 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0143
     * @tc.name      CitySearch_SearchCities_0143
     * @tc.desc      searchCities(value="rEaz5dfDG4cu") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0143 begin`);
      const actual: string[] = searchCities('rEaz5dfDG4cu');
      logInfo(`searchCities(value="rEaz5dfDG4cu"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0143 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0144
     * @tc.name      CitySearch_SearchCities_0144
     * @tc.desc      searchCities(value="c4tgdi82jtS") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0144 begin`);
      const actual: string[] = searchCities('c4tgdi82jtS');
      logInfo(`searchCities(value="c4tgdi82jtS"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0144 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0145
     * @tc.name      CitySearch_SearchCities_0145
     * @tc.desc      searchCities(value="0dVLH2D") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0145 begin`);
      const actual: string[] = searchCities('0dVLH2D');
      logInfo(`searchCities(value="0dVLH2D"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0145 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0146
     * @tc.name      CitySearch_SearchCities_0146
     * @tc.desc      searchCities(value="SB77x") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0146 begin`);
      const actual: string[] = searchCities('SB77x');
      logInfo(`searchCities(value="SB77x"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0146 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0147
     * @tc.name      CitySearch_SearchCities_0147
     * @tc.desc      searchCities(value="1") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0147 begin`);
      const actual: string[] = searchCities('1');
      logInfo(`searchCities(value="1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0147 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0148
     * @tc.name      CitySearch_SearchCities_0148
     * @tc.desc      searchCities(value="lav7JVM1bE") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0148 begin`);
      const actual: string[] = searchCities('lav7JVM1bE');
      logInfo(`searchCities(value="lav7JVM1bE"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0148 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0149
     * @tc.name      CitySearch_SearchCities_0149
     * @tc.desc      searchCities(value="lrGg") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0149 begin`);
      const actual: string[] = searchCities('lrGg');
      logInfo(`searchCities(value="lrGg"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0149 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_SEARCH_CITIES_0150
     * @tc.name      CitySearch_SearchCities_0150
     * @tc.desc      searchCities(value="ZA6WBy3") returns len0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_SearchCities_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SearchCities_0150 begin`);
      const actual: string[] = searchCities('ZA6WBy3');
      logInfo(`searchCities(value="ZA6WBy3"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(0);
      logInfo(`${BUNDLE}SearchCities_0150 end`);
    });
  });
}
