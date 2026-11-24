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
import { showsSubCities } from '../model/CityPickerLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Location]';
const BUNDLE: string = 'Location_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for showsSubCities (50 cases). */
export default function showsSubCitiesTest(): void {
  describe('ShowsSubCitiesTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0001
     * @tc.name      Location_ShowsSubCities_0001
     * @tc.desc      showsSubCities(current="", province="") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_ShowsSubCities_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0001 begin`);
      const actual: boolean = showsSubCities('', '');
      logInfo(`showsSubCities(current="", province=""): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsSubCities_0001 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0002
     * @tc.name      Location_ShowsSubCities_0002
     * @tc.desc      showsSubCities(current="", province="a") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_ShowsSubCities_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0002 begin`);
      const actual: boolean = showsSubCities('', 'a');
      logInfo(`showsSubCities(current="", province="a"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0002 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0003
     * @tc.name      Location_ShowsSubCities_0003
     * @tc.desc      showsSubCities(current="", province="abc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0003 begin`);
      const actual: boolean = showsSubCities('', 'abc');
      logInfo(`showsSubCities(current="", province="abc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0003 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0004
     * @tc.name      Location_ShowsSubCities_0004
     * @tc.desc      showsSubCities(current="", province="Hello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0004 begin`);
      const actual: boolean = showsSubCities('', 'Hello World');
      logInfo(`showsSubCities(current="", province="Hell...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0004 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0005
     * @tc.name      Location_ShowsSubCities_0005
     * @tc.desc      showsSubCities(current="", province=" ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0005 begin`);
      const actual: boolean = showsSubCities('', ' ');
      logInfo(`showsSubCities(current="", province=" "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0005 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0006
     * @tc.name      Location_ShowsSubCities_0006
     * @tc.desc      showsSubCities(current="", province="123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0006 begin`);
      const actual: boolean = showsSubCities('', '123');
      logInfo(`showsSubCities(current="", province="123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0006 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0007
     * @tc.name      Location_ShowsSubCities_0007
     * @tc.desc      showsSubCities(current="", province=" a ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0007 begin`);
      const actual: boolean = showsSubCities('', ' a ');
      logInfo(`showsSubCities(current="", province=" a "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0007 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0008
     * @tc.name      Location_ShowsSubCities_0008
     * @tc.desc      showsSubCities(current="", province="aa") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0008 begin`);
      const actual: boolean = showsSubCities('', 'aa');
      logInfo(`showsSubCities(current="", province="aa"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0008 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0009
     * @tc.name      Location_ShowsSubCities_0009
     * @tc.desc      showsSubCities(current="", province="a_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0009 begin`);
      const actual: boolean = showsSubCities('', 'a_1');
      logInfo(`showsSubCities(current="", province="a_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0009 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0010
     * @tc.name      Location_ShowsSubCities_0010
     * @tc.desc      showsSubCities(current="", province="xa") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0010 begin`);
      const actual: boolean = showsSubCities('', 'xa');
      logInfo(`showsSubCities(current="", province="xa"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0010 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0011
     * @tc.name      Location_ShowsSubCities_0011
     * @tc.desc      showsSubCities(current="", province=" abc ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0011 begin`);
      const actual: boolean = showsSubCities('', ' abc ');
      logInfo(`showsSubCities(current="", province=" abc "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0011 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0012
     * @tc.name      Location_ShowsSubCities_0012
     * @tc.desc      showsSubCities(current="", province="abcabc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0012 begin`);
      const actual: boolean = showsSubCities('', 'abcabc');
      logInfo(`showsSubCities(current="", province="abca...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0012 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0013
     * @tc.name      Location_ShowsSubCities_0013
     * @tc.desc      showsSubCities(current="", province="abc_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0013 begin`);
      const actual: boolean = showsSubCities('', 'abc_1');
      logInfo(`showsSubCities(current="", province="abc_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0013 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0014
     * @tc.name      Location_ShowsSubCities_0014
     * @tc.desc      showsSubCities(current="", province="xabc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0014 begin`);
      const actual: boolean = showsSubCities('', 'xabc');
      logInfo(`showsSubCities(current="", province="xabc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0014 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0015
     * @tc.name      Location_ShowsSubCities_0015
     * @tc.desc      showsSubCities(current="", province=" Hello World ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0015 begin`);
      const actual: boolean = showsSubCities('', ' Hello World ');
      logInfo(`showsSubCities(current="", province=" Hel...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0015 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0016
     * @tc.name      Location_ShowsSubCities_0016
     * @tc.desc      showsSubCities(current="", province="Hello WorldHello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0016 begin`);
      const actual: boolean = showsSubCities('', 'Hello WorldHello World');
      logInfo(`showsSubCities(current="", province="Hell...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0016 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0017
     * @tc.name      Location_ShowsSubCities_0017
     * @tc.desc      showsSubCities(current="", province="Hello World_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0017 begin`);
      const actual: boolean = showsSubCities('', 'Hello World_1');
      logInfo(`showsSubCities(current="", province="Hell...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0017 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0018
     * @tc.name      Location_ShowsSubCities_0018
     * @tc.desc      showsSubCities(current="", province="xHello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0018 begin`);
      const actual: boolean = showsSubCities('', 'xHello World');
      logInfo(`showsSubCities(current="", province="xHel...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0018 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0019
     * @tc.name      Location_ShowsSubCities_0019
     * @tc.desc      showsSubCities(current="", province="   ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0019 begin`);
      const actual: boolean = showsSubCities('', '   ');
      logInfo(`showsSubCities(current="", province="   "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0019 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0020
     * @tc.name      Location_ShowsSubCities_0020
     * @tc.desc      showsSubCities(current="", province="  ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0020 begin`);
      const actual: boolean = showsSubCities('', '  ');
      logInfo(`showsSubCities(current="", province="  "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0020 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0021
     * @tc.name      Location_ShowsSubCities_0021
     * @tc.desc      showsSubCities(current="", province=" _1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0021 begin`);
      const actual: boolean = showsSubCities('', ' _1');
      logInfo(`showsSubCities(current="", province=" _1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0021 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0022
     * @tc.name      Location_ShowsSubCities_0022
     * @tc.desc      showsSubCities(current="", province="x ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0022 begin`);
      const actual: boolean = showsSubCities('', 'x ');
      logInfo(`showsSubCities(current="", province="x "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0022 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0023
     * @tc.name      Location_ShowsSubCities_0023
     * @tc.desc      showsSubCities(current="", province=" 123 ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0023 begin`);
      const actual: boolean = showsSubCities('', ' 123 ');
      logInfo(`showsSubCities(current="", province=" 123 "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0023 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0024
     * @tc.name      Location_ShowsSubCities_0024
     * @tc.desc      showsSubCities(current="", province="123123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0024 begin`);
      const actual: boolean = showsSubCities('', '123123');
      logInfo(`showsSubCities(current="", province="1231...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0024 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0025
     * @tc.name      Location_ShowsSubCities_0025
     * @tc.desc      showsSubCities(current="a", province="") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0025 begin`);
      const actual: boolean = showsSubCities('a', '');
      logInfo(`showsSubCities(current="a", province=""): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0025 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0026
     * @tc.name      Location_ShowsSubCities_0026
     * @tc.desc      showsSubCities(current="a", province="a") returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ShowsSubCities_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0026 begin`);
      const actual: boolean = showsSubCities('a', 'a');
      logInfo(`showsSubCities(current="a", province="a"): actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}ShowsSubCities_0026 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0027
     * @tc.name      Location_ShowsSubCities_0027
     * @tc.desc      showsSubCities(current="a", province="abc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ShowsSubCities_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0027 begin`);
      const actual: boolean = showsSubCities('a', 'abc');
      logInfo(`showsSubCities(current="a", province="abc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0027 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0028
     * @tc.name      Location_ShowsSubCities_0028
     * @tc.desc      showsSubCities(current="a", province="Hello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ShowsSubCities_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0028 begin`);
      const actual: boolean = showsSubCities('a', 'Hello World');
      logInfo(`showsSubCities(current="a", province="Hel...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0028 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0029
     * @tc.name      Location_ShowsSubCities_0029
     * @tc.desc      showsSubCities(current="a", province=" ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ShowsSubCities_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0029 begin`);
      const actual: boolean = showsSubCities('a', ' ');
      logInfo(`showsSubCities(current="a", province=" "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0029 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0030
     * @tc.name      Location_ShowsSubCities_0030
     * @tc.desc      showsSubCities(current="a", province="123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ShowsSubCities_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0030 begin`);
      const actual: boolean = showsSubCities('a', '123');
      logInfo(`showsSubCities(current="a", province="123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0030 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0031
     * @tc.name      Location_ShowsSubCities_0031
     * @tc.desc      showsSubCities(current="a", province=" a ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0031 begin`);
      const actual: boolean = showsSubCities('a', ' a ');
      logInfo(`showsSubCities(current="a", province=" a "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0031 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0032
     * @tc.name      Location_ShowsSubCities_0032
     * @tc.desc      showsSubCities(current="a", province="aa") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ShowsSubCities_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0032 begin`);
      const actual: boolean = showsSubCities('a', 'aa');
      logInfo(`showsSubCities(current="a", province="aa"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0032 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0033
     * @tc.name      Location_ShowsSubCities_0033
     * @tc.desc      showsSubCities(current="a", province="a_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ShowsSubCities_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0033 begin`);
      const actual: boolean = showsSubCities('a', 'a_1');
      logInfo(`showsSubCities(current="a", province="a_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0033 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0034
     * @tc.name      Location_ShowsSubCities_0034
     * @tc.desc      showsSubCities(current="a", province="xa") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0034 begin`);
      const actual: boolean = showsSubCities('a', 'xa');
      logInfo(`showsSubCities(current="a", province="xa"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0034 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0035
     * @tc.name      Location_ShowsSubCities_0035
     * @tc.desc      showsSubCities(current="a", province=" abc ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0035 begin`);
      const actual: boolean = showsSubCities('a', ' abc ');
      logInfo(`showsSubCities(current="a", province=" ab...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0035 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0036
     * @tc.name      Location_ShowsSubCities_0036
     * @tc.desc      showsSubCities(current="a", province="abcabc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ShowsSubCities_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0036 begin`);
      const actual: boolean = showsSubCities('a', 'abcabc');
      logInfo(`showsSubCities(current="a", province="abc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0036 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0037
     * @tc.name      Location_ShowsSubCities_0037
     * @tc.desc      showsSubCities(current="a", province="abc_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ShowsSubCities_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0037 begin`);
      const actual: boolean = showsSubCities('a', 'abc_1');
      logInfo(`showsSubCities(current="a", province="abc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0037 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0038
     * @tc.name      Location_ShowsSubCities_0038
     * @tc.desc      showsSubCities(current="a", province="xabc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0038 begin`);
      const actual: boolean = showsSubCities('a', 'xabc');
      logInfo(`showsSubCities(current="a", province="xabc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0038 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0039
     * @tc.name      Location_ShowsSubCities_0039
     * @tc.desc      showsSubCities(current="a", province=" Hello World ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0039 begin`);
      const actual: boolean = showsSubCities('a', ' Hello World ');
      logInfo(`showsSubCities(current="a", province=" He...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0039 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0040
     * @tc.name      Location_ShowsSubCities_0040
     * @tc.desc      showsSubCities(current="a", province="Hello WorldHello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ShowsSubCities_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0040 begin`);
      const actual: boolean = showsSubCities('a', 'Hello WorldHello World');
      logInfo(`showsSubCities(current="a", province="Hel...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0040 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0041
     * @tc.name      Location_ShowsSubCities_0041
     * @tc.desc      showsSubCities(current="a", province="Hello World_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ShowsSubCities_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0041 begin`);
      const actual: boolean = showsSubCities('a', 'Hello World_1');
      logInfo(`showsSubCities(current="a", province="Hel...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0041 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0042
     * @tc.name      Location_ShowsSubCities_0042
     * @tc.desc      showsSubCities(current="a", province="xHello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0042 begin`);
      const actual: boolean = showsSubCities('a', 'xHello World');
      logInfo(`showsSubCities(current="a", province="xHe...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0042 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0043
     * @tc.name      Location_ShowsSubCities_0043
     * @tc.desc      showsSubCities(current="a", province="   ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0043 begin`);
      const actual: boolean = showsSubCities('a', '   ');
      logInfo(`showsSubCities(current="a", province="   "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0043 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0044
     * @tc.name      Location_ShowsSubCities_0044
     * @tc.desc      showsSubCities(current="a", province="  ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ShowsSubCities_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0044 begin`);
      const actual: boolean = showsSubCities('a', '  ');
      logInfo(`showsSubCities(current="a", province="  "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0044 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0045
     * @tc.name      Location_ShowsSubCities_0045
     * @tc.desc      showsSubCities(current="a", province=" _1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ShowsSubCities_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0045 begin`);
      const actual: boolean = showsSubCities('a', ' _1');
      logInfo(`showsSubCities(current="a", province=" _1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0045 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0046
     * @tc.name      Location_ShowsSubCities_0046
     * @tc.desc      showsSubCities(current="a", province="x ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0046 begin`);
      const actual: boolean = showsSubCities('a', 'x ');
      logInfo(`showsSubCities(current="a", province="x "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0046 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0047
     * @tc.name      Location_ShowsSubCities_0047
     * @tc.desc      showsSubCities(current="a", province=" 123 ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0047 begin`);
      const actual: boolean = showsSubCities('a', ' 123 ');
      logInfo(`showsSubCities(current="a", province=" 12...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0047 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0048
     * @tc.name      Location_ShowsSubCities_0048
     * @tc.desc      showsSubCities(current="a", province="123123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ShowsSubCities_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0048 begin`);
      const actual: boolean = showsSubCities('a', '123123');
      logInfo(`showsSubCities(current="a", province="123...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0048 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0049
     * @tc.name      Location_ShowsSubCities_0049
     * @tc.desc      showsSubCities(current="abc", province="") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ShowsSubCities_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0049 begin`);
      const actual: boolean = showsSubCities('abc', '');
      logInfo(`showsSubCities(current="abc", province=""): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0049 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_SHOWS_SUB_CITIES_0050
     * @tc.name      Location_ShowsSubCities_0050
     * @tc.desc      showsSubCities(current="abc", province="a") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ShowsSubCities_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ShowsSubCities_0050 begin`);
      const actual: boolean = showsSubCities('abc', 'a');
      logInfo(`showsSubCities(current="abc", province="a"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}ShowsSubCities_0050 end`);
    });
  });
}
