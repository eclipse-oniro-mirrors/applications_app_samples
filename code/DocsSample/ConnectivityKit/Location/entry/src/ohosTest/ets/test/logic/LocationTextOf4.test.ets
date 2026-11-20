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

/** Logic checks for locationTextOf (43 cases). */
export default function locationTextOf4Test(): void {
  describe('LocationTextOf4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0289
     * @tc.name      Location_LocationTextOf_0289
     * @tc.desc      locationTextOf(currentLocation="a_1", city="") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Location_LocationTextOf_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}LocationTextOf_0289 begin`);
      const actual: string = locationTextOf('a_1', '');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0289 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0290
     * @tc.name      Location_LocationTextOf_0290
     * @tc.desc      locationTextOf(currentLocation="a_1", city="x") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0290 begin`);
      const actual: string = locationTextOf('a_1', 'x');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0290 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0291
     * @tc.name      Location_LocationTextOf_0291
     * @tc.desc      locationTextOf(currentLocation="a_1", city="a") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0291 begin`);
      const actual: string = locationTextOf('a_1', 'a');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0291 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0292
     * @tc.name      Location_LocationTextOf_0292
     * @tc.desc      locationTextOf(currentLocation="a_1", city="abc") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0292 begin`);
      const actual: string = locationTextOf('a_1', 'abc');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0292 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0293
     * @tc.name      Location_LocationTextOf_0293
     * @tc.desc      locationTextOf(currentLocation="a_1", city="Hello World") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0293 begin`);
      const actual: string = locationTextOf('a_1', 'Hello World');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0293 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0294
     * @tc.name      Location_LocationTextOf_0294
     * @tc.desc      locationTextOf(currentLocation="a_1", city=" ") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0294 begin`);
      const actual: string = locationTextOf('a_1', ' ');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0294 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0295
     * @tc.name      Location_LocationTextOf_0295
     * @tc.desc      locationTextOf(currentLocation="a_1", city="123") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0295 begin`);
      const actual: string = locationTextOf('a_1', '123');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0295 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0296
     * @tc.name      Location_LocationTextOf_0296
     * @tc.desc      locationTextOf(currentLocation="a_1", city=" x ") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0296 begin`);
      const actual: string = locationTextOf('a_1', ' x ');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0296 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0297
     * @tc.name      Location_LocationTextOf_0297
     * @tc.desc      locationTextOf(currentLocation="a_1", city="xx") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0297 begin`);
      const actual: string = locationTextOf('a_1', 'xx');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0297 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0298
     * @tc.name      Location_LocationTextOf_0298
     * @tc.desc      locationTextOf(currentLocation="a_1", city="x_1") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0298 begin`);
      const actual: string = locationTextOf('a_1', 'x_1');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0298 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0299
     * @tc.name      Location_LocationTextOf_0299
     * @tc.desc      locationTextOf(currentLocation="a_1", city=" a ") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0299 begin`);
      const actual: string = locationTextOf('a_1', ' a ');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0299 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0300
     * @tc.name      Location_LocationTextOf_0300
     * @tc.desc      locationTextOf(currentLocation="a_1", city="aa") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0300 begin`);
      const actual: string = locationTextOf('a_1', 'aa');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0300 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0301
     * @tc.name      Location_LocationTextOf_0301
     * @tc.desc      locationTextOf(currentLocation="a_1", city="a_1") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0301 begin`);
      const actual: string = locationTextOf('a_1', 'a_1');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0301 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0302
     * @tc.name      Location_LocationTextOf_0302
     * @tc.desc      locationTextOf(currentLocation="a_1", city="xa") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0302 begin`);
      const actual: string = locationTextOf('a_1', 'xa');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0302 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0303
     * @tc.name      Location_LocationTextOf_0303
     * @tc.desc      locationTextOf(currentLocation="a_1", city=" abc ") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0303 begin`);
      const actual: string = locationTextOf('a_1', ' abc ');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0303 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0304
     * @tc.name      Location_LocationTextOf_0304
     * @tc.desc      locationTextOf(currentLocation="a_1", city="abcabc") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0304 begin`);
      const actual: string = locationTextOf('a_1', 'abcabc');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0304 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0305
     * @tc.name      Location_LocationTextOf_0305
     * @tc.desc      locationTextOf(currentLocation="a_1", city="abc_1") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0305 begin`);
      const actual: string = locationTextOf('a_1', 'abc_1');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0305 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0306
     * @tc.name      Location_LocationTextOf_0306
     * @tc.desc      locationTextOf(currentLocation="a_1", city="xabc") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0306 begin`);
      const actual: string = locationTextOf('a_1', 'xabc');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0306 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0307
     * @tc.name      Location_LocationTextOf_0307
     * @tc.desc      locationTextOf(currentLocation="a_1", city=" Hello World ") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0307 begin`);
      const actual: string = locationTextOf('a_1', ' Hello World ');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0307 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0308
     * @tc.name      Location_LocationTextOf_0308
     * @tc.desc      locationTextOf(currentLocation="a_1", city="Hello WorldHello World") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0308 begin`);
      const actual: string = locationTextOf('a_1', 'Hello WorldHello World');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0308 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0309
     * @tc.name      Location_LocationTextOf_0309
     * @tc.desc      locationTextOf(currentLocation="a_1", city="Hello World_1") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0309 begin`);
      const actual: string = locationTextOf('a_1', 'Hello World_1');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0309 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0310
     * @tc.name      Location_LocationTextOf_0310
     * @tc.desc      locationTextOf(currentLocation="a_1", city="xHello World") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0310 begin`);
      const actual: string = locationTextOf('a_1', 'xHello World');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0310 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0311
     * @tc.name      Location_LocationTextOf_0311
     * @tc.desc      locationTextOf(currentLocation="a_1", city="   ") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0311 begin`);
      const actual: string = locationTextOf('a_1', '   ');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0311 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0312
     * @tc.name      Location_LocationTextOf_0312
     * @tc.desc      locationTextOf(currentLocation="a_1", city="  ") returns "a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_LocationTextOf_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}LocationTextOf_0312 begin`);
      const actual: string = locationTextOf('a_1', '  ');
      logInfo(`locationTextOf(currentLocation="a_1", cit...: actual=${actual}`);
      expect(actual).assertEqual('a_1');
      logInfo(`${BUNDLE}LocationTextOf_0312 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0313
     * @tc.name      Location_LocationTextOf_0313
     * @tc.desc      locationTextOf(currentLocation="xa", city="") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0313 begin`);
      const actual: string = locationTextOf('xa', '');
      logInfo(`locationTextOf(currentLocation="xa", city...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocationTextOf_0313 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0314
     * @tc.name      Location_LocationTextOf_0314
     * @tc.desc      locationTextOf(currentLocation="xa", city="x") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0314 begin`);
      const actual: string = locationTextOf('xa', 'x');
      logInfo(`locationTextOf(currentLocation="xa", city...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocationTextOf_0314 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0315
     * @tc.name      Location_LocationTextOf_0315
     * @tc.desc      locationTextOf(currentLocation="xa", city="a") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0315 begin`);
      const actual: string = locationTextOf('xa', 'a');
      logInfo(`locationTextOf(currentLocation="xa", city...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocationTextOf_0315 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0316
     * @tc.name      Location_LocationTextOf_0316
     * @tc.desc      locationTextOf(currentLocation="xa", city="abc") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0316 begin`);
      const actual: string = locationTextOf('xa', 'abc');
      logInfo(`locationTextOf(currentLocation="xa", city...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocationTextOf_0316 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0317
     * @tc.name      Location_LocationTextOf_0317
     * @tc.desc      locationTextOf(currentLocation="xa", city="Hello World") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0317 begin`);
      const actual: string = locationTextOf('xa', 'Hello World');
      logInfo(`locationTextOf(currentLocation="xa", city...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocationTextOf_0317 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0318
     * @tc.name      Location_LocationTextOf_0318
     * @tc.desc      locationTextOf(currentLocation="xa", city=" ") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0318 begin`);
      const actual: string = locationTextOf('xa', ' ');
      logInfo(`locationTextOf(currentLocation="xa", city...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocationTextOf_0318 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0319
     * @tc.name      Location_LocationTextOf_0319
     * @tc.desc      locationTextOf(currentLocation="xa", city="123") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0319 begin`);
      const actual: string = locationTextOf('xa', '123');
      logInfo(`locationTextOf(currentLocation="xa", city...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocationTextOf_0319 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0320
     * @tc.name      Location_LocationTextOf_0320
     * @tc.desc      locationTextOf(currentLocation="xa", city=" x ") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0320 begin`);
      const actual: string = locationTextOf('xa', ' x ');
      logInfo(`locationTextOf(currentLocation="xa", city...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocationTextOf_0320 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0321
     * @tc.name      Location_LocationTextOf_0321
     * @tc.desc      locationTextOf(currentLocation="xa", city="xx") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0321 begin`);
      const actual: string = locationTextOf('xa', 'xx');
      logInfo(`locationTextOf(currentLocation="xa", city...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocationTextOf_0321 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0322
     * @tc.name      Location_LocationTextOf_0322
     * @tc.desc      locationTextOf(currentLocation="xa", city="x_1") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0322 begin`);
      const actual: string = locationTextOf('xa', 'x_1');
      logInfo(`locationTextOf(currentLocation="xa", city...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocationTextOf_0322 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0323
     * @tc.name      Location_LocationTextOf_0323
     * @tc.desc      locationTextOf(currentLocation="xa", city=" a ") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0323 begin`);
      const actual: string = locationTextOf('xa', ' a ');
      logInfo(`locationTextOf(currentLocation="xa", city...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocationTextOf_0323 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0324
     * @tc.name      Location_LocationTextOf_0324
     * @tc.desc      locationTextOf(currentLocation="xa", city="aa") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0324 begin`);
      const actual: string = locationTextOf('xa', 'aa');
      logInfo(`locationTextOf(currentLocation="xa", city...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocationTextOf_0324 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0325
     * @tc.name      Location_LocationTextOf_0325
     * @tc.desc      locationTextOf(currentLocation="xa", city="a_1") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0325 begin`);
      const actual: string = locationTextOf('xa', 'a_1');
      logInfo(`locationTextOf(currentLocation="xa", city...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocationTextOf_0325 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0326
     * @tc.name      Location_LocationTextOf_0326
     * @tc.desc      locationTextOf(currentLocation="xa", city="xa") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0326 begin`);
      const actual: string = locationTextOf('xa', 'xa');
      logInfo(`locationTextOf(currentLocation="xa", city...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocationTextOf_0326 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0327
     * @tc.name      Location_LocationTextOf_0327
     * @tc.desc      locationTextOf(currentLocation="xa", city=" abc ") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0327 begin`);
      const actual: string = locationTextOf('xa', ' abc ');
      logInfo(`locationTextOf(currentLocation="xa", city...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocationTextOf_0327 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0328
     * @tc.name      Location_LocationTextOf_0328
     * @tc.desc      locationTextOf(currentLocation="xa", city="abcabc") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0328 begin`);
      const actual: string = locationTextOf('xa', 'abcabc');
      logInfo(`locationTextOf(currentLocation="xa", city...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocationTextOf_0328 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0329
     * @tc.name      Location_LocationTextOf_0329
     * @tc.desc      locationTextOf(currentLocation="xa", city="abc_1") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0329 begin`);
      const actual: string = locationTextOf('xa', 'abc_1');
      logInfo(`locationTextOf(currentLocation="xa", city...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocationTextOf_0329 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0330
     * @tc.name      Location_LocationTextOf_0330
     * @tc.desc      locationTextOf(currentLocation="xa", city="xabc") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0330 begin`);
      const actual: string = locationTextOf('xa', 'xabc');
      logInfo(`locationTextOf(currentLocation="xa", city...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocationTextOf_0330 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_LOCATION_TEXT_OF_0331
     * @tc.name      Location_LocationTextOf_0331
     * @tc.desc      locationTextOf(currentLocation="xa", city=" Hello World ") returns "xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Location_LocationTextOf_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}LocationTextOf_0331 begin`);
      const actual: string = locationTextOf('xa', ' Hello World ');
      logInfo(`locationTextOf(currentLocation="xa", city...: actual=${actual}`);
      expect(actual).assertEqual('xa');
      logInfo(`${BUNDLE}LocationTextOf_0331 end`);
    });
  });
}
