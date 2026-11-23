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
import { isHeatCity } from '../model/CityPickerLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Location]';
const BUNDLE: string = 'Location_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isHeatCity (30 cases). */
export default function isHeatCityTest(): void {
  describe('IsHeatCityTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0001
     * @tc.name      Location_IsHeatCity_0001
     * @tc.desc      isHeatCity(name="Hello") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_IsHeatCity_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsHeatCity_0001 begin`);
      const actual: boolean = isHeatCity('Hello');
      logInfo(`isHeatCity(name="Hello"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0001 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0002
     * @tc.name      Location_IsHeatCity_0002
     * @tc.desc      isHeatCity(name="hello world") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_IsHeatCity_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsHeatCity_0002 begin`);
      const actual: boolean = isHeatCity('hello world');
      logInfo(`isHeatCity(name="hello world"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0002 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0003
     * @tc.name      Location_IsHeatCity_0003
     * @tc.desc      isHeatCity(name="") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_IsHeatCity_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHeatCity_0003 begin`);
      const actual: boolean = isHeatCity('');
      logInfo(`isHeatCity(name=""): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0003 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0004
     * @tc.name      Location_IsHeatCity_0004
     * @tc.desc      isHeatCity(name=" ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IsHeatCity_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeatCity_0004 begin`);
      const actual: boolean = isHeatCity(' ');
      logInfo(`isHeatCity(name=" "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0004 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0005
     * @tc.name      Location_IsHeatCity_0005
     * @tc.desc      isHeatCity(name="A") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IsHeatCity_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeatCity_0005 begin`);
      const actual: boolean = isHeatCity('A');
      logInfo(`isHeatCity(name="A"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0005 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0006
     * @tc.name      Location_IsHeatCity_0006
     * @tc.desc      isHeatCity(name="Sample Title 123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IsHeatCity_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeatCity_0006 begin`);
      const actual: boolean = isHeatCity('Sample Title 123');
      logInfo(`isHeatCity(name="Sample Title 123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0006 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0007
     * @tc.name      Location_IsHeatCity_0007
     * @tc.desc      isHeatCity(name="??") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IsHeatCity_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeatCity_0007 begin`);
      const actual: boolean = isHeatCity('\u4e2d\u6587');
      logInfo(`isHeatCity(name="??"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0007 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0008
     * @tc.name      Location_IsHeatCity_0008
     * @tc.desc      isHeatCity(name="a") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IsHeatCity_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeatCity_0008 begin`);
      const actual: boolean = isHeatCity('a');
      logInfo(`isHeatCity(name="a"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0008 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0009
     * @tc.name      Location_IsHeatCity_0009
     * @tc.desc      isHeatCity(name="abc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IsHeatCity_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeatCity_0009 begin`);
      const actual: boolean = isHeatCity('abc');
      logInfo(`isHeatCity(name="abc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0009 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0010
     * @tc.name      Location_IsHeatCity_0010
     * @tc.desc      isHeatCity(name="Hello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IsHeatCity_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeatCity_0010 begin`);
      const actual: boolean = isHeatCity('Hello World');
      logInfo(`isHeatCity(name="Hello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0010 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0011
     * @tc.name      Location_IsHeatCity_0011
     * @tc.desc      isHeatCity(name="123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IsHeatCity_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeatCity_0011 begin`);
      const actual: boolean = isHeatCity('123');
      logInfo(`isHeatCity(name="123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0011 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0012
     * @tc.name      Location_IsHeatCity_0012
     * @tc.desc      isHeatCity(name=" Hello ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_IsHeatCity_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHeatCity_0012 begin`);
      const actual: boolean = isHeatCity(' Hello ');
      logInfo(`isHeatCity(name=" Hello "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0012 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0013
     * @tc.name      Location_IsHeatCity_0013
     * @tc.desc      isHeatCity(name="HelloHello") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IsHeatCity_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeatCity_0013 begin`);
      const actual: boolean = isHeatCity('HelloHello');
      logInfo(`isHeatCity(name="HelloHello"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0013 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0014
     * @tc.name      Location_IsHeatCity_0014
     * @tc.desc      isHeatCity(name="Hello_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IsHeatCity_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeatCity_0014 begin`);
      const actual: boolean = isHeatCity('Hello_1');
      logInfo(`isHeatCity(name="Hello_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0014 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0015
     * @tc.name      Location_IsHeatCity_0015
     * @tc.desc      isHeatCity(name="xHello") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_IsHeatCity_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHeatCity_0015 begin`);
      const actual: boolean = isHeatCity('xHello');
      logInfo(`isHeatCity(name="xHello"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0015 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0016
     * @tc.name      Location_IsHeatCity_0016
     * @tc.desc      isHeatCity(name=" hello world ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_IsHeatCity_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHeatCity_0016 begin`);
      const actual: boolean = isHeatCity(' hello world ');
      logInfo(`isHeatCity(name=" hello world "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0016 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0017
     * @tc.name      Location_IsHeatCity_0017
     * @tc.desc      isHeatCity(name="hello worldhello world") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IsHeatCity_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeatCity_0017 begin`);
      const actual: boolean = isHeatCity('hello worldhello world');
      logInfo(`isHeatCity(name="hello worldhello world"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0017 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0018
     * @tc.name      Location_IsHeatCity_0018
     * @tc.desc      isHeatCity(name="hello world_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IsHeatCity_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeatCity_0018 begin`);
      const actual: boolean = isHeatCity('hello world_1');
      logInfo(`isHeatCity(name="hello world_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0018 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0019
     * @tc.name      Location_IsHeatCity_0019
     * @tc.desc      isHeatCity(name="xhello world") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_IsHeatCity_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHeatCity_0019 begin`);
      const actual: boolean = isHeatCity('xhello world');
      logInfo(`isHeatCity(name="xhello world"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0019 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0020
     * @tc.name      Location_IsHeatCity_0020
     * @tc.desc      isHeatCity(name="   ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_IsHeatCity_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHeatCity_0020 begin`);
      const actual: boolean = isHeatCity('   ');
      logInfo(`isHeatCity(name="   "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0020 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0021
     * @tc.name      Location_IsHeatCity_0021
     * @tc.desc      isHeatCity(name="  ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IsHeatCity_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeatCity_0021 begin`);
      const actual: boolean = isHeatCity('  ');
      logInfo(`isHeatCity(name="  "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0021 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0022
     * @tc.name      Location_IsHeatCity_0022
     * @tc.desc      isHeatCity(name=" _1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IsHeatCity_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeatCity_0022 begin`);
      const actual: boolean = isHeatCity(' _1');
      logInfo(`isHeatCity(name=" _1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0022 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0023
     * @tc.name      Location_IsHeatCity_0023
     * @tc.desc      isHeatCity(name="x ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_IsHeatCity_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHeatCity_0023 begin`);
      const actual: boolean = isHeatCity('x ');
      logInfo(`isHeatCity(name="x "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0023 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0024
     * @tc.name      Location_IsHeatCity_0024
     * @tc.desc      isHeatCity(name=" A ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_IsHeatCity_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHeatCity_0024 begin`);
      const actual: boolean = isHeatCity(' A ');
      logInfo(`isHeatCity(name=" A "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0024 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0025
     * @tc.name      Location_IsHeatCity_0025
     * @tc.desc      isHeatCity(name="AA") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IsHeatCity_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeatCity_0025 begin`);
      const actual: boolean = isHeatCity('AA');
      logInfo(`isHeatCity(name="AA"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0025 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0026
     * @tc.name      Location_IsHeatCity_0026
     * @tc.desc      isHeatCity(name="A_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IsHeatCity_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeatCity_0026 begin`);
      const actual: boolean = isHeatCity('A_1');
      logInfo(`isHeatCity(name="A_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0026 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0027
     * @tc.name      Location_IsHeatCity_0027
     * @tc.desc      isHeatCity(name="xA") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_IsHeatCity_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHeatCity_0027 begin`);
      const actual: boolean = isHeatCity('xA');
      logInfo(`isHeatCity(name="xA"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0027 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0028
     * @tc.name      Location_IsHeatCity_0028
     * @tc.desc      isHeatCity(name=" Sample Title 123 ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_IsHeatCity_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsHeatCity_0028 begin`);
      const actual: boolean = isHeatCity(' Sample Title 123 ');
      logInfo(`isHeatCity(name=" Sample Title 123 "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0028 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0029
     * @tc.name      Location_IsHeatCity_0029
     * @tc.desc      isHeatCity(name="Sample Title 123Sample Title 123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IsHeatCity_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeatCity_0029 begin`);
      const actual: boolean = isHeatCity('Sample Title 123Sample Title 123');
      logInfo(`isHeatCity(name="Sample Title 123Sample T...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0029 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_IS_HEAT_CITY_0030
     * @tc.name      Location_IsHeatCity_0030
     * @tc.desc      isHeatCity(name="Sample Title 123_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_IsHeatCity_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsHeatCity_0030 begin`);
      const actual: boolean = isHeatCity('Sample Title 123_1');
      logInfo(`isHeatCity(name="Sample Title 123_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsHeatCity_0030 end`);
    });
  });
}
