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
export default function locationTextOf3Test(): void {
  describe('LocationTextOf3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0193
     * @tc.name      Location_LocationTextOf_0193
     * @tc.desc      locationTextOf(currentLocation="xx", city="") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0193 begin`);
      const actual: string = locationTextOf('xx', '');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0193 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0194
     * @tc.name      Location_LocationTextOf_0194
     * @tc.desc      locationTextOf(currentLocation="xx", city="x") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0194 begin`);
      const actual: string = locationTextOf('xx', 'x');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0194 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0195
     * @tc.name      Location_LocationTextOf_0195
     * @tc.desc      locationTextOf(currentLocation="xx", city="a") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0195 begin`);
      const actual: string = locationTextOf('xx', 'a');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0195 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0196
     * @tc.name      Location_LocationTextOf_0196
     * @tc.desc      locationTextOf(currentLocation="xx", city="abc") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0196 begin`);
      const actual: string = locationTextOf('xx', 'abc');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0196 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0197
     * @tc.name      Location_LocationTextOf_0197
     * @tc.desc      locationTextOf(currentLocation="xx", city="Hello World") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0197 begin`);
      const actual: string = locationTextOf('xx', 'Hello World');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0197 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0198
     * @tc.name      Location_LocationTextOf_0198
     * @tc.desc      locationTextOf(currentLocation="xx", city=" ") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0198 begin`);
      const actual: string = locationTextOf('xx', ' ');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0198 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0199
     * @tc.name      Location_LocationTextOf_0199
     * @tc.desc      locationTextOf(currentLocation="xx", city="123") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0199 begin`);
      const actual: string = locationTextOf('xx', '123');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0199 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0200
     * @tc.name      Location_LocationTextOf_0200
     * @tc.desc      locationTextOf(currentLocation="xx", city=" x ") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0200 begin`);
      const actual: string = locationTextOf('xx', ' x ');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0200 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0201
     * @tc.name      Location_LocationTextOf_0201
     * @tc.desc      locationTextOf(currentLocation="xx", city="xx") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0201 begin`);
      const actual: string = locationTextOf('xx', 'xx');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0201 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0202
     * @tc.name      Location_LocationTextOf_0202
     * @tc.desc      locationTextOf(currentLocation="xx", city="x_1") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0202 begin`);
      const actual: string = locationTextOf('xx', 'x_1');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0202 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0203
     * @tc.name      Location_LocationTextOf_0203
     * @tc.desc      locationTextOf(currentLocation="xx", city=" a ") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0203 begin`);
      const actual: string = locationTextOf('xx', ' a ');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0203 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0204
     * @tc.name      Location_LocationTextOf_0204
     * @tc.desc      locationTextOf(currentLocation="xx", city="aa") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0204 begin`);
      const actual: string = locationTextOf('xx', 'aa');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0204 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0205
     * @tc.name      Location_LocationTextOf_0205
     * @tc.desc      locationTextOf(currentLocation="xx", city="a_1") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0205 begin`);
      const actual: string = locationTextOf('xx', 'a_1');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0205 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0206
     * @tc.name      Location_LocationTextOf_0206
     * @tc.desc      locationTextOf(currentLocation="xx", city="xa") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0206 begin`);
      const actual: string = locationTextOf('xx', 'xa');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0206 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0207
     * @tc.name      Location_LocationTextOf_0207
     * @tc.desc      locationTextOf(currentLocation="xx", city=" abc ") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0207 begin`);
      const actual: string = locationTextOf('xx', ' abc ');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0207 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0208
     * @tc.name      Location_LocationTextOf_0208
     * @tc.desc      locationTextOf(currentLocation="xx", city="abcabc") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0208 begin`);
      const actual: string = locationTextOf('xx', 'abcabc');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0208 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0209
     * @tc.name      Location_LocationTextOf_0209
     * @tc.desc      locationTextOf(currentLocation="xx", city="abc_1") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0209 begin`);
      const actual: string = locationTextOf('xx', 'abc_1');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0209 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0210
     * @tc.name      Location_LocationTextOf_0210
     * @tc.desc      locationTextOf(currentLocation="xx", city="xabc") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0210 begin`);
      const actual: string = locationTextOf('xx', 'xabc');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0210 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0211
     * @tc.name      Location_LocationTextOf_0211
     * @tc.desc      locationTextOf(currentLocation="xx", city=" Hello World ") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0211 begin`);
      const actual: string = locationTextOf('xx', ' Hello World ');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0211 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0212
     * @tc.name      Location_LocationTextOf_0212
     * @tc.desc      locationTextOf(currentLocation="xx", city="Hello WorldHello World") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0212 begin`);
      const actual: string = locationTextOf('xx', 'Hello WorldHello World');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0212 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0213
     * @tc.name      Location_LocationTextOf_0213
     * @tc.desc      locationTextOf(currentLocation="xx", city="Hello World_1") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0213 begin`);
      const actual: string = locationTextOf('xx', 'Hello World_1');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0213 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0214
     * @tc.name      Location_LocationTextOf_0214
     * @tc.desc      locationTextOf(currentLocation="xx", city="xHello World") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0214 begin`);
      const actual: string = locationTextOf('xx', 'xHello World');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0214 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0215
     * @tc.name      Location_LocationTextOf_0215
     * @tc.desc      locationTextOf(currentLocation="xx", city="   ") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0215 begin`);
      const actual: string = locationTextOf('xx', '   ');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0215 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0216
     * @tc.name      Location_LocationTextOf_0216
     * @tc.desc      locationTextOf(currentLocation="xx", city="  ") returns "xx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0216 begin`);
      const actual: string = locationTextOf('xx', '  ');
      logInfo(`locationTextOf(currentLocation="xx", city...: actual=${actual}`);
      expect(actual).assertEqual('xx');
      logInfo(`${BUNDLE}LocationTextOf_0216 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0217
     * @tc.name      Location_LocationTextOf_0217
     * @tc.desc      locationTextOf(currentLocation="x_1", city="") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0217 begin`);
      const actual: string = locationTextOf('x_1', '');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0217 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0218
     * @tc.name      Location_LocationTextOf_0218
     * @tc.desc      locationTextOf(currentLocation="x_1", city="x") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0218 begin`);
      const actual: string = locationTextOf('x_1', 'x');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0218 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0219
     * @tc.name      Location_LocationTextOf_0219
     * @tc.desc      locationTextOf(currentLocation="x_1", city="a") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0219 begin`);
      const actual: string = locationTextOf('x_1', 'a');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0219 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0220
     * @tc.name      Location_LocationTextOf_0220
     * @tc.desc      locationTextOf(currentLocation="x_1", city="abc") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0220 begin`);
      const actual: string = locationTextOf('x_1', 'abc');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0220 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0221
     * @tc.name      Location_LocationTextOf_0221
     * @tc.desc      locationTextOf(currentLocation="x_1", city="Hello World") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0221 begin`);
      const actual: string = locationTextOf('x_1', 'Hello World');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0221 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0222
     * @tc.name      Location_LocationTextOf_0222
     * @tc.desc      locationTextOf(currentLocation="x_1", city=" ") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0222 begin`);
      const actual: string = locationTextOf('x_1', ' ');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0222 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0223
     * @tc.name      Location_LocationTextOf_0223
     * @tc.desc      locationTextOf(currentLocation="x_1", city="123") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0223 begin`);
      const actual: string = locationTextOf('x_1', '123');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0223 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0224
     * @tc.name      Location_LocationTextOf_0224
     * @tc.desc      locationTextOf(currentLocation="x_1", city=" x ") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0224 begin`);
      const actual: string = locationTextOf('x_1', ' x ');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0224 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0225
     * @tc.name      Location_LocationTextOf_0225
     * @tc.desc      locationTextOf(currentLocation="x_1", city="xx") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0225 begin`);
      const actual: string = locationTextOf('x_1', 'xx');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0225 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0226
     * @tc.name      Location_LocationTextOf_0226
     * @tc.desc      locationTextOf(currentLocation="x_1", city="x_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0226 begin`);
      const actual: string = locationTextOf('x_1', 'x_1');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0226 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0227
     * @tc.name      Location_LocationTextOf_0227
     * @tc.desc      locationTextOf(currentLocation="x_1", city=" a ") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0227 begin`);
      const actual: string = locationTextOf('x_1', ' a ');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0227 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0228
     * @tc.name      Location_LocationTextOf_0228
     * @tc.desc      locationTextOf(currentLocation="x_1", city="aa") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0228 begin`);
      const actual: string = locationTextOf('x_1', 'aa');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0228 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0229
     * @tc.name      Location_LocationTextOf_0229
     * @tc.desc      locationTextOf(currentLocation="x_1", city="a_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0229 begin`);
      const actual: string = locationTextOf('x_1', 'a_1');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0229 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0230
     * @tc.name      Location_LocationTextOf_0230
     * @tc.desc      locationTextOf(currentLocation="x_1", city="xa") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0230 begin`);
      const actual: string = locationTextOf('x_1', 'xa');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0230 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0231
     * @tc.name      Location_LocationTextOf_0231
     * @tc.desc      locationTextOf(currentLocation="x_1", city=" abc ") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0231 begin`);
      const actual: string = locationTextOf('x_1', ' abc ');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0231 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0232
     * @tc.name      Location_LocationTextOf_0232
     * @tc.desc      locationTextOf(currentLocation="x_1", city="abcabc") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0232 begin`);
      const actual: string = locationTextOf('x_1', 'abcabc');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0232 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0233
     * @tc.name      Location_LocationTextOf_0233
     * @tc.desc      locationTextOf(currentLocation="x_1", city="abc_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0233 begin`);
      const actual: string = locationTextOf('x_1', 'abc_1');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0233 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0234
     * @tc.name      Location_LocationTextOf_0234
     * @tc.desc      locationTextOf(currentLocation="x_1", city="xabc") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0234 begin`);
      const actual: string = locationTextOf('x_1', 'xabc');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0234 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0235
     * @tc.name      Location_LocationTextOf_0235
     * @tc.desc      locationTextOf(currentLocation="x_1", city=" Hello World ") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0235 begin`);
      const actual: string = locationTextOf('x_1', ' Hello World ');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0235 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0236
     * @tc.name      Location_LocationTextOf_0236
     * @tc.desc      locationTextOf(currentLocation="x_1", city="Hello WorldHello World") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0236 begin`);
      const actual: string = locationTextOf('x_1', 'Hello WorldHello World');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0236 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0237
     * @tc.name      Location_LocationTextOf_0237
     * @tc.desc      locationTextOf(currentLocation="x_1", city="Hello World_1") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0237 begin`);
      const actual: string = locationTextOf('x_1', 'Hello World_1');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0237 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0238
     * @tc.name      Location_LocationTextOf_0238
     * @tc.desc      locationTextOf(currentLocation="x_1", city="xHello World") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0238 begin`);
      const actual: string = locationTextOf('x_1', 'xHello World');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0238 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0239
     * @tc.name      Location_LocationTextOf_0239
     * @tc.desc      locationTextOf(currentLocation="x_1", city="   ") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0239 begin`);
      const actual: string = locationTextOf('x_1', '   ');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0239 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0240
     * @tc.name      Location_LocationTextOf_0240
     * @tc.desc      locationTextOf(currentLocation="x_1", city="  ") returns "x_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0240 begin`);
      const actual: string = locationTextOf('x_1', '  ');
      logInfo(`locationTextOf(currentLocation="x_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('x_1');
      logInfo(`${BUNDLE}LocationTextOf_0240 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0241
     * @tc.name      Location_LocationTextOf_0241
     * @tc.desc      locationTextOf(currentLocation=" a ", city="") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0241 begin`);
      const actual: string = locationTextOf(' a ', '');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0241 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0242
     * @tc.name      Location_LocationTextOf_0242
     * @tc.desc      locationTextOf(currentLocation=" a ", city="x") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0242 begin`);
      const actual: string = locationTextOf(' a ', 'x');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0242 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0243
     * @tc.name      Location_LocationTextOf_0243
     * @tc.desc      locationTextOf(currentLocation=" a ", city="a") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0243 begin`);
      const actual: string = locationTextOf(' a ', 'a');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0243 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0244
     * @tc.name      Location_LocationTextOf_0244
     * @tc.desc      locationTextOf(currentLocation=" a ", city="abc") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0244 begin`);
      const actual: string = locationTextOf(' a ', 'abc');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0244 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0245
     * @tc.name      Location_LocationTextOf_0245
     * @tc.desc      locationTextOf(currentLocation=" a ", city="Hello World") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0245 begin`);
      const actual: string = locationTextOf(' a ', 'Hello World');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0245 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0246
     * @tc.name      Location_LocationTextOf_0246
     * @tc.desc      locationTextOf(currentLocation=" a ", city=" ") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0246 begin`);
      const actual: string = locationTextOf(' a ', ' ');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0246 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0247
     * @tc.name      Location_LocationTextOf_0247
     * @tc.desc      locationTextOf(currentLocation=" a ", city="123") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0247 begin`);
      const actual: string = locationTextOf(' a ', '123');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0247 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0248
     * @tc.name      Location_LocationTextOf_0248
     * @tc.desc      locationTextOf(currentLocation=" a ", city=" x ") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0248 begin`);
      const actual: string = locationTextOf(' a ', ' x ');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0248 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0249
     * @tc.name      Location_LocationTextOf_0249
     * @tc.desc      locationTextOf(currentLocation=" a ", city="xx") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0249 begin`);
      const actual: string = locationTextOf(' a ', 'xx');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0249 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0250
     * @tc.name      Location_LocationTextOf_0250
     * @tc.desc      locationTextOf(currentLocation=" a ", city="x_1") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0250 begin`);
      const actual: string = locationTextOf(' a ', 'x_1');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0250 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0251
     * @tc.name      Location_LocationTextOf_0251
     * @tc.desc      locationTextOf(currentLocation=" a ", city=" a ") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0251 begin`);
      const actual: string = locationTextOf(' a ', ' a ');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0251 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0252
     * @tc.name      Location_LocationTextOf_0252
     * @tc.desc      locationTextOf(currentLocation=" a ", city="aa") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0252 begin`);
      const actual: string = locationTextOf(' a ', 'aa');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0252 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0253
     * @tc.name      Location_LocationTextOf_0253
     * @tc.desc      locationTextOf(currentLocation=" a ", city="a_1") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0253 begin`);
      const actual: string = locationTextOf(' a ', 'a_1');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0253 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0254
     * @tc.name      Location_LocationTextOf_0254
     * @tc.desc      locationTextOf(currentLocation=" a ", city="xa") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0254 begin`);
      const actual: string = locationTextOf(' a ', 'xa');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0254 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0255
     * @tc.name      Location_LocationTextOf_0255
     * @tc.desc      locationTextOf(currentLocation=" a ", city=" abc ") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0255 begin`);
      const actual: string = locationTextOf(' a ', ' abc ');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0255 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0256
     * @tc.name      Location_LocationTextOf_0256
     * @tc.desc      locationTextOf(currentLocation=" a ", city="abcabc") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0256 begin`);
      const actual: string = locationTextOf(' a ', 'abcabc');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0256 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0257
     * @tc.name      Location_LocationTextOf_0257
     * @tc.desc      locationTextOf(currentLocation=" a ", city="abc_1") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0257 begin`);
      const actual: string = locationTextOf(' a ', 'abc_1');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0257 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0258
     * @tc.name      Location_LocationTextOf_0258
     * @tc.desc      locationTextOf(currentLocation=" a ", city="xabc") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0258 begin`);
      const actual: string = locationTextOf(' a ', 'xabc');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0258 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0259
     * @tc.name      Location_LocationTextOf_0259
     * @tc.desc      locationTextOf(currentLocation=" a ", city=" Hello World ") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0259 begin`);
      const actual: string = locationTextOf(' a ', ' Hello World ');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0259 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0260
     * @tc.name      Location_LocationTextOf_0260
     * @tc.desc      locationTextOf(currentLocation=" a ", city="Hello WorldHello World") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0260 begin`);
      const actual: string = locationTextOf(' a ', 'Hello WorldHello World');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0260 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0261
     * @tc.name      Location_LocationTextOf_0261
     * @tc.desc      locationTextOf(currentLocation=" a ", city="Hello World_1") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0261 begin`);
      const actual: string = locationTextOf(' a ', 'Hello World_1');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0261 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0262
     * @tc.name      Location_LocationTextOf_0262
     * @tc.desc      locationTextOf(currentLocation=" a ", city="xHello World") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0262 begin`);
      const actual: string = locationTextOf(' a ', 'xHello World');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0262 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0263
     * @tc.name      Location_LocationTextOf_0263
     * @tc.desc      locationTextOf(currentLocation=" a ", city="   ") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0263 begin`);
      const actual: string = locationTextOf(' a ', '   ');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0263 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0264
     * @tc.name      Location_LocationTextOf_0264
     * @tc.desc      locationTextOf(currentLocation=" a ", city="  ") returns " a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0264 begin`);
      const actual: string = locationTextOf(' a ', '  ');
      logInfo(`locationTextOf(currentLocation=" a ", cit...: actual=${actual}`);
      expect(actual).assertEqual(' a ');
      logInfo(`${BUNDLE}LocationTextOf_0264 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0265
     * @tc.name      Location_LocationTextOf_0265
     * @tc.desc      locationTextOf(currentLocation="aa", city="") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0265 begin`);
      const actual: string = locationTextOf('aa', '');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0265 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0266
     * @tc.name      Location_LocationTextOf_0266
     * @tc.desc      locationTextOf(currentLocation="aa", city="x") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0266 begin`);
      const actual: string = locationTextOf('aa', 'x');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0266 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0267
     * @tc.name      Location_LocationTextOf_0267
     * @tc.desc      locationTextOf(currentLocation="aa", city="a") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0267 begin`);
      const actual: string = locationTextOf('aa', 'a');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0267 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0268
     * @tc.name      Location_LocationTextOf_0268
     * @tc.desc      locationTextOf(currentLocation="aa", city="abc") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0268 begin`);
      const actual: string = locationTextOf('aa', 'abc');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0268 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0269
     * @tc.name      Location_LocationTextOf_0269
     * @tc.desc      locationTextOf(currentLocation="aa", city="Hello World") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0269 begin`);
      const actual: string = locationTextOf('aa', 'Hello World');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0269 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0270
     * @tc.name      Location_LocationTextOf_0270
     * @tc.desc      locationTextOf(currentLocation="aa", city=" ") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0270 begin`);
      const actual: string = locationTextOf('aa', ' ');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0270 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0271
     * @tc.name      Location_LocationTextOf_0271
     * @tc.desc      locationTextOf(currentLocation="aa", city="123") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0271 begin`);
      const actual: string = locationTextOf('aa', '123');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0271 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0272
     * @tc.name      Location_LocationTextOf_0272
     * @tc.desc      locationTextOf(currentLocation="aa", city=" x ") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0272 begin`);
      const actual: string = locationTextOf('aa', ' x ');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0272 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0273
     * @tc.name      Location_LocationTextOf_0273
     * @tc.desc      locationTextOf(currentLocation="aa", city="xx") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0273 begin`);
      const actual: string = locationTextOf('aa', 'xx');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0273 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0274
     * @tc.name      Location_LocationTextOf_0274
     * @tc.desc      locationTextOf(currentLocation="aa", city="x_1") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0274 begin`);
      const actual: string = locationTextOf('aa', 'x_1');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0274 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0275
     * @tc.name      Location_LocationTextOf_0275
     * @tc.desc      locationTextOf(currentLocation="aa", city=" a ") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0275 begin`);
      const actual: string = locationTextOf('aa', ' a ');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0275 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0276
     * @tc.name      Location_LocationTextOf_0276
     * @tc.desc      locationTextOf(currentLocation="aa", city="aa") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0276 begin`);
      const actual: string = locationTextOf('aa', 'aa');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0276 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0277
     * @tc.name      Location_LocationTextOf_0277
     * @tc.desc      locationTextOf(currentLocation="aa", city="a_1") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0277 begin`);
      const actual: string = locationTextOf('aa', 'a_1');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0277 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0278
     * @tc.name      Location_LocationTextOf_0278
     * @tc.desc      locationTextOf(currentLocation="aa", city="xa") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0278 begin`);
      const actual: string = locationTextOf('aa', 'xa');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0278 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0279
     * @tc.name      Location_LocationTextOf_0279
     * @tc.desc      locationTextOf(currentLocation="aa", city=" abc ") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0279 begin`);
      const actual: string = locationTextOf('aa', ' abc ');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0279 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0280
     * @tc.name      Location_LocationTextOf_0280
     * @tc.desc      locationTextOf(currentLocation="aa", city="abcabc") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0280 begin`);
      const actual: string = locationTextOf('aa', 'abcabc');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0280 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0281
     * @tc.name      Location_LocationTextOf_0281
     * @tc.desc      locationTextOf(currentLocation="aa", city="abc_1") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0281 begin`);
      const actual: string = locationTextOf('aa', 'abc_1');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0281 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0282
     * @tc.name      Location_LocationTextOf_0282
     * @tc.desc      locationTextOf(currentLocation="aa", city="xabc") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0282 begin`);
      const actual: string = locationTextOf('aa', 'xabc');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0282 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0283
     * @tc.name      Location_LocationTextOf_0283
     * @tc.desc      locationTextOf(currentLocation="aa", city=" Hello World ") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0283 begin`);
      const actual: string = locationTextOf('aa', ' Hello World ');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0283 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0284
     * @tc.name      Location_LocationTextOf_0284
     * @tc.desc      locationTextOf(currentLocation="aa", city="Hello WorldHello World") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0284 begin`);
      const actual: string = locationTextOf('aa', 'Hello WorldHello World');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0284 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0285
     * @tc.name      Location_LocationTextOf_0285
     * @tc.desc      locationTextOf(currentLocation="aa", city="Hello World_1") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0285 begin`);
      const actual: string = locationTextOf('aa', 'Hello World_1');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0285 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0286
     * @tc.name      Location_LocationTextOf_0286
     * @tc.desc      locationTextOf(currentLocation="aa", city="xHello World") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0286 begin`);
      const actual: string = locationTextOf('aa', 'xHello World');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0286 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0287
     * @tc.name      Location_LocationTextOf_0287
     * @tc.desc      locationTextOf(currentLocation="aa", city="   ") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0287 begin`);
      const actual: string = locationTextOf('aa', '   ');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0287 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0288
     * @tc.name      Location_LocationTextOf_0288
     * @tc.desc      locationTextOf(currentLocation="aa", city="  ") returns "aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0288 begin`);
      const actual: string = locationTextOf('aa', '  ');
      logInfo(`locationTextOf(currentLocation="aa", city...: actual=${actual}`);
      expect(actual).assertEqual('aa');
      logInfo(`${BUNDLE}LocationTextOf_0288 end`);
    });
  });
}
