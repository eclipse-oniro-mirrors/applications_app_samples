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

/** Logic checks for CityPickerState flow (54 cases). */
export default function cityPickerStateFlow3Test(): void {
  describe('CityPickerStateFlow3Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0107
     * @tc.name      Location_CityPickerStateFlow_0107
     * @tc.desc      CityPickerState call flow scrollTo > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0107 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(186);
      logInfo(`step1 scrollTo(186): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate([]);
      logInfo(`step2 locate([]): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`scrollTo>locate final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(186);
      logInfo(`${BUNDLE}CityPickerStateFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0108
     * @tc.name      Location_CityPickerStateFlow_0108
     * @tc.desc      CityPickerState call flow selectSubCity > selectSubCity > selectSubCity > scrollTo keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0108 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('abc', ' ');
      logInfo(`step1 selectSubCity("abc", " "): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity('Hello World_1', 'abc_1');
      logInfo(`step2 selectSubCity("Hello World_1", "abc...: step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectSubCity('x ', '');
      logInfo(`step3 selectSubCity("x ", ""): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.scrollTo(-68);
      logInfo(`step4 scrollTo(-68): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectSubCity>selectSubCity>selectSubCity...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-68);
      logInfo(`${BUNDLE}CityPickerStateFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0109
     * @tc.name      Location_CityPickerStateFlow_0109
     * @tc.desc      CityPickerState call flow scrollTo > selectSubCity > setLastLocation > locate > selectHeat keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0109 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(63);
      logInfo(`step1 scrollTo(63): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity(' _1', 'abcabc');
      logInfo(`step2 selectSubCity(" _1", "abcabc"): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(55, 0);
      const step4: string = subject.locate(['']);
      logInfo(`step4 locate([""]): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.selectHeat(60);
      logInfo(`step5 selectHeat(60): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`scrollTo>selectSubCity>setLastLocation>lo...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(63);
      logInfo(`scrollTo>selectSubCity>setLastLocation>lo...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(55);
      logInfo(`${BUNDLE}CityPickerStateFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0110
     * @tc.name      Location_CityPickerStateFlow_0110
     * @tc.desc      CityPickerState call flow setLastLocation > selectSubCity > setLastLocation > selectSubCity keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0110 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(110, 5);
      const step2: string = subject.selectSubCity(' a ', '');
      logInfo(`step2 selectSubCity(" a ", ""): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(85, 1);
      const step4: string = subject.selectSubCity(' ', 'Hello WorldHello World');
      logInfo(`step4 selectSubCity(" ", "Hello WorldHell...: step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`setLastLocation>selectSubCity>setLastLoca...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(85);
      logInfo(`setLastLocation>selectSubCity>setLastLoca...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(1);
      logInfo(`${BUNDLE}CityPickerStateFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0111
     * @tc.name      Location_CityPickerStateFlow_0111
     * @tc.desc      CityPickerState call flow locate > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0111 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate([]);
      logInfo(`step1 locate([]): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['abc', 'abc']);
      logInfo(`step2 locate(["abc", "abc"]): step2=${step2}`);
      expect(step2).assertEqual('abc');
      logInfo(`locate>locate final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('abc');
      logInfo(`${BUNDLE}CityPickerStateFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0112
     * @tc.name      Location_CityPickerStateFlow_0112
     * @tc.desc      CityPickerState call flow selectGroupItem > selectHeat > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0112 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('JxwFIuP');
      logInfo(`step1 selectGroupItem("JxwFIuP"): step1=${step1}`);
      expect(step1).assertEqual('JxwFIuP');
      const step2: string = subject.selectHeat(50);
      logInfo(`step2 selectHeat(50): step2=${step2}`);
      expect(step2).assertEqual('JxwFIuP');
      subject.setLastLocation(15, 0);
      logInfo(`selectGroupItem>selectHeat>setLastLocatio...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('JxwFIuP');
      logInfo(`selectGroupItem>selectHeat>setLastLocatio...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('JxwFIuP');
      logInfo(`selectGroupItem>selectHeat>setLastLocatio...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`${BUNDLE}CityPickerStateFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0113
     * @tc.name      Location_CityPickerStateFlow_0113
     * @tc.desc      CityPickerState call flow selectSubCity > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0113 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('a_1', ' ');
      logInfo(`step1 selectSubCity("a_1", " "): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(198);
      logInfo(`step2 scrollTo(198): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`selectSubCity>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(198);
      logInfo(`${BUNDLE}CityPickerStateFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0114
     * @tc.name      Location_CityPickerStateFlow_0114
     * @tc.desc      CityPickerState call flow setLastLocation > setLastLocation > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0114 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(75, 80);
      subject.setLastLocation(10, 35);
      const step3: string = subject.scrollTo(115);
      logInfo(`step3 scrollTo(115): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`setLastLocation>setLastLocation>scrollTo ...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(115);
      logInfo(`setLastLocation>setLastLocation>scrollTo ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(10);
      logInfo(`setLastLocation>setLastLocation>scrollTo ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(35);
      logInfo(`${BUNDLE}CityPickerStateFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0115
     * @tc.name      Location_CityPickerStateFlow_0115
     * @tc.desc      CityPickerState call flow locate > selectSubCity > setLastLocation > locate > scrollTo keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0115 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate([]);
      logInfo(`step1 locate([]): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity('', ' _1');
      logInfo(`step2 selectSubCity("", " _1"): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(0, 20);
      const step4: string = subject.locate(['', 'a']);
      logInfo(`step4 locate(["", "a"]): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.scrollTo(179);
      logInfo(`step5 scrollTo(179): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`locate>selectSubCity>setLastLocation>loca...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(179);
      logInfo(`locate>selectSubCity>setLastLocation>loca...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(20);
      logInfo(`${BUNDLE}CityPickerStateFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0116
     * @tc.name      Location_CityPickerStateFlow_0116
     * @tc.desc      CityPickerState call flow selectSubCity > locate > setLastLocation > selectHeat > scrollTo keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0116 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('x ', '');
      logInfo(`step1 selectSubCity("x ", ""): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step2 locate(["Hello World", "a", " ", "a...: step2=${step2}`);
      expect(step2).assertEqual('Hello World');
      subject.setLastLocation(0, 5);
      const step4: string = subject.selectHeat(195);
      logInfo(`step4 selectHeat(195): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.scrollTo(81.14);
      logInfo(`step5 scrollTo(81.14): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`selectSubCity>locate>setLastLocation>sele...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(81.14, PRECISION);
      logInfo(`selectSubCity>locate>setLastLocation>sele...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`selectSubCity>locate>setLastLocation>sele...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(5);
      logInfo(`${BUNDLE}CityPickerStateFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0117
     * @tc.name      Location_CityPickerStateFlow_0117
     * @tc.desc      CityPickerState call flow selectSubCity > selectGroupItem > selectHeat > scrollTo > locate keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0117 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('', 'Hello WorldHello World');
      logInfo(`step1 selectSubCity("", "Hello WorldHello...: step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('AA');
      logInfo(`step2 selectGroupItem("AA"): step2=${step2}`);
      expect(step2).assertEqual('AA');
      const step3: string = subject.selectHeat(-56);
      logInfo(`step3 selectHeat(-56): step3=${step3}`);
      expect(step3).assertEqual('AA');
      const step4: string = subject.scrollTo(198);
      logInfo(`step4 scrollTo(198): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step5 locate(["123", " ", "Hello World", ...: step5=${step5}`);
      expect(step5).assertEqual('AA');
      logInfo(`selectSubCity>selectGroupItem>selectHeat>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(198);
      logInfo(`selectSubCity>selectGroupItem>selectHeat>...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('AA');
      logInfo(`selectSubCity>selectGroupItem>selectHeat>...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('AA');
      logInfo(`selectSubCity>selectGroupItem>selectHeat>...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`${BUNDLE}CityPickerStateFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0118
     * @tc.name      Location_CityPickerStateFlow_0118
     * @tc.desc      CityPickerState call flow selectSubCity > selectGroupItem > setLastLocation > locate keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0118 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('', ' a ');
      logInfo(`step1 selectSubCity("", " a "): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem(' \u4e2d\u6587 ');
      logInfo(`step2 selectGroupItem(" ?? "): step2=${step2}`);
      expect(step2).assertEqual(' \u4e2d\u6587 ');
      subject.setLastLocation(25, 0);
      const step4: string = subject.locate(['', 'a']);
      logInfo(`step4 locate(["", "a"]): step4=${step4}`);
      expect(step4).assertEqual(' \u4e2d\u6587 ');
      logInfo(`selectSubCity>selectGroupItem>setLastLoca...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' \u4e2d\u6587 ');
      logInfo(`selectSubCity>selectGroupItem>setLastLoca...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' \u4e2d\u6587 ');
      logInfo(`selectSubCity>selectGroupItem>setLastLoca...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0119
     * @tc.name      Location_CityPickerStateFlow_0119
     * @tc.desc      CityPickerState call flow scrollTo > setLastLocation > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0119 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(93.65);
      logInfo(`step1 scrollTo(93.65): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(110, 40);
      const step3: string = subject.selectHeat(51.13);
      logInfo(`step3 selectHeat(51.13): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`scrollTo>setLastLocation>selectHeat final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(93.65, PRECISION);
      logInfo(`scrollTo>setLastLocation>selectHeat final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(110);
      logInfo(`scrollTo>setLastLocation>selectHeat final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(40);
      logInfo(`${BUNDLE}CityPickerStateFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0120
     * @tc.name      Location_CityPickerStateFlow_0120
     * @tc.desc      CityPickerState call flow setLastLocation > selectGroupItem > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0120 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(30, 0);
      const step2: string = subject.selectGroupItem('JxwFIuP');
      logInfo(`step2 selectGroupItem("JxwFIuP"): step2=${step2}`);
      expect(step2).assertEqual('JxwFIuP');
      const step3: string = subject.selectSubCity('Hello WorldHello World', '');
      logInfo(`step3 selectSubCity("Hello WorldHello Wor...: step3=${step3}`);
      expect(step3).assertEqual('JxwFIuP');
      logInfo(`setLastLocation>selectGroupItem>selectSub...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('JxwFIuP');
      logInfo(`setLastLocation>selectGroupItem>selectSub...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('JxwFIuP');
      logInfo(`setLastLocation>selectGroupItem>selectSub...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(30);
      logInfo(`${BUNDLE}CityPickerStateFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0121
     * @tc.name      Location_CityPickerStateFlow_0121
     * @tc.desc      CityPickerState call flow scrollTo > selectHeat > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0121 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(100);
      logInfo(`step1 scrollTo(100): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(19);
      logInfo(`step2 selectHeat(19): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step3 locate(["Hello World", "a", " ", "a...: step3=${step3}`);
      expect(step3).assertEqual('Hello World');
      logInfo(`scrollTo>selectHeat>locate final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(100);
      logInfo(`scrollTo>selectHeat>locate final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0122
     * @tc.name      Location_CityPickerStateFlow_0122
     * @tc.desc      CityPickerState call flow scrollTo > selectGroupItem > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0122 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(-52);
      logInfo(`step1 scrollTo(-52): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('Hello_1');
      logInfo(`step2 selectGroupItem("Hello_1"): step2=${step2}`);
      expect(step2).assertEqual('Hello_1');
      const step3: string = subject.selectSubCity('xabc', ' _1');
      logInfo(`step3 selectSubCity("xabc", " _1"): step3=${step3}`);
      expect(step3).assertEqual('Hello_1');
      logInfo(`scrollTo>selectGroupItem>selectSubCity final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-52);
      logInfo(`scrollTo>selectGroupItem>selectSubCity final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Hello_1');
      logInfo(`scrollTo>selectGroupItem>selectSubCity final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Hello_1');
      logInfo(`${BUNDLE}CityPickerStateFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0123
     * @tc.name      Location_CityPickerStateFlow_0123
     * @tc.desc      CityPickerState call flow locate > selectGroupItem > scrollTo > selectGroupItem > scrollTo keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0123 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate([]);
      logInfo(`step1 locate([]): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('xA');
      logInfo(`step2 selectGroupItem("xA"): step2=${step2}`);
      expect(step2).assertEqual('xA');
      const step3: string = subject.scrollTo(60);
      logInfo(`step3 scrollTo(60): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectGroupItem('h');
      logInfo(`step4 selectGroupItem("h"): step4=${step4}`);
      expect(step4).assertEqual('h');
      const step5: string = subject.scrollTo(184);
      logInfo(`step5 scrollTo(184): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`locate>selectGroupItem>scrollTo>selectGro...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(184);
      logInfo(`locate>selectGroupItem>scrollTo>selectGro...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('h');
      logInfo(`locate>selectGroupItem>scrollTo>selectGro...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('h');
      logInfo(`${BUNDLE}CityPickerStateFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0124
     * @tc.name      Location_CityPickerStateFlow_0124
     * @tc.desc      CityPickerState call flow scrollTo > locate > scrollTo > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0124 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(61);
      logInfo(`step1 scrollTo(61): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step2 locate(["Hello World", "a", " ", "a...: step2=${step2}`);
      expect(step2).assertEqual('Hello World');
      const step3: string = subject.scrollTo(15);
      logInfo(`step3 scrollTo(15): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.setLastLocation(50, 0);
      logInfo(`scrollTo>locate>scrollTo>setLastLocation ...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(15);
      logInfo(`scrollTo>locate>scrollTo>setLastLocation ...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`scrollTo>locate>scrollTo>setLastLocation ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0125
     * @tc.name      Location_CityPickerStateFlow_0125
     * @tc.desc      CityPickerState call flow selectGroupItem > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0125 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('Q291uJ1jJ');
      logInfo(`step1 selectGroupItem("Q291uJ1jJ"): step1=${step1}`);
      expect(step1).assertEqual('Q291uJ1jJ');
      subject.setLastLocation(15, 65);
      logInfo(`selectGroupItem>setLastLocation final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Q291uJ1jJ');
      logInfo(`selectGroupItem>setLastLocation final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Q291uJ1jJ');
      logInfo(`selectGroupItem>setLastLocation final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`selectGroupItem>setLastLocation final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(65);
      logInfo(`${BUNDLE}CityPickerStateFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0126
     * @tc.name      Location_CityPickerStateFlow_0126
     * @tc.desc      CityPickerState call flow selectSubCity > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0126 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('xa', '   ');
      logInfo(`step1 selectSubCity("xa", "   "): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(112);
      logInfo(`step2 scrollTo(112): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`selectSubCity>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(112);
      logInfo(`${BUNDLE}CityPickerStateFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0127
     * @tc.name      Location_CityPickerStateFlow_0127
     * @tc.desc      CityPickerState call flow locate > setLastLocation > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0127 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate([]);
      logInfo(`step1 locate([]): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(-1, 95);
      const step3: string = subject.selectSubCity('a', '123');
      logInfo(`step3 selectSubCity("a", "123"): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`locate>setLastLocation>selectSubCity final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`locate>setLastLocation>selectSubCity final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(95);
      logInfo(`${BUNDLE}CityPickerStateFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0128
     * @tc.name      Location_CityPickerStateFlow_0128
     * @tc.desc      CityPickerState call flow selectHeat > selectHeat > selectHeat > scrollTo > setLastLocation keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0128 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(81.61);
      logInfo(`step1 selectHeat(81.61): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(59);
      logInfo(`step2 selectHeat(59): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectHeat(-3);
      logInfo(`step3 selectHeat(-3): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.scrollTo(75);
      logInfo(`step4 scrollTo(75): step4=${step4}`);
      expect(step4).assertEqual('');
      subject.setLastLocation(90.95, 45);
      logInfo(`selectHeat>selectHeat>selectHeat>scrollTo...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(75);
      logInfo(`selectHeat>selectHeat>selectHeat>scrollTo...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertClose(90.95, PRECISION);
      logInfo(`selectHeat>selectHeat>selectHeat>scrollTo...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(45);
      logInfo(`${BUNDLE}CityPickerStateFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0129
     * @tc.name      Location_CityPickerStateFlow_0129
     * @tc.desc      CityPickerState call flow setLastLocation > scrollTo > setLastLocation > locate keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0129 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(30, 85);
      const step2: string = subject.scrollTo(165);
      logInfo(`step2 scrollTo(165): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(5, 0);
      const step4: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step4 locate(["Hello World", "a", " ", "a...: step4=${step4}`);
      expect(step4).assertEqual('Hello World');
      logInfo(`setLastLocation>scrollTo>setLastLocation>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(165);
      logInfo(`setLastLocation>scrollTo>setLastLocation>...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`setLastLocation>scrollTo>setLastLocation>...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`${BUNDLE}CityPickerStateFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0130
     * @tc.name      Location_CityPickerStateFlow_0130
     * @tc.desc      CityPickerState call flow selectSubCity > locate > selectSubCity > setLastLocation keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0130 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('abc', 'aa');
      logInfo(`step1 selectSubCity("abc", "aa"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate([]);
      logInfo(`step2 locate([]): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectSubCity('a_1', '123123');
      logInfo(`step3 selectSubCity("a_1", "123123"): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.setLastLocation(0, 55);
      logInfo(`selectSubCity>locate>selectSubCity>setLas...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(55);
      logInfo(`${BUNDLE}CityPickerStateFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0131
     * @tc.name      Location_CityPickerStateFlow_0131
     * @tc.desc      CityPickerState call flow setLastLocation > locate > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0131 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(25, 0);
      const step2: string = subject.locate(['', 'a']);
      logInfo(`step2 locate(["", "a"]): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(92);
      logInfo(`step3 scrollTo(92): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`setLastLocation>locate>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(92);
      logInfo(`setLastLocation>locate>scrollTo final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0132
     * @tc.name      Location_CityPickerStateFlow_0132
     * @tc.desc      CityPickerState call flow selectGroupItem > selectSubCity > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0132 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('123_1');
      logInfo(`step1 selectGroupItem("123_1"): step1=${step1}`);
      expect(step1).assertEqual('123_1');
      const step2: string = subject.selectSubCity('a_1', ' ');
      logInfo(`step2 selectSubCity("a_1", " "): step2=${step2}`);
      expect(step2).assertEqual('123_1');
      const step3: string = subject.scrollTo(8);
      logInfo(`step3 scrollTo(8): step3=${step3}`);
      expect(step3).assertEqual('N');
      logInfo(`selectGroupItem>selectSubCity>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(8);
      logInfo(`selectGroupItem>selectSubCity>scrollTo final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('123_1');
      logInfo(`selectGroupItem>selectSubCity>scrollTo final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('123_1');
      logInfo(`${BUNDLE}CityPickerStateFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0133
     * @tc.name      Location_CityPickerStateFlow_0133
     * @tc.desc      CityPickerState call flow selectGroupItem > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0133 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('xhello world');
      logInfo(`step1 selectGroupItem("xhello world"): step1=${step1}`);
      expect(step1).assertEqual('xhello world');
      const step2: string = subject.scrollTo(157);
      logInfo(`step2 scrollTo(157): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`selectGroupItem>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(157);
      logInfo(`selectGroupItem>scrollTo final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('xhello world');
      logInfo(`selectGroupItem>scrollTo final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('xhello world');
      logInfo(`${BUNDLE}CityPickerStateFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0134
     * @tc.name      Location_CityPickerStateFlow_0134
     * @tc.desc      CityPickerState call flow selectGroupItem > selectSubCity > selectHeat > scrollTo keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0134 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('XCoBidfLX');
      logInfo(`step1 selectGroupItem("XCoBidfLX"): step1=${step1}`);
      expect(step1).assertEqual('XCoBidfLX');
      const step2: string = subject.selectSubCity('123', 'x ');
      logInfo(`step2 selectSubCity("123", "x "): step2=${step2}`);
      expect(step2).assertEqual('XCoBidfLX');
      const step3: string = subject.selectHeat(51);
      logInfo(`step3 selectHeat(51): step3=${step3}`);
      expect(step3).assertEqual('XCoBidfLX');
      const step4: string = subject.scrollTo(125);
      logInfo(`step4 scrollTo(125): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectGroupItem>selectSubCity>selectHeat>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(125);
      logInfo(`selectGroupItem>selectSubCity>selectHeat>...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('XCoBidfLX');
      logInfo(`selectGroupItem>selectSubCity>selectHeat>...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('XCoBidfLX');
      logInfo(`${BUNDLE}CityPickerStateFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0135
     * @tc.name      Location_CityPickerStateFlow_0135
     * @tc.desc      CityPickerState call flow selectHeat > setLastLocation > setLastLocation > selectSubCity > setLa...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0135 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(-90);
      logInfo(`step1 selectHeat(-90): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(64.57, 40);
      subject.setLastLocation(25, 3);
      const step4: string = subject.selectSubCity('', 'abcabc');
      logInfo(`step4 selectSubCity("", "abcabc"): step4=${step4}`);
      expect(step4).assertEqual('');
      subject.setLastLocation(0, 3);
      logInfo(`selectHeat>setLastLocation>setLastLocatio...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(3);
      logInfo(`${BUNDLE}CityPickerStateFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0136
     * @tc.name      Location_CityPickerStateFlow_0136
     * @tc.desc      CityPickerState call flow scrollTo > selectHeat > selectHeat > locate > selectSubCity keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0136 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(30);
      logInfo(`step1 scrollTo(30): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(180);
      logInfo(`step2 selectHeat(180): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectHeat(68);
      logInfo(`step3 selectHeat(68): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step4 locate(["123", " ", "Hello World", ...: step4=${step4}`);
      expect(step4).assertEqual('123');
      const step5: string = subject.selectSubCity('Hello World', 'aa');
      logInfo(`step5 selectSubCity("Hello World", "aa"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`scrollTo>selectHeat>selectHeat>locate>sel...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(30);
      logInfo(`scrollTo>selectHeat>selectHeat>locate>sel...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`${BUNDLE}CityPickerStateFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0137
     * @tc.name      Location_CityPickerStateFlow_0137
     * @tc.desc      CityPickerState call flow selectHeat > scrollTo > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0137 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(166);
      logInfo(`step1 selectHeat(166): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(62);
      logInfo(`step2 scrollTo(62): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(50);
      logInfo(`step3 scrollTo(50): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`selectHeat>scrollTo>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0138
     * @tc.name      Location_CityPickerStateFlow_0138
     * @tc.desc      CityPickerState call flow selectSubCity > selectGroupItem > selectSubCity > selectSubCity keeps ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0138 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity(' a ', ' 123 ');
      logInfo(`step1 selectSubCity(" a ", " 123 "): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('Hello');
      logInfo(`step2 selectGroupItem("Hello"): step2=${step2}`);
      expect(step2).assertEqual('Hello');
      const step3: string = subject.selectSubCity(' ', 'xabc');
      logInfo(`step3 selectSubCity(" ", "xabc"): step3=${step3}`);
      expect(step3).assertEqual('Hello');
      const step4: string = subject.selectSubCity('Hello World_1', ' Hello World ');
      logInfo(`step4 selectSubCity("Hello World_1", " He...: step4=${step4}`);
      expect(step4).assertEqual('Hello');
      logInfo(`selectSubCity>selectGroupItem>selectSubCi...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Hello');
      logInfo(`selectSubCity>selectGroupItem>selectSubCi...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Hello');
      logInfo(`${BUNDLE}CityPickerStateFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0139
     * @tc.name      Location_CityPickerStateFlow_0139
     * @tc.desc      CityPickerState call flow scrollTo > selectGroupItem > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0139 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(105);
      logInfo(`step1 scrollTo(105): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('R2');
      logInfo(`step2 selectGroupItem("R2"): step2=${step2}`);
      expect(step2).assertEqual('R2');
      const step3: string = subject.scrollTo(-42);
      logInfo(`step3 scrollTo(-42): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`scrollTo>selectGroupItem>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-42);
      logInfo(`scrollTo>selectGroupItem>scrollTo final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('R2');
      logInfo(`scrollTo>selectGroupItem>scrollTo final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('R2');
      logInfo(`${BUNDLE}CityPickerStateFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0140
     * @tc.name      Location_CityPickerStateFlow_0140
     * @tc.desc      CityPickerState call flow locate > selectGroupItem > selectGroupItem > selectGroupItem keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0140 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['']);
      logInfo(`step1 locate([""]): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('PYe');
      logInfo(`step2 selectGroupItem("PYe"): step2=${step2}`);
      expect(step2).assertEqual('PYe');
      const step3: string = subject.selectGroupItem('hello world_1');
      logInfo(`step3 selectGroupItem("hello world_1"): step3=${step3}`);
      expect(step3).assertEqual('hello world_1');
      const step4: string = subject.selectGroupItem('xSample Title 123');
      logInfo(`step4 selectGroupItem("xSample Title 123"): step4=${step4}`);
      expect(step4).assertEqual('xSample Title 123');
      logInfo(`locate>selectGroupItem>selectGroupItem>se...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('xSample Title 123');
      logInfo(`locate>selectGroupItem>selectGroupItem>se...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('xSample Title 123');
      logInfo(`${BUNDLE}CityPickerStateFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0141
     * @tc.name      Location_CityPickerStateFlow_0141
     * @tc.desc      CityPickerState call flow locate > selectHeat > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0141 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate([]);
      logInfo(`step1 locate([]): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(-1);
      logInfo(`step2 selectHeat(-1): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(196);
      logInfo(`step3 scrollTo(196): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`locate>selectHeat>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(196);
      logInfo(`${BUNDLE}CityPickerStateFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0142
     * @tc.name      Location_CityPickerStateFlow_0142
     * @tc.desc      CityPickerState call flow selectGroupItem > scrollTo > selectGroupItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0142 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('MRlLuI6x');
      logInfo(`step1 selectGroupItem("MRlLuI6x"): step1=${step1}`);
      expect(step1).assertEqual('MRlLuI6x');
      const step2: string = subject.scrollTo(80);
      logInfo(`step2 scrollTo(80): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectGroupItem(' 123 ');
      logInfo(`step3 selectGroupItem(" 123 "): step3=${step3}`);
      expect(step3).assertEqual(' 123 ');
      logInfo(`selectGroupItem>scrollTo>selectGroupItem ...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(80);
      logInfo(`selectGroupItem>scrollTo>selectGroupItem ...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' 123 ');
      logInfo(`selectGroupItem>scrollTo>selectGroupItem ...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' 123 ');
      logInfo(`${BUNDLE}CityPickerStateFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0143
     * @tc.name      Location_CityPickerStateFlow_0143
     * @tc.desc      CityPickerState call flow setLastLocation > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0143 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(5, 0);
      const step2: string = subject.selectSubCity('', ' abc ');
      logInfo(`step2 selectSubCity("", " abc "): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`setLastLocation>selectSubCity final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(5);
      logInfo(`${BUNDLE}CityPickerStateFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0144
     * @tc.name      Location_CityPickerStateFlow_0144
     * @tc.desc      CityPickerState call flow setLastLocation > scrollTo > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0144 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(50, 0);
      const step2: string = subject.scrollTo(5);
      logInfo(`step2 scrollTo(5): step2=${step2}`);
      expect(step2).assertEqual('H');
      const step3: string = subject.selectHeat(95);
      logInfo(`step3 selectHeat(95): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`setLastLocation>scrollTo>selectHeat final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(5);
      logInfo(`setLastLocation>scrollTo>selectHeat final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0145
     * @tc.name      Location_CityPickerStateFlow_0145
     * @tc.desc      CityPickerState call flow selectHeat > locate > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0145 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(-28);
      logInfo(`step1 selectHeat(-28): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate([]);
      logInfo(`step2 locate([]): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(42);
      logInfo(`step3 scrollTo(42): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`selectHeat>locate>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(42);
      logInfo(`${BUNDLE}CityPickerStateFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0146
     * @tc.name      Location_CityPickerStateFlow_0146
     * @tc.desc      CityPickerState call flow selectSubCity > selectSubCity > selectHeat > locate > scrollTo keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0146 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('a_1', 'Hello World');
      logInfo(`step1 selectSubCity("a_1", "Hello World"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity('', '123');
      logInfo(`step2 selectSubCity("", "123"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectHeat(-92);
      logInfo(`step3 selectHeat(-92): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.locate(['abc', 'abc']);
      logInfo(`step4 locate(["abc", "abc"]): step4=${step4}`);
      expect(step4).assertEqual('abc');
      const step5: string = subject.scrollTo(20.14);
      logInfo(`step5 scrollTo(20.14): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`selectSubCity>selectSubCity>selectHeat>lo...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(20.14, PRECISION);
      logInfo(`selectSubCity>selectSubCity>selectHeat>lo...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('abc');
      logInfo(`${BUNDLE}CityPickerStateFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0147
     * @tc.name      Location_CityPickerStateFlow_0147
     * @tc.desc      CityPickerState call flow selectGroupItem > locate > setLastLocation > selectHeat > setLastLocat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0147 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('A_1');
      logInfo(`step1 selectGroupItem("A_1"): step1=${step1}`);
      expect(step1).assertEqual('A_1');
      const step2: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step2 locate(["Hello World", "a", " ", "a...: step2=${step2}`);
      expect(step2).assertEqual('A_1');
      subject.setLastLocation(80, 1);
      const step4: string = subject.selectHeat(-68);
      logInfo(`step4 selectHeat(-68): step4=${step4}`);
      expect(step4).assertEqual('A_1');
      subject.setLastLocation(15, 85);
      logInfo(`selectGroupItem>locate>setLastLocation>se...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('A_1');
      logInfo(`selectGroupItem>locate>setLastLocation>se...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('A_1');
      logInfo(`selectGroupItem>locate>setLastLocation>se...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`selectGroupItem>locate>setLastLocation>se...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`selectGroupItem>locate>setLastLocation>se...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(85);
      logInfo(`${BUNDLE}CityPickerStateFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0148
     * @tc.name      Location_CityPickerStateFlow_0148
     * @tc.desc      CityPickerState call flow scrollTo > locate > setLastLocation > setLastLocation > selectHeat kee...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0148 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(58.76);
      logInfo(`step1 scrollTo(58.76): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['']);
      logInfo(`step2 locate([""]): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(110, 40);
      subject.setLastLocation(2, 45);
      const step5: string = subject.selectHeat(51);
      logInfo(`step5 selectHeat(51): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`scrollTo>locate>setLastLocation>setLastLo...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(58.76, PRECISION);
      logInfo(`scrollTo>locate>setLastLocation>setLastLo...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`scrollTo>locate>setLastLocation>setLastLo...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(45);
      logInfo(`${BUNDLE}CityPickerStateFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0149
     * @tc.name      Location_CityPickerStateFlow_0149
     * @tc.desc      CityPickerState call flow selectHeat > scrollTo > setLastLocation > selectSubCity keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0149 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(125);
      logInfo(`step1 selectHeat(125): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(185);
      logInfo(`step2 scrollTo(185): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(0, 20);
      const step4: string = subject.selectSubCity('  ', 'xa');
      logInfo(`step4 selectSubCity("  ", "xa"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectHeat>scrollTo>setLastLocation>selec...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(185);
      logInfo(`selectHeat>scrollTo>setLastLocation>selec...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(20);
      logInfo(`${BUNDLE}CityPickerStateFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0150
     * @tc.name      Location_CityPickerStateFlow_0150
     * @tc.desc      CityPickerState call flow setLastLocation > selectSubCity > selectHeat > selectSubCity keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0150 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(3, 20);
      const step2: string = subject.selectSubCity(' _1', 'x ');
      logInfo(`step2 selectSubCity(" _1", "x "): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectHeat(19);
      logInfo(`step3 selectHeat(19): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectSubCity('aa', '');
      logInfo(`step4 selectSubCity("aa", ""): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`setLastLocation>selectSubCity>selectHeat>...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`setLastLocation>selectSubCity>selectHeat>...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(20);
      logInfo(`${BUNDLE}CityPickerStateFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0151
     * @tc.name      Location_CityPickerStateFlow_0151
     * @tc.desc      CityPickerState call flow selectSubCity > scrollTo > selectSubCity > selectGroupItem > selectHea...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0151 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity(' ', 'Hello WorldHello World');
      logInfo(`step1 selectSubCity(" ", "Hello WorldHell...: step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(-38);
      logInfo(`step2 scrollTo(-38): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectSubCity('abcabc', '');
      logInfo(`step3 selectSubCity("abcabc", ""): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectGroupItem('xHello');
      logInfo(`step4 selectGroupItem("xHello"): step4=${step4}`);
      expect(step4).assertEqual('xHello');
      const step5: string = subject.selectHeat(17);
      logInfo(`step5 selectHeat(17): step5=${step5}`);
      expect(step5).assertEqual('xHello');
      logInfo(`selectSubCity>scrollTo>selectSubCity>sele...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-38);
      logInfo(`selectSubCity>scrollTo>selectSubCity>sele...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('xHello');
      logInfo(`selectSubCity>scrollTo>selectSubCity>sele...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('xHello');
      logInfo(`${BUNDLE}CityPickerStateFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0152
     * @tc.name      Location_CityPickerStateFlow_0152
     * @tc.desc      CityPickerState call flow selectHeat > locate > selectGroupItem > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0152 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(108);
      logInfo(`step1 selectHeat(108): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step2 locate(["123", " ", "Hello World", ...: step2=${step2}`);
      expect(step2).assertEqual('123');
      const step3: string = subject.selectGroupItem('nBDuteOzM4Tb');
      logInfo(`step3 selectGroupItem("nBDuteOzM4Tb"): step3=${step3}`);
      expect(step3).assertEqual('nBDuteOzM4Tb');
      const step4: string = subject.selectHeat(80);
      logInfo(`step4 selectHeat(80): step4=${step4}`);
      expect(step4).assertEqual('nBDuteOzM4Tb');
      logInfo(`selectHeat>locate>selectGroupItem>selectH...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('nBDuteOzM4Tb');
      logInfo(`selectHeat>locate>selectGroupItem>selectH...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('nBDuteOzM4Tb');
      logInfo(`selectHeat>locate>selectGroupItem>selectH...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`${BUNDLE}CityPickerStateFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0153
     * @tc.name      Location_CityPickerStateFlow_0153
     * @tc.desc      CityPickerState call flow selectGroupItem > selectGroupItem > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0153 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('hello world_1');
      logInfo(`step1 selectGroupItem("hello world_1"): step1=${step1}`);
      expect(step1).assertEqual('hello world_1');
      const step2: string = subject.selectGroupItem('abc');
      logInfo(`step2 selectGroupItem("abc"): step2=${step2}`);
      expect(step2).assertEqual('abc');
      const step3: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step3 locate(["Hello World", "a", " ", "a...: step3=${step3}`);
      expect(step3).assertEqual('abc');
      logInfo(`selectGroupItem>selectGroupItem>locate final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('abc');
      logInfo(`selectGroupItem>selectGroupItem>locate final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('abc');
      logInfo(`selectGroupItem>selectGroupItem>locate final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0154
     * @tc.name      Location_CityPickerStateFlow_0154
     * @tc.desc      CityPickerState call flow locate > selectHeat > selectGroupItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0154 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step1 locate(["123", " ", "Hello World", ...: step1=${step1}`);
      expect(step1).assertEqual('123');
      const step2: string = subject.selectHeat(162);
      logInfo(`step2 selectHeat(162): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectGroupItem('   ');
      logInfo(`step3 selectGroupItem("   "): step3=${step3}`);
      expect(step3).assertEqual('   ');
      logInfo(`locate>selectHeat>selectGroupItem final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('   ');
      logInfo(`locate>selectHeat>selectGroupItem final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('   ');
      logInfo(`locate>selectHeat>selectGroupItem final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`${BUNDLE}CityPickerStateFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0155
     * @tc.name      Location_CityPickerStateFlow_0155
     * @tc.desc      CityPickerState call flow setLastLocation > selectHeat > scrollTo > selectGroupItem > selectHeat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0155 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 2);
      const step2: string = subject.selectHeat(95);
      logInfo(`step2 selectHeat(95): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(179);
      logInfo(`step3 scrollTo(179): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectGroupItem('BOMr');
      logInfo(`step4 selectGroupItem("BOMr"): step4=${step4}`);
      expect(step4).assertEqual('BOMr');
      const step5: string = subject.selectHeat(20);
      logInfo(`step5 selectHeat(20): step5=${step5}`);
      expect(step5).assertEqual('BOMr');
      logInfo(`setLastLocation>selectHeat>scrollTo>selec...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(179);
      logInfo(`setLastLocation>selectHeat>scrollTo>selec...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('BOMr');
      logInfo(`setLastLocation>selectHeat>scrollTo>selec...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('BOMr');
      logInfo(`setLastLocation>selectHeat>scrollTo>selec...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(2);
      logInfo(`${BUNDLE}CityPickerStateFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0156
     * @tc.name      Location_CityPickerStateFlow_0156
     * @tc.desc      CityPickerState call flow scrollTo > locate > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0156 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(62);
      logInfo(`step1 scrollTo(62): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['']);
      logInfo(`step2 locate([""]): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(57);
      logInfo(`step3 scrollTo(57): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`scrollTo>locate>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(57);
      logInfo(`${BUNDLE}CityPickerStateFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0157
     * @tc.name      Location_CityPickerStateFlow_0157
     * @tc.desc      CityPickerState call flow selectSubCity > selectGroupItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0157 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('', 'abc');
      logInfo(`step1 selectSubCity("", "abc"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('h');
      logInfo(`step2 selectGroupItem("h"): step2=${step2}`);
      expect(step2).assertEqual('h');
      logInfo(`selectSubCity>selectGroupItem final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('h');
      logInfo(`selectSubCity>selectGroupItem final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('h');
      logInfo(`${BUNDLE}CityPickerStateFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0158
     * @tc.name      Location_CityPickerStateFlow_0158
     * @tc.desc      CityPickerState call flow selectGroupItem > setLastLocation > setLastLocation keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0158 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('x ');
      logInfo(`step1 selectGroupItem("x "): step1=${step1}`);
      expect(step1).assertEqual('x ');
      subject.setLastLocation(0, 20);
      subject.setLastLocation(105, 100);
      logInfo(`selectGroupItem>setLastLocation>setLastLo...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('x ');
      logInfo(`selectGroupItem>setLastLocation>setLastLo...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('x ');
      logInfo(`selectGroupItem>setLastLocation>setLastLo...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(105);
      logInfo(`selectGroupItem>setLastLocation>setLastLo...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(100);
      logInfo(`${BUNDLE}CityPickerStateFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0159
     * @tc.name      Location_CityPickerStateFlow_0159
     * @tc.desc      CityPickerState call flow locate > selectGroupItem > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0159 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step1 locate(["Hello World", "a", " ", "a...: step1=${step1}`);
      expect(step1).assertEqual('Hello World');
      const step2: string = subject.selectGroupItem('O3KVH5QkaaQ');
      logInfo(`step2 selectGroupItem("O3KVH5QkaaQ"): step2=${step2}`);
      expect(step2).assertEqual('O3KVH5QkaaQ');
      const step3: string = subject.locate(['', 'a']);
      logInfo(`step3 locate(["", "a"]): step3=${step3}`);
      expect(step3).assertEqual('O3KVH5QkaaQ');
      logInfo(`locate>selectGroupItem>locate final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('O3KVH5QkaaQ');
      logInfo(`locate>selectGroupItem>locate final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('O3KVH5QkaaQ');
      logInfo(`locate>selectGroupItem>locate final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0160
     * @tc.name      Location_CityPickerStateFlow_0160
     * @tc.desc      CityPickerState call flow selectHeat > setLastLocation > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0160 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(115);
      logInfo(`step1 selectHeat(115): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(40, 90);
      const step3: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step3 locate(["Hello World", "a", " ", "a...: step3=${step3}`);
      expect(step3).assertEqual('Hello World');
      logInfo(`selectHeat>setLastLocation>locate final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`selectHeat>setLastLocation>locate final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(40);
      logInfo(`selectHeat>setLastLocation>locate final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(90);
      logInfo(`${BUNDLE}CityPickerStateFlow_0160 end`);
    });
  });
}
