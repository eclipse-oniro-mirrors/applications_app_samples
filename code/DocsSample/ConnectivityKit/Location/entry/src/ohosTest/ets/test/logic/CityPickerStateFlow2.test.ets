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
export default function cityPickerStateFlow2Test(): void {
  describe('CityPickerStateFlow2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0054
     * @tc.name      Location_CityPickerStateFlow_0054
     * @tc.desc      CityPickerState call flow selectGroupItem > setLastLocation > selectGroupItem keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0054 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem(' _1');
      logInfo(`step1 selectGroupItem(" _1"): step1=${step1}`);
      expect(step1).assertEqual(' _1');
      subject.setLastLocation(65, 85);
      const step3: string = subject.selectGroupItem('   ');
      logInfo(`step3 selectGroupItem("   "): step3=${step3}`);
      expect(step3).assertEqual('   ');
      logInfo(`selectGroupItem>setLastLocation>selectGro...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('   ');
      logInfo(`selectGroupItem>setLastLocation>selectGro...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('   ');
      logInfo(`selectGroupItem>setLastLocation>selectGro...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(65);
      logInfo(`selectGroupItem>setLastLocation>selectGro...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(85);
      logInfo(`${BUNDLE}CityPickerStateFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0055
     * @tc.name      Location_CityPickerStateFlow_0055
     * @tc.desc      CityPickerState call flow selectHeat > scrollTo > scrollTo > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0055 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(140);
      logInfo(`step1 selectHeat(140): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(65);
      logInfo(`step2 scrollTo(65): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(-38);
      logInfo(`step3 scrollTo(-38): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectSubCity('a_1', 'a_1');
      logInfo(`step4 selectSubCity("a_1", "a_1"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectHeat>scrollTo>scrollTo>selectSubCit...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-38);
      logInfo(`${BUNDLE}CityPickerStateFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0056
     * @tc.name      Location_CityPickerStateFlow_0056
     * @tc.desc      CityPickerState call flow selectGroupItem > selectSubCity > selectSubCity > selectGroupItem keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0056 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('w0ECjbzt');
      logInfo(`step1 selectGroupItem("w0ECjbzt"): step1=${step1}`);
      expect(step1).assertEqual('w0ECjbzt');
      const step2: string = subject.selectSubCity('aa', 'a');
      logInfo(`step2 selectSubCity("aa", "a"): step2=${step2}`);
      expect(step2).assertEqual('w0ECjbzt');
      const step3: string = subject.selectSubCity('Hello World_1', ' Hello World ');
      logInfo(`step3 selectSubCity("Hello World_1", " He...: step3=${step3}`);
      expect(step3).assertEqual('w0ECjbzt');
      const step4: string = subject.selectGroupItem('a');
      logInfo(`step4 selectGroupItem("a"): step4=${step4}`);
      expect(step4).assertEqual('a');
      logInfo(`selectGroupItem>selectSubCity>selectSubCi...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('a');
      logInfo(`selectGroupItem>selectSubCity>selectSubCi...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('a');
      logInfo(`${BUNDLE}CityPickerStateFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0057
     * @tc.name      Location_CityPickerStateFlow_0057
     * @tc.desc      CityPickerState call flow setLastLocation > selectHeat > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0057 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(2, 70);
      const step2: string = subject.selectHeat(41);
      logInfo(`step2 selectHeat(41): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectHeat(135);
      logInfo(`step3 selectHeat(135): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`setLastLocation>selectHeat>selectHeat final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation>selectHeat>selectHeat final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(70);
      logInfo(`${BUNDLE}CityPickerStateFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0058
     * @tc.name      Location_CityPickerStateFlow_0058
     * @tc.desc      CityPickerState call flow scrollTo > locate > selectSubCity > selectGroupItem > locate keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0058 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(-75);
      logInfo(`step1 scrollTo(-75): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['', 'a']);
      logInfo(`step2 locate(["", "a"]): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectSubCity('', 'abc');
      logInfo(`step3 selectSubCity("", "abc"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectGroupItem('h');
      logInfo(`step4 selectGroupItem("h"): step4=${step4}`);
      expect(step4).assertEqual('h');
      const step5: string = subject.locate([]);
      logInfo(`step5 locate([]): step5=${step5}`);
      expect(step5).assertEqual('h');
      logInfo(`scrollTo>locate>selectSubCity>selectGroup...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-75);
      logInfo(`scrollTo>locate>selectSubCity>selectGroup...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('h');
      logInfo(`scrollTo>locate>selectSubCity>selectGroup...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('h');
      logInfo(`${BUNDLE}CityPickerStateFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0059
     * @tc.name      Location_CityPickerStateFlow_0059
     * @tc.desc      CityPickerState call flow selectGroupItem > scrollTo > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0059 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('Q3kDn1hQBGAX');
      logInfo(`step1 selectGroupItem("Q3kDn1hQBGAX"): step1=${step1}`);
      expect(step1).assertEqual('Q3kDn1hQBGAX');
      const step2: string = subject.scrollTo(-53);
      logInfo(`step2 scrollTo(-53): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectHeat(194);
      logInfo(`step3 selectHeat(194): step3=${step3}`);
      expect(step3).assertEqual('Q3kDn1hQBGAX');
      logInfo(`selectGroupItem>scrollTo>selectHeat final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-53);
      logInfo(`selectGroupItem>scrollTo>selectHeat final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Q3kDn1hQBGAX');
      logInfo(`selectGroupItem>scrollTo>selectHeat final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Q3kDn1hQBGAX');
      logInfo(`${BUNDLE}CityPickerStateFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0060
     * @tc.name      Location_CityPickerStateFlow_0060
     * @tc.desc      CityPickerState call flow selectSubCity > scrollTo > scrollTo > selectGroupItem > selectGroupIte...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0060 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('abc_1', 'abcabc');
      logInfo(`step1 selectSubCity("abc_1", "abcabc"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(78.36);
      logInfo(`step2 scrollTo(78.36): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(45.84);
      logInfo(`step3 scrollTo(45.84): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectGroupItem('oP');
      logInfo(`step4 selectGroupItem("oP"): step4=${step4}`);
      expect(step4).assertEqual('oP');
      const step5: string = subject.selectGroupItem('mtQJQ');
      logInfo(`step5 selectGroupItem("mtQJQ"): step5=${step5}`);
      expect(step5).assertEqual('mtQJQ');
      logInfo(`selectSubCity>scrollTo>scrollTo>selectGro...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(45.84, PRECISION);
      logInfo(`selectSubCity>scrollTo>scrollTo>selectGro...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('mtQJQ');
      logInfo(`selectSubCity>scrollTo>scrollTo>selectGro...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('mtQJQ');
      logInfo(`${BUNDLE}CityPickerStateFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0061
     * @tc.name      Location_CityPickerStateFlow_0061
     * @tc.desc      CityPickerState call flow selectGroupItem > selectGroupItem > selectGroupItem keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0061 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('abcabc');
      logInfo(`step1 selectGroupItem("abcabc"): step1=${step1}`);
      expect(step1).assertEqual('abcabc');
      const step2: string = subject.selectGroupItem('\u4e2d\u6587');
      logInfo(`step2 selectGroupItem("??"): step2=${step2}`);
      expect(step2).assertEqual('\u4e2d\u6587');
      const step3: string = subject.selectGroupItem('Hello');
      logInfo(`step3 selectGroupItem("Hello"): step3=${step3}`);
      expect(step3).assertEqual('Hello');
      logInfo(`selectGroupItem>selectGroupItem>selectGro...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Hello');
      logInfo(`selectGroupItem>selectGroupItem>selectGro...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Hello');
      logInfo(`${BUNDLE}CityPickerStateFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0062
     * @tc.name      Location_CityPickerStateFlow_0062
     * @tc.desc      CityPickerState call flow scrollTo > setLastLocation > setLastLocation > selectSubCity keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0062 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(5);
      logInfo(`step1 scrollTo(5): step1=${step1}`);
      expect(step1).assertEqual('H');
      subject.setLastLocation(15, 5);
      subject.setLastLocation(0, 105);
      const step4: string = subject.selectSubCity('   ', 'abc_1');
      logInfo(`step4 selectSubCity("   ", "abc_1"): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`scrollTo>setLastLocation>setLastLocation>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(5);
      logInfo(`scrollTo>setLastLocation>setLastLocation>...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(105);
      logInfo(`${BUNDLE}CityPickerStateFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0063
     * @tc.name      Location_CityPickerStateFlow_0063
     * @tc.desc      CityPickerState call flow selectSubCity > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0063 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('Hello World', 'a_1');
      logInfo(`step1 selectSubCity("Hello World", "a_1"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(191);
      logInfo(`step2 scrollTo(191): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`selectSubCity>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(191);
      logInfo(`${BUNDLE}CityPickerStateFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0064
     * @tc.name      Location_CityPickerStateFlow_0064
     * @tc.desc      CityPickerState call flow selectSubCity > selectGroupItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0064 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity(' _1', ' 123 ');
      logInfo(`step1 selectSubCity(" _1", " 123 "): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('1ackXyqrj');
      logInfo(`step2 selectGroupItem("1ackXyqrj"): step2=${step2}`);
      expect(step2).assertEqual('1ackXyqrj');
      logInfo(`selectSubCity>selectGroupItem final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('1ackXyqrj');
      logInfo(`selectSubCity>selectGroupItem final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('1ackXyqrj');
      logInfo(`${BUNDLE}CityPickerStateFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0065
     * @tc.name      Location_CityPickerStateFlow_0065
     * @tc.desc      CityPickerState call flow setLastLocation > setLastLocation > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0065 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(85, 1);
      subject.setLastLocation(90.95, -1);
      const step3: string = subject.selectSubCity('', '  ');
      logInfo(`step3 selectSubCity("", "  "): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`setLastLocation>setLastLocation>selectSub...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertClose(90.95, PRECISION);
      logInfo(`setLastLocation>setLastLocation>selectSub...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0066
     * @tc.name      Location_CityPickerStateFlow_0066
     * @tc.desc      CityPickerState call flow selectHeat > scrollTo > locate > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0066 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(96.03);
      logInfo(`step1 selectHeat(96.03): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(95);
      logInfo(`step2 scrollTo(95): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.locate(['']);
      logInfo(`step3 locate([""]): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.setLastLocation(60, 192);
      logInfo(`selectHeat>scrollTo>locate>setLastLocatio...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(95);
      logInfo(`selectHeat>scrollTo>locate>setLastLocatio...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(60);
      logInfo(`selectHeat>scrollTo>locate>setLastLocatio...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(192);
      logInfo(`${BUNDLE}CityPickerStateFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0067
     * @tc.name      Location_CityPickerStateFlow_0067
     * @tc.desc      CityPickerState call flow selectGroupItem > selectSubCity > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0067 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('R2');
      logInfo(`step1 selectGroupItem("R2"): step1=${step1}`);
      expect(step1).assertEqual('R2');
      const step2: string = subject.selectSubCity(' abc ', 'xHello World');
      logInfo(`step2 selectSubCity(" abc ", "xHello World"): step2=${step2}`);
      expect(step2).assertEqual('R2');
      const step3: string = subject.scrollTo(11);
      logInfo(`step3 scrollTo(11): step3=${step3}`);
      expect(step3).assertEqual('T');
      logInfo(`selectGroupItem>selectSubCity>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(11);
      logInfo(`selectGroupItem>selectSubCity>scrollTo final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('R2');
      logInfo(`selectGroupItem>selectSubCity>scrollTo final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('R2');
      logInfo(`${BUNDLE}CityPickerStateFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0068
     * @tc.name      Location_CityPickerStateFlow_0068
     * @tc.desc      CityPickerState call flow selectSubCity > setLastLocation > selectGroupItem > selectGroupItem ke...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0068 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity(' _1', 'Hello World');
      logInfo(`step1 selectSubCity(" _1", "Hello World"): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(55, -1);
      const step3: string = subject.selectGroupItem('gWfTR0PCFH4k');
      logInfo(`step3 selectGroupItem("gWfTR0PCFH4k"): step3=${step3}`);
      expect(step3).assertEqual('gWfTR0PCFH4k');
      const step4: string = subject.selectGroupItem(' Sample Title 123 ');
      logInfo(`step4 selectGroupItem(" Sample Title 123 "): step4=${step4}`);
      expect(step4).assertEqual(' Sample Title 123 ');
      logInfo(`selectSubCity>setLastLocation>selectGroup...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' Sample Title 123 ');
      logInfo(`selectSubCity>setLastLocation>selectGroup...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' Sample Title 123 ');
      logInfo(`selectSubCity>setLastLocation>selectGroup...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(55);
      logInfo(`selectSubCity>setLastLocation>selectGroup...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0069
     * @tc.name      Location_CityPickerStateFlow_0069
     * @tc.desc      CityPickerState call flow selectHeat > scrollTo > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0069 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(49.24);
      logInfo(`step1 selectHeat(49.24): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(12.38);
      logInfo(`step2 scrollTo(12.38): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(10);
      logInfo(`step3 scrollTo(10): step3=${step3}`);
      expect(step3).assertEqual('S');
      logInfo(`selectHeat>scrollTo>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0070
     * @tc.name      Location_CityPickerStateFlow_0070
     * @tc.desc      CityPickerState call flow setLastLocation > selectGroupItem > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0070 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(90, 100);
      const step2: string = subject.selectGroupItem('MVitXjGcs');
      logInfo(`step2 selectGroupItem("MVitXjGcs"): step2=${step2}`);
      expect(step2).assertEqual('MVitXjGcs');
      const step3: string = subject.selectSubCity('Hello WorldHello World', 'Hello WorldHello World');
      logInfo(`step3 selectSubCity("Hello WorldHello Wor...: step3=${step3}`);
      expect(step3).assertEqual('MVitXjGcs');
      logInfo(`setLastLocation>selectGroupItem>selectSub...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('MVitXjGcs');
      logInfo(`setLastLocation>selectGroupItem>selectSub...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('MVitXjGcs');
      logInfo(`setLastLocation>selectGroupItem>selectSub...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(90);
      logInfo(`setLastLocation>selectGroupItem>selectSub...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(100);
      logInfo(`${BUNDLE}CityPickerStateFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0071
     * @tc.name      Location_CityPickerStateFlow_0071
     * @tc.desc      CityPickerState call flow selectGroupItem > selectGroupItem > selectGroupItem keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0071 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem(' A ');
      logInfo(`step1 selectGroupItem(" A "): step1=${step1}`);
      expect(step1).assertEqual(' A ');
      const step2: string = subject.selectGroupItem('PYe');
      logInfo(`step2 selectGroupItem("PYe"): step2=${step2}`);
      expect(step2).assertEqual('PYe');
      const step3: string = subject.selectGroupItem(' Sample Title 123 ');
      logInfo(`step3 selectGroupItem(" Sample Title 123 "): step3=${step3}`);
      expect(step3).assertEqual(' Sample Title 123 ');
      logInfo(`selectGroupItem>selectGroupItem>selectGro...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' Sample Title 123 ');
      logInfo(`selectGroupItem>selectGroupItem>selectGro...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' Sample Title 123 ');
      logInfo(`${BUNDLE}CityPickerStateFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0072
     * @tc.name      Location_CityPickerStateFlow_0072
     * @tc.desc      CityPickerState call flow scrollTo > selectGroupItem > selectGroupItem > selectHeat > selectGrou...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0072 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(35);
      logInfo(`step1 scrollTo(35): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('R2');
      logInfo(`step2 selectGroupItem("R2"): step2=${step2}`);
      expect(step2).assertEqual('R2');
      const step3: string = subject.selectGroupItem('AA');
      logInfo(`step3 selectGroupItem("AA"): step3=${step3}`);
      expect(step3).assertEqual('AA');
      const step4: string = subject.selectHeat(184);
      logInfo(`step4 selectHeat(184): step4=${step4}`);
      expect(step4).assertEqual('AA');
      const step5: string = subject.selectGroupItem('x123');
      logInfo(`step5 selectGroupItem("x123"): step5=${step5}`);
      expect(step5).assertEqual('x123');
      logInfo(`scrollTo>selectGroupItem>selectGroupItem>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(35);
      logInfo(`scrollTo>selectGroupItem>selectGroupItem>...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('x123');
      logInfo(`scrollTo>selectGroupItem>selectGroupItem>...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('x123');
      logInfo(`${BUNDLE}CityPickerStateFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0073
     * @tc.name      Location_CityPickerStateFlow_0073
     * @tc.desc      CityPickerState call flow setLastLocation > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0073 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(60, 192);
      const step2: string = subject.selectSubCity('xa', ' abc ');
      logInfo(`step2 selectSubCity("xa", " abc "): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`setLastLocation>selectSubCity final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(60);
      logInfo(`setLastLocation>selectSubCity final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(192);
      logInfo(`${BUNDLE}CityPickerStateFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0074
     * @tc.name      Location_CityPickerStateFlow_0074
     * @tc.desc      CityPickerState call flow selectHeat > selectGroupItem > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0074 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(120);
      logInfo(`step1 selectHeat(120): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('abc_1');
      logInfo(`step2 selectGroupItem("abc_1"): step2=${step2}`);
      expect(step2).assertEqual('abc_1');
      const step3: string = subject.scrollTo(45.84);
      logInfo(`step3 scrollTo(45.84): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`selectHeat>selectGroupItem>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(45.84, PRECISION);
      logInfo(`selectHeat>selectGroupItem>scrollTo final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('abc_1');
      logInfo(`selectHeat>selectGroupItem>scrollTo final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('abc_1');
      logInfo(`${BUNDLE}CityPickerStateFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0075
     * @tc.name      Location_CityPickerStateFlow_0075
     * @tc.desc      CityPickerState call flow selectSubCity > selectHeat > setLastLocation > locate > locate keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0075 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('xabc', 'abc_1');
      logInfo(`step1 selectSubCity("xabc", "abc_1"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(192);
      logInfo(`step2 selectHeat(192): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(0, 105);
      const step4: string = subject.locate(['abc', 'abc']);
      logInfo(`step4 locate(["abc", "abc"]): step4=${step4}`);
      expect(step4).assertEqual('abc');
      const step5: string = subject.locate(['']);
      logInfo(`step5 locate([""]): step5=${step5}`);
      expect(step5).assertEqual('abc');
      logInfo(`selectSubCity>selectHeat>setLastLocation>...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('abc');
      logInfo(`selectSubCity>selectHeat>setLastLocation>...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(105);
      logInfo(`${BUNDLE}CityPickerStateFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0076
     * @tc.name      Location_CityPickerStateFlow_0076
     * @tc.desc      CityPickerState call flow selectSubCity > selectGroupItem > setLastLocation > selectHeat keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0076 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('', ' Hello World ');
      logInfo(`step1 selectSubCity("", " Hello World "): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('MRlLuI6x');
      logInfo(`step2 selectGroupItem("MRlLuI6x"): step2=${step2}`);
      expect(step2).assertEqual('MRlLuI6x');
      subject.setLastLocation(45, 90);
      const step4: string = subject.selectHeat(170);
      logInfo(`step4 selectHeat(170): step4=${step4}`);
      expect(step4).assertEqual('MRlLuI6x');
      logInfo(`selectSubCity>selectGroupItem>setLastLoca...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('MRlLuI6x');
      logInfo(`selectSubCity>selectGroupItem>setLastLoca...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('MRlLuI6x');
      logInfo(`selectSubCity>selectGroupItem>setLastLoca...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(45);
      logInfo(`selectSubCity>selectGroupItem>setLastLoca...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(90);
      logInfo(`${BUNDLE}CityPickerStateFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0077
     * @tc.name      Location_CityPickerStateFlow_0077
     * @tc.desc      CityPickerState call flow selectGroupItem > selectGroupItem > selectSubCity > locate keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0077 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem(' hello world ');
      logInfo(`step1 selectGroupItem(" hello world "): step1=${step1}`);
      expect(step1).assertEqual(' hello world ');
      const step2: string = subject.selectGroupItem('h');
      logInfo(`step2 selectGroupItem("h"): step2=${step2}`);
      expect(step2).assertEqual('h');
      const step3: string = subject.selectSubCity(' _1', '  ');
      logInfo(`step3 selectSubCity(" _1", "  "): step3=${step3}`);
      expect(step3).assertEqual('h');
      const step4: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step4 locate(["123", " ", "Hello World", ...: step4=${step4}`);
      expect(step4).assertEqual('h');
      logInfo(`selectGroupItem>selectGroupItem>selectSub...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('h');
      logInfo(`selectGroupItem>selectGroupItem>selectSub...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('h');
      logInfo(`selectGroupItem>selectGroupItem>selectSub...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`${BUNDLE}CityPickerStateFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0078
     * @tc.name      Location_CityPickerStateFlow_0078
     * @tc.desc      CityPickerState call flow setLastLocation > selectGroupItem > selectGroupItem keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0078 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(115, 55);
      const step2: string = subject.selectGroupItem('IL35fjYIc8ZN');
      logInfo(`step2 selectGroupItem("IL35fjYIc8ZN"): step2=${step2}`);
      expect(step2).assertEqual('IL35fjYIc8ZN');
      const step3: string = subject.selectGroupItem('Sample Title 123Sample Title 123');
      logInfo(`step3 selectGroupItem("Sample Title 123Sa...: step3=${step3}`);
      expect(step3).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`setLastLocation>selectGroupItem>selectGro...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`setLastLocation>selectGroupItem>selectGro...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`setLastLocation>selectGroupItem>selectGro...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(115);
      logInfo(`setLastLocation>selectGroupItem>selectGro...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(55);
      logInfo(`${BUNDLE}CityPickerStateFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0079
     * @tc.name      Location_CityPickerStateFlow_0079
     * @tc.desc      CityPickerState call flow selectHeat > setLastLocation > scrollTo > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0079 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(0);
      logInfo(`step1 selectHeat(0): step1=${step1}`);
      expect(step1).assertEqual('\u5317\u4eac');
      subject.setLastLocation(50, 0);
      const step3: string = subject.scrollTo(198);
      logInfo(`step3 scrollTo(198): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step4 locate(["123", " ", "Hello World", ...: step4=${step4}`);
      expect(step4).assertEqual('\u5317\u4eac');
      logInfo(`selectHeat>setLastLocation>scrollTo>locat...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(198);
      logInfo(`selectHeat>setLastLocation>scrollTo>locat...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u5317\u4eac');
      logInfo(`selectHeat>setLastLocation>scrollTo>locat...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`selectHeat>setLastLocation>scrollTo>locat...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0080
     * @tc.name      Location_CityPickerStateFlow_0080
     * @tc.desc      CityPickerState call flow selectHeat > setLastLocation > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0080 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(40);
      logInfo(`step1 selectHeat(40): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(0, -1);
      const step3: string = subject.scrollTo(112);
      logInfo(`step3 scrollTo(112): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`selectHeat>setLastLocation>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(112);
      logInfo(`selectHeat>setLastLocation>scrollTo final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0081
     * @tc.name      Location_CityPickerStateFlow_0081
     * @tc.desc      CityPickerState call flow locate > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0081 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['a', '', 'abc']);
      logInfo(`step1 locate(["a", "", "abc"]): step1=${step1}`);
      expect(step1).assertEqual('a');
      subject.setLastLocation(0, 75);
      logInfo(`locate>setLastLocation final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('a');
      logInfo(`locate>setLastLocation final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(75);
      logInfo(`${BUNDLE}CityPickerStateFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0082
     * @tc.name      Location_CityPickerStateFlow_0082
     * @tc.desc      CityPickerState call flow selectHeat > scrollTo > selectHeat > scrollTo > locate keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0082 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(15);
      logInfo(`step1 selectHeat(15): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(143);
      logInfo(`step2 scrollTo(143): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectHeat(80.62);
      logInfo(`step3 selectHeat(80.62): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.scrollTo(200);
      logInfo(`step4 scrollTo(200): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step5 locate(["123", " ", "Hello World", ...: step5=${step5}`);
      expect(step5).assertEqual('123');
      logInfo(`selectHeat>scrollTo>selectHeat>scrollTo>l...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(200);
      logInfo(`selectHeat>scrollTo>selectHeat>scrollTo>l...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`${BUNDLE}CityPickerStateFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0083
     * @tc.name      Location_CityPickerStateFlow_0083
     * @tc.desc      CityPickerState call flow setLastLocation > scrollTo > selectGroupItem > selectGroupItem keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0083 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(45, 80);
      const step2: string = subject.scrollTo(-68);
      logInfo(`step2 scrollTo(-68): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectGroupItem('eZLwP');
      logInfo(`step3 selectGroupItem("eZLwP"): step3=${step3}`);
      expect(step3).assertEqual('eZLwP');
      const step4: string = subject.selectGroupItem('AA');
      logInfo(`step4 selectGroupItem("AA"): step4=${step4}`);
      expect(step4).assertEqual('AA');
      logInfo(`setLastLocation>scrollTo>selectGroupItem>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-68);
      logInfo(`setLastLocation>scrollTo>selectGroupItem>...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('AA');
      logInfo(`setLastLocation>scrollTo>selectGroupItem>...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('AA');
      logInfo(`setLastLocation>scrollTo>selectGroupItem>...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(45);
      logInfo(`setLastLocation>scrollTo>selectGroupItem>...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(80);
      logInfo(`${BUNDLE}CityPickerStateFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0084
     * @tc.name      Location_CityPickerStateFlow_0084
     * @tc.desc      CityPickerState call flow locate > selectGroupItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0084 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step1 locate(["Hello World", "a", " ", "a...: step1=${step1}`);
      expect(step1).assertEqual('Hello World');
      const step2: string = subject.selectGroupItem('a');
      logInfo(`step2 selectGroupItem("a"): step2=${step2}`);
      expect(step2).assertEqual('a');
      logInfo(`locate>selectGroupItem final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('a');
      logInfo(`locate>selectGroupItem final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('a');
      logInfo(`locate>selectGroupItem final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0085
     * @tc.name      Location_CityPickerStateFlow_0085
     * @tc.desc      CityPickerState call flow selectHeat > locate > selectHeat > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0085 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(148);
      logInfo(`step1 selectHeat(148): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['', 'a']);
      logInfo(`step2 locate(["", "a"]): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectHeat(-29);
      logInfo(`step3 selectHeat(-29): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.scrollTo(6.17);
      logInfo(`step4 scrollTo(6.17): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectHeat>locate>selectHeat>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(6.17, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0086
     * @tc.name      Location_CityPickerStateFlow_0086
     * @tc.desc      CityPickerState call flow selectHeat > selectGroupItem > locate > selectSubCity keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0086 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(132);
      logInfo(`step1 selectHeat(132): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('eZLwP');
      logInfo(`step2 selectGroupItem("eZLwP"): step2=${step2}`);
      expect(step2).assertEqual('eZLwP');
      const step3: string = subject.locate([]);
      logInfo(`step3 locate([]): step3=${step3}`);
      expect(step3).assertEqual('eZLwP');
      const step4: string = subject.selectSubCity('Hello World_1', '');
      logInfo(`step4 selectSubCity("Hello World_1", ""): step4=${step4}`);
      expect(step4).assertEqual('eZLwP');
      logInfo(`selectHeat>selectGroupItem>locate>selectS...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('eZLwP');
      logInfo(`selectHeat>selectGroupItem>locate>selectS...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('eZLwP');
      logInfo(`${BUNDLE}CityPickerStateFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0087
     * @tc.name      Location_CityPickerStateFlow_0087
     * @tc.desc      CityPickerState call flow selectSubCity > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0087 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity(' Hello World ', ' ');
      logInfo(`step1 selectSubCity(" Hello World ", " "): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(3, 65);
      logInfo(`selectSubCity>setLastLocation final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`selectSubCity>setLastLocation final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(65);
      logInfo(`${BUNDLE}CityPickerStateFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0088
     * @tc.name      Location_CityPickerStateFlow_0088
     * @tc.desc      CityPickerState call flow selectHeat > selectGroupItem > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0088 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(70);
      logInfo(`step1 selectHeat(70): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('J3b');
      logInfo(`step2 selectGroupItem("J3b"): step2=${step2}`);
      expect(step2).assertEqual('J3b');
      const step3: string = subject.selectHeat(200);
      logInfo(`step3 selectHeat(200): step3=${step3}`);
      expect(step3).assertEqual('J3b');
      logInfo(`selectHeat>selectGroupItem>selectHeat final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('J3b');
      logInfo(`selectHeat>selectGroupItem>selectHeat final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('J3b');
      logInfo(`${BUNDLE}CityPickerStateFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0089
     * @tc.name      Location_CityPickerStateFlow_0089
     * @tc.desc      CityPickerState call flow locate > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0089 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step1 locate(["Hello World", "a", " ", "a...: step1=${step1}`);
      expect(step1).assertEqual('Hello World');
      const step2: string = subject.scrollTo(69);
      logInfo(`step2 scrollTo(69): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`locate>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(69);
      logInfo(`locate>scrollTo final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0090
     * @tc.name      Location_CityPickerStateFlow_0090
     * @tc.desc      CityPickerState call flow scrollTo > selectHeat > selectHeat > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0090 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(57);
      logInfo(`step1 scrollTo(57): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(129);
      logInfo(`step2 selectHeat(129): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectHeat(170);
      logInfo(`step3 selectHeat(170): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectSubCity('', '   ');
      logInfo(`step4 selectSubCity("", "   "): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`scrollTo>selectHeat>selectHeat>selectSubC...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(57);
      logInfo(`${BUNDLE}CityPickerStateFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0091
     * @tc.name      Location_CityPickerStateFlow_0091
     * @tc.desc      CityPickerState call flow selectSubCity > scrollTo > selectGroupItem > selectSubCity > setLastLo...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0091 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('aa', 'abcabc');
      logInfo(`step1 selectSubCity("aa", "abcabc"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(142);
      logInfo(`step2 scrollTo(142): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectGroupItem('XCoBidfLX');
      logInfo(`step3 selectGroupItem("XCoBidfLX"): step3=${step3}`);
      expect(step3).assertEqual('XCoBidfLX');
      const step4: string = subject.selectSubCity('a', 'xabc');
      logInfo(`step4 selectSubCity("a", "xabc"): step4=${step4}`);
      expect(step4).assertEqual('XCoBidfLX');
      subject.setLastLocation(15, 5);
      logInfo(`selectSubCity>scrollTo>selectGroupItem>se...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(142);
      logInfo(`selectSubCity>scrollTo>selectGroupItem>se...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('XCoBidfLX');
      logInfo(`selectSubCity>scrollTo>selectGroupItem>se...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('XCoBidfLX');
      logInfo(`selectSubCity>scrollTo>selectGroupItem>se...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`selectSubCity>scrollTo>selectGroupItem>se...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(5);
      logInfo(`${BUNDLE}CityPickerStateFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0092
     * @tc.name      Location_CityPickerStateFlow_0092
     * @tc.desc      CityPickerState call flow selectSubCity > locate > selectGroupItem > selectHeat > selectGroupIte...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0092 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('', 'xHello World');
      logInfo(`step1 selectSubCity("", "xHello World"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['']);
      logInfo(`step2 locate([""]): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectGroupItem('ybbcOiTBwR');
      logInfo(`step3 selectGroupItem("ybbcOiTBwR"): step3=${step3}`);
      expect(step3).assertEqual('ybbcOiTBwR');
      const step4: string = subject.selectHeat(170);
      logInfo(`step4 selectHeat(170): step4=${step4}`);
      expect(step4).assertEqual('ybbcOiTBwR');
      const step5: string = subject.selectGroupItem('Zx8UqEh4Kb');
      logInfo(`step5 selectGroupItem("Zx8UqEh4Kb"): step5=${step5}`);
      expect(step5).assertEqual('Zx8UqEh4Kb');
      logInfo(`selectSubCity>locate>selectGroupItem>sele...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Zx8UqEh4Kb');
      logInfo(`selectSubCity>locate>selectGroupItem>sele...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Zx8UqEh4Kb');
      logInfo(`${BUNDLE}CityPickerStateFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0093
     * @tc.name      Location_CityPickerStateFlow_0093
     * @tc.desc      CityPickerState call flow selectGroupItem > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0093 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem(' Hello World ');
      logInfo(`step1 selectGroupItem(" Hello World "): step1=${step1}`);
      expect(step1).assertEqual(' Hello World ');
      const step2: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step2 locate(["Hello World", "a", " ", "a...: step2=${step2}`);
      expect(step2).assertEqual(' Hello World ');
      logInfo(`selectGroupItem>locate final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' Hello World ');
      logInfo(`selectGroupItem>locate final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' Hello World ');
      logInfo(`selectGroupItem>locate final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0094
     * @tc.name      Location_CityPickerStateFlow_0094
     * @tc.desc      CityPickerState call flow selectHeat > scrollTo > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0094 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(195);
      logInfo(`step1 selectHeat(195): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(55);
      logInfo(`step2 scrollTo(55): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(3, 65);
      logInfo(`selectHeat>scrollTo>setLastLocation final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(55);
      logInfo(`selectHeat>scrollTo>setLastLocation final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(3);
      logInfo(`selectHeat>scrollTo>setLastLocation final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(65);
      logInfo(`${BUNDLE}CityPickerStateFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0095
     * @tc.name      Location_CityPickerStateFlow_0095
     * @tc.desc      CityPickerState call flow setLastLocation > selectSubCity > scrollTo > locate > locate keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0095 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(105, 78);
      const step2: string = subject.selectSubCity('xabc', 'a_1');
      logInfo(`step2 selectSubCity("xabc", "a_1"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(50);
      logInfo(`step3 scrollTo(50): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.locate(['a', '', 'abc']);
      logInfo(`step4 locate(["a", "", "abc"]): step4=${step4}`);
      expect(step4).assertEqual('a');
      const step5: string = subject.locate(['']);
      logInfo(`step5 locate([""]): step5=${step5}`);
      expect(step5).assertEqual('a');
      logInfo(`setLastLocation>selectSubCity>scrollTo>lo...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(50);
      logInfo(`setLastLocation>selectSubCity>scrollTo>lo...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('a');
      logInfo(`setLastLocation>selectSubCity>scrollTo>lo...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(105);
      logInfo(`setLastLocation>selectSubCity>scrollTo>lo...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(78);
      logInfo(`${BUNDLE}CityPickerStateFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0096
     * @tc.name      Location_CityPickerStateFlow_0096
     * @tc.desc      CityPickerState call flow setLastLocation > selectGroupItem > locate > selectHeat keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0096 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(70, -1);
      const step2: string = subject.selectGroupItem('J3b');
      logInfo(`step2 selectGroupItem("J3b"): step2=${step2}`);
      expect(step2).assertEqual('J3b');
      const step3: string = subject.locate(['abc', 'abc']);
      logInfo(`step3 locate(["abc", "abc"]): step3=${step3}`);
      expect(step3).assertEqual('J3b');
      const step4: string = subject.selectHeat(162);
      logInfo(`step4 selectHeat(162): step4=${step4}`);
      expect(step4).assertEqual('J3b');
      logInfo(`setLastLocation>selectGroupItem>locate>se...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('J3b');
      logInfo(`setLastLocation>selectGroupItem>locate>se...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('J3b');
      logInfo(`setLastLocation>selectGroupItem>locate>se...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('abc');
      logInfo(`setLastLocation>selectGroupItem>locate>se...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(70);
      logInfo(`setLastLocation>selectGroupItem>locate>se...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0097
     * @tc.name      Location_CityPickerStateFlow_0097
     * @tc.desc      CityPickerState call flow scrollTo > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0097 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(20.14);
      logInfo(`step1 scrollTo(20.14): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(90, 78);
      logInfo(`scrollTo>setLastLocation final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(20.14, PRECISION);
      logInfo(`scrollTo>setLastLocation final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(90);
      logInfo(`scrollTo>setLastLocation final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(78);
      logInfo(`${BUNDLE}CityPickerStateFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0098
     * @tc.name      Location_CityPickerStateFlow_0098
     * @tc.desc      CityPickerState call flow selectHeat > selectSubCity > setLastLocation > scrollTo keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0098 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(175);
      logInfo(`step1 selectHeat(175): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity('a_1', 'Hello World_1');
      logInfo(`step2 selectSubCity("a_1", "Hello World_1"): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(105, 100);
      const step4: string = subject.scrollTo(183);
      logInfo(`step4 scrollTo(183): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectHeat>selectSubCity>setLastLocation>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(183);
      logInfo(`selectHeat>selectSubCity>setLastLocation>...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(105);
      logInfo(`selectHeat>selectSubCity>setLastLocation>...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(100);
      logInfo(`${BUNDLE}CityPickerStateFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0099
     * @tc.name      Location_CityPickerStateFlow_0099
     * @tc.desc      CityPickerState call flow setLastLocation > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0099 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(55, 78);
      subject.setLastLocation(20, 0);
      logInfo(`setLastLocation>setLastLocation final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`${BUNDLE}CityPickerStateFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0100
     * @tc.name      Location_CityPickerStateFlow_0100
     * @tc.desc      CityPickerState call flow selectGroupItem > selectGroupItem > selectGroupItem keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0100 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('');
      logInfo(`step1 selectGroupItem(""): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('xSample Title 123');
      logInfo(`step2 selectGroupItem("xSample Title 123"): step2=${step2}`);
      expect(step2).assertEqual('xSample Title 123');
      const step3: string = subject.selectGroupItem('xHello World');
      logInfo(`step3 selectGroupItem("xHello World"): step3=${step3}`);
      expect(step3).assertEqual('xHello World');
      logInfo(`selectGroupItem>selectGroupItem>selectGro...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('xHello World');
      logInfo(`selectGroupItem>selectGroupItem>selectGro...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('xHello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0101
     * @tc.name      Location_CityPickerStateFlow_0101
     * @tc.desc      CityPickerState call flow selectGroupItem > locate > selectHeat keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0101 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('AA');
      logInfo(`step1 selectGroupItem("AA"): step1=${step1}`);
      expect(step1).assertEqual('AA');
      const step2: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step2 locate(["", "a", "abc", "Hello Worl...: step2=${step2}`);
      expect(step2).assertEqual('AA');
      const step3: string = subject.selectHeat(132);
      logInfo(`step3 selectHeat(132): step3=${step3}`);
      expect(step3).assertEqual('AA');
      logInfo(`selectGroupItem>locate>selectHeat final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('AA');
      logInfo(`selectGroupItem>locate>selectHeat final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('AA');
      logInfo(`${BUNDLE}CityPickerStateFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0102
     * @tc.name      Location_CityPickerStateFlow_0102
     * @tc.desc      CityPickerState call flow selectHeat > locate > selectSubCity > selectSubCity > selectGroupItem ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0102 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(154);
      logInfo(`step1 selectHeat(154): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step2 locate(["", "a", "abc", "Hello Worl...: step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectSubCity(' _1', '');
      logInfo(`step3 selectSubCity(" _1", ""): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectSubCity('aa', ' ');
      logInfo(`step4 selectSubCity("aa", " "): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.selectGroupItem('eZLwP');
      logInfo(`step5 selectGroupItem("eZLwP"): step5=${step5}`);
      expect(step5).assertEqual('eZLwP');
      logInfo(`selectHeat>locate>selectSubCity>selectSub...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('eZLwP');
      logInfo(`selectHeat>locate>selectSubCity>selectSub...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('eZLwP');
      logInfo(`${BUNDLE}CityPickerStateFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0103
     * @tc.name      Location_CityPickerStateFlow_0103
     * @tc.desc      CityPickerState call flow scrollTo > scrollTo > selectSubCity > selectHeat > scrollTo keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0103 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(136);
      logInfo(`step1 scrollTo(136): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(70);
      logInfo(`step2 scrollTo(70): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectSubCity('xa', '123');
      logInfo(`step3 selectSubCity("xa", "123"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectHeat(61.39);
      logInfo(`step4 selectHeat(61.39): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.scrollTo(27);
      logInfo(`step5 scrollTo(27): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`scrollTo>scrollTo>selectSubCity>selectHea...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(27);
      logInfo(`${BUNDLE}CityPickerStateFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0104
     * @tc.name      Location_CityPickerStateFlow_0104
     * @tc.desc      CityPickerState call flow selectHeat > selectGroupItem > locate > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0104 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(11);
      logInfo(`step1 selectHeat(11): step1=${step1}`);
      expect(step1).assertEqual('\u6210\u90fd');
      const step2: string = subject.selectGroupItem(' a ');
      logInfo(`step2 selectGroupItem(" a "): step2=${step2}`);
      expect(step2).assertEqual(' a ');
      const step3: string = subject.locate(['abc', 'abc']);
      logInfo(`step3 locate(["abc", "abc"]): step3=${step3}`);
      expect(step3).assertEqual(' a ');
      const step4: string = subject.scrollTo(95);
      logInfo(`step4 scrollTo(95): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectHeat>selectGroupItem>locate>scrollT...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(95);
      logInfo(`selectHeat>selectGroupItem>locate>scrollT...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' a ');
      logInfo(`selectHeat>selectGroupItem>locate>scrollT...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' a ');
      logInfo(`selectHeat>selectGroupItem>locate>scrollT...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('abc');
      logInfo(`${BUNDLE}CityPickerStateFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0105
     * @tc.name      Location_CityPickerStateFlow_0105
     * @tc.desc      CityPickerState call flow setLastLocation > selectGroupItem > setLastLocation keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0105 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(105, 78);
      const step2: string = subject.selectGroupItem(' a ');
      logInfo(`step2 selectGroupItem(" a "): step2=${step2}`);
      expect(step2).assertEqual(' a ');
      subject.setLastLocation(110, 55);
      logInfo(`setLastLocation>selectGroupItem>setLastLo...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' a ');
      logInfo(`setLastLocation>selectGroupItem>setLastLo...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' a ');
      logInfo(`setLastLocation>selectGroupItem>setLastLo...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(110);
      logInfo(`setLastLocation>selectGroupItem>setLastLo...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(55);
      logInfo(`${BUNDLE}CityPickerStateFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0106
     * @tc.name      Location_CityPickerStateFlow_0106
     * @tc.desc      CityPickerState call flow selectGroupItem > scrollTo > scrollTo > selectSubCity keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0106 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('nBDuteOzM4Tb');
      logInfo(`step1 selectGroupItem("nBDuteOzM4Tb"): step1=${step1}`);
      expect(step1).assertEqual('nBDuteOzM4Tb');
      const step2: string = subject.scrollTo(0);
      logInfo(`step2 scrollTo(0): step2=${step2}`);
      expect(step2).assertEqual('A');
      const step3: string = subject.scrollTo(-68);
      logInfo(`step3 scrollTo(-68): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectSubCity('Hello World_1', ' Hello World ');
      logInfo(`step4 selectSubCity("Hello World_1", " He...: step4=${step4}`);
      expect(step4).assertEqual('nBDuteOzM4Tb');
      logInfo(`selectGroupItem>scrollTo>scrollTo>selectS...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-68);
      logInfo(`selectGroupItem>scrollTo>scrollTo>selectS...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('nBDuteOzM4Tb');
      logInfo(`selectGroupItem>scrollTo>scrollTo>selectS...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('nBDuteOzM4Tb');
      logInfo(`${BUNDLE}CityPickerStateFlow_0106 end`);
    });
  });
}
