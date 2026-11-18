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

/** Logic checks for CitySearchState flow (47 cases). */
export default function citySearchStateFlow5Test(): void {
  describe('CitySearchStateFlow5Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0206
     * @tc.name      CitySearch_CitySearchStateFlow_0206
     * @tc.desc      CitySearchState call flow pickResult > pickResult > submit > change > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0206 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(56.86);
      logInfo(`step1 pickResult(56.86): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pickResult(-52);
      logInfo(`step2 pickResult(-52): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.submit('abc_1');
      logInfo(`step3 submit("abc_1"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.change(' 123 ');
      logInfo(`step4 change(" 123 "): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.submit('Hello');
      logInfo(`step5 submit("Hello"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`pickResult>pickResult>submit>change>submi...: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello');
      logInfo(`pickResult>pickResult>submit>change>submi...: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>pickResult>submit>change>submi...: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0207
     * @tc.name      CitySearch_CitySearchStateFlow_0207
     * @tc.desc      CitySearchState call flow pick > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0207 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick(' _1');
      logInfo(`step1 pick(" _1"): step1=${step1}`);
      expect(step1).assertEqual(' _1');
      const step2: number = subject.submit('N');
      logInfo(`step2 submit("N"): step2=${step2}`);
      expect(step2).assertEqual(3);
      logInfo(`pick>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('N');
      logInfo(`pick>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit final: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(3);
      logInfo(`pick>submit final: JSON.stringify(subject.searchList)=${JSON.stringify(subject.searchList)}`);
      expect(JSON.stringify(subject.searchList)).assertEqual('["\u5357\u660c","\u5357\u4eac","\u5b81\u6ce2"]');
      logInfo(`${BUNDLE}CitySearchStateFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0208
     * @tc.name      CitySearch_CitySearchStateFlow_0208
     * @tc.desc      CitySearchState call flow change > pick > submit > change > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0208 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('FTYXufzbJ');
      logInfo(`step1 change("FTYXufzbJ"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('h30r1l665j');
      logInfo(`step2 pick("h30r1l665j"): step2=${step2}`);
      expect(step2).assertEqual('h30r1l665j');
      const step3: number = subject.submit('DDI');
      logInfo(`step3 submit("DDI"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.change('7P');
      logInfo(`step4 change("7P"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.submit('l4eOlh3tGb0n');
      logInfo(`step5 submit("l4eOlh3tGb0n"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`change>pick>submit>change>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('l4eOlh3tGb0n');
      logInfo(`change>pick>submit>change>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>pick>submit>change>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0208 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0209
     * @tc.name      CitySearch_CitySearchStateFlow_0209
     * @tc.desc      CitySearchState call flow pick > submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0209 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('iqv');
      logInfo(`step1 pick("iqv"): step1=${step1}`);
      expect(step1).assertEqual('iqv');
      const step2: number = subject.submit('UPzS');
      logInfo(`step2 submit("UPzS"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.change('PWf3');
      logInfo(`step3 change("PWf3"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pick>submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('PWf3');
      logInfo(`pick>submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0209 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0210
     * @tc.name      CitySearch_CitySearchStateFlow_0210
     * @tc.desc      CitySearchState call flow submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0210 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('NIKzts');
      logInfo(`step1 submit("NIKzts"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('hx');
      logInfo(`step2 change("hx"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('hx');
      logInfo(`submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0210 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0211
     * @tc.name      CitySearch_CitySearchStateFlow_0211
     * @tc.desc      CitySearchState call flow change > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0211 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('WChlHemF7');
      logInfo(`step1 change("WChlHemF7"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(61.9);
      logInfo(`step2 pickResult(61.9): step2=${step2}`);
      expect(step2).assertEqual('WChlHemF7');
      logInfo(`change>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('WChlHemF7');
      logInfo(`change>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0211 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0212
     * @tc.name      CitySearch_CitySearchStateFlow_0212
     * @tc.desc      CitySearchState call flow submit > change > submit > submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0212 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('BPE');
      logInfo(`step1 submit("BPE"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('G8');
      logInfo(`step2 change("G8"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('abcabc');
      logInfo(`step3 submit("abcabc"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.submit('x123');
      logInfo(`step4 submit("x123"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.change('ZpqmY');
      logInfo(`step5 change("ZpqmY"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`submit>change>submit>submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ZpqmY');
      logInfo(`submit>change>submit>submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>change>submit>submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(3);
      logInfo(`${BUNDLE}CitySearchStateFlow_0212 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0213
     * @tc.name      CitySearch_CitySearchStateFlow_0213
     * @tc.desc      CitySearchState call flow change > change > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0213 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('2Taz6J');
      logInfo(`step1 change("2Taz6J"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('DVpU9pn');
      logInfo(`step2 change("DVpU9pn"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('HelloHello');
      logInfo(`step3 submit("HelloHello"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`change>change>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('HelloHello');
      logInfo(`change>change>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>change>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0213 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0214
     * @tc.name      CitySearch_CitySearchStateFlow_0214
     * @tc.desc      CitySearchState call flow submit > pickResult > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0214 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('A');
      logInfo(`step1 submit("A"): step1=${step1}`);
      expect(step1).assertEqual(4);
      const step2: string = subject.pickResult(123);
      logInfo(`step2 pickResult(123): step2=${step2}`);
      expect(step2).assertEqual('A');
      const step3: number = subject.submit('dwyHcXv29');
      logInfo(`step3 submit("dwyHcXv29"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`submit>pickResult>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('dwyHcXv29');
      logInfo(`submit>pickResult>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pickResult>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0214 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0215
     * @tc.name      CitySearch_CitySearchStateFlow_0215
     * @tc.desc      CitySearchState call flow submit > change > submit > pick > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0215 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('FEXC');
      logInfo(`step1 submit("FEXC"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('AQ3iO9v');
      logInfo(`step2 change("AQ3iO9v"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('x ');
      logInfo(`step3 submit("x "): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick('lUYaCLRc76wv');
      logInfo(`step4 pick("lUYaCLRc76wv"): step4=${step4}`);
      expect(step4).assertEqual('lUYaCLRc76wv');
      const step5: number = subject.change('qdpmZ');
      logInfo(`step5 change("qdpmZ"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`submit>change>submit>pick>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('qdpmZ');
      logInfo(`submit>change>submit>pick>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>change>submit>pick>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0215 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0216
     * @tc.name      CitySearch_CitySearchStateFlow_0216
     * @tc.desc      CitySearchState call flow change > submit > submit > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0216 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('PmynBSwOERW');
      logInfo(`step1 change("PmynBSwOERW"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('mTZV');
      logInfo(`step2 submit("mTZV"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('inRbwNmV8ok');
      logInfo(`step3 submit("inRbwNmV8ok"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.submit('obq');
      logInfo(`step4 submit("obq"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`change>submit>submit>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('obq');
      logInfo(`change>submit>submit>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>submit>submit>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(3);
      logInfo(`${BUNDLE}CitySearchStateFlow_0216 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0217
     * @tc.name      CitySearch_CitySearchStateFlow_0217
     * @tc.desc      CitySearchState call flow change > pickResult > pick > change > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0217 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`step1 change("????"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(-86);
      logInfo(`step2 pickResult(-86): step2=${step2}`);
      expect(step2).assertEqual('\u4e2d\u6587\u4e2d\u6587');
      const step3: string = subject.pick(' _1');
      logInfo(`step3 pick(" _1"): step3=${step3}`);
      expect(step3).assertEqual(' _1');
      const step4: number = subject.change('Wjb');
      logInfo(`step4 change("Wjb"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.change('SWSt7dh');
      logInfo(`step5 change("SWSt7dh"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`change>pickResult>pick>change>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('SWSt7dh');
      logInfo(`change>pickResult>pick>change>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0217 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0218
     * @tc.name      CitySearch_CitySearchStateFlow_0218
     * @tc.desc      CitySearchState call flow change > pick > change > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0218 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('1nJ2tOr9');
      logInfo(`step1 change("1nJ2tOr9"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('R');
      logInfo(`step2 pick("R"): step2=${step2}`);
      expect(step2).assertEqual('R');
      const step3: number = subject.change('JyEYscjP');
      logInfo(`step3 change("JyEYscjP"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pickResult(-76);
      logInfo(`step4 pickResult(-76): step4=${step4}`);
      expect(step4).assertEqual('JyEYscjP');
      logInfo(`change>pick>change>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('JyEYscjP');
      logInfo(`change>pick>change>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0218 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0219
     * @tc.name      CitySearch_CitySearchStateFlow_0219
     * @tc.desc      CitySearchState call flow submit > change > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0219 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('0SQYOAFEky2');
      logInfo(`step1 submit("0SQYOAFEky2"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('mnv');
      logInfo(`step2 change("mnv"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.change('sZDQ3oPmUSP');
      logInfo(`step3 change("sZDQ3oPmUSP"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`submit>change>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('sZDQ3oPmUSP');
      logInfo(`submit>change>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>change>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0219 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0220
     * @tc.name      CitySearch_CitySearchStateFlow_0220
     * @tc.desc      CitySearchState call flow pick > submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0220 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('   ');
      logInfo(`step1 pick("   "): step1=${step1}`);
      expect(step1).assertEqual('   ');
      const step2: number = subject.submit('mTZV');
      logInfo(`step2 submit("mTZV"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.change('8');
      logInfo(`step3 change("8"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pick>submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('8');
      logInfo(`pick>submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0220 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0221
     * @tc.name      CitySearch_CitySearchStateFlow_0221
     * @tc.desc      CitySearchState call flow pickResult > change > pickResult > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0221 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(70);
      logInfo(`step1 pickResult(70): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.change('rsRk');
      logInfo(`step2 change("rsRk"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pickResult(123);
      logInfo(`step3 pickResult(123): step3=${step3}`);
      expect(step3).assertEqual('rsRk');
      const step4: string = subject.pick(' _1');
      logInfo(`step4 pick(" _1"): step4=${step4}`);
      expect(step4).assertEqual(' _1');
      logInfo(`pickResult>change>pickResult>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' _1');
      logInfo(`pickResult>change>pickResult>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0221 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0222
     * @tc.name      CitySearch_CitySearchStateFlow_0222
     * @tc.desc      CitySearchState call flow change > pick > submit > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0222 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change(' Hello ');
      logInfo(`step1 change(" Hello "): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('Hello World');
      logInfo(`step2 pick("Hello World"): step2=${step2}`);
      expect(step2).assertEqual('Hello World');
      const step3: number = subject.submit('laBOMJTh');
      logInfo(`step3 submit("laBOMJTh"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.submit(' ');
      logInfo(`step4 submit(" "): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`change>pick>submit>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' ');
      logInfo(`change>pick>submit>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>pick>submit>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0222 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0223
     * @tc.name      CitySearch_CitySearchStateFlow_0223
     * @tc.desc      CitySearchState call flow pick > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0223 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('ermIEOfui1H');
      logInfo(`step1 pick("ermIEOfui1H"): step1=${step1}`);
      expect(step1).assertEqual('ermIEOfui1H');
      const step2: number = subject.submit('0XsDrdhw');
      logInfo(`step2 submit("0XsDrdhw"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`pick>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('0XsDrdhw');
      logInfo(`pick>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0223 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0224
     * @tc.name      CitySearch_CitySearchStateFlow_0224
     * @tc.desc      CitySearchState call flow change > pickResult > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0224 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('abc_1');
      logInfo(`step1 change("abc_1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(38.73);
      logInfo(`step2 pickResult(38.73): step2=${step2}`);
      expect(step2).assertEqual('abc_1');
      const step3: string = subject.pick('awcmIKBryv');
      logInfo(`step3 pick("awcmIKBryv"): step3=${step3}`);
      expect(step3).assertEqual('awcmIKBryv');
      logInfo(`change>pickResult>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('awcmIKBryv');
      logInfo(`change>pickResult>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0224 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0225
     * @tc.name      CitySearch_CitySearchStateFlow_0225
     * @tc.desc      CitySearchState call flow pick > change > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0225 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('Hello World');
      logInfo(`step1 pick("Hello World"): step1=${step1}`);
      expect(step1).assertEqual('Hello World');
      const step2: number = subject.change('PmynBSwOERW');
      logInfo(`step2 change("PmynBSwOERW"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.change('x8T2Z');
      logInfo(`step3 change("x8T2Z"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pick>change>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('x8T2Z');
      logInfo(`pick>change>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0225 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0226
     * @tc.name      CitySearch_CitySearchStateFlow_0226
     * @tc.desc      CitySearchState call flow pickResult > change > submit > pickResult > pickResult keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0226 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(123);
      logInfo(`step1 pickResult(123): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.change('mX3G3r9YBD0');
      logInfo(`step2 change("mX3G3r9YBD0"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('9fB9Fi74OgV');
      logInfo(`step3 submit("9fB9Fi74OgV"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pickResult(-18);
      logInfo(`step4 pickResult(-18): step4=${step4}`);
      expect(step4).assertEqual('9fB9Fi74OgV');
      const step5: string = subject.pickResult(150);
      logInfo(`step5 pickResult(150): step5=${step5}`);
      expect(step5).assertEqual('9fB9Fi74OgV');
      logInfo(`pickResult>change>submit>pickResult>pickR...: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('9fB9Fi74OgV');
      logInfo(`pickResult>change>submit>pickResult>pickR...: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>change>submit>pickResult>pickR...: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0226 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0227
     * @tc.name      CitySearch_CitySearchStateFlow_0227
     * @tc.desc      CitySearchState call flow submit > pickResult > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0227 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('abcabc');
      logInfo(`step1 submit("abcabc"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(161);
      logInfo(`step2 pickResult(161): step2=${step2}`);
      expect(step2).assertEqual('abcabc');
      const step3: number = subject.submit('8x9qIKj76hxm');
      logInfo(`step3 submit("8x9qIKj76hxm"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`submit>pickResult>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('8x9qIKj76hxm');
      logInfo(`submit>pickResult>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pickResult>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0227 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0228
     * @tc.name      CitySearch_CitySearchStateFlow_0228
     * @tc.desc      CitySearchState call flow pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0228 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('oKDe0c3');
      logInfo(`step1 pick("oKDe0c3"): step1=${step1}`);
      expect(step1).assertEqual('oKDe0c3');
      const step2: string = subject.pick('IYLTSP2O8q');
      logInfo(`step2 pick("IYLTSP2O8q"): step2=${step2}`);
      expect(step2).assertEqual('IYLTSP2O8q');
      logInfo(`pick>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('IYLTSP2O8q');
      logInfo(`${BUNDLE}CitySearchStateFlow_0228 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0229
     * @tc.name      CitySearch_CitySearchStateFlow_0229
     * @tc.desc      CitySearchState call flow submit > submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0229 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('onzIJMH');
      logInfo(`step1 submit("onzIJMH"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('FEXC');
      logInfo(`step2 submit("FEXC"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.change('UeePnY9D8M');
      logInfo(`step3 change("UeePnY9D8M"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`submit>submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('UeePnY9D8M');
      logInfo(`submit>submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0229 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0230
     * @tc.name      CitySearch_CitySearchStateFlow_0230
     * @tc.desc      CitySearchState call flow pickResult > pick > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0230 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(64);
      logInfo(`step1 pickResult(64): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick('8hWXmIXRMSs');
      logInfo(`step2 pick("8hWXmIXRMSs"): step2=${step2}`);
      expect(step2).assertEqual('8hWXmIXRMSs');
      const step3: string = subject.pickResult(112);
      logInfo(`step3 pickResult(112): step3=${step3}`);
      expect(step3).assertEqual('8hWXmIXRMSs');
      logInfo(`pickResult>pick>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('8hWXmIXRMSs');
      logInfo(`${BUNDLE}CitySearchStateFlow_0230 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0231
     * @tc.name      CitySearch_CitySearchStateFlow_0231
     * @tc.desc      CitySearchState call flow pick > submit > change > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0231 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('ZM2AtjMjS');
      logInfo(`step1 pick("ZM2AtjMjS"): step1=${step1}`);
      expect(step1).assertEqual('ZM2AtjMjS');
      const step2: number = subject.submit('abc');
      logInfo(`step2 submit("abc"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.change('Bxj');
      logInfo(`step3 change("Bxj"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.change('W4qHFzFakj');
      logInfo(`step4 change("W4qHFzFakj"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`pick>submit>change>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('W4qHFzFakj');
      logInfo(`pick>submit>change>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit>change>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0231 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0232
     * @tc.name      CitySearch_CitySearchStateFlow_0232
     * @tc.desc      CitySearchState call flow change > change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0232 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('7P');
      logInfo(`step1 change("7P"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('CzBD8Iy');
      logInfo(`step2 change("CzBD8Iy"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('kIg6KJl1iaCB');
      logInfo(`step3 pick("kIg6KJl1iaCB"): step3=${step3}`);
      expect(step3).assertEqual('kIg6KJl1iaCB');
      logInfo(`change>change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('kIg6KJl1iaCB');
      logInfo(`change>change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0232 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0233
     * @tc.name      CitySearch_CitySearchStateFlow_0233
     * @tc.desc      CitySearchState call flow submit > change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0233 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('Hello WorldHello World');
      logInfo(`step1 submit("Hello WorldHello World"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('xa');
      logInfo(`step2 change("xa"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('c5CVmfFHdAk');
      logInfo(`step3 pick("c5CVmfFHdAk"): step3=${step3}`);
      expect(step3).assertEqual('c5CVmfFHdAk');
      logInfo(`submit>change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('c5CVmfFHdAk');
      logInfo(`submit>change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>change>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0233 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0234
     * @tc.name      CitySearch_CitySearchStateFlow_0234
     * @tc.desc      CitySearchState call flow change > submit > submit > change > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0234 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change(' a ');
      logInfo(`step1 change(" a "): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('Q');
      logInfo(`step2 submit("Q"): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.submit('OqRWEpRJU');
      logInfo(`step3 submit("OqRWEpRJU"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.change(' Hello ');
      logInfo(`step4 change(" Hello "): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.pickResult(90);
      logInfo(`step5 pickResult(90): step5=${step5}`);
      expect(step5).assertEqual(' Hello ');
      logInfo(`change>submit>submit>change>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' Hello ');
      logInfo(`change>submit>submit>change>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>submit>submit>change>pickResult final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0234 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0235
     * @tc.name      CitySearch_CitySearchStateFlow_0235
     * @tc.desc      CitySearchState call flow pick > pick > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0235 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('A_1');
      logInfo(`step1 pick("A_1"): step1=${step1}`);
      expect(step1).assertEqual('A_1');
      const step2: string = subject.pick('AKNDi');
      logInfo(`step2 pick("AKNDi"): step2=${step2}`);
      expect(step2).assertEqual('AKNDi');
      const step3: number = subject.change('G8');
      logInfo(`step3 change("G8"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pick>pick>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('G8');
      logInfo(`pick>pick>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0235 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0236
     * @tc.name      CitySearch_CitySearchStateFlow_0236
     * @tc.desc      CitySearchState call flow submit > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0236 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('5mD6szpnX2Ab');
      logInfo(`step1 submit("5mD6szpnX2Ab"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('vl5UbIVpk');
      logInfo(`step2 submit("vl5UbIVpk"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`submit>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('vl5UbIVpk');
      logInfo(`submit>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0236 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0237
     * @tc.name      CitySearch_CitySearchStateFlow_0237
     * @tc.desc      CitySearchState call flow change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0237 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('yr0NChJJ');
      logInfo(`step1 change("yr0NChJJ"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick(' A ');
      logInfo(`step2 pick(" A "): step2=${step2}`);
      expect(step2).assertEqual(' A ');
      logInfo(`change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' A ');
      logInfo(`change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0237 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0238
     * @tc.name      CitySearch_CitySearchStateFlow_0238
     * @tc.desc      CitySearchState call flow pick > submit > submit > change > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0238 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('vUE');
      logInfo(`step1 pick("vUE"): step1=${step1}`);
      expect(step1).assertEqual('vUE');
      const step2: number = subject.submit(' A ');
      logInfo(`step2 submit(" A "): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('123');
      logInfo(`step3 submit("123"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.change('bQzTD');
      logInfo(`step4 change("bQzTD"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.submit('5fxkMi9DG');
      logInfo(`step5 submit("5fxkMi9DG"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`pick>submit>submit>change>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('5fxkMi9DG');
      logInfo(`pick>submit>submit>change>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit>submit>change>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(3);
      logInfo(`${BUNDLE}CitySearchStateFlow_0238 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0239
     * @tc.name      CitySearch_CitySearchStateFlow_0239
     * @tc.desc      CitySearchState call flow pick > pick > change > pickResult > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0239 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('123_1');
      logInfo(`step1 pick("123_1"): step1=${step1}`);
      expect(step1).assertEqual('123_1');
      const step2: string = subject.pick('yt');
      logInfo(`step2 pick("yt"): step2=${step2}`);
      expect(step2).assertEqual('yt');
      const step3: number = subject.change('E7r61MlE');
      logInfo(`step3 change("E7r61MlE"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pickResult(174);
      logInfo(`step4 pickResult(174): step4=${step4}`);
      expect(step4).assertEqual('E7r61MlE');
      const step5: string = subject.pick('dNA1z4cCq3');
      logInfo(`step5 pick("dNA1z4cCq3"): step5=${step5}`);
      expect(step5).assertEqual('dNA1z4cCq3');
      logInfo(`pick>pick>change>pickResult>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('dNA1z4cCq3');
      logInfo(`pick>pick>change>pickResult>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0239 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0240
     * @tc.name      CitySearch_CitySearchStateFlow_0240
     * @tc.desc      CitySearchState call flow pickResult > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0240 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(16.9);
      logInfo(`step1 pickResult(16.9): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.submit('OqRWEpRJU');
      logInfo(`step2 submit("OqRWEpRJU"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`pickResult>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('OqRWEpRJU');
      logInfo(`pickResult>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0240 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0241
     * @tc.name      CitySearch_CitySearchStateFlow_0241
     * @tc.desc      CitySearchState call flow pickResult > submit > pick > pickResult > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0241 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(47.21);
      logInfo(`step1 pickResult(47.21): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.submit('mTZV');
      logInfo(`step2 submit("mTZV"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('Sample Title 123Sample Title 123');
      logInfo(`step3 pick("Sample Title 123Sample Title ...: step3=${step3}`);
      expect(step3).assertEqual('Sample Title 123Sample Title 123');
      const step4: string = subject.pickResult(-90);
      logInfo(`step4 pickResult(-90): step4=${step4}`);
      expect(step4).assertEqual('Sample Title 123Sample Title 123');
      const step5: string = subject.pick('XHAva');
      logInfo(`step5 pick("XHAva"): step5=${step5}`);
      expect(step5).assertEqual('XHAva');
      logInfo(`pickResult>submit>pick>pickResult>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('XHAva');
      logInfo(`pickResult>submit>pick>pickResult>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>submit>pick>pickResult>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0241 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0242
     * @tc.name      CitySearch_CitySearchStateFlow_0242
     * @tc.desc      CitySearchState call flow change > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0242 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change(' Hello ');
      logInfo(`step1 change(" Hello "): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(175);
      logInfo(`step2 pickResult(175): step2=${step2}`);
      expect(step2).assertEqual(' Hello ');
      logInfo(`change>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' Hello ');
      logInfo(`change>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0242 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0243
     * @tc.name      CitySearch_CitySearchStateFlow_0243
     * @tc.desc      CitySearchState call flow pickResult > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0243 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(98);
      logInfo(`step1 pickResult(98): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.submit('   ');
      logInfo(`step2 submit("   "): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`pickResult>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('   ');
      logInfo(`pickResult>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0243 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0244
     * @tc.name      CitySearch_CitySearchStateFlow_0244
     * @tc.desc      CitySearchState call flow submit > change > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0244 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('gcZW7F');
      logInfo(`step1 submit("gcZW7F"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('5R2yk9zNCX');
      logInfo(`step2 change("5R2yk9zNCX"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.change('VyGo4');
      logInfo(`step3 change("VyGo4"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`submit>change>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('VyGo4');
      logInfo(`submit>change>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>change>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0244 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0245
     * @tc.name      CitySearch_CitySearchStateFlow_0245
     * @tc.desc      CitySearchState call flow submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0245 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('xhello world');
      logInfo(`step1 submit("xhello world"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('wFt');
      logInfo(`step2 change("wFt"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('wFt');
      logInfo(`submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0245 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0246
     * @tc.name      CitySearch_CitySearchStateFlow_0246
     * @tc.desc      CitySearchState call flow pickResult > change > change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0246 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(48.11);
      logInfo(`step1 pickResult(48.11): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.change('Hello WorldHello World');
      logInfo(`step2 change("Hello WorldHello World"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.change('qdpmZ');
      logInfo(`step3 change("qdpmZ"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick('lUYaCLRc76wv');
      logInfo(`step4 pick("lUYaCLRc76wv"): step4=${step4}`);
      expect(step4).assertEqual('lUYaCLRc76wv');
      logInfo(`pickResult>change>change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('lUYaCLRc76wv');
      logInfo(`pickResult>change>change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0246 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0247
     * @tc.name      CitySearch_CitySearchStateFlow_0247
     * @tc.desc      CitySearchState call flow submit > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0247 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('0XsDrdhw');
      logInfo(`step1 submit("0XsDrdhw"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('ZM2AtjMjS');
      logInfo(`step2 pick("ZM2AtjMjS"): step2=${step2}`);
      expect(step2).assertEqual('ZM2AtjMjS');
      logInfo(`submit>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ZM2AtjMjS');
      logInfo(`submit>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0247 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0248
     * @tc.name      CitySearch_CitySearchStateFlow_0248
     * @tc.desc      CitySearchState call flow change > pick > pick > submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0248 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('');
      logInfo(`step1 change(""): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('O0u');
      logInfo(`step2 pick("O0u"): step2=${step2}`);
      expect(step2).assertEqual('O0u');
      const step3: string = subject.pick('aa');
      logInfo(`step3 pick("aa"): step3=${step3}`);
      expect(step3).assertEqual('aa');
      const step4: number = subject.submit('KJL1oXbjZN');
      logInfo(`step4 submit("KJL1oXbjZN"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.change('MUZJYhM');
      logInfo(`step5 change("MUZJYhM"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`change>pick>pick>submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('MUZJYhM');
      logInfo(`change>pick>pick>submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>pick>pick>submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0248 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0249
     * @tc.name      CitySearch_CitySearchStateFlow_0249
     * @tc.desc      CitySearchState call flow pick > pick > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0249 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('vXn');
      logInfo(`step1 pick("vXn"): step1=${step1}`);
      expect(step1).assertEqual('vXn');
      const step2: string = subject.pick('5gTiDSo');
      logInfo(`step2 pick("5gTiDSo"): step2=${step2}`);
      expect(step2).assertEqual('5gTiDSo');
      const step3: number = subject.submit('iQPRvYLttb2');
      logInfo(`step3 submit("iQPRvYLttb2"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pick>pick>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('iQPRvYLttb2');
      logInfo(`pick>pick>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>pick>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0249 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0250
     * @tc.name      CitySearch_CitySearchStateFlow_0250
     * @tc.desc      CitySearchState call flow pickResult > change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0250 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(-48);
      logInfo(`step1 pickResult(-48): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.change('N');
      logInfo(`step2 change("N"): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: string = subject.pick('iqv');
      logInfo(`step3 pick("iqv"): step3=${step3}`);
      expect(step3).assertEqual('iqv');
      logInfo(`pickResult>change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('iqv');
      logInfo(`pickResult>change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>change>pick final: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(3);
      logInfo(`pickResult>change>pick final: JSON.stringify(subject.searchList)=${JSON.stringify(subject.searchList)}`);
      expect(JSON.stringify(subject.searchList)).assertEqual('["\u5357\u660c","\u5357\u4eac","\u5b81\u6ce2"]');
      logInfo(`${BUNDLE}CitySearchStateFlow_0250 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0251
     * @tc.name      CitySearch_CitySearchStateFlow_0251
     * @tc.desc      CitySearchState call flow pick > pickResult > pick > pickResult > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0251 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('hello worldhello world');
      logInfo(`step1 pick("hello worldhello world"): step1=${step1}`);
      expect(step1).assertEqual('hello worldhello world');
      const step2: string = subject.pickResult(-56);
      logInfo(`step2 pickResult(-56): step2=${step2}`);
      expect(step2).assertEqual('hello worldhello world');
      const step3: string = subject.pick('PC3zvv');
      logInfo(`step3 pick("PC3zvv"): step3=${step3}`);
      expect(step3).assertEqual('PC3zvv');
      const step4: string = subject.pickResult(-46);
      logInfo(`step4 pickResult(-46): step4=${step4}`);
      expect(step4).assertEqual('PC3zvv');
      const step5: string = subject.pick('SKaVCSo');
      logInfo(`step5 pick("SKaVCSo"): step5=${step5}`);
      expect(step5).assertEqual('SKaVCSo');
      logInfo(`pick>pickResult>pick>pickResult>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('SKaVCSo');
      logInfo(`${BUNDLE}CitySearchStateFlow_0251 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0252
     * @tc.name      CitySearch_CitySearchStateFlow_0252
     * @tc.desc      CitySearchState call flow submit > submit > submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0252 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('TqO');
      logInfo(`step1 submit("TqO"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('dwyHcXv29');
      logInfo(`step2 submit("dwyHcXv29"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('vl5UbIVpk');
      logInfo(`step3 submit("vl5UbIVpk"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.change('7gL');
      logInfo(`step4 change("7gL"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`submit>submit>submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('7gL');
      logInfo(`submit>submit>submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>submit>submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(3);
      logInfo(`${BUNDLE}CitySearchStateFlow_0252 end`);
    });
  });
}
