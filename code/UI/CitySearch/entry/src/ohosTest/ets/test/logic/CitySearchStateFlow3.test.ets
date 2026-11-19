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

/** Logic checks for CitySearchState flow (50 cases). */
export default function citySearchStateFlow3Test(): void {
  describe('CitySearchStateFlow3Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0105
     * @tc.name      CitySearch_CitySearchStateFlow_0105
     * @tc.desc      CitySearchState call flow submit > submit > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0105 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('Hello_1');
      logInfo(`step1 submit("Hello_1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('vSgR');
      logInfo(`step2 submit("vSgR"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('EIKtEkNV1gi3');
      logInfo(`step3 pick("EIKtEkNV1gi3"): step3=${step3}`);
      expect(step3).assertEqual('EIKtEkNV1gi3');
      logInfo(`submit>submit>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('EIKtEkNV1gi3');
      logInfo(`submit>submit>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>submit>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0106
     * @tc.name      CitySearch_CitySearchStateFlow_0106
     * @tc.desc      CitySearchState call flow change > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0106 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('bQzTD');
      logInfo(`step1 change("bQzTD"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(50);
      logInfo(`step2 pickResult(50): step2=${step2}`);
      expect(step2).assertEqual('bQzTD');
      logInfo(`change>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('bQzTD');
      logInfo(`change>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0107
     * @tc.name      CitySearch_CitySearchStateFlow_0107
     * @tc.desc      CitySearchState call flow pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0107 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('x\u4e2d\u6587');
      logInfo(`step1 pick("x??"): step1=${step1}`);
      expect(step1).assertEqual('x\u4e2d\u6587');
      const step2: string = subject.pick('BbFS1');
      logInfo(`step2 pick("BbFS1"): step2=${step2}`);
      expect(step2).assertEqual('BbFS1');
      logInfo(`pick>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('BbFS1');
      logInfo(`${BUNDLE}CitySearchStateFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0108
     * @tc.name      CitySearch_CitySearchStateFlow_0108
     * @tc.desc      CitySearchState call flow submit > pick > submit > submit > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0108 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('xO8vbe3RHuN');
      logInfo(`step1 submit("xO8vbe3RHuN"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('W0q1SdqJRH');
      logInfo(`step2 pick("W0q1SdqJRH"): step2=${step2}`);
      expect(step2).assertEqual('W0q1SdqJRH');
      const step3: number = subject.submit('Y');
      logInfo(`step3 submit("Y"): step3=${step3}`);
      expect(step3).assertEqual(6);
      const step4: number = subject.submit('\u4e2d\u6587_1');
      logInfo(`step4 submit("??_1"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.pick(' Hello ');
      logInfo(`step5 pick(" Hello "): step5=${step5}`);
      expect(step5).assertEqual(' Hello ');
      logInfo(`submit>pick>submit>submit>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' Hello ');
      logInfo(`submit>pick>submit>submit>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pick>submit>submit>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0109
     * @tc.name      CitySearch_CitySearchStateFlow_0109
     * @tc.desc      CitySearchState call flow pick > pickResult > pickResult > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0109 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('ZGbcFLIGlMt');
      logInfo(`step1 pick("ZGbcFLIGlMt"): step1=${step1}`);
      expect(step1).assertEqual('ZGbcFLIGlMt');
      const step2: string = subject.pickResult(22);
      logInfo(`step2 pickResult(22): step2=${step2}`);
      expect(step2).assertEqual('ZGbcFLIGlMt');
      const step3: string = subject.pickResult(82.77);
      logInfo(`step3 pickResult(82.77): step3=${step3}`);
      expect(step3).assertEqual('ZGbcFLIGlMt');
      const step4: number = subject.submit('X8vmQXGbG');
      logInfo(`step4 submit("X8vmQXGbG"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`pick>pickResult>pickResult>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('X8vmQXGbG');
      logInfo(`pick>pickResult>pickResult>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>pickResult>pickResult>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0110
     * @tc.name      CitySearch_CitySearchStateFlow_0110
     * @tc.desc      CitySearchState call flow change > change > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0110 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change(' a ');
      logInfo(`step1 change(" a "): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('jTRk3aHm5xK');
      logInfo(`step2 change("jTRk3aHm5xK"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit(' Sample Title 123 ');
      logInfo(`step3 submit(" Sample Title 123 "): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`change>change>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' Sample Title 123 ');
      logInfo(`change>change>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>change>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0111
     * @tc.name      CitySearch_CitySearchStateFlow_0111
     * @tc.desc      CitySearchState call flow submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0111 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('a_1');
      logInfo(`step1 submit("a_1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('Sample Title 123_1');
      logInfo(`step2 change("Sample Title 123_1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Sample Title 123_1');
      logInfo(`submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0112
     * @tc.name      CitySearch_CitySearchStateFlow_0112
     * @tc.desc      CitySearchState call flow pickResult > pick > pickResult > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0112 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(22);
      logInfo(`step1 pickResult(22): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick('V7');
      logInfo(`step2 pick("V7"): step2=${step2}`);
      expect(step2).assertEqual('V7');
      const step3: string = subject.pickResult(-15);
      logInfo(`step3 pickResult(-15): step3=${step3}`);
      expect(step3).assertEqual('V7');
      const step4: string = subject.pick('xHello');
      logInfo(`step4 pick("xHello"): step4=${step4}`);
      expect(step4).assertEqual('xHello');
      const step5: string = subject.pick('iqv');
      logInfo(`step5 pick("iqv"): step5=${step5}`);
      expect(step5).assertEqual('iqv');
      logInfo(`pickResult>pick>pickResult>pick>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('iqv');
      logInfo(`${BUNDLE}CitySearchStateFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0113
     * @tc.name      CitySearch_CitySearchStateFlow_0113
     * @tc.desc      CitySearchState call flow change > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0113 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('PmynBSwOERW');
      logInfo(`step1 change("PmynBSwOERW"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(75);
      logInfo(`step2 pickResult(75): step2=${step2}`);
      expect(step2).assertEqual('PmynBSwOERW');
      logInfo(`change>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('PmynBSwOERW');
      logInfo(`change>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0114
     * @tc.name      CitySearch_CitySearchStateFlow_0114
     * @tc.desc      CitySearchState call flow change > pickResult > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0114 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('7K');
      logInfo(`step1 change("7K"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(53.27);
      logInfo(`step2 pickResult(53.27): step2=${step2}`);
      expect(step2).assertEqual('7K');
      const step3: string = subject.pickResult(132);
      logInfo(`step3 pickResult(132): step3=${step3}`);
      expect(step3).assertEqual('7K');
      logInfo(`change>pickResult>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('7K');
      logInfo(`change>pickResult>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0115
     * @tc.name      CitySearch_CitySearchStateFlow_0115
     * @tc.desc      CitySearchState call flow change > pickResult > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0115 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('Emp0yS4xw');
      logInfo(`step1 change("Emp0yS4xw"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(80);
      logInfo(`step2 pickResult(80): step2=${step2}`);
      expect(step2).assertEqual('Emp0yS4xw');
      const step3: number = subject.change('E7r61MlE');
      logInfo(`step3 change("E7r61MlE"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`change>pickResult>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('E7r61MlE');
      logInfo(`change>pickResult>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0116
     * @tc.name      CitySearch_CitySearchStateFlow_0116
     * @tc.desc      CitySearchState call flow change > pick > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0116 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('7gL');
      logInfo(`step1 change("7gL"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('xhello world');
      logInfo(`step2 pick("xhello world"): step2=${step2}`);
      expect(step2).assertEqual('xhello world');
      const step3: string = subject.pickResult(73);
      logInfo(`step3 pickResult(73): step3=${step3}`);
      expect(step3).assertEqual('xhello world');
      logInfo(`change>pick>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xhello world');
      logInfo(`change>pick>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0117
     * @tc.name      CitySearch_CitySearchStateFlow_0117
     * @tc.desc      CitySearchState call flow pickResult > change > pickResult > change > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0117 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(112);
      logInfo(`step1 pickResult(112): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.change('Wjb');
      logInfo(`step2 change("Wjb"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pickResult(-19);
      logInfo(`step3 pickResult(-19): step3=${step3}`);
      expect(step3).assertEqual('Wjb');
      const step4: number = subject.change('S830Gl');
      logInfo(`step4 change("S830Gl"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.submit('NC');
      logInfo(`step5 submit("NC"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`pickResult>change>pickResult>change>submi...: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('NC');
      logInfo(`pickResult>change>pickResult>change>submi...: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>change>pickResult>change>submi...: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0118
     * @tc.name      CitySearch_CitySearchStateFlow_0118
     * @tc.desc      CitySearchState call flow pick > change > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0118 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('XFcJ');
      logInfo(`step1 pick("XFcJ"): step1=${step1}`);
      expect(step1).assertEqual('XFcJ');
      const step2: number = subject.change('eZbrh');
      logInfo(`step2 change("eZbrh"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.change('\u4e2d\u6587');
      logInfo(`step3 change("??"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pick>change>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('\u4e2d\u6587');
      logInfo(`pick>change>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0119
     * @tc.name      CitySearch_CitySearchStateFlow_0119
     * @tc.desc      CitySearchState call flow pickResult > pickResult > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0119 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(-43);
      logInfo(`step1 pickResult(-43): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pickResult(73);
      logInfo(`step2 pickResult(73): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.submit('ROYbF9iL');
      logInfo(`step3 submit("ROYbF9iL"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pickResult>pickResult>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ROYbF9iL');
      logInfo(`pickResult>pickResult>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>pickResult>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0120
     * @tc.name      CitySearch_CitySearchStateFlow_0120
     * @tc.desc      CitySearchState call flow pick > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0120 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('tKT4Xd');
      logInfo(`step1 pick("tKT4Xd"): step1=${step1}`);
      expect(step1).assertEqual('tKT4Xd');
      const step2: number = subject.submit('0XsDrdhw');
      logInfo(`step2 submit("0XsDrdhw"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`pick>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('0XsDrdhw');
      logInfo(`pick>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0121
     * @tc.name      CitySearch_CitySearchStateFlow_0121
     * @tc.desc      CitySearchState call flow pickResult > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0121 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(68.11);
      logInfo(`step1 pickResult(68.11): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.submit(' Hello ');
      logInfo(`step2 submit(" Hello "): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`pickResult>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' Hello ');
      logInfo(`pickResult>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0122
     * @tc.name      CitySearch_CitySearchStateFlow_0122
     * @tc.desc      CitySearchState call flow submit > pick > submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0122 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('5fC8');
      logInfo(`step1 submit("5fC8"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('\u4e2d\u6587_1');
      logInfo(`step2 pick("??_1"): step2=${step2}`);
      expect(step2).assertEqual('\u4e2d\u6587_1');
      const step3: number = subject.submit('v');
      logInfo(`step3 submit("v"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.change('z645m');
      logInfo(`step4 change("z645m"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`submit>pick>submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('z645m');
      logInfo(`submit>pick>submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pick>submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0123
     * @tc.name      CitySearch_CitySearchStateFlow_0123
     * @tc.desc      CitySearchState call flow pick > submit > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0123 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('4nqZpEQ28cn');
      logInfo(`step1 pick("4nqZpEQ28cn"): step1=${step1}`);
      expect(step1).assertEqual('4nqZpEQ28cn');
      const step2: number = subject.submit(' Hello ');
      logInfo(`step2 submit(" Hello "): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('8hWXmIXRMSs');
      logInfo(`step3 pick("8hWXmIXRMSs"): step3=${step3}`);
      expect(step3).assertEqual('8hWXmIXRMSs');
      logInfo(`pick>submit>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('8hWXmIXRMSs');
      logInfo(`pick>submit>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0124
     * @tc.name      CitySearch_CitySearchStateFlow_0124
     * @tc.desc      CitySearchState call flow pick > pickResult > pick > submit > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0124 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('4sb5ifX78bt');
      logInfo(`step1 pick("4sb5ifX78bt"): step1=${step1}`);
      expect(step1).assertEqual('4sb5ifX78bt');
      const step2: string = subject.pickResult(55);
      logInfo(`step2 pickResult(55): step2=${step2}`);
      expect(step2).assertEqual('4sb5ifX78bt');
      const step3: string = subject.pick('   ');
      logInfo(`step3 pick("   "): step3=${step3}`);
      expect(step3).assertEqual('   ');
      const step4: number = subject.submit(' _1');
      logInfo(`step4 submit(" _1"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.pick('a');
      logInfo(`step5 pick("a"): step5=${step5}`);
      expect(step5).assertEqual('a');
      logInfo(`pick>pickResult>pick>submit>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('a');
      logInfo(`pick>pickResult>pick>submit>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>pickResult>pick>submit>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0125
     * @tc.name      CitySearch_CitySearchStateFlow_0125
     * @tc.desc      CitySearchState call flow pick > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0125 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('123');
      logInfo(`step1 pick("123"): step1=${step1}`);
      expect(step1).assertEqual('123');
      const step2: string = subject.pick('GWc');
      logInfo(`step2 pick("GWc"): step2=${step2}`);
      expect(step2).assertEqual('GWc');
      const step3: string = subject.pick('KUw6hfX');
      logInfo(`step3 pick("KUw6hfX"): step3=${step3}`);
      expect(step3).assertEqual('KUw6hfX');
      logInfo(`pick>pick>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('KUw6hfX');
      logInfo(`${BUNDLE}CitySearchStateFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0126
     * @tc.name      CitySearch_CitySearchStateFlow_0126
     * @tc.desc      CitySearchState call flow pick > change > submit > pickResult > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0126 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('s811h');
      logInfo(`step1 pick("s811h"): step1=${step1}`);
      expect(step1).assertEqual('s811h');
      const step2: number = subject.change(' ');
      logInfo(`step2 change(" "): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('N');
      logInfo(`step3 submit("N"): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: string = subject.pickResult(-84);
      logInfo(`step4 pickResult(-84): step4=${step4}`);
      expect(step4).assertEqual('N');
      const step5: string = subject.pickResult(-84);
      logInfo(`step5 pickResult(-84): step5=${step5}`);
      expect(step5).assertEqual('N');
      logInfo(`pick>change>submit>pickResult>pickResult ...: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('N');
      logInfo(`pick>change>submit>pickResult>pickResult ...: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>change>submit>pickResult>pickResult ...: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(3);
      logInfo(`pick>change>submit>pickResult>pickResult ...: JSON.stringify(s...${JSON.stringify(subject.searchList)}`);
      expect(JSON.stringify(subject.searchList)).assertEqual('["\u5357\u660c","\u5357\u4eac","\u5b81\u6ce2"]');
      logInfo(`${BUNDLE}CitySearchStateFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0127
     * @tc.name      CitySearch_CitySearchStateFlow_0127
     * @tc.desc      CitySearchState call flow change > submit > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0127 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('hello world');
      logInfo(`step1 change("hello world"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('d9FYW');
      logInfo(`step2 submit("d9FYW"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('mgqpy1l9UZzJ');
      logInfo(`step3 pick("mgqpy1l9UZzJ"): step3=${step3}`);
      expect(step3).assertEqual('mgqpy1l9UZzJ');
      logInfo(`change>submit>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('mgqpy1l9UZzJ');
      logInfo(`change>submit>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>submit>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0127 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0128
     * @tc.name      CitySearch_CitySearchStateFlow_0128
     * @tc.desc      CitySearchState call flow change > change > submit > submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0128 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('1nJ2tOr9');
      logInfo(`step1 change("1nJ2tOr9"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('OthPqQqY6q');
      logInfo(`step2 change("OthPqQqY6q"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('DXS0AGY');
      logInfo(`step3 submit("DXS0AGY"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.submit('XHQn6');
      logInfo(`step4 submit("XHQn6"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.change('8xfL');
      logInfo(`step5 change("8xfL"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`change>change>submit>submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('8xfL');
      logInfo(`change>change>submit>submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>change>submit>submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0129
     * @tc.name      CitySearch_CitySearchStateFlow_0129
     * @tc.desc      CitySearchState call flow pickResult > submit > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0129 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(93.85);
      logInfo(`step1 pickResult(93.85): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.submit('KJL1oXbjZN');
      logInfo(`step2 submit("KJL1oXbjZN"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('SDMoxAL');
      logInfo(`step3 pick("SDMoxAL"): step3=${step3}`);
      expect(step3).assertEqual('SDMoxAL');
      logInfo(`pickResult>submit>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('SDMoxAL');
      logInfo(`pickResult>submit>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>submit>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0130
     * @tc.name      CitySearch_CitySearchStateFlow_0130
     * @tc.desc      CitySearchState call flow pickResult > pickResult > pickResult > change > submit keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0130 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(190);
      logInfo(`step1 pickResult(190): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pickResult(-25);
      logInfo(`step2 pickResult(-25): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.pickResult(120);
      logInfo(`step3 pickResult(120): step3=${step3}`);
      expect(step3).assertEqual('');
      const step4: number = subject.change('TlfMSPr');
      logInfo(`step4 change("TlfMSPr"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.submit('xf7eKo6D');
      logInfo(`step5 submit("xf7eKo6D"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`pickResult>pickResult>pickResult>change>s...: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xf7eKo6D');
      logInfo(`pickResult>pickResult>pickResult>change>s...: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>pickResult>pickResult>change>s...: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0131
     * @tc.name      CitySearch_CitySearchStateFlow_0131
     * @tc.desc      CitySearchState call flow submit > pick > change > change > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0131 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('1vB1');
      logInfo(`step1 submit("1vB1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('0V');
      logInfo(`step2 pick("0V"): step2=${step2}`);
      expect(step2).assertEqual('0V');
      const step3: number = subject.change('TlfMSPr');
      logInfo(`step3 change("TlfMSPr"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.change('UqcdQPxjr');
      logInfo(`step4 change("UqcdQPxjr"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.submit('Hello');
      logInfo(`step5 submit("Hello"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`submit>pick>change>change>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello');
      logInfo(`submit>pick>change>change>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pick>change>change>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0132
     * @tc.name      CitySearch_CitySearchStateFlow_0132
     * @tc.desc      CitySearchState call flow pick > change > pick > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0132 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('AKNDi');
      logInfo(`step1 pick("AKNDi"): step1=${step1}`);
      expect(step1).assertEqual('AKNDi');
      const step2: number = subject.change('8xfL');
      logInfo(`step2 change("8xfL"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('B');
      logInfo(`step3 pick("B"): step3=${step3}`);
      expect(step3).assertEqual('B');
      const step4: string = subject.pickResult(73);
      logInfo(`step4 pickResult(73): step4=${step4}`);
      expect(step4).assertEqual('B');
      logInfo(`pick>change>pick>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('B');
      logInfo(`pick>change>pick>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0133
     * @tc.name      CitySearch_CitySearchStateFlow_0133
     * @tc.desc      CitySearchState call flow change > pick > change > change > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0133 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('cTXi');
      logInfo(`step1 change("cTXi"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('GVDDV5');
      logInfo(`step2 pick("GVDDV5"): step2=${step2}`);
      expect(step2).assertEqual('GVDDV5');
      const step3: number = subject.change('Gjyxl3R2C');
      logInfo(`step3 change("Gjyxl3R2C"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.change('RA');
      logInfo(`step4 change("RA"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.submit('LOP8R7Yhl');
      logInfo(`step5 submit("LOP8R7Yhl"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`change>pick>change>change>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('LOP8R7Yhl');
      logInfo(`change>pick>change>change>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>pick>change>change>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0134
     * @tc.name      CitySearch_CitySearchStateFlow_0134
     * @tc.desc      CitySearchState call flow pickResult > pickResult > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0134 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(-90);
      logInfo(`step1 pickResult(-90): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pickResult(136);
      logInfo(`step2 pickResult(136): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: string = subject.pick('c');
      logInfo(`step3 pick("c"): step3=${step3}`);
      expect(step3).assertEqual('c');
      const step4: string = subject.pick('RDtUCM7JhqLP');
      logInfo(`step4 pick("RDtUCM7JhqLP"): step4=${step4}`);
      expect(step4).assertEqual('RDtUCM7JhqLP');
      logInfo(`pickResult>pickResult>pick>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('RDtUCM7JhqLP');
      logInfo(`${BUNDLE}CitySearchStateFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0135
     * @tc.name      CitySearch_CitySearchStateFlow_0135
     * @tc.desc      CitySearchState call flow pick > submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0135 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('a_1');
      logInfo(`step1 pick("a_1"): step1=${step1}`);
      expect(step1).assertEqual('a_1');
      const step2: number = subject.submit('xhello world');
      logInfo(`step2 submit("xhello world"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.change('hello worldhello world');
      logInfo(`step3 change("hello worldhello world"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pick>submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('hello worldhello world');
      logInfo(`pick>submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0136
     * @tc.name      CitySearch_CitySearchStateFlow_0136
     * @tc.desc      CitySearchState call flow change > submit > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0136 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('EYoYo');
      logInfo(`step1 change("EYoYo"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('6PML');
      logInfo(`step2 submit("6PML"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pickResult(194);
      logInfo(`step3 pickResult(194): step3=${step3}`);
      expect(step3).assertEqual('6PML');
      logInfo(`change>submit>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('6PML');
      logInfo(`change>submit>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>submit>pickResult final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0137
     * @tc.name      CitySearch_CitySearchStateFlow_0137
     * @tc.desc      CitySearchState call flow change > submit > pick > pickResult > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0137 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('Yxs2qV');
      logInfo(`step1 change("Yxs2qV"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('');
      logInfo(`step2 submit(""): step2=${step2}`);
      expect(step2).assertEqual(1);
      const step3: string = subject.pick('t7gGfd0');
      logInfo(`step3 pick("t7gGfd0"): step3=${step3}`);
      expect(step3).assertEqual('t7gGfd0');
      const step4: string = subject.pickResult(-55);
      logInfo(`step4 pickResult(-55): step4=${step4}`);
      expect(step4).assertEqual('t7gGfd0');
      const step5: string = subject.pick('B');
      logInfo(`step5 pick("B"): step5=${step5}`);
      expect(step5).assertEqual('B');
      logInfo(`change>submit>pick>pickResult>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('B');
      logInfo(`change>submit>pick>pickResult>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>submit>pick>pickResult>pick final: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(1);
      logInfo(`change>submit>pick>pickResult>pick final: JSON.stringify(subje...${JSON.stringify(subject.searchList)}`);
      expect(JSON.stringify(subject.searchList)).assertEqual('["\u957f\u6c99"]');
      logInfo(`${BUNDLE}CitySearchStateFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0138
     * @tc.name      CitySearch_CitySearchStateFlow_0138
     * @tc.desc      CitySearchState call flow pickResult > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0138 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(-84);
      logInfo(`step1 pickResult(-84): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick('a_1');
      logInfo(`step2 pick("a_1"): step2=${step2}`);
      expect(step2).assertEqual('a_1');
      logInfo(`pickResult>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('a_1');
      logInfo(`${BUNDLE}CitySearchStateFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0139
     * @tc.name      CitySearch_CitySearchStateFlow_0139
     * @tc.desc      CitySearchState call flow submit > submit > pickResult > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0139 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('MtfxqZlXkqbX');
      logInfo(`step1 submit("MtfxqZlXkqbX"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('DwO7Z2qNbt');
      logInfo(`step2 submit("DwO7Z2qNbt"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pickResult(95.22);
      logInfo(`step3 pickResult(95.22): step3=${step3}`);
      expect(step3).assertEqual('DwO7Z2qNbt');
      const step4: string = subject.pick('SDMoxAL');
      logInfo(`step4 pick("SDMoxAL"): step4=${step4}`);
      expect(step4).assertEqual('SDMoxAL');
      logInfo(`submit>submit>pickResult>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('SDMoxAL');
      logInfo(`submit>submit>pickResult>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>submit>pickResult>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0140
     * @tc.name      CitySearch_CitySearchStateFlow_0140
     * @tc.desc      CitySearchState call flow change > change > pick > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0140 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('CzBD8Iy');
      logInfo(`step1 change("CzBD8Iy"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('6qe');
      logInfo(`step2 change("6qe"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('2');
      logInfo(`step3 pick("2"): step3=${step3}`);
      expect(step3).assertEqual('2');
      const step4: string = subject.pickResult(10.76);
      logInfo(`step4 pickResult(10.76): step4=${step4}`);
      expect(step4).assertEqual('2');
      logInfo(`change>change>pick>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('2');
      logInfo(`change>change>pick>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0141
     * @tc.name      CitySearch_CitySearchStateFlow_0141
     * @tc.desc      CitySearchState call flow pickResult > change > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0141 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(-18);
      logInfo(`step1 pickResult(-18): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.change('dzGksFNZC');
      logInfo(`step2 change("dzGksFNZC"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('5mD6szpnX2Ab');
      logInfo(`step3 submit("5mD6szpnX2Ab"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pickResult>change>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('5mD6szpnX2Ab');
      logInfo(`pickResult>change>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>change>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0142
     * @tc.name      CitySearch_CitySearchStateFlow_0142
     * @tc.desc      CitySearchState call flow pick > change > pickResult > pickResult > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0142 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('zknIrBNwk');
      logInfo(`step1 pick("zknIrBNwk"): step1=${step1}`);
      expect(step1).assertEqual('zknIrBNwk');
      const step2: number = subject.change('cY0zy');
      logInfo(`step2 change("cY0zy"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pickResult(99.81);
      logInfo(`step3 pickResult(99.81): step3=${step3}`);
      expect(step3).assertEqual('cY0zy');
      const step4: string = subject.pickResult(3.93);
      logInfo(`step4 pickResult(3.93): step4=${step4}`);
      expect(step4).assertEqual('cY0zy');
      const step5: number = subject.submit('AA');
      logInfo(`step5 submit("AA"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`pick>change>pickResult>pickResult>submit ...: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('AA');
      logInfo(`pick>change>pickResult>pickResult>submit ...: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>change>pickResult>pickResult>submit ...: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0143
     * @tc.name      CitySearch_CitySearchStateFlow_0143
     * @tc.desc      CitySearchState call flow change > pickResult > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0143 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('Yxs2qV');
      logInfo(`step1 change("Yxs2qV"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(99);
      logInfo(`step2 pickResult(99): step2=${step2}`);
      expect(step2).assertEqual('Yxs2qV');
      const step3: number = subject.submit('vl5UbIVpk');
      logInfo(`step3 submit("vl5UbIVpk"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`change>pickResult>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('vl5UbIVpk');
      logInfo(`change>pickResult>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>pickResult>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0144
     * @tc.name      CitySearch_CitySearchStateFlow_0144
     * @tc.desc      CitySearchState call flow pick > submit > change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0144 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('dJf');
      logInfo(`step1 pick("dJf"): step1=${step1}`);
      expect(step1).assertEqual('dJf');
      const step2: number = subject.submit('hello world_1');
      logInfo(`step2 submit("hello world_1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.change(' Sample Title 123 ');
      logInfo(`step3 change(" Sample Title 123 "): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick('lKUz3lQTg');
      logInfo(`step4 pick("lKUz3lQTg"): step4=${step4}`);
      expect(step4).assertEqual('lKUz3lQTg');
      logInfo(`pick>submit>change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('lKUz3lQTg');
      logInfo(`pick>submit>change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit>change>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0145
     * @tc.name      CitySearch_CitySearchStateFlow_0145
     * @tc.desc      CitySearchState call flow pickResult > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0145 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(99.81);
      logInfo(`step1 pickResult(99.81): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick('g4uU8n8');
      logInfo(`step2 pick("g4uU8n8"): step2=${step2}`);
      expect(step2).assertEqual('g4uU8n8');
      const step3: string = subject.pick('hello worldhello world');
      logInfo(`step3 pick("hello worldhello world"): step3=${step3}`);
      expect(step3).assertEqual('hello worldhello world');
      logInfo(`pickResult>pick>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('hello worldhello world');
      logInfo(`${BUNDLE}CitySearchStateFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0146
     * @tc.name      CitySearch_CitySearchStateFlow_0146
     * @tc.desc      CitySearchState call flow submit > pick > pick > change > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0146 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('DwO7Z2qNbt');
      logInfo(`step1 submit("DwO7Z2qNbt"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('tKT4Xd');
      logInfo(`step2 pick("tKT4Xd"): step2=${step2}`);
      expect(step2).assertEqual('tKT4Xd');
      const step3: string = subject.pick('0if0Rq');
      logInfo(`step3 pick("0if0Rq"): step3=${step3}`);
      expect(step3).assertEqual('0if0Rq');
      const step4: number = subject.change('aa');
      logInfo(`step4 change("aa"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.change('A');
      logInfo(`step5 change("A"): step5=${step5}`);
      expect(step5).assertEqual(4);
      logInfo(`submit>pick>pick>change>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('A');
      logInfo(`submit>pick>pick>change>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pick>pick>change>change final: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(4);
      logInfo(`submit>pick>pick>change>change final: JSON.stringi...${JSON.stringify(subject.searchList.slice(0, 2))}`);
      expect(JSON.stringify(subject.searchList.slice(0, 2)))
        .assertEqual('["\u963f\u5c14\u5c71","\u963f\u52d2\u6cf0\u5730\u533a"]');
      logInfo(`submit>pick>pick>change>change final: JSON.stringi...${JSON.stringify(subject.searchList.slice(2, 4))}`);
      expect(JSON.stringify(subject.searchList.slice(2, 4))).assertEqual('["\u5b89\u5e86","\u5b89\u9633"]');
      logInfo(`submit>pick>pick>change>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0147
     * @tc.name      CitySearch_CitySearchStateFlow_0147
     * @tc.desc      CitySearchState call flow pick > pick > submit > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0147 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('A_1');
      logInfo(`step1 pick("A_1"): step1=${step1}`);
      expect(step1).assertEqual('A_1');
      const step2: string = subject.pick('FNfanmSp5');
      logInfo(`step2 pick("FNfanmSp5"): step2=${step2}`);
      expect(step2).assertEqual('FNfanmSp5');
      const step3: number = subject.submit('iQPRvYLttb2');
      logInfo(`step3 submit("iQPRvYLttb2"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick('iefu');
      logInfo(`step4 pick("iefu"): step4=${step4}`);
      expect(step4).assertEqual('iefu');
      logInfo(`pick>pick>submit>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('iefu');
      logInfo(`pick>pick>submit>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>pick>submit>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0148
     * @tc.name      CitySearch_CitySearchStateFlow_0148
     * @tc.desc      CitySearchState call flow submit > pickResult > pickResult > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0148 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('gcZW7F');
      logInfo(`step1 submit("gcZW7F"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(53.27);
      logInfo(`step2 pickResult(53.27): step2=${step2}`);
      expect(step2).assertEqual('gcZW7F');
      const step3: string = subject.pickResult(107);
      logInfo(`step3 pickResult(107): step3=${step3}`);
      expect(step3).assertEqual('gcZW7F');
      const step4: string = subject.pick('5CTDXPL1Q6e');
      logInfo(`step4 pick("5CTDXPL1Q6e"): step4=${step4}`);
      expect(step4).assertEqual('5CTDXPL1Q6e');
      logInfo(`submit>pickResult>pickResult>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('5CTDXPL1Q6e');
      logInfo(`submit>pickResult>pickResult>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pickResult>pickResult>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0149
     * @tc.name      CitySearch_CitySearchStateFlow_0149
     * @tc.desc      CitySearchState call flow pickResult > pick > change > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0149 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(-41);
      logInfo(`step1 pickResult(-41): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick('04v');
      logInfo(`step2 pick("04v"): step2=${step2}`);
      expect(step2).assertEqual('04v');
      const step3: number = subject.change('IhBQj1futm');
      logInfo(`step3 change("IhBQj1futm"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pickResult(131);
      logInfo(`step4 pickResult(131): step4=${step4}`);
      expect(step4).assertEqual('IhBQj1futm');
      logInfo(`pickResult>pick>change>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('IhBQj1futm');
      logInfo(`pickResult>pick>change>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0150
     * @tc.name      CitySearch_CitySearchStateFlow_0150
     * @tc.desc      CitySearchState call flow submit > submit > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0150 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit(' _1');
      logInfo(`step1 submit(" _1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('2ndRkkn');
      logInfo(`step2 submit("2ndRkkn"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('0if0Rq');
      logInfo(`step3 pick("0if0Rq"): step3=${step3}`);
      expect(step3).assertEqual('0if0Rq');
      logInfo(`submit>submit>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('0if0Rq');
      logInfo(`submit>submit>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>submit>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0151
     * @tc.name      CitySearch_CitySearchStateFlow_0151
     * @tc.desc      CitySearchState call flow submit > change > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0151 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('BPE');
      logInfo(`step1 submit("BPE"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('AA');
      logInfo(`step2 change("AA"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pickResult(-89);
      logInfo(`step3 pickResult(-89): step3=${step3}`);
      expect(step3).assertEqual('AA');
      logInfo(`submit>change>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('AA');
      logInfo(`submit>change>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>change>pickResult final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0152
     * @tc.name      CitySearch_CitySearchStateFlow_0152
     * @tc.desc      CitySearchState call flow pickResult > pickResult > change > pick > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0152 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(60);
      logInfo(`step1 pickResult(60): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pickResult(-33);
      logInfo(`step2 pickResult(-33): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.change('jVg8');
      logInfo(`step3 change("jVg8"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick('5CTDXPL1Q6e');
      logInfo(`step4 pick("5CTDXPL1Q6e"): step4=${step4}`);
      expect(step4).assertEqual('5CTDXPL1Q6e');
      const step5: number = subject.submit('T');
      logInfo(`step5 submit("T"): step5=${step5}`);
      expect(step5).assertEqual(6);
      logInfo(`pickResult>pickResult>change>pick>submit ...: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('T');
      logInfo(`pickResult>pickResult>change>pick>submit ...: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>pickResult>change>pick>submit ...: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(6);
      logInfo(`pickResult>pickResult>change>pick>submit ...: JSON...${JSON.stringify(subject.searchList.slice(0, 3))}`);
      expect(JSON.stringify(subject.searchList.slice(0, 3)))
        .assertEqual('["\u5929\u6d25","\u592a\u539f","\u5410\u9c81\u756a"]');
      logInfo(`pickResult>pickResult>change>pick>submit ...: JSON...${JSON.stringify(subject.searchList.slice(3, 6))}`);
      expect(JSON.stringify(subject.searchList.slice(3, 6)))
        .assertEqual('["\u53f0\u5317","\u53f0\u6e7e","\u5510\u5c71"]');
      logInfo(`${BUNDLE}CitySearchStateFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0153
     * @tc.name      CitySearch_CitySearchStateFlow_0153
     * @tc.desc      CitySearchState call flow submit > pickResult > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0153 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('xHello');
      logInfo(`step1 submit("xHello"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(54.78);
      logInfo(`step2 pickResult(54.78): step2=${step2}`);
      expect(step2).assertEqual('xHello');
      const step3: string = subject.pick('zknIrBNwk');
      logInfo(`step3 pick("zknIrBNwk"): step3=${step3}`);
      expect(step3).assertEqual('zknIrBNwk');
      logInfo(`submit>pickResult>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('zknIrBNwk');
      logInfo(`submit>pickResult>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pickResult>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0154
     * @tc.name      CitySearch_CitySearchStateFlow_0154
     * @tc.desc      CitySearchState call flow pickResult > submit > pickResult > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0154 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(-41);
      logInfo(`step1 pickResult(-41): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.submit('FSoQ');
      logInfo(`step2 submit("FSoQ"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pickResult(38.73);
      logInfo(`step3 pickResult(38.73): step3=${step3}`);
      expect(step3).assertEqual('FSoQ');
      const step4: number = subject.submit('KG');
      logInfo(`step4 submit("KG"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`pickResult>submit>pickResult>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('KG');
      logInfo(`pickResult>submit>pickResult>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>submit>pickResult>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0154 end`);
    });
  });
}
