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
export default function toggleExpanded3Test(): void {
  describe('ToggleExpanded3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0193
     * @tc.name      Location_ToggleExpanded_0193
     * @tc.desc      toggleExpanded(current="xx", name="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0193 begin`);
      const actual: string = toggleExpanded('xx', '');
      logInfo(`toggleExpanded(current="xx", name=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0193 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0194
     * @tc.name      Location_ToggleExpanded_0194
     * @tc.desc      toggleExpanded(current="xx", name="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0194 begin`);
      const actual: string = toggleExpanded('xx', 'x');
      logInfo(`toggleExpanded(current="xx", name="x"): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}ToggleExpanded_0194 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0195
     * @tc.name      Location_ToggleExpanded_0195
     * @tc.desc      toggleExpanded(current="xx", name="Hello") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0195 begin`);
      const actual: string = toggleExpanded('xx', 'Hello');
      logInfo(`toggleExpanded(current="xx", name="Hello"): actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}ToggleExpanded_0195 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0196
     * @tc.name      Location_ToggleExpanded_0196
     * @tc.desc      toggleExpanded(current="xx", name="hello world") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0196 begin`);
      const actual: string = toggleExpanded('xx', 'hello world');
      logInfo(`toggleExpanded(current="xx", name="hello ...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}ToggleExpanded_0196 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0197
     * @tc.name      Location_ToggleExpanded_0197
     * @tc.desc      toggleExpanded(current="xx", name=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0197 begin`);
      const actual: string = toggleExpanded('xx', ' ');
      logInfo(`toggleExpanded(current="xx", name=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}ToggleExpanded_0197 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0198
     * @tc.name      Location_ToggleExpanded_0198
     * @tc.desc      toggleExpanded(current="xx", name="A") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0198 begin`);
      const actual: string = toggleExpanded('xx', 'A');
      logInfo(`toggleExpanded(current="xx", name="A"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}ToggleExpanded_0198 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0199
     * @tc.name      Location_ToggleExpanded_0199
     * @tc.desc      toggleExpanded(current="xx", name="Sample Title 123") returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0199 begin`);
      const actual: string = toggleExpanded('xx', 'Sample Title 123');
      logInfo(`toggleExpanded(current="xx", name="Sample...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}ToggleExpanded_0199 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0200
     * @tc.name      Location_ToggleExpanded_0200
     * @tc.desc      toggleExpanded(current="xx", name="??") returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0200 begin`);
      const actual: string = toggleExpanded('xx', '\u4e2d\u6587');
      logInfo(`toggleExpanded(current="xx", name="??"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}ToggleExpanded_0200 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0201
     * @tc.name      Location_ToggleExpanded_0201
     * @tc.desc      toggleExpanded(current="xx", name="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0201 begin`);
      const actual: string = toggleExpanded('xx', 'a');
      logInfo(`toggleExpanded(current="xx", name="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}ToggleExpanded_0201 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0202
     * @tc.name      Location_ToggleExpanded_0202
     * @tc.desc      toggleExpanded(current="xx", name="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0202 begin`);
      const actual: string = toggleExpanded('xx', 'abc');
      logInfo(`toggleExpanded(current="xx", name="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}ToggleExpanded_0202 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0203
     * @tc.name      Location_ToggleExpanded_0203
     * @tc.desc      toggleExpanded(current="xx", name="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0203 begin`);
      const actual: string = toggleExpanded('xx', 'Hello World');
      logInfo(`toggleExpanded(current="xx", name="Hello ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}ToggleExpanded_0203 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0204
     * @tc.name      Location_ToggleExpanded_0204
     * @tc.desc      toggleExpanded(current="xx", name="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0204 begin`);
      const actual: string = toggleExpanded('xx', '123');
      logInfo(`toggleExpanded(current="xx", name="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}ToggleExpanded_0204 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0205
     * @tc.name      Location_ToggleExpanded_0205
     * @tc.desc      toggleExpanded(current="xx", name=" x ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0205 begin`);
      const actual: string = toggleExpanded('xx', ' x ');
      logInfo(`toggleExpanded(current="xx", name=" x "): actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}ToggleExpanded_0205 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0206
     * @tc.name      Location_ToggleExpanded_0206
     * @tc.desc      toggleExpanded(current="xx", name="xx") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0206 begin`);
      const actual: string = toggleExpanded('xx', 'xx');
      logInfo(`toggleExpanded(current="xx", name="xx"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0206 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0207
     * @tc.name      Location_ToggleExpanded_0207
     * @tc.desc      toggleExpanded(current="xx", name="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0207 begin`);
      const actual: string = toggleExpanded('xx', 'x_1');
      logInfo(`toggleExpanded(current="xx", name="x_1"): actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}ToggleExpanded_0207 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0208
     * @tc.name      Location_ToggleExpanded_0208
     * @tc.desc      toggleExpanded(current="xx", name=" Hello ") returns " Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0208 begin`);
      const actual: string = toggleExpanded('xx', ' Hello ');
      logInfo(`toggleExpanded(current="xx", name=" Hello "): actual=${actual}`);
      expect(actual).assertEqual(' Hello ');
      logInfo(`${BUNDLE}ToggleExpanded_0208 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0209
     * @tc.name      Location_ToggleExpanded_0209
     * @tc.desc      toggleExpanded(current="xx", name="HelloHello") returns "HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0209 begin`);
      const actual: string = toggleExpanded('xx', 'HelloHello');
      logInfo(`toggleExpanded(current="xx", name="HelloH...: actual=${actual}`);
      expect(actual).assertEqual('HelloHello');
      logInfo(`${BUNDLE}ToggleExpanded_0209 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0210
     * @tc.name      Location_ToggleExpanded_0210
     * @tc.desc      toggleExpanded(current="xx", name="Hello_1") returns "Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0210 begin`);
      const actual: string = toggleExpanded('xx', 'Hello_1');
      logInfo(`toggleExpanded(current="xx", name="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('Hello_1');
      logInfo(`${BUNDLE}ToggleExpanded_0210 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0211
     * @tc.name      Location_ToggleExpanded_0211
     * @tc.desc      toggleExpanded(current="xx", name="xHello") returns "xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0211 begin`);
      const actual: string = toggleExpanded('xx', 'xHello');
      logInfo(`toggleExpanded(current="xx", name="xHello"): actual=${actual}`);
      expect(actual).assertEqual('xHello');
      logInfo(`${BUNDLE}ToggleExpanded_0211 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0212
     * @tc.name      Location_ToggleExpanded_0212
     * @tc.desc      toggleExpanded(current="xx", name=" hello world ") returns " hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0212 begin`);
      const actual: string = toggleExpanded('xx', ' hello world ');
      logInfo(`toggleExpanded(current="xx", name=" hello...: actual=${actual}`);
      expect(actual).assertEqual(' hello world ');
      logInfo(`${BUNDLE}ToggleExpanded_0212 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0213
     * @tc.name      Location_ToggleExpanded_0213
     * @tc.desc      toggleExpanded(current="xx", name="hello worldhello world") returns "hello worldhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0213 begin`);
      const actual: string = toggleExpanded('xx', 'hello worldhello world');
      logInfo(`toggleExpanded(current="xx", name="hello ...: actual=${actual}`);
      expect(actual).assertEqual('hello worldhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0213 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0214
     * @tc.name      Location_ToggleExpanded_0214
     * @tc.desc      toggleExpanded(current="xx", name="hello world_1") returns "hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0214 begin`);
      const actual: string = toggleExpanded('xx', 'hello world_1');
      logInfo(`toggleExpanded(current="xx", name="hello ...: actual=${actual}`);
      expect(actual).assertEqual('hello world_1');
      logInfo(`${BUNDLE}ToggleExpanded_0214 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0215
     * @tc.name      Location_ToggleExpanded_0215
     * @tc.desc      toggleExpanded(current="xx", name="xhello world") returns "xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0215 begin`);
      const actual: string = toggleExpanded('xx', 'xhello world');
      logInfo(`toggleExpanded(current="xx", name="xhello...: actual=${actual}`);
      expect(actual).assertEqual('xhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0215 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0216
     * @tc.name      Location_ToggleExpanded_0216
     * @tc.desc      toggleExpanded(current="xx", name="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0216 begin`);
      const actual: string = toggleExpanded('xx', '   ');
      logInfo(`toggleExpanded(current="xx", name="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}ToggleExpanded_0216 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0217
     * @tc.name      Location_ToggleExpanded_0217
     * @tc.desc      toggleExpanded(current="x_1", name="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0217 begin`);
      const actual: string = toggleExpanded('x_1', '');
      logInfo(`toggleExpanded(current="x_1", name=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0217 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0218
     * @tc.name      Location_ToggleExpanded_0218
     * @tc.desc      toggleExpanded(current="x_1", name="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0218 begin`);
      const actual: string = toggleExpanded('x_1', 'x');
      logInfo(`toggleExpanded(current="x_1", name="x"): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}ToggleExpanded_0218 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0219
     * @tc.name      Location_ToggleExpanded_0219
     * @tc.desc      toggleExpanded(current="x_1", name="Hello") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0219 begin`);
      const actual: string = toggleExpanded('x_1', 'Hello');
      logInfo(`toggleExpanded(current="x_1", name="Hello"): actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}ToggleExpanded_0219 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0220
     * @tc.name      Location_ToggleExpanded_0220
     * @tc.desc      toggleExpanded(current="x_1", name="hello world") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0220 begin`);
      const actual: string = toggleExpanded('x_1', 'hello world');
      logInfo(`toggleExpanded(current="x_1", name="hello...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}ToggleExpanded_0220 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0221
     * @tc.name      Location_ToggleExpanded_0221
     * @tc.desc      toggleExpanded(current="x_1", name=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0221 begin`);
      const actual: string = toggleExpanded('x_1', ' ');
      logInfo(`toggleExpanded(current="x_1", name=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}ToggleExpanded_0221 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0222
     * @tc.name      Location_ToggleExpanded_0222
     * @tc.desc      toggleExpanded(current="x_1", name="A") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0222 begin`);
      const actual: string = toggleExpanded('x_1', 'A');
      logInfo(`toggleExpanded(current="x_1", name="A"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}ToggleExpanded_0222 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0223
     * @tc.name      Location_ToggleExpanded_0223
     * @tc.desc      toggleExpanded(current="x_1", name="Sample Title 123") returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0223 begin`);
      const actual: string = toggleExpanded('x_1', 'Sample Title 123');
      logInfo(`toggleExpanded(current="x_1", name="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}ToggleExpanded_0223 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0224
     * @tc.name      Location_ToggleExpanded_0224
     * @tc.desc      toggleExpanded(current="x_1", name="??") returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0224 begin`);
      const actual: string = toggleExpanded('x_1', '\u4e2d\u6587');
      logInfo(`toggleExpanded(current="x_1", name="??"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}ToggleExpanded_0224 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0225
     * @tc.name      Location_ToggleExpanded_0225
     * @tc.desc      toggleExpanded(current="x_1", name="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0225 begin`);
      const actual: string = toggleExpanded('x_1', 'a');
      logInfo(`toggleExpanded(current="x_1", name="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}ToggleExpanded_0225 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0226
     * @tc.name      Location_ToggleExpanded_0226
     * @tc.desc      toggleExpanded(current="x_1", name="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0226 begin`);
      const actual: string = toggleExpanded('x_1', 'abc');
      logInfo(`toggleExpanded(current="x_1", name="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}ToggleExpanded_0226 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0227
     * @tc.name      Location_ToggleExpanded_0227
     * @tc.desc      toggleExpanded(current="x_1", name="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0227 begin`);
      const actual: string = toggleExpanded('x_1', 'Hello World');
      logInfo(`toggleExpanded(current="x_1", name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}ToggleExpanded_0227 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0228
     * @tc.name      Location_ToggleExpanded_0228
     * @tc.desc      toggleExpanded(current="x_1", name="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0228 begin`);
      const actual: string = toggleExpanded('x_1', '123');
      logInfo(`toggleExpanded(current="x_1", name="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}ToggleExpanded_0228 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0229
     * @tc.name      Location_ToggleExpanded_0229
     * @tc.desc      toggleExpanded(current="x_1", name=" x ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0229 begin`);
      const actual: string = toggleExpanded('x_1', ' x ');
      logInfo(`toggleExpanded(current="x_1", name=" x "): actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}ToggleExpanded_0229 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0230
     * @tc.name      Location_ToggleExpanded_0230
     * @tc.desc      toggleExpanded(current="x_1", name="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0230 begin`);
      const actual: string = toggleExpanded('x_1', 'xx');
      logInfo(`toggleExpanded(current="x_1", name="xx"): actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}ToggleExpanded_0230 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0231
     * @tc.name      Location_ToggleExpanded_0231
     * @tc.desc      toggleExpanded(current="x_1", name="x_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0231 begin`);
      const actual: string = toggleExpanded('x_1', 'x_1');
      logInfo(`toggleExpanded(current="x_1", name="x_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0231 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0232
     * @tc.name      Location_ToggleExpanded_0232
     * @tc.desc      toggleExpanded(current="x_1", name=" Hello ") returns " Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0232 begin`);
      const actual: string = toggleExpanded('x_1', ' Hello ');
      logInfo(`toggleExpanded(current="x_1", name=" Hell...: actual=${actual}`);
      expect(actual).assertEqual(' Hello ');
      logInfo(`${BUNDLE}ToggleExpanded_0232 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0233
     * @tc.name      Location_ToggleExpanded_0233
     * @tc.desc      toggleExpanded(current="x_1", name="HelloHello") returns "HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0233 begin`);
      const actual: string = toggleExpanded('x_1', 'HelloHello');
      logInfo(`toggleExpanded(current="x_1", name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('HelloHello');
      logInfo(`${BUNDLE}ToggleExpanded_0233 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0234
     * @tc.name      Location_ToggleExpanded_0234
     * @tc.desc      toggleExpanded(current="x_1", name="Hello_1") returns "Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0234 begin`);
      const actual: string = toggleExpanded('x_1', 'Hello_1');
      logInfo(`toggleExpanded(current="x_1", name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('Hello_1');
      logInfo(`${BUNDLE}ToggleExpanded_0234 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0235
     * @tc.name      Location_ToggleExpanded_0235
     * @tc.desc      toggleExpanded(current="x_1", name="xHello") returns "xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0235 begin`);
      const actual: string = toggleExpanded('x_1', 'xHello');
      logInfo(`toggleExpanded(current="x_1", name="xHello"): actual=${actual}`);
      expect(actual).assertEqual('xHello');
      logInfo(`${BUNDLE}ToggleExpanded_0235 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0236
     * @tc.name      Location_ToggleExpanded_0236
     * @tc.desc      toggleExpanded(current="x_1", name=" hello world ") returns " hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0236 begin`);
      const actual: string = toggleExpanded('x_1', ' hello world ');
      logInfo(`toggleExpanded(current="x_1", name=" hell...: actual=${actual}`);
      expect(actual).assertEqual(' hello world ');
      logInfo(`${BUNDLE}ToggleExpanded_0236 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0237
     * @tc.name      Location_ToggleExpanded_0237
     * @tc.desc      toggleExpanded(current="x_1", name="hello worldhello world") returns "hello worldhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0237 begin`);
      const actual: string = toggleExpanded('x_1', 'hello worldhello world');
      logInfo(`toggleExpanded(current="x_1", name="hello...: actual=${actual}`);
      expect(actual).assertEqual('hello worldhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0237 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0238
     * @tc.name      Location_ToggleExpanded_0238
     * @tc.desc      toggleExpanded(current="x_1", name="hello world_1") returns "hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0238 begin`);
      const actual: string = toggleExpanded('x_1', 'hello world_1');
      logInfo(`toggleExpanded(current="x_1", name="hello...: actual=${actual}`);
      expect(actual).assertEqual('hello world_1');
      logInfo(`${BUNDLE}ToggleExpanded_0238 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0239
     * @tc.name      Location_ToggleExpanded_0239
     * @tc.desc      toggleExpanded(current="x_1", name="xhello world") returns "xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0239 begin`);
      const actual: string = toggleExpanded('x_1', 'xhello world');
      logInfo(`toggleExpanded(current="x_1", name="xhell...: actual=${actual}`);
      expect(actual).assertEqual('xhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0239 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0240
     * @tc.name      Location_ToggleExpanded_0240
     * @tc.desc      toggleExpanded(current="x_1", name="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0240 begin`);
      const actual: string = toggleExpanded('x_1', '   ');
      logInfo(`toggleExpanded(current="x_1", name="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}ToggleExpanded_0240 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0241
     * @tc.name      Location_ToggleExpanded_0241
     * @tc.desc      toggleExpanded(current=" a ", name="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0241 begin`);
      const actual: string = toggleExpanded(' a ', '');
      logInfo(`toggleExpanded(current=" a ", name=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0241 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0242
     * @tc.name      Location_ToggleExpanded_0242
     * @tc.desc      toggleExpanded(current=" a ", name="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0242 begin`);
      const actual: string = toggleExpanded(' a ', 'x');
      logInfo(`toggleExpanded(current=" a ", name="x"): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}ToggleExpanded_0242 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0243
     * @tc.name      Location_ToggleExpanded_0243
     * @tc.desc      toggleExpanded(current=" a ", name="Hello") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0243 begin`);
      const actual: string = toggleExpanded(' a ', 'Hello');
      logInfo(`toggleExpanded(current=" a ", name="Hello"): actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}ToggleExpanded_0243 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0244
     * @tc.name      Location_ToggleExpanded_0244
     * @tc.desc      toggleExpanded(current=" a ", name="hello world") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0244 begin`);
      const actual: string = toggleExpanded(' a ', 'hello world');
      logInfo(`toggleExpanded(current=" a ", name="hello...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}ToggleExpanded_0244 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0245
     * @tc.name      Location_ToggleExpanded_0245
     * @tc.desc      toggleExpanded(current=" a ", name=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0245 begin`);
      const actual: string = toggleExpanded(' a ', ' ');
      logInfo(`toggleExpanded(current=" a ", name=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}ToggleExpanded_0245 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0246
     * @tc.name      Location_ToggleExpanded_0246
     * @tc.desc      toggleExpanded(current=" a ", name="A") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0246 begin`);
      const actual: string = toggleExpanded(' a ', 'A');
      logInfo(`toggleExpanded(current=" a ", name="A"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}ToggleExpanded_0246 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0247
     * @tc.name      Location_ToggleExpanded_0247
     * @tc.desc      toggleExpanded(current=" a ", name="Sample Title 123") returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0247 begin`);
      const actual: string = toggleExpanded(' a ', 'Sample Title 123');
      logInfo(`toggleExpanded(current=" a ", name="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}ToggleExpanded_0247 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0248
     * @tc.name      Location_ToggleExpanded_0248
     * @tc.desc      toggleExpanded(current=" a ", name="??") returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0248 begin`);
      const actual: string = toggleExpanded(' a ', '\u4e2d\u6587');
      logInfo(`toggleExpanded(current=" a ", name="??"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}ToggleExpanded_0248 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0249
     * @tc.name      Location_ToggleExpanded_0249
     * @tc.desc      toggleExpanded(current=" a ", name="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0249 begin`);
      const actual: string = toggleExpanded(' a ', 'a');
      logInfo(`toggleExpanded(current=" a ", name="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}ToggleExpanded_0249 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0250
     * @tc.name      Location_ToggleExpanded_0250
     * @tc.desc      toggleExpanded(current=" a ", name="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0250 begin`);
      const actual: string = toggleExpanded(' a ', 'abc');
      logInfo(`toggleExpanded(current=" a ", name="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}ToggleExpanded_0250 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0251
     * @tc.name      Location_ToggleExpanded_0251
     * @tc.desc      toggleExpanded(current=" a ", name="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0251 begin`);
      const actual: string = toggleExpanded(' a ', 'Hello World');
      logInfo(`toggleExpanded(current=" a ", name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}ToggleExpanded_0251 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0252
     * @tc.name      Location_ToggleExpanded_0252
     * @tc.desc      toggleExpanded(current=" a ", name="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0252 begin`);
      const actual: string = toggleExpanded(' a ', '123');
      logInfo(`toggleExpanded(current=" a ", name="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}ToggleExpanded_0252 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0253
     * @tc.name      Location_ToggleExpanded_0253
     * @tc.desc      toggleExpanded(current=" a ", name=" x ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0253 begin`);
      const actual: string = toggleExpanded(' a ', ' x ');
      logInfo(`toggleExpanded(current=" a ", name=" x "): actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}ToggleExpanded_0253 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0254
     * @tc.name      Location_ToggleExpanded_0254
     * @tc.desc      toggleExpanded(current=" a ", name="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0254 begin`);
      const actual: string = toggleExpanded(' a ', 'xx');
      logInfo(`toggleExpanded(current=" a ", name="xx"): actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}ToggleExpanded_0254 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0255
     * @tc.name      Location_ToggleExpanded_0255
     * @tc.desc      toggleExpanded(current=" a ", name="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0255 begin`);
      const actual: string = toggleExpanded(' a ', 'x_1');
      logInfo(`toggleExpanded(current=" a ", name="x_1"): actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}ToggleExpanded_0255 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0256
     * @tc.name      Location_ToggleExpanded_0256
     * @tc.desc      toggleExpanded(current=" a ", name=" Hello ") returns " Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0256 begin`);
      const actual: string = toggleExpanded(' a ', ' Hello ');
      logInfo(`toggleExpanded(current=" a ", name=" Hell...: actual=${actual}`);
      expect(actual).assertEqual(' Hello ');
      logInfo(`${BUNDLE}ToggleExpanded_0256 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0257
     * @tc.name      Location_ToggleExpanded_0257
     * @tc.desc      toggleExpanded(current=" a ", name="HelloHello") returns "HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0257 begin`);
      const actual: string = toggleExpanded(' a ', 'HelloHello');
      logInfo(`toggleExpanded(current=" a ", name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('HelloHello');
      logInfo(`${BUNDLE}ToggleExpanded_0257 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0258
     * @tc.name      Location_ToggleExpanded_0258
     * @tc.desc      toggleExpanded(current=" a ", name="Hello_1") returns "Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0258 begin`);
      const actual: string = toggleExpanded(' a ', 'Hello_1');
      logInfo(`toggleExpanded(current=" a ", name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('Hello_1');
      logInfo(`${BUNDLE}ToggleExpanded_0258 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0259
     * @tc.name      Location_ToggleExpanded_0259
     * @tc.desc      toggleExpanded(current=" a ", name="xHello") returns "xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0259 begin`);
      const actual: string = toggleExpanded(' a ', 'xHello');
      logInfo(`toggleExpanded(current=" a ", name="xHello"): actual=${actual}`);
      expect(actual).assertEqual('xHello');
      logInfo(`${BUNDLE}ToggleExpanded_0259 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0260
     * @tc.name      Location_ToggleExpanded_0260
     * @tc.desc      toggleExpanded(current=" a ", name=" hello world ") returns " hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0260 begin`);
      const actual: string = toggleExpanded(' a ', ' hello world ');
      logInfo(`toggleExpanded(current=" a ", name=" hell...: actual=${actual}`);
      expect(actual).assertEqual(' hello world ');
      logInfo(`${BUNDLE}ToggleExpanded_0260 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0261
     * @tc.name      Location_ToggleExpanded_0261
     * @tc.desc      toggleExpanded(current=" a ", name="hello worldhello world") returns "hello worldhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0261 begin`);
      const actual: string = toggleExpanded(' a ', 'hello worldhello world');
      logInfo(`toggleExpanded(current=" a ", name="hello...: actual=${actual}`);
      expect(actual).assertEqual('hello worldhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0261 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0262
     * @tc.name      Location_ToggleExpanded_0262
     * @tc.desc      toggleExpanded(current=" a ", name="hello world_1") returns "hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0262 begin`);
      const actual: string = toggleExpanded(' a ', 'hello world_1');
      logInfo(`toggleExpanded(current=" a ", name="hello...: actual=${actual}`);
      expect(actual).assertEqual('hello world_1');
      logInfo(`${BUNDLE}ToggleExpanded_0262 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0263
     * @tc.name      Location_ToggleExpanded_0263
     * @tc.desc      toggleExpanded(current=" a ", name="xhello world") returns "xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0263 begin`);
      const actual: string = toggleExpanded(' a ', 'xhello world');
      logInfo(`toggleExpanded(current=" a ", name="xhell...: actual=${actual}`);
      expect(actual).assertEqual('xhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0263 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0264
     * @tc.name      Location_ToggleExpanded_0264
     * @tc.desc      toggleExpanded(current=" a ", name="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0264 begin`);
      const actual: string = toggleExpanded(' a ', '   ');
      logInfo(`toggleExpanded(current=" a ", name="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}ToggleExpanded_0264 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0265
     * @tc.name      Location_ToggleExpanded_0265
     * @tc.desc      toggleExpanded(current="aa", name="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0265 begin`);
      const actual: string = toggleExpanded('aa', '');
      logInfo(`toggleExpanded(current="aa", name=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0265 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0266
     * @tc.name      Location_ToggleExpanded_0266
     * @tc.desc      toggleExpanded(current="aa", name="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0266 begin`);
      const actual: string = toggleExpanded('aa', 'x');
      logInfo(`toggleExpanded(current="aa", name="x"): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}ToggleExpanded_0266 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0267
     * @tc.name      Location_ToggleExpanded_0267
     * @tc.desc      toggleExpanded(current="aa", name="Hello") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0267 begin`);
      const actual: string = toggleExpanded('aa', 'Hello');
      logInfo(`toggleExpanded(current="aa", name="Hello"): actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}ToggleExpanded_0267 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0268
     * @tc.name      Location_ToggleExpanded_0268
     * @tc.desc      toggleExpanded(current="aa", name="hello world") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0268 begin`);
      const actual: string = toggleExpanded('aa', 'hello world');
      logInfo(`toggleExpanded(current="aa", name="hello ...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}ToggleExpanded_0268 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0269
     * @tc.name      Location_ToggleExpanded_0269
     * @tc.desc      toggleExpanded(current="aa", name=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0269 begin`);
      const actual: string = toggleExpanded('aa', ' ');
      logInfo(`toggleExpanded(current="aa", name=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}ToggleExpanded_0269 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0270
     * @tc.name      Location_ToggleExpanded_0270
     * @tc.desc      toggleExpanded(current="aa", name="A") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0270 begin`);
      const actual: string = toggleExpanded('aa', 'A');
      logInfo(`toggleExpanded(current="aa", name="A"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}ToggleExpanded_0270 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0271
     * @tc.name      Location_ToggleExpanded_0271
     * @tc.desc      toggleExpanded(current="aa", name="Sample Title 123") returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0271 begin`);
      const actual: string = toggleExpanded('aa', 'Sample Title 123');
      logInfo(`toggleExpanded(current="aa", name="Sample...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}ToggleExpanded_0271 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0272
     * @tc.name      Location_ToggleExpanded_0272
     * @tc.desc      toggleExpanded(current="aa", name="??") returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0272 begin`);
      const actual: string = toggleExpanded('aa', '\u4e2d\u6587');
      logInfo(`toggleExpanded(current="aa", name="??"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}ToggleExpanded_0272 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0273
     * @tc.name      Location_ToggleExpanded_0273
     * @tc.desc      toggleExpanded(current="aa", name="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0273 begin`);
      const actual: string = toggleExpanded('aa', 'a');
      logInfo(`toggleExpanded(current="aa", name="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}ToggleExpanded_0273 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0274
     * @tc.name      Location_ToggleExpanded_0274
     * @tc.desc      toggleExpanded(current="aa", name="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0274 begin`);
      const actual: string = toggleExpanded('aa', 'abc');
      logInfo(`toggleExpanded(current="aa", name="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}ToggleExpanded_0274 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0275
     * @tc.name      Location_ToggleExpanded_0275
     * @tc.desc      toggleExpanded(current="aa", name="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0275 begin`);
      const actual: string = toggleExpanded('aa', 'Hello World');
      logInfo(`toggleExpanded(current="aa", name="Hello ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}ToggleExpanded_0275 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0276
     * @tc.name      Location_ToggleExpanded_0276
     * @tc.desc      toggleExpanded(current="aa", name="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0276 begin`);
      const actual: string = toggleExpanded('aa', '123');
      logInfo(`toggleExpanded(current="aa", name="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}ToggleExpanded_0276 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0277
     * @tc.name      Location_ToggleExpanded_0277
     * @tc.desc      toggleExpanded(current="aa", name=" x ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0277 begin`);
      const actual: string = toggleExpanded('aa', ' x ');
      logInfo(`toggleExpanded(current="aa", name=" x "): actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}ToggleExpanded_0277 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0278
     * @tc.name      Location_ToggleExpanded_0278
     * @tc.desc      toggleExpanded(current="aa", name="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0278 begin`);
      const actual: string = toggleExpanded('aa', 'xx');
      logInfo(`toggleExpanded(current="aa", name="xx"): actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}ToggleExpanded_0278 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0279
     * @tc.name      Location_ToggleExpanded_0279
     * @tc.desc      toggleExpanded(current="aa", name="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0279 begin`);
      const actual: string = toggleExpanded('aa', 'x_1');
      logInfo(`toggleExpanded(current="aa", name="x_1"): actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}ToggleExpanded_0279 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0280
     * @tc.name      Location_ToggleExpanded_0280
     * @tc.desc      toggleExpanded(current="aa", name=" Hello ") returns " Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0280 begin`);
      const actual: string = toggleExpanded('aa', ' Hello ');
      logInfo(`toggleExpanded(current="aa", name=" Hello "): actual=${actual}`);
      expect(actual).assertEqual(' Hello ');
      logInfo(`${BUNDLE}ToggleExpanded_0280 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0281
     * @tc.name      Location_ToggleExpanded_0281
     * @tc.desc      toggleExpanded(current="aa", name="HelloHello") returns "HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0281 begin`);
      const actual: string = toggleExpanded('aa', 'HelloHello');
      logInfo(`toggleExpanded(current="aa", name="HelloH...: actual=${actual}`);
      expect(actual).assertEqual('HelloHello');
      logInfo(`${BUNDLE}ToggleExpanded_0281 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0282
     * @tc.name      Location_ToggleExpanded_0282
     * @tc.desc      toggleExpanded(current="aa", name="Hello_1") returns "Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0282 begin`);
      const actual: string = toggleExpanded('aa', 'Hello_1');
      logInfo(`toggleExpanded(current="aa", name="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('Hello_1');
      logInfo(`${BUNDLE}ToggleExpanded_0282 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0283
     * @tc.name      Location_ToggleExpanded_0283
     * @tc.desc      toggleExpanded(current="aa", name="xHello") returns "xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0283 begin`);
      const actual: string = toggleExpanded('aa', 'xHello');
      logInfo(`toggleExpanded(current="aa", name="xHello"): actual=${actual}`);
      expect(actual).assertEqual('xHello');
      logInfo(`${BUNDLE}ToggleExpanded_0283 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0284
     * @tc.name      Location_ToggleExpanded_0284
     * @tc.desc      toggleExpanded(current="aa", name=" hello world ") returns " hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0284 begin`);
      const actual: string = toggleExpanded('aa', ' hello world ');
      logInfo(`toggleExpanded(current="aa", name=" hello...: actual=${actual}`);
      expect(actual).assertEqual(' hello world ');
      logInfo(`${BUNDLE}ToggleExpanded_0284 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0285
     * @tc.name      Location_ToggleExpanded_0285
     * @tc.desc      toggleExpanded(current="aa", name="hello worldhello world") returns "hello worldhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0285 begin`);
      const actual: string = toggleExpanded('aa', 'hello worldhello world');
      logInfo(`toggleExpanded(current="aa", name="hello ...: actual=${actual}`);
      expect(actual).assertEqual('hello worldhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0285 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0286
     * @tc.name      Location_ToggleExpanded_0286
     * @tc.desc      toggleExpanded(current="aa", name="hello world_1") returns "hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0286 begin`);
      const actual: string = toggleExpanded('aa', 'hello world_1');
      logInfo(`toggleExpanded(current="aa", name="hello ...: actual=${actual}`);
      expect(actual).assertEqual('hello world_1');
      logInfo(`${BUNDLE}ToggleExpanded_0286 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0287
     * @tc.name      Location_ToggleExpanded_0287
     * @tc.desc      toggleExpanded(current="aa", name="xhello world") returns "xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0287 begin`);
      const actual: string = toggleExpanded('aa', 'xhello world');
      logInfo(`toggleExpanded(current="aa", name="xhello...: actual=${actual}`);
      expect(actual).assertEqual('xhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0287 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0288
     * @tc.name      Location_ToggleExpanded_0288
     * @tc.desc      toggleExpanded(current="aa", name="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0288 begin`);
      const actual: string = toggleExpanded('aa', '   ');
      logInfo(`toggleExpanded(current="aa", name="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}ToggleExpanded_0288 end`);
    });
  });
}
