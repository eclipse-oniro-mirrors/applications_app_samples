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
import { isHotCity } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isHotCity (30 cases). */
export default function isHotCityTest(): void {
  describe('IsHotCityTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0001
     * @tc.name      CitySearch_IsHotCity_0001
     * @tc.desc      isHotCity(name="Hello") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_IsHotCity_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsHotCity_0001 begin`);
      const actual: boolean = isHotCity('Hello');
      logInfo(`isHotCity(name="Hello"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0001 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0002
     * @tc.name      CitySearch_IsHotCity_0002
     * @tc.desc      isHotCity(name="hello world") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_IsHotCity_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsHotCity_0002 begin`);
      const actual: boolean = isHotCity('hello world');
      logInfo(`isHotCity(name="hello world"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0002 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0003
     * @tc.name      CitySearch_IsHotCity_0003
     * @tc.desc      isHotCity(name="") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_IsHotCity_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHotCity_0003 begin`);
      const actual: boolean = isHotCity('');
      logInfo(`isHotCity(name=""): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0003 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0004
     * @tc.name      CitySearch_IsHotCity_0004
     * @tc.desc      isHotCity(name=" ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_IsHotCity_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHotCity_0004 begin`);
      const actual: boolean = isHotCity(' ');
      logInfo(`isHotCity(name=" "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0004 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0005
     * @tc.name      CitySearch_IsHotCity_0005
     * @tc.desc      isHotCity(name="A") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_IsHotCity_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHotCity_0005 begin`);
      const actual: boolean = isHotCity('A');
      logInfo(`isHotCity(name="A"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0005 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0006
     * @tc.name      CitySearch_IsHotCity_0006
     * @tc.desc      isHotCity(name="Sample Title 123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_IsHotCity_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHotCity_0006 begin`);
      const actual: boolean = isHotCity('Sample Title 123');
      logInfo(`isHotCity(name="Sample Title 123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0006 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0007
     * @tc.name      CitySearch_IsHotCity_0007
     * @tc.desc      isHotCity(name="??") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_IsHotCity_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHotCity_0007 begin`);
      const actual: boolean = isHotCity('\u4e2d\u6587');
      logInfo(`isHotCity(name="??"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0007 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0008
     * @tc.name      CitySearch_IsHotCity_0008
     * @tc.desc      isHotCity(name="a") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_IsHotCity_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHotCity_0008 begin`);
      const actual: boolean = isHotCity('a');
      logInfo(`isHotCity(name="a"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0008 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0009
     * @tc.name      CitySearch_IsHotCity_0009
     * @tc.desc      isHotCity(name="abc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_IsHotCity_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHotCity_0009 begin`);
      const actual: boolean = isHotCity('abc');
      logInfo(`isHotCity(name="abc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0009 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0010
     * @tc.name      CitySearch_IsHotCity_0010
     * @tc.desc      isHotCity(name="Hello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_IsHotCity_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHotCity_0010 begin`);
      const actual: boolean = isHotCity('Hello World');
      logInfo(`isHotCity(name="Hello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0010 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0011
     * @tc.name      CitySearch_IsHotCity_0011
     * @tc.desc      isHotCity(name="123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_IsHotCity_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHotCity_0011 begin`);
      const actual: boolean = isHotCity('123');
      logInfo(`isHotCity(name="123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0011 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0012
     * @tc.name      CitySearch_IsHotCity_0012
     * @tc.desc      isHotCity(name=" Hello ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_IsHotCity_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHotCity_0012 begin`);
      const actual: boolean = isHotCity(' Hello ');
      logInfo(`isHotCity(name=" Hello "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0012 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0013
     * @tc.name      CitySearch_IsHotCity_0013
     * @tc.desc      isHotCity(name="HelloHello") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_IsHotCity_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHotCity_0013 begin`);
      const actual: boolean = isHotCity('HelloHello');
      logInfo(`isHotCity(name="HelloHello"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0013 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0014
     * @tc.name      CitySearch_IsHotCity_0014
     * @tc.desc      isHotCity(name="Hello_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_IsHotCity_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHotCity_0014 begin`);
      const actual: boolean = isHotCity('Hello_1');
      logInfo(`isHotCity(name="Hello_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0014 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0015
     * @tc.name      CitySearch_IsHotCity_0015
     * @tc.desc      isHotCity(name="xHello") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_IsHotCity_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHotCity_0015 begin`);
      const actual: boolean = isHotCity('xHello');
      logInfo(`isHotCity(name="xHello"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0015 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0016
     * @tc.name      CitySearch_IsHotCity_0016
     * @tc.desc      isHotCity(name=" hello world ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_IsHotCity_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHotCity_0016 begin`);
      const actual: boolean = isHotCity(' hello world ');
      logInfo(`isHotCity(name=" hello world "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0016 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0017
     * @tc.name      CitySearch_IsHotCity_0017
     * @tc.desc      isHotCity(name="hello worldhello world") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_IsHotCity_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHotCity_0017 begin`);
      const actual: boolean = isHotCity('hello worldhello world');
      logInfo(`isHotCity(name="hello worldhello world"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0017 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0018
     * @tc.name      CitySearch_IsHotCity_0018
     * @tc.desc      isHotCity(name="hello world_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_IsHotCity_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHotCity_0018 begin`);
      const actual: boolean = isHotCity('hello world_1');
      logInfo(`isHotCity(name="hello world_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0018 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0019
     * @tc.name      CitySearch_IsHotCity_0019
     * @tc.desc      isHotCity(name="xhello world") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_IsHotCity_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHotCity_0019 begin`);
      const actual: boolean = isHotCity('xhello world');
      logInfo(`isHotCity(name="xhello world"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0019 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0020
     * @tc.name      CitySearch_IsHotCity_0020
     * @tc.desc      isHotCity(name="   ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_IsHotCity_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHotCity_0020 begin`);
      const actual: boolean = isHotCity('   ');
      logInfo(`isHotCity(name="   "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0020 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0021
     * @tc.name      CitySearch_IsHotCity_0021
     * @tc.desc      isHotCity(name="  ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_IsHotCity_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHotCity_0021 begin`);
      const actual: boolean = isHotCity('  ');
      logInfo(`isHotCity(name="  "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0021 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0022
     * @tc.name      CitySearch_IsHotCity_0022
     * @tc.desc      isHotCity(name=" _1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_IsHotCity_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHotCity_0022 begin`);
      const actual: boolean = isHotCity(' _1');
      logInfo(`isHotCity(name=" _1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0022 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0023
     * @tc.name      CitySearch_IsHotCity_0023
     * @tc.desc      isHotCity(name="x ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_IsHotCity_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHotCity_0023 begin`);
      const actual: boolean = isHotCity('x ');
      logInfo(`isHotCity(name="x "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0023 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0024
     * @tc.name      CitySearch_IsHotCity_0024
     * @tc.desc      isHotCity(name=" A ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_IsHotCity_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHotCity_0024 begin`);
      const actual: boolean = isHotCity(' A ');
      logInfo(`isHotCity(name=" A "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0024 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0025
     * @tc.name      CitySearch_IsHotCity_0025
     * @tc.desc      isHotCity(name="AA") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_IsHotCity_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHotCity_0025 begin`);
      const actual: boolean = isHotCity('AA');
      logInfo(`isHotCity(name="AA"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0025 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0026
     * @tc.name      CitySearch_IsHotCity_0026
     * @tc.desc      isHotCity(name="A_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_IsHotCity_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHotCity_0026 begin`);
      const actual: boolean = isHotCity('A_1');
      logInfo(`isHotCity(name="A_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0026 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0027
     * @tc.name      CitySearch_IsHotCity_0027
     * @tc.desc      isHotCity(name="xA") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_IsHotCity_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHotCity_0027 begin`);
      const actual: boolean = isHotCity('xA');
      logInfo(`isHotCity(name="xA"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0027 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0028
     * @tc.name      CitySearch_IsHotCity_0028
     * @tc.desc      isHotCity(name=" Sample Title 123 ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CitySearch_IsHotCity_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHotCity_0028 begin`);
      const actual: boolean = isHotCity(' Sample Title 123 ');
      logInfo(`isHotCity(name=" Sample Title 123 "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0028 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0029
     * @tc.name      CitySearch_IsHotCity_0029
     * @tc.desc      isHotCity(name="Sample Title 123Sample Title 123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_IsHotCity_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHotCity_0029 begin`);
      const actual: boolean = isHotCity('Sample Title 123Sample Title 123');
      logInfo(`isHotCity(name="Sample Title 123Sample Ti...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0029 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_IS_HOT_CITY_0030
     * @tc.name      CitySearch_IsHotCity_0030
     * @tc.desc      isHotCity(name="Sample Title 123_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_IsHotCity_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHotCity_0030 begin`);
      const actual: boolean = isHotCity('Sample Title 123_1');
      logInfo(`isHotCity(name="Sample Title 123_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHotCity_0030 end`);
    });
  });
}
