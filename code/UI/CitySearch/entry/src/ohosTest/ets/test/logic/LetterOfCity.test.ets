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
import { letterOfCity } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for letterOfCity (30 cases). */
export default function letterOfCityTest(): void {
  describe('LetterOfCityTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0001
     * @tc.name      CitySearch_LetterOfCity_0001
     * @tc.desc      letterOfCity(cityName="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_LetterOfCity_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LetterOfCity_0001 begin`);
      const actual: string = letterOfCity('');
      logInfo(`letterOfCity(cityName=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0001 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0002
     * @tc.name      CitySearch_LetterOfCity_0002
     * @tc.desc      letterOfCity(cityName="x") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_LetterOfCity_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LetterOfCity_0002 begin`);
      const actual: string = letterOfCity('x');
      logInfo(`letterOfCity(cityName="x"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0002 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0003
     * @tc.name      CitySearch_LetterOfCity_0003
     * @tc.desc      letterOfCity(cityName="Hello") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterOfCity_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfCity_0003 begin`);
      const actual: string = letterOfCity('Hello');
      logInfo(`letterOfCity(cityName="Hello"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0003 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0004
     * @tc.name      CitySearch_LetterOfCity_0004
     * @tc.desc      letterOfCity(cityName="hello world") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterOfCity_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfCity_0004 begin`);
      const actual: string = letterOfCity('hello world');
      logInfo(`letterOfCity(cityName="hello world"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0004 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0005
     * @tc.name      CitySearch_LetterOfCity_0005
     * @tc.desc      letterOfCity(cityName=" ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterOfCity_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfCity_0005 begin`);
      const actual: string = letterOfCity(' ');
      logInfo(`letterOfCity(cityName=" "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0005 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0006
     * @tc.name      CitySearch_LetterOfCity_0006
     * @tc.desc      letterOfCity(cityName="A") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterOfCity_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfCity_0006 begin`);
      const actual: string = letterOfCity('A');
      logInfo(`letterOfCity(cityName="A"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0006 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0007
     * @tc.name      CitySearch_LetterOfCity_0007
     * @tc.desc      letterOfCity(cityName="Sample Title 123") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterOfCity_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfCity_0007 begin`);
      const actual: string = letterOfCity('Sample Title 123');
      logInfo(`letterOfCity(cityName="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0007 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0008
     * @tc.name      CitySearch_LetterOfCity_0008
     * @tc.desc      letterOfCity(cityName="??") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterOfCity_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfCity_0008 begin`);
      const actual: string = letterOfCity('\u4e2d\u6587');
      logInfo(`letterOfCity(cityName="??"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0008 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0009
     * @tc.name      CitySearch_LetterOfCity_0009
     * @tc.desc      letterOfCity(cityName="a") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterOfCity_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfCity_0009 begin`);
      const actual: string = letterOfCity('a');
      logInfo(`letterOfCity(cityName="a"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0009 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0010
     * @tc.name      CitySearch_LetterOfCity_0010
     * @tc.desc      letterOfCity(cityName="abc") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterOfCity_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfCity_0010 begin`);
      const actual: string = letterOfCity('abc');
      logInfo(`letterOfCity(cityName="abc"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0010 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0011
     * @tc.name      CitySearch_LetterOfCity_0011
     * @tc.desc      letterOfCity(cityName="Hello World") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterOfCity_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfCity_0011 begin`);
      const actual: string = letterOfCity('Hello World');
      logInfo(`letterOfCity(cityName="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0011 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0012
     * @tc.name      CitySearch_LetterOfCity_0012
     * @tc.desc      letterOfCity(cityName="123") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterOfCity_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfCity_0012 begin`);
      const actual: string = letterOfCity('123');
      logInfo(`letterOfCity(cityName="123"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0012 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0013
     * @tc.name      CitySearch_LetterOfCity_0013
     * @tc.desc      letterOfCity(cityName=" x ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterOfCity_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfCity_0013 begin`);
      const actual: string = letterOfCity(' x ');
      logInfo(`letterOfCity(cityName=" x "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0013 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0014
     * @tc.name      CitySearch_LetterOfCity_0014
     * @tc.desc      letterOfCity(cityName="xx") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterOfCity_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfCity_0014 begin`);
      const actual: string = letterOfCity('xx');
      logInfo(`letterOfCity(cityName="xx"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0014 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0015
     * @tc.name      CitySearch_LetterOfCity_0015
     * @tc.desc      letterOfCity(cityName="x_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterOfCity_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfCity_0015 begin`);
      const actual: string = letterOfCity('x_1');
      logInfo(`letterOfCity(cityName="x_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0015 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0016
     * @tc.name      CitySearch_LetterOfCity_0016
     * @tc.desc      letterOfCity(cityName=" Hello ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterOfCity_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfCity_0016 begin`);
      const actual: string = letterOfCity(' Hello ');
      logInfo(`letterOfCity(cityName=" Hello "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0016 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0017
     * @tc.name      CitySearch_LetterOfCity_0017
     * @tc.desc      letterOfCity(cityName="HelloHello") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterOfCity_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfCity_0017 begin`);
      const actual: string = letterOfCity('HelloHello');
      logInfo(`letterOfCity(cityName="HelloHello"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0017 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0018
     * @tc.name      CitySearch_LetterOfCity_0018
     * @tc.desc      letterOfCity(cityName="Hello_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterOfCity_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfCity_0018 begin`);
      const actual: string = letterOfCity('Hello_1');
      logInfo(`letterOfCity(cityName="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0018 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0019
     * @tc.name      CitySearch_LetterOfCity_0019
     * @tc.desc      letterOfCity(cityName="xHello") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterOfCity_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfCity_0019 begin`);
      const actual: string = letterOfCity('xHello');
      logInfo(`letterOfCity(cityName="xHello"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0019 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0020
     * @tc.name      CitySearch_LetterOfCity_0020
     * @tc.desc      letterOfCity(cityName=" hello world ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterOfCity_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfCity_0020 begin`);
      const actual: string = letterOfCity(' hello world ');
      logInfo(`letterOfCity(cityName=" hello world "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0020 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0021
     * @tc.name      CitySearch_LetterOfCity_0021
     * @tc.desc      letterOfCity(cityName="hello worldhello world") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterOfCity_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfCity_0021 begin`);
      const actual: string = letterOfCity('hello worldhello world');
      logInfo(`letterOfCity(cityName="hello worldhello w...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0021 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0022
     * @tc.name      CitySearch_LetterOfCity_0022
     * @tc.desc      letterOfCity(cityName="hello world_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterOfCity_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfCity_0022 begin`);
      const actual: string = letterOfCity('hello world_1');
      logInfo(`letterOfCity(cityName="hello world_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0022 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0023
     * @tc.name      CitySearch_LetterOfCity_0023
     * @tc.desc      letterOfCity(cityName="xhello world") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterOfCity_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfCity_0023 begin`);
      const actual: string = letterOfCity('xhello world');
      logInfo(`letterOfCity(cityName="xhello world"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0023 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0024
     * @tc.name      CitySearch_LetterOfCity_0024
     * @tc.desc      letterOfCity(cityName="   ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterOfCity_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfCity_0024 begin`);
      const actual: string = letterOfCity('   ');
      logInfo(`letterOfCity(cityName="   "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0024 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0025
     * @tc.name      CitySearch_LetterOfCity_0025
     * @tc.desc      letterOfCity(cityName="  ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterOfCity_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfCity_0025 begin`);
      const actual: string = letterOfCity('  ');
      logInfo(`letterOfCity(cityName="  "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0025 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0026
     * @tc.name      CitySearch_LetterOfCity_0026
     * @tc.desc      letterOfCity(cityName=" _1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterOfCity_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfCity_0026 begin`);
      const actual: string = letterOfCity(' _1');
      logInfo(`letterOfCity(cityName=" _1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0026 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0027
     * @tc.name      CitySearch_LetterOfCity_0027
     * @tc.desc      letterOfCity(cityName="x ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterOfCity_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfCity_0027 begin`);
      const actual: string = letterOfCity('x ');
      logInfo(`letterOfCity(cityName="x "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0027 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0028
     * @tc.name      CitySearch_LetterOfCity_0028
     * @tc.desc      letterOfCity(cityName=" A ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_LetterOfCity_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LetterOfCity_0028 begin`);
      const actual: string = letterOfCity(' A ');
      logInfo(`letterOfCity(cityName=" A "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0028 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0029
     * @tc.name      CitySearch_LetterOfCity_0029
     * @tc.desc      letterOfCity(cityName="AA") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterOfCity_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfCity_0029 begin`);
      const actual: string = letterOfCity('AA');
      logInfo(`letterOfCity(cityName="AA"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0029 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_LETTER_OF_CITY_0030
     * @tc.name      CitySearch_LetterOfCity_0030
     * @tc.desc      letterOfCity(cityName="A_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_LetterOfCity_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LetterOfCity_0030 begin`);
      const actual: string = letterOfCity('A_1');
      logInfo(`letterOfCity(cityName="A_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LetterOfCity_0030 end`);
    });
  });
}
