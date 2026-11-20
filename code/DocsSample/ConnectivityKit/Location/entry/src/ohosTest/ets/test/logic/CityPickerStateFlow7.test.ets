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
import { CityPickerState } from '../model/CityPickerLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Location]';
const BUNDLE: string = 'Location_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for CityPickerState flow (12 cases). */
export default function cityPickerStateFlow7Test(): void {
  describe('CityPickerStateFlow7Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0320
     * @tc.name      Location_CityPickerStateFlow_0320
     * @tc.desc      CityPickerState call flow scrollTo > locate > selectGroupItem > selectSubCity > setLastLocation ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0320 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(140);
      logInfo(`step1 scrollTo(140): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['abc', 'abc']);
      logInfo(`step2 locate(["abc", "abc"]): step2=${step2}`);
      expect(step2).assertEqual('abc');
      const step3: string = subject.selectGroupItem(' _1');
      logInfo(`step3 selectGroupItem(" _1"): step3=${step3}`);
      expect(step3).assertEqual(' _1');
      const step4: string = subject.selectSubCity('', 'a_1');
      logInfo(`step4 selectSubCity("", "a_1"): step4=${step4}`);
      expect(step4).assertEqual(' _1');
      subject.setLastLocation(70, -1);
      logInfo(`scrollTo>locate>selectGroupItem>selectSub...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(140);
      logInfo(`scrollTo>locate>selectGroupItem>selectSub...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' _1');
      logInfo(`scrollTo>locate>selectGroupItem>selectSub...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' _1');
      logInfo(`scrollTo>locate>selectGroupItem>selectSub...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('abc');
      logInfo(`scrollTo>locate>selectGroupItem>selectSub...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(70);
      logInfo(`scrollTo>locate>selectGroupItem>selectSub...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateFlow_0320 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0321
     * @tc.name      Location_CityPickerStateFlow_0321
     * @tc.desc      CityPickerState call flow selectGroupItem > selectGroupItem > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0321 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('ltiTwL0V5ck');
      logInfo(`step1 selectGroupItem("ltiTwL0V5ck"): step1=${step1}`);
      expect(step1).assertEqual('ltiTwL0V5ck');
      const step2: string = subject.selectGroupItem('h');
      logInfo(`step2 selectGroupItem("h"): step2=${step2}`);
      expect(step2).assertEqual('h');
      const step3: string = subject.selectSubCity(' _1', 'abcabc');
      logInfo(`step3 selectSubCity(" _1", "abcabc"): step3=${step3}`);
      expect(step3).assertEqual('h');
      logInfo(`selectGroupItem>selectGroupItem>selectSub...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('h');
      logInfo(`selectGroupItem>selectGroupItem>selectSub...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('h');
      logInfo(`${BUNDLE}CityPickerStateFlow_0321 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0322
     * @tc.name      Location_CityPickerStateFlow_0322
     * @tc.desc      CityPickerState call flow selectHeat > locate > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0322 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(-12);
      logInfo(`step1 selectHeat(-12): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step2 locate(["Hello World", "a", " ", "a...: step2=${step2}`);
      expect(step2).assertEqual('Hello World');
      const step3: string = subject.scrollTo(45.84);
      logInfo(`step3 scrollTo(45.84): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`selectHeat>locate>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(45.84, PRECISION);
      logInfo(`selectHeat>locate>scrollTo final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0322 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0323
     * @tc.name      Location_CityPickerStateFlow_0323
     * @tc.desc      CityPickerState call flow selectGroupItem > selectHeat > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0323 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem(' hello world ');
      logInfo(`step1 selectGroupItem(" hello world "): step1=${step1}`);
      expect(step1).assertEqual(' hello world ');
      const step2: string = subject.selectHeat(32.98);
      logInfo(`step2 selectHeat(32.98): step2=${step2}`);
      expect(step2).assertEqual(' hello world ');
      const step3: string = subject.selectSubCity('Hello WorldHello World', ' Hello World ');
      logInfo(`step3 selectSubCity("Hello WorldHello Wor...: step3=${step3}`);
      expect(step3).assertEqual(' hello world ');
      logInfo(`selectGroupItem>selectHeat>selectSubCity ...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' hello world ');
      logInfo(`selectGroupItem>selectHeat>selectSubCity ...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' hello world ');
      logInfo(`${BUNDLE}CityPickerStateFlow_0323 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0324
     * @tc.name      Location_CityPickerStateFlow_0324
     * @tc.desc      CityPickerState call flow scrollTo > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0324 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(-73);
      logInfo(`step1 scrollTo(-73): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['']);
      logInfo(`step2 locate([""]): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`scrollTo>locate final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-73);
      logInfo(`${BUNDLE}CityPickerStateFlow_0324 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0325
     * @tc.name      Location_CityPickerStateFlow_0325
     * @tc.desc      CityPickerState call flow locate > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0325 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step1 locate(["123", " ", "Hello World", ...: step1=${step1}`);
      expect(step1).assertEqual('123');
      const step2: string = subject.scrollTo(105);
      logInfo(`step2 scrollTo(105): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`locate>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(105);
      logInfo(`locate>scrollTo final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`${BUNDLE}CityPickerStateFlow_0325 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0326
     * @tc.name      Location_CityPickerStateFlow_0326
     * @tc.desc      CityPickerState call flow scrollTo > selectSubCity > selectGroupItem > setLastLocation keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0326 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(49.83);
      logInfo(`step1 scrollTo(49.83): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity('Hello World', '  ');
      logInfo(`step2 selectSubCity("Hello World", "  "): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectGroupItem('Sample Title 123_1');
      logInfo(`step3 selectGroupItem("Sample Title 123_1"): step3=${step3}`);
      expect(step3).assertEqual('Sample Title 123_1');
      subject.setLastLocation(105, 0);
      logInfo(`scrollTo>selectSubCity>selectGroupItem>se...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(49.83, PRECISION);
      logInfo(`scrollTo>selectSubCity>selectGroupItem>se...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Sample Title 123_1');
      logInfo(`scrollTo>selectSubCity>selectGroupItem>se...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Sample Title 123_1');
      logInfo(`scrollTo>selectSubCity>selectGroupItem>se...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(105);
      logInfo(`${BUNDLE}CityPickerStateFlow_0326 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0327
     * @tc.name      Location_CityPickerStateFlow_0327
     * @tc.desc      CityPickerState call flow selectHeat > selectGroupItem > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0327 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(-29);
      logInfo(`step1 selectHeat(-29): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('i6ZgL6SJof');
      logInfo(`step2 selectGroupItem("i6ZgL6SJof"): step2=${step2}`);
      expect(step2).assertEqual('i6ZgL6SJof');
      const step3: string = subject.selectHeat(68);
      logInfo(`step3 selectHeat(68): step3=${step3}`);
      expect(step3).assertEqual('i6ZgL6SJof');
      logInfo(`selectHeat>selectGroupItem>selectHeat final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('i6ZgL6SJof');
      logInfo(`selectHeat>selectGroupItem>selectHeat final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('i6ZgL6SJof');
      logInfo(`${BUNDLE}CityPickerStateFlow_0327 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0328
     * @tc.name      Location_CityPickerStateFlow_0328
     * @tc.desc      CityPickerState call flow selectGroupItem > scrollTo > setLastLocation > selectGroupItem keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0328 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem(' abc ');
      logInfo(`step1 selectGroupItem(" abc "): step1=${step1}`);
      expect(step1).assertEqual(' abc ');
      const step2: string = subject.scrollTo(-75);
      logInfo(`step2 scrollTo(-75): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(70, 25);
      const step4: string = subject.selectGroupItem('9');
      logInfo(`step4 selectGroupItem("9"): step4=${step4}`);
      expect(step4).assertEqual('9');
      logInfo(`selectGroupItem>scrollTo>setLastLocation>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-75);
      logInfo(`selectGroupItem>scrollTo>setLastLocation>...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('9');
      logInfo(`selectGroupItem>scrollTo>setLastLocation>...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('9');
      logInfo(`selectGroupItem>scrollTo>setLastLocation>...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(70);
      logInfo(`selectGroupItem>scrollTo>setLastLocation>...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateFlow_0328 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0329
     * @tc.name      Location_CityPickerStateFlow_0329
     * @tc.desc      CityPickerState call flow scrollTo > locate > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0329 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(57);
      logInfo(`step1 scrollTo(57): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['abc', 'abc']);
      logInfo(`step2 locate(["abc", "abc"]): step2=${step2}`);
      expect(step2).assertEqual('abc');
      subject.setLastLocation(65, 10);
      logInfo(`scrollTo>locate>setLastLocation final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(57);
      logInfo(`scrollTo>locate>setLastLocation final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('abc');
      logInfo(`scrollTo>locate>setLastLocation final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(65);
      logInfo(`scrollTo>locate>setLastLocation final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateFlow_0329 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0330
     * @tc.name      Location_CityPickerStateFlow_0330
     * @tc.desc      CityPickerState call flow locate > selectGroupItem > selectHeat > locate > setLastLocation keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0330 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['abc', 'abc']);
      logInfo(`step1 locate(["abc", "abc"]): step1=${step1}`);
      expect(step1).assertEqual('abc');
      const step2: string = subject.selectGroupItem('w0ECjbzt');
      logInfo(`step2 selectGroupItem("w0ECjbzt"): step2=${step2}`);
      expect(step2).assertEqual('w0ECjbzt');
      const step3: string = subject.selectHeat(158);
      logInfo(`step3 selectHeat(158): step3=${step3}`);
      expect(step3).assertEqual('w0ECjbzt');
      const step4: string = subject.locate(['']);
      logInfo(`step4 locate([""]): step4=${step4}`);
      expect(step4).assertEqual('w0ECjbzt');
      subject.setLastLocation(0, 35);
      logInfo(`locate>selectGroupItem>selectHeat>locate>...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('w0ECjbzt');
      logInfo(`locate>selectGroupItem>selectHeat>locate>...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('w0ECjbzt');
      logInfo(`locate>selectGroupItem>selectHeat>locate>...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('abc');
      logInfo(`locate>selectGroupItem>selectHeat>locate>...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(35);
      logInfo(`${BUNDLE}CityPickerStateFlow_0330 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0331
     * @tc.name      Location_CityPickerStateFlow_0331
     * @tc.desc      CityPickerState call flow selectSubCity > selectGroupItem > locate > scrollTo keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0331 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity(' _1', ' 123 ');
      logInfo(`step1 selectSubCity(" _1", " 123 "): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('Sample Title 123');
      logInfo(`step2 selectGroupItem("Sample Title 123"): step2=${step2}`);
      expect(step2).assertEqual('Sample Title 123');
      const step3: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step3 locate(["", "a", "abc", "Hello Worl...: step3=${step3}`);
      expect(step3).assertEqual('Sample Title 123');
      const step4: string = subject.scrollTo(25);
      logInfo(`step4 scrollTo(25): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectSubCity>selectGroupItem>locate>scro...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(25);
      logInfo(`selectSubCity>selectGroupItem>locate>scro...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Sample Title 123');
      logInfo(`selectSubCity>selectGroupItem>locate>scro...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}CityPickerStateFlow_0331 end`);
    });
  });
}
