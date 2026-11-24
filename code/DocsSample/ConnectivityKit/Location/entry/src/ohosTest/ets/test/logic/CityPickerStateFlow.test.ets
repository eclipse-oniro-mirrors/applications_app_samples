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
export default function cityPickerStateFlowTest(): void {
  describe('CityPickerStateFlowTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0001
     * @tc.name      Location_CityPickerStateFlow_0001
     * @tc.desc      CityPickerState call flow selectSubCity > scrollTo > locate > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_CityPickerStateFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0001 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('a', 'x ');
      logInfo(`step1 selectSubCity("a", "x "): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(134);
      logInfo(`step2 scrollTo(134): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.locate(['a', '', 'abc']);
      logInfo(`step3 locate(["a", "", "abc"]): step3=${step3}`);
      expect(step3).assertEqual('a');
      const step4: string = subject.selectHeat(45);
      logInfo(`step4 selectHeat(45): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectSubCity>scrollTo>locate>selectHeat ...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(134);
      logInfo(`selectSubCity>scrollTo>locate>selectHeat ...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('a');
      logInfo(`${BUNDLE}CityPickerStateFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0002
     * @tc.name      Location_CityPickerStateFlow_0002
     * @tc.desc      CityPickerState call flow selectSubCity > setLastLocation > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Location_CityPickerStateFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0002 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity(' 123 ', 'aa');
      logInfo(`step1 selectSubCity(" 123 ", "aa"): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(90, 115);
      const step3: string = subject.locate(['', 'a']);
      logInfo(`step3 locate(["", "a"]): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`selectSubCity>setLastLocation>locate final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(90);
      logInfo(`selectSubCity>setLastLocation>locate final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(115);
      logInfo(`${BUNDLE}CityPickerStateFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0003
     * @tc.name      Location_CityPickerStateFlow_0003
     * @tc.desc      CityPickerState call flow locate > selectSubCity > selectGroupItem > selectHeat keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0003 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['abc', 'abc']);
      logInfo(`step1 locate(["abc", "abc"]): step1=${step1}`);
      expect(step1).assertEqual('abc');
      const step2: string = subject.selectSubCity('xabc', ' abc ');
      logInfo(`step2 selectSubCity("xabc", " abc "): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectGroupItem('xHello World');
      logInfo(`step3 selectGroupItem("xHello World"): step3=${step3}`);
      expect(step3).assertEqual('xHello World');
      const step4: string = subject.selectHeat(-74);
      logInfo(`step4 selectHeat(-74): step4=${step4}`);
      expect(step4).assertEqual('xHello World');
      logInfo(`locate>selectSubCity>selectGroupItem>sele...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('xHello World');
      logInfo(`locate>selectSubCity>selectGroupItem>sele...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('xHello World');
      logInfo(`locate>selectSubCity>selectGroupItem>sele...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('abc');
      logInfo(`${BUNDLE}CityPickerStateFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0004
     * @tc.name      Location_CityPickerStateFlow_0004
     * @tc.desc      CityPickerState call flow selectSubCity > selectGroupItem > selectGroupItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0004 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('xa', 'Hello World_1');
      logInfo(`step1 selectSubCity("xa", "Hello World_1"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('xSample Title 123');
      logInfo(`step2 selectGroupItem("xSample Title 123"): step2=${step2}`);
      expect(step2).assertEqual('xSample Title 123');
      const step3: string = subject.selectGroupItem('Q3kDn1hQBGAX');
      logInfo(`step3 selectGroupItem("Q3kDn1hQBGAX"): step3=${step3}`);
      expect(step3).assertEqual('Q3kDn1hQBGAX');
      logInfo(`selectSubCity>selectGroupItem>selectGroup...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Q3kDn1hQBGAX');
      logInfo(`selectSubCity>selectGroupItem>selectGroup...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Q3kDn1hQBGAX');
      logInfo(`${BUNDLE}CityPickerStateFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0005
     * @tc.name      Location_CityPickerStateFlow_0005
     * @tc.desc      CityPickerState call flow selectSubCity > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0005 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('a_1', '123123');
      logInfo(`step1 selectSubCity("a_1", "123123"): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(80, 0);
      logInfo(`selectSubCity>setLastLocation final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(80);
      logInfo(`${BUNDLE}CityPickerStateFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0006
     * @tc.name      Location_CityPickerStateFlow_0006
     * @tc.desc      CityPickerState call flow locate > selectGroupItem > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0006 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate([]);
      logInfo(`step1 locate([]): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('b84Hgff9DvSb');
      logInfo(`step2 selectGroupItem("b84Hgff9DvSb"): step2=${step2}`);
      expect(step2).assertEqual('b84Hgff9DvSb');
      const step3: string = subject.selectHeat(135);
      logInfo(`step3 selectHeat(135): step3=${step3}`);
      expect(step3).assertEqual('b84Hgff9DvSb');
      logInfo(`locate>selectGroupItem>selectHeat final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('b84Hgff9DvSb');
      logInfo(`locate>selectGroupItem>selectHeat final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('b84Hgff9DvSb');
      logInfo(`${BUNDLE}CityPickerStateFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0007
     * @tc.name      Location_CityPickerStateFlow_0007
     * @tc.desc      CityPickerState call flow selectGroupItem > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0007 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem(' 123 ');
      logInfo(`step1 selectGroupItem(" 123 "): step1=${step1}`);
      expect(step1).assertEqual(' 123 ');
      const step2: string = subject.scrollTo(6.17);
      logInfo(`step2 scrollTo(6.17): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`selectGroupItem>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(6.17, PRECISION);
      logInfo(`selectGroupItem>scrollTo final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' 123 ');
      logInfo(`selectGroupItem>scrollTo final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' 123 ');
      logInfo(`${BUNDLE}CityPickerStateFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0008
     * @tc.name      Location_CityPickerStateFlow_0008
     * @tc.desc      CityPickerState call flow scrollTo > selectGroupItem > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0008 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(-75);
      logInfo(`step1 scrollTo(-75): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('x\u4e2d\u6587');
      logInfo(`step2 selectGroupItem("x??"): step2=${step2}`);
      expect(step2).assertEqual('x\u4e2d\u6587');
      const step3: string = subject.locate([]);
      logInfo(`step3 locate([]): step3=${step3}`);
      expect(step3).assertEqual('x\u4e2d\u6587');
      logInfo(`scrollTo>selectGroupItem>locate final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-75);
      logInfo(`scrollTo>selectGroupItem>locate final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('x\u4e2d\u6587');
      logInfo(`scrollTo>selectGroupItem>locate final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('x\u4e2d\u6587');
      logInfo(`${BUNDLE}CityPickerStateFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0009
     * @tc.name      Location_CityPickerStateFlow_0009
     * @tc.desc      CityPickerState call flow selectGroupItem > selectHeat > locate > setLastLocation > locate keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0009 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('abc');
      logInfo(`step1 selectGroupItem("abc"): step1=${step1}`);
      expect(step1).assertEqual('abc');
      const step2: string = subject.selectHeat(-12);
      logInfo(`step2 selectHeat(-12): step2=${step2}`);
      expect(step2).assertEqual('abc');
      const step3: string = subject.locate(['a', '', 'abc']);
      logInfo(`step3 locate(["a", "", "abc"]): step3=${step3}`);
      expect(step3).assertEqual('abc');
      subject.setLastLocation(60, 70);
      const step5: string = subject.locate(['']);
      logInfo(`step5 locate([""]): step5=${step5}`);
      expect(step5).assertEqual('abc');
      logInfo(`selectGroupItem>selectHeat>locate>setLast...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('abc');
      logInfo(`selectGroupItem>selectHeat>locate>setLast...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('abc');
      logInfo(`selectGroupItem>selectHeat>locate>setLast...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('a');
      logInfo(`selectGroupItem>selectHeat>locate>setLast...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(60);
      logInfo(`selectGroupItem>selectHeat>locate>setLast...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(70);
      logInfo(`${BUNDLE}CityPickerStateFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0010
     * @tc.name      Location_CityPickerStateFlow_0010
     * @tc.desc      CityPickerState call flow selectHeat > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0010 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(55);
      logInfo(`step1 selectHeat(55): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity(' a ', '');
      logInfo(`step2 selectSubCity(" a ", ""): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0011
     * @tc.name      Location_CityPickerStateFlow_0011
     * @tc.desc      CityPickerState call flow selectGroupItem > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0011 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('1ackXyqrj');
      logInfo(`step1 selectGroupItem("1ackXyqrj"): step1=${step1}`);
      expect(step1).assertEqual('1ackXyqrj');
      const step2: string = subject.selectSubCity('123123', 'a_1');
      logInfo(`step2 selectSubCity("123123", "a_1"): step2=${step2}`);
      expect(step2).assertEqual('1ackXyqrj');
      logInfo(`selectGroupItem>selectSubCity final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('1ackXyqrj');
      logInfo(`selectGroupItem>selectSubCity final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('1ackXyqrj');
      logInfo(`${BUNDLE}CityPickerStateFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0012
     * @tc.name      Location_CityPickerStateFlow_0012
     * @tc.desc      CityPickerState call flow selectHeat > selectHeat > setLastLocation > selectSubCity > selectGrou...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0012 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(-68);
      logInfo(`step1 selectHeat(-68): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(46.12);
      logInfo(`step2 selectHeat(46.12): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(115, 30);
      const step4: string = subject.selectSubCity('', '123');
      logInfo(`step4 selectSubCity("", "123"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.selectGroupItem('123_1');
      logInfo(`step5 selectGroupItem("123_1"): step5=${step5}`);
      expect(step5).assertEqual('123_1');
      logInfo(`selectHeat>selectHeat>setLastLocation>sel...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('123_1');
      logInfo(`selectHeat>selectHeat>setLastLocation>sel...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('123_1');
      logInfo(`selectHeat>selectHeat>setLastLocation>sel...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(115);
      logInfo(`selectHeat>selectHeat>setLastLocation>sel...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(30);
      logInfo(`${BUNDLE}CityPickerStateFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0013
     * @tc.name      Location_CityPickerStateFlow_0013
     * @tc.desc      CityPickerState call flow locate > selectGroupItem > locate > scrollTo > selectSubCity keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0013 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step1 locate(["Hello World", "a", " ", "a...: step1=${step1}`);
      expect(step1).assertEqual('Hello World');
      const step2: string = subject.selectGroupItem('xHello World');
      logInfo(`step2 selectGroupItem("xHello World"): step2=${step2}`);
      expect(step2).assertEqual('xHello World');
      const step3: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step3 locate(["Hello World", "a", " ", "a...: step3=${step3}`);
      expect(step3).assertEqual('xHello World');
      const step4: string = subject.scrollTo(58.76);
      logInfo(`step4 scrollTo(58.76): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.selectSubCity(' 123 ', ' Hello World ');
      logInfo(`step5 selectSubCity(" 123 ", " Hello Worl...: step5=${step5}`);
      expect(step5).assertEqual('xHello World');
      logInfo(`locate>selectGroupItem>locate>scrollTo>se...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(58.76, PRECISION);
      logInfo(`locate>selectGroupItem>locate>scrollTo>se...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('xHello World');
      logInfo(`locate>selectGroupItem>locate>scrollTo>se...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('xHello World');
      logInfo(`locate>selectGroupItem>locate>scrollTo>se...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0014
     * @tc.name      Location_CityPickerStateFlow_0014
     * @tc.desc      CityPickerState call flow scrollTo > setLastLocation > scrollTo > setLastLocation > locate keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0014 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(33);
      logInfo(`step1 scrollTo(33): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(70, 25);
      const step3: string = subject.scrollTo(75);
      logInfo(`step3 scrollTo(75): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.setLastLocation(1, 0);
      const step5: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step5 locate(["123", " ", "Hello World", ...: step5=${step5}`);
      expect(step5).assertEqual('123');
      logInfo(`scrollTo>setLastLocation>scrollTo>setLast...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(75);
      logInfo(`scrollTo>setLastLocation>scrollTo>setLast...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`scrollTo>setLastLocation>scrollTo>setLast...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(1);
      logInfo(`${BUNDLE}CityPickerStateFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0015
     * @tc.name      Location_CityPickerStateFlow_0015
     * @tc.desc      CityPickerState call flow selectSubCity > selectSubCity > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0015 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('x ', ' _1');
      logInfo(`step1 selectSubCity("x ", " _1"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity('xa', ' abc ');
      logInfo(`step2 selectSubCity("xa", " abc "): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(136);
      logInfo(`step3 scrollTo(136): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`selectSubCity>selectSubCity>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(136);
      logInfo(`${BUNDLE}CityPickerStateFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0016
     * @tc.name      Location_CityPickerStateFlow_0016
     * @tc.desc      CityPickerState call flow selectSubCity > selectSubCity > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0016 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity(' a ', 'abc');
      logInfo(`step1 selectSubCity(" a ", "abc"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity('a', 'xabc');
      logInfo(`step2 selectSubCity("a", "xabc"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(85);
      logInfo(`step3 scrollTo(85): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`selectSubCity>selectSubCity>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(85);
      logInfo(`${BUNDLE}CityPickerStateFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0017
     * @tc.name      Location_CityPickerStateFlow_0017
     * @tc.desc      CityPickerState call flow selectGroupItem > setLastLocation > setLastLocation > scrollTo keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0017 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('s');
      logInfo(`step1 selectGroupItem("s"): step1=${step1}`);
      expect(step1).assertEqual('s');
      subject.setLastLocation(110, 5);
      subject.setLastLocation(90, 192);
      const step4: string = subject.scrollTo(10);
      logInfo(`step4 scrollTo(10): step4=${step4}`);
      expect(step4).assertEqual('S');
      logInfo(`selectGroupItem>setLastLocation>setLastLo...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(10);
      logInfo(`selectGroupItem>setLastLocation>setLastLo...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('s');
      logInfo(`selectGroupItem>setLastLocation>setLastLo...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('s');
      logInfo(`selectGroupItem>setLastLocation>setLastLo...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(90);
      logInfo(`selectGroupItem>setLastLocation>setLastLo...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(192);
      logInfo(`${BUNDLE}CityPickerStateFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0018
     * @tc.name      Location_CityPickerStateFlow_0018
     * @tc.desc      CityPickerState call flow scrollTo > scrollTo > selectHeat > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0018 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(49.83);
      logInfo(`step1 scrollTo(49.83): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(-3);
      logInfo(`step2 scrollTo(-3): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectHeat(56.56);
      logInfo(`step3 selectHeat(56.56): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectHeat(81.61);
      logInfo(`step4 selectHeat(81.61): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`scrollTo>scrollTo>selectHeat>selectHeat f...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-3);
      logInfo(`${BUNDLE}CityPickerStateFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0019
     * @tc.name      Location_CityPickerStateFlow_0019
     * @tc.desc      CityPickerState call flow setLastLocation > scrollTo > selectHeat > selectHeat > selectGroupItem...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0019 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(60, 192);
      const step2: string = subject.scrollTo(165);
      logInfo(`step2 scrollTo(165): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectHeat(105);
      logInfo(`step3 selectHeat(105): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectHeat(158);
      logInfo(`step4 selectHeat(158): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.selectGroupItem('PYe');
      logInfo(`step5 selectGroupItem("PYe"): step5=${step5}`);
      expect(step5).assertEqual('PYe');
      logInfo(`setLastLocation>scrollTo>selectHeat>selec...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(165);
      logInfo(`setLastLocation>scrollTo>selectHeat>selec...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('PYe');
      logInfo(`setLastLocation>scrollTo>selectHeat>selec...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('PYe');
      logInfo(`setLastLocation>scrollTo>selectHeat>selec...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(60);
      logInfo(`setLastLocation>scrollTo>selectHeat>selec...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(192);
      logInfo(`${BUNDLE}CityPickerStateFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0020
     * @tc.name      Location_CityPickerStateFlow_0020
     * @tc.desc      CityPickerState call flow selectHeat > selectSubCity > selectSubCity > locate > selectSubCity ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0020 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(1);
      logInfo(`step1 selectHeat(1): step1=${step1}`);
      expect(step1).assertEqual('\u4e0a\u6d77');
      const step2: string = subject.selectSubCity('abc', 'abc');
      logInfo(`step2 selectSubCity("abc", "abc"): step2=${step2}`);
      expect(step2).assertEqual('\u4e0a\u6d77');
      const step3: string = subject.selectSubCity('abc', ' 123 ');
      logInfo(`step3 selectSubCity("abc", " 123 "): step3=${step3}`);
      expect(step3).assertEqual('\u4e0a\u6d77');
      const step4: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step4 locate(["Hello World", "a", " ", "a...: step4=${step4}`);
      expect(step4).assertEqual('\u4e0a\u6d77');
      const step5: string = subject.selectSubCity('', 'a');
      logInfo(`step5 selectSubCity("", "a"): step5=${step5}`);
      expect(step5).assertEqual('\u4e0a\u6d77');
      logInfo(`selectHeat>selectSubCity>selectSubCity>lo...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u4e0a\u6d77');
      logInfo(`selectHeat>selectSubCity>selectSubCity>lo...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0021
     * @tc.name      Location_CityPickerStateFlow_0021
     * @tc.desc      CityPickerState call flow selectGroupItem > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0021 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('AA');
      logInfo(`step1 selectGroupItem("AA"): step1=${step1}`);
      expect(step1).assertEqual('AA');
      const step2: string = subject.selectSubCity('', 'xHello World');
      logInfo(`step2 selectSubCity("", "xHello World"): step2=${step2}`);
      expect(step2).assertEqual('AA');
      logInfo(`selectGroupItem>selectSubCity final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('AA');
      logInfo(`selectGroupItem>selectSubCity final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('AA');
      logInfo(`${BUNDLE}CityPickerStateFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0022
     * @tc.name      Location_CityPickerStateFlow_0022
     * @tc.desc      CityPickerState call flow setLastLocation > selectGroupItem > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0022 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 2);
      const step2: string = subject.selectGroupItem('Zx8UqEh4Kb');
      logInfo(`step2 selectGroupItem("Zx8UqEh4Kb"): step2=${step2}`);
      expect(step2).assertEqual('Zx8UqEh4Kb');
      const step3: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step3 locate(["", "a", "abc", "Hello Worl...: step3=${step3}`);
      expect(step3).assertEqual('Zx8UqEh4Kb');
      logInfo(`setLastLocation>selectGroupItem>locate final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Zx8UqEh4Kb');
      logInfo(`setLastLocation>selectGroupItem>locate final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Zx8UqEh4Kb');
      logInfo(`setLastLocation>selectGroupItem>locate final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(2);
      logInfo(`${BUNDLE}CityPickerStateFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0023
     * @tc.name      Location_CityPickerStateFlow_0023
     * @tc.desc      CityPickerState call flow setLastLocation > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0023 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 35);
      const step2: string = subject.locate([]);
      logInfo(`step2 locate([]): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`setLastLocation>locate final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(-1);
      logInfo(`setLastLocation>locate final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(35);
      logInfo(`${BUNDLE}CityPickerStateFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0024
     * @tc.name      Location_CityPickerStateFlow_0024
     * @tc.desc      CityPickerState call flow scrollTo > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0024 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(35);
      logInfo(`step1 scrollTo(35): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step2 locate(["Hello World", "a", " ", "a...: step2=${step2}`);
      expect(step2).assertEqual('Hello World');
      logInfo(`scrollTo>locate final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(35);
      logInfo(`scrollTo>locate final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0025
     * @tc.name      Location_CityPickerStateFlow_0025
     * @tc.desc      CityPickerState call flow selectHeat > scrollTo > selectGroupItem > locate > selectHeat keeps st...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0025 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(65);
      logInfo(`step1 selectHeat(65): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(110);
      logInfo(`step2 scrollTo(110): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectGroupItem('abc');
      logInfo(`step3 selectGroupItem("abc"): step3=${step3}`);
      expect(step3).assertEqual('abc');
      const step4: string = subject.locate(['']);
      logInfo(`step4 locate([""]): step4=${step4}`);
      expect(step4).assertEqual('abc');
      const step5: string = subject.selectHeat(3);
      logInfo(`step5 selectHeat(3): step5=${step5}`);
      expect(step5).assertEqual('\u6df1\u5733');
      logInfo(`selectHeat>scrollTo>selectGroupItem>locat...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(110);
      logInfo(`selectHeat>scrollTo>selectGroupItem>locat...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u6df1\u5733');
      logInfo(`selectHeat>scrollTo>selectGroupItem>locat...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('abc');
      logInfo(`${BUNDLE}CityPickerStateFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0026
     * @tc.name      Location_CityPickerStateFlow_0026
     * @tc.desc      CityPickerState call flow locate > selectSubCity > locate > scrollTo > selectSubCity keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0026 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['a', '', 'abc']);
      logInfo(`step1 locate(["a", "", "abc"]): step1=${step1}`);
      expect(step1).assertEqual('a');
      const step2: string = subject.selectSubCity('', 'Hello WorldHello World');
      logInfo(`step2 selectSubCity("", "Hello WorldHello...: step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.locate([]);
      logInfo(`step3 locate([]): step3=${step3}`);
      expect(step3).assertEqual('a');
      const step4: string = subject.scrollTo(-53);
      logInfo(`step4 scrollTo(-53): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.selectSubCity('a', '');
      logInfo(`step5 selectSubCity("a", ""): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`locate>selectSubCity>locate>scrollTo>sele...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-53);
      logInfo(`locate>selectSubCity>locate>scrollTo>sele...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('a');
      logInfo(`${BUNDLE}CityPickerStateFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0027
     * @tc.name      Location_CityPickerStateFlow_0027
     * @tc.desc      CityPickerState call flow selectSubCity > scrollTo > locate > selectGroupItem keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0027 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('', ' ');
      logInfo(`step1 selectSubCity("", " "): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(63);
      logInfo(`step2 scrollTo(63): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step3 locate(["", "a", "abc", "Hello Worl...: step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectGroupItem('Hello World');
      logInfo(`step4 selectGroupItem("Hello World"): step4=${step4}`);
      expect(step4).assertEqual('Hello World');
      logInfo(`selectSubCity>scrollTo>locate>selectGroup...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(63);
      logInfo(`selectSubCity>scrollTo>locate>selectGroup...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Hello World');
      logInfo(`selectSubCity>scrollTo>locate>selectGroup...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0028
     * @tc.name      Location_CityPickerStateFlow_0028
     * @tc.desc      CityPickerState call flow locate > selectGroupItem > scrollTo > scrollTo > selectHeat keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0028 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step1 locate(["", "a", "abc", "Hello Worl...: step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('1ackXyqrj');
      logInfo(`step2 selectGroupItem("1ackXyqrj"): step2=${step2}`);
      expect(step2).assertEqual('1ackXyqrj');
      const step3: string = subject.scrollTo(35);
      logInfo(`step3 scrollTo(35): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.scrollTo(142);
      logInfo(`step4 scrollTo(142): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.selectHeat(17);
      logInfo(`step5 selectHeat(17): step5=${step5}`);
      expect(step5).assertEqual('1ackXyqrj');
      logInfo(`locate>selectGroupItem>scrollTo>scrollTo>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(142);
      logInfo(`locate>selectGroupItem>scrollTo>scrollTo>...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('1ackXyqrj');
      logInfo(`locate>selectGroupItem>scrollTo>scrollTo>...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('1ackXyqrj');
      logInfo(`${BUNDLE}CityPickerStateFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0029
     * @tc.name      Location_CityPickerStateFlow_0029
     * @tc.desc      CityPickerState call flow selectGroupItem > selectHeat > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0029 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('123_1');
      logInfo(`step1 selectGroupItem("123_1"): step1=${step1}`);
      expect(step1).assertEqual('123_1');
      const step2: string = subject.selectHeat(184);
      logInfo(`step2 selectHeat(184): step2=${step2}`);
      expect(step2).assertEqual('123_1');
      const step3: string = subject.selectSubCity('123123', 'xa');
      logInfo(`step3 selectSubCity("123123", "xa"): step3=${step3}`);
      expect(step3).assertEqual('123_1');
      logInfo(`selectGroupItem>selectHeat>selectSubCity ...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('123_1');
      logInfo(`selectGroupItem>selectHeat>selectSubCity ...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('123_1');
      logInfo(`${BUNDLE}CityPickerStateFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0030
     * @tc.name      Location_CityPickerStateFlow_0030
     * @tc.desc      CityPickerState call flow selectSubCity > selectGroupItem > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0030 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity(' 123 ', ' Hello World ');
      logInfo(`step1 selectSubCity(" 123 ", " Hello Worl...: step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem(' Hello World ');
      logInfo(`step2 selectGroupItem(" Hello World "): step2=${step2}`);
      expect(step2).assertEqual(' Hello World ');
      subject.setLastLocation(65, 20);
      logInfo(`selectSubCity>selectGroupItem>setLastLoca...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' Hello World ');
      logInfo(`selectSubCity>selectGroupItem>setLastLoca...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' Hello World ');
      logInfo(`selectSubCity>selectGroupItem>setLastLoca...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(65);
      logInfo(`selectSubCity>selectGroupItem>setLastLoca...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(20);
      logInfo(`${BUNDLE}CityPickerStateFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0031
     * @tc.name      Location_CityPickerStateFlow_0031
     * @tc.desc      CityPickerState call flow locate > selectHeat > locate > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0031 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['', 'a']);
      logInfo(`step1 locate(["", "a"]): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(185);
      logInfo(`step2 selectHeat(185): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.locate([]);
      logInfo(`step3 locate([]): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectHeat(-3);
      logInfo(`step4 selectHeat(-3): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0032
     * @tc.name      Location_CityPickerStateFlow_0032
     * @tc.desc      CityPickerState call flow selectHeat > selectHeat > scrollTo > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0032 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(120);
      logInfo(`step1 selectHeat(120): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(-71);
      logInfo(`step2 selectHeat(-71): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(175);
      logInfo(`step3 scrollTo(175): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step4 locate(["", "a", "abc", "Hello Worl...: step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectHeat>selectHeat>scrollTo>locate final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(175);
      logInfo(`${BUNDLE}CityPickerStateFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0033
     * @tc.name      Location_CityPickerStateFlow_0033
     * @tc.desc      CityPickerState call flow selectHeat > selectSubCity > locate > selectGroupItem keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0033 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(13.99);
      logInfo(`step1 selectHeat(13.99): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity('xabc', ' _1');
      logInfo(`step2 selectSubCity("xabc", " _1"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step3 locate(["", "a", "abc", "Hello Worl...: step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectGroupItem('Zx8UqEh4Kb');
      logInfo(`step4 selectGroupItem("Zx8UqEh4Kb"): step4=${step4}`);
      expect(step4).assertEqual('Zx8UqEh4Kb');
      logInfo(`selectHeat>selectSubCity>locate>selectGro...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Zx8UqEh4Kb');
      logInfo(`selectHeat>selectSubCity>locate>selectGro...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Zx8UqEh4Kb');
      logInfo(`${BUNDLE}CityPickerStateFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0034
     * @tc.name      Location_CityPickerStateFlow_0034
     * @tc.desc      CityPickerState call flow locate > selectHeat > setLastLocation > setLastLocation keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0034 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step1 locate(["123", " ", "Hello World", ...: step1=${step1}`);
      expect(step1).assertEqual('123');
      const step2: string = subject.selectHeat(-29);
      logInfo(`step2 selectHeat(-29): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(60, 20);
      subject.setLastLocation(60, 10);
      logInfo(`locate>selectHeat>setLastLocation>setLast...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`locate>selectHeat>setLastLocation>setLast...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(60);
      logInfo(`locate>selectHeat>setLastLocation>setLast...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0035
     * @tc.name      Location_CityPickerStateFlow_0035
     * @tc.desc      CityPickerState call flow scrollTo > selectHeat > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0035 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(-52);
      logInfo(`step1 scrollTo(-52): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(120);
      logInfo(`step2 selectHeat(120): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectSubCity('', 'a_1');
      logInfo(`step3 selectSubCity("", "a_1"): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`scrollTo>selectHeat>selectSubCity final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-52);
      logInfo(`${BUNDLE}CityPickerStateFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0036
     * @tc.name      Location_CityPickerStateFlow_0036
     * @tc.desc      CityPickerState call flow setLastLocation > scrollTo > scrollTo > selectSubCity keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0036 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 85);
      const step2: string = subject.scrollTo(60);
      logInfo(`step2 scrollTo(60): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(112);
      logInfo(`step3 scrollTo(112): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectSubCity('', ' a ');
      logInfo(`step4 selectSubCity("", " a "): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`setLastLocation>scrollTo>scrollTo>selectS...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(112);
      logInfo(`setLastLocation>scrollTo>scrollTo>selectS...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation>scrollTo>scrollTo>selectS...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(85);
      logInfo(`${BUNDLE}CityPickerStateFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0037
     * @tc.name      Location_CityPickerStateFlow_0037
     * @tc.desc      CityPickerState call flow setLastLocation > selectGroupItem > selectSubCity > locate > setLastLo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0037 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(50, 0);
      const step2: string = subject.selectGroupItem(' a ');
      logInfo(`step2 selectGroupItem(" a "): step2=${step2}`);
      expect(step2).assertEqual(' a ');
      const step3: string = subject.selectSubCity('  ', ' ');
      logInfo(`step3 selectSubCity("  ", " "): step3=${step3}`);
      expect(step3).assertEqual(' a ');
      const step4: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step4 locate(["123", " ", "Hello World", ...: step4=${step4}`);
      expect(step4).assertEqual(' a ');
      subject.setLastLocation(15, 50);
      logInfo(`setLastLocation>selectGroupItem>selectSub...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' a ');
      logInfo(`setLastLocation>selectGroupItem>selectSub...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' a ');
      logInfo(`setLastLocation>selectGroupItem>selectSub...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`setLastLocation>selectGroupItem>selectSub...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation>selectGroupItem>selectSub...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0038
     * @tc.name      Location_CityPickerStateFlow_0038
     * @tc.desc      CityPickerState call flow selectHeat > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0038 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(5.47);
      logInfo(`step1 selectHeat(5.47): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(90, 115);
      logInfo(`selectHeat>setLastLocation final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(90);
      logInfo(`selectHeat>setLastLocation final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(115);
      logInfo(`${BUNDLE}CityPickerStateFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0039
     * @tc.name      Location_CityPickerStateFlow_0039
     * @tc.desc      CityPickerState call flow scrollTo > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0039 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(92);
      logInfo(`step1 scrollTo(92): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity('123', 'Hello WorldHello World');
      logInfo(`step2 selectSubCity("123", "Hello WorldHe...: step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`scrollTo>selectSubCity final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(92);
      logInfo(`${BUNDLE}CityPickerStateFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0040
     * @tc.name      Location_CityPickerStateFlow_0040
     * @tc.desc      CityPickerState call flow selectHeat > locate > selectGroupItem > scrollTo > scrollTo keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0040 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(166);
      logInfo(`step1 selectHeat(166): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step2 locate(["Hello World", "a", " ", "a...: step2=${step2}`);
      expect(step2).assertEqual('Hello World');
      const step3: string = subject.selectGroupItem('abc_1');
      logInfo(`step3 selectGroupItem("abc_1"): step3=${step3}`);
      expect(step3).assertEqual('abc_1');
      const step4: string = subject.scrollTo(58.76);
      logInfo(`step4 scrollTo(58.76): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.scrollTo(175);
      logInfo(`step5 scrollTo(175): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`selectHeat>locate>selectGroupItem>scrollT...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(175);
      logInfo(`selectHeat>locate>selectGroupItem>scrollT...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('abc_1');
      logInfo(`selectHeat>locate>selectGroupItem>scrollT...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('abc_1');
      logInfo(`selectHeat>locate>selectGroupItem>scrollT...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0041
     * @tc.name      Location_CityPickerStateFlow_0041
     * @tc.desc      CityPickerState call flow scrollTo > selectGroupItem > selectSubCity > scrollTo keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0041 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(-19);
      logInfo(`step1 scrollTo(-19): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem(' \u4e2d\u6587 ');
      logInfo(`step2 selectGroupItem(" ?? "): step2=${step2}`);
      expect(step2).assertEqual(' \u4e2d\u6587 ');
      const step3: string = subject.selectSubCity('Hello World', '   ');
      logInfo(`step3 selectSubCity("Hello World", "   "): step3=${step3}`);
      expect(step3).assertEqual(' \u4e2d\u6587 ');
      const step4: string = subject.scrollTo(115);
      logInfo(`step4 scrollTo(115): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`scrollTo>selectGroupItem>selectSubCity>sc...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(115);
      logInfo(`scrollTo>selectGroupItem>selectSubCity>sc...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' \u4e2d\u6587 ');
      logInfo(`scrollTo>selectGroupItem>selectSubCity>sc...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' \u4e2d\u6587 ');
      logInfo(`${BUNDLE}CityPickerStateFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0042
     * @tc.name      Location_CityPickerStateFlow_0042
     * @tc.desc      CityPickerState call flow scrollTo > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0042 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(185);
      logInfo(`step1 scrollTo(185): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(8);
      logInfo(`step2 scrollTo(8): step2=${step2}`);
      expect(step2).assertEqual('N');
      logInfo(`scrollTo>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(8);
      logInfo(`${BUNDLE}CityPickerStateFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0043
     * @tc.name      Location_CityPickerStateFlow_0043
     * @tc.desc      CityPickerState call flow selectHeat > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0043 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(92);
      logInfo(`step1 selectHeat(92): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(75);
      logInfo(`step2 scrollTo(75): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`selectHeat>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(75);
      logInfo(`${BUNDLE}CityPickerStateFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0044
     * @tc.name      Location_CityPickerStateFlow_0044
     * @tc.desc      CityPickerState call flow scrollTo > selectHeat > selectGroupItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0044 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(55);
      logInfo(`step1 scrollTo(55): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(70);
      logInfo(`step2 selectHeat(70): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectGroupItem('  ');
      logInfo(`step3 selectGroupItem("  "): step3=${step3}`);
      expect(step3).assertEqual('  ');
      logInfo(`scrollTo>selectHeat>selectGroupItem final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(55);
      logInfo(`scrollTo>selectHeat>selectGroupItem final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('  ');
      logInfo(`scrollTo>selectHeat>selectGroupItem final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('  ');
      logInfo(`${BUNDLE}CityPickerStateFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0045
     * @tc.name      Location_CityPickerStateFlow_0045
     * @tc.desc      CityPickerState call flow setLastLocation > selectGroupItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0045 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 75);
      const step2: string = subject.selectGroupItem('abc_1');
      logInfo(`step2 selectGroupItem("abc_1"): step2=${step2}`);
      expect(step2).assertEqual('abc_1');
      logInfo(`setLastLocation>selectGroupItem final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('abc_1');
      logInfo(`setLastLocation>selectGroupItem final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('abc_1');
      logInfo(`setLastLocation>selectGroupItem final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(75);
      logInfo(`${BUNDLE}CityPickerStateFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0046
     * @tc.name      Location_CityPickerStateFlow_0046
     * @tc.desc      CityPickerState call flow selectSubCity > scrollTo > scrollTo > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0046 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('', ' 123 ');
      logInfo(`step1 selectSubCity("", " 123 "): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(-54);
      logInfo(`step2 scrollTo(-54): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(45);
      logInfo(`step3 scrollTo(45): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.locate(['']);
      logInfo(`step4 locate([""]): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectSubCity>scrollTo>scrollTo>locate final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(45);
      logInfo(`${BUNDLE}CityPickerStateFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0047
     * @tc.name      Location_CityPickerStateFlow_0047
     * @tc.desc      CityPickerState call flow scrollTo > setLastLocation > scrollTo > locate > selectGroupItem keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0047 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(183);
      logInfo(`step1 scrollTo(183): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(64.57, 60);
      const step3: string = subject.scrollTo(11);
      logInfo(`step3 scrollTo(11): step3=${step3}`);
      expect(step3).assertEqual('T');
      const step4: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step4 locate(["123", " ", "Hello World", ...: step4=${step4}`);
      expect(step4).assertEqual('123');
      const step5: string = subject.selectGroupItem('\u4e2d\u6587');
      logInfo(`step5 selectGroupItem("??"): step5=${step5}`);
      expect(step5).assertEqual('\u4e2d\u6587');
      logInfo(`scrollTo>setLastLocation>scrollTo>locate>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(11);
      logInfo(`scrollTo>setLastLocation>scrollTo>locate>...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u4e2d\u6587');
      logInfo(`scrollTo>setLastLocation>scrollTo>locate>...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('\u4e2d\u6587');
      logInfo(`scrollTo>setLastLocation>scrollTo>locate>...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`scrollTo>setLastLocation>scrollTo>locate>...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertClose(64.57, PRECISION);
      logInfo(`scrollTo>setLastLocation>scrollTo>locate>...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(60);
      logInfo(`${BUNDLE}CityPickerStateFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0048
     * @tc.name      Location_CityPickerStateFlow_0048
     * @tc.desc      CityPickerState call flow selectGroupItem > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0048 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('oP');
      logInfo(`step1 selectGroupItem("oP"): step1=${step1}`);
      expect(step1).assertEqual('oP');
      const step2: string = subject.selectSubCity('123', '');
      logInfo(`step2 selectSubCity("123", ""): step2=${step2}`);
      expect(step2).assertEqual('oP');
      logInfo(`selectGroupItem>selectSubCity final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('oP');
      logInfo(`selectGroupItem>selectSubCity final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('oP');
      logInfo(`${BUNDLE}CityPickerStateFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0049
     * @tc.name      Location_CityPickerStateFlow_0049
     * @tc.desc      CityPickerState call flow scrollTo > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0049 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(-48);
      logInfo(`step1 scrollTo(-48): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity('   ', ' abc ');
      logInfo(`step2 selectSubCity("   ", " abc "): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`scrollTo>selectSubCity final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-48);
      logInfo(`${BUNDLE}CityPickerStateFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0050
     * @tc.name      Location_CityPickerStateFlow_0050
     * @tc.desc      CityPickerState call flow scrollTo > selectGroupItem > selectGroupItem > selectGroupItem > selec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0050 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(186);
      logInfo(`step1 scrollTo(186): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('6YjdT4bu2');
      logInfo(`step2 selectGroupItem("6YjdT4bu2"): step2=${step2}`);
      expect(step2).assertEqual('6YjdT4bu2');
      const step3: string = subject.selectGroupItem('HelloHello');
      logInfo(`step3 selectGroupItem("HelloHello"): step3=${step3}`);
      expect(step3).assertEqual('HelloHello');
      const step4: string = subject.selectGroupItem('A_1');
      logInfo(`step4 selectGroupItem("A_1"): step4=${step4}`);
      expect(step4).assertEqual('A_1');
      const step5: string = subject.selectGroupItem('3NCmQ2erQ');
      logInfo(`step5 selectGroupItem("3NCmQ2erQ"): step5=${step5}`);
      expect(step5).assertEqual('3NCmQ2erQ');
      logInfo(`scrollTo>selectGroupItem>selectGroupItem>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(186);
      logInfo(`scrollTo>selectGroupItem>selectGroupItem>...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('3NCmQ2erQ');
      logInfo(`scrollTo>selectGroupItem>selectGroupItem>...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('3NCmQ2erQ');
      logInfo(`${BUNDLE}CityPickerStateFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0051
     * @tc.name      Location_CityPickerStateFlow_0051
     * @tc.desc      CityPickerState call flow selectGroupItem > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0051 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('gWfTR0PCFH4k');
      logInfo(`step1 selectGroupItem("gWfTR0PCFH4k"): step1=${step1}`);
      expect(step1).assertEqual('gWfTR0PCFH4k');
      const step2: string = subject.scrollTo(135);
      logInfo(`step2 scrollTo(135): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`selectGroupItem>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(135);
      logInfo(`selectGroupItem>scrollTo final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('gWfTR0PCFH4k');
      logInfo(`selectGroupItem>scrollTo final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('gWfTR0PCFH4k');
      logInfo(`${BUNDLE}CityPickerStateFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0052
     * @tc.name      Location_CityPickerStateFlow_0052
     * @tc.desc      CityPickerState call flow setLastLocation > selectGroupItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0052 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(40, 10);
      const step2: string = subject.selectGroupItem('HvSeG');
      logInfo(`step2 selectGroupItem("HvSeG"): step2=${step2}`);
      expect(step2).assertEqual('HvSeG');
      logInfo(`setLastLocation>selectGroupItem final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('HvSeG');
      logInfo(`setLastLocation>selectGroupItem final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('HvSeG');
      logInfo(`setLastLocation>selectGroupItem final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(40);
      logInfo(`setLastLocation>selectGroupItem final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0053
     * @tc.name      Location_CityPickerStateFlow_0053
     * @tc.desc      CityPickerState call flow selectGroupItem > selectSubCity > locate > selectSubCity keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0053 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('sn5Bb3a');
      logInfo(`step1 selectGroupItem("sn5Bb3a"): step1=${step1}`);
      expect(step1).assertEqual('sn5Bb3a');
      const step2: string = subject.selectSubCity('xabc', 'a_1');
      logInfo(`step2 selectSubCity("xabc", "a_1"): step2=${step2}`);
      expect(step2).assertEqual('sn5Bb3a');
      const step3: string = subject.locate(['a', '', 'abc']);
      logInfo(`step3 locate(["a", "", "abc"]): step3=${step3}`);
      expect(step3).assertEqual('sn5Bb3a');
      const step4: string = subject.selectSubCity('', 'a');
      logInfo(`step4 selectSubCity("", "a"): step4=${step4}`);
      expect(step4).assertEqual('sn5Bb3a');
      logInfo(`selectGroupItem>selectSubCity>locate>sele...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('sn5Bb3a');
      logInfo(`selectGroupItem>selectSubCity>locate>sele...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('sn5Bb3a');
      logInfo(`selectGroupItem>selectSubCity>locate>sele...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('a');
      logInfo(`${BUNDLE}CityPickerStateFlow_0053 end`);
    });
  });
}
