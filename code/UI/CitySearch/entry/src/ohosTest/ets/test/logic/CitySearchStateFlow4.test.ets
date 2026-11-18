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
export default function citySearchStateFlow4Test(): void {
  describe('CitySearchStateFlow4Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0155
     * @tc.name      CitySearch_CitySearchStateFlow_0155
     * @tc.desc      CitySearchState call flow pickResult > change > pickResult > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0155 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(126);
      logInfo(`step1 pickResult(126): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.change('MUZJYhM');
      logInfo(`step2 change("MUZJYhM"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pickResult(93.64);
      logInfo(`step3 pickResult(93.64): step3=${step3}`);
      expect(step3).assertEqual('MUZJYhM');
      const step4: string = subject.pick('yNWqzCeJ');
      logInfo(`step4 pick("yNWqzCeJ"): step4=${step4}`);
      expect(step4).assertEqual('yNWqzCeJ');
      logInfo(`pickResult>change>pickResult>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('yNWqzCeJ');
      logInfo(`pickResult>change>pickResult>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0156
     * @tc.name      CitySearch_CitySearchStateFlow_0156
     * @tc.desc      CitySearchState call flow pickResult > submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0156 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(200);
      logInfo(`step1 pickResult(200): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.submit('9L6EfTZXtH');
      logInfo(`step2 submit("9L6EfTZXtH"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.change('mBdd');
      logInfo(`step3 change("mBdd"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pickResult>submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('mBdd');
      logInfo(`pickResult>submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0157
     * @tc.name      CitySearch_CitySearchStateFlow_0157
     * @tc.desc      CitySearchState call flow submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0157 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('CCK85T');
      logInfo(`step1 submit("CCK85T"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('mVR');
      logInfo(`step2 change("mVR"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('mVR');
      logInfo(`submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0158
     * @tc.name      CitySearch_CitySearchStateFlow_0158
     * @tc.desc      CitySearchState call flow change > pick > submit > pickResult > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0158 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('kx7');
      logInfo(`step1 change("kx7"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('123');
      logInfo(`step2 pick("123"): step2=${step2}`);
      expect(step2).assertEqual('123');
      const step3: number = subject.submit('2vdR0KEAiKps');
      logInfo(`step3 submit("2vdR0KEAiKps"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pickResult(8);
      logInfo(`step4 pickResult(8): step4=${step4}`);
      expect(step4).assertEqual('2vdR0KEAiKps');
      const step5: string = subject.pickResult(80);
      logInfo(`step5 pickResult(80): step5=${step5}`);
      expect(step5).assertEqual('2vdR0KEAiKps');
      logInfo(`change>pick>submit>pickResult>pickResult ...: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('2vdR0KEAiKps');
      logInfo(`change>pick>submit>pickResult>pickResult ...: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>pick>submit>pickResult>pickResult ...: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0159
     * @tc.name      CitySearch_CitySearchStateFlow_0159
     * @tc.desc      CitySearchState call flow submit > pickResult > submit > pick > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0159 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('xO8vbe3RHuN');
      logInfo(`step1 submit("xO8vbe3RHuN"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(22.99);
      logInfo(`step2 pickResult(22.99): step2=${step2}`);
      expect(step2).assertEqual('xO8vbe3RHuN');
      const step3: number = subject.submit(' _1');
      logInfo(`step3 submit(" _1"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick('rDG2yuhcx');
      logInfo(`step4 pick("rDG2yuhcx"): step4=${step4}`);
      expect(step4).assertEqual('rDG2yuhcx');
      const step5: number = subject.change('Hello WorldHello World');
      logInfo(`step5 change("Hello WorldHello World"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`submit>pickResult>submit>pick>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello WorldHello World');
      logInfo(`submit>pickResult>submit>pick>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pickResult>submit>pick>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0160
     * @tc.name      CitySearch_CitySearchStateFlow_0160
     * @tc.desc      CitySearchState call flow pick > pickResult > pick > pickResult > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0160 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('1rTxM607vhT');
      logInfo(`step1 pick("1rTxM607vhT"): step1=${step1}`);
      expect(step1).assertEqual('1rTxM607vhT');
      const step2: string = subject.pickResult(65);
      logInfo(`step2 pickResult(65): step2=${step2}`);
      expect(step2).assertEqual('1rTxM607vhT');
      const step3: string = subject.pick('yt');
      logInfo(`step3 pick("yt"): step3=${step3}`);
      expect(step3).assertEqual('yt');
      const step4: string = subject.pickResult(83);
      logInfo(`step4 pickResult(83): step4=${step4}`);
      expect(step4).assertEqual('yt');
      const step5: string = subject.pickResult(3.93);
      logInfo(`step5 pickResult(3.93): step5=${step5}`);
      expect(step5).assertEqual('yt');
      logInfo(`pick>pickResult>pick>pickResult>pickResul...: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('yt');
      logInfo(`${BUNDLE}CitySearchStateFlow_0160 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0161
     * @tc.name      CitySearch_CitySearchStateFlow_0161
     * @tc.desc      CitySearchState call flow change > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0161 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('FTYXufzbJ');
      logInfo(`step1 change("FTYXufzbJ"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change(' abc ');
      logInfo(`step2 change(" abc "): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`change>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' abc ');
      logInfo(`change>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0162
     * @tc.name      CitySearch_CitySearchStateFlow_0162
     * @tc.desc      CitySearchState call flow change > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0162 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('dzGksFNZC');
      logInfo(`step1 change("dzGksFNZC"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('hGkmq0TCoNVb');
      logInfo(`step2 pick("hGkmq0TCoNVb"): step2=${step2}`);
      expect(step2).assertEqual('hGkmq0TCoNVb');
      const step3: string = subject.pick('6iH');
      logInfo(`step3 pick("6iH"): step3=${step3}`);
      expect(step3).assertEqual('6iH');
      logInfo(`change>pick>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('6iH');
      logInfo(`change>pick>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0163
     * @tc.name      CitySearch_CitySearchStateFlow_0163
     * @tc.desc      CitySearchState call flow pick > submit > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0163 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('ZGbcFLIGlMt');
      logInfo(`step1 pick("ZGbcFLIGlMt"): step1=${step1}`);
      expect(step1).assertEqual('ZGbcFLIGlMt');
      const step2: number = subject.submit('1vB1');
      logInfo(`step2 submit("1vB1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('h30r1l665j');
      logInfo(`step3 pick("h30r1l665j"): step3=${step3}`);
      expect(step3).assertEqual('h30r1l665j');
      logInfo(`pick>submit>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('h30r1l665j');
      logInfo(`pick>submit>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0164
     * @tc.name      CitySearch_CitySearchStateFlow_0164
     * @tc.desc      CitySearchState call flow pick > pick > submit > pick > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0164 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('x123');
      logInfo(`step1 pick("x123"): step1=${step1}`);
      expect(step1).assertEqual('x123');
      const step2: string = subject.pick('Wl');
      logInfo(`step2 pick("Wl"): step2=${step2}`);
      expect(step2).assertEqual('Wl');
      const step3: number = subject.submit(' abc ');
      logInfo(`step3 submit(" abc "): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick('iefu');
      logInfo(`step4 pick("iefu"): step4=${step4}`);
      expect(step4).assertEqual('iefu');
      const step5: string = subject.pickResult(-19);
      logInfo(`step5 pickResult(-19): step5=${step5}`);
      expect(step5).assertEqual('iefu');
      logInfo(`pick>pick>submit>pick>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('iefu');
      logInfo(`pick>pick>submit>pick>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>pick>submit>pick>pickResult final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0165
     * @tc.name      CitySearch_CitySearchStateFlow_0165
     * @tc.desc      CitySearchState call flow submit > pick > pickResult > pick > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0165 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('B92nGx');
      logInfo(`step1 submit("B92nGx"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('Sample Title 123');
      logInfo(`step2 pick("Sample Title 123"): step2=${step2}`);
      expect(step2).assertEqual('Sample Title 123');
      const step3: string = subject.pickResult(75);
      logInfo(`step3 pickResult(75): step3=${step3}`);
      expect(step3).assertEqual('Sample Title 123');
      const step4: string = subject.pick('xhello world');
      logInfo(`step4 pick("xhello world"): step4=${step4}`);
      expect(step4).assertEqual('xhello world');
      const step5: string = subject.pickResult(7);
      logInfo(`step5 pickResult(7): step5=${step5}`);
      expect(step5).assertEqual('xhello world');
      logInfo(`submit>pick>pickResult>pick>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xhello world');
      logInfo(`submit>pick>pickResult>pick>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pick>pickResult>pick>pickResult final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0166
     * @tc.name      CitySearch_CitySearchStateFlow_0166
     * @tc.desc      CitySearchState call flow submit > pickResult > pickResult > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0166 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('5fxkMi9DG');
      logInfo(`step1 submit("5fxkMi9DG"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(-38);
      logInfo(`step2 pickResult(-38): step2=${step2}`);
      expect(step2).assertEqual('5fxkMi9DG');
      const step3: string = subject.pickResult(-38);
      logInfo(`step3 pickResult(-38): step3=${step3}`);
      expect(step3).assertEqual('5fxkMi9DG');
      const step4: number = subject.submit('hello world');
      logInfo(`step4 submit("hello world"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`submit>pickResult>pickResult>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('hello world');
      logInfo(`submit>pickResult>pickResult>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pickResult>pickResult>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0167
     * @tc.name      CitySearch_CitySearchStateFlow_0167
     * @tc.desc      CitySearchState call flow submit > pick > submit > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0167 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('Hello World');
      logInfo(`step1 submit("Hello World"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('tKT4Xd');
      logInfo(`step2 pick("tKT4Xd"): step2=${step2}`);
      expect(step2).assertEqual('tKT4Xd');
      const step3: number = subject.submit('Xo9bjI5PqFg');
      logInfo(`step3 submit("Xo9bjI5PqFg"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pickResult(164);
      logInfo(`step4 pickResult(164): step4=${step4}`);
      expect(step4).assertEqual('Xo9bjI5PqFg');
      logInfo(`submit>pick>submit>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Xo9bjI5PqFg');
      logInfo(`submit>pick>submit>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pick>submit>pickResult final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0168
     * @tc.name      CitySearch_CitySearchStateFlow_0168
     * @tc.desc      CitySearchState call flow pick > change > pick > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0168 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('W0q1SdqJRH');
      logInfo(`step1 pick("W0q1SdqJRH"): step1=${step1}`);
      expect(step1).assertEqual('W0q1SdqJRH');
      const step2: number = subject.change('kx7');
      logInfo(`step2 change("kx7"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('ZGbcFLIGlMt');
      logInfo(`step3 pick("ZGbcFLIGlMt"): step3=${step3}`);
      expect(step3).assertEqual('ZGbcFLIGlMt');
      const step4: string = subject.pick('SKaVCSo');
      logInfo(`step4 pick("SKaVCSo"): step4=${step4}`);
      expect(step4).assertEqual('SKaVCSo');
      const step5: string = subject.pick('\u4e2d\u6587_1');
      logInfo(`step5 pick("??_1"): step5=${step5}`);
      expect(step5).assertEqual('\u4e2d\u6587_1');
      logInfo(`pick>change>pick>pick>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('\u4e2d\u6587_1');
      logInfo(`pick>change>pick>pick>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0169
     * @tc.name      CitySearch_CitySearchStateFlow_0169
     * @tc.desc      CitySearchState call flow pickResult > pickResult > change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0169 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(29);
      logInfo(`step1 pickResult(29): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pickResult(8);
      logInfo(`step2 pickResult(8): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.change('yr0NChJJ');
      logInfo(`step3 change("yr0NChJJ"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick('XDB');
      logInfo(`step4 pick("XDB"): step4=${step4}`);
      expect(step4).assertEqual('XDB');
      logInfo(`pickResult>pickResult>change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('XDB');
      logInfo(`pickResult>pickResult>change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0170
     * @tc.name      CitySearch_CitySearchStateFlow_0170
     * @tc.desc      CitySearchState call flow pick > pick > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0170 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('zLR');
      logInfo(`step1 pick("zLR"): step1=${step1}`);
      expect(step1).assertEqual('zLR');
      const step2: string = subject.pick('HelloHello');
      logInfo(`step2 pick("HelloHello"): step2=${step2}`);
      expect(step2).assertEqual('HelloHello');
      const step3: string = subject.pickResult(98.09);
      logInfo(`step3 pickResult(98.09): step3=${step3}`);
      expect(step3).assertEqual('HelloHello');
      logInfo(`pick>pick>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('HelloHello');
      logInfo(`${BUNDLE}CitySearchStateFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0171
     * @tc.name      CitySearch_CitySearchStateFlow_0171
     * @tc.desc      CitySearchState call flow submit > submit > submit > change > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0171 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('HzotfGfQ');
      logInfo(`step1 submit("HzotfGfQ"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit(' hello world ');
      logInfo(`step2 submit(" hello world "): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('Q');
      logInfo(`step3 submit("Q"): step3=${step3}`);
      expect(step3).assertEqual(3);
      const step4: number = subject.change('KrvR');
      logInfo(`step4 change("KrvR"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.change('FTYXufzbJ');
      logInfo(`step5 change("FTYXufzbJ"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`submit>submit>submit>change>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('FTYXufzbJ');
      logInfo(`submit>submit>submit>change>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>submit>submit>change>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0172
     * @tc.name      CitySearch_CitySearchStateFlow_0172
     * @tc.desc      CitySearchState call flow pick > change > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0172 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('\u4e2d\u6587');
      logInfo(`step1 pick("??"): step1=${step1}`);
      expect(step1).assertEqual('\u4e2d\u6587');
      const step2: number = subject.change(' 123 ');
      logInfo(`step2 change(" 123 "): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('vpX');
      logInfo(`step3 submit("vpX"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pick>change>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('vpX');
      logInfo(`pick>change>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>change>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0173
     * @tc.name      CitySearch_CitySearchStateFlow_0173
     * @tc.desc      CitySearchState call flow pick > change > pickResult > submit > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0173 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('ZNGA');
      logInfo(`step1 pick("ZNGA"): step1=${step1}`);
      expect(step1).assertEqual('ZNGA');
      const step2: number = subject.change('xHello');
      logInfo(`step2 change("xHello"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pickResult(10.7);
      logInfo(`step3 pickResult(10.7): step3=${step3}`);
      expect(step3).assertEqual('xHello');
      const step4: number = subject.submit('NIKzts');
      logInfo(`step4 submit("NIKzts"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.submit('5fC8');
      logInfo(`step5 submit("5fC8"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`pick>change>pickResult>submit>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('5fC8');
      logInfo(`pick>change>pickResult>submit>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>change>pickResult>submit>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0174
     * @tc.name      CitySearch_CitySearchStateFlow_0174
     * @tc.desc      CitySearchState call flow pick > change > submit > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0174 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('hello world');
      logInfo(`step1 pick("hello world"): step1=${step1}`);
      expect(step1).assertEqual('hello world');
      const step2: number = subject.change('xa');
      logInfo(`step2 change("xa"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('sQCJb');
      logInfo(`step3 submit("sQCJb"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick('KEC');
      logInfo(`step4 pick("KEC"): step4=${step4}`);
      expect(step4).assertEqual('KEC');
      logInfo(`pick>change>submit>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('KEC');
      logInfo(`pick>change>submit>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>change>submit>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0175
     * @tc.name      CitySearch_CitySearchStateFlow_0175
     * @tc.desc      CitySearchState call flow pick > pick > change > pickResult > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0175 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('0V');
      logInfo(`step1 pick("0V"): step1=${step1}`);
      expect(step1).assertEqual('0V');
      const step2: string = subject.pick('2Qvw2CcBLo2');
      logInfo(`step2 pick("2Qvw2CcBLo2"): step2=${step2}`);
      expect(step2).assertEqual('2Qvw2CcBLo2');
      const step3: number = subject.change('mnv');
      logInfo(`step3 change("mnv"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pickResult(56.55);
      logInfo(`step4 pickResult(56.55): step4=${step4}`);
      expect(step4).assertEqual('mnv');
      const step5: number = subject.change('i');
      logInfo(`step5 change("i"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`pick>pick>change>pickResult>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('i');
      logInfo(`pick>pick>change>pickResult>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0176
     * @tc.name      CitySearch_CitySearchStateFlow_0176
     * @tc.desc      CitySearchState call flow change > pick > submit > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0176 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('cTXi');
      logInfo(`step1 change("cTXi"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('  ');
      logInfo(`step2 pick("  "): step2=${step2}`);
      expect(step2).assertEqual('  ');
      const step3: number = subject.submit('OqRWEpRJU');
      logInfo(`step3 submit("OqRWEpRJU"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick('8hWXmIXRMSs');
      logInfo(`step4 pick("8hWXmIXRMSs"): step4=${step4}`);
      expect(step4).assertEqual('8hWXmIXRMSs');
      const step5: string = subject.pick('zMcJ4ZAS');
      logInfo(`step5 pick("zMcJ4ZAS"): step5=${step5}`);
      expect(step5).assertEqual('zMcJ4ZAS');
      logInfo(`change>pick>submit>pick>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('zMcJ4ZAS');
      logInfo(`change>pick>submit>pick>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>pick>submit>pick>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0177
     * @tc.name      CitySearch_CitySearchStateFlow_0177
     * @tc.desc      CitySearchState call flow pick > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0177 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('x123');
      logInfo(`step1 pick("x123"): step1=${step1}`);
      expect(step1).assertEqual('x123');
      const step2: string = subject.pickResult(38);
      logInfo(`step2 pickResult(38): step2=${step2}`);
      expect(step2).assertEqual('x123');
      logInfo(`pick>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('x123');
      logInfo(`${BUNDLE}CitySearchStateFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0178
     * @tc.name      CitySearch_CitySearchStateFlow_0178
     * @tc.desc      CitySearchState call flow submit > pick > pickResult > change > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0178 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('A');
      logInfo(`step1 submit("A"): step1=${step1}`);
      expect(step1).assertEqual(4);
      const step2: string = subject.pick('b5gewLT');
      logInfo(`step2 pick("b5gewLT"): step2=${step2}`);
      expect(step2).assertEqual('b5gewLT');
      const step3: string = subject.pickResult(110);
      logInfo(`step3 pickResult(110): step3=${step3}`);
      expect(step3).assertEqual('b5gewLT');
      const step4: number = subject.change('6Y');
      logInfo(`step4 change("6Y"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.pickResult(2);
      logInfo(`step5 pickResult(2): step5=${step5}`);
      expect(step5).assertEqual('6Y');
      logInfo(`submit>pick>pickResult>change>pickResult ...: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('6Y');
      logInfo(`submit>pick>pickResult>change>pickResult ...: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0179
     * @tc.name      CitySearch_CitySearchStateFlow_0179
     * @tc.desc      CitySearchState call flow pick > submit > submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0179 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('CuJm');
      logInfo(`step1 pick("CuJm"): step1=${step1}`);
      expect(step1).assertEqual('CuJm');
      const step2: number = subject.submit('8x9qIKj76hxm');
      logInfo(`step2 submit("8x9qIKj76hxm"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('TqO');
      logInfo(`step3 submit("TqO"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.change('ZXHJbv');
      logInfo(`step4 change("ZXHJbv"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`pick>submit>submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ZXHJbv');
      logInfo(`pick>submit>submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit>submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0180
     * @tc.name      CitySearch_CitySearchStateFlow_0180
     * @tc.desc      CitySearchState call flow change > change > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0180 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('x ');
      logInfo(`step1 change("x "): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('xhello world');
      logInfo(`step2 change("xhello world"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pickResult(165);
      logInfo(`step3 pickResult(165): step3=${step3}`);
      expect(step3).assertEqual('xhello world');
      logInfo(`change>change>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xhello world');
      logInfo(`change>change>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0181
     * @tc.name      CitySearch_CitySearchStateFlow_0181
     * @tc.desc      CitySearchState call flow submit > pick > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0181 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('g44BfTnGkaCx');
      logInfo(`step1 submit("g44BfTnGkaCx"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('IYLTSP2O8q');
      logInfo(`step2 pick("IYLTSP2O8q"): step2=${step2}`);
      expect(step2).assertEqual('IYLTSP2O8q');
      const step3: number = subject.change('4hg58AZbF9mF');
      logInfo(`step3 change("4hg58AZbF9mF"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`submit>pick>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('4hg58AZbF9mF');
      logInfo(`submit>pick>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pick>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0182
     * @tc.name      CitySearch_CitySearchStateFlow_0182
     * @tc.desc      CitySearchState call flow submit > change > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0182 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('HzotfGfQ');
      logInfo(`step1 submit("HzotfGfQ"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('abc');
      logInfo(`step2 change("abc"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('c');
      logInfo(`step3 pick("c"): step3=${step3}`);
      expect(step3).assertEqual('c');
      const step4: string = subject.pick('OFp5j2f');
      logInfo(`step4 pick("OFp5j2f"): step4=${step4}`);
      expect(step4).assertEqual('OFp5j2f');
      logInfo(`submit>change>pick>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('OFp5j2f');
      logInfo(`submit>change>pick>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>change>pick>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0183
     * @tc.name      CitySearch_CitySearchStateFlow_0183
     * @tc.desc      CitySearchState call flow submit > pickResult > submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0183 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('vpX');
      logInfo(`step1 submit("vpX"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(108);
      logInfo(`step2 pickResult(108): step2=${step2}`);
      expect(step2).assertEqual('vpX');
      const step3: number = subject.submit('IaJG');
      logInfo(`step3 submit("IaJG"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.change('W4oYy5');
      logInfo(`step4 change("W4oYy5"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`submit>pickResult>submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('W4oYy5');
      logInfo(`submit>pickResult>submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pickResult>submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0184
     * @tc.name      CitySearch_CitySearchStateFlow_0184
     * @tc.desc      CitySearchState call flow change > submit > change > submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0184 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('x\u4e2d\u6587');
      logInfo(`step1 change("x??"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('hello worldhello world');
      logInfo(`step2 submit("hello worldhello world"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.change('cTXi');
      logInfo(`step3 change("cTXi"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.submit('xhello world');
      logInfo(`step4 submit("xhello world"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.change('VCphytda');
      logInfo(`step5 change("VCphytda"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`change>submit>change>submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('VCphytda');
      logInfo(`change>submit>change>submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>submit>change>submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0185
     * @tc.name      CitySearch_CitySearchStateFlow_0185
     * @tc.desc      CitySearchState call flow pickResult > submit > pickResult > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0185 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(69.17);
      logInfo(`step1 pickResult(69.17): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.submit('xa');
      logInfo(`step2 submit("xa"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pickResult(26.5);
      logInfo(`step3 pickResult(26.5): step3=${step3}`);
      expect(step3).assertEqual('xa');
      const step4: number = subject.change('Bxj');
      logInfo(`step4 change("Bxj"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`pickResult>submit>pickResult>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Bxj');
      logInfo(`pickResult>submit>pickResult>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>submit>pickResult>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0186
     * @tc.name      CitySearch_CitySearchStateFlow_0186
     * @tc.desc      CitySearchState call flow change > pick > change > submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0186 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('1');
      logInfo(`step1 change("1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('iKY');
      logInfo(`step2 pick("iKY"): step2=${step2}`);
      expect(step2).assertEqual('iKY');
      const step3: number = subject.change('x\u4e2d\u6587');
      logInfo(`step3 change("x??"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.submit('xDJ2487JC');
      logInfo(`step4 submit("xDJ2487JC"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.change('1AzT2lv4c');
      logInfo(`step5 change("1AzT2lv4c"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`change>pick>change>submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('1AzT2lv4c');
      logInfo(`change>pick>change>submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>pick>change>submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0187
     * @tc.name      CitySearch_CitySearchStateFlow_0187
     * @tc.desc      CitySearchState call flow pick > submit > submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0187 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('KXdIWk7lp');
      logInfo(`step1 pick("KXdIWk7lp"): step1=${step1}`);
      expect(step1).assertEqual('KXdIWk7lp');
      const step2: number = subject.submit('obq');
      logInfo(`step2 submit("obq"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('dQHt');
      logInfo(`step3 submit("dQHt"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.change('LgL2k');
      logInfo(`step4 change("LgL2k"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`pick>submit>submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('LgL2k');
      logInfo(`pick>submit>submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit>submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0187 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0188
     * @tc.name      CitySearch_CitySearchStateFlow_0188
     * @tc.desc      CitySearchState call flow pick > change > change > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0188 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('nwjxGHIPr');
      logInfo(`step1 pick("nwjxGHIPr"): step1=${step1}`);
      expect(step1).assertEqual('nwjxGHIPr');
      const step2: number = subject.change('KrvR');
      logInfo(`step2 change("KrvR"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.change('ipMmpQ1G');
      logInfo(`step3 change("ipMmpQ1G"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.change('sk7');
      logInfo(`step4 change("sk7"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`pick>change>change>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('sk7');
      logInfo(`pick>change>change>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0189
     * @tc.name      CitySearch_CitySearchStateFlow_0189
     * @tc.desc      CitySearchState call flow pick > change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0189 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('\u4e2d\u6587');
      logInfo(`step1 pick("??"): step1=${step1}`);
      expect(step1).assertEqual('\u4e2d\u6587');
      const step2: number = subject.change('NIl');
      logInfo(`step2 change("NIl"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('V7');
      logInfo(`step3 pick("V7"): step3=${step3}`);
      expect(step3).assertEqual('V7');
      logInfo(`pick>change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('V7');
      logInfo(`pick>change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0190
     * @tc.name      CitySearch_CitySearchStateFlow_0190
     * @tc.desc      CitySearchState call flow submit > pick > submit > pick > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0190 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('s546pn');
      logInfo(`step1 submit("s546pn"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('s811h');
      logInfo(`step2 pick("s811h"): step2=${step2}`);
      expect(step2).assertEqual('s811h');
      const step3: number = subject.submit('xf7eKo6D');
      logInfo(`step3 submit("xf7eKo6D"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick('GWc');
      logInfo(`step4 pick("GWc"): step4=${step4}`);
      expect(step4).assertEqual('GWc');
      const step5: number = subject.change('IAN6yy1J');
      logInfo(`step5 change("IAN6yy1J"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`submit>pick>submit>pick>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('IAN6yy1J');
      logInfo(`submit>pick>submit>pick>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pick>submit>pick>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0191
     * @tc.name      CitySearch_CitySearchStateFlow_0191
     * @tc.desc      CitySearchState call flow pick > submit > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0191 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('5zz6yKJYB');
      logInfo(`step1 pick("5zz6yKJYB"): step1=${step1}`);
      expect(step1).assertEqual('5zz6yKJYB');
      const step2: number = subject.submit('Hello World');
      logInfo(`step2 submit("Hello World"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('laBOMJTh');
      logInfo(`step3 submit("laBOMJTh"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pick>submit>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('laBOMJTh');
      logInfo(`pick>submit>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0192
     * @tc.name      CitySearch_CitySearchStateFlow_0192
     * @tc.desc      CitySearchState call flow pickResult > submit > change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0192 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(80);
      logInfo(`step1 pickResult(80): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.submit('l4eOlh3tGb0n');
      logInfo(`step2 submit("l4eOlh3tGb0n"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.change(' Hello World ');
      logInfo(`step3 change(" Hello World "): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick('SXue6auidE');
      logInfo(`step4 pick("SXue6auidE"): step4=${step4}`);
      expect(step4).assertEqual('SXue6auidE');
      logInfo(`pickResult>submit>change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('SXue6auidE');
      logInfo(`pickResult>submit>change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>submit>change>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0193
     * @tc.name      CitySearch_CitySearchStateFlow_0193
     * @tc.desc      CitySearchState call flow submit > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0193 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('zBTZ');
      logInfo(`step1 submit("zBTZ"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(1);
      logInfo(`step2 pickResult(1): step2=${step2}`);
      expect(step2).assertEqual('zBTZ');
      logInfo(`submit>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('zBTZ');
      logInfo(`submit>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pickResult final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0194
     * @tc.name      CitySearch_CitySearchStateFlow_0194
     * @tc.desc      CitySearchState call flow pick > pickResult > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0194 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('K26j');
      logInfo(`step1 pick("K26j"): step1=${step1}`);
      expect(step1).assertEqual('K26j');
      const step2: string = subject.pickResult(117);
      logInfo(`step2 pickResult(117): step2=${step2}`);
      expect(step2).assertEqual('K26j');
      const step3: string = subject.pick('1rTxM607vhT');
      logInfo(`step3 pick("1rTxM607vhT"): step3=${step3}`);
      expect(step3).assertEqual('1rTxM607vhT');
      const step4: string = subject.pick('c5CVmfFHdAk');
      logInfo(`step4 pick("c5CVmfFHdAk"): step4=${step4}`);
      expect(step4).assertEqual('c5CVmfFHdAk');
      logInfo(`pick>pickResult>pick>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('c5CVmfFHdAk');
      logInfo(`${BUNDLE}CitySearchStateFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0195
     * @tc.name      CitySearch_CitySearchStateFlow_0195
     * @tc.desc      CitySearchState call flow submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0195 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('Hello World_1');
      logInfo(`step1 submit("Hello World_1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('ipMmpQ1G');
      logInfo(`step2 change("ipMmpQ1G"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ipMmpQ1G');
      logInfo(`submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0196
     * @tc.name      CitySearch_CitySearchStateFlow_0196
     * @tc.desc      CitySearchState call flow change > change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0196 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('abc');
      logInfo(`step1 change("abc"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('abc');
      logInfo(`step2 change("abc"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('IYLTSP2O8q');
      logInfo(`step3 pick("IYLTSP2O8q"): step3=${step3}`);
      expect(step3).assertEqual('IYLTSP2O8q');
      logInfo(`change>change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('IYLTSP2O8q');
      logInfo(`change>change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0197
     * @tc.name      CitySearch_CitySearchStateFlow_0197
     * @tc.desc      CitySearchState call flow submit > pick > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0197 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('FSoQ');
      logInfo(`step1 submit("FSoQ"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('XHAva');
      logInfo(`step2 pick("XHAva"): step2=${step2}`);
      expect(step2).assertEqual('XHAva');
      const step3: number = subject.submit('IaJG');
      logInfo(`step3 submit("IaJG"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`submit>pick>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('IaJG');
      logInfo(`submit>pick>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pick>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0198
     * @tc.name      CitySearch_CitySearchStateFlow_0198
     * @tc.desc      CitySearchState call flow change > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0198 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('\u4e2d\u6587');
      logInfo(`step1 change("??"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(15);
      logInfo(`step2 pickResult(15): step2=${step2}`);
      expect(step2).assertEqual('\u4e2d\u6587');
      logInfo(`change>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('\u4e2d\u6587');
      logInfo(`change>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0199
     * @tc.name      CitySearch_CitySearchStateFlow_0199
     * @tc.desc      CitySearchState call flow change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0199 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('mVR');
      logInfo(`step1 change("mVR"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('KUw6hfX');
      logInfo(`step2 pick("KUw6hfX"): step2=${step2}`);
      expect(step2).assertEqual('KUw6hfX');
      logInfo(`change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('KUw6hfX');
      logInfo(`change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0200
     * @tc.name      CitySearch_CitySearchStateFlow_0200
     * @tc.desc      CitySearchState call flow pick > pickResult > change > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0200 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('IUpWcES');
      logInfo(`step1 pick("IUpWcES"): step1=${step1}`);
      expect(step1).assertEqual('IUpWcES');
      const step2: string = subject.pickResult(-90);
      logInfo(`step2 pickResult(-90): step2=${step2}`);
      expect(step2).assertEqual('IUpWcES');
      const step3: number = subject.change('');
      logInfo(`step3 change(""): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.change(' ');
      logInfo(`step4 change(" "): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`pick>pickResult>change>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' ');
      logInfo(`pick>pickResult>change>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0201
     * @tc.name      CitySearch_CitySearchStateFlow_0201
     * @tc.desc      CitySearchState call flow change > submit > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0201 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('6Y');
      logInfo(`step1 change("6Y"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('kjSb3');
      logInfo(`step2 submit("kjSb3"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('bFsn');
      logInfo(`step3 submit("bFsn"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`change>submit>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('bFsn');
      logInfo(`change>submit>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>submit>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0202
     * @tc.name      CitySearch_CitySearchStateFlow_0202
     * @tc.desc      CitySearchState call flow pick > submit > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0202 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('a');
      logInfo(`step1 pick("a"): step1=${step1}`);
      expect(step1).assertEqual('a');
      const step2: number = subject.submit('\u4e2d\u6587');
      logInfo(`step2 submit("??"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pickResult(9);
      logInfo(`step3 pickResult(9): step3=${step3}`);
      expect(step3).assertEqual('\u4e2d\u6587');
      logInfo(`pick>submit>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('\u4e2d\u6587');
      logInfo(`pick>submit>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit>pickResult final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0203
     * @tc.name      CitySearch_CitySearchStateFlow_0203
     * @tc.desc      CitySearchState call flow pick > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0203 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('lKUz3lQTg');
      logInfo(`step1 pick("lKUz3lQTg"): step1=${step1}`);
      expect(step1).assertEqual('lKUz3lQTg');
      const step2: number = subject.change('ipMmpQ1G');
      logInfo(`step2 change("ipMmpQ1G"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`pick>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ipMmpQ1G');
      logInfo(`pick>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0204
     * @tc.name      CitySearch_CitySearchStateFlow_0204
     * @tc.desc      CitySearchState call flow submit > pick > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0204 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('EseWYUUTcsfb');
      logInfo(`step1 submit("EseWYUUTcsfb"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('5zz6yKJYB');
      logInfo(`step2 pick("5zz6yKJYB"): step2=${step2}`);
      expect(step2).assertEqual('5zz6yKJYB');
      const step3: number = subject.submit('Sample Title 123');
      logInfo(`step3 submit("Sample Title 123"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`submit>pick>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Sample Title 123');
      logInfo(`submit>pick>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pick>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0205
     * @tc.name      CitySearch_CitySearchStateFlow_0205
     * @tc.desc      CitySearchState call flow change > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0205 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('6qe');
      logInfo(`step1 change("6qe"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(177);
      logInfo(`step2 pickResult(177): step2=${step2}`);
      expect(step2).assertEqual('6qe');
      logInfo(`change>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('6qe');
      logInfo(`change>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0205 end`);
    });
  });
}
