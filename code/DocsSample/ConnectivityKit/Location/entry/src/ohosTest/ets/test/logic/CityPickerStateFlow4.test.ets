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

/** Logic checks for CityPickerState flow (52 cases). */
export default function cityPickerStateFlow4Test(): void {
  describe('CityPickerStateFlow4Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0161
     * @tc.name      Location_CityPickerStateFlow_0161
     * @tc.desc      CityPickerState call flow locate > selectGroupItem > scrollTo > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0161 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['abc', 'abc']);
      logInfo(`step1 locate(["abc", "abc"]): step1=${step1}`);
      expect(step1).assertEqual('abc');
      const step2: string = subject.selectGroupItem('aa');
      logInfo(`step2 selectGroupItem("aa"): step2=${step2}`);
      expect(step2).assertEqual('aa');
      const step3: string = subject.scrollTo(184);
      logInfo(`step3 scrollTo(184): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.locate(['']);
      logInfo(`step4 locate([""]): step4=${step4}`);
      expect(step4).assertEqual('aa');
      logInfo(`locate>selectGroupItem>scrollTo>locate final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(184);
      logInfo(`locate>selectGroupItem>scrollTo>locate final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('aa');
      logInfo(`locate>selectGroupItem>scrollTo>locate final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('aa');
      logInfo(`locate>selectGroupItem>scrollTo>locate final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('abc');
      logInfo(`${BUNDLE}CityPickerStateFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0162
     * @tc.name      Location_CityPickerStateFlow_0162
     * @tc.desc      CityPickerState call flow selectSubCity > selectSubCity > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0162 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('xabc', ' _1');
      logInfo(`step1 selectSubCity("xabc", " _1"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity('', 'Hello World_1');
      logInfo(`step2 selectSubCity("", "Hello World_1"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(180);
      logInfo(`step3 scrollTo(180): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`selectSubCity>selectSubCity>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(180);
      logInfo(`${BUNDLE}CityPickerStateFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0163
     * @tc.name      Location_CityPickerStateFlow_0163
     * @tc.desc      CityPickerState call flow setLastLocation > selectGroupItem > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0163 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 115);
      const step2: string = subject.selectGroupItem('   ');
      logInfo(`step2 selectGroupItem("   "): step2=${step2}`);
      expect(step2).assertEqual('   ');
      const step3: string = subject.locate(['', 'a']);
      logInfo(`step3 locate(["", "a"]): step3=${step3}`);
      expect(step3).assertEqual('   ');
      logInfo(`setLastLocation>selectGroupItem>locate final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('   ');
      logInfo(`setLastLocation>selectGroupItem>locate final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('   ');
      logInfo(`setLastLocation>selectGroupItem>locate final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`setLastLocation>selectGroupItem>locate final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(115);
      logInfo(`${BUNDLE}CityPickerStateFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0164
     * @tc.name      Location_CityPickerStateFlow_0164
     * @tc.desc      CityPickerState call flow selectGroupItem > scrollTo > selectSubCity > scrollTo keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0164 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('sn5Bb3a');
      logInfo(`step1 selectGroupItem("sn5Bb3a"): step1=${step1}`);
      expect(step1).assertEqual('sn5Bb3a');
      const step2: string = subject.scrollTo(110);
      logInfo(`step2 scrollTo(110): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectSubCity(' a ', 'Hello WorldHello World');
      logInfo(`step3 selectSubCity(" a ", "Hello WorldHe...: step3=${step3}`);
      expect(step3).assertEqual('sn5Bb3a');
      const step4: string = subject.scrollTo(115);
      logInfo(`step4 scrollTo(115): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectGroupItem>scrollTo>selectSubCity>sc...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(115);
      logInfo(`selectGroupItem>scrollTo>selectSubCity>sc...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('sn5Bb3a');
      logInfo(`selectGroupItem>scrollTo>selectSubCity>sc...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('sn5Bb3a');
      logInfo(`${BUNDLE}CityPickerStateFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0165
     * @tc.name      Location_CityPickerStateFlow_0165
     * @tc.desc      CityPickerState call flow selectGroupItem > selectSubCity > selectGroupItem > selectHeat > locat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0165 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem(' hello world ');
      logInfo(`step1 selectGroupItem(" hello world "): step1=${step1}`);
      expect(step1).assertEqual(' hello world ');
      const step2: string = subject.selectSubCity(' a ', 'xHello World');
      logInfo(`step2 selectSubCity(" a ", "xHello World"): step2=${step2}`);
      expect(step2).assertEqual(' hello world ');
      const step3: string = subject.selectGroupItem('Hello_1');
      logInfo(`step3 selectGroupItem("Hello_1"): step3=${step3}`);
      expect(step3).assertEqual('Hello_1');
      const step4: string = subject.selectHeat(110);
      logInfo(`step4 selectHeat(110): step4=${step4}`);
      expect(step4).assertEqual('Hello_1');
      const step5: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step5 locate(["Hello World", "a", " ", "a...: step5=${step5}`);
      expect(step5).assertEqual('Hello_1');
      logInfo(`selectGroupItem>selectSubCity>selectGroup...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Hello_1');
      logInfo(`selectGroupItem>selectSubCity>selectGroup...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Hello_1');
      logInfo(`selectGroupItem>selectSubCity>selectGroup...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0166
     * @tc.name      Location_CityPickerStateFlow_0166
     * @tc.desc      CityPickerState call flow locate > scrollTo > selectSubCity > setLastLocation > locate keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0166 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['']);
      logInfo(`step1 locate([""]): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(-19);
      logInfo(`step2 scrollTo(-19): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectSubCity('xa', 'Hello World_1');
      logInfo(`step3 selectSubCity("xa", "Hello World_1"): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.setLastLocation(15, 65);
      const step5: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step5 locate(["", "a", "abc", "Hello Worl...: step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`locate>scrollTo>selectSubCity>setLastLoca...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-19);
      logInfo(`locate>scrollTo>selectSubCity>setLastLoca...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`locate>scrollTo>selectSubCity>setLastLoca...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(65);
      logInfo(`${BUNDLE}CityPickerStateFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0167
     * @tc.name      Location_CityPickerStateFlow_0167
     * @tc.desc      CityPickerState call flow setLastLocation > selectHeat > setLastLocation > setLastLocation keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0167 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(80, 85);
      const step2: string = subject.selectHeat(90);
      logInfo(`step2 selectHeat(90): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(0, 115);
      subject.setLastLocation(15, 80);
      logInfo(`setLastLocation>selectHeat>setLastLocatio...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation>selectHeat>setLastLocatio...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(80);
      logInfo(`${BUNDLE}CityPickerStateFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0168
     * @tc.name      Location_CityPickerStateFlow_0168
     * @tc.desc      CityPickerState call flow selectGroupItem > scrollTo > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0168 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem(' Hello ');
      logInfo(`step1 selectGroupItem(" Hello "): step1=${step1}`);
      expect(step1).assertEqual(' Hello ');
      const step2: string = subject.scrollTo(43.7);
      logInfo(`step2 scrollTo(43.7): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectHeat(68);
      logInfo(`step3 selectHeat(68): step3=${step3}`);
      expect(step3).assertEqual(' Hello ');
      logInfo(`selectGroupItem>scrollTo>selectHeat final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(43.7, PRECISION);
      logInfo(`selectGroupItem>scrollTo>selectHeat final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' Hello ');
      logInfo(`selectGroupItem>scrollTo>selectHeat final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' Hello ');
      logInfo(`${BUNDLE}CityPickerStateFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0169
     * @tc.name      Location_CityPickerStateFlow_0169
     * @tc.desc      CityPickerState call flow selectGroupItem > selectHeat > selectSubCity > scrollTo keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0169 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('gWfTR0PCFH4k');
      logInfo(`step1 selectGroupItem("gWfTR0PCFH4k"): step1=${step1}`);
      expect(step1).assertEqual('gWfTR0PCFH4k');
      const step2: string = subject.selectHeat(11);
      logInfo(`step2 selectHeat(11): step2=${step2}`);
      expect(step2).assertEqual('\u6210\u90fd');
      const step3: string = subject.selectSubCity('abc', 'a');
      logInfo(`step3 selectSubCity("abc", "a"): step3=${step3}`);
      expect(step3).assertEqual('\u6210\u90fd');
      const step4: string = subject.scrollTo(12.38);
      logInfo(`step4 scrollTo(12.38): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectGroupItem>selectHeat>selectSubCity>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(12.38, PRECISION);
      logInfo(`selectGroupItem>selectHeat>selectSubCity>...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u6210\u90fd');
      logInfo(`selectGroupItem>selectHeat>selectSubCity>...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('gWfTR0PCFH4k');
      logInfo(`${BUNDLE}CityPickerStateFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0170
     * @tc.name      Location_CityPickerStateFlow_0170
     * @tc.desc      CityPickerState call flow selectSubCity > selectGroupItem > locate > setLastLocation keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0170 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('Hello WorldHello World', 'Hello WorldHello World');
      logInfo(`step1 selectSubCity("Hello WorldHello Wor...: step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('6YjdT4bu2');
      logInfo(`step2 selectGroupItem("6YjdT4bu2"): step2=${step2}`);
      expect(step2).assertEqual('6YjdT4bu2');
      const step3: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step3 locate(["", "a", "abc", "Hello Worl...: step3=${step3}`);
      expect(step3).assertEqual('6YjdT4bu2');
      subject.setLastLocation(0, 25);
      logInfo(`selectSubCity>selectGroupItem>locate>setL...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('6YjdT4bu2');
      logInfo(`selectSubCity>selectGroupItem>locate>setL...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('6YjdT4bu2');
      logInfo(`selectSubCity>selectGroupItem>locate>setL...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0171
     * @tc.name      Location_CityPickerStateFlow_0171
     * @tc.desc      CityPickerState call flow scrollTo > scrollTo > selectSubCity > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0171 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(170);
      logInfo(`step1 scrollTo(170): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(-14);
      logInfo(`step2 scrollTo(-14): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectSubCity('xa', ' _1');
      logInfo(`step3 selectSubCity("xa", " _1"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectHeat(40);
      logInfo(`step4 selectHeat(40): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`scrollTo>scrollTo>selectSubCity>selectHea...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-14);
      logInfo(`${BUNDLE}CityPickerStateFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0172
     * @tc.name      Location_CityPickerStateFlow_0172
     * @tc.desc      CityPickerState call flow setLastLocation > setLastLocation > selectGroupItem keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0172 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(30, 85);
      subject.setLastLocation(1, 25);
      const step3: string = subject.selectGroupItem('a');
      logInfo(`step3 selectGroupItem("a"): step3=${step3}`);
      expect(step3).assertEqual('a');
      logInfo(`setLastLocation>setLastLocation>selectGro...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('a');
      logInfo(`setLastLocation>setLastLocation>selectGro...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('a');
      logInfo(`setLastLocation>setLastLocation>selectGro...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`setLastLocation>setLastLocation>selectGro...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0173
     * @tc.name      Location_CityPickerStateFlow_0173
     * @tc.desc      CityPickerState call flow selectHeat > scrollTo > selectSubCity > selectGroupItem > setLastLocat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0173 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(0);
      logInfo(`step1 selectHeat(0): step1=${step1}`);
      expect(step1).assertEqual('\u5317\u4eac');
      const step2: string = subject.scrollTo(50);
      logInfo(`step2 scrollTo(50): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectSubCity('a_1', 'a_1');
      logInfo(`step3 selectSubCity("a_1", "a_1"): step3=${step3}`);
      expect(step3).assertEqual('\u5317\u4eac');
      const step4: string = subject.selectGroupItem('aa');
      logInfo(`step4 selectGroupItem("aa"): step4=${step4}`);
      expect(step4).assertEqual('aa');
      subject.setLastLocation(2, 70);
      logInfo(`selectHeat>scrollTo>selectSubCity>selectG...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(50);
      logInfo(`selectHeat>scrollTo>selectSubCity>selectG...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('aa');
      logInfo(`selectHeat>scrollTo>selectSubCity>selectG...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('aa');
      logInfo(`selectHeat>scrollTo>selectSubCity>selectG...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`selectHeat>scrollTo>selectSubCity>selectG...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(70);
      logInfo(`${BUNDLE}CityPickerStateFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0174
     * @tc.name      Location_CityPickerStateFlow_0174
     * @tc.desc      CityPickerState call flow selectSubCity > selectGroupItem > locate > selectSubCity > scrollTo ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0174 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('', 'Hello World');
      logInfo(`step1 selectSubCity("", "Hello World"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('Sample Title 123Sample Title 123');
      logInfo(`step2 selectGroupItem("Sample Title 123Sa...: step2=${step2}`);
      expect(step2).assertEqual('Sample Title 123Sample Title 123');
      const step3: string = subject.locate([]);
      logInfo(`step3 locate([]): step3=${step3}`);
      expect(step3).assertEqual('Sample Title 123Sample Title 123');
      const step4: string = subject.selectSubCity('abcabc', 'xabc');
      logInfo(`step4 selectSubCity("abcabc", "xabc"): step4=${step4}`);
      expect(step4).assertEqual('Sample Title 123Sample Title 123');
      const step5: string = subject.scrollTo(100);
      logInfo(`step5 scrollTo(100): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`selectSubCity>selectGroupItem>locate>sele...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(100);
      logInfo(`selectSubCity>selectGroupItem>locate>sele...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`selectSubCity>selectGroupItem>locate>sele...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`${BUNDLE}CityPickerStateFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0175
     * @tc.name      Location_CityPickerStateFlow_0175
     * @tc.desc      CityPickerState call flow scrollTo > setLastLocation > scrollTo > setLastLocation keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0175 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(54.46);
      logInfo(`step1 scrollTo(54.46): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(-1, 0);
      const step3: string = subject.scrollTo(52.87);
      logInfo(`step3 scrollTo(52.87): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.setLastLocation(115, 30);
      logInfo(`scrollTo>setLastLocation>scrollTo>setLast...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(52.87, PRECISION);
      logInfo(`scrollTo>setLastLocation>scrollTo>setLast...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(115);
      logInfo(`scrollTo>setLastLocation>scrollTo>setLast...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(30);
      logInfo(`${BUNDLE}CityPickerStateFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0176
     * @tc.name      Location_CityPickerStateFlow_0176
     * @tc.desc      CityPickerState call flow selectGroupItem > selectHeat > selectSubCity > selectHeat keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0176 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('gWfTR0PCFH4k');
      logInfo(`step1 selectGroupItem("gWfTR0PCFH4k"): step1=${step1}`);
      expect(step1).assertEqual('gWfTR0PCFH4k');
      const step2: string = subject.selectHeat(-56);
      logInfo(`step2 selectHeat(-56): step2=${step2}`);
      expect(step2).assertEqual('gWfTR0PCFH4k');
      const step3: string = subject.selectSubCity('Hello WorldHello World', 'Hello WorldHello World');
      logInfo(`step3 selectSubCity("Hello WorldHello Wor...: step3=${step3}`);
      expect(step3).assertEqual('gWfTR0PCFH4k');
      const step4: string = subject.selectHeat(185);
      logInfo(`step4 selectHeat(185): step4=${step4}`);
      expect(step4).assertEqual('gWfTR0PCFH4k');
      logInfo(`selectGroupItem>selectHeat>selectSubCity>...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('gWfTR0PCFH4k');
      logInfo(`selectGroupItem>selectHeat>selectSubCity>...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('gWfTR0PCFH4k');
      logInfo(`${BUNDLE}CityPickerStateFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0177
     * @tc.name      Location_CityPickerStateFlow_0177
     * @tc.desc      CityPickerState call flow selectGroupItem > locate > setLastLocation > setLastLocation keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0177 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('VBb');
      logInfo(`step1 selectGroupItem("VBb"): step1=${step1}`);
      expect(step1).assertEqual('VBb');
      const step2: string = subject.locate(['', 'a']);
      logInfo(`step2 locate(["", "a"]): step2=${step2}`);
      expect(step2).assertEqual('VBb');
      subject.setLastLocation(0, 20);
      subject.setLastLocation(64.57, 65);
      logInfo(`selectGroupItem>locate>setLastLocation>se...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('VBb');
      logInfo(`selectGroupItem>locate>setLastLocation>se...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('VBb');
      logInfo(`selectGroupItem>locate>setLastLocation>se...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertClose(64.57, PRECISION);
      logInfo(`selectGroupItem>locate>setLastLocation>se...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(65);
      logInfo(`${BUNDLE}CityPickerStateFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0178
     * @tc.name      Location_CityPickerStateFlow_0178
     * @tc.desc      CityPickerState call flow selectGroupItem > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0178 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('AvHIxQjc');
      logInfo(`step1 selectGroupItem("AvHIxQjc"): step1=${step1}`);
      expect(step1).assertEqual('AvHIxQjc');
      const step2: string = subject.locate(['']);
      logInfo(`step2 locate([""]): step2=${step2}`);
      expect(step2).assertEqual('AvHIxQjc');
      logInfo(`selectGroupItem>locate final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('AvHIxQjc');
      logInfo(`selectGroupItem>locate final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('AvHIxQjc');
      logInfo(`${BUNDLE}CityPickerStateFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0179
     * @tc.name      Location_CityPickerStateFlow_0179
     * @tc.desc      CityPickerState call flow scrollTo > selectSubCity > selectGroupItem > scrollTo keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0179 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(23.43);
      logInfo(`step1 scrollTo(23.43): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity('', ' a ');
      logInfo(`step2 selectSubCity("", " a "): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectGroupItem('xhello world');
      logInfo(`step3 selectGroupItem("xhello world"): step3=${step3}`);
      expect(step3).assertEqual('xhello world');
      const step4: string = subject.scrollTo(60);
      logInfo(`step4 scrollTo(60): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`scrollTo>selectSubCity>selectGroupItem>sc...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(60);
      logInfo(`scrollTo>selectSubCity>selectGroupItem>sc...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('xhello world');
      logInfo(`scrollTo>selectSubCity>selectGroupItem>sc...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('xhello world');
      logInfo(`${BUNDLE}CityPickerStateFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0180
     * @tc.name      Location_CityPickerStateFlow_0180
     * @tc.desc      CityPickerState call flow selectSubCity > setLastLocation > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0180 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity(' abc ', 'abcabc');
      logInfo(`step1 selectSubCity(" abc ", "abcabc"): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(115, 30);
      const step3: string = subject.selectHeat(65);
      logInfo(`step3 selectHeat(65): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`selectSubCity>setLastLocation>selectHeat ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(115);
      logInfo(`selectSubCity>setLastLocation>selectHeat ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(30);
      logInfo(`${BUNDLE}CityPickerStateFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0181
     * @tc.name      Location_CityPickerStateFlow_0181
     * @tc.desc      CityPickerState call flow scrollTo > scrollTo > selectSubCity > setLastLocation keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0181 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(30);
      logInfo(`step1 scrollTo(30): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(-48);
      logInfo(`step2 scrollTo(-48): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectSubCity(' ', 'Hello WorldHello World');
      logInfo(`step3 selectSubCity(" ", "Hello WorldHell...: step3=${step3}`);
      expect(step3).assertEqual('');
      subject.setLastLocation(0, 70);
      logInfo(`scrollTo>scrollTo>selectSubCity>setLastLo...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-48);
      logInfo(`scrollTo>scrollTo>selectSubCity>setLastLo...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(70);
      logInfo(`${BUNDLE}CityPickerStateFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0182
     * @tc.name      Location_CityPickerStateFlow_0182
     * @tc.desc      CityPickerState call flow selectHeat > selectGroupItem > scrollTo > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0182 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(5.47);
      logInfo(`step1 selectHeat(5.47): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('123');
      logInfo(`step2 selectGroupItem("123"): step2=${step2}`);
      expect(step2).assertEqual('123');
      const step3: string = subject.scrollTo(-42);
      logInfo(`step3 scrollTo(-42): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step4 locate(["Hello World", "a", " ", "a...: step4=${step4}`);
      expect(step4).assertEqual('123');
      logInfo(`selectHeat>selectGroupItem>scrollTo>locat...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-42);
      logInfo(`selectHeat>selectGroupItem>scrollTo>locat...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('123');
      logInfo(`selectHeat>selectGroupItem>scrollTo>locat...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('123');
      logInfo(`selectHeat>selectGroupItem>scrollTo>locat...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0183
     * @tc.name      Location_CityPickerStateFlow_0183
     * @tc.desc      CityPickerState call flow locate > setLastLocation > locate > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0183 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['']);
      logInfo(`step1 locate([""]): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(0, 3);
      const step3: string = subject.locate(['a', '', 'abc']);
      logInfo(`step3 locate(["a", "", "abc"]): step3=${step3}`);
      expect(step3).assertEqual('a');
      const step4: string = subject.scrollTo(93.65);
      logInfo(`step4 scrollTo(93.65): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`locate>setLastLocation>locate>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(93.65, PRECISION);
      logInfo(`locate>setLastLocation>locate>scrollTo final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('a');
      logInfo(`locate>setLastLocation>locate>scrollTo final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(3);
      logInfo(`${BUNDLE}CityPickerStateFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0184
     * @tc.name      Location_CityPickerStateFlow_0184
     * @tc.desc      CityPickerState call flow locate > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0184 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['', 'a']);
      logInfo(`step1 locate(["", "a"]): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(95, 0);
      logInfo(`locate>setLastLocation final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(95);
      logInfo(`${BUNDLE}CityPickerStateFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0185
     * @tc.name      Location_CityPickerStateFlow_0185
     * @tc.desc      CityPickerState call flow locate > scrollTo > selectGroupItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0185 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step1 locate(["123", " ", "Hello World", ...: step1=${step1}`);
      expect(step1).assertEqual('123');
      const step2: string = subject.scrollTo(-10);
      logInfo(`step2 scrollTo(-10): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectGroupItem('Hello');
      logInfo(`step3 selectGroupItem("Hello"): step3=${step3}`);
      expect(step3).assertEqual('Hello');
      logInfo(`locate>scrollTo>selectGroupItem final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-10);
      logInfo(`locate>scrollTo>selectGroupItem final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Hello');
      logInfo(`locate>scrollTo>selectGroupItem final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Hello');
      logInfo(`locate>scrollTo>selectGroupItem final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`${BUNDLE}CityPickerStateFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0186
     * @tc.name      Location_CityPickerStateFlow_0186
     * @tc.desc      CityPickerState call flow selectSubCity > setLastLocation > scrollTo > selectHeat > selectHeat k...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0186 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('x ', ' 123 ');
      logInfo(`step1 selectSubCity("x ", " 123 "): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(80, 85);
      const step3: string = subject.scrollTo(95.32);
      logInfo(`step3 scrollTo(95.32): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectHeat(-26);
      logInfo(`step4 selectHeat(-26): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.selectHeat(78);
      logInfo(`step5 selectHeat(78): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`selectSubCity>setLastLocation>scrollTo>se...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(95.32, PRECISION);
      logInfo(`selectSubCity>setLastLocation>scrollTo>se...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(80);
      logInfo(`selectSubCity>setLastLocation>scrollTo>se...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(85);
      logInfo(`${BUNDLE}CityPickerStateFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0187
     * @tc.name      Location_CityPickerStateFlow_0187
     * @tc.desc      CityPickerState call flow setLastLocation > selectGroupItem > setLastLocation > locate > selectH...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0187 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(90.95, -1);
      const step2: string = subject.selectGroupItem(' 123 ');
      logInfo(`step2 selectGroupItem(" 123 "): step2=${step2}`);
      expect(step2).assertEqual(' 123 ');
      subject.setLastLocation(2, 80);
      const step4: string = subject.locate(['abc', 'abc']);
      logInfo(`step4 locate(["abc", "abc"]): step4=${step4}`);
      expect(step4).assertEqual(' 123 ');
      const step5: string = subject.selectHeat(65);
      logInfo(`step5 selectHeat(65): step5=${step5}`);
      expect(step5).assertEqual(' 123 ');
      logInfo(`setLastLocation>selectGroupItem>setLastLo...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' 123 ');
      logInfo(`setLastLocation>selectGroupItem>setLastLo...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' 123 ');
      logInfo(`setLastLocation>selectGroupItem>setLastLo...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('abc');
      logInfo(`setLastLocation>selectGroupItem>setLastLo...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation>selectGroupItem>setLastLo...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(80);
      logInfo(`${BUNDLE}CityPickerStateFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0188
     * @tc.name      Location_CityPickerStateFlow_0188
     * @tc.desc      CityPickerState call flow scrollTo > selectGroupItem > locate > setLastLocation > locate keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0188 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(40);
      logInfo(`step1 scrollTo(40): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('123');
      logInfo(`step2 selectGroupItem("123"): step2=${step2}`);
      expect(step2).assertEqual('123');
      const step3: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step3 locate(["Hello World", "a", " ", "a...: step3=${step3}`);
      expect(step3).assertEqual('123');
      subject.setLastLocation(90.95, -1);
      const step5: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step5 locate(["", "a", "abc", "Hello Worl...: step5=${step5}`);
      expect(step5).assertEqual('123');
      logInfo(`scrollTo>selectGroupItem>locate>setLastLo...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(40);
      logInfo(`scrollTo>selectGroupItem>locate>setLastLo...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('123');
      logInfo(`scrollTo>selectGroupItem>locate>setLastLo...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('123');
      logInfo(`scrollTo>selectGroupItem>locate>setLastLo...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`scrollTo>selectGroupItem>locate>setLastLo...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertClose(90.95, PRECISION);
      logInfo(`scrollTo>selectGroupItem>locate>setLastLo...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0189
     * @tc.name      Location_CityPickerStateFlow_0189
     * @tc.desc      CityPickerState call flow locate > locate > locate > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0189 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate([]);
      logInfo(`step1 locate([]): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['']);
      logInfo(`step2 locate([""]): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.locate(['', 'a']);
      logInfo(`step3 locate(["", "a"]): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.setLastLocation(105, 100);
      logInfo(`locate>locate>locate>setLastLocation final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(105);
      logInfo(`locate>locate>locate>setLastLocation final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(100);
      logInfo(`${BUNDLE}CityPickerStateFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0190
     * @tc.name      Location_CityPickerStateFlow_0190
     * @tc.desc      CityPickerState call flow selectHeat > locate > setLastLocation > scrollTo > selectHeat keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0190 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(19);
      logInfo(`step1 selectHeat(19): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step2 locate(["", "a", "abc", "Hello Worl...: step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(90, 80);
      const step4: string = subject.scrollTo(97.16);
      logInfo(`step4 scrollTo(97.16): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.selectHeat(60);
      logInfo(`step5 selectHeat(60): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`selectHeat>locate>setLastLocation>scrollT...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(97.16, PRECISION);
      logInfo(`selectHeat>locate>setLastLocation>scrollT...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(90);
      logInfo(`selectHeat>locate>setLastLocation>scrollT...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(80);
      logInfo(`${BUNDLE}CityPickerStateFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0191
     * @tc.name      Location_CityPickerStateFlow_0191
     * @tc.desc      CityPickerState call flow setLastLocation > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0191 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(70, 25);
      const step2: string = subject.selectHeat(129);
      logInfo(`step2 selectHeat(129): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`setLastLocation>selectHeat final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(70);
      logInfo(`setLastLocation>selectHeat final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0192
     * @tc.name      Location_CityPickerStateFlow_0192
     * @tc.desc      CityPickerState call flow locate > selectGroupItem > selectHeat > setLastLocation keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0192 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step1 locate(["123", " ", "Hello World", ...: step1=${step1}`);
      expect(step1).assertEqual('123');
      const step2: string = subject.selectGroupItem('ybbcOiTBwR');
      logInfo(`step2 selectGroupItem("ybbcOiTBwR"): step2=${step2}`);
      expect(step2).assertEqual('ybbcOiTBwR');
      const step3: string = subject.selectHeat(65);
      logInfo(`step3 selectHeat(65): step3=${step3}`);
      expect(step3).assertEqual('ybbcOiTBwR');
      subject.setLastLocation(105, 5);
      logInfo(`locate>selectGroupItem>selectHeat>setLast...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('ybbcOiTBwR');
      logInfo(`locate>selectGroupItem>selectHeat>setLast...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('ybbcOiTBwR');
      logInfo(`locate>selectGroupItem>selectHeat>setLast...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`locate>selectGroupItem>selectHeat>setLast...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(105);
      logInfo(`locate>selectGroupItem>selectHeat>setLast...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(5);
      logInfo(`${BUNDLE}CityPickerStateFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0193
     * @tc.name      Location_CityPickerStateFlow_0193
     * @tc.desc      CityPickerState call flow selectSubCity > locate > selectSubCity > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0193 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('aa', '');
      logInfo(`step1 selectSubCity("aa", ""): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['', 'a']);
      logInfo(`step2 locate(["", "a"]): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectSubCity('xa', 'Hello World_1');
      logInfo(`step3 selectSubCity("xa", "Hello World_1"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.scrollTo(97.16);
      logInfo(`step4 scrollTo(97.16): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectSubCity>locate>selectSubCity>scroll...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(97.16, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0194
     * @tc.name      Location_CityPickerStateFlow_0194
     * @tc.desc      CityPickerState call flow locate > scrollTo > locate > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0194 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['a', '', 'abc']);
      logInfo(`step1 locate(["a", "", "abc"]): step1=${step1}`);
      expect(step1).assertEqual('a');
      const step2: string = subject.scrollTo(196);
      logInfo(`step2 scrollTo(196): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.locate(['', 'a']);
      logInfo(`step3 locate(["", "a"]): step3=${step3}`);
      expect(step3).assertEqual('a');
      subject.setLastLocation(2, 70);
      logInfo(`locate>scrollTo>locate>setLastLocation final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(196);
      logInfo(`locate>scrollTo>locate>setLastLocation final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('a');
      logInfo(`locate>scrollTo>locate>setLastLocation final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`locate>scrollTo>locate>setLastLocation final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(70);
      logInfo(`${BUNDLE}CityPickerStateFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0195
     * @tc.name      Location_CityPickerStateFlow_0195
     * @tc.desc      CityPickerState call flow selectHeat > selectHeat > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0195 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(134);
      logInfo(`step1 selectHeat(134): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(15);
      logInfo(`step2 selectHeat(15): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(184);
      logInfo(`step3 scrollTo(184): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`selectHeat>selectHeat>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(184);
      logInfo(`${BUNDLE}CityPickerStateFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0196
     * @tc.name      Location_CityPickerStateFlow_0196
     * @tc.desc      CityPickerState call flow scrollTo > selectHeat > selectGroupItem > selectHeat keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0196 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(95);
      logInfo(`step1 scrollTo(95): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(25);
      logInfo(`step2 selectHeat(25): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectGroupItem(' abc ');
      logInfo(`step3 selectGroupItem(" abc "): step3=${step3}`);
      expect(step3).assertEqual(' abc ');
      const step4: string = subject.selectHeat(29);
      logInfo(`step4 selectHeat(29): step4=${step4}`);
      expect(step4).assertEqual(' abc ');
      logInfo(`scrollTo>selectHeat>selectGroupItem>selec...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(95);
      logInfo(`scrollTo>selectHeat>selectGroupItem>selec...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' abc ');
      logInfo(`scrollTo>selectHeat>selectGroupItem>selec...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' abc ');
      logInfo(`${BUNDLE}CityPickerStateFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0197
     * @tc.name      Location_CityPickerStateFlow_0197
     * @tc.desc      CityPickerState call flow selectGroupItem > locate > scrollTo > locate > selectGroupItem keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0197 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('\u4e2d\u6587');
      logInfo(`step1 selectGroupItem("??"): step1=${step1}`);
      expect(step1).assertEqual('\u4e2d\u6587');
      const step2: string = subject.locate(['a', '', 'abc']);
      logInfo(`step2 locate(["a", "", "abc"]): step2=${step2}`);
      expect(step2).assertEqual('\u4e2d\u6587');
      const step3: string = subject.scrollTo(155);
      logInfo(`step3 scrollTo(155): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.locate(['']);
      logInfo(`step4 locate([""]): step4=${step4}`);
      expect(step4).assertEqual('\u4e2d\u6587');
      const step5: string = subject.selectGroupItem('Hello');
      logInfo(`step5 selectGroupItem("Hello"): step5=${step5}`);
      expect(step5).assertEqual('Hello');
      logInfo(`selectGroupItem>locate>scrollTo>locate>se...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(155);
      logInfo(`selectGroupItem>locate>scrollTo>locate>se...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Hello');
      logInfo(`selectGroupItem>locate>scrollTo>locate>se...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Hello');
      logInfo(`selectGroupItem>locate>scrollTo>locate>se...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('a');
      logInfo(`${BUNDLE}CityPickerStateFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0198
     * @tc.name      Location_CityPickerStateFlow_0198
     * @tc.desc      CityPickerState call flow selectGroupItem > selectGroupItem > selectGroupItem > selectSubCity > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0198 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('IL35fjYIc8ZN');
      logInfo(`step1 selectGroupItem("IL35fjYIc8ZN"): step1=${step1}`);
      expect(step1).assertEqual('IL35fjYIc8ZN');
      const step2: string = subject.selectGroupItem('hello worldhello world');
      logInfo(`step2 selectGroupItem("hello worldhello w...: step2=${step2}`);
      expect(step2).assertEqual('hello worldhello world');
      const step3: string = subject.selectGroupItem('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`step3 selectGroupItem("????"): step3=${step3}`);
      expect(step3).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      const step4: string = subject.selectSubCity('abcabc', 'xabc');
      logInfo(`step4 selectSubCity("abcabc", "xabc"): step4=${step4}`);
      expect(step4).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      subject.setLastLocation(55, -1);
      logInfo(`selectGroupItem>selectGroupItem>selectGro...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`selectGroupItem>selectGroupItem>selectGro...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`selectGroupItem>selectGroupItem>selectGro...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(55);
      logInfo(`selectGroupItem>selectGroupItem>selectGro...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0199
     * @tc.name      Location_CityPickerStateFlow_0199
     * @tc.desc      CityPickerState call flow selectGroupItem > locate > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0199 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('xHello World');
      logInfo(`step1 selectGroupItem("xHello World"): step1=${step1}`);
      expect(step1).assertEqual('xHello World');
      const step2: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step2 locate(["Hello World", "a", " ", "a...: step2=${step2}`);
      expect(step2).assertEqual('xHello World');
      const step3: string = subject.scrollTo(50);
      logInfo(`step3 scrollTo(50): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`selectGroupItem>locate>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(50);
      logInfo(`selectGroupItem>locate>scrollTo final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('xHello World');
      logInfo(`selectGroupItem>locate>scrollTo final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('xHello World');
      logInfo(`selectGroupItem>locate>scrollTo final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0200
     * @tc.name      Location_CityPickerStateFlow_0200
     * @tc.desc      CityPickerState call flow setLastLocation > selectGroupItem > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0200 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(10, 0);
      const step2: string = subject.selectGroupItem('O3KVH5QkaaQ');
      logInfo(`step2 selectGroupItem("O3KVH5QkaaQ"): step2=${step2}`);
      expect(step2).assertEqual('O3KVH5QkaaQ');
      const step3: string = subject.scrollTo(115);
      logInfo(`step3 scrollTo(115): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`setLastLocation>selectGroupItem>scrollTo ...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(115);
      logInfo(`setLastLocation>selectGroupItem>scrollTo ...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('O3KVH5QkaaQ');
      logInfo(`setLastLocation>selectGroupItem>scrollTo ...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('O3KVH5QkaaQ');
      logInfo(`setLastLocation>selectGroupItem>scrollTo ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0201
     * @tc.name      Location_CityPickerStateFlow_0201
     * @tc.desc      CityPickerState call flow selectGroupItem > locate > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0201 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('123');
      logInfo(`step1 selectGroupItem("123"): step1=${step1}`);
      expect(step1).assertEqual('123');
      const step2: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step2 locate(["Hello World", "a", " ", "a...: step2=${step2}`);
      expect(step2).assertEqual('123');
      const step3: string = subject.selectSubCity(' a ', 'abc');
      logInfo(`step3 selectSubCity(" a ", "abc"): step3=${step3}`);
      expect(step3).assertEqual('123');
      logInfo(`selectGroupItem>locate>selectSubCity final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('123');
      logInfo(`selectGroupItem>locate>selectSubCity final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('123');
      logInfo(`selectGroupItem>locate>selectSubCity final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0202
     * @tc.name      Location_CityPickerStateFlow_0202
     * @tc.desc      CityPickerState call flow scrollTo > scrollTo > selectHeat > scrollTo > selectGroupItem keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0202 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(20);
      logInfo(`step1 scrollTo(20): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(-68);
      logInfo(`step2 scrollTo(-68): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectHeat(24);
      logInfo(`step3 selectHeat(24): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.scrollTo(30);
      logInfo(`step4 scrollTo(30): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.selectGroupItem('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`step5 selectGroupItem("????"): step5=${step5}`);
      expect(step5).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`scrollTo>scrollTo>selectHeat>scrollTo>sel...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(30);
      logInfo(`scrollTo>scrollTo>selectHeat>scrollTo>sel...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`scrollTo>scrollTo>selectHeat>scrollTo>sel...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`${BUNDLE}CityPickerStateFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0203
     * @tc.name      Location_CityPickerStateFlow_0203
     * @tc.desc      CityPickerState call flow setLastLocation > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0203 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 3);
      const step2: string = subject.selectHeat(-3);
      logInfo(`step2 selectHeat(-3): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`setLastLocation>selectHeat final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`setLastLocation>selectHeat final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(3);
      logInfo(`${BUNDLE}CityPickerStateFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0204
     * @tc.name      Location_CityPickerStateFlow_0204
     * @tc.desc      CityPickerState call flow locate > scrollTo > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0204 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step1 locate(["123", " ", "Hello World", ...: step1=${step1}`);
      expect(step1).assertEqual('123');
      const step2: string = subject.scrollTo(-53);
      logInfo(`step2 scrollTo(-53): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(167);
      logInfo(`step3 scrollTo(167): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`locate>scrollTo>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(167);
      logInfo(`locate>scrollTo>scrollTo final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`${BUNDLE}CityPickerStateFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0205
     * @tc.name      Location_CityPickerStateFlow_0205
     * @tc.desc      CityPickerState call flow selectSubCity > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0205 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('xabc', 'abc_1');
      logInfo(`step1 selectSubCity("xabc", "abc_1"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(-70);
      logInfo(`step2 scrollTo(-70): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`selectSubCity>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-70);
      logInfo(`${BUNDLE}CityPickerStateFlow_0205 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0206
     * @tc.name      Location_CityPickerStateFlow_0206
     * @tc.desc      CityPickerState call flow scrollTo > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0206 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(185);
      logInfo(`step1 scrollTo(185): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(61.39);
      logInfo(`step2 selectHeat(61.39): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`scrollTo>selectHeat final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(185);
      logInfo(`${BUNDLE}CityPickerStateFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0207
     * @tc.name      Location_CityPickerStateFlow_0207
     * @tc.desc      CityPickerState call flow scrollTo > selectSubCity > setLastLocation > scrollTo keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0207 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(78.36);
      logInfo(`step1 scrollTo(78.36): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity('abcabc', 'a_1');
      logInfo(`step2 selectSubCity("abcabc", "a_1"): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(45, 90);
      const step4: string = subject.scrollTo(167);
      logInfo(`step4 scrollTo(167): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`scrollTo>selectSubCity>setLastLocation>sc...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(167);
      logInfo(`scrollTo>selectSubCity>setLastLocation>sc...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(45);
      logInfo(`scrollTo>selectSubCity>setLastLocation>sc...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(90);
      logInfo(`${BUNDLE}CityPickerStateFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0208
     * @tc.name      Location_CityPickerStateFlow_0208
     * @tc.desc      CityPickerState call flow locate > selectHeat > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0208 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['a', '', 'abc']);
      logInfo(`step1 locate(["a", "", "abc"]): step1=${step1}`);
      expect(step1).assertEqual('a');
      const step2: string = subject.selectHeat(-14);
      logInfo(`step2 selectHeat(-14): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectHeat(-71);
      logInfo(`step3 selectHeat(-71): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`locate>selectHeat>selectHeat final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('a');
      logInfo(`${BUNDLE}CityPickerStateFlow_0208 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0209
     * @tc.name      Location_CityPickerStateFlow_0209
     * @tc.desc      CityPickerState call flow selectHeat > selectSubCity > locate > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0209 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(70);
      logInfo(`step1 selectHeat(70): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity('', 'xHello World');
      logInfo(`step2 selectSubCity("", "xHello World"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step3 locate(["", "a", "abc", "Hello Worl...: step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.scrollTo(19.96);
      logInfo(`step4 scrollTo(19.96): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectHeat>selectSubCity>locate>scrollTo ...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(19.96, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateFlow_0209 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0210
     * @tc.name      Location_CityPickerStateFlow_0210
     * @tc.desc      CityPickerState call flow selectGroupItem > scrollTo > scrollTo > selectGroupItem keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0210 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem(' \u4e2d\u6587 ');
      logInfo(`step1 selectGroupItem(" ?? "): step1=${step1}`);
      expect(step1).assertEqual(' \u4e2d\u6587 ');
      const step2: string = subject.scrollTo(19);
      logInfo(`step2 scrollTo(19): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(30);
      logInfo(`step3 scrollTo(30): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectGroupItem('ltiTwL0V5ck');
      logInfo(`step4 selectGroupItem("ltiTwL0V5ck"): step4=${step4}`);
      expect(step4).assertEqual('ltiTwL0V5ck');
      logInfo(`selectGroupItem>scrollTo>scrollTo>selectG...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(30);
      logInfo(`selectGroupItem>scrollTo>scrollTo>selectG...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('ltiTwL0V5ck');
      logInfo(`selectGroupItem>scrollTo>scrollTo>selectG...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('ltiTwL0V5ck');
      logInfo(`${BUNDLE}CityPickerStateFlow_0210 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0211
     * @tc.name      Location_CityPickerStateFlow_0211
     * @tc.desc      CityPickerState call flow scrollTo > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0211 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(56);
      logInfo(`step1 scrollTo(56): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity('', '   ');
      logInfo(`step2 selectSubCity("", "   "): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`scrollTo>selectSubCity final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(56);
      logInfo(`${BUNDLE}CityPickerStateFlow_0211 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0212
     * @tc.name      Location_CityPickerStateFlow_0212
     * @tc.desc      CityPickerState call flow scrollTo > selectHeat > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0212 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(140);
      logInfo(`step1 scrollTo(140): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(-26);
      logInfo(`step2 selectHeat(-26): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(0, 100);
      logInfo(`scrollTo>selectHeat>setLastLocation final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(140);
      logInfo(`scrollTo>selectHeat>setLastLocation final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(100);
      logInfo(`${BUNDLE}CityPickerStateFlow_0212 end`);
    });
  });
}
