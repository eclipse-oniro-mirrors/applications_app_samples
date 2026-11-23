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
export default function cityPickerStateFlow5Test(): void {
  describe('CityPickerStateFlow5Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0213
     * @tc.name      Location_CityPickerStateFlow_0213
     * @tc.desc      CityPickerState call flow selectHeat > selectSubCity > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0213 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(38.78);
      logInfo(`step1 selectHeat(38.78): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity('abc', ' ');
      logInfo(`step2 selectSubCity("abc", " "): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectSubCity(' ', 'xabc');
      logInfo(`step3 selectSubCity(" ", "xabc"): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`${BUNDLE}CityPickerStateFlow_0213 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0214
     * @tc.name      Location_CityPickerStateFlow_0214
     * @tc.desc      CityPickerState call flow selectGroupItem > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0214 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('Zx8UqEh4Kb');
      logInfo(`step1 selectGroupItem("Zx8UqEh4Kb"): step1=${step1}`);
      expect(step1).assertEqual('Zx8UqEh4Kb');
      subject.setLastLocation(70, 0);
      logInfo(`selectGroupItem>setLastLocation final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Zx8UqEh4Kb');
      logInfo(`selectGroupItem>setLastLocation final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Zx8UqEh4Kb');
      logInfo(`selectGroupItem>setLastLocation final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(70);
      logInfo(`${BUNDLE}CityPickerStateFlow_0214 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0215
     * @tc.name      Location_CityPickerStateFlow_0215
     * @tc.desc      CityPickerState call flow selectGroupItem > setLastLocation > setLastLocation > scrollTo keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0215 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('sn5Bb3a');
      logInfo(`step1 selectGroupItem("sn5Bb3a"): step1=${step1}`);
      expect(step1).assertEqual('sn5Bb3a');
      subject.setLastLocation(65, 20);
      subject.setLastLocation(2, 0);
      const step4: string = subject.scrollTo(52.87);
      logInfo(`step4 scrollTo(52.87): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectGroupItem>setLastLocation>setLastLo...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(52.87, PRECISION);
      logInfo(`selectGroupItem>setLastLocation>setLastLo...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('sn5Bb3a');
      logInfo(`selectGroupItem>setLastLocation>setLastLo...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('sn5Bb3a');
      logInfo(`selectGroupItem>setLastLocation>setLastLo...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`${BUNDLE}CityPickerStateFlow_0215 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0216
     * @tc.name      Location_CityPickerStateFlow_0216
     * @tc.desc      CityPickerState call flow selectGroupItem > setLastLocation > locate > locate > setLastLocation ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0216 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('\u4e2d\u6587_1');
      logInfo(`step1 selectGroupItem("??_1"): step1=${step1}`);
      expect(step1).assertEqual('\u4e2d\u6587_1');
      subject.setLastLocation(0, 192);
      const step3: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step3 locate(["Hello World", "a", " ", "a...: step3=${step3}`);
      expect(step3).assertEqual('\u4e2d\u6587_1');
      const step4: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step4 locate(["123", " ", "Hello World", ...: step4=${step4}`);
      expect(step4).assertEqual('\u4e2d\u6587_1');
      subject.setLastLocation(0, 25);
      logInfo(`selectGroupItem>setLastLocation>locate>lo...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u4e2d\u6587_1');
      logInfo(`selectGroupItem>setLastLocation>locate>lo...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('\u4e2d\u6587_1');
      logInfo(`selectGroupItem>setLastLocation>locate>lo...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`selectGroupItem>setLastLocation>locate>lo...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(25);
      logInfo(`${BUNDLE}CityPickerStateFlow_0216 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0217
     * @tc.name      Location_CityPickerStateFlow_0217
     * @tc.desc      CityPickerState call flow selectGroupItem > selectHeat > selectSubCity > setLastLocation keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0217 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('Q291uJ1jJ');
      logInfo(`step1 selectGroupItem("Q291uJ1jJ"): step1=${step1}`);
      expect(step1).assertEqual('Q291uJ1jJ');
      const step2: string = subject.selectHeat(-10);
      logInfo(`step2 selectHeat(-10): step2=${step2}`);
      expect(step2).assertEqual('Q291uJ1jJ');
      const step3: string = subject.selectSubCity('xa', '');
      logInfo(`step3 selectSubCity("xa", ""): step3=${step3}`);
      expect(step3).assertEqual('Q291uJ1jJ');
      subject.setLastLocation(40, 0);
      logInfo(`selectGroupItem>selectHeat>selectSubCity>...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Q291uJ1jJ');
      logInfo(`selectGroupItem>selectHeat>selectSubCity>...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Q291uJ1jJ');
      logInfo(`selectGroupItem>selectHeat>selectSubCity>...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(40);
      logInfo(`${BUNDLE}CityPickerStateFlow_0217 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0218
     * @tc.name      Location_CityPickerStateFlow_0218
     * @tc.desc      CityPickerState call flow selectSubCity > setLastLocation > selectGroupItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0218 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('Hello World', 'aa');
      logInfo(`step1 selectSubCity("Hello World", "aa"): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(105, 100);
      const step3: string = subject.selectGroupItem('abcabc');
      logInfo(`step3 selectGroupItem("abcabc"): step3=${step3}`);
      expect(step3).assertEqual('abcabc');
      logInfo(`selectSubCity>setLastLocation>selectGroup...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('abcabc');
      logInfo(`selectSubCity>setLastLocation>selectGroup...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('abcabc');
      logInfo(`selectSubCity>setLastLocation>selectGroup...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(105);
      logInfo(`selectSubCity>setLastLocation>selectGroup...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(100);
      logInfo(`${BUNDLE}CityPickerStateFlow_0218 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0219
     * @tc.name      Location_CityPickerStateFlow_0219
     * @tc.desc      CityPickerState call flow setLastLocation > setLastLocation > locate > setLastLocation > selectH...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0219 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(110, 5);
      subject.setLastLocation(0, 1);
      const step3: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step3 locate(["Hello World", "a", " ", "a...: step3=${step3}`);
      expect(step3).assertEqual('Hello World');
      subject.setLastLocation(50, -1);
      const step5: string = subject.selectHeat(11);
      logInfo(`step5 selectHeat(11): step5=${step5}`);
      expect(step5).assertEqual('\u6210\u90fd');
      logInfo(`setLastLocation>setLastLocation>locate>se...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u6210\u90fd');
      logInfo(`setLastLocation>setLastLocation>locate>se...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`setLastLocation>setLastLocation>locate>se...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(50);
      logInfo(`setLastLocation>setLastLocation>locate>se...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateFlow_0219 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0220
     * @tc.name      Location_CityPickerStateFlow_0220
     * @tc.desc      CityPickerState call flow setLastLocation > selectSubCity > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0220 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(-1, 0);
      const step2: string = subject.selectSubCity('', 'Hello World');
      logInfo(`step2 selectSubCity("", "Hello World"): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(0, 45);
      logInfo(`setLastLocation>selectSubCity>setLastLoca...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(45);
      logInfo(`${BUNDLE}CityPickerStateFlow_0220 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0221
     * @tc.name      Location_CityPickerStateFlow_0221
     * @tc.desc      CityPickerState call flow setLastLocation > selectSubCity keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0221 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(70, 105);
      const step2: string = subject.selectSubCity('123', 'Hello WorldHello World');
      logInfo(`step2 selectSubCity("123", "Hello WorldHe...: step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`setLastLocation>selectSubCity final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(70);
      logInfo(`setLastLocation>selectSubCity final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(105);
      logInfo(`${BUNDLE}CityPickerStateFlow_0221 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0222
     * @tc.name      Location_CityPickerStateFlow_0222
     * @tc.desc      CityPickerState call flow setLastLocation > selectGroupItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0222 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 90);
      const step2: string = subject.selectGroupItem('A');
      logInfo(`step2 selectGroupItem("A"): step2=${step2}`);
      expect(step2).assertEqual('A');
      logInfo(`setLastLocation>selectGroupItem final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('A');
      logInfo(`setLastLocation>selectGroupItem final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('A');
      logInfo(`setLastLocation>selectGroupItem final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(90);
      logInfo(`${BUNDLE}CityPickerStateFlow_0222 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0223
     * @tc.name      Location_CityPickerStateFlow_0223
     * @tc.desc      CityPickerState call flow selectSubCity > locate > selectSubCity > selectGroupItem keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0223 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('x ', '');
      logInfo(`step1 selectSubCity("x ", ""): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['', 'a']);
      logInfo(`step2 locate(["", "a"]): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectSubCity('Hello World_1', 'aa');
      logInfo(`step3 selectSubCity("Hello World_1", "aa"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectGroupItem(' Sample Title 123 ');
      logInfo(`step4 selectGroupItem(" Sample Title 123 "): step4=${step4}`);
      expect(step4).assertEqual(' Sample Title 123 ');
      logInfo(`selectSubCity>locate>selectSubCity>select...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' Sample Title 123 ');
      logInfo(`selectSubCity>locate>selectSubCity>select...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' Sample Title 123 ');
      logInfo(`${BUNDLE}CityPickerStateFlow_0223 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0224
     * @tc.name      Location_CityPickerStateFlow_0224
     * @tc.desc      CityPickerState call flow scrollTo > setLastLocation > selectGroupItem > locate > locate keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0224 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(56);
      logInfo(`step1 scrollTo(56): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(0, 95);
      const step3: string = subject.selectGroupItem('   ');
      logInfo(`step3 selectGroupItem("   "): step3=${step3}`);
      expect(step3).assertEqual('   ');
      const step4: string = subject.locate([]);
      logInfo(`step4 locate([]): step4=${step4}`);
      expect(step4).assertEqual('   ');
      const step5: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step5 locate(["Hello World", "a", " ", "a...: step5=${step5}`);
      expect(step5).assertEqual('   ');
      logInfo(`scrollTo>setLastLocation>selectGroupItem>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(56);
      logInfo(`scrollTo>setLastLocation>selectGroupItem>...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('   ');
      logInfo(`scrollTo>setLastLocation>selectGroupItem>...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('   ');
      logInfo(`scrollTo>setLastLocation>selectGroupItem>...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`scrollTo>setLastLocation>selectGroupItem>...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(95);
      logInfo(`${BUNDLE}CityPickerStateFlow_0224 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0225
     * @tc.name      Location_CityPickerStateFlow_0225
     * @tc.desc      CityPickerState call flow scrollTo > selectHeat > scrollTo > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0225 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(63);
      logInfo(`step1 scrollTo(63): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(1);
      logInfo(`step2 selectHeat(1): step2=${step2}`);
      expect(step2).assertEqual('\u4e0a\u6d77');
      const step3: string = subject.scrollTo(172);
      logInfo(`step3 scrollTo(172): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step4 locate(["123", " ", "Hello World", ...: step4=${step4}`);
      expect(step4).assertEqual('\u4e0a\u6d77');
      logInfo(`scrollTo>selectHeat>scrollTo>locate final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(172);
      logInfo(`scrollTo>selectHeat>scrollTo>locate final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u4e0a\u6d77');
      logInfo(`scrollTo>selectHeat>scrollTo>locate final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('123');
      logInfo(`${BUNDLE}CityPickerStateFlow_0225 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0226
     * @tc.name      Location_CityPickerStateFlow_0226
     * @tc.desc      CityPickerState call flow selectGroupItem > selectHeat > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0226 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('O3KVH5QkaaQ');
      logInfo(`step1 selectGroupItem("O3KVH5QkaaQ"): step1=${step1}`);
      expect(step1).assertEqual('O3KVH5QkaaQ');
      const step2: string = subject.selectHeat(129);
      logInfo(`step2 selectHeat(129): step2=${step2}`);
      expect(step2).assertEqual('O3KVH5QkaaQ');
      const step3: string = subject.scrollTo(52.87);
      logInfo(`step3 scrollTo(52.87): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`selectGroupItem>selectHeat>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(52.87, PRECISION);
      logInfo(`selectGroupItem>selectHeat>scrollTo final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('O3KVH5QkaaQ');
      logInfo(`selectGroupItem>selectHeat>scrollTo final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('O3KVH5QkaaQ');
      logInfo(`${BUNDLE}CityPickerStateFlow_0226 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0227
     * @tc.name      Location_CityPickerStateFlow_0227
     * @tc.desc      CityPickerState call flow scrollTo > selectHeat > setLastLocation > selectGroupItem > selectHeat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0227 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(131);
      logInfo(`step1 scrollTo(131): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectHeat(59.22);
      logInfo(`step2 selectHeat(59.22): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(30, 115);
      const step4: string = subject.selectGroupItem('HelloHello');
      logInfo(`step4 selectGroupItem("HelloHello"): step4=${step4}`);
      expect(step4).assertEqual('HelloHello');
      const step5: string = subject.selectHeat(61.39);
      logInfo(`step5 selectHeat(61.39): step5=${step5}`);
      expect(step5).assertEqual('HelloHello');
      logInfo(`scrollTo>selectHeat>setLastLocation>selec...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(131);
      logInfo(`scrollTo>selectHeat>setLastLocation>selec...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('HelloHello');
      logInfo(`scrollTo>selectHeat>setLastLocation>selec...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('HelloHello');
      logInfo(`scrollTo>selectHeat>setLastLocation>selec...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(30);
      logInfo(`scrollTo>selectHeat>setLastLocation>selec...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(115);
      logInfo(`${BUNDLE}CityPickerStateFlow_0227 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0228
     * @tc.name      Location_CityPickerStateFlow_0228
     * @tc.desc      CityPickerState call flow locate > locate > locate > selectSubCity > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0228 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['abc', 'abc']);
      logInfo(`step1 locate(["abc", "abc"]): step1=${step1}`);
      expect(step1).assertEqual('abc');
      const step2: string = subject.locate(['', 'a']);
      logInfo(`step2 locate(["", "a"]): step2=${step2}`);
      expect(step2).assertEqual('abc');
      const step3: string = subject.locate(['']);
      logInfo(`step3 locate([""]): step3=${step3}`);
      expect(step3).assertEqual('abc');
      const step4: string = subject.selectSubCity(' a ', ' 123 ');
      logInfo(`step4 selectSubCity(" a ", " 123 "): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.locate(['a', '', 'abc']);
      logInfo(`step5 locate(["a", "", "abc"]): step5=${step5}`);
      expect(step5).assertEqual('a');
      logInfo(`locate>locate>locate>selectSubCity>locate...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('a');
      logInfo(`${BUNDLE}CityPickerStateFlow_0228 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0229
     * @tc.name      Location_CityPickerStateFlow_0229
     * @tc.desc      CityPickerState call flow scrollTo > setLastLocation > selectGroupItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0229 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(45.84);
      logInfo(`step1 scrollTo(45.84): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(2, 45);
      const step3: string = subject.selectGroupItem('xA');
      logInfo(`step3 selectGroupItem("xA"): step3=${step3}`);
      expect(step3).assertEqual('xA');
      logInfo(`scrollTo>setLastLocation>selectGroupItem ...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(45.84, PRECISION);
      logInfo(`scrollTo>setLastLocation>selectGroupItem ...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('xA');
      logInfo(`scrollTo>setLastLocation>selectGroupItem ...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('xA');
      logInfo(`scrollTo>setLastLocation>selectGroupItem ...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`scrollTo>setLastLocation>selectGroupItem ...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(45);
      logInfo(`${BUNDLE}CityPickerStateFlow_0229 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0230
     * @tc.name      Location_CityPickerStateFlow_0230
     * @tc.desc      CityPickerState call flow selectHeat > selectGroupItem > selectSubCity > setLastLocation > scrol...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0230 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(36);
      logInfo(`step1 selectHeat(36): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('Sample Title 123Sample Title 123');
      logInfo(`step2 selectGroupItem("Sample Title 123Sa...: step2=${step2}`);
      expect(step2).assertEqual('Sample Title 123Sample Title 123');
      const step3: string = subject.selectSubCity('   ', 'abc_1');
      logInfo(`step3 selectSubCity("   ", "abc_1"): step3=${step3}`);
      expect(step3).assertEqual('Sample Title 123Sample Title 123');
      subject.setLastLocation(64.57, 60);
      const step5: string = subject.scrollTo(0);
      logInfo(`step5 scrollTo(0): step5=${step5}`);
      expect(step5).assertEqual('A');
      logInfo(`selectHeat>selectGroupItem>selectSubCity>...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`selectHeat>selectGroupItem>selectSubCity>...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('Sample Title 123Sample Title 123');
      logInfo(`selectHeat>selectGroupItem>selectSubCity>...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertClose(64.57, PRECISION);
      logInfo(`selectHeat>selectGroupItem>selectSubCity>...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(60);
      logInfo(`${BUNDLE}CityPickerStateFlow_0230 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0231
     * @tc.name      Location_CityPickerStateFlow_0231
     * @tc.desc      CityPickerState call flow selectHeat > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0231 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(47);
      logInfo(`step1 selectHeat(47): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(25, 30);
      logInfo(`selectHeat>setLastLocation final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`selectHeat>setLastLocation final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(30);
      logInfo(`${BUNDLE}CityPickerStateFlow_0231 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0232
     * @tc.name      Location_CityPickerStateFlow_0232
     * @tc.desc      CityPickerState call flow locate > setLastLocation > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0232 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['a', '', 'abc']);
      logInfo(`step1 locate(["a", "", "abc"]): step1=${step1}`);
      expect(step1).assertEqual('a');
      subject.setLastLocation(15, 50);
      subject.setLastLocation(55, -1);
      logInfo(`locate>setLastLocation>setLastLocation final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('a');
      logInfo(`locate>setLastLocation>setLastLocation final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(55);
      logInfo(`locate>setLastLocation>setLastLocation final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateFlow_0232 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0233
     * @tc.name      Location_CityPickerStateFlow_0233
     * @tc.desc      CityPickerState call flow setLastLocation > setLastLocation > scrollTo > selectGroupItem > selec...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0233 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 50);
      subject.setLastLocation(0, 110);
      const step3: string = subject.scrollTo(-75);
      logInfo(`step3 scrollTo(-75): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectGroupItem('oP');
      logInfo(`step4 selectGroupItem("oP"): step4=${step4}`);
      expect(step4).assertEqual('oP');
      const step5: string = subject.selectHeat(65);
      logInfo(`step5 selectHeat(65): step5=${step5}`);
      expect(step5).assertEqual('oP');
      logInfo(`setLastLocation>setLastLocation>scrollTo>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-75);
      logInfo(`setLastLocation>setLastLocation>scrollTo>...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('oP');
      logInfo(`setLastLocation>setLastLocation>scrollTo>...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('oP');
      logInfo(`setLastLocation>setLastLocation>scrollTo>...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(110);
      logInfo(`${BUNDLE}CityPickerStateFlow_0233 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0234
     * @tc.name      Location_CityPickerStateFlow_0234
     * @tc.desc      CityPickerState call flow locate > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0234 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step1 locate(["Hello World", "a", " ", "a...: step1=${step1}`);
      expect(step1).assertEqual('Hello World');
      subject.setLastLocation(50, 192);
      logInfo(`locate>setLastLocation final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`locate>setLastLocation final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(50);
      logInfo(`locate>setLastLocation final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(192);
      logInfo(`${BUNDLE}CityPickerStateFlow_0234 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0235
     * @tc.name      Location_CityPickerStateFlow_0235
     * @tc.desc      CityPickerState call flow scrollTo > selectSubCity > selectSubCity > setLastLocation keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0235 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(87.51);
      logInfo(`step1 scrollTo(87.51): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity('x ', ' 123 ');
      logInfo(`step2 selectSubCity("x ", " 123 "): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectSubCity('   ', 'abc_1');
      logInfo(`step3 selectSubCity("   ", "abc_1"): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.setLastLocation(64.57, 60);
      logInfo(`scrollTo>selectSubCity>selectSubCity>setL...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(87.51, PRECISION);
      logInfo(`scrollTo>selectSubCity>selectSubCity>setL...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertClose(64.57, PRECISION);
      logInfo(`scrollTo>selectSubCity>selectSubCity>setL...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(60);
      logInfo(`${BUNDLE}CityPickerStateFlow_0235 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0236
     * @tc.name      Location_CityPickerStateFlow_0236
     * @tc.desc      CityPickerState call flow scrollTo > setLastLocation > setLastLocation > setLastLocation keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0236 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(-54);
      logInfo(`step1 scrollTo(-54): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(40, 100);
      subject.setLastLocation(0, -1);
      subject.setLastLocation(20, 95);
      logInfo(`scrollTo>setLastLocation>setLastLocation>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-54);
      logInfo(`scrollTo>setLastLocation>setLastLocation>...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(20);
      logInfo(`scrollTo>setLastLocation>setLastLocation>...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(95);
      logInfo(`${BUNDLE}CityPickerStateFlow_0236 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0237
     * @tc.name      Location_CityPickerStateFlow_0237
     * @tc.desc      CityPickerState call flow selectGroupItem > selectGroupItem > selectSubCity > scrollTo > selectH...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0237 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('Sample Title 123_1');
      logInfo(`step1 selectGroupItem("Sample Title 123_1"): step1=${step1}`);
      expect(step1).assertEqual('Sample Title 123_1');
      const step2: string = subject.selectGroupItem('VBb');
      logInfo(`step2 selectGroupItem("VBb"): step2=${step2}`);
      expect(step2).assertEqual('VBb');
      const step3: string = subject.selectSubCity('abc_1', 'xabc');
      logInfo(`step3 selectSubCity("abc_1", "xabc"): step3=${step3}`);
      expect(step3).assertEqual('VBb');
      const step4: string = subject.scrollTo(20);
      logInfo(`step4 scrollTo(20): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.selectHeat(150);
      logInfo(`step5 selectHeat(150): step5=${step5}`);
      expect(step5).assertEqual('VBb');
      logInfo(`selectGroupItem>selectGroupItem>selectSub...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(20);
      logInfo(`selectGroupItem>selectGroupItem>selectSub...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('VBb');
      logInfo(`selectGroupItem>selectGroupItem>selectSub...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('VBb');
      logInfo(`${BUNDLE}CityPickerStateFlow_0237 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0238
     * @tc.name      Location_CityPickerStateFlow_0238
     * @tc.desc      CityPickerState call flow selectHeat > scrollTo > selectHeat > selectGroupItem keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0238 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(-3);
      logInfo(`step1 selectHeat(-3): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(60);
      logInfo(`step2 scrollTo(60): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectHeat(110);
      logInfo(`step3 selectHeat(110): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectGroupItem('abc');
      logInfo(`step4 selectGroupItem("abc"): step4=${step4}`);
      expect(step4).assertEqual('abc');
      logInfo(`selectHeat>scrollTo>selectHeat>selectGrou...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(60);
      logInfo(`selectHeat>scrollTo>selectHeat>selectGrou...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('abc');
      logInfo(`selectHeat>scrollTo>selectHeat>selectGrou...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('abc');
      logInfo(`${BUNDLE}CityPickerStateFlow_0238 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0239
     * @tc.name      Location_CityPickerStateFlow_0239
     * @tc.desc      CityPickerState call flow selectHeat > scrollTo > selectSubCity > selectSubCity > selectSubCity ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0239 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(25);
      logInfo(`step1 selectHeat(25): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(58.76);
      logInfo(`step2 scrollTo(58.76): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectSubCity('aa', 'Hello World');
      logInfo(`step3 selectSubCity("aa", "Hello World"): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectSubCity(' _1', 'xa');
      logInfo(`step4 selectSubCity(" _1", "xa"): step4=${step4}`);
      expect(step4).assertEqual('');
      const step5: string = subject.selectSubCity('aa', 'Hello World');
      logInfo(`step5 selectSubCity("aa", "Hello World"): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`selectHeat>scrollTo>selectSubCity>selectS...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(58.76, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateFlow_0239 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0240
     * @tc.name      Location_CityPickerStateFlow_0240
     * @tc.desc      CityPickerState call flow locate > setLastLocation > scrollTo > scrollTo > setLastLocation keeps...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0240 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step1 locate(["Hello World", "a", " ", "a...: step1=${step1}`);
      expect(step1).assertEqual('Hello World');
      subject.setLastLocation(35, 85);
      const step3: string = subject.scrollTo(190);
      logInfo(`step3 scrollTo(190): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.scrollTo(200);
      logInfo(`step4 scrollTo(200): step4=${step4}`);
      expect(step4).assertEqual('');
      subject.setLastLocation(50, 60);
      logInfo(`locate>setLastLocation>scrollTo>scrollTo>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(200);
      logInfo(`locate>setLastLocation>scrollTo>scrollTo>...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`locate>setLastLocation>scrollTo>scrollTo>...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(50);
      logInfo(`locate>setLastLocation>scrollTo>scrollTo>...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(60);
      logInfo(`${BUNDLE}CityPickerStateFlow_0240 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0241
     * @tc.name      Location_CityPickerStateFlow_0241
     * @tc.desc      CityPickerState call flow setLastLocation > selectGroupItem > selectSubCity > setLastLocation > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0241 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(80, 70);
      const step2: string = subject.selectGroupItem('sn5Bb3a');
      logInfo(`step2 selectGroupItem("sn5Bb3a"): step2=${step2}`);
      expect(step2).assertEqual('sn5Bb3a');
      const step3: string = subject.selectSubCity('  ', '');
      logInfo(`step3 selectSubCity("  ", ""): step3=${step3}`);
      expect(step3).assertEqual('sn5Bb3a');
      subject.setLastLocation(0, 50);
      const step5: string = subject.selectHeat(-12);
      logInfo(`step5 selectHeat(-12): step5=${step5}`);
      expect(step5).assertEqual('sn5Bb3a');
      logInfo(`setLastLocation>selectGroupItem>selectSub...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('sn5Bb3a');
      logInfo(`setLastLocation>selectGroupItem>selectSub...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('sn5Bb3a');
      logInfo(`setLastLocation>selectGroupItem>selectSub...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateFlow_0241 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0242
     * @tc.name      Location_CityPickerStateFlow_0242
     * @tc.desc      CityPickerState call flow setLastLocation > locate > selectGroupItem > scrollTo keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0242 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(50, -1);
      const step2: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step2 locate(["", "a", "abc", "Hello Worl...: step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectGroupItem(' \u4e2d\u6587 ');
      logInfo(`step3 selectGroupItem(" ?? "): step3=${step3}`);
      expect(step3).assertEqual(' \u4e2d\u6587 ');
      const step4: string = subject.scrollTo(8);
      logInfo(`step4 scrollTo(8): step4=${step4}`);
      expect(step4).assertEqual('N');
      logInfo(`setLastLocation>locate>selectGroupItem>sc...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(8);
      logInfo(`setLastLocation>locate>selectGroupItem>sc...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' \u4e2d\u6587 ');
      logInfo(`setLastLocation>locate>selectGroupItem>sc...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' \u4e2d\u6587 ');
      logInfo(`setLastLocation>locate>selectGroupItem>sc...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(50);
      logInfo(`setLastLocation>locate>selectGroupItem>sc...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(-1);
      logInfo(`${BUNDLE}CityPickerStateFlow_0242 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0243
     * @tc.name      Location_CityPickerStateFlow_0243
     * @tc.desc      CityPickerState call flow locate > locate > scrollTo > setLastLocation > scrollTo keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0243 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['abc', 'abc']);
      logInfo(`step1 locate(["abc", "abc"]): step1=${step1}`);
      expect(step1).assertEqual('abc');
      const step2: string = subject.locate(['', 'a']);
      logInfo(`step2 locate(["", "a"]): step2=${step2}`);
      expect(step2).assertEqual('abc');
      const step3: string = subject.scrollTo(179);
      logInfo(`step3 scrollTo(179): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.setLastLocation(65, 95);
      const step5: string = subject.scrollTo(183);
      logInfo(`step5 scrollTo(183): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`locate>locate>scrollTo>setLastLocation>sc...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(183);
      logInfo(`locate>locate>scrollTo>setLastLocation>sc...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('abc');
      logInfo(`locate>locate>scrollTo>setLastLocation>sc...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(65);
      logInfo(`locate>locate>scrollTo>setLastLocation>sc...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(95);
      logInfo(`${BUNDLE}CityPickerStateFlow_0243 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0244
     * @tc.name      Location_CityPickerStateFlow_0244
     * @tc.desc      CityPickerState call flow setLastLocation > setLastLocation > selectSubCity > selectHeat keeps s...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0244 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 50);
      subject.setLastLocation(0, 40);
      const step3: string = subject.selectSubCity('Hello WorldHello World', ' Hello World ');
      logInfo(`step3 selectSubCity("Hello WorldHello Wor...: step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectHeat(85);
      logInfo(`step4 selectHeat(85): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`setLastLocation>setLastLocation>selectSub...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(40);
      logInfo(`${BUNDLE}CityPickerStateFlow_0244 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0245
     * @tc.name      Location_CityPickerStateFlow_0245
     * @tc.desc      CityPickerState call flow locate > selectGroupItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0245 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['']);
      logInfo(`step1 locate([""]): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectGroupItem('IL35fjYIc8ZN');
      logInfo(`step2 selectGroupItem("IL35fjYIc8ZN"): step2=${step2}`);
      expect(step2).assertEqual('IL35fjYIc8ZN');
      logInfo(`locate>selectGroupItem final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('IL35fjYIc8ZN');
      logInfo(`locate>selectGroupItem final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('IL35fjYIc8ZN');
      logInfo(`${BUNDLE}CityPickerStateFlow_0245 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0246
     * @tc.name      Location_CityPickerStateFlow_0246
     * @tc.desc      CityPickerState call flow selectGroupItem > locate > selectGroupItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0246 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('A');
      logInfo(`step1 selectGroupItem("A"): step1=${step1}`);
      expect(step1).assertEqual('A');
      const step2: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step2 locate(["", "a", "abc", "Hello Worl...: step2=${step2}`);
      expect(step2).assertEqual('A');
      const step3: string = subject.selectGroupItem(' 123 ');
      logInfo(`step3 selectGroupItem(" 123 "): step3=${step3}`);
      expect(step3).assertEqual(' 123 ');
      logInfo(`selectGroupItem>locate>selectGroupItem final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' 123 ');
      logInfo(`selectGroupItem>locate>selectGroupItem final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' 123 ');
      logInfo(`${BUNDLE}CityPickerStateFlow_0246 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0247
     * @tc.name      Location_CityPickerStateFlow_0247
     * @tc.desc      CityPickerState call flow selectGroupItem > scrollTo > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0247 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem(' a ');
      logInfo(`step1 selectGroupItem(" a "): step1=${step1}`);
      expect(step1).assertEqual(' a ');
      const step2: string = subject.scrollTo(160);
      logInfo(`step2 scrollTo(160): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.locate(['']);
      logInfo(`step3 locate([""]): step3=${step3}`);
      expect(step3).assertEqual(' a ');
      logInfo(`selectGroupItem>scrollTo>locate final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(160);
      logInfo(`selectGroupItem>scrollTo>locate final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual(' a ');
      logInfo(`selectGroupItem>scrollTo>locate final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual(' a ');
      logInfo(`${BUNDLE}CityPickerStateFlow_0247 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0248
     * @tc.name      Location_CityPickerStateFlow_0248
     * @tc.desc      CityPickerState call flow scrollTo > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0248 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(183);
      logInfo(`step1 scrollTo(183): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(40, 10);
      logInfo(`scrollTo>setLastLocation final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(183);
      logInfo(`scrollTo>setLastLocation final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(40);
      logInfo(`scrollTo>setLastLocation final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(10);
      logInfo(`${BUNDLE}CityPickerStateFlow_0248 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0249
     * @tc.name      Location_CityPickerStateFlow_0249
     * @tc.desc      CityPickerState call flow scrollTo > scrollTo > scrollTo > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0249 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(157);
      logInfo(`step1 scrollTo(157): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(45);
      logInfo(`step2 scrollTo(45): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(8);
      logInfo(`step3 scrollTo(8): step3=${step3}`);
      expect(step3).assertEqual('N');
      const step4: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step4 locate(["", "a", "abc", "Hello Worl...: step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`scrollTo>scrollTo>scrollTo>locate final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(8);
      logInfo(`${BUNDLE}CityPickerStateFlow_0249 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0250
     * @tc.name      Location_CityPickerStateFlow_0250
     * @tc.desc      CityPickerState call flow selectGroupItem > selectSubCity > selectSubCity > locate > locate keep...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0250 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('\u4e2d\u6587');
      logInfo(`step1 selectGroupItem("??"): step1=${step1}`);
      expect(step1).assertEqual('\u4e2d\u6587');
      const step2: string = subject.selectSubCity('Hello World', '');
      logInfo(`step2 selectSubCity("Hello World", ""): step2=${step2}`);
      expect(step2).assertEqual('\u4e2d\u6587');
      const step3: string = subject.selectSubCity('xHello World', '');
      logInfo(`step3 selectSubCity("xHello World", ""): step3=${step3}`);
      expect(step3).assertEqual('\u4e2d\u6587');
      const step4: string = subject.locate(['', 'a', 'abc', 'Hello World', ' ']);
      logInfo(`step4 locate(["", "a", "abc", "Hello Worl...: step4=${step4}`);
      expect(step4).assertEqual('\u4e2d\u6587');
      const step5: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step5 locate(["Hello World", "a", " ", "a...: step5=${step5}`);
      expect(step5).assertEqual('\u4e2d\u6587');
      logInfo(`selectGroupItem>selectSubCity>selectSubCi...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('\u4e2d\u6587');
      logInfo(`selectGroupItem>selectSubCity>selectSubCi...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('\u4e2d\u6587');
      logInfo(`selectGroupItem>selectSubCity>selectSubCi...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0250 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0251
     * @tc.name      Location_CityPickerStateFlow_0251
     * @tc.desc      CityPickerState call flow setLastLocation > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0251 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(110, 5);
      subject.setLastLocation(35, 90);
      logInfo(`setLastLocation>setLastLocation final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(35);
      logInfo(`setLastLocation>setLastLocation final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(90);
      logInfo(`${BUNDLE}CityPickerStateFlow_0251 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0252
     * @tc.name      Location_CityPickerStateFlow_0252
     * @tc.desc      CityPickerState call flow setLastLocation > selectSubCity > setLastLocation > setLastLocation > ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0252 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(45, 80);
      const step2: string = subject.selectSubCity(' abc ', '');
      logInfo(`step2 selectSubCity(" abc ", ""): step2=${step2}`);
      expect(step2).assertEqual('');
      subject.setLastLocation(45, 90);
      subject.setLastLocation(40, 192);
      const step5: string = subject.selectHeat(190);
      logInfo(`step5 selectHeat(190): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`setLastLocation>selectSubCity>setLastLoca...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(40);
      logInfo(`setLastLocation>selectSubCity>setLastLoca...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(192);
      logInfo(`${BUNDLE}CityPickerStateFlow_0252 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0253
     * @tc.name      Location_CityPickerStateFlow_0253
     * @tc.desc      CityPickerState call flow setLastLocation > selectHeat > selectGroupItem keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0253 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(15, 65);
      const step2: string = subject.selectHeat(105);
      logInfo(`step2 selectHeat(105): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.selectGroupItem('  ');
      logInfo(`step3 selectGroupItem("  "): step3=${step3}`);
      expect(step3).assertEqual('  ');
      logInfo(`setLastLocation>selectHeat>selectGroupIte...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('  ');
      logInfo(`setLastLocation>selectHeat>selectGroupIte...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('  ');
      logInfo(`setLastLocation>selectHeat>selectGroupIte...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(15);
      logInfo(`setLastLocation>selectHeat>selectGroupIte...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(65);
      logInfo(`${BUNDLE}CityPickerStateFlow_0253 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0254
     * @tc.name      Location_CityPickerStateFlow_0254
     * @tc.desc      CityPickerState call flow selectSubCity > selectSubCity > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0254 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('', 'x ');
      logInfo(`step1 selectSubCity("", "x "): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.selectSubCity(' _1', 'abcabc');
      logInfo(`step2 selectSubCity(" _1", "abcabc"): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step3 locate(["Hello World", "a", " ", "a...: step3=${step3}`);
      expect(step3).assertEqual('Hello World');
      logInfo(`selectSubCity>selectSubCity>locate final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0254 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0255
     * @tc.name      Location_CityPickerStateFlow_0255
     * @tc.desc      CityPickerState call flow selectGroupItem > setLastLocation > scrollTo > selectHeat keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0255 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('HvSeG');
      logInfo(`step1 selectGroupItem("HvSeG"): step1=${step1}`);
      expect(step1).assertEqual('HvSeG');
      subject.setLastLocation(2, 70);
      const step3: string = subject.scrollTo(-52);
      logInfo(`step3 scrollTo(-52): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: string = subject.selectHeat(190);
      logInfo(`step4 selectHeat(190): step4=${step4}`);
      expect(step4).assertEqual('HvSeG');
      logInfo(`selectGroupItem>setLastLocation>scrollTo>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(-52);
      logInfo(`selectGroupItem>setLastLocation>scrollTo>...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('HvSeG');
      logInfo(`selectGroupItem>setLastLocation>scrollTo>...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('HvSeG');
      logInfo(`selectGroupItem>setLastLocation>scrollTo>...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`selectGroupItem>setLastLocation>scrollTo>...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(70);
      logInfo(`${BUNDLE}CityPickerStateFlow_0255 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0256
     * @tc.name      Location_CityPickerStateFlow_0256
     * @tc.desc      CityPickerState call flow setLastLocation > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0256 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(0, 45);
      subject.setLastLocation(2, 80);
      logInfo(`setLastLocation>setLastLocation final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(2);
      logInfo(`setLastLocation>setLastLocation final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(80);
      logInfo(`${BUNDLE}CityPickerStateFlow_0256 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0257
     * @tc.name      Location_CityPickerStateFlow_0257
     * @tc.desc      CityPickerState call flow selectSubCity > locate > locate > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0257 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('', 'abc');
      logInfo(`step1 selectSubCity("", "abc"): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['123', ' ', 'Hello World', 'abc', 'a', '']);
      logInfo(`step2 locate(["123", " ", "Hello World", ...: step2=${step2}`);
      expect(step2).assertEqual('123');
      const step3: string = subject.locate(['abc', 'abc']);
      logInfo(`step3 locate(["abc", "abc"]): step3=${step3}`);
      expect(step3).assertEqual('abc');
      subject.setLastLocation(25, 30);
      logInfo(`selectSubCity>locate>locate>setLastLocati...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('abc');
      logInfo(`selectSubCity>locate>locate>setLastLocati...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(25);
      logInfo(`selectSubCity>locate>locate>setLastLocati...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(30);
      logInfo(`${BUNDLE}CityPickerStateFlow_0257 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0258
     * @tc.name      Location_CityPickerStateFlow_0258
     * @tc.desc      CityPickerState call flow selectGroupItem > locate > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0258 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('abc');
      logInfo(`step1 selectGroupItem("abc"): step1=${step1}`);
      expect(step1).assertEqual('abc');
      const step2: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step2 locate(["Hello World", "a", " ", "a...: step2=${step2}`);
      expect(step2).assertEqual('abc');
      subject.setLastLocation(60, 192);
      logInfo(`selectGroupItem>locate>setLastLocation final: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('abc');
      logInfo(`selectGroupItem>locate>setLastLocation final: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('abc');
      logInfo(`selectGroupItem>locate>setLastLocation final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`selectGroupItem>locate>setLastLocation final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(60);
      logInfo(`selectGroupItem>locate>setLastLocation final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(192);
      logInfo(`${BUNDLE}CityPickerStateFlow_0258 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0259
     * @tc.name      Location_CityPickerStateFlow_0259
     * @tc.desc      CityPickerState call flow setLastLocation > locate > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0259 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(55, 85);
      const step2: string = subject.locate(['', 'a']);
      logInfo(`step2 locate(["", "a"]): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(87.51);
      logInfo(`step3 scrollTo(87.51): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`setLastLocation>locate>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(87.51, PRECISION);
      logInfo(`setLastLocation>locate>scrollTo final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(55);
      logInfo(`setLastLocation>locate>scrollTo final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(85);
      logInfo(`${BUNDLE}CityPickerStateFlow_0259 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0260
     * @tc.name      Location_CityPickerStateFlow_0260
     * @tc.desc      CityPickerState call flow locate > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0260 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['']);
      logInfo(`step1 locate([""]): step1=${step1}`);
      expect(step1).assertEqual('');
      subject.setLastLocation(0, 15);
      logInfo(`locate>setLastLocation final: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(15);
      logInfo(`${BUNDLE}CityPickerStateFlow_0260 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0261
     * @tc.name      Location_CityPickerStateFlow_0261
     * @tc.desc      CityPickerState call flow selectGroupItem > selectSubCity > selectHeat > scrollTo keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0261 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectGroupItem('a_1');
      logInfo(`step1 selectGroupItem("a_1"): step1=${step1}`);
      expect(step1).assertEqual('a_1');
      const step2: string = subject.selectSubCity('', ' 123 ');
      logInfo(`step2 selectSubCity("", " 123 "): step2=${step2}`);
      expect(step2).assertEqual('a_1');
      const step3: string = subject.selectHeat(49.24);
      logInfo(`step3 selectHeat(49.24): step3=${step3}`);
      expect(step3).assertEqual('a_1');
      const step4: string = subject.scrollTo(20);
      logInfo(`step4 scrollTo(20): step4=${step4}`);
      expect(step4).assertEqual('');
      logInfo(`selectGroupItem>selectSubCity>selectHeat>...: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(20);
      logInfo(`selectGroupItem>selectSubCity>selectHeat>...: subject.currentLocation=${subject.currentLocation}`);
      expect(subject.currentLocation).assertEqual('a_1');
      logInfo(`selectGroupItem>selectSubCity>selectHeat>...: subject.isCity=${subject.isCity}`);
      expect(subject.isCity).assertEqual('a_1');
      logInfo(`${BUNDLE}CityPickerStateFlow_0261 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0262
     * @tc.name      Location_CityPickerStateFlow_0262
     * @tc.desc      CityPickerState call flow setLastLocation > selectHeat > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0262 begin`);
      const subject: CityPickerState = new CityPickerState();
      subject.setLastLocation(115, 0);
      const step2: string = subject.selectHeat(90);
      logInfo(`step2 selectHeat(90): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.scrollTo(69);
      logInfo(`step3 scrollTo(69): step3=${step3}`);
      expect(step3).assertEqual('');
      logInfo(`setLastLocation>selectHeat>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(69);
      logInfo(`setLastLocation>selectHeat>scrollTo final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(115);
      logInfo(`${BUNDLE}CityPickerStateFlow_0262 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0263
     * @tc.name      Location_CityPickerStateFlow_0263
     * @tc.desc      CityPickerState call flow locate > locate > selectSubCity > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0263 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.locate(['a', '', 'abc']);
      logInfo(`step1 locate(["a", "", "abc"]): step1=${step1}`);
      expect(step1).assertEqual('a');
      const step2: string = subject.locate([]);
      logInfo(`step2 locate([]): step2=${step2}`);
      expect(step2).assertEqual('a');
      const step3: string = subject.selectSubCity('123123', 'a_1');
      logInfo(`step3 selectSubCity("123123", "a_1"): step3=${step3}`);
      expect(step3).assertEqual('');
      subject.setLastLocation(70, 85);
      logInfo(`locate>locate>selectSubCity>setLastLocati...: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('a');
      logInfo(`locate>locate>selectSubCity>setLastLocati...: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(70);
      logInfo(`locate>locate>selectSubCity>setLastLocati...: subject.longitude=${subject.longitude}`);
      expect(subject.longitude).assertEqual(85);
      logInfo(`${BUNDLE}CityPickerStateFlow_0263 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0264
     * @tc.name      Location_CityPickerStateFlow_0264
     * @tc.desc      CityPickerState call flow scrollTo > locate > setLastLocation keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0264 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.scrollTo(186);
      logInfo(`step1 scrollTo(186): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step2 locate(["Hello World", "a", " ", "a...: step2=${step2}`);
      expect(step2).assertEqual('Hello World');
      subject.setLastLocation(50, 0);
      logInfo(`scrollTo>locate>setLastLocation final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertEqual(186);
      logInfo(`scrollTo>locate>setLastLocation final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`scrollTo>locate>setLastLocation final: subject.latitude=${subject.latitude}`);
      expect(subject.latitude).assertEqual(50);
      logInfo(`${BUNDLE}CityPickerStateFlow_0264 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0265
     * @tc.name      Location_CityPickerStateFlow_0265
     * @tc.desc      CityPickerState call flow selectSubCity > scrollTo keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0265 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectSubCity('Hello WorldHello World', 'Hello WorldHello World');
      logInfo(`step1 selectSubCity("Hello WorldHello Wor...: step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.scrollTo(43.7);
      logInfo(`step2 scrollTo(43.7): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`selectSubCity>scrollTo final: subject.alphabetIndex=${subject.alphabetIndex}`);
      expect(subject.alphabetIndex).assertClose(43.7, PRECISION);
      logInfo(`${BUNDLE}CityPickerStateFlow_0265 end`);
    });

    /**
     * @tc.number    SUB_LOCATION_CITY_PICKER_STATE_FLOW_0266
     * @tc.name      Location_CityPickerStateFlow_0266
     * @tc.desc      CityPickerState call flow selectHeat > locate keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Location_CityPickerStateFlow_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CityPickerStateFlow_0266 begin`);
      const subject: CityPickerState = new CityPickerState();
      const step1: string = subject.selectHeat(154);
      logInfo(`step1 selectHeat(154): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.locate(['Hello World', 'a', ' ', 'a', '123']);
      logInfo(`step2 locate(["Hello World", "a", " ", "a...: step2=${step2}`);
      expect(step2).assertEqual('Hello World');
      logInfo(`selectHeat>locate final: subject.city=${subject.city}`);
      expect(subject.city).assertEqual('Hello World');
      logInfo(`${BUNDLE}CityPickerStateFlow_0266 end`);
    });
  });
}
