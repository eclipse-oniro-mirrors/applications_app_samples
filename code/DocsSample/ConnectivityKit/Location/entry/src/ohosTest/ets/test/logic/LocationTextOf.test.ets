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
import { locationTextOf } from '../model/CityPickerLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Location]';
const BUNDLE: string = 'Location_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for locationTextOf (96 cases). */
export default function locationTextOfTest(): void {
  describe('LocationTextOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0001
     * @tc.name      Location_LocationTextOf_0001
     * @tc.desc      locationTextOf(currentLocation="", city="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_LocationTextOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LocationTextOf_0001 begin`);
      const actual: string = locationTextOf('', '');
      logInfo(`locationTextOf(currentLocation="", city=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}LocationTextOf_0001 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0002
     * @tc.name      Location_LocationTextOf_0002
     * @tc.desc      locationTextOf(currentLocation="", city="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_LocationTextOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}LocationTextOf_0002 begin`);
      const actual: string = locationTextOf('', 'x');
      logInfo(`locationTextOf(currentLocation="", city="x"): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0002 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0003
     * @tc.name      Location_LocationTextOf_0003
     * @tc.desc      locationTextOf(currentLocation="", city="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0003 begin`);
      const actual: string = locationTextOf('', 'a');
      logInfo(`locationTextOf(currentLocation="", city="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0003 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0004
     * @tc.name      Location_LocationTextOf_0004
     * @tc.desc      locationTextOf(currentLocation="", city="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0004 begin`);
      const actual: string = locationTextOf('', 'abc');
      logInfo(`locationTextOf(currentLocation="", city="...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0004 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0005
     * @tc.name      Location_LocationTextOf_0005
     * @tc.desc      locationTextOf(currentLocation="", city="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0005 begin`);
      const actual: string = locationTextOf('', 'Hello World');
      logInfo(`locationTextOf(currentLocation="", city="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}LocationTextOf_0005 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0006
     * @tc.name      Location_LocationTextOf_0006
     * @tc.desc      locationTextOf(currentLocation="", city=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0006 begin`);
      const actual: string = locationTextOf('', ' ');
      logInfo(`locationTextOf(currentLocation="", city=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}LocationTextOf_0006 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0007
     * @tc.name      Location_LocationTextOf_0007
     * @tc.desc      locationTextOf(currentLocation="", city="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0007 begin`);
      const actual: string = locationTextOf('', '123');
      logInfo(`locationTextOf(currentLocation="", city="...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}LocationTextOf_0007 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0008
     * @tc.name      Location_LocationTextOf_0008
     * @tc.desc      locationTextOf(currentLocation="", city=" x ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0008 begin`);
      const actual: string = locationTextOf('', ' x ');
      logInfo(`locationTextOf(currentLocation="", city="...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}LocationTextOf_0008 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0009
     * @tc.name      Location_LocationTextOf_0009
     * @tc.desc      locationTextOf(currentLocation="", city="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0009 begin`);
      const actual: string = locationTextOf('', 'xx');
      logInfo(`locationTextOf(currentLocation="", city="...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0009 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0010
     * @tc.name      Location_LocationTextOf_0010
     * @tc.desc      locationTextOf(currentLocation="", city="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0010 begin`);
      const actual: string = locationTextOf('', 'x_1');
      logInfo(`locationTextOf(currentLocation="", city="...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0010 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0011
     * @tc.name      Location_LocationTextOf_0011
     * @tc.desc      locationTextOf(currentLocation="", city=" a ") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0011 begin`);
      const actual: string = locationTextOf('', ' a ');
      logInfo(`locationTextOf(currentLocation="", city="...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0011 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0012
     * @tc.name      Location_LocationTextOf_0012
     * @tc.desc      locationTextOf(currentLocation="", city="aa") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0012 begin`);
      const actual: string = locationTextOf('', 'aa');
      logInfo(`locationTextOf(currentLocation="", city="...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0012 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0013
     * @tc.name      Location_LocationTextOf_0013
     * @tc.desc      locationTextOf(currentLocation="", city="a_1") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0013 begin`);
      const actual: string = locationTextOf('', 'a_1');
      logInfo(`locationTextOf(currentLocation="", city="...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0013 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0014
     * @tc.name      Location_LocationTextOf_0014
     * @tc.desc      locationTextOf(currentLocation="", city="xa") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0014 begin`);
      const actual: string = locationTextOf('', 'xa');
      logInfo(`locationTextOf(currentLocation="", city="...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocationTextOf_0014 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0015
     * @tc.name      Location_LocationTextOf_0015
     * @tc.desc      locationTextOf(currentLocation="", city=" abc ") returns " abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0015 begin`);
      const actual: string = locationTextOf('', ' abc ');
      logInfo(`locationTextOf(currentLocation="", city="...: actual=${actual}`);
      expect(actual).assertEqual(' abc ');
      logInfo(`${BUNDLE}LocationTextOf_0015 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0016
     * @tc.name      Location_LocationTextOf_0016
     * @tc.desc      locationTextOf(currentLocation="", city="abcabc") returns "abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0016 begin`);
      const actual: string = locationTextOf('', 'abcabc');
      logInfo(`locationTextOf(currentLocation="", city="...: actual=${actual}`);
      expect(actual).assertEqual('abcabc');
      logInfo(`${BUNDLE}LocationTextOf_0016 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0017
     * @tc.name      Location_LocationTextOf_0017
     * @tc.desc      locationTextOf(currentLocation="", city="abc_1") returns "abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0017 begin`);
      const actual: string = locationTextOf('', 'abc_1');
      logInfo(`locationTextOf(currentLocation="", city="...: actual=${actual}`);
      expect(actual).assertEqual('abc_1');
      logInfo(`${BUNDLE}LocationTextOf_0017 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0018
     * @tc.name      Location_LocationTextOf_0018
     * @tc.desc      locationTextOf(currentLocation="", city="xabc") returns "xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0018 begin`);
      const actual: string = locationTextOf('', 'xabc');
      logInfo(`locationTextOf(currentLocation="", city="...: actual=${actual}`);
      expect(actual).assertEqual('xabc');
      logInfo(`${BUNDLE}LocationTextOf_0018 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0019
     * @tc.name      Location_LocationTextOf_0019
     * @tc.desc      locationTextOf(currentLocation="", city=" Hello World ") returns " Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0019 begin`);
      const actual: string = locationTextOf('', ' Hello World ');
      logInfo(`locationTextOf(currentLocation="", city="...: actual=${actual}`);
      expect(actual).assertEqual(' Hello World ');
      logInfo(`${BUNDLE}LocationTextOf_0019 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0020
     * @tc.name      Location_LocationTextOf_0020
     * @tc.desc      locationTextOf(currentLocation="", city="Hello WorldHello World") returns "Hello WorldHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0020 begin`);
      const actual: string = locationTextOf('', 'Hello WorldHello World');
      logInfo(`locationTextOf(currentLocation="", city="...: actual=${actual}`);
      expect(actual).assertEqual('Hello WorldHello World');
      logInfo(`${BUNDLE}LocationTextOf_0020 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0021
     * @tc.name      Location_LocationTextOf_0021
     * @tc.desc      locationTextOf(currentLocation="", city="Hello World_1") returns "Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0021 begin`);
      const actual: string = locationTextOf('', 'Hello World_1');
      logInfo(`locationTextOf(currentLocation="", city="...: actual=${actual}`);
      expect(actual).assertEqual('Hello World_1');
      logInfo(`${BUNDLE}LocationTextOf_0021 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0022
     * @tc.name      Location_LocationTextOf_0022
     * @tc.desc      locationTextOf(currentLocation="", city="xHello World") returns "xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0022 begin`);
      const actual: string = locationTextOf('', 'xHello World');
      logInfo(`locationTextOf(currentLocation="", city="...: actual=${actual}`);
      expect(actual).assertEqual('xHello World');
      logInfo(`${BUNDLE}LocationTextOf_0022 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0023
     * @tc.name      Location_LocationTextOf_0023
     * @tc.desc      locationTextOf(currentLocation="", city="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0023 begin`);
      const actual: string = locationTextOf('', '   ');
      logInfo(`locationTextOf(currentLocation="", city="...: actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}LocationTextOf_0023 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0024
     * @tc.name      Location_LocationTextOf_0024
     * @tc.desc      locationTextOf(currentLocation="", city="  ") returns "  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0024 begin`);
      const actual: string = locationTextOf('', '  ');
      logInfo(`locationTextOf(currentLocation="", city="...: actual=${actual}`);
      expect(actual).assertEqual('  ');
      logInfo(`${BUNDLE}LocationTextOf_0024 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0025
     * @tc.name      Location_LocationTextOf_0025
     * @tc.desc      locationTextOf(currentLocation="x", city="") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0025 begin`);
      const actual: string = locationTextOf('x', '');
      logInfo(`locationTextOf(currentLocation="x", city=""): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0025 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0026
     * @tc.name      Location_LocationTextOf_0026
     * @tc.desc      locationTextOf(currentLocation="x", city="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0026 begin`);
      const actual: string = locationTextOf('x', 'x');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0026 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0027
     * @tc.name      Location_LocationTextOf_0027
     * @tc.desc      locationTextOf(currentLocation="x", city="a") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0027 begin`);
      const actual: string = locationTextOf('x', 'a');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0027 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0028
     * @tc.name      Location_LocationTextOf_0028
     * @tc.desc      locationTextOf(currentLocation="x", city="abc") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0028 begin`);
      const actual: string = locationTextOf('x', 'abc');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0028 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0029
     * @tc.name      Location_LocationTextOf_0029
     * @tc.desc      locationTextOf(currentLocation="x", city="Hello World") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0029 begin`);
      const actual: string = locationTextOf('x', 'Hello World');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0029 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0030
     * @tc.name      Location_LocationTextOf_0030
     * @tc.desc      locationTextOf(currentLocation="x", city=" ") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0030 begin`);
      const actual: string = locationTextOf('x', ' ');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0030 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0031
     * @tc.name      Location_LocationTextOf_0031
     * @tc.desc      locationTextOf(currentLocation="x", city="123") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0031 begin`);
      const actual: string = locationTextOf('x', '123');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0031 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0032
     * @tc.name      Location_LocationTextOf_0032
     * @tc.desc      locationTextOf(currentLocation="x", city=" x ") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0032 begin`);
      const actual: string = locationTextOf('x', ' x ');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0032 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0033
     * @tc.name      Location_LocationTextOf_0033
     * @tc.desc      locationTextOf(currentLocation="x", city="xx") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0033 begin`);
      const actual: string = locationTextOf('x', 'xx');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0033 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0034
     * @tc.name      Location_LocationTextOf_0034
     * @tc.desc      locationTextOf(currentLocation="x", city="x_1") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0034 begin`);
      const actual: string = locationTextOf('x', 'x_1');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0034 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0035
     * @tc.name      Location_LocationTextOf_0035
     * @tc.desc      locationTextOf(currentLocation="x", city=" a ") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0035 begin`);
      const actual: string = locationTextOf('x', ' a ');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0035 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0036
     * @tc.name      Location_LocationTextOf_0036
     * @tc.desc      locationTextOf(currentLocation="x", city="aa") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0036 begin`);
      const actual: string = locationTextOf('x', 'aa');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0036 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0037
     * @tc.name      Location_LocationTextOf_0037
     * @tc.desc      locationTextOf(currentLocation="x", city="a_1") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0037 begin`);
      const actual: string = locationTextOf('x', 'a_1');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0037 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0038
     * @tc.name      Location_LocationTextOf_0038
     * @tc.desc      locationTextOf(currentLocation="x", city="xa") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0038 begin`);
      const actual: string = locationTextOf('x', 'xa');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0038 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0039
     * @tc.name      Location_LocationTextOf_0039
     * @tc.desc      locationTextOf(currentLocation="x", city=" abc ") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0039 begin`);
      const actual: string = locationTextOf('x', ' abc ');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0039 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0040
     * @tc.name      Location_LocationTextOf_0040
     * @tc.desc      locationTextOf(currentLocation="x", city="abcabc") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0040 begin`);
      const actual: string = locationTextOf('x', 'abcabc');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0040 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0041
     * @tc.name      Location_LocationTextOf_0041
     * @tc.desc      locationTextOf(currentLocation="x", city="abc_1") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0041 begin`);
      const actual: string = locationTextOf('x', 'abc_1');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0041 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0042
     * @tc.name      Location_LocationTextOf_0042
     * @tc.desc      locationTextOf(currentLocation="x", city="xabc") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0042 begin`);
      const actual: string = locationTextOf('x', 'xabc');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0042 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0043
     * @tc.name      Location_LocationTextOf_0043
     * @tc.desc      locationTextOf(currentLocation="x", city=" Hello World ") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0043 begin`);
      const actual: string = locationTextOf('x', ' Hello World ');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0043 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0044
     * @tc.name      Location_LocationTextOf_0044
     * @tc.desc      locationTextOf(currentLocation="x", city="Hello WorldHello World") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0044 begin`);
      const actual: string = locationTextOf('x', 'Hello WorldHello World');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0044 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0045
     * @tc.name      Location_LocationTextOf_0045
     * @tc.desc      locationTextOf(currentLocation="x", city="Hello World_1") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0045 begin`);
      const actual: string = locationTextOf('x', 'Hello World_1');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0045 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0046
     * @tc.name      Location_LocationTextOf_0046
     * @tc.desc      locationTextOf(currentLocation="x", city="xHello World") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0046 begin`);
      const actual: string = locationTextOf('x', 'xHello World');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0046 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0047
     * @tc.name      Location_LocationTextOf_0047
     * @tc.desc      locationTextOf(currentLocation="x", city="   ") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0047 begin`);
      const actual: string = locationTextOf('x', '   ');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0047 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0048
     * @tc.name      Location_LocationTextOf_0048
     * @tc.desc      locationTextOf(currentLocation="x", city="  ") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0048 begin`);
      const actual: string = locationTextOf('x', '  ');
      logInfo(`locationTextOf(currentLocation="x", city=...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}LocationTextOf_0048 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0049
     * @tc.name      Location_LocationTextOf_0049
     * @tc.desc      locationTextOf(currentLocation="a", city="") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0049 begin`);
      const actual: string = locationTextOf('a', '');
      logInfo(`locationTextOf(currentLocation="a", city=""): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0049 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0050
     * @tc.name      Location_LocationTextOf_0050
     * @tc.desc      locationTextOf(currentLocation="a", city="x") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0050 begin`);
      const actual: string = locationTextOf('a', 'x');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0050 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0051
     * @tc.name      Location_LocationTextOf_0051
     * @tc.desc      locationTextOf(currentLocation="a", city="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0051 begin`);
      const actual: string = locationTextOf('a', 'a');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0051 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0052
     * @tc.name      Location_LocationTextOf_0052
     * @tc.desc      locationTextOf(currentLocation="a", city="abc") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0052 begin`);
      const actual: string = locationTextOf('a', 'abc');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0052 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0053
     * @tc.name      Location_LocationTextOf_0053
     * @tc.desc      locationTextOf(currentLocation="a", city="Hello World") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0053 begin`);
      const actual: string = locationTextOf('a', 'Hello World');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0053 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0054
     * @tc.name      Location_LocationTextOf_0054
     * @tc.desc      locationTextOf(currentLocation="a", city=" ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0054 begin`);
      const actual: string = locationTextOf('a', ' ');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0054 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0055
     * @tc.name      Location_LocationTextOf_0055
     * @tc.desc      locationTextOf(currentLocation="a", city="123") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0055 begin`);
      const actual: string = locationTextOf('a', '123');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0055 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0056
     * @tc.name      Location_LocationTextOf_0056
     * @tc.desc      locationTextOf(currentLocation="a", city=" x ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0056 begin`);
      const actual: string = locationTextOf('a', ' x ');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0056 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0057
     * @tc.name      Location_LocationTextOf_0057
     * @tc.desc      locationTextOf(currentLocation="a", city="xx") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0057 begin`);
      const actual: string = locationTextOf('a', 'xx');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0057 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0058
     * @tc.name      Location_LocationTextOf_0058
     * @tc.desc      locationTextOf(currentLocation="a", city="x_1") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0058 begin`);
      const actual: string = locationTextOf('a', 'x_1');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0058 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0059
     * @tc.name      Location_LocationTextOf_0059
     * @tc.desc      locationTextOf(currentLocation="a", city=" a ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0059 begin`);
      const actual: string = locationTextOf('a', ' a ');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0059 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0060
     * @tc.name      Location_LocationTextOf_0060
     * @tc.desc      locationTextOf(currentLocation="a", city="aa") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0060 begin`);
      const actual: string = locationTextOf('a', 'aa');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0060 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0061
     * @tc.name      Location_LocationTextOf_0061
     * @tc.desc      locationTextOf(currentLocation="a", city="a_1") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0061 begin`);
      const actual: string = locationTextOf('a', 'a_1');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0061 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0062
     * @tc.name      Location_LocationTextOf_0062
     * @tc.desc      locationTextOf(currentLocation="a", city="xa") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0062 begin`);
      const actual: string = locationTextOf('a', 'xa');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0062 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0063
     * @tc.name      Location_LocationTextOf_0063
     * @tc.desc      locationTextOf(currentLocation="a", city=" abc ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0063 begin`);
      const actual: string = locationTextOf('a', ' abc ');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0063 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0064
     * @tc.name      Location_LocationTextOf_0064
     * @tc.desc      locationTextOf(currentLocation="a", city="abcabc") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0064 begin`);
      const actual: string = locationTextOf('a', 'abcabc');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0064 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0065
     * @tc.name      Location_LocationTextOf_0065
     * @tc.desc      locationTextOf(currentLocation="a", city="abc_1") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0065 begin`);
      const actual: string = locationTextOf('a', 'abc_1');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0065 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0066
     * @tc.name      Location_LocationTextOf_0066
     * @tc.desc      locationTextOf(currentLocation="a", city="xabc") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0066 begin`);
      const actual: string = locationTextOf('a', 'xabc');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0066 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0067
     * @tc.name      Location_LocationTextOf_0067
     * @tc.desc      locationTextOf(currentLocation="a", city=" Hello World ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0067 begin`);
      const actual: string = locationTextOf('a', ' Hello World ');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0067 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0068
     * @tc.name      Location_LocationTextOf_0068
     * @tc.desc      locationTextOf(currentLocation="a", city="Hello WorldHello World") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0068 begin`);
      const actual: string = locationTextOf('a', 'Hello WorldHello World');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0068 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0069
     * @tc.name      Location_LocationTextOf_0069
     * @tc.desc      locationTextOf(currentLocation="a", city="Hello World_1") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0069 begin`);
      const actual: string = locationTextOf('a', 'Hello World_1');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0069 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0070
     * @tc.name      Location_LocationTextOf_0070
     * @tc.desc      locationTextOf(currentLocation="a", city="xHello World") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0070 begin`);
      const actual: string = locationTextOf('a', 'xHello World');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0070 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0071
     * @tc.name      Location_LocationTextOf_0071
     * @tc.desc      locationTextOf(currentLocation="a", city="   ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0071 begin`);
      const actual: string = locationTextOf('a', '   ');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0071 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0072
     * @tc.name      Location_LocationTextOf_0072
     * @tc.desc      locationTextOf(currentLocation="a", city="  ") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0072 begin`);
      const actual: string = locationTextOf('a', '  ');
      logInfo(`locationTextOf(currentLocation="a", city=...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}LocationTextOf_0072 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0073
     * @tc.name      Location_LocationTextOf_0073
     * @tc.desc      locationTextOf(currentLocation="abc", city="") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0073 begin`);
      const actual: string = locationTextOf('abc', '');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0073 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0074
     * @tc.name      Location_LocationTextOf_0074
     * @tc.desc      locationTextOf(currentLocation="abc", city="x") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0074 begin`);
      const actual: string = locationTextOf('abc', 'x');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0074 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0075
     * @tc.name      Location_LocationTextOf_0075
     * @tc.desc      locationTextOf(currentLocation="abc", city="a") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0075 begin`);
      const actual: string = locationTextOf('abc', 'a');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0075 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0076
     * @tc.name      Location_LocationTextOf_0076
     * @tc.desc      locationTextOf(currentLocation="abc", city="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0076 begin`);
      const actual: string = locationTextOf('abc', 'abc');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0076 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0077
     * @tc.name      Location_LocationTextOf_0077
     * @tc.desc      locationTextOf(currentLocation="abc", city="Hello World") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0077 begin`);
      const actual: string = locationTextOf('abc', 'Hello World');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0077 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0078
     * @tc.name      Location_LocationTextOf_0078
     * @tc.desc      locationTextOf(currentLocation="abc", city=" ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0078 begin`);
      const actual: string = locationTextOf('abc', ' ');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0078 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0079
     * @tc.name      Location_LocationTextOf_0079
     * @tc.desc      locationTextOf(currentLocation="abc", city="123") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0079 begin`);
      const actual: string = locationTextOf('abc', '123');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0079 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0080
     * @tc.name      Location_LocationTextOf_0080
     * @tc.desc      locationTextOf(currentLocation="abc", city=" x ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0080 begin`);
      const actual: string = locationTextOf('abc', ' x ');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0080 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0081
     * @tc.name      Location_LocationTextOf_0081
     * @tc.desc      locationTextOf(currentLocation="abc", city="xx") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0081 begin`);
      const actual: string = locationTextOf('abc', 'xx');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0081 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0082
     * @tc.name      Location_LocationTextOf_0082
     * @tc.desc      locationTextOf(currentLocation="abc", city="x_1") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0082 begin`);
      const actual: string = locationTextOf('abc', 'x_1');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0082 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0083
     * @tc.name      Location_LocationTextOf_0083
     * @tc.desc      locationTextOf(currentLocation="abc", city=" a ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0083 begin`);
      const actual: string = locationTextOf('abc', ' a ');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0083 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0084
     * @tc.name      Location_LocationTextOf_0084
     * @tc.desc      locationTextOf(currentLocation="abc", city="aa") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0084 begin`);
      const actual: string = locationTextOf('abc', 'aa');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0084 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0085
     * @tc.name      Location_LocationTextOf_0085
     * @tc.desc      locationTextOf(currentLocation="abc", city="a_1") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0085 begin`);
      const actual: string = locationTextOf('abc', 'a_1');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0085 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0086
     * @tc.name      Location_LocationTextOf_0086
     * @tc.desc      locationTextOf(currentLocation="abc", city="xa") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0086 begin`);
      const actual: string = locationTextOf('abc', 'xa');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0086 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0087
     * @tc.name      Location_LocationTextOf_0087
     * @tc.desc      locationTextOf(currentLocation="abc", city=" abc ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0087 begin`);
      const actual: string = locationTextOf('abc', ' abc ');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0087 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0088
     * @tc.name      Location_LocationTextOf_0088
     * @tc.desc      locationTextOf(currentLocation="abc", city="abcabc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0088 begin`);
      const actual: string = locationTextOf('abc', 'abcabc');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0088 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0089
     * @tc.name      Location_LocationTextOf_0089
     * @tc.desc      locationTextOf(currentLocation="abc", city="abc_1") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0089 begin`);
      const actual: string = locationTextOf('abc', 'abc_1');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0089 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0090
     * @tc.name      Location_LocationTextOf_0090
     * @tc.desc      locationTextOf(currentLocation="abc", city="xabc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0090 begin`);
      const actual: string = locationTextOf('abc', 'xabc');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0090 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0091
     * @tc.name      Location_LocationTextOf_0091
     * @tc.desc      locationTextOf(currentLocation="abc", city=" Hello World ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0091 begin`);
      const actual: string = locationTextOf('abc', ' Hello World ');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0091 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0092
     * @tc.name      Location_LocationTextOf_0092
     * @tc.desc      locationTextOf(currentLocation="abc", city="Hello WorldHello World") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0092 begin`);
      const actual: string = locationTextOf('abc', 'Hello WorldHello World');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0092 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0093
     * @tc.name      Location_LocationTextOf_0093
     * @tc.desc      locationTextOf(currentLocation="abc", city="Hello World_1") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0093 begin`);
      const actual: string = locationTextOf('abc', 'Hello World_1');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0093 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0094
     * @tc.name      Location_LocationTextOf_0094
     * @tc.desc      locationTextOf(currentLocation="abc", city="xHello World") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0094 begin`);
      const actual: string = locationTextOf('abc', 'xHello World');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0094 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0095
     * @tc.name      Location_LocationTextOf_0095
     * @tc.desc      locationTextOf(currentLocation="abc", city="   ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0095 begin`);
      const actual: string = locationTextOf('abc', '   ');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0095 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0096
     * @tc.name      Location_LocationTextOf_0096
     * @tc.desc      locationTextOf(currentLocation="abc", city="  ") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0096 begin`);
      const actual: string = locationTextOf('abc', '  ');
      logInfo(`locationTextOf(currentLocation="abc", cit...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}LocationTextOf_0096 end`);
    });
  });
}
