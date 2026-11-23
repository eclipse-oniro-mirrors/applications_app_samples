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

/** Logic checks for toggleExpanded (43 cases). */
export default function toggleExpanded4Test(): void {
  describe('ToggleExpanded4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0289
     * @tc.name      Location_ToggleExpanded_0289
     * @tc.desc      toggleExpanded(current="a_1", name="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_ToggleExpanded_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0289 begin`);
      const actual: string = toggleExpanded('a_1', '');
      logInfo(`toggleExpanded(current="a_1", name=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0289 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0290
     * @tc.name      Location_ToggleExpanded_0290
     * @tc.desc      toggleExpanded(current="a_1", name="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0290 begin`);
      const actual: string = toggleExpanded('a_1', 'x');
      logInfo(`toggleExpanded(current="a_1", name="x"): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}ToggleExpanded_0290 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0291
     * @tc.name      Location_ToggleExpanded_0291
     * @tc.desc      toggleExpanded(current="a_1", name="Hello") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0291 begin`);
      const actual: string = toggleExpanded('a_1', 'Hello');
      logInfo(`toggleExpanded(current="a_1", name="Hello"): actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}ToggleExpanded_0291 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0292
     * @tc.name      Location_ToggleExpanded_0292
     * @tc.desc      toggleExpanded(current="a_1", name="hello world") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0292 begin`);
      const actual: string = toggleExpanded('a_1', 'hello world');
      logInfo(`toggleExpanded(current="a_1", name="hello...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}ToggleExpanded_0292 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0293
     * @tc.name      Location_ToggleExpanded_0293
     * @tc.desc      toggleExpanded(current="a_1", name=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0293 begin`);
      const actual: string = toggleExpanded('a_1', ' ');
      logInfo(`toggleExpanded(current="a_1", name=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}ToggleExpanded_0293 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0294
     * @tc.name      Location_ToggleExpanded_0294
     * @tc.desc      toggleExpanded(current="a_1", name="A") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0294 begin`);
      const actual: string = toggleExpanded('a_1', 'A');
      logInfo(`toggleExpanded(current="a_1", name="A"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}ToggleExpanded_0294 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0295
     * @tc.name      Location_ToggleExpanded_0295
     * @tc.desc      toggleExpanded(current="a_1", name="Sample Title 123") returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0295 begin`);
      const actual: string = toggleExpanded('a_1', 'Sample Title 123');
      logInfo(`toggleExpanded(current="a_1", name="Sampl...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}ToggleExpanded_0295 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0296
     * @tc.name      Location_ToggleExpanded_0296
     * @tc.desc      toggleExpanded(current="a_1", name="??") returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0296 begin`);
      const actual: string = toggleExpanded('a_1', '\u4e2d\u6587');
      logInfo(`toggleExpanded(current="a_1", name="??"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}ToggleExpanded_0296 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0297
     * @tc.name      Location_ToggleExpanded_0297
     * @tc.desc      toggleExpanded(current="a_1", name="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0297 begin`);
      const actual: string = toggleExpanded('a_1', 'a');
      logInfo(`toggleExpanded(current="a_1", name="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}ToggleExpanded_0297 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0298
     * @tc.name      Location_ToggleExpanded_0298
     * @tc.desc      toggleExpanded(current="a_1", name="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0298 begin`);
      const actual: string = toggleExpanded('a_1', 'abc');
      logInfo(`toggleExpanded(current="a_1", name="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}ToggleExpanded_0298 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0299
     * @tc.name      Location_ToggleExpanded_0299
     * @tc.desc      toggleExpanded(current="a_1", name="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0299 begin`);
      const actual: string = toggleExpanded('a_1', 'Hello World');
      logInfo(`toggleExpanded(current="a_1", name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}ToggleExpanded_0299 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0300
     * @tc.name      Location_ToggleExpanded_0300
     * @tc.desc      toggleExpanded(current="a_1", name="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0300 begin`);
      const actual: string = toggleExpanded('a_1', '123');
      logInfo(`toggleExpanded(current="a_1", name="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}ToggleExpanded_0300 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0301
     * @tc.name      Location_ToggleExpanded_0301
     * @tc.desc      toggleExpanded(current="a_1", name=" x ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0301 begin`);
      const actual: string = toggleExpanded('a_1', ' x ');
      logInfo(`toggleExpanded(current="a_1", name=" x "): actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}ToggleExpanded_0301 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0302
     * @tc.name      Location_ToggleExpanded_0302
     * @tc.desc      toggleExpanded(current="a_1", name="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0302 begin`);
      const actual: string = toggleExpanded('a_1', 'xx');
      logInfo(`toggleExpanded(current="a_1", name="xx"): actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}ToggleExpanded_0302 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0303
     * @tc.name      Location_ToggleExpanded_0303
     * @tc.desc      toggleExpanded(current="a_1", name="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0303 begin`);
      const actual: string = toggleExpanded('a_1', 'x_1');
      logInfo(`toggleExpanded(current="a_1", name="x_1"): actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}ToggleExpanded_0303 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0304
     * @tc.name      Location_ToggleExpanded_0304
     * @tc.desc      toggleExpanded(current="a_1", name=" Hello ") returns " Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0304 begin`);
      const actual: string = toggleExpanded('a_1', ' Hello ');
      logInfo(`toggleExpanded(current="a_1", name=" Hell...: actual=${actual}`);
      expect(actual).assertEqual(' Hello ');
      logInfo(`${BUNDLE}ToggleExpanded_0304 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0305
     * @tc.name      Location_ToggleExpanded_0305
     * @tc.desc      toggleExpanded(current="a_1", name="HelloHello") returns "HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0305 begin`);
      const actual: string = toggleExpanded('a_1', 'HelloHello');
      logInfo(`toggleExpanded(current="a_1", name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('HelloHello');
      logInfo(`${BUNDLE}ToggleExpanded_0305 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0306
     * @tc.name      Location_ToggleExpanded_0306
     * @tc.desc      toggleExpanded(current="a_1", name="Hello_1") returns "Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0306 begin`);
      const actual: string = toggleExpanded('a_1', 'Hello_1');
      logInfo(`toggleExpanded(current="a_1", name="Hello...: actual=${actual}`);
      expect(actual).assertEqual('Hello_1');
      logInfo(`${BUNDLE}ToggleExpanded_0306 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0307
     * @tc.name      Location_ToggleExpanded_0307
     * @tc.desc      toggleExpanded(current="a_1", name="xHello") returns "xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0307 begin`);
      const actual: string = toggleExpanded('a_1', 'xHello');
      logInfo(`toggleExpanded(current="a_1", name="xHello"): actual=${actual}`);
      expect(actual).assertEqual('xHello');
      logInfo(`${BUNDLE}ToggleExpanded_0307 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0308
     * @tc.name      Location_ToggleExpanded_0308
     * @tc.desc      toggleExpanded(current="a_1", name=" hello world ") returns " hello world "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0308 begin`);
      const actual: string = toggleExpanded('a_1', ' hello world ');
      logInfo(`toggleExpanded(current="a_1", name=" hell...: actual=${actual}`);
      expect(actual).assertEqual(' hello world ');
      logInfo(`${BUNDLE}ToggleExpanded_0308 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0309
     * @tc.name      Location_ToggleExpanded_0309
     * @tc.desc      toggleExpanded(current="a_1", name="hello worldhello world") returns "hello worldhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0309 begin`);
      const actual: string = toggleExpanded('a_1', 'hello worldhello world');
      logInfo(`toggleExpanded(current="a_1", name="hello...: actual=${actual}`);
      expect(actual).assertEqual('hello worldhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0309 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0310
     * @tc.name      Location_ToggleExpanded_0310
     * @tc.desc      toggleExpanded(current="a_1", name="hello world_1") returns "hello world_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_ToggleExpanded_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0310 begin`);
      const actual: string = toggleExpanded('a_1', 'hello world_1');
      logInfo(`toggleExpanded(current="a_1", name="hello...: actual=${actual}`);
      expect(actual).assertEqual('hello world_1');
      logInfo(`${BUNDLE}ToggleExpanded_0310 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0311
     * @tc.name      Location_ToggleExpanded_0311
     * @tc.desc      toggleExpanded(current="a_1", name="xhello world") returns "xhello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0311 begin`);
      const actual: string = toggleExpanded('a_1', 'xhello world');
      logInfo(`toggleExpanded(current="a_1", name="xhell...: actual=${actual}`);
      expect(actual).assertEqual('xhello world');
      logInfo(`${BUNDLE}ToggleExpanded_0311 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0312
     * @tc.name      Location_ToggleExpanded_0312
     * @tc.desc      toggleExpanded(current="a_1", name="   ") returns "   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0312 begin`);
      const actual: string = toggleExpanded('a_1', '   ');
      logInfo(`toggleExpanded(current="a_1", name="   "): actual=${actual}`);
      expect(actual).assertEqual('   ');
      logInfo(`${BUNDLE}ToggleExpanded_0312 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0313
     * @tc.name      Location_ToggleExpanded_0313
     * @tc.desc      toggleExpanded(current="xa", name="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0313 begin`);
      const actual: string = toggleExpanded('xa', '');
      logInfo(`toggleExpanded(current="xa", name=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}ToggleExpanded_0313 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0314
     * @tc.name      Location_ToggleExpanded_0314
     * @tc.desc      toggleExpanded(current="xa", name="x") returns "x"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0314 begin`);
      const actual: string = toggleExpanded('xa', 'x');
      logInfo(`toggleExpanded(current="xa", name="x"): actual=${actual}`);
      expect(actual).assertEqual('x');
      logInfo(`${BUNDLE}ToggleExpanded_0314 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0315
     * @tc.name      Location_ToggleExpanded_0315
     * @tc.desc      toggleExpanded(current="xa", name="Hello") returns "Hello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0315 begin`);
      const actual: string = toggleExpanded('xa', 'Hello');
      logInfo(`toggleExpanded(current="xa", name="Hello"): actual=${actual}`);
      expect(actual).assertEqual('Hello');
      logInfo(`${BUNDLE}ToggleExpanded_0315 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0316
     * @tc.name      Location_ToggleExpanded_0316
     * @tc.desc      toggleExpanded(current="xa", name="hello world") returns "hello world"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0316 begin`);
      const actual: string = toggleExpanded('xa', 'hello world');
      logInfo(`toggleExpanded(current="xa", name="hello ...: actual=${actual}`);
      expect(actual).assertEqual('hello world');
      logInfo(`${BUNDLE}ToggleExpanded_0316 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0317
     * @tc.name      Location_ToggleExpanded_0317
     * @tc.desc      toggleExpanded(current="xa", name=" ") returns " "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0317 begin`);
      const actual: string = toggleExpanded('xa', ' ');
      logInfo(`toggleExpanded(current="xa", name=" "): actual=${actual}`);
      expect(actual).assertEqual(' ');
      logInfo(`${BUNDLE}ToggleExpanded_0317 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0318
     * @tc.name      Location_ToggleExpanded_0318
     * @tc.desc      toggleExpanded(current="xa", name="A") returns "A"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0318 begin`);
      const actual: string = toggleExpanded('xa', 'A');
      logInfo(`toggleExpanded(current="xa", name="A"): actual=${actual}`);
      expect(actual).assertEqual('A');
      logInfo(`${BUNDLE}ToggleExpanded_0318 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0319
     * @tc.name      Location_ToggleExpanded_0319
     * @tc.desc      toggleExpanded(current="xa", name="Sample Title 123") returns "Sample Title 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0319 begin`);
      const actual: string = toggleExpanded('xa', 'Sample Title 123');
      logInfo(`toggleExpanded(current="xa", name="Sample...: actual=${actual}`);
      expect(actual).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}ToggleExpanded_0319 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0320
     * @tc.name      Location_ToggleExpanded_0320
     * @tc.desc      toggleExpanded(current="xa", name="??") returns "??"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0320 begin`);
      const actual: string = toggleExpanded('xa', '\u4e2d\u6587');
      logInfo(`toggleExpanded(current="xa", name="??"): actual=${actual}`);
      expect(actual).assertEqual('\u4e2d\u6587');
      logInfo(`${BUNDLE}ToggleExpanded_0320 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0321
     * @tc.name      Location_ToggleExpanded_0321
     * @tc.desc      toggleExpanded(current="xa", name="a") returns "a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0321 begin`);
      const actual: string = toggleExpanded('xa', 'a');
      logInfo(`toggleExpanded(current="xa", name="a"): actual=${actual}`);
      expect(actual).assertEqual('a');
      logInfo(`${BUNDLE}ToggleExpanded_0321 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0322
     * @tc.name      Location_ToggleExpanded_0322
     * @tc.desc      toggleExpanded(current="xa", name="abc") returns "abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0322 begin`);
      const actual: string = toggleExpanded('xa', 'abc');
      logInfo(`toggleExpanded(current="xa", name="abc"): actual=${actual}`);
      expect(actual).assertEqual('abc');
      logInfo(`${BUNDLE}ToggleExpanded_0322 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0323
     * @tc.name      Location_ToggleExpanded_0323
     * @tc.desc      toggleExpanded(current="xa", name="Hello World") returns "Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0323 begin`);
      const actual: string = toggleExpanded('xa', 'Hello World');
      logInfo(`toggleExpanded(current="xa", name="Hello ...: actual=${actual}`);
      expect(actual).assertEqual('Hello World');
      logInfo(`${BUNDLE}ToggleExpanded_0323 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0324
     * @tc.name      Location_ToggleExpanded_0324
     * @tc.desc      toggleExpanded(current="xa", name="123") returns "123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0324 begin`);
      const actual: string = toggleExpanded('xa', '123');
      logInfo(`toggleExpanded(current="xa", name="123"): actual=${actual}`);
      expect(actual).assertEqual('123');
      logInfo(`${BUNDLE}ToggleExpanded_0324 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0325
     * @tc.name      Location_ToggleExpanded_0325
     * @tc.desc      toggleExpanded(current="xa", name=" x ") returns " x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0325 begin`);
      const actual: string = toggleExpanded('xa', ' x ');
      logInfo(`toggleExpanded(current="xa", name=" x "): actual=${actual}`);
      expect(actual).assertEqual(' x ');
      logInfo(`${BUNDLE}ToggleExpanded_0325 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0326
     * @tc.name      Location_ToggleExpanded_0326
     * @tc.desc      toggleExpanded(current="xa", name="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0326 begin`);
      const actual: string = toggleExpanded('xa', 'xx');
      logInfo(`toggleExpanded(current="xa", name="xx"): actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}ToggleExpanded_0326 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0327
     * @tc.name      Location_ToggleExpanded_0327
     * @tc.desc      toggleExpanded(current="xa", name="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0327 begin`);
      const actual: string = toggleExpanded('xa', 'x_1');
      logInfo(`toggleExpanded(current="xa", name="x_1"): actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}ToggleExpanded_0327 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0328
     * @tc.name      Location_ToggleExpanded_0328
     * @tc.desc      toggleExpanded(current="xa", name=" Hello ") returns " Hello "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0328 begin`);
      const actual: string = toggleExpanded('xa', ' Hello ');
      logInfo(`toggleExpanded(current="xa", name=" Hello "): actual=${actual}`);
      expect(actual).assertEqual(' Hello ');
      logInfo(`${BUNDLE}ToggleExpanded_0328 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0329
     * @tc.name      Location_ToggleExpanded_0329
     * @tc.desc      toggleExpanded(current="xa", name="HelloHello") returns "HelloHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0329 begin`);
      const actual: string = toggleExpanded('xa', 'HelloHello');
      logInfo(`toggleExpanded(current="xa", name="HelloH...: actual=${actual}`);
      expect(actual).assertEqual('HelloHello');
      logInfo(`${BUNDLE}ToggleExpanded_0329 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0330
     * @tc.name      Location_ToggleExpanded_0330
     * @tc.desc      toggleExpanded(current="xa", name="Hello_1") returns "Hello_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0330 begin`);
      const actual: string = toggleExpanded('xa', 'Hello_1');
      logInfo(`toggleExpanded(current="xa", name="Hello_1"): actual=${actual}`);
      expect(actual).assertEqual('Hello_1');
      logInfo(`${BUNDLE}ToggleExpanded_0330 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_TOGGLE_EXPANDED_0331
     * @tc.name      Location_ToggleExpanded_0331
     * @tc.desc      toggleExpanded(current="xa", name="xHello") returns "xHello"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_ToggleExpanded_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ToggleExpanded_0331 begin`);
      const actual: string = toggleExpanded('xa', 'xHello');
      logInfo(`toggleExpanded(current="xa", name="xHello"): actual=${actual}`);
      expect(actual).assertEqual('xHello');
      logInfo(`${BUNDLE}ToggleExpanded_0331 end`);
    });
  });
}
