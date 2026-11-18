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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { CitySearchState } from '../model/CitySearchLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CitySearch]';
const BUNDLE: string = 'CitySearch_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for CitySearchState flow (51 cases). */
export default function citySearchStateFlowTest(): void {
  describe('CitySearchStateFlowTest', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0001
     * @tc.name      CitySearch_CitySearchStateFlow_0001
     * @tc.desc      CitySearchState call flow change > change > submit > submit > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CitySearchStateFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0001 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('x8T2Z');
      logInfo(`step1 change("x8T2Z"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('UqcdQPxjr');
      logInfo(`step2 change("UqcdQPxjr"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('iTH');
      logInfo(`step3 submit("iTH"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.submit('mTZV');
      logInfo(`step4 submit("mTZV"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.pickResult(93.64);
      logInfo(`step5 pickResult(93.64): step5=${step5}`);
      expect(step5).assertEqual('mTZV');
      logInfo(`change>change>submit>submit>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('mTZV');
      logInfo(`change>change>submit>submit>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>change>submit>submit>pickResult final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0002
     * @tc.name      CitySearch_CitySearchStateFlow_0002
     * @tc.desc      CitySearchState call flow change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CitySearch_CitySearchStateFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0002 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('hello worldhello world');
      logInfo(`step1 change("hello worldhello world"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('PC3zvv');
      logInfo(`step2 pick("PC3zvv"): step2=${step2}`);
      expect(step2).assertEqual('PC3zvv');
      logInfo(`change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('PC3zvv');
      logInfo(`change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0003
     * @tc.name      CitySearch_CitySearchStateFlow_0003
     * @tc.desc      CitySearchState call flow submit > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0003 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('Q7EC0FoRgN');
      logInfo(`step1 submit("Q7EC0FoRgN"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`step2 submit("????"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`submit>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`submit>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0004
     * @tc.name      CitySearch_CitySearchStateFlow_0004
     * @tc.desc      CitySearchState call flow pickResult > pickResult > pick > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0004 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(176);
      logInfo(`step1 pickResult(176): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pickResult(105);
      logInfo(`step2 pickResult(105): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.pick('Sample Title 123_1');
      logInfo(`step3 pick("Sample Title 123_1"): step3=${step3}`);
      expect(step3).assertEqual('Sample Title 123_1');
      const step4: number = subject.change('\u4e2d\u6587_1');
      logInfo(`step4 change("??_1"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`pickResult>pickResult>pick>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('\u4e2d\u6587_1');
      logInfo(`pickResult>pickResult>pick>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0005
     * @tc.name      CitySearch_CitySearchStateFlow_0005
     * @tc.desc      CitySearchState call flow pick > pickResult > pick > pickResult > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0005 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('lKUz3lQTg');
      logInfo(`step1 pick("lKUz3lQTg"): step1=${step1}`);
      expect(step1).assertEqual('lKUz3lQTg');
      const step2: string = subject.pickResult(65.19);
      logInfo(`step2 pickResult(65.19): step2=${step2}`);
      expect(step2).assertEqual('lKUz3lQTg');
      const step3: string = subject.pick('Hello');
      logInfo(`step3 pick("Hello"): step3=${step3}`);
      expect(step3).assertEqual('Hello');
      const step4: string = subject.pickResult(140);
      logInfo(`step4 pickResult(140): step4=${step4}`);
      expect(step4).assertEqual('Hello');
      const step5: string = subject.pickResult(89);
      logInfo(`step5 pickResult(89): step5=${step5}`);
      expect(step5).assertEqual('Hello');
      logInfo(`pick>pickResult>pick>pickResult>pickResul...: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello');
      logInfo(`${BUNDLE}CitySearchStateFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0006
     * @tc.name      CitySearch_CitySearchStateFlow_0006
     * @tc.desc      CitySearchState call flow submit > pickResult > pickResult > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0006 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('Zm');
      logInfo(`step1 submit("Zm"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(168);
      logInfo(`step2 pickResult(168): step2=${step2}`);
      expect(step2).assertEqual('Zm');
      const step3: string = subject.pickResult(119);
      logInfo(`step3 pickResult(119): step3=${step3}`);
      expect(step3).assertEqual('Zm');
      const step4: number = subject.submit('Xwrs9uz');
      logInfo(`step4 submit("Xwrs9uz"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`submit>pickResult>pickResult>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Xwrs9uz');
      logInfo(`submit>pickResult>pickResult>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pickResult>pickResult>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0007
     * @tc.name      CitySearch_CitySearchStateFlow_0007
     * @tc.desc      CitySearchState call flow pickResult > submit > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0007 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(104);
      logInfo(`step1 pickResult(104): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.submit('pnYKJZyR9P');
      logInfo(`step2 submit("pnYKJZyR9P"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pickResult(15.17);
      logInfo(`step3 pickResult(15.17): step3=${step3}`);
      expect(step3).assertEqual('pnYKJZyR9P');
      logInfo(`pickResult>submit>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('pnYKJZyR9P');
      logInfo(`pickResult>submit>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>submit>pickResult final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0008
     * @tc.name      CitySearch_CitySearchStateFlow_0008
     * @tc.desc      CitySearchState call flow submit > submit > change > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0008 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('6DrR');
      logInfo(`step1 submit("6DrR"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('Sample Title 123_1');
      logInfo(`step2 submit("Sample Title 123_1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.change('Gjyxl3R2C');
      logInfo(`step3 change("Gjyxl3R2C"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick('a');
      logInfo(`step4 pick("a"): step4=${step4}`);
      expect(step4).assertEqual('a');
      const step5: string = subject.pick('');
      logInfo(`step5 pick(""): step5=${step5}`);
      expect(step5).assertEqual('');
      logInfo(`submit>submit>change>pick>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>submit>change>pick>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0009
     * @tc.name      CitySearch_CitySearchStateFlow_0009
     * @tc.desc      CitySearchState call flow change > submit > change > pickResult > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0009 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('JyEYscjP');
      logInfo(`step1 change("JyEYscjP"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('2tG8');
      logInfo(`step2 submit("2tG8"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.change('7K');
      logInfo(`step3 change("7K"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pickResult(-83);
      logInfo(`step4 pickResult(-83): step4=${step4}`);
      expect(step4).assertEqual('7K');
      const step5: number = subject.submit('A');
      logInfo(`step5 submit("A"): step5=${step5}`);
      expect(step5).assertEqual(4);
      logInfo(`change>submit>change>pickResult>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('A');
      logInfo(`change>submit>change>pickResult>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>submit>change>pickResult>submit final: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(4);
      logInfo(`change>submit>change>pickResult>submit final: JSON...${JSON.stringify(subject.searchList.slice(0, 2))}`);
      expect(JSON.stringify(subject.searchList.slice(0, 2)))
        .assertEqual('["\u963f\u5c14\u5c71","\u963f\u52d2\u6cf0\u5730\u533a"]');
      logInfo(`change>submit>change>pickResult>submit final: JSON...${JSON.stringify(subject.searchList.slice(2, 4))}`);
      expect(JSON.stringify(subject.searchList.slice(2, 4))).assertEqual('["\u5b89\u5e86","\u5b89\u9633"]');
      logInfo(`change>submit>change>pickResult>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0010
     * @tc.name      CitySearch_CitySearchStateFlow_0010
     * @tc.desc      CitySearchState call flow change > pickResult > pickResult > pickResult > change keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0010 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('3YS4t6y2');
      logInfo(`step1 change("3YS4t6y2"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(8);
      logInfo(`step2 pickResult(8): step2=${step2}`);
      expect(step2).assertEqual('3YS4t6y2');
      const step3: string = subject.pickResult(39.56);
      logInfo(`step3 pickResult(39.56): step3=${step3}`);
      expect(step3).assertEqual('3YS4t6y2');
      const step4: string = subject.pickResult(60.66);
      logInfo(`step4 pickResult(60.66): step4=${step4}`);
      expect(step4).assertEqual('3YS4t6y2');
      const step5: number = subject.change('6qe');
      logInfo(`step5 change("6qe"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`change>pickResult>pickResult>pickResult>c...: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('6qe');
      logInfo(`change>pickResult>pickResult>pickResult>c...: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0011
     * @tc.name      CitySearch_CitySearchStateFlow_0011
     * @tc.desc      CitySearchState call flow change > pickResult > change > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0011 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('6Y');
      logInfo(`step1 change("6Y"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(39.57);
      logInfo(`step2 pickResult(39.57): step2=${step2}`);
      expect(step2).assertEqual('6Y');
      const step3: number = subject.change('EYoYo');
      logInfo(`step3 change("EYoYo"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pickResult(54.78);
      logInfo(`step4 pickResult(54.78): step4=${step4}`);
      expect(step4).assertEqual('EYoYo');
      logInfo(`change>pickResult>change>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('EYoYo');
      logInfo(`change>pickResult>change>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0012
     * @tc.name      CitySearch_CitySearchStateFlow_0012
     * @tc.desc      CitySearchState call flow submit > pickResult > submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0012 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('A_1');
      logInfo(`step1 submit("A_1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(92);
      logInfo(`step2 pickResult(92): step2=${step2}`);
      expect(step2).assertEqual('A_1');
      const step3: number = subject.submit('a_1');
      logInfo(`step3 submit("a_1"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.change('rsRk');
      logInfo(`step4 change("rsRk"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`submit>pickResult>submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('rsRk');
      logInfo(`submit>pickResult>submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pickResult>submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0013
     * @tc.name      CitySearch_CitySearchStateFlow_0013
     * @tc.desc      CitySearchState call flow submit > pickResult > change > change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0013 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('rwhBL');
      logInfo(`step1 submit("rwhBL"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(39.57);
      logInfo(`step2 pickResult(39.57): step2=${step2}`);
      expect(step2).assertEqual('rwhBL');
      const step3: number = subject.change('IQvJ8cOGIMT4');
      logInfo(`step3 change("IQvJ8cOGIMT4"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.change('PWf3');
      logInfo(`step4 change("PWf3"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.pick('cjnWGS');
      logInfo(`step5 pick("cjnWGS"): step5=${step5}`);
      expect(step5).assertEqual('cjnWGS');
      logInfo(`submit>pickResult>change>change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('cjnWGS');
      logInfo(`submit>pickResult>change>change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pickResult>change>change>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0014
     * @tc.name      CitySearch_CitySearchStateFlow_0014
     * @tc.desc      CitySearchState call flow pickResult > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0014 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(135);
      logInfo(`step1 pickResult(135): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick('rlk');
      logInfo(`step2 pick("rlk"): step2=${step2}`);
      expect(step2).assertEqual('rlk');
      logInfo(`pickResult>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('rlk');
      logInfo(`${BUNDLE}CitySearchStateFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0015
     * @tc.name      CitySearch_CitySearchStateFlow_0015
     * @tc.desc      CitySearchState call flow pick > submit > pick > pick > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0015 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick(' abc ');
      logInfo(`step1 pick(" abc "): step1=${step1}`);
      expect(step1).assertEqual(' abc ');
      const step2: number = subject.submit('0');
      logInfo(`step2 submit("0"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('MOuUZO');
      logInfo(`step3 pick("MOuUZO"): step3=${step3}`);
      expect(step3).assertEqual('MOuUZO');
      const step4: string = subject.pick('hello world_1');
      logInfo(`step4 pick("hello world_1"): step4=${step4}`);
      expect(step4).assertEqual('hello world_1');
      const step5: number = subject.change('abc_1');
      logInfo(`step5 change("abc_1"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`pick>submit>pick>pick>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('abc_1');
      logInfo(`pick>submit>pick>pick>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit>pick>pick>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0016
     * @tc.name      CitySearch_CitySearchStateFlow_0016
     * @tc.desc      CitySearchState call flow pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0016 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('aa');
      logInfo(`step1 pick("aa"): step1=${step1}`);
      expect(step1).assertEqual('aa');
      const step2: string = subject.pick('5CTDXPL1Q6e');
      logInfo(`step2 pick("5CTDXPL1Q6e"): step2=${step2}`);
      expect(step2).assertEqual('5CTDXPL1Q6e');
      logInfo(`pick>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('5CTDXPL1Q6e');
      logInfo(`${BUNDLE}CitySearchStateFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0017
     * @tc.name      CitySearch_CitySearchStateFlow_0017
     * @tc.desc      CitySearchState call flow change > change > pickResult > change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0017 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('xa');
      logInfo(`step1 change("xa"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('FTYXufzbJ');
      logInfo(`step2 change("FTYXufzbJ"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pickResult(168);
      logInfo(`step3 pickResult(168): step3=${step3}`);
      expect(step3).assertEqual('FTYXufzbJ');
      const step4: number = subject.change('HelloHello');
      logInfo(`step4 change("HelloHello"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.pick('MH9sFVSx');
      logInfo(`step5 pick("MH9sFVSx"): step5=${step5}`);
      expect(step5).assertEqual('MH9sFVSx');
      logInfo(`change>change>pickResult>change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('MH9sFVSx');
      logInfo(`change>change>pickResult>change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0018
     * @tc.name      CitySearch_CitySearchStateFlow_0018
     * @tc.desc      CitySearchState call flow pick > pick > pickResult > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0018 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('yNWqzCeJ');
      logInfo(`step1 pick("yNWqzCeJ"): step1=${step1}`);
      expect(step1).assertEqual('yNWqzCeJ');
      const step2: string = subject.pick('kqsTcNJxbff');
      logInfo(`step2 pick("kqsTcNJxbff"): step2=${step2}`);
      expect(step2).assertEqual('kqsTcNJxbff');
      const step3: string = subject.pickResult(62.27);
      logInfo(`step3 pickResult(62.27): step3=${step3}`);
      expect(step3).assertEqual('kqsTcNJxbff');
      const step4: number = subject.submit('1uZE');
      logInfo(`step4 submit("1uZE"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`pick>pick>pickResult>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('1uZE');
      logInfo(`pick>pick>pickResult>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>pick>pickResult>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0019
     * @tc.name      CitySearch_CitySearchStateFlow_0019
     * @tc.desc      CitySearchState call flow submit > change > submit > submit > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0019 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit(' _1');
      logInfo(`step1 submit(" _1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('RA');
      logInfo(`step2 change("RA"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('wHDpmYuU');
      logInfo(`step3 submit("wHDpmYuU"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.submit('mgggzPkEnwB');
      logInfo(`step4 submit("mgggzPkEnwB"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.submit('OqRWEpRJU');
      logInfo(`step5 submit("OqRWEpRJU"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`submit>change>submit>submit>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('OqRWEpRJU');
      logInfo(`submit>change>submit>submit>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>change>submit>submit>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(4);
      logInfo(`${BUNDLE}CitySearchStateFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0020
     * @tc.name      CitySearch_CitySearchStateFlow_0020
     * @tc.desc      CitySearchState call flow pick > pickResult > change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0020 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('V8cKtNr');
      logInfo(`step1 pick("V8cKtNr"): step1=${step1}`);
      expect(step1).assertEqual('V8cKtNr');
      const step2: string = subject.pickResult(-92);
      logInfo(`step2 pickResult(-92): step2=${step2}`);
      expect(step2).assertEqual('V8cKtNr');
      const step3: number = subject.change('aa');
      logInfo(`step3 change("aa"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick('DEaMTHk');
      logInfo(`step4 pick("DEaMTHk"): step4=${step4}`);
      expect(step4).assertEqual('DEaMTHk');
      logInfo(`pick>pickResult>change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('DEaMTHk');
      logInfo(`pick>pickResult>change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0021
     * @tc.name      CitySearch_CitySearchStateFlow_0021
     * @tc.desc      CitySearchState call flow submit > pickResult > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0021 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('6PML');
      logInfo(`step1 submit("6PML"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(134);
      logInfo(`step2 pickResult(134): step2=${step2}`);
      expect(step2).assertEqual('6PML');
      const step3: string = subject.pickResult(21);
      logInfo(`step3 pickResult(21): step3=${step3}`);
      expect(step3).assertEqual('6PML');
      logInfo(`submit>pickResult>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('6PML');
      logInfo(`submit>pickResult>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pickResult>pickResult final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0022
     * @tc.name      CitySearch_CitySearchStateFlow_0022
     * @tc.desc      CitySearchState call flow submit > submit > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0022 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('EseWYUUTcsfb');
      logInfo(`step1 submit("EseWYUUTcsfb"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('mgggzPkEnwB');
      logInfo(`step2 submit("mgggzPkEnwB"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pickResult(31.02);
      logInfo(`step3 pickResult(31.02): step3=${step3}`);
      expect(step3).assertEqual('mgggzPkEnwB');
      logInfo(`submit>submit>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('mgggzPkEnwB');
      logInfo(`submit>submit>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>submit>pickResult final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0023
     * @tc.name      CitySearch_CitySearchStateFlow_0023
     * @tc.desc      CitySearchState call flow pickResult > pick > change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0023 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(140);
      logInfo(`step1 pickResult(140): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick('sh79ANK');
      logInfo(`step2 pick("sh79ANK"): step2=${step2}`);
      expect(step2).assertEqual('sh79ANK');
      const step3: number = subject.change('IAN6yy1J');
      logInfo(`step3 change("IAN6yy1J"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick('5gTiDSo');
      logInfo(`step4 pick("5gTiDSo"): step4=${step4}`);
      expect(step4).assertEqual('5gTiDSo');
      logInfo(`pickResult>pick>change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('5gTiDSo');
      logInfo(`pickResult>pick>change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0024
     * @tc.name      CitySearch_CitySearchStateFlow_0024
     * @tc.desc      CitySearchState call flow pickResult > pickResult > change > change > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0024 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(29.55);
      logInfo(`step1 pickResult(29.55): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pickResult(160);
      logInfo(`step2 pickResult(160): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.change('mX3G3r9YBD0');
      logInfo(`step3 change("mX3G3r9YBD0"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.change('Hello World');
      logInfo(`step4 change("Hello World"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.change('AQ3iO9v');
      logInfo(`step5 change("AQ3iO9v"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`pickResult>pickResult>change>change>chang...: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('AQ3iO9v');
      logInfo(`pickResult>pickResult>change>change>chang...: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0025
     * @tc.name      CitySearch_CitySearchStateFlow_0025
     * @tc.desc      CitySearchState call flow pickResult > change > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0025 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(56.95);
      logInfo(`step1 pickResult(56.95): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.change('8xfL');
      logInfo(`step2 change("8xfL"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('sxHdStscq6');
      logInfo(`step3 submit("sxHdStscq6"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pickResult>change>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('sxHdStscq6');
      logInfo(`pickResult>change>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>change>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0026
     * @tc.name      CitySearch_CitySearchStateFlow_0026
     * @tc.desc      CitySearchState call flow pick > pickResult > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0026 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('dNA1z4cCq3');
      logInfo(`step1 pick("dNA1z4cCq3"): step1=${step1}`);
      expect(step1).assertEqual('dNA1z4cCq3');
      const step2: string = subject.pickResult(-42);
      logInfo(`step2 pickResult(-42): step2=${step2}`);
      expect(step2).assertEqual('dNA1z4cCq3');
      const step3: number = subject.change('eZbrh');
      logInfo(`step3 change("eZbrh"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pick>pickResult>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('eZbrh');
      logInfo(`pick>pickResult>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0027
     * @tc.name      CitySearch_CitySearchStateFlow_0027
     * @tc.desc      CitySearchState call flow pick > pick > pickResult > submit > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0027 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('0V');
      logInfo(`step1 pick("0V"): step1=${step1}`);
      expect(step1).assertEqual('0V');
      const step2: string = subject.pick('abcabc');
      logInfo(`step2 pick("abcabc"): step2=${step2}`);
      expect(step2).assertEqual('abcabc');
      const step3: string = subject.pickResult(194);
      logInfo(`step3 pickResult(194): step3=${step3}`);
      expect(step3).assertEqual('abcabc');
      const step4: number = subject.submit('EseWYUUTcsfb');
      logInfo(`step4 submit("EseWYUUTcsfb"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.pick('0if0Rq');
      logInfo(`step5 pick("0if0Rq"): step5=${step5}`);
      expect(step5).assertEqual('0if0Rq');
      logInfo(`pick>pick>pickResult>submit>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('0if0Rq');
      logInfo(`pick>pick>pickResult>submit>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>pick>pickResult>submit>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0028
     * @tc.name      CitySearch_CitySearchStateFlow_0028
     * @tc.desc      CitySearchState call flow pick > pickResult > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0028 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('FNfanmSp5');
      logInfo(`step1 pick("FNfanmSp5"): step1=${step1}`);
      expect(step1).assertEqual('FNfanmSp5');
      const step2: string = subject.pickResult(55);
      logInfo(`step2 pickResult(55): step2=${step2}`);
      expect(step2).assertEqual('FNfanmSp5');
      const step3: string = subject.pick('KUw6hfX');
      logInfo(`step3 pick("KUw6hfX"): step3=${step3}`);
      expect(step3).assertEqual('KUw6hfX');
      logInfo(`pick>pickResult>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('KUw6hfX');
      logInfo(`${BUNDLE}CitySearchStateFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0029
     * @tc.name      CitySearch_CitySearchStateFlow_0029
     * @tc.desc      CitySearchState call flow pick > submit > submit > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0029 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('hyni');
      logInfo(`step1 pick("hyni"): step1=${step1}`);
      expect(step1).assertEqual('hyni');
      const step2: number = subject.submit('S0oEzA');
      logInfo(`step2 submit("S0oEzA"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('wHDpmYuU');
      logInfo(`step3 submit("wHDpmYuU"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick('1rTxM607vhT');
      logInfo(`step4 pick("1rTxM607vhT"): step4=${step4}`);
      expect(step4).assertEqual('1rTxM607vhT');
      logInfo(`pick>submit>submit>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('1rTxM607vhT');
      logInfo(`pick>submit>submit>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit>submit>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0030
     * @tc.name      CitySearch_CitySearchStateFlow_0030
     * @tc.desc      CitySearchState call flow pick > pick > change > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0030 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('hGkmq0TCoNVb');
      logInfo(`step1 pick("hGkmq0TCoNVb"): step1=${step1}`);
      expect(step1).assertEqual('hGkmq0TCoNVb');
      const step2: string = subject.pick('h30r1l665j');
      logInfo(`step2 pick("h30r1l665j"): step2=${step2}`);
      expect(step2).assertEqual('h30r1l665j');
      const step3: number = subject.change('pqOF4XT2q');
      logInfo(`step3 change("pqOF4XT2q"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pickResult(69.17);
      logInfo(`step4 pickResult(69.17): step4=${step4}`);
      expect(step4).assertEqual('pqOF4XT2q');
      logInfo(`pick>pick>change>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('pqOF4XT2q');
      logInfo(`pick>pick>change>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0031
     * @tc.name      CitySearch_CitySearchStateFlow_0031
     * @tc.desc      CitySearchState call flow pick > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0031 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('KUw6hfX');
      logInfo(`step1 pick("KUw6hfX"): step1=${step1}`);
      expect(step1).assertEqual('KUw6hfX');
      const step2: string = subject.pick('B4S7YT10RtA');
      logInfo(`step2 pick("B4S7YT10RtA"): step2=${step2}`);
      expect(step2).assertEqual('B4S7YT10RtA');
      const step3: string = subject.pick('hyni');
      logInfo(`step3 pick("hyni"): step3=${step3}`);
      expect(step3).assertEqual('hyni');
      logInfo(`pick>pick>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('hyni');
      logInfo(`${BUNDLE}CitySearchStateFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0032
     * @tc.name      CitySearch_CitySearchStateFlow_0032
     * @tc.desc      CitySearchState call flow change > change > submit > change > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0032 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('jTRk3aHm5xK');
      logInfo(`step1 change("jTRk3aHm5xK"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('Hello World');
      logInfo(`step2 change("Hello World"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('hello worldhello world');
      logInfo(`step3 submit("hello worldhello world"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.change(' a ');
      logInfo(`step4 change(" a "): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.submit('');
      logInfo(`step5 submit(""): step5=${step5}`);
      expect(step5).assertEqual(1);
      logInfo(`change>change>submit>change>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('\u957f\u6c99');
      logInfo(`change>change>submit>change>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>change>submit>change>submit final: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(1);
      logInfo(`change>change>submit>change>submit final: JSON.stringify(subje...${JSON.stringify(subject.searchList)}`);
      expect(JSON.stringify(subject.searchList)).assertEqual('["\u957f\u6c99"]');
      logInfo(`change>change>submit>change>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0033
     * @tc.name      CitySearch_CitySearchStateFlow_0033
     * @tc.desc      CitySearchState call flow pick > submit > submit > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0033 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('6iH');
      logInfo(`step1 pick("6iH"): step1=${step1}`);
      expect(step1).assertEqual('6iH');
      const step2: number = subject.submit('  ');
      logInfo(`step2 submit("  "): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('0');
      logInfo(`step3 submit("0"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.submit('Hello');
      logInfo(`step4 submit("Hello"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`pick>submit>submit>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello');
      logInfo(`pick>submit>submit>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit>submit>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(3);
      logInfo(`${BUNDLE}CitySearchStateFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0034
     * @tc.name      CitySearch_CitySearchStateFlow_0034
     * @tc.desc      CitySearchState call flow submit > pickResult > pickResult > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0034 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('DXS0AGY');
      logInfo(`step1 submit("DXS0AGY"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(38);
      logInfo(`step2 pickResult(38): step2=${step2}`);
      expect(step2).assertEqual('DXS0AGY');
      const step3: string = subject.pickResult(10);
      logInfo(`step3 pickResult(10): step3=${step3}`);
      expect(step3).assertEqual('DXS0AGY');
      const step4: string = subject.pickResult(108);
      logInfo(`step4 pickResult(108): step4=${step4}`);
      expect(step4).assertEqual('DXS0AGY');
      logInfo(`submit>pickResult>pickResult>pickResult f...: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('DXS0AGY');
      logInfo(`submit>pickResult>pickResult>pickResult f...: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pickResult>pickResult>pickResult f...: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0035
     * @tc.name      CitySearch_CitySearchStateFlow_0035
     * @tc.desc      CitySearchState call flow pick > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0035 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('Hello WorldHello World');
      logInfo(`step1 pick("Hello WorldHello World"): step1=${step1}`);
      expect(step1).assertEqual('Hello WorldHello World');
      const step2: number = subject.change('   ');
      logInfo(`step2 change("   "): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`pick>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('   ');
      logInfo(`pick>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0036
     * @tc.name      CitySearch_CitySearchStateFlow_0036
     * @tc.desc      CitySearchState call flow pick > pick > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0036 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('SXS');
      logInfo(`step1 pick("SXS"): step1=${step1}`);
      expect(step1).assertEqual('SXS');
      const step2: string = subject.pick('KUw6hfX');
      logInfo(`step2 pick("KUw6hfX"): step2=${step2}`);
      expect(step2).assertEqual('KUw6hfX');
      const step3: number = subject.change('   ');
      logInfo(`step3 change("   "): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pick>pick>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('   ');
      logInfo(`pick>pick>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0037
     * @tc.name      CitySearch_CitySearchStateFlow_0037
     * @tc.desc      CitySearchState call flow pick > change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0037 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('W0q1SdqJRH');
      logInfo(`step1 pick("W0q1SdqJRH"): step1=${step1}`);
      expect(step1).assertEqual('W0q1SdqJRH');
      const step2: number = subject.change('Sample Title 123');
      logInfo(`step2 change("Sample Title 123"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('OFp5j2f');
      logInfo(`step3 pick("OFp5j2f"): step3=${step3}`);
      expect(step3).assertEqual('OFp5j2f');
      logInfo(`pick>change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('OFp5j2f');
      logInfo(`pick>change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0038
     * @tc.name      CitySearch_CitySearchStateFlow_0038
     * @tc.desc      CitySearchState call flow pickResult > submit > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0038 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(-55);
      logInfo(`step1 pickResult(-55): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.submit('g');
      logInfo(`step2 submit("g"): step2=${step2}`);
      expect(step2).assertEqual(4);
      const step3: number = subject.submit('9fB9Fi74OgV');
      logInfo(`step3 submit("9fB9Fi74OgV"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pickResult>submit>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('9fB9Fi74OgV');
      logInfo(`pickResult>submit>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>submit>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0039
     * @tc.name      CitySearch_CitySearchStateFlow_0039
     * @tc.desc      CitySearchState call flow pickResult > submit > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0039 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(193);
      logInfo(`step1 pickResult(193): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.submit('QrNUjLjHy');
      logInfo(`step2 submit("QrNUjLjHy"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('x ');
      logInfo(`step3 submit("x "): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pickResult>submit>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('x ');
      logInfo(`pickResult>submit>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>submit>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0040
     * @tc.name      CitySearch_CitySearchStateFlow_0040
     * @tc.desc      CitySearchState call flow submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0040 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('VI3');
      logInfo(`step1 submit("VI3"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('x\u4e2d\u6587');
      logInfo(`step2 change("x??"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('x\u4e2d\u6587');
      logInfo(`submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0041
     * @tc.name      CitySearch_CitySearchStateFlow_0041
     * @tc.desc      CitySearchState call flow pick > pick > submit > submit > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0041 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('xhello world');
      logInfo(`step1 pick("xhello world"): step1=${step1}`);
      expect(step1).assertEqual('xhello world');
      const step2: string = subject.pick('K26j');
      logInfo(`step2 pick("K26j"): step2=${step2}`);
      expect(step2).assertEqual('K26j');
      const step3: number = subject.submit('6PML');
      logInfo(`step3 submit("6PML"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.submit(' Hello ');
      logInfo(`step4 submit(" Hello "): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.submit('yuv9k6VnT');
      logInfo(`step5 submit("yuv9k6VnT"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`pick>pick>submit>submit>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('yuv9k6VnT');
      logInfo(`pick>pick>submit>submit>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>pick>submit>submit>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(3);
      logInfo(`${BUNDLE}CitySearchStateFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0042
     * @tc.name      CitySearch_CitySearchStateFlow_0042
     * @tc.desc      CitySearchState call flow submit > pick > change > submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0042 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('xa');
      logInfo(`step1 submit("xa"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('iKY');
      logInfo(`step2 pick("iKY"): step2=${step2}`);
      expect(step2).assertEqual('iKY');
      const step3: number = subject.change('6qe');
      logInfo(`step3 change("6qe"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.submit('Y');
      logInfo(`step4 submit("Y"): step4=${step4}`);
      expect(step4).assertEqual(6);
      const step5: number = subject.change('FTYXufzbJ');
      logInfo(`step5 change("FTYXufzbJ"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`submit>pick>change>submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('FTYXufzbJ');
      logInfo(`submit>pick>change>submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pick>change>submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0043
     * @tc.name      CitySearch_CitySearchStateFlow_0043
     * @tc.desc      CitySearchState call flow submit > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0043 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('KG');
      logInfo(`step1 submit("KG"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(63.44);
      logInfo(`step2 pickResult(63.44): step2=${step2}`);
      expect(step2).assertEqual('KG');
      logInfo(`submit>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('KG');
      logInfo(`submit>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pickResult final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0044
     * @tc.name      CitySearch_CitySearchStateFlow_0044
     * @tc.desc      CitySearchState call flow submit > pick > change > change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0044 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('hello worldhello world');
      logInfo(`step1 submit("hello worldhello world"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('6n');
      logInfo(`step2 pick("6n"): step2=${step2}`);
      expect(step2).assertEqual('6n');
      const step3: number = subject.change('1');
      logInfo(`step3 change("1"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.change('PWf3');
      logInfo(`step4 change("PWf3"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.pick('x123');
      logInfo(`step5 pick("x123"): step5=${step5}`);
      expect(step5).assertEqual('x123');
      logInfo(`submit>pick>change>change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('x123');
      logInfo(`submit>pick>change>change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pick>change>change>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0045
     * @tc.name      CitySearch_CitySearchStateFlow_0045
     * @tc.desc      CitySearchState call flow change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0045 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('xHello World');
      logInfo(`step1 change("xHello World"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('abcabc');
      logInfo(`step2 pick("abcabc"): step2=${step2}`);
      expect(step2).assertEqual('abcabc');
      logInfo(`change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('abcabc');
      logInfo(`change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0046
     * @tc.name      CitySearch_CitySearchStateFlow_0046
     * @tc.desc      CitySearchState call flow pick > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0046 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('Hello_1');
      logInfo(`step1 pick("Hello_1"): step1=${step1}`);
      expect(step1).assertEqual('Hello_1');
      const step2: number = subject.submit('Hello');
      logInfo(`step2 submit("Hello"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`pick>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello');
      logInfo(`pick>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0047
     * @tc.name      CitySearch_CitySearchStateFlow_0047
     * @tc.desc      CitySearchState call flow pick > pickResult > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0047 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('SDMoxAL');
      logInfo(`step1 pick("SDMoxAL"): step1=${step1}`);
      expect(step1).assertEqual('SDMoxAL');
      const step2: string = subject.pickResult(56.95);
      logInfo(`step2 pickResult(56.95): step2=${step2}`);
      expect(step2).assertEqual('SDMoxAL');
      const step3: number = subject.change('\u4e2d\u6587_1');
      logInfo(`step3 change("??_1"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pick>pickResult>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('\u4e2d\u6587_1');
      logInfo(`pick>pickResult>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0048
     * @tc.name      CitySearch_CitySearchStateFlow_0048
     * @tc.desc      CitySearchState call flow submit > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0048 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('obq');
      logInfo(`step1 submit("obq"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('\u4e2d\u6587_1');
      logInfo(`step2 submit("??_1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`submit>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('\u4e2d\u6587_1');
      logInfo(`submit>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0049
     * @tc.name      CitySearch_CitySearchStateFlow_0049
     * @tc.desc      CitySearchState call flow pickResult > change > pick > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0049 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(-14);
      logInfo(`step1 pickResult(-14): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.change('7K');
      logInfo(`step2 change("7K"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('SXS');
      logInfo(`step3 pick("SXS"): step3=${step3}`);
      expect(step3).assertEqual('SXS');
      const step4: number = subject.change('abc');
      logInfo(`step4 change("abc"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`pickResult>change>pick>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('abc');
      logInfo(`pickResult>change>pick>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0050
     * @tc.name      CitySearch_CitySearchStateFlow_0050
     * @tc.desc      CitySearchState call flow pickResult > pick > pickResult > change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0050 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(114);
      logInfo(`step1 pickResult(114): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick('kIg6KJl1iaCB');
      logInfo(`step2 pick("kIg6KJl1iaCB"): step2=${step2}`);
      expect(step2).assertEqual('kIg6KJl1iaCB');
      const step3: string = subject.pickResult(-72);
      logInfo(`step3 pickResult(-72): step3=${step3}`);
      expect(step3).assertEqual('kIg6KJl1iaCB');
      const step4: number = subject.change('z645m');
      logInfo(`step4 change("z645m"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.pick('  ');
      logInfo(`step5 pick("  "): step5=${step5}`);
      expect(step5).assertEqual('  ');
      logInfo(`pickResult>pick>pickResult>change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('  ');
      logInfo(`pickResult>pick>pickResult>change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0051
     * @tc.name      CitySearch_CitySearchStateFlow_0051
     * @tc.desc      CitySearchState call flow pickResult > pick > change > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0051 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(40);
      logInfo(`step1 pickResult(40): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick('q');
      logInfo(`step2 pick("q"): step2=${step2}`);
      expect(step2).assertEqual('q');
      const step3: number = subject.change('w38');
      logInfo(`step3 change("w38"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.submit('Wf');
      logInfo(`step4 submit("Wf"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`pickResult>pick>change>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Wf');
      logInfo(`pickResult>pick>change>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>pick>change>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0051 end`);
    });
  });
}
