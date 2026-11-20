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

/** Logic checks for CityPickerState flow (53 cases). */
export default function cityPickerStateFlow6Test(): void {
  describe('CityPickerStateFlow6Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0267
     * @tc.name      Location_CityPickerStateFlow_0267
     * @tc.desc      CityPickerState call flow locate > selectGroupItem > selectGroupItem > scrollTo keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0267 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step1 locate(["123", " ", "Hello World", ...: step1=${step1}`);
      expect(step1).assertEqual('123');
      const step2: string = subject.selectGroupItem('nBDuteOzM4Tb');
      logInfo(`step2 selectGroupItem("nBDuteOzM4Tb"): step2=${step2}`);
      expect(step2).assertEqual('nBDuteOzM4Tb');
      const step3: string = subject.selectGroupItem('A');
      logInfo(`step3 selectGroupItem("A"): step3=${step3}`);
      expect(step3).assertEqual('A');
      const step4: string = subject.scrollTo(44.89);
      logInfo(`step4 scrollTo(44.89): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`locate>selectGroupItem>selectGroupItem>sc...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(44.89, PRECISION);
      logInfo(`locate>selectGroupItem>selectGroupItem>sc...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('A');
      logInfo(`locate>selectGroupItem>selectGroupItem>sc...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('A');
      logInfo(`locate>selectGroupItem>selectGroupItem>sc...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`${BUNDLE}CityPickerStateFlow_0267 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0268
     * @tc.name      Location_CityPickerStateFlow_0268
     * @tc.desc      CityPickerState call flow selectSubCity > selectSubCity > scrollTo > scrollTo keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0268 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('xa', '');
      logInfo(`step1 selectSubCity("xa", ""): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity(' 123 ', '');
      logInfo(`step2 selectSubCity(" 123 ", ""): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(54.46);
      logInfo(`step3 scrollTo(54.46): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.scrollTo(110);
      logInfo(`step4 scrollTo(110): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectSubCity>selectSubCity>scrollTo>scro...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(110);
      logInfo(`${BUNDLE}CityPickerStateFlow_0268 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0269
     * @tc.name      Location_CityPickerStateFlow_0269
     * @tc.desc      CityPickerState call flow selectSubCity > scrollTo > scrollTo > selectGroupItem keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0269 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('123', 'x ');
      logInfo(`step1 selectSubCity("123", "x "): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(183);
      logInfo(`step2 scrollTo(183): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(93.65);
      logInfo(`step3 scrollTo(93.65): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectGroupItem('A_1');
      logInfo(`step4 selectGroupItem("A_1"): step4=${step4}`);
      expect(step4).assertEqual('A_1');
      logInfo(`selectSubCity>scrollTo>scrollTo>selectGro...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(93.65, PRECISION);
      logInfo(`selectSubCity>scrollTo>scrollTo>selectGro...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('A_1');
      logInfo(`selectSubCity>scrollTo>scrollTo>selectGro...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('A_1');
      logInfo(`${BUNDLE}CityPickerStateFlow_0269 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0270
     * @tc.name      Location_CityPickerStateFlow_0270
     * @tc.desc      CityPickerState call flow locate > selectGroupItem > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0270 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step1 locate(["Hello World", "a", " ", "a...: step1=${step1}`);
      expect(step1).assertEqual('Hello World');
      const step2: string = subject.selectGroupItem(' hello world ');
      logInfo(`step2 selectGroupItem(" hello world "): step2=${step2}`);
      expect(step2).assertEqual(' hello world ');
      const step3: string = subject.scrollTo(195);
      logInfo(`step3 scrollTo(195): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`locate>selectGroupItem>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(195);
      logInfo(`locate>selectGroupItem>scrollTo final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' hello world ');
      logInfo(`locate>selectGroupItem>scrollTo final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' hello world ');
      logInfo(`locate>selectGroupItem>scrollTo final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0270 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0271
     * @tc.name      Location_CityPickerStateFlow_0271
     * @tc.desc      CityPickerState call flow locate > selectHeat > setLastLocation > setLastLocation > scrollTo kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0271 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate([]);
      logInfo(`step1 locate([]): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(80);
      logInfo(`step2 selectHeat(80): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(0, 2);
      subject.setLastLocation(70, 105);
      const step5: string = subject.scrollTo(97.16);
      logInfo(`step5 scrollTo(97.16): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`locate>selectHeat>setLastLocation>setLast...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(97.16, PRECISION);
      logInfo(`locate>selectHeat>setLastLocation>setLast...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(70);
      logInfo(`locate>selectHeat>setLastLocation>setLast...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(105);
      logInfo(`${BUNDLE}CityPickerStateFlow_0271 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0272
     * @tc.name      Location_CityPickerStateFlow_0272
     * @tc.desc      CityPickerState call flow setLastLocation > selectGroupItem > setLastLocation > locate keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0272 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(30, 0);
      const step2: string = subject.selectGroupItem('J3b');
      logInfo(`step2 selectGroupItem("J3b"): step2=${step2}`);
      expect(step2).assertEqual('J3b');
      subject.setLastLocation(75, 0);
      const step4: string = subject.locate([]);
      logInfo(`step4 locate([]): step4=${step4}`);
      expect(step4).assertEqual('J3b');
      logInfo(`setLastLocation>selectGroupItem>setLastLo...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('J3b');
      logInfo(`setLastLocation>selectGroupItem>setLastLo...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('J3b');
      logInfo(`setLastLocation>selectGroupItem>setLastLo...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(75);
      logInfo(`${BUNDLE}CityPickerStateFlow_0272 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0273
     * @tc.name      Location_CityPickerStateFlow_0273
     * @tc.desc      CityPickerState call flow selectHeat > selectGroupItem > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0273 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(1);
      logInfo(`step1 selectHeat(1): step1=${step1}`);
      expect(step1).assertEqual('\u4e0a\u6d77');
      const step2: string = subject.selectGroupItem('AA');
      logInfo(`step2 selectGroupItem("AA"): step2=${step2}`);
      expect(step2).assertEqual('AA');
      subject.setLastLocation(40, 10);
      logInfo(`selectHeat>selectGroupItem>setLastLocatio...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('AA');
      logInfo(`selectHeat>selectGroupItem>setLastLocatio...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('AA');
      logInfo(`selectHeat>selectGroupItem>setLastLocatio...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(40);
      logInfo(`selectHeat>selectGroupItem>setLastLocatio...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateFlow_0273 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0274
     * @tc.name      Location_CityPickerStateFlow_0274
     * @tc.desc      CityPickerState call flow locate > setLastLocation > locate > setLastLocation keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0274 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step1 locate(["123", " ", "Hello World", ...: step1=${step1}`);
      expect(step1).assertEqual('123');
      subject.setLastLocation(25, 3);
      const step3: string = subject.locate(['abc', 'abc']);
      logInfo(`step3 locate(["abc", "abc"]): step3=${step3}`);
      expect(step3).assertEqual('abc');
      subject.setLastLocation(110, -1);
      logInfo(`locate>setLastLocation>locate>setLastLoca...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('abc');
      logInfo(`locate>setLastLocation>locate>setLastLoca...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(110);
      logInfo(`locate>setLastLocation>locate>setLastLoca...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateFlow_0274 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0275
     * @tc.name      Location_CityPickerStateFlow_0275
     * @tc.desc      CityPickerState call flow setLastLocation > setLastLocation > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0275 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(35, 0);
      subject.setLastLocation(50, 0);
      const step3: string = subject.selectSubCity('Hello WorldHello World', 'Hello WorldHello World');
      logInfo(`step3 selectSubCity("Hello WorldHello Wor...: step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`setLastLocation>setLastLocation>selectSub...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateFlow_0275 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0276
     * @tc.name      Location_CityPickerStateFlow_0276
     * @tc.desc      CityPickerState call flow selectSubCity > selectHeat > setLastLocation > setLastLocation keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0276 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('a', '123');
      logInfo(`step1 selectSubCity("a", "123"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(148);
      logInfo(`step2 selectHeat(148): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(80, 0);
      subject.setLastLocation(65, 10);
      logInfo(`selectSubCity>selectHeat>setLastLocation>...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(65);
      logInfo(`selectSubCity>selectHeat>setLastLocation>...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateFlow_0276 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0277
     * @tc.name      Location_CityPickerStateFlow_0277
     * @tc.desc      CityPickerState call flow selectSubCity > selectHeat > setLastLocation > selectGroupItem keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0277 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('a', 'xabc');
      logInfo(`step1 selectSubCity("a", "xabc"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(59.22);
      logInfo(`step2 selectHeat(59.22): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(110, 40);
      const step4: string = subject.selectGroupItem('x123');
      logInfo(`step4 selectGroupItem("x123"): step4=${step4}`);
      expect(step4).assertEqual('x123');
      logInfo(`selectSubCity>selectHeat>setLastLocation>...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('x123');
      logInfo(`selectSubCity>selectHeat>setLastLocation>...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('x123');
      logInfo(`selectSubCity>selectHeat>setLastLocation>...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(110);
      logInfo(`selectSubCity>selectHeat>setLastLocation>...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(40);
      logInfo(`${BUNDLE}CityPickerStateFlow_0277 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0278
     * @tc.name      Location_CityPickerStateFlow_0278
     * @tc.desc      CityPickerState call flow locate > selectHeat > selectHeat > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0278 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step1 locate(["", "a", "abc", "Hello Worl...: step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(20);
      logInfo(`step2 selectHeat(20): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectHeat(56.56);
      logInfo(`step3 selectHeat(56.56): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.locate(['abc', 'abc']);
      logInfo(`step4 locate(["abc", "abc"]): step4=${step4}`);
      expect(step4).assertEqual('abc');
      logInfo(`locate>selectHeat>selectHeat>locate final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('abc');
      logInfo(`${BUNDLE}CityPickerStateFlow_0278 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0279
     * @tc.name      Location_CityPickerStateFlow_0279
     * @tc.desc      CityPickerState call flow locate > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0279 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['a', '', 'abc']);
      logInfo(`step1 locate(["a", "", "abc"]): step1=${step1}`);
      expect(step1).assertEqual('a');
      const step2: string = subject.scrollTo(0);
      logInfo(`step2 scrollTo(0): step2=${step2}`);
      expect(step2).assertEqual('A');
      logInfo(`locate>scrollTo final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('a');
      logInfo(`${BUNDLE}CityPickerStateFlow_0279 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0280
     * @tc.name      Location_CityPickerStateFlow_0280
     * @tc.desc      CityPickerState call flow selectHeat > locate > selectSubCity > selectHeat > selectGroupItem kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0280 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(-74);
      logInfo(`step1 selectHeat(-74): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['a', '', 'abc']);
      logInfo(`step2 locate(["a", "", "abc"]): step2=${step2}`);
      expect(step2).assertEqual('a');
      const step3: string = subject.selectSubCity('xa', ' _1');
      logInfo(`step3 selectSubCity("xa", " _1"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectHeat(-71);
      logInfo(`step4 selectHeat(-71): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.selectGroupItem('xabc');
      logInfo(`step5 selectGroupItem("xabc"): step5=${step5}`);
      expect(step5).assertEqual('xabc');
      logInfo(`selectHeat>locate>selectSubCity>selectHea...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('xabc');
      logInfo(`selectHeat>locate>selectSubCity>selectHea...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('xabc');
      logInfo(`selectHeat>locate>selectSubCity>selectHea...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('a');
      logInfo(`${BUNDLE}CityPickerStateFlow_0280 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0281
     * @tc.name      Location_CityPickerStateFlow_0281
     * @tc.desc      CityPickerState call flow selectGroupItem > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0281 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('abc_1');
      logInfo(`step1 selectGroupItem("abc_1"): step1=${step1}`);
      expect(step1).assertEqual('abc_1');
      const step2: string = subject.selectHeat(50);
      logInfo(`step2 selectHeat(50): step2=${step2}`);
      expect(step2).assertEqual('abc_1');
      logInfo(`selectGroupItem>selectHeat final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('abc_1');
      logInfo(`selectGroupItem>selectHeat final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('abc_1');
      logInfo(`${BUNDLE}CityPickerStateFlow_0281 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0282
     * @tc.name      Location_CityPickerStateFlow_0282
     * @tc.desc      CityPickerState call flow selectHeat > scrollTo > selectGroupItem > locate > locate keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0282 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(134);
      logInfo(`step1 selectHeat(134): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(19);
      logInfo(`step2 scrollTo(19): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectGroupItem('xa');
      logInfo(`step3 selectGroupItem("xa"): step3=${step3}`);
      expect(step3).assertEqual('xa');
      const step4: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step4 locate(["Hello World", "a", " ", "a...: step4=${step4}`);
      expect(step4).assertEqual('xa');
      const step5: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step5 locate(["", "a", "abc", "Hello Worl...: step5=${step5}`);
      expect(step5).assertEqual('xa');
      logInfo(`selectHeat>scrollTo>selectGroupItem>locat...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(19);
      logInfo(`selectHeat>scrollTo>selectGroupItem>locat...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('xa');
      logInfo(`selectHeat>scrollTo>selectGroupItem>locat...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('xa');
      logInfo(`selectHeat>scrollTo>selectGroupItem>locat...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0282 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0283
     * @tc.name      Location_CityPickerStateFlow_0283
     * @tc.desc      CityPickerState call flow scrollTo > locate > scrollTo > selectHeat > selectSubCity keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0283 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(19.96);
      logInfo(`step1 scrollTo(19.96): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['abc', 'abc']);
      logInfo(`step2 locate(["abc", "abc"]): step2=${step2}`);
      expect(step2).assertEqual('abc');
      const step3: string = subject.scrollTo(97.16);
      logInfo(`step3 scrollTo(97.16): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectHeat(158);
      logInfo(`step4 selectHeat(158): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.selectSubCity(' abc ', '');
      logInfo(`step5 selectSubCity(" abc ", ""): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`scrollTo>locate>scrollTo>selectHeat>selec...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(97.16, PRECISION);
      logInfo(`scrollTo>locate>scrollTo>selectHeat>selec...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('abc');
      logInfo(`${BUNDLE}CityPickerStateFlow_0283 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0284
     * @tc.name      Location_CityPickerStateFlow_0284
     * @tc.desc      CityPickerState call flow setLastLocation > setLastLocation > scrollTo > selectHeat > locate kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0284 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(30, 115);
      subject.setLastLocation(110, 55);
      const step3: string = subject.scrollTo(-42);
      logInfo(`step3 scrollTo(-42): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectHeat(95);
      logInfo(`step4 selectHeat(95): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step5 locate(["123", " ", "Hello World", ...: step5=${step5}`);
      expect(step5).assertEqual('123');
      logInfo(`setLastLocation>setLastLocation>scrollTo>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-42);
      logInfo(`setLastLocation>setLastLocation>scrollTo>...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`setLastLocation>setLastLocation>scrollTo>...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(110);
      logInfo(`setLastLocation>setLastLocation>scrollTo>...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(55);
      logInfo(`${BUNDLE}CityPickerStateFlow_0284 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0285
     * @tc.name      Location_CityPickerStateFlow_0285
     * @tc.desc      CityPickerState call flow selectSubCity > selectSubCity > setLastLocation > selectHeat > selectH...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0285 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('a', 'xabc');
      logInfo(`step1 selectSubCity("a", "xabc"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity(' a ', ' Hello World ');
      logInfo(`step2 selectSubCity(" a ", " Hello World "): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(115, 0);
      const step4: string = subject.selectHeat(20);
      logInfo(`step4 selectHeat(20): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.selectHeat(70);
      logInfo(`step5 selectHeat(70): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`selectSubCity>selectSubCity>setLastLocati...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(115);
      logInfo(`${BUNDLE}CityPickerStateFlow_0285 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0286
     * @tc.name      Location_CityPickerStateFlow_0286
     * @tc.desc      CityPickerState call flow scrollTo > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0286 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(130);
      logInfo(`step1 scrollTo(130): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity('a', '123');
      logInfo(`step2 selectSubCity("a", "123"): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`scrollTo>selectSubCity final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(130);
      logInfo(`${BUNDLE}CityPickerStateFlow_0286 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0287
     * @tc.name      Location_CityPickerStateFlow_0287
     * @tc.desc      CityPickerState call flow setLastLocation > selectSubCity > scrollTo > scrollTo keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0287 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 105);
      const step2: string = subject.selectSubCity('', 'x ');
      logInfo(`step2 selectSubCity("", "x "): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(27);
      logInfo(`step3 scrollTo(27): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.scrollTo(198);
      logInfo(`step4 scrollTo(198): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`setLastLocation>selectSubCity>scrollTo>sc...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(198);
      logInfo(`setLastLocation>selectSubCity>scrollTo>sc...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(105);
      logInfo(`${BUNDLE}CityPickerStateFlow_0287 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0288
     * @tc.name      Location_CityPickerStateFlow_0288
     * @tc.desc      CityPickerState call flow locate > selectGroupItem > selectGroupItem > selectSubCity > setLastLo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0288 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step1 locate(["Hello World", "a", " ", "a...: step1=${step1}`);
      expect(step1).assertEqual('Hello World');
      const step2: string = subject.selectGroupItem('123123');
      logInfo(`step2 selectGroupItem("123123"): step2=${step2}`);
      expect(step2).assertEqual('123123');
      const step3: string = subject.selectGroupItem('nBDuteOzM4Tb');
      logInfo(`step3 selectGroupItem("nBDuteOzM4Tb"): step3=${step3}`);
      expect(step3).assertEqual('nBDuteOzM4Tb');
      const step4: string = subject.selectSubCity('   ', ' abc ');
      logInfo(`step4 selectSubCity("   ", " abc "): step4=${step4}`);
      expect(step4).assertEqual('nBDuteOzM4Tb');
      subject.setLastLocation(0, 50);
      logInfo(`locate>selectGroupItem>selectGroupItem>se...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('nBDuteOzM4Tb');
      logInfo(`locate>selectGroupItem>selectGroupItem>se...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('nBDuteOzM4Tb');
      logInfo(`locate>selectGroupItem>selectGroupItem>se...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`locate>selectGroupItem>selectGroupItem>se...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateFlow_0288 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0289
     * @tc.name      Location_CityPickerStateFlow_0289
     * @tc.desc      CityPickerState call flow selectGroupItem > selectSubCity > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0289 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('Zx8UqEh4Kb');
      logInfo(`step1 selectGroupItem("Zx8UqEh4Kb"): step1=${step1}`);
      expect(step1).assertEqual('Zx8UqEh4Kb');
      const step2: string = subject.selectSubCity('xa', '');
      logInfo(`step2 selectSubCity("xa", ""): step2=${step2}`);
      expect(step2).assertEqual('Zx8UqEh4Kb');
      const step3: string = subject.selectHeat(120);
      logInfo(`step3 selectHeat(120): step3=${step3}`);
      expect(step3).assertEqual('Zx8UqEh4Kb');
      logInfo(`selectGroupItem>selectSubCity>selectHeat ...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Zx8UqEh4Kb');
      logInfo(`selectGroupItem>selectSubCity>selectHeat ...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Zx8UqEh4Kb');
      logInfo(`${BUNDLE}CityPickerStateFlow_0289 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0290
     * @tc.name      Location_CityPickerStateFlow_0290
     * @tc.desc      CityPickerState call flow selectSubCity > setLastLocation > setLastLocation > scrollTo keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0290 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('x ', 'Hello WorldHello World');
      logInfo(`step1 selectSubCity("x ", "Hello WorldHel...: step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(0, 50);
      subject.setLastLocation(40, 0);
      const step4: string = subject.scrollTo(42);
      logInfo(`step4 scrollTo(42): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectSubCity>setLastLocation>setLastLoca...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(42);
      logInfo(`selectSubCity>setLastLocation>setLastLoca...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(40);
      logInfo(`${BUNDLE}CityPickerStateFlow_0290 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0291
     * @tc.name      Location_CityPickerStateFlow_0291
     * @tc.desc      CityPickerState call flow scrollTo > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0291 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(19);
      logInfo(`step1 scrollTo(19): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['']);
      logInfo(`step2 locate([""]): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`scrollTo>locate final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(19);
      logInfo(`${BUNDLE}CityPickerStateFlow_0291 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0292
     * @tc.name      Location_CityPickerStateFlow_0292
     * @tc.desc      CityPickerState call flow selectHeat > selectSubCity > scrollTo > selectGroupItem > selectSubCit...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0292 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(192);
      logInfo(`step1 selectHeat(192): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity('', '123');
      logInfo(`step2 selectSubCity("", "123"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(-70);
      logInfo(`step3 scrollTo(-70): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectGroupItem('x\u4e2d\u6587');
      logInfo(`step4 selectGroupItem("x??"): step4=${step4}`);
      expect(step4).assertEqual('x\u4e2d\u6587');
      const step5: string = subject.selectSubCity('', 'abc');
      logInfo(`step5 selectSubCity("", "abc"): step5=${step5}`);
      expect(step5).assertEqual('x\u4e2d\u6587');
      logInfo(`selectHeat>selectSubCity>scrollTo>selectG...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-70);
      logInfo(`selectHeat>selectSubCity>scrollTo>selectG...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('x\u4e2d\u6587');
      logInfo(`selectHeat>selectSubCity>scrollTo>selectG...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('x\u4e2d\u6587');
      logInfo(`${BUNDLE}CityPickerStateFlow_0292 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0293
     * @tc.name      Location_CityPickerStateFlow_0293
     * @tc.desc      CityPickerState call flow setLastLocation > scrollTo > selectHeat > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0293 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(64.57, 60);
      const step2: string = subject.scrollTo(137);
      logInfo(`step2 scrollTo(137): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectHeat(24);
      logInfo(`step3 selectHeat(24): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.scrollTo(-68);
      logInfo(`step4 scrollTo(-68): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`setLastLocation>scrollTo>selectHeat>scrol...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-68);
      logInfo(`setLastLocation>scrollTo>selectHeat>scrol...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertClose(64.57, PRECISION);
      logInfo(`setLastLocation>scrollTo>selectHeat>scrol...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(60);
      logInfo(`${BUNDLE}CityPickerStateFlow_0293 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0294
     * @tc.name      Location_CityPickerStateFlow_0294
     * @tc.desc      CityPickerState call flow setLastLocation > selectSubCity > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0294 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(110, 0);
      const step2: string = subject.selectSubCity('', ' ');
      logInfo(`step2 selectSubCity("", " "): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectHeat(165);
      logInfo(`step3 selectHeat(165): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`setLastLocation>selectSubCity>selectHeat ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(110);
      logInfo(`${BUNDLE}CityPickerStateFlow_0294 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0295
     * @tc.name      Location_CityPickerStateFlow_0295
     * @tc.desc      CityPickerState call flow selectSubCity > scrollTo > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0295 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('a', 'x ');
      logInfo(`step1 selectSubCity("a", "x "): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(191);
      logInfo(`step2 scrollTo(191): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.locate(['a', '', 'abc']);
      logInfo(`step3 locate(["a", "", "abc"]): step3=${step3}`);
      expect(step3).assertEqual('a');
      logInfo(`selectSubCity>scrollTo>locate final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(191);
      logInfo(`selectSubCity>scrollTo>locate final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('a');
      logInfo(`${BUNDLE}CityPickerStateFlow_0295 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0296
     * @tc.name      Location_CityPickerStateFlow_0296
     * @tc.desc      CityPickerState call flow selectHeat > scrollTo > locate > selectHeat > setLastLocation keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0296 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(75);
      logInfo(`step1 selectHeat(75): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(136);
      logInfo(`step2 scrollTo(136): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step3 locate(["123", " ", "Hello World", ...: step3=${step3}`);
      expect(step3).assertEqual('123');
      const step4: string = subject.selectHeat(100);
      logInfo(`step4 selectHeat(100): step4=${step4}`);
      expect(step4).assertEqual('');
      subject.setLastLocation(115, 0);
      logInfo(`selectHeat>scrollTo>locate>selectHeat>set...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(136);
      logInfo(`selectHeat>scrollTo>locate>selectHeat>set...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`selectHeat>scrollTo>locate>selectHeat>set...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(115);
      logInfo(`${BUNDLE}CityPickerStateFlow_0296 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0297
     * @tc.name      Location_CityPickerStateFlow_0297
     * @tc.desc      CityPickerState call flow scrollTo > selectSubCity > locate > scrollTo > selectSubCity keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0297 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(20);
      logInfo(`step1 scrollTo(20): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity(' _1', 'abcabc');
      logInfo(`step2 selectSubCity(" _1", "abcabc"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step3 locate(["", "a", "abc", "Hello Worl...: step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.scrollTo(-38);
      logInfo(`step4 scrollTo(-38): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.selectSubCity('a_1', 'Hello World');
      logInfo(`step5 selectSubCity("a_1", "Hello World"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`scrollTo>selectSubCity>locate>scrollTo>se...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-38);
      logInfo(`${BUNDLE}CityPickerStateFlow_0297 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0298
     * @tc.name      Location_CityPickerStateFlow_0298
     * @tc.desc      CityPickerState call flow selectSubCity > scrollTo > locate > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0298 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('Hello WorldHello World', 'Hello WorldHello World');
      logInfo(`step1 selectSubCity("Hello WorldHello Wor...: step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(70);
      logInfo(`step2 scrollTo(70): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step3 locate(["", "a", "abc", "Hello Worl...: step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectSubCity('  ', 'xa');
      logInfo(`step4 selectSubCity("  ", "xa"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectSubCity>scrollTo>locate>selectSubCi...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(70);
      logInfo(`${BUNDLE}CityPickerStateFlow_0298 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0299
     * @tc.name      Location_CityPickerStateFlow_0299
     * @tc.desc      CityPickerState call flow scrollTo > scrollTo > selectGroupItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0299 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(5);
      logInfo(`step1 scrollTo(5): step1=${step1}`);
      expect(step1).assertEqual('H');
      const step2: string = subject.scrollTo(132);
      logInfo(`step2 scrollTo(132): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectGroupItem(' hello world ');
      logInfo(`step3 selectGroupItem(" hello world "): step3=${step3}`);
      expect(step3).assertEqual(' hello world ');
      logInfo(`scrollTo>scrollTo>selectGroupItem final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(132);
      logInfo(`scrollTo>scrollTo>selectGroupItem final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' hello world ');
      logInfo(`scrollTo>scrollTo>selectGroupItem final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' hello world ');
      logInfo(`${BUNDLE}CityPickerStateFlow_0299 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0300
     * @tc.name      Location_CityPickerStateFlow_0300
     * @tc.desc      CityPickerState call flow locate > selectHeat > locate > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0300 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['a', '', 'abc']);
      logInfo(`step1 locate(["a", "", "abc"]): step1=${step1}`);
      expect(step1).assertEqual('a');
      const step2: string = subject.selectHeat(-46);
      logInfo(`step2 selectHeat(-46): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.locate(['abc', 'abc']);
      logInfo(`step3 locate(["abc", "abc"]): step3=${step3}`);
      expect(step3).assertEqual('abc');
      const step4: string = subject.scrollTo(0);
      logInfo(`step4 scrollTo(0): step4=${step4}`);
      expect(step4).assertEqual('A');
      logInfo(`locate>selectHeat>locate>scrollTo final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('abc');
      logInfo(`${BUNDLE}CityPickerStateFlow_0300 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0301
     * @tc.name      Location_CityPickerStateFlow_0301
     * @tc.desc      CityPickerState call flow locate > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0301 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step1 locate(["123", " ", "Hello World", ...: step1=${step1}`);
      expect(step1).assertEqual('123');
      const step2: string = subject.selectHeat(-46);
      logInfo(`step2 selectHeat(-46): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`locate>selectHeat final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`${BUNDLE}CityPickerStateFlow_0301 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0302
     * @tc.name      Location_CityPickerStateFlow_0302
     * @tc.desc      CityPickerState call flow locate > selectSubCity > setLastLocation > setLastLocation > selectHea...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0302 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['a', '', 'abc']);
      logInfo(`step1 locate(["a", "", "abc"]): step1=${step1}`);
      expect(step1).assertEqual('a');
      const step2: string = subject.selectSubCity('a', 'x ');
      logInfo(`step2 selectSubCity("a", "x "): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(0, 90);
      subject.setLastLocation(5, 0);
      const step5: string = subject.selectHeat(-60);
      logInfo(`step5 selectHeat(-60): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`locate>selectSubCity>setLastLocation>setL...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('a');
      logInfo(`locate>selectSubCity>setLastLocation>setL...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`${BUNDLE}CityPickerStateFlow_0302 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0303
     * @tc.name      Location_CityPickerStateFlow_0303
     * @tc.desc      CityPickerState call flow selectHeat > scrollTo > selectSubCity > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0303 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(45);
      logInfo(`step1 selectHeat(45): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(81.14);
      logInfo(`step2 scrollTo(81.14): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectSubCity(' abc ', ' _1');
      logInfo(`step3 selectSubCity(" abc ", " _1"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.scrollTo(56);
      logInfo(`step4 scrollTo(56): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectHeat>scrollTo>selectSubCity>scrollT...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(56);
      logInfo(`${BUNDLE}CityPickerStateFlow_0303 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0304
     * @tc.name      Location_CityPickerStateFlow_0304
     * @tc.desc      CityPickerState call flow locate > scrollTo > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0304 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step1 locate(["Hello World", "a", " ", "a...: step1=${step1}`);
      expect(step1).assertEqual('Hello World');
      const step2: string = subject.scrollTo(-70);
      logInfo(`step2 scrollTo(-70): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.locate(['']);
      logInfo(`step3 locate([""]): step3=${step3}`);
      expect(step3).assertEqual('Hello World');
      logInfo(`locate>scrollTo>locate final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-70);
      logInfo(`locate>scrollTo>locate final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0304 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0305
     * @tc.name      Location_CityPickerStateFlow_0305
     * @tc.desc      CityPickerState call flow selectHeat > selectGroupItem > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0305 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(190);
      logInfo(`step1 selectHeat(190): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('O3KVH5QkaaQ');
      logInfo(`step2 selectGroupItem("O3KVH5QkaaQ"): step2=${step2}`);
      expect(step2).assertEqual('O3KVH5QkaaQ');
      const step3: string = subject.locate(['', 'a']);
      logInfo(`step3 locate(["", "a"]): step3=${step3}`);
      expect(step3).assertEqual('O3KVH5QkaaQ');
      logInfo(`selectHeat>selectGroupItem>locate final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('O3KVH5QkaaQ');
      logInfo(`selectHeat>selectGroupItem>locate final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('O3KVH5QkaaQ');
      logInfo(`${BUNDLE}CityPickerStateFlow_0305 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0306
     * @tc.name      Location_CityPickerStateFlow_0306
     * @tc.desc      CityPickerState call flow selectSubCity > scrollTo > scrollTo > selectSubCity > locate keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0306 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('aa', '123123');
      logInfo(`step1 selectSubCity("aa", "123123"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(92);
      logInfo(`step2 scrollTo(92): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(180);
      logInfo(`step3 scrollTo(180): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectSubCity('xa', 'Hello World_1');
      logInfo(`step4 selectSubCity("xa", "Hello World_1"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step5 locate(["", "a", "abc", "Hello Worl...: step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`selectSubCity>scrollTo>scrollTo>selectSub...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(180);
      logInfo(`${BUNDLE}CityPickerStateFlow_0306 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0307
     * @tc.name      Location_CityPickerStateFlow_0307
     * @tc.desc      CityPickerState call flow selectHeat > setLastLocation > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0307 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(24.1);
      logInfo(`step1 selectHeat(24.1): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(60, 20);
      subject.setLastLocation(1, 10);
      logInfo(`selectHeat>setLastLocation>setLastLocatio...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`selectHeat>setLastLocation>setLastLocatio...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateFlow_0307 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0308
     * @tc.name      Location_CityPickerStateFlow_0308
     * @tc.desc      CityPickerState call flow selectHeat > setLastLocation > selectSubCity > locate > scrollTo keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0308 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(140);
      logInfo(`step1 selectHeat(140): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(95, 0);
      const step3: string = subject.selectSubCity('xHello World', 'Hello WorldHello World');
      logInfo(`step3 selectSubCity("xHello World", "Hell...: step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.locate(['', 'a']);
      logInfo(`step4 locate(["", "a"]): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.scrollTo(184);
      logInfo(`step5 scrollTo(184): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`selectHeat>setLastLocation>selectSubCity>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(184);
      logInfo(`selectHeat>setLastLocation>selectSubCity>...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(95);
      logInfo(`${BUNDLE}CityPickerStateFlow_0308 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0309
     * @tc.name      Location_CityPickerStateFlow_0309
     * @tc.desc      CityPickerState call flow selectGroupItem > selectHeat > selectGroupItem > scrollTo keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0309 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('Sample Title 123_1');
      logInfo(`step1 selectGroupItem("Sample Title 123_1"): step1=${step1}`);
      expect(step1).assertEqual('Sample Title 123_1');
      const step2: string = subject.selectHeat(96.03);
      logInfo(`step2 selectHeat(96.03): step2=${step2}`);
      expect(step2).assertEqual('Sample Title 123_1');
      const step3: string = subject.selectGroupItem('abc');
      logInfo(`step3 selectGroupItem("abc"): step3=${step3}`);
      expect(step3).assertEqual('abc');
      const step4: string = subject.scrollTo(35);
      logInfo(`step4 scrollTo(35): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectGroupItem>selectHeat>selectGroupIte...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(35);
      logInfo(`selectGroupItem>selectHeat>selectGroupIte...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('abc');
      logInfo(`selectGroupItem>selectHeat>selectGroupIte...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('abc');
      logInfo(`${BUNDLE}CityPickerStateFlow_0309 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0310
     * @tc.name      Location_CityPickerStateFlow_0310
     * @tc.desc      CityPickerState call flow scrollTo > locate > selectHeat > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0310 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(184);
      logInfo(`step1 scrollTo(184): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate([]);
      logInfo(`step2 locate([]): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectHeat(47);
      logInfo(`step3 selectHeat(47): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectHeat(55);
      logInfo(`step4 selectHeat(55): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`scrollTo>locate>selectHeat>selectHeat final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(184);
      logInfo(`${BUNDLE}CityPickerStateFlow_0310 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0311
     * @tc.name      Location_CityPickerStateFlow_0311
     * @tc.desc      CityPickerState call flow selectGroupItem > locate > selectGroupItem > selectGroupItem > selectG...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0311 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem(' Hello ');
      logInfo(`step1 selectGroupItem(" Hello "): step1=${step1}`);
      expect(step1).assertEqual(' Hello ');
      const step2: string = subject.locate(['abc', 'abc']);
      logInfo(`step2 locate(["abc", "abc"]): step2=${step2}`);
      expect(step2).assertEqual(' Hello ');
      const step3: string = subject.selectGroupItem('hello world_1');
      logInfo(`step3 selectGroupItem("hello world_1"): step3=${step3}`);
      expect(step3).assertEqual('hello world_1');
      const step4: string = subject.selectGroupItem('I');
      logInfo(`step4 selectGroupItem("I"): step4=${step4}`);
      expect(step4).assertEqual('I');
      const step5: string = subject.selectGroupItem('   ');
      logInfo(`step5 selectGroupItem("   "): step5=${step5}`);
      expect(step5).assertEqual('   ');
      logInfo(`selectGroupItem>locate>selectGroupItem>se...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('   ');
      logInfo(`selectGroupItem>locate>selectGroupItem>se...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('   ');
      logInfo(`selectGroupItem>locate>selectGroupItem>se...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('abc');
      logInfo(`${BUNDLE}CityPickerStateFlow_0311 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0312
     * @tc.name      Location_CityPickerStateFlow_0312
     * @tc.desc      CityPickerState call flow selectSubCity > setLastLocation > selectGroupItem > selectSubCity keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0312 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity(' _1', '  ');
      logInfo(`step1 selectSubCity(" _1", "  "): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(1, 25);
      const step3: string = subject.selectGroupItem('ltiTwL0V5ck');
      logInfo(`step3 selectGroupItem("ltiTwL0V5ck"): step3=${step3}`);
      expect(step3).assertEqual('ltiTwL0V5ck');
      const step4: string = subject.selectSubCity('', ' a ');
      logInfo(`step4 selectSubCity("", " a "): step4=${step4}`);
      expect(step4).assertEqual('ltiTwL0V5ck');
      logInfo(`selectSubCity>setLastLocation>selectGroup...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('ltiTwL0V5ck');
      logInfo(`selectSubCity>setLastLocation>selectGroup...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('ltiTwL0V5ck');
      logInfo(`selectSubCity>setLastLocation>selectGroup...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`selectSubCity>setLastLocation>selectGroup...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateFlow_0312 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0313
     * @tc.name      Location_CityPickerStateFlow_0313
     * @tc.desc      CityPickerState call flow setLastLocation > locate > scrollTo > scrollTo > setLastLocation keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0313 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(40, 10);
      const step2: string = subject.locate([]);
      logInfo(`step2 locate([]): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(-14);
      logInfo(`step3 scrollTo(-14): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.scrollTo(33);
      logInfo(`step4 scrollTo(33): step4=${step4}`);
      expect(step4).assertEqual('');
      subject.setLastLocation(40, 75);
      logInfo(`setLastLocation>locate>scrollTo>scrollTo>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(33);
      logInfo(`setLastLocation>locate>scrollTo>scrollTo>...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(40);
      logInfo(`setLastLocation>locate>scrollTo>scrollTo>...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(75);
      logInfo(`${BUNDLE}CityPickerStateFlow_0313 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0314
     * @tc.name      Location_CityPickerStateFlow_0314
     * @tc.desc      CityPickerState call flow scrollTo > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0314 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(179);
      logInfo(`step1 scrollTo(179): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(93.65);
      logInfo(`step2 scrollTo(93.65): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`scrollTo>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(93.65, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateFlow_0314 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0315
     * @tc.name      Location_CityPickerStateFlow_0315
     * @tc.desc      CityPickerState call flow scrollTo > selectGroupItem > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0315 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(196);
      logInfo(`step1 scrollTo(196): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('xHello');
      logInfo(`step2 selectGroupItem("xHello"): step2=${step2}`);
      expect(step2).assertEqual('xHello');
      const step3: string = subject.locate(['a', '', 'abc']);
      logInfo(`step3 locate(["a", "", "abc"]): step3=${step3}`);
      expect(step3).assertEqual('xHello');
      logInfo(`scrollTo>selectGroupItem>locate final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(196);
      logInfo(`scrollTo>selectGroupItem>locate final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('xHello');
      logInfo(`scrollTo>selectGroupItem>locate final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('xHello');
      logInfo(`scrollTo>selectGroupItem>locate final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('a');
      logInfo(`${BUNDLE}CityPickerStateFlow_0315 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0316
     * @tc.name      Location_CityPickerStateFlow_0316
     * @tc.desc      CityPickerState call flow selectHeat > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0316 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(-26);
      logInfo(`step1 selectHeat(-26): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(0, 30);
      logInfo(`selectHeat>setLastLocation final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(30);
      logInfo(`${BUNDLE}CityPickerStateFlow_0316 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0317
     * @tc.name      Location_CityPickerStateFlow_0317
     * @tc.desc      CityPickerState call flow selectGroupItem > selectHeat > scrollTo > selectHeat keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0317 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('MVitXjGcs');
      logInfo(`step1 selectGroupItem("MVitXjGcs"): step1=${step1}`);
      expect(step1).assertEqual('MVitXjGcs');
      const step2: string = subject.selectHeat(-96);
      logInfo(`step2 selectHeat(-96): step2=${step2}`);
      expect(step2).assertEqual('MVitXjGcs');
      const step3: string = subject.scrollTo(63);
      logInfo(`step3 scrollTo(63): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectHeat(-68);
      logInfo(`step4 selectHeat(-68): step4=${step4}`);
      expect(step4).assertEqual('MVitXjGcs');
      logInfo(`selectGroupItem>selectHeat>scrollTo>selec...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(63);
      logInfo(`selectGroupItem>selectHeat>scrollTo>selec...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('MVitXjGcs');
      logInfo(`selectGroupItem>selectHeat>scrollTo>selec...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('MVitXjGcs');
      logInfo(`${BUNDLE}CityPickerStateFlow_0317 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0318
     * @tc.name      Location_CityPickerStateFlow_0318
     * @tc.desc      CityPickerState call flow selectSubCity > scrollTo > setLastLocation > setLastLocation keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0318 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('  ', '');
      logInfo(`step1 selectSubCity("  ", ""): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(145);
      logInfo(`step2 scrollTo(145): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(70, 20);
      subject.setLastLocation(75, 95);
      logInfo(`selectSubCity>scrollTo>setLastLocation>se...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(145);
      logInfo(`selectSubCity>scrollTo>setLastLocation>se...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(75);
      logInfo(`selectSubCity>scrollTo>setLastLocation>se...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(95);
      logInfo(`${BUNDLE}CityPickerStateFlow_0318 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0319
     * @tc.name      Location_CityPickerStateFlow_0319
     * @tc.desc      CityPickerState call flow selectGroupItem > selectSubCity > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0319 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('Hello');
      logInfo(`step1 selectGroupItem("Hello"): step1=${step1}`);
      expect(step1).assertEqual('Hello');
      const step2: string = subject.selectSubCity('aa', ' ');
      logInfo(`step2 selectSubCity("aa", " "): step2=${step2}`);
      expect(step2).assertEqual('Hello');
      subject.setLastLocation(45, 90);
      logInfo(`selectGroupItem>selectSubCity>setLastLoca...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Hello');
      logInfo(`selectGroupItem>selectSubCity>setLastLoca...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Hello');
      logInfo(`selectGroupItem>selectSubCity>setLastLoca...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(45);
      logInfo(`selectGroupItem>selectSubCity>setLastLoca...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(90);
      logInfo(`${BUNDLE}CityPickerStateFlow_0319 end`);
    });
  });
}
