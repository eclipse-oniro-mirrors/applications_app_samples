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
export default function toggleExpanded2Test(): void {
  describe('ToggleExpanded2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0097
     * @tc.name      Location_ToggleExpanded_0097
     * @tc.desc      toggleExpanded(current="Hello World", name="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0097 begin`);
      const actual: string = toggleExpanded('Hello World', '');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0097 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0098
     * @tc.name      Location_ToggleExpanded_0098
     * @tc.desc      toggleExpanded(current="Hello World", name="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0098 begin`);
      const actual: string = toggleExpanded('Hello World', 'x');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}ToggleExpanded_0098 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0099
     * @tc.name      Location_ToggleExpanded_0099
     * @tc.desc      toggleExpanded(current="Hello World", name="Hello") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0099 begin`);
      const actual: string = toggleExpanded('Hello World', 'Hello');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}ToggleExpanded_0099 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0100
     * @tc.name      Location_ToggleExpanded_0100
     * @tc.desc      toggleExpanded(current="Hello World", name="hello world") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0100 begin`);
      const actual: string = toggleExpanded('Hello World', 'hello world');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}ToggleExpanded_0100 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0101
     * @tc.name      Location_ToggleExpanded_0101
     * @tc.desc      toggleExpanded(current="Hello World", name=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0101 begin`);
      const actual: string = toggleExpanded('Hello World', ' ');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}ToggleExpanded_0101 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0102
     * @tc.name      Location_ToggleExpanded_0102
     * @tc.desc      toggleExpanded(current="Hello World", name="A") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0102 begin`);
      const actual: string = toggleExpanded('Hello World', 'A');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}ToggleExpanded_0102 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0103
     * @tc.name      Location_ToggleExpanded_0103
     * @tc.desc      toggleExpanded(current="Hello World", name="Sample Title 123") returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0103 begin`);
      const actual: string = toggleExpanded('Hello World', 'Sample Title 123');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}ToggleExpanded_0103 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0104
     * @tc.name      Location_ToggleExpanded_0104
     * @tc.desc      toggleExpanded(current="Hello World", name="??") returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0104 begin`);
      const actual: string = toggleExpanded('Hello World', '\u4e2d\u6587');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}ToggleExpanded_0104 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0105
     * @tc.name      Location_ToggleExpanded_0105
     * @tc.desc      toggleExpanded(current="Hello World", name="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0105 begin`);
      const actual: string = toggleExpanded('Hello World', 'a');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}ToggleExpanded_0105 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0106
     * @tc.name      Location_ToggleExpanded_0106
     * @tc.desc      toggleExpanded(current="Hello World", name="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0106 begin`);
      const actual: string = toggleExpanded('Hello World', 'abc');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}ToggleExpanded_0106 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0107
     * @tc.name      Location_ToggleExpanded_0107
     * @tc.desc      toggleExpanded(current="Hello World", name="Hello World") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0107 begin`);
      const actual: string = toggleExpanded('Hello World', 'Hello World');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0107 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0108
     * @tc.name      Location_ToggleExpanded_0108
     * @tc.desc      toggleExpanded(current="Hello World", name="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0108 begin`);
      const actual: string = toggleExpanded('Hello World', '123');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}ToggleExpanded_0108 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0109
     * @tc.name      Location_ToggleExpanded_0109
     * @tc.desc      toggleExpanded(current="Hello World", name=" x ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0109 begin`);
      const actual: string = toggleExpanded('Hello World', ' x ');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}ToggleExpanded_0109 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0110
     * @tc.name      Location_ToggleExpanded_0110
     * @tc.desc      toggleExpanded(current="Hello World", name="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0110 begin`);
      const actual: string = toggleExpanded('Hello World', 'xx');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}ToggleExpanded_0110 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0111
     * @tc.name      Location_ToggleExpanded_0111
     * @tc.desc      toggleExpanded(current="Hello World", name="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0111 begin`);
      const actual: string = toggleExpanded('Hello World', 'x_1');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}ToggleExpanded_0111 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0112
     * @tc.name      Location_ToggleExpanded_0112
     * @tc.desc      toggleExpanded(current="Hello World", name=" Hello ") returns " Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0112 begin`);
      const actual: string = toggleExpanded('Hello World', ' Hello ');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual(' Hello ');
      logInfo(`${BUNDLE}ToggleExpanded_0112 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0113
     * @tc.name      Location_ToggleExpanded_0113
     * @tc.desc      toggleExpanded(current="Hello World", name="HelloHello") returns "HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0113 begin`);
      const actual: string = toggleExpanded('Hello World', 'HelloHello');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual('HelloHello');
      logInfo(`${BUNDLE}ToggleExpanded_0113 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0114
     * @tc.name      Location_ToggleExpanded_0114
     * @tc.desc      toggleExpanded(current="Hello World", name="Hello_1") returns "Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0114 begin`);
      const actual: string = toggleExpanded('Hello World', 'Hello_1');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual('Hello_1');
      logInfo(`${BUNDLE}ToggleExpanded_0114 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0115
     * @tc.name      Location_ToggleExpanded_0115
     * @tc.desc      toggleExpanded(current="Hello World", name="xHello") returns "xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0115 begin`);
      const actual: string = toggleExpanded('Hello World', 'xHello');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual('xHello');
      logInfo(`${BUNDLE}ToggleExpanded_0115 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0116
     * @tc.name      Location_ToggleExpanded_0116
     * @tc.desc      toggleExpanded(current="Hello World", name=" hello world ") returns " hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0116 begin`);
      const actual: string = toggleExpanded('Hello World', ' hello world ');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual(' hello world ');
      logInfo(`${BUNDLE}ToggleExpanded_0116 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0117
     * @tc.name      Location_ToggleExpanded_0117
     * @tc.desc      toggleExpanded(current="Hello World", name="hello worldhello world") returns "hello worldhello w...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0117 begin`);
      const actual: string = toggleExpanded('Hello World', 'hello worldhello world');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual('hello worldhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0117 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0118
     * @tc.name      Location_ToggleExpanded_0118
     * @tc.desc      toggleExpanded(current="Hello World", name="hello world_1") returns "hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0118 begin`);
      const actual: string = toggleExpanded('Hello World', 'hello world_1');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual('hello world_1');
      logInfo(`${BUNDLE}ToggleExpanded_0118 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0119
     * @tc.name      Location_ToggleExpanded_0119
     * @tc.desc      toggleExpanded(current="Hello World", name="xhello world") returns "xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0119 begin`);
      const actual: string = toggleExpanded('Hello World', 'xhello world');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual('xhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0119 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0120
     * @tc.name      Location_ToggleExpanded_0120
     * @tc.desc      toggleExpanded(current="Hello World", name="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0120 begin`);
      const actual: string = toggleExpanded('Hello World', '   ');
      logInfo(`toggleExpanded(current="Hello World", nam...: actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}ToggleExpanded_0120 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0121
     * @tc.name      Location_ToggleExpanded_0121
     * @tc.desc      toggleExpanded(current=" ", name="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0121 begin`);
      const actual: string = toggleExpanded(' ', '');
      logInfo(`toggleExpanded(current=" ", name=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0121 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0122
     * @tc.name      Location_ToggleExpanded_0122
     * @tc.desc      toggleExpanded(current=" ", name="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0122 begin`);
      const actual: string = toggleExpanded(' ', 'x');
      logInfo(`toggleExpanded(current=" ", name="x"): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}ToggleExpanded_0122 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0123
     * @tc.name      Location_ToggleExpanded_0123
     * @tc.desc      toggleExpanded(current=" ", name="Hello") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0123 begin`);
      const actual: string = toggleExpanded(' ', 'Hello');
      logInfo(`toggleExpanded(current=" ", name="Hello"): actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}ToggleExpanded_0123 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0124
     * @tc.name      Location_ToggleExpanded_0124
     * @tc.desc      toggleExpanded(current=" ", name="hello world") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0124 begin`);
      const actual: string = toggleExpanded(' ', 'hello world');
      logInfo(`toggleExpanded(current=" ", name="hello w...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}ToggleExpanded_0124 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0125
     * @tc.name      Location_ToggleExpanded_0125
     * @tc.desc      toggleExpanded(current=" ", name=" ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0125 begin`);
      const actual: string = toggleExpanded(' ', ' ');
      logInfo(`toggleExpanded(current=" ", name=" "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0125 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0126
     * @tc.name      Location_ToggleExpanded_0126
     * @tc.desc      toggleExpanded(current=" ", name="A") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0126 begin`);
      const actual: string = toggleExpanded(' ', 'A');
      logInfo(`toggleExpanded(current=" ", name="A"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}ToggleExpanded_0126 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0127
     * @tc.name      Location_ToggleExpanded_0127
     * @tc.desc      toggleExpanded(current=" ", name="Sample Title 123") returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0127 begin`);
      const actual: string = toggleExpanded(' ', 'Sample Title 123');
      logInfo(`toggleExpanded(current=" ", name="Sample ...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}ToggleExpanded_0127 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0128
     * @tc.name      Location_ToggleExpanded_0128
     * @tc.desc      toggleExpanded(current=" ", name="??") returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0128 begin`);
      const actual: string = toggleExpanded(' ', '\u4e2d\u6587');
      logInfo(`toggleExpanded(current=" ", name="??"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}ToggleExpanded_0128 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0129
     * @tc.name      Location_ToggleExpanded_0129
     * @tc.desc      toggleExpanded(current=" ", name="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0129 begin`);
      const actual: string = toggleExpanded(' ', 'a');
      logInfo(`toggleExpanded(current=" ", name="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}ToggleExpanded_0129 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0130
     * @tc.name      Location_ToggleExpanded_0130
     * @tc.desc      toggleExpanded(current=" ", name="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0130 begin`);
      const actual: string = toggleExpanded(' ', 'abc');
      logInfo(`toggleExpanded(current=" ", name="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}ToggleExpanded_0130 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0131
     * @tc.name      Location_ToggleExpanded_0131
     * @tc.desc      toggleExpanded(current=" ", name="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0131 begin`);
      const actual: string = toggleExpanded(' ', 'Hello World');
      logInfo(`toggleExpanded(current=" ", name="Hello W...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}ToggleExpanded_0131 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0132
     * @tc.name      Location_ToggleExpanded_0132
     * @tc.desc      toggleExpanded(current=" ", name="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0132 begin`);
      const actual: string = toggleExpanded(' ', '123');
      logInfo(`toggleExpanded(current=" ", name="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}ToggleExpanded_0132 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0133
     * @tc.name      Location_ToggleExpanded_0133
     * @tc.desc      toggleExpanded(current=" ", name=" x ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0133 begin`);
      const actual: string = toggleExpanded(' ', ' x ');
      logInfo(`toggleExpanded(current=" ", name=" x "): actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}ToggleExpanded_0133 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0134
     * @tc.name      Location_ToggleExpanded_0134
     * @tc.desc      toggleExpanded(current=" ", name="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0134 begin`);
      const actual: string = toggleExpanded(' ', 'xx');
      logInfo(`toggleExpanded(current=" ", name="xx"): actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}ToggleExpanded_0134 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0135
     * @tc.name      Location_ToggleExpanded_0135
     * @tc.desc      toggleExpanded(current=" ", name="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0135 begin`);
      const actual: string = toggleExpanded(' ', 'x_1');
      logInfo(`toggleExpanded(current=" ", name="x_1"): actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}ToggleExpanded_0135 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0136
     * @tc.name      Location_ToggleExpanded_0136
     * @tc.desc      toggleExpanded(current=" ", name=" Hello ") returns " Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0136 begin`);
      const actual: string = toggleExpanded(' ', ' Hello ');
      logInfo(`toggleExpanded(current=" ", name=" Hello "): actual=${actual}`);
      expect(actual).assertEqual(' Hello ');
      logInfo(`${BUNDLE}ToggleExpanded_0136 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0137
     * @tc.name      Location_ToggleExpanded_0137
     * @tc.desc      toggleExpanded(current=" ", name="HelloHello") returns "HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0137 begin`);
      const actual: string = toggleExpanded(' ', 'HelloHello');
      logInfo(`toggleExpanded(current=" ", name="HelloHe...: actual=${actual}`);
      expect(actual).assertEqual('HelloHello');
      logInfo(`${BUNDLE}ToggleExpanded_0137 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0138
     * @tc.name      Location_ToggleExpanded_0138
     * @tc.desc      toggleExpanded(current=" ", name="Hello_1") returns "Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0138 begin`);
      const actual: string = toggleExpanded(' ', 'Hello_1');
      logInfo(`toggleExpanded(current=" ", name="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('Hello_1');
      logInfo(`${BUNDLE}ToggleExpanded_0138 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0139
     * @tc.name      Location_ToggleExpanded_0139
     * @tc.desc      toggleExpanded(current=" ", name="xHello") returns "xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0139 begin`);
      const actual: string = toggleExpanded(' ', 'xHello');
      logInfo(`toggleExpanded(current=" ", name="xHello"): actual=${actual}`);
      expect(actual).assertEqual('xHello');
      logInfo(`${BUNDLE}ToggleExpanded_0139 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0140
     * @tc.name      Location_ToggleExpanded_0140
     * @tc.desc      toggleExpanded(current=" ", name=" hello world ") returns " hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0140 begin`);
      const actual: string = toggleExpanded(' ', ' hello world ');
      logInfo(`toggleExpanded(current=" ", name=" hello ...: actual=${actual}`);
      expect(actual).assertEqual(' hello world ');
      logInfo(`${BUNDLE}ToggleExpanded_0140 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0141
     * @tc.name      Location_ToggleExpanded_0141
     * @tc.desc      toggleExpanded(current=" ", name="hello worldhello world") returns "hello worldhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0141 begin`);
      const actual: string = toggleExpanded(' ', 'hello worldhello world');
      logInfo(`toggleExpanded(current=" ", name="hello w...: actual=${actual}`);
      expect(actual).assertEqual('hello worldhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0141 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0142
     * @tc.name      Location_ToggleExpanded_0142
     * @tc.desc      toggleExpanded(current=" ", name="hello world_1") returns "hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0142 begin`);
      const actual: string = toggleExpanded(' ', 'hello world_1');
      logInfo(`toggleExpanded(current=" ", name="hello w...: actual=${actual}`);
      expect(actual).assertEqual('hello world_1');
      logInfo(`${BUNDLE}ToggleExpanded_0142 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0143
     * @tc.name      Location_ToggleExpanded_0143
     * @tc.desc      toggleExpanded(current=" ", name="xhello world") returns "xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0143 begin`);
      const actual: string = toggleExpanded(' ', 'xhello world');
      logInfo(`toggleExpanded(current=" ", name="xhello ...: actual=${actual}`);
      expect(actual).assertEqual('xhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0143 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0144
     * @tc.name      Location_ToggleExpanded_0144
     * @tc.desc      toggleExpanded(current=" ", name="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0144 begin`);
      const actual: string = toggleExpanded(' ', '   ');
      logInfo(`toggleExpanded(current=" ", name="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}ToggleExpanded_0144 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0145
     * @tc.name      Location_ToggleExpanded_0145
     * @tc.desc      toggleExpanded(current="123", name="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0145 begin`);
      const actual: string = toggleExpanded('123', '');
      logInfo(`toggleExpanded(current="123", name=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0145 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0146
     * @tc.name      Location_ToggleExpanded_0146
     * @tc.desc      toggleExpanded(current="123", name="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0146 begin`);
      const actual: string = toggleExpanded('123', 'x');
      logInfo(`toggleExpanded(current="123", name="x"): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}ToggleExpanded_0146 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0147
     * @tc.name      Location_ToggleExpanded_0147
     * @tc.desc      toggleExpanded(current="123", name="Hello") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0147 begin`);
      const actual: string = toggleExpanded('123', 'Hello');
      logInfo(`toggleExpanded(current="123", name="Hello"): actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}ToggleExpanded_0147 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0148
     * @tc.name      Location_ToggleExpanded_0148
     * @tc.desc      toggleExpanded(current="123", name="hello world") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0148 begin`);
      const actual: string = toggleExpanded('123', 'hello world');
      logInfo(`toggleExpanded(current="123", name="hello...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}ToggleExpanded_0148 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0149
     * @tc.name      Location_ToggleExpanded_0149
     * @tc.desc      toggleExpanded(current="123", name=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0149 begin`);
      const actual: string = toggleExpanded('123', ' ');
      logInfo(`toggleExpanded(current="123", name=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}ToggleExpanded_0149 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0150
     * @tc.name      Location_ToggleExpanded_0150
     * @tc.desc      toggleExpanded(current="123", name="A") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0150 begin`);
      const actual: string = toggleExpanded('123', 'A');
      logInfo(`toggleExpanded(current="123", name="A"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}ToggleExpanded_0150 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0151
     * @tc.name      Location_ToggleExpanded_0151
     * @tc.desc      toggleExpanded(current="123", name="Sample Title 123") returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0151 begin`);
      const actual: string = toggleExpanded('123', 'Sample Title 123');
      logInfo(`toggleExpanded(current="123", name="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}ToggleExpanded_0151 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0152
     * @tc.name      Location_ToggleExpanded_0152
     * @tc.desc      toggleExpanded(current="123", name="??") returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0152 begin`);
      const actual: string = toggleExpanded('123', '\u4e2d\u6587');
      logInfo(`toggleExpanded(current="123", name="??"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}ToggleExpanded_0152 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0153
     * @tc.name      Location_ToggleExpanded_0153
     * @tc.desc      toggleExpanded(current="123", name="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0153 begin`);
      const actual: string = toggleExpanded('123', 'a');
      logInfo(`toggleExpanded(current="123", name="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}ToggleExpanded_0153 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0154
     * @tc.name      Location_ToggleExpanded_0154
     * @tc.desc      toggleExpanded(current="123", name="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0154 begin`);
      const actual: string = toggleExpanded('123', 'abc');
      logInfo(`toggleExpanded(current="123", name="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}ToggleExpanded_0154 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0155
     * @tc.name      Location_ToggleExpanded_0155
     * @tc.desc      toggleExpanded(current="123", name="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0155 begin`);
      const actual: string = toggleExpanded('123', 'Hello World');
      logInfo(`toggleExpanded(current="123", name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}ToggleExpanded_0155 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0156
     * @tc.name      Location_ToggleExpanded_0156
     * @tc.desc      toggleExpanded(current="123", name="123") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0156 begin`);
      const actual: string = toggleExpanded('123', '123');
      logInfo(`toggleExpanded(current="123", name="123"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0156 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0157
     * @tc.name      Location_ToggleExpanded_0157
     * @tc.desc      toggleExpanded(current="123", name=" x ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0157 begin`);
      const actual: string = toggleExpanded('123', ' x ');
      logInfo(`toggleExpanded(current="123", name=" x "): actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}ToggleExpanded_0157 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0158
     * @tc.name      Location_ToggleExpanded_0158
     * @tc.desc      toggleExpanded(current="123", name="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0158 begin`);
      const actual: string = toggleExpanded('123', 'xx');
      logInfo(`toggleExpanded(current="123", name="xx"): actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}ToggleExpanded_0158 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0159
     * @tc.name      Location_ToggleExpanded_0159
     * @tc.desc      toggleExpanded(current="123", name="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0159 begin`);
      const actual: string = toggleExpanded('123', 'x_1');
      logInfo(`toggleExpanded(current="123", name="x_1"): actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}ToggleExpanded_0159 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0160
     * @tc.name      Location_ToggleExpanded_0160
     * @tc.desc      toggleExpanded(current="123", name=" Hello ") returns " Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0160 begin`);
      const actual: string = toggleExpanded('123', ' Hello ');
      logInfo(`toggleExpanded(current="123", name=" Hell...: actual=${actual}`);
      expect(actual).assertEqual(' Hello ');
      logInfo(`${BUNDLE}ToggleExpanded_0160 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0161
     * @tc.name      Location_ToggleExpanded_0161
     * @tc.desc      toggleExpanded(current="123", name="HelloHello") returns "HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0161 begin`);
      const actual: string = toggleExpanded('123', 'HelloHello');
      logInfo(`toggleExpanded(current="123", name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('HelloHello');
      logInfo(`${BUNDLE}ToggleExpanded_0161 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0162
     * @tc.name      Location_ToggleExpanded_0162
     * @tc.desc      toggleExpanded(current="123", name="Hello_1") returns "Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0162 begin`);
      const actual: string = toggleExpanded('123', 'Hello_1');
      logInfo(`toggleExpanded(current="123", name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('Hello_1');
      logInfo(`${BUNDLE}ToggleExpanded_0162 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0163
     * @tc.name      Location_ToggleExpanded_0163
     * @tc.desc      toggleExpanded(current="123", name="xHello") returns "xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0163 begin`);
      const actual: string = toggleExpanded('123', 'xHello');
      logInfo(`toggleExpanded(current="123", name="xHello"): actual=${actual}`);
      expect(actual).assertEqual('xHello');
      logInfo(`${BUNDLE}ToggleExpanded_0163 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0164
     * @tc.name      Location_ToggleExpanded_0164
     * @tc.desc      toggleExpanded(current="123", name=" hello world ") returns " hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0164 begin`);
      const actual: string = toggleExpanded('123', ' hello world ');
      logInfo(`toggleExpanded(current="123", name=" hell...: actual=${actual}`);
      expect(actual).assertEqual(' hello world ');
      logInfo(`${BUNDLE}ToggleExpanded_0164 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0165
     * @tc.name      Location_ToggleExpanded_0165
     * @tc.desc      toggleExpanded(current="123", name="hello worldhello world") returns "hello worldhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0165 begin`);
      const actual: string = toggleExpanded('123', 'hello worldhello world');
      logInfo(`toggleExpanded(current="123", name="hello...: actual=${actual}`);
      expect(actual).assertEqual('hello worldhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0165 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0166
     * @tc.name      Location_ToggleExpanded_0166
     * @tc.desc      toggleExpanded(current="123", name="hello world_1") returns "hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0166 begin`);
      const actual: string = toggleExpanded('123', 'hello world_1');
      logInfo(`toggleExpanded(current="123", name="hello...: actual=${actual}`);
      expect(actual).assertEqual('hello world_1');
      logInfo(`${BUNDLE}ToggleExpanded_0166 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0167
     * @tc.name      Location_ToggleExpanded_0167
     * @tc.desc      toggleExpanded(current="123", name="xhello world") returns "xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0167 begin`);
      const actual: string = toggleExpanded('123', 'xhello world');
      logInfo(`toggleExpanded(current="123", name="xhell...: actual=${actual}`);
      expect(actual).assertEqual('xhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0167 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0168
     * @tc.name      Location_ToggleExpanded_0168
     * @tc.desc      toggleExpanded(current="123", name="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0168 begin`);
      const actual: string = toggleExpanded('123', '   ');
      logInfo(`toggleExpanded(current="123", name="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}ToggleExpanded_0168 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0169
     * @tc.name      Location_ToggleExpanded_0169
     * @tc.desc      toggleExpanded(current=" x ", name="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0169 begin`);
      const actual: string = toggleExpanded(' x ', '');
      logInfo(`toggleExpanded(current=" x ", name=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0169 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0170
     * @tc.name      Location_ToggleExpanded_0170
     * @tc.desc      toggleExpanded(current=" x ", name="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0170 begin`);
      const actual: string = toggleExpanded(' x ', 'x');
      logInfo(`toggleExpanded(current=" x ", name="x"): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}ToggleExpanded_0170 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0171
     * @tc.name      Location_ToggleExpanded_0171
     * @tc.desc      toggleExpanded(current=" x ", name="Hello") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0171 begin`);
      const actual: string = toggleExpanded(' x ', 'Hello');
      logInfo(`toggleExpanded(current=" x ", name="Hello"): actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}ToggleExpanded_0171 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0172
     * @tc.name      Location_ToggleExpanded_0172
     * @tc.desc      toggleExpanded(current=" x ", name="hello world") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0172 begin`);
      const actual: string = toggleExpanded(' x ', 'hello world');
      logInfo(`toggleExpanded(current=" x ", name="hello...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}ToggleExpanded_0172 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0173
     * @tc.name      Location_ToggleExpanded_0173
     * @tc.desc      toggleExpanded(current=" x ", name=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0173 begin`);
      const actual: string = toggleExpanded(' x ', ' ');
      logInfo(`toggleExpanded(current=" x ", name=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}ToggleExpanded_0173 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0174
     * @tc.name      Location_ToggleExpanded_0174
     * @tc.desc      toggleExpanded(current=" x ", name="A") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0174 begin`);
      const actual: string = toggleExpanded(' x ', 'A');
      logInfo(`toggleExpanded(current=" x ", name="A"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}ToggleExpanded_0174 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0175
     * @tc.name      Location_ToggleExpanded_0175
     * @tc.desc      toggleExpanded(current=" x ", name="Sample Title 123") returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0175 begin`);
      const actual: string = toggleExpanded(' x ', 'Sample Title 123');
      logInfo(`toggleExpanded(current=" x ", name="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}ToggleExpanded_0175 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0176
     * @tc.name      Location_ToggleExpanded_0176
     * @tc.desc      toggleExpanded(current=" x ", name="??") returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0176 begin`);
      const actual: string = toggleExpanded(' x ', '\u4e2d\u6587');
      logInfo(`toggleExpanded(current=" x ", name="??"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}ToggleExpanded_0176 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0177
     * @tc.name      Location_ToggleExpanded_0177
     * @tc.desc      toggleExpanded(current=" x ", name="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0177 begin`);
      const actual: string = toggleExpanded(' x ', 'a');
      logInfo(`toggleExpanded(current=" x ", name="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}ToggleExpanded_0177 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0178
     * @tc.name      Location_ToggleExpanded_0178
     * @tc.desc      toggleExpanded(current=" x ", name="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0178 begin`);
      const actual: string = toggleExpanded(' x ', 'abc');
      logInfo(`toggleExpanded(current=" x ", name="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}ToggleExpanded_0178 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0179
     * @tc.name      Location_ToggleExpanded_0179
     * @tc.desc      toggleExpanded(current=" x ", name="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0179 begin`);
      const actual: string = toggleExpanded(' x ', 'Hello World');
      logInfo(`toggleExpanded(current=" x ", name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}ToggleExpanded_0179 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0180
     * @tc.name      Location_ToggleExpanded_0180
     * @tc.desc      toggleExpanded(current=" x ", name="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0180 begin`);
      const actual: string = toggleExpanded(' x ', '123');
      logInfo(`toggleExpanded(current=" x ", name="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}ToggleExpanded_0180 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0181
     * @tc.name      Location_ToggleExpanded_0181
     * @tc.desc      toggleExpanded(current=" x ", name=" x ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0181 begin`);
      const actual: string = toggleExpanded(' x ', ' x ');
      logInfo(`toggleExpanded(current=" x ", name=" x "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0181 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0182
     * @tc.name      Location_ToggleExpanded_0182
     * @tc.desc      toggleExpanded(current=" x ", name="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0182 begin`);
      const actual: string = toggleExpanded(' x ', 'xx');
      logInfo(`toggleExpanded(current=" x ", name="xx"): actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}ToggleExpanded_0182 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0183
     * @tc.name      Location_ToggleExpanded_0183
     * @tc.desc      toggleExpanded(current=" x ", name="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0183 begin`);
      const actual: string = toggleExpanded(' x ', 'x_1');
      logInfo(`toggleExpanded(current=" x ", name="x_1"): actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}ToggleExpanded_0183 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0184
     * @tc.name      Location_ToggleExpanded_0184
     * @tc.desc      toggleExpanded(current=" x ", name=" Hello ") returns " Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0184 begin`);
      const actual: string = toggleExpanded(' x ', ' Hello ');
      logInfo(`toggleExpanded(current=" x ", name=" Hell...: actual=${actual}`);
      expect(actual).assertEqual(' Hello ');
      logInfo(`${BUNDLE}ToggleExpanded_0184 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0185
     * @tc.name      Location_ToggleExpanded_0185
     * @tc.desc      toggleExpanded(current=" x ", name="HelloHello") returns "HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0185 begin`);
      const actual: string = toggleExpanded(' x ', 'HelloHello');
      logInfo(`toggleExpanded(current=" x ", name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('HelloHello');
      logInfo(`${BUNDLE}ToggleExpanded_0185 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0186
     * @tc.name      Location_ToggleExpanded_0186
     * @tc.desc      toggleExpanded(current=" x ", name="Hello_1") returns "Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0186 begin`);
      const actual: string = toggleExpanded(' x ', 'Hello_1');
      logInfo(`toggleExpanded(current=" x ", name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('Hello_1');
      logInfo(`${BUNDLE}ToggleExpanded_0186 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0187
     * @tc.name      Location_ToggleExpanded_0187
     * @tc.desc      toggleExpanded(current=" x ", name="xHello") returns "xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0187 begin`);
      const actual: string = toggleExpanded(' x ', 'xHello');
      logInfo(`toggleExpanded(current=" x ", name="xHello"): actual=${actual}`);
      expect(actual).assertEqual('xHello');
      logInfo(`${BUNDLE}ToggleExpanded_0187 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0188
     * @tc.name      Location_ToggleExpanded_0188
     * @tc.desc      toggleExpanded(current=" x ", name=" hello world ") returns " hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0188 begin`);
      const actual: string = toggleExpanded(' x ', ' hello world ');
      logInfo(`toggleExpanded(current=" x ", name=" hell...: actual=${actual}`);
      expect(actual).assertEqual(' hello world ');
      logInfo(`${BUNDLE}ToggleExpanded_0188 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0189
     * @tc.name      Location_ToggleExpanded_0189
     * @tc.desc      toggleExpanded(current=" x ", name="hello worldhello world") returns "hello worldhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0189 begin`);
      const actual: string = toggleExpanded(' x ', 'hello worldhello world');
      logInfo(`toggleExpanded(current=" x ", name="hello...: actual=${actual}`);
      expect(actual).assertEqual('hello worldhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0189 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0190
     * @tc.name      Location_ToggleExpanded_0190
     * @tc.desc      toggleExpanded(current=" x ", name="hello world_1") returns "hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0190 begin`);
      const actual: string = toggleExpanded(' x ', 'hello world_1');
      logInfo(`toggleExpanded(current=" x ", name="hello...: actual=${actual}`);
      expect(actual).assertEqual('hello world_1');
      logInfo(`${BUNDLE}ToggleExpanded_0190 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0191
     * @tc.name      Location_ToggleExpanded_0191
     * @tc.desc      toggleExpanded(current=" x ", name="xhello world") returns "xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0191 begin`);
      const actual: string = toggleExpanded(' x ', 'xhello world');
      logInfo(`toggleExpanded(current=" x ", name="xhell...: actual=${actual}`);
      expect(actual).assertEqual('xhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0191 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0192
     * @tc.name      Location_ToggleExpanded_0192
     * @tc.desc      toggleExpanded(current=" x ", name="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0192 begin`);
      const actual: string = toggleExpanded(' x ', '   ');
      logInfo(`toggleExpanded(current=" x ", name="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}ToggleExpanded_0192 end`);
    });
  });
}
