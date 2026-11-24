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
import { toggleExpanded } from '../model/CityPickerLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Location]';
const BUNDLE: string = 'Location_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for toggleExpanded (96 cases). */
export default function toggleExpandedTest(): void {
  describe('ToggleExpandedTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0001
     * @tc.name      Location_ToggleExpanded_0001
     * @tc.desc      toggleExpanded(current="", name="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_ToggleExpanded_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0001 begin`);
      const actual: string = toggleExpanded('', '');
      logInfo(`toggleExpanded(current="", name=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0001 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0002
     * @tc.name      Location_ToggleExpanded_0002
     * @tc.desc      toggleExpanded(current="", name="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_ToggleExpanded_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0002 begin`);
      const actual: string = toggleExpanded('', 'x');
      logInfo(`toggleExpanded(current="", name="x"): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}ToggleExpanded_0002 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0003
     * @tc.name      Location_ToggleExpanded_0003
     * @tc.desc      toggleExpanded(current="", name="Hello") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0003 begin`);
      const actual: string = toggleExpanded('', 'Hello');
      logInfo(`toggleExpanded(current="", name="Hello"): actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}ToggleExpanded_0003 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0004
     * @tc.name      Location_ToggleExpanded_0004
     * @tc.desc      toggleExpanded(current="", name="hello world") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0004 begin`);
      const actual: string = toggleExpanded('', 'hello world');
      logInfo(`toggleExpanded(current="", name="hello wo...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}ToggleExpanded_0004 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0005
     * @tc.name      Location_ToggleExpanded_0005
     * @tc.desc      toggleExpanded(current="", name=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0005 begin`);
      const actual: string = toggleExpanded('', ' ');
      logInfo(`toggleExpanded(current="", name=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}ToggleExpanded_0005 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0006
     * @tc.name      Location_ToggleExpanded_0006
     * @tc.desc      toggleExpanded(current="", name="A") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0006 begin`);
      const actual: string = toggleExpanded('', 'A');
      logInfo(`toggleExpanded(current="", name="A"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}ToggleExpanded_0006 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0007
     * @tc.name      Location_ToggleExpanded_0007
     * @tc.desc      toggleExpanded(current="", name="Sample Title 123") returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0007 begin`);
      const actual: string = toggleExpanded('', 'Sample Title 123');
      logInfo(`toggleExpanded(current="", name="Sample T...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}ToggleExpanded_0007 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0008
     * @tc.name      Location_ToggleExpanded_0008
     * @tc.desc      toggleExpanded(current="", name="??") returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0008 begin`);
      const actual: string = toggleExpanded('', '\u4e2d\u6587');
      logInfo(`toggleExpanded(current="", name="??"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}ToggleExpanded_0008 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0009
     * @tc.name      Location_ToggleExpanded_0009
     * @tc.desc      toggleExpanded(current="", name="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0009 begin`);
      const actual: string = toggleExpanded('', 'a');
      logInfo(`toggleExpanded(current="", name="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}ToggleExpanded_0009 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0010
     * @tc.name      Location_ToggleExpanded_0010
     * @tc.desc      toggleExpanded(current="", name="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0010 begin`);
      const actual: string = toggleExpanded('', 'abc');
      logInfo(`toggleExpanded(current="", name="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}ToggleExpanded_0010 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0011
     * @tc.name      Location_ToggleExpanded_0011
     * @tc.desc      toggleExpanded(current="", name="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0011 begin`);
      const actual: string = toggleExpanded('', 'Hello World');
      logInfo(`toggleExpanded(current="", name="Hello Wo...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}ToggleExpanded_0011 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0012
     * @tc.name      Location_ToggleExpanded_0012
     * @tc.desc      toggleExpanded(current="", name="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0012 begin`);
      const actual: string = toggleExpanded('', '123');
      logInfo(`toggleExpanded(current="", name="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}ToggleExpanded_0012 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0013
     * @tc.name      Location_ToggleExpanded_0013
     * @tc.desc      toggleExpanded(current="", name=" x ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0013 begin`);
      const actual: string = toggleExpanded('', ' x ');
      logInfo(`toggleExpanded(current="", name=" x "): actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}ToggleExpanded_0013 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0014
     * @tc.name      Location_ToggleExpanded_0014
     * @tc.desc      toggleExpanded(current="", name="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0014 begin`);
      const actual: string = toggleExpanded('', 'xx');
      logInfo(`toggleExpanded(current="", name="xx"): actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}ToggleExpanded_0014 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0015
     * @tc.name      Location_ToggleExpanded_0015
     * @tc.desc      toggleExpanded(current="", name="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0015 begin`);
      const actual: string = toggleExpanded('', 'x_1');
      logInfo(`toggleExpanded(current="", name="x_1"): actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}ToggleExpanded_0015 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0016
     * @tc.name      Location_ToggleExpanded_0016
     * @tc.desc      toggleExpanded(current="", name=" Hello ") returns " Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0016 begin`);
      const actual: string = toggleExpanded('', ' Hello ');
      logInfo(`toggleExpanded(current="", name=" Hello "): actual=${actual}`);
      expect(actual).assertEqual(' Hello ');
      logInfo(`${BUNDLE}ToggleExpanded_0016 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0017
     * @tc.name      Location_ToggleExpanded_0017
     * @tc.desc      toggleExpanded(current="", name="HelloHello") returns "HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0017 begin`);
      const actual: string = toggleExpanded('', 'HelloHello');
      logInfo(`toggleExpanded(current="", name="HelloHel...: actual=${actual}`);
      expect(actual).assertEqual('HelloHello');
      logInfo(`${BUNDLE}ToggleExpanded_0017 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0018
     * @tc.name      Location_ToggleExpanded_0018
     * @tc.desc      toggleExpanded(current="", name="Hello_1") returns "Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0018 begin`);
      const actual: string = toggleExpanded('', 'Hello_1');
      logInfo(`toggleExpanded(current="", name="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('Hello_1');
      logInfo(`${BUNDLE}ToggleExpanded_0018 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0019
     * @tc.name      Location_ToggleExpanded_0019
     * @tc.desc      toggleExpanded(current="", name="xHello") returns "xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0019 begin`);
      const actual: string = toggleExpanded('', 'xHello');
      logInfo(`toggleExpanded(current="", name="xHello"): actual=${actual}`);
      expect(actual).assertEqual('xHello');
      logInfo(`${BUNDLE}ToggleExpanded_0019 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0020
     * @tc.name      Location_ToggleExpanded_0020
     * @tc.desc      toggleExpanded(current="", name=" hello world ") returns " hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0020 begin`);
      const actual: string = toggleExpanded('', ' hello world ');
      logInfo(`toggleExpanded(current="", name=" hello w...: actual=${actual}`);
      expect(actual).assertEqual(' hello world ');
      logInfo(`${BUNDLE}ToggleExpanded_0020 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0021
     * @tc.name      Location_ToggleExpanded_0021
     * @tc.desc      toggleExpanded(current="", name="hello worldhello world") returns "hello worldhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0021 begin`);
      const actual: string = toggleExpanded('', 'hello worldhello world');
      logInfo(`toggleExpanded(current="", name="hello wo...: actual=${actual}`);
      expect(actual).assertEqual('hello worldhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0021 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0022
     * @tc.name      Location_ToggleExpanded_0022
     * @tc.desc      toggleExpanded(current="", name="hello world_1") returns "hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0022 begin`);
      const actual: string = toggleExpanded('', 'hello world_1');
      logInfo(`toggleExpanded(current="", name="hello wo...: actual=${actual}`);
      expect(actual).assertEqual('hello world_1');
      logInfo(`${BUNDLE}ToggleExpanded_0022 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0023
     * @tc.name      Location_ToggleExpanded_0023
     * @tc.desc      toggleExpanded(current="", name="xhello world") returns "xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0023 begin`);
      const actual: string = toggleExpanded('', 'xhello world');
      logInfo(`toggleExpanded(current="", name="xhello w...: actual=${actual}`);
      expect(actual).assertEqual('xhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0023 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0024
     * @tc.name      Location_ToggleExpanded_0024
     * @tc.desc      toggleExpanded(current="", name="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0024 begin`);
      const actual: string = toggleExpanded('', '   ');
      logInfo(`toggleExpanded(current="", name="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}ToggleExpanded_0024 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0025
     * @tc.name      Location_ToggleExpanded_0025
     * @tc.desc      toggleExpanded(current="x", name="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0025 begin`);
      const actual: string = toggleExpanded('x', '');
      logInfo(`toggleExpanded(current="x", name=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0025 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0026
     * @tc.name      Location_ToggleExpanded_0026
     * @tc.desc      toggleExpanded(current="x", name="x") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0026 begin`);
      const actual: string = toggleExpanded('x', 'x');
      logInfo(`toggleExpanded(current="x", name="x"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0026 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0027
     * @tc.name      Location_ToggleExpanded_0027
     * @tc.desc      toggleExpanded(current="x", name="Hello") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0027 begin`);
      const actual: string = toggleExpanded('x', 'Hello');
      logInfo(`toggleExpanded(current="x", name="Hello"): actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}ToggleExpanded_0027 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0028
     * @tc.name      Location_ToggleExpanded_0028
     * @tc.desc      toggleExpanded(current="x", name="hello world") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0028 begin`);
      const actual: string = toggleExpanded('x', 'hello world');
      logInfo(`toggleExpanded(current="x", name="hello w...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}ToggleExpanded_0028 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0029
     * @tc.name      Location_ToggleExpanded_0029
     * @tc.desc      toggleExpanded(current="x", name=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0029 begin`);
      const actual: string = toggleExpanded('x', ' ');
      logInfo(`toggleExpanded(current="x", name=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}ToggleExpanded_0029 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0030
     * @tc.name      Location_ToggleExpanded_0030
     * @tc.desc      toggleExpanded(current="x", name="A") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0030 begin`);
      const actual: string = toggleExpanded('x', 'A');
      logInfo(`toggleExpanded(current="x", name="A"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}ToggleExpanded_0030 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0031
     * @tc.name      Location_ToggleExpanded_0031
     * @tc.desc      toggleExpanded(current="x", name="Sample Title 123") returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0031 begin`);
      const actual: string = toggleExpanded('x', 'Sample Title 123');
      logInfo(`toggleExpanded(current="x", name="Sample ...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}ToggleExpanded_0031 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0032
     * @tc.name      Location_ToggleExpanded_0032
     * @tc.desc      toggleExpanded(current="x", name="??") returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0032 begin`);
      const actual: string = toggleExpanded('x', '\u4e2d\u6587');
      logInfo(`toggleExpanded(current="x", name="??"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}ToggleExpanded_0032 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0033
     * @tc.name      Location_ToggleExpanded_0033
     * @tc.desc      toggleExpanded(current="x", name="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0033 begin`);
      const actual: string = toggleExpanded('x', 'a');
      logInfo(`toggleExpanded(current="x", name="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}ToggleExpanded_0033 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0034
     * @tc.name      Location_ToggleExpanded_0034
     * @tc.desc      toggleExpanded(current="x", name="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0034 begin`);
      const actual: string = toggleExpanded('x', 'abc');
      logInfo(`toggleExpanded(current="x", name="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}ToggleExpanded_0034 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0035
     * @tc.name      Location_ToggleExpanded_0035
     * @tc.desc      toggleExpanded(current="x", name="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0035 begin`);
      const actual: string = toggleExpanded('x', 'Hello World');
      logInfo(`toggleExpanded(current="x", name="Hello W...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}ToggleExpanded_0035 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0036
     * @tc.name      Location_ToggleExpanded_0036
     * @tc.desc      toggleExpanded(current="x", name="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0036 begin`);
      const actual: string = toggleExpanded('x', '123');
      logInfo(`toggleExpanded(current="x", name="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}ToggleExpanded_0036 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0037
     * @tc.name      Location_ToggleExpanded_0037
     * @tc.desc      toggleExpanded(current="x", name=" x ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0037 begin`);
      const actual: string = toggleExpanded('x', ' x ');
      logInfo(`toggleExpanded(current="x", name=" x "): actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}ToggleExpanded_0037 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0038
     * @tc.name      Location_ToggleExpanded_0038
     * @tc.desc      toggleExpanded(current="x", name="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0038 begin`);
      const actual: string = toggleExpanded('x', 'xx');
      logInfo(`toggleExpanded(current="x", name="xx"): actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}ToggleExpanded_0038 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0039
     * @tc.name      Location_ToggleExpanded_0039
     * @tc.desc      toggleExpanded(current="x", name="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0039 begin`);
      const actual: string = toggleExpanded('x', 'x_1');
      logInfo(`toggleExpanded(current="x", name="x_1"): actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}ToggleExpanded_0039 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0040
     * @tc.name      Location_ToggleExpanded_0040
     * @tc.desc      toggleExpanded(current="x", name=" Hello ") returns " Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0040 begin`);
      const actual: string = toggleExpanded('x', ' Hello ');
      logInfo(`toggleExpanded(current="x", name=" Hello "): actual=${actual}`);
      expect(actual).assertEqual(' Hello ');
      logInfo(`${BUNDLE}ToggleExpanded_0040 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0041
     * @tc.name      Location_ToggleExpanded_0041
     * @tc.desc      toggleExpanded(current="x", name="HelloHello") returns "HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0041 begin`);
      const actual: string = toggleExpanded('x', 'HelloHello');
      logInfo(`toggleExpanded(current="x", name="HelloHe...: actual=${actual}`);
      expect(actual).assertEqual('HelloHello');
      logInfo(`${BUNDLE}ToggleExpanded_0041 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0042
     * @tc.name      Location_ToggleExpanded_0042
     * @tc.desc      toggleExpanded(current="x", name="Hello_1") returns "Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0042 begin`);
      const actual: string = toggleExpanded('x', 'Hello_1');
      logInfo(`toggleExpanded(current="x", name="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('Hello_1');
      logInfo(`${BUNDLE}ToggleExpanded_0042 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0043
     * @tc.name      Location_ToggleExpanded_0043
     * @tc.desc      toggleExpanded(current="x", name="xHello") returns "xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0043 begin`);
      const actual: string = toggleExpanded('x', 'xHello');
      logInfo(`toggleExpanded(current="x", name="xHello"): actual=${actual}`);
      expect(actual).assertEqual('xHello');
      logInfo(`${BUNDLE}ToggleExpanded_0043 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0044
     * @tc.name      Location_ToggleExpanded_0044
     * @tc.desc      toggleExpanded(current="x", name=" hello world ") returns " hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0044 begin`);
      const actual: string = toggleExpanded('x', ' hello world ');
      logInfo(`toggleExpanded(current="x", name=" hello ...: actual=${actual}`);
      expect(actual).assertEqual(' hello world ');
      logInfo(`${BUNDLE}ToggleExpanded_0044 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0045
     * @tc.name      Location_ToggleExpanded_0045
     * @tc.desc      toggleExpanded(current="x", name="hello worldhello world") returns "hello worldhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0045 begin`);
      const actual: string = toggleExpanded('x', 'hello worldhello world');
      logInfo(`toggleExpanded(current="x", name="hello w...: actual=${actual}`);
      expect(actual).assertEqual('hello worldhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0045 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0046
     * @tc.name      Location_ToggleExpanded_0046
     * @tc.desc      toggleExpanded(current="x", name="hello world_1") returns "hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0046 begin`);
      const actual: string = toggleExpanded('x', 'hello world_1');
      logInfo(`toggleExpanded(current="x", name="hello w...: actual=${actual}`);
      expect(actual).assertEqual('hello world_1');
      logInfo(`${BUNDLE}ToggleExpanded_0046 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0047
     * @tc.name      Location_ToggleExpanded_0047
     * @tc.desc      toggleExpanded(current="x", name="xhello world") returns "xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0047 begin`);
      const actual: string = toggleExpanded('x', 'xhello world');
      logInfo(`toggleExpanded(current="x", name="xhello ...: actual=${actual}`);
      expect(actual).assertEqual('xhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0047 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0048
     * @tc.name      Location_ToggleExpanded_0048
     * @tc.desc      toggleExpanded(current="x", name="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0048 begin`);
      const actual: string = toggleExpanded('x', '   ');
      logInfo(`toggleExpanded(current="x", name="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}ToggleExpanded_0048 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0049
     * @tc.name      Location_ToggleExpanded_0049
     * @tc.desc      toggleExpanded(current="a", name="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0049 begin`);
      const actual: string = toggleExpanded('a', '');
      logInfo(`toggleExpanded(current="a", name=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0049 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0050
     * @tc.name      Location_ToggleExpanded_0050
     * @tc.desc      toggleExpanded(current="a", name="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0050 begin`);
      const actual: string = toggleExpanded('a', 'x');
      logInfo(`toggleExpanded(current="a", name="x"): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}ToggleExpanded_0050 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0051
     * @tc.name      Location_ToggleExpanded_0051
     * @tc.desc      toggleExpanded(current="a", name="Hello") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0051 begin`);
      const actual: string = toggleExpanded('a', 'Hello');
      logInfo(`toggleExpanded(current="a", name="Hello"): actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}ToggleExpanded_0051 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0052
     * @tc.name      Location_ToggleExpanded_0052
     * @tc.desc      toggleExpanded(current="a", name="hello world") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0052 begin`);
      const actual: string = toggleExpanded('a', 'hello world');
      logInfo(`toggleExpanded(current="a", name="hello w...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}ToggleExpanded_0052 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0053
     * @tc.name      Location_ToggleExpanded_0053
     * @tc.desc      toggleExpanded(current="a", name=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0053 begin`);
      const actual: string = toggleExpanded('a', ' ');
      logInfo(`toggleExpanded(current="a", name=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}ToggleExpanded_0053 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0054
     * @tc.name      Location_ToggleExpanded_0054
     * @tc.desc      toggleExpanded(current="a", name="A") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0054 begin`);
      const actual: string = toggleExpanded('a', 'A');
      logInfo(`toggleExpanded(current="a", name="A"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}ToggleExpanded_0054 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0055
     * @tc.name      Location_ToggleExpanded_0055
     * @tc.desc      toggleExpanded(current="a", name="Sample Title 123") returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0055 begin`);
      const actual: string = toggleExpanded('a', 'Sample Title 123');
      logInfo(`toggleExpanded(current="a", name="Sample ...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}ToggleExpanded_0055 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0056
     * @tc.name      Location_ToggleExpanded_0056
     * @tc.desc      toggleExpanded(current="a", name="??") returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0056 begin`);
      const actual: string = toggleExpanded('a', '\u4e2d\u6587');
      logInfo(`toggleExpanded(current="a", name="??"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}ToggleExpanded_0056 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0057
     * @tc.name      Location_ToggleExpanded_0057
     * @tc.desc      toggleExpanded(current="a", name="a") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0057 begin`);
      const actual: string = toggleExpanded('a', 'a');
      logInfo(`toggleExpanded(current="a", name="a"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0057 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0058
     * @tc.name      Location_ToggleExpanded_0058
     * @tc.desc      toggleExpanded(current="a", name="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0058 begin`);
      const actual: string = toggleExpanded('a', 'abc');
      logInfo(`toggleExpanded(current="a", name="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}ToggleExpanded_0058 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0059
     * @tc.name      Location_ToggleExpanded_0059
     * @tc.desc      toggleExpanded(current="a", name="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0059 begin`);
      const actual: string = toggleExpanded('a', 'Hello World');
      logInfo(`toggleExpanded(current="a", name="Hello W...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}ToggleExpanded_0059 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0060
     * @tc.name      Location_ToggleExpanded_0060
     * @tc.desc      toggleExpanded(current="a", name="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0060 begin`);
      const actual: string = toggleExpanded('a', '123');
      logInfo(`toggleExpanded(current="a", name="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}ToggleExpanded_0060 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0061
     * @tc.name      Location_ToggleExpanded_0061
     * @tc.desc      toggleExpanded(current="a", name=" x ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0061 begin`);
      const actual: string = toggleExpanded('a', ' x ');
      logInfo(`toggleExpanded(current="a", name=" x "): actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}ToggleExpanded_0061 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0062
     * @tc.name      Location_ToggleExpanded_0062
     * @tc.desc      toggleExpanded(current="a", name="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0062 begin`);
      const actual: string = toggleExpanded('a', 'xx');
      logInfo(`toggleExpanded(current="a", name="xx"): actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}ToggleExpanded_0062 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0063
     * @tc.name      Location_ToggleExpanded_0063
     * @tc.desc      toggleExpanded(current="a", name="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0063 begin`);
      const actual: string = toggleExpanded('a', 'x_1');
      logInfo(`toggleExpanded(current="a", name="x_1"): actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}ToggleExpanded_0063 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0064
     * @tc.name      Location_ToggleExpanded_0064
     * @tc.desc      toggleExpanded(current="a", name=" Hello ") returns " Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0064 begin`);
      const actual: string = toggleExpanded('a', ' Hello ');
      logInfo(`toggleExpanded(current="a", name=" Hello "): actual=${actual}`);
      expect(actual).assertEqual(' Hello ');
      logInfo(`${BUNDLE}ToggleExpanded_0064 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0065
     * @tc.name      Location_ToggleExpanded_0065
     * @tc.desc      toggleExpanded(current="a", name="HelloHello") returns "HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0065 begin`);
      const actual: string = toggleExpanded('a', 'HelloHello');
      logInfo(`toggleExpanded(current="a", name="HelloHe...: actual=${actual}`);
      expect(actual).assertEqual('HelloHello');
      logInfo(`${BUNDLE}ToggleExpanded_0065 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0066
     * @tc.name      Location_ToggleExpanded_0066
     * @tc.desc      toggleExpanded(current="a", name="Hello_1") returns "Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0066 begin`);
      const actual: string = toggleExpanded('a', 'Hello_1');
      logInfo(`toggleExpanded(current="a", name="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('Hello_1');
      logInfo(`${BUNDLE}ToggleExpanded_0066 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0067
     * @tc.name      Location_ToggleExpanded_0067
     * @tc.desc      toggleExpanded(current="a", name="xHello") returns "xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0067 begin`);
      const actual: string = toggleExpanded('a', 'xHello');
      logInfo(`toggleExpanded(current="a", name="xHello"): actual=${actual}`);
      expect(actual).assertEqual('xHello');
      logInfo(`${BUNDLE}ToggleExpanded_0067 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0068
     * @tc.name      Location_ToggleExpanded_0068
     * @tc.desc      toggleExpanded(current="a", name=" hello world ") returns " hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0068 begin`);
      const actual: string = toggleExpanded('a', ' hello world ');
      logInfo(`toggleExpanded(current="a", name=" hello ...: actual=${actual}`);
      expect(actual).assertEqual(' hello world ');
      logInfo(`${BUNDLE}ToggleExpanded_0068 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0069
     * @tc.name      Location_ToggleExpanded_0069
     * @tc.desc      toggleExpanded(current="a", name="hello worldhello world") returns "hello worldhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0069 begin`);
      const actual: string = toggleExpanded('a', 'hello worldhello world');
      logInfo(`toggleExpanded(current="a", name="hello w...: actual=${actual}`);
      expect(actual).assertEqual('hello worldhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0069 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0070
     * @tc.name      Location_ToggleExpanded_0070
     * @tc.desc      toggleExpanded(current="a", name="hello world_1") returns "hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0070 begin`);
      const actual: string = toggleExpanded('a', 'hello world_1');
      logInfo(`toggleExpanded(current="a", name="hello w...: actual=${actual}`);
      expect(actual).assertEqual('hello world_1');
      logInfo(`${BUNDLE}ToggleExpanded_0070 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0071
     * @tc.name      Location_ToggleExpanded_0071
     * @tc.desc      toggleExpanded(current="a", name="xhello world") returns "xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0071 begin`);
      const actual: string = toggleExpanded('a', 'xhello world');
      logInfo(`toggleExpanded(current="a", name="xhello ...: actual=${actual}`);
      expect(actual).assertEqual('xhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0071 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0072
     * @tc.name      Location_ToggleExpanded_0072
     * @tc.desc      toggleExpanded(current="a", name="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0072 begin`);
      const actual: string = toggleExpanded('a', '   ');
      logInfo(`toggleExpanded(current="a", name="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}ToggleExpanded_0072 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0073
     * @tc.name      Location_ToggleExpanded_0073
     * @tc.desc      toggleExpanded(current="abc", name="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0073 begin`);
      const actual: string = toggleExpanded('abc', '');
      logInfo(`toggleExpanded(current="abc", name=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0073 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0074
     * @tc.name      Location_ToggleExpanded_0074
     * @tc.desc      toggleExpanded(current="abc", name="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0074 begin`);
      const actual: string = toggleExpanded('abc', 'x');
      logInfo(`toggleExpanded(current="abc", name="x"): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}ToggleExpanded_0074 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0075
     * @tc.name      Location_ToggleExpanded_0075
     * @tc.desc      toggleExpanded(current="abc", name="Hello") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0075 begin`);
      const actual: string = toggleExpanded('abc', 'Hello');
      logInfo(`toggleExpanded(current="abc", name="Hello"): actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}ToggleExpanded_0075 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0076
     * @tc.name      Location_ToggleExpanded_0076
     * @tc.desc      toggleExpanded(current="abc", name="hello world") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0076 begin`);
      const actual: string = toggleExpanded('abc', 'hello world');
      logInfo(`toggleExpanded(current="abc", name="hello...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}ToggleExpanded_0076 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0077
     * @tc.name      Location_ToggleExpanded_0077
     * @tc.desc      toggleExpanded(current="abc", name=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0077 begin`);
      const actual: string = toggleExpanded('abc', ' ');
      logInfo(`toggleExpanded(current="abc", name=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}ToggleExpanded_0077 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0078
     * @tc.name      Location_ToggleExpanded_0078
     * @tc.desc      toggleExpanded(current="abc", name="A") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0078 begin`);
      const actual: string = toggleExpanded('abc', 'A');
      logInfo(`toggleExpanded(current="abc", name="A"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}ToggleExpanded_0078 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0079
     * @tc.name      Location_ToggleExpanded_0079
     * @tc.desc      toggleExpanded(current="abc", name="Sample Title 123") returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0079 begin`);
      const actual: string = toggleExpanded('abc', 'Sample Title 123');
      logInfo(`toggleExpanded(current="abc", name="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}ToggleExpanded_0079 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0080
     * @tc.name      Location_ToggleExpanded_0080
     * @tc.desc      toggleExpanded(current="abc", name="??") returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0080 begin`);
      const actual: string = toggleExpanded('abc', '\u4e2d\u6587');
      logInfo(`toggleExpanded(current="abc", name="??"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}ToggleExpanded_0080 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0081
     * @tc.name      Location_ToggleExpanded_0081
     * @tc.desc      toggleExpanded(current="abc", name="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0081 begin`);
      const actual: string = toggleExpanded('abc', 'a');
      logInfo(`toggleExpanded(current="abc", name="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}ToggleExpanded_0081 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0082
     * @tc.name      Location_ToggleExpanded_0082
     * @tc.desc      toggleExpanded(current="abc", name="abc") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0082 begin`);
      const actual: string = toggleExpanded('abc', 'abc');
      logInfo(`toggleExpanded(current="abc", name="abc"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0082 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0083
     * @tc.name      Location_ToggleExpanded_0083
     * @tc.desc      toggleExpanded(current="abc", name="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0083 begin`);
      const actual: string = toggleExpanded('abc', 'Hello World');
      logInfo(`toggleExpanded(current="abc", name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}ToggleExpanded_0083 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0084
     * @tc.name      Location_ToggleExpanded_0084
     * @tc.desc      toggleExpanded(current="abc", name="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0084 begin`);
      const actual: string = toggleExpanded('abc', '123');
      logInfo(`toggleExpanded(current="abc", name="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}ToggleExpanded_0084 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0085
     * @tc.name      Location_ToggleExpanded_0085
     * @tc.desc      toggleExpanded(current="abc", name=" x ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0085 begin`);
      const actual: string = toggleExpanded('abc', ' x ');
      logInfo(`toggleExpanded(current="abc", name=" x "): actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}ToggleExpanded_0085 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0086
     * @tc.name      Location_ToggleExpanded_0086
     * @tc.desc      toggleExpanded(current="abc", name="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0086 begin`);
      const actual: string = toggleExpanded('abc', 'xx');
      logInfo(`toggleExpanded(current="abc", name="xx"): actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}ToggleExpanded_0086 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0087
     * @tc.name      Location_ToggleExpanded_0087
     * @tc.desc      toggleExpanded(current="abc", name="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0087 begin`);
      const actual: string = toggleExpanded('abc', 'x_1');
      logInfo(`toggleExpanded(current="abc", name="x_1"): actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}ToggleExpanded_0087 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0088
     * @tc.name      Location_ToggleExpanded_0088
     * @tc.desc      toggleExpanded(current="abc", name=" Hello ") returns " Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0088 begin`);
      const actual: string = toggleExpanded('abc', ' Hello ');
      logInfo(`toggleExpanded(current="abc", name=" Hell...: actual=${actual}`);
      expect(actual).assertEqual(' Hello ');
      logInfo(`${BUNDLE}ToggleExpanded_0088 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0089
     * @tc.name      Location_ToggleExpanded_0089
     * @tc.desc      toggleExpanded(current="abc", name="HelloHello") returns "HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0089 begin`);
      const actual: string = toggleExpanded('abc', 'HelloHello');
      logInfo(`toggleExpanded(current="abc", name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('HelloHello');
      logInfo(`${BUNDLE}ToggleExpanded_0089 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0090
     * @tc.name      Location_ToggleExpanded_0090
     * @tc.desc      toggleExpanded(current="abc", name="Hello_1") returns "Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0090 begin`);
      const actual: string = toggleExpanded('abc', 'Hello_1');
      logInfo(`toggleExpanded(current="abc", name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('Hello_1');
      logInfo(`${BUNDLE}ToggleExpanded_0090 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0091
     * @tc.name      Location_ToggleExpanded_0091
     * @tc.desc      toggleExpanded(current="abc", name="xHello") returns "xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0091 begin`);
      const actual: string = toggleExpanded('abc', 'xHello');
      logInfo(`toggleExpanded(current="abc", name="xHello"): actual=${actual}`);
      expect(actual).assertEqual('xHello');
      logInfo(`${BUNDLE}ToggleExpanded_0091 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0092
     * @tc.name      Location_ToggleExpanded_0092
     * @tc.desc      toggleExpanded(current="abc", name=" hello world ") returns " hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0092 begin`);
      const actual: string = toggleExpanded('abc', ' hello world ');
      logInfo(`toggleExpanded(current="abc", name=" hell...: actual=${actual}`);
      expect(actual).assertEqual(' hello world ');
      logInfo(`${BUNDLE}ToggleExpanded_0092 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0093
     * @tc.name      Location_ToggleExpanded_0093
     * @tc.desc      toggleExpanded(current="abc", name="hello worldhello world") returns "hello worldhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0093 begin`);
      const actual: string = toggleExpanded('abc', 'hello worldhello world');
      logInfo(`toggleExpanded(current="abc", name="hello...: actual=${actual}`);
      expect(actual).assertEqual('hello worldhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0093 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0094
     * @tc.name      Location_ToggleExpanded_0094
     * @tc.desc      toggleExpanded(current="abc", name="hello world_1") returns "hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0094 begin`);
      const actual: string = toggleExpanded('abc', 'hello world_1');
      logInfo(`toggleExpanded(current="abc", name="hello...: actual=${actual}`);
      expect(actual).assertEqual('hello world_1');
      logInfo(`${BUNDLE}ToggleExpanded_0094 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0095
     * @tc.name      Location_ToggleExpanded_0095
     * @tc.desc      toggleExpanded(current="abc", name="xhello world") returns "xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0095 begin`);
      const actual: string = toggleExpanded('abc', 'xhello world');
      logInfo(`toggleExpanded(current="abc", name="xhell...: actual=${actual}`);
      expect(actual).assertEqual('xhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0095 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0096
     * @tc.name      Location_ToggleExpanded_0096
     * @tc.desc      toggleExpanded(current="abc", name="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0096 begin`);
      const actual: string = toggleExpanded('abc', '   ');
      logInfo(`toggleExpanded(current="abc", name="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}ToggleExpanded_0096 end`);
    });
  });
}
