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

/** Logic checks for CitySearchState flow (53 cases). */
export default function citySearchStateFlow2Test(): void {
  describe('CitySearchStateFlow2Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0052
     * @tc.name      CitySearch_CitySearchStateFlow_0052
     * @tc.desc      CitySearchState call flow change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0052 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('4hg58AZbF9mF');
      logInfo(`step1 change("4hg58AZbF9mF"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('iZVGOf');
      logInfo(`step2 pick("iZVGOf"): step2=${step2}`);
      expect(step2).assertEqual('iZVGOf');
      logInfo(`change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('iZVGOf');
      logInfo(`change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0053
     * @tc.name      CitySearch_CitySearchStateFlow_0053
     * @tc.desc      CitySearchState call flow change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0053 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('2Taz6J');
      logInfo(`step1 change("2Taz6J"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('0if0Rq');
      logInfo(`step2 pick("0if0Rq"): step2=${step2}`);
      expect(step2).assertEqual('0if0Rq');
      logInfo(`change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('0if0Rq');
      logInfo(`change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0054
     * @tc.name      CitySearch_CitySearchStateFlow_0054
     * @tc.desc      CitySearchState call flow pick > pick > submit > submit > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0054 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('123123');
      logInfo(`step1 pick("123123"): step1=${step1}`);
      expect(step1).assertEqual('123123');
      const step2: string = subject.pick('qWp3ybD');
      logInfo(`step2 pick("qWp3ybD"): step2=${step2}`);
      expect(step2).assertEqual('qWp3ybD');
      const step3: number = subject.submit('8x9qIKj76hxm');
      logInfo(`step3 submit("8x9qIKj76hxm"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.submit('sxHdStscq6');
      logInfo(`step4 submit("sxHdStscq6"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.submit('Sample Title 123');
      logInfo(`step5 submit("Sample Title 123"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`pick>pick>submit>submit>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Sample Title 123');
      logInfo(`pick>pick>submit>submit>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>pick>submit>submit>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(3);
      logInfo(`${BUNDLE}CitySearchStateFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0055
     * @tc.name      CitySearch_CitySearchStateFlow_0055
     * @tc.desc      CitySearchState call flow pick > pick > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0055 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('ZNGA');
      logInfo(`step1 pick("ZNGA"): step1=${step1}`);
      expect(step1).assertEqual('ZNGA');
      const step2: string = subject.pick('123123');
      logInfo(`step2 pick("123123"): step2=${step2}`);
      expect(step2).assertEqual('123123');
      const step3: number = subject.submit('Hello WorldHello World');
      logInfo(`step3 submit("Hello WorldHello World"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pick>pick>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello WorldHello World');
      logInfo(`pick>pick>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>pick>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0056
     * @tc.name      CitySearch_CitySearchStateFlow_0056
     * @tc.desc      CitySearchState call flow pick > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0056 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick(' Sample Title 123 ');
      logInfo(`step1 pick(" Sample Title 123 "): step1=${step1}`);
      expect(step1).assertEqual(' Sample Title 123 ');
      const step2: number = subject.submit('vpX');
      logInfo(`step2 submit("vpX"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`pick>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('vpX');
      logInfo(`pick>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0057
     * @tc.name      CitySearch_CitySearchStateFlow_0057
     * @tc.desc      CitySearchState call flow change > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0057 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('Hello');
      logInfo(`step1 change("Hello"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('5R2yk9zNCX');
      logInfo(`step2 change("5R2yk9zNCX"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`change>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('5R2yk9zNCX');
      logInfo(`change>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0058
     * @tc.name      CitySearch_CitySearchStateFlow_0058
     * @tc.desc      CitySearchState call flow submit > pickResult > change > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0058 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('pJukfu1');
      logInfo(`step1 submit("pJukfu1"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(179);
      logInfo(`step2 pickResult(179): step2=${step2}`);
      expect(step2).assertEqual('pJukfu1');
      const step3: number = subject.change('pqOF4XT2q');
      logInfo(`step3 change("pqOF4XT2q"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.change('sk7');
      logInfo(`step4 change("sk7"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`submit>pickResult>change>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('sk7');
      logInfo(`submit>pickResult>change>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pickResult>change>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0059
     * @tc.name      CitySearch_CitySearchStateFlow_0059
     * @tc.desc      CitySearchState call flow pickResult > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0059 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(10);
      logInfo(`step1 pickResult(10): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.submit('N');
      logInfo(`step2 submit("N"): step2=${step2}`);
      expect(step2).assertEqual(3);
      logInfo(`pickResult>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('N');
      logInfo(`pickResult>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>submit final: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(3);
      logInfo(`pickResult>submit final: JSON.stringify(subject.searchList)=${JSON.stringify(subject.searchList)}`);
      expect(JSON.stringify(subject.searchList)).assertEqual('["\u5357\u660c","\u5357\u4eac","\u5b81\u6ce2"]');
      logInfo(`${BUNDLE}CitySearchStateFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0060
     * @tc.name      CitySearch_CitySearchStateFlow_0060
     * @tc.desc      CitySearchState call flow change > change > change > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0060 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('');
      logInfo(`step1 change(""): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('N');
      logInfo(`step2 change("N"): step2=${step2}`);
      expect(step2).assertEqual(3);
      const step3: number = subject.change('xSample Title 123');
      logInfo(`step3 change("xSample Title 123"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.submit('IaJG');
      logInfo(`step4 submit("IaJG"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`change>change>change>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('IaJG');
      logInfo(`change>change>change>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>change>change>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0061
     * @tc.name      CitySearch_CitySearchStateFlow_0061
     * @tc.desc      CitySearchState call flow pickResult > pickResult > submit > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0061 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(76.29);
      logInfo(`step1 pickResult(76.29): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pickResult(93);
      logInfo(`step2 pickResult(93): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.submit('DDI');
      logInfo(`step3 submit("DDI"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pickResult(78);
      logInfo(`step4 pickResult(78): step4=${step4}`);
      expect(step4).assertEqual('DDI');
      logInfo(`pickResult>pickResult>submit>pickResult f...: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('DDI');
      logInfo(`pickResult>pickResult>submit>pickResult f...: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>pickResult>submit>pickResult f...: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0062
     * @tc.name      CitySearch_CitySearchStateFlow_0062
     * @tc.desc      CitySearchState call flow pick > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0062 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('123_1');
      logInfo(`step1 pick("123_1"): step1=${step1}`);
      expect(step1).assertEqual('123_1');
      const step2: string = subject.pickResult(-8);
      logInfo(`step2 pickResult(-8): step2=${step2}`);
      expect(step2).assertEqual('123_1');
      logInfo(`pick>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('123_1');
      logInfo(`${BUNDLE}CitySearchStateFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0063
     * @tc.name      CitySearch_CitySearchStateFlow_0063
     * @tc.desc      CitySearchState call flow submit > pickResult > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0063 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('2ndRkkn');
      logInfo(`step1 submit("2ndRkkn"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(50.84);
      logInfo(`step2 pickResult(50.84): step2=${step2}`);
      expect(step2).assertEqual('2ndRkkn');
      const step3: string = subject.pickResult(-27);
      logInfo(`step3 pickResult(-27): step3=${step3}`);
      expect(step3).assertEqual('2ndRkkn');
      logInfo(`submit>pickResult>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('2ndRkkn');
      logInfo(`submit>pickResult>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pickResult>pickResult final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0064
     * @tc.name      CitySearch_CitySearchStateFlow_0064
     * @tc.desc      CitySearchState call flow change > change > pickResult > pickResult > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0064 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('lpVfjzGAh');
      logInfo(`step1 change("lpVfjzGAh"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('z645m');
      logInfo(`step2 change("z645m"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pickResult(-88);
      logInfo(`step3 pickResult(-88): step3=${step3}`);
      expect(step3).assertEqual('z645m');
      const step4: string = subject.pickResult(-12);
      logInfo(`step4 pickResult(-12): step4=${step4}`);
      expect(step4).assertEqual('z645m');
      const step5: number = subject.submit('Sample Title 123');
      logInfo(`step5 submit("Sample Title 123"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`change>change>pickResult>pickResult>submi...: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Sample Title 123');
      logInfo(`change>change>pickResult>pickResult>submi...: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>change>pickResult>pickResult>submi...: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0065
     * @tc.name      CitySearch_CitySearchStateFlow_0065
     * @tc.desc      CitySearchState call flow submit > change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0065 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('xDJ2487JC');
      logInfo(`step1 submit("xDJ2487JC"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('x8T2Z');
      logInfo(`step2 change("x8T2Z"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('kjR9MeK');
      logInfo(`step3 pick("kjR9MeK"): step3=${step3}`);
      expect(step3).assertEqual('kjR9MeK');
      logInfo(`submit>change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('kjR9MeK');
      logInfo(`submit>change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>change>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0066
     * @tc.name      CitySearch_CitySearchStateFlow_0066
     * @tc.desc      CitySearchState call flow pick > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0066 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick(' Hello World ');
      logInfo(`step1 pick(" Hello World "): step1=${step1}`);
      expect(step1).assertEqual(' Hello World ');
      const step2: number = subject.change(' A ');
      logInfo(`step2 change(" A "): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`pick>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' A ');
      logInfo(`pick>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0066 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0067
     * @tc.name      CitySearch_CitySearchStateFlow_0067
     * @tc.desc      CitySearchState call flow pick > pick > pickResult > pick > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0067 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('P');
      logInfo(`step1 pick("P"): step1=${step1}`);
      expect(step1).assertEqual('P');
      const step2: string = subject.pick('B4S7YT10RtA');
      logInfo(`step2 pick("B4S7YT10RtA"): step2=${step2}`);
      expect(step2).assertEqual('B4S7YT10RtA');
      const step3: string = subject.pickResult(38);
      logInfo(`step3 pickResult(38): step3=${step3}`);
      expect(step3).assertEqual('B4S7YT10RtA');
      const step4: string = subject.pick('JDCMIp');
      logInfo(`step4 pick("JDCMIp"): step4=${step4}`);
      expect(step4).assertEqual('JDCMIp');
      const step5: number = subject.submit('AA');
      logInfo(`step5 submit("AA"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`pick>pick>pickResult>pick>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('AA');
      logInfo(`pick>pick>pickResult>pick>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>pick>pickResult>pick>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0068
     * @tc.name      CitySearch_CitySearchStateFlow_0068
     * @tc.desc      CitySearchState call flow change > pick > pick > change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0068 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('G0VssGJm9');
      logInfo(`step1 change("G0VssGJm9"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('oKDe0c3');
      logInfo(`step2 pick("oKDe0c3"): step2=${step2}`);
      expect(step2).assertEqual('oKDe0c3');
      const step3: string = subject.pick('YvJlMPfHeo4H');
      logInfo(`step3 pick("YvJlMPfHeo4H"): step3=${step3}`);
      expect(step3).assertEqual('YvJlMPfHeo4H');
      const step4: number = subject.change('G5SSiBz');
      logInfo(`step4 change("G5SSiBz"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.pick('xSample Title 123');
      logInfo(`step5 pick("xSample Title 123"): step5=${step5}`);
      expect(step5).assertEqual('xSample Title 123');
      logInfo(`change>pick>pick>change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xSample Title 123');
      logInfo(`change>pick>pick>change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0069
     * @tc.name      CitySearch_CitySearchStateFlow_0069
     * @tc.desc      CitySearchState call flow pickResult > change > submit > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0069 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(83);
      logInfo(`step1 pickResult(83): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.change(' hello world ');
      logInfo(`step2 change(" hello world "): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('xf7eKo6D');
      logInfo(`step3 submit("xf7eKo6D"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pickResult(63.44);
      logInfo(`step4 pickResult(63.44): step4=${step4}`);
      expect(step4).assertEqual('xf7eKo6D');
      logInfo(`pickResult>change>submit>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('xf7eKo6D');
      logInfo(`pickResult>change>submit>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>change>submit>pickResult final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0070
     * @tc.name      CitySearch_CitySearchStateFlow_0070
     * @tc.desc      CitySearchState call flow pickResult > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0070 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(69);
      logInfo(`step1 pickResult(69): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.change('G5SSiBz');
      logInfo(`step2 change("G5SSiBz"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`pickResult>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('G5SSiBz');
      logInfo(`pickResult>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0071
     * @tc.name      CitySearch_CitySearchStateFlow_0071
     * @tc.desc      CitySearchState call flow submit > submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0071 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('TqO');
      logInfo(`step1 submit("TqO"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('j3ooZzy');
      logInfo(`step2 submit("j3ooZzy"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.change('\u4e2d\u6587_1');
      logInfo(`step3 change("??_1"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`submit>submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('\u4e2d\u6587_1');
      logInfo(`submit>submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0072
     * @tc.name      CitySearch_CitySearchStateFlow_0072
     * @tc.desc      CitySearchState call flow change > change > pick > pick > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0072 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('xHello World');
      logInfo(`step1 change("xHello World"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('Grl5FY');
      logInfo(`step2 change("Grl5FY"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('zMnMG');
      logInfo(`step3 pick("zMnMG"): step3=${step3}`);
      expect(step3).assertEqual('zMnMG');
      const step4: string = subject.pick('2ZhPNpB');
      logInfo(`step4 pick("2ZhPNpB"): step4=${step4}`);
      expect(step4).assertEqual('2ZhPNpB');
      const step5: number = subject.change('8');
      logInfo(`step5 change("8"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`change>change>pick>pick>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('8');
      logInfo(`change>change>pick>pick>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0073
     * @tc.name      CitySearch_CitySearchStateFlow_0073
     * @tc.desc      CitySearchState call flow pick > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0073 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('h30r1l665j');
      logInfo(`step1 pick("h30r1l665j"): step1=${step1}`);
      expect(step1).assertEqual('h30r1l665j');
      const step2: number = subject.submit('A');
      logInfo(`step2 submit("A"): step2=${step2}`);
      expect(step2).assertEqual(4);
      logInfo(`pick>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('A');
      logInfo(`pick>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit final: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(4);
      logInfo(`pick>submit final: JSON.stringify(subject.searchLi...${JSON.stringify(subject.searchList.slice(0, 2))}`);
      expect(JSON.stringify(subject.searchList.slice(0, 2)))
        .assertEqual('["\u963f\u5c14\u5c71","\u963f\u52d2\u6cf0\u5730\u533a"]');
      logInfo(`pick>submit final: JSON.stringify(subject.searchLi...${JSON.stringify(subject.searchList.slice(2, 4))}`);
      expect(JSON.stringify(subject.searchList.slice(2, 4))).assertEqual('["\u5b89\u5e86","\u5b89\u9633"]');
      logInfo(`${BUNDLE}CitySearchStateFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0074
     * @tc.name      CitySearch_CitySearchStateFlow_0074
     * @tc.desc      CitySearchState call flow pickResult > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0074 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(-87);
      logInfo(`step1 pickResult(-87): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pick(' ');
      logInfo(`step2 pick(" "): step2=${step2}`);
      expect(step2).assertEqual(' ');
      logInfo(`pickResult>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual(' ');
      logInfo(`${BUNDLE}CitySearchStateFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0075
     * @tc.name      CitySearch_CitySearchStateFlow_0075
     * @tc.desc      CitySearchState call flow pick > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0075 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('YvJlMPfHeo4H');
      logInfo(`step1 pick("YvJlMPfHeo4H"): step1=${step1}`);
      expect(step1).assertEqual('YvJlMPfHeo4H');
      const step2: number = subject.change('eZbrh');
      logInfo(`step2 change("eZbrh"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`pick>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('eZbrh');
      logInfo(`pick>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0076
     * @tc.name      CitySearch_CitySearchStateFlow_0076
     * @tc.desc      CitySearchState call flow change > pick > submit > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0076 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('jqzONM');
      logInfo(`step1 change("jqzONM"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('hello world');
      logInfo(`step2 pick("hello world"): step2=${step2}`);
      expect(step2).assertEqual('hello world');
      const step3: number = subject.submit('gcZW7F');
      logInfo(`step3 submit("gcZW7F"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pickResult(39.57);
      logInfo(`step4 pickResult(39.57): step4=${step4}`);
      expect(step4).assertEqual('gcZW7F');
      logInfo(`change>pick>submit>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('gcZW7F');
      logInfo(`change>pick>submit>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>pick>submit>pickResult final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0077
     * @tc.name      CitySearch_CitySearchStateFlow_0077
     * @tc.desc      CitySearchState call flow change > pickResult > pick > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0077 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('sk7');
      logInfo(`step1 change("sk7"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(10.76);
      logInfo(`step2 pickResult(10.76): step2=${step2}`);
      expect(step2).assertEqual('sk7');
      const step3: string = subject.pick('XFcJ');
      logInfo(`step3 pick("XFcJ"): step3=${step3}`);
      expect(step3).assertEqual('XFcJ');
      const step4: string = subject.pickResult(47.81);
      logInfo(`step4 pickResult(47.81): step4=${step4}`);
      expect(step4).assertEqual('XFcJ');
      logInfo(`change>pickResult>pick>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('XFcJ');
      logInfo(`change>pickResult>pick>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0078
     * @tc.name      CitySearch_CitySearchStateFlow_0078
     * @tc.desc      CitySearchState call flow change > pick > pickResult > submit > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0078 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('Hello');
      logInfo(`step1 change("Hello"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('IYLTSP2O8q');
      logInfo(`step2 pick("IYLTSP2O8q"): step2=${step2}`);
      expect(step2).assertEqual('IYLTSP2O8q');
      const step3: string = subject.pickResult(81.13);
      logInfo(`step3 pickResult(81.13): step3=${step3}`);
      expect(step3).assertEqual('IYLTSP2O8q');
      const step4: number = subject.submit('2ndRkkn');
      logInfo(`step4 submit("2ndRkkn"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.pickResult(100);
      logInfo(`step5 pickResult(100): step5=${step5}`);
      expect(step5).assertEqual('2ndRkkn');
      logInfo(`change>pick>pickResult>submit>pickResult ...: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('2ndRkkn');
      logInfo(`change>pick>pickResult>submit>pickResult ...: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>pick>pickResult>submit>pickResult ...: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0079
     * @tc.name      CitySearch_CitySearchStateFlow_0079
     * @tc.desc      CitySearchState call flow submit > submit > change > pick > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0079 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('mgggzPkEnwB');
      logInfo(`step1 submit("mgggzPkEnwB"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('5mD6szpnX2Ab');
      logInfo(`step2 submit("5mD6szpnX2Ab"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.change('BFtWKfVFLS4');
      logInfo(`step3 change("BFtWKfVFLS4"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pick('zMnMG');
      logInfo(`step4 pick("zMnMG"): step4=${step4}`);
      expect(step4).assertEqual('zMnMG');
      const step5: string = subject.pickResult(141);
      logInfo(`step5 pickResult(141): step5=${step5}`);
      expect(step5).assertEqual('zMnMG');
      logInfo(`submit>submit>change>pick>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('zMnMG');
      logInfo(`submit>submit>change>pick>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>submit>change>pick>pickResult final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0080
     * @tc.name      CitySearch_CitySearchStateFlow_0080
     * @tc.desc      CitySearchState call flow change > pickResult > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0080 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('KrvR');
      logInfo(`step1 change("KrvR"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(86);
      logInfo(`step2 pickResult(86): step2=${step2}`);
      expect(step2).assertEqual('KrvR');
      const step3: number = subject.change('z645m');
      logInfo(`step3 change("z645m"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`change>pickResult>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('z645m');
      logInfo(`change>pickResult>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0081
     * @tc.name      CitySearch_CitySearchStateFlow_0081
     * @tc.desc      CitySearchState call flow pick > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0081 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('V8cKtNr');
      logInfo(`step1 pick("V8cKtNr"): step1=${step1}`);
      expect(step1).assertEqual('V8cKtNr');
      const step2: number = subject.change('VCphytda');
      logInfo(`step2 change("VCphytda"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`pick>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('VCphytda');
      logInfo(`pick>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0082
     * @tc.name      CitySearch_CitySearchStateFlow_0082
     * @tc.desc      CitySearchState call flow change > submit > change > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0082 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('TlfMSPr');
      logInfo(`step1 change("TlfMSPr"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('RGQHA');
      logInfo(`step2 submit("RGQHA"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.change('8xfL');
      logInfo(`step3 change("8xfL"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pickResult(3);
      logInfo(`step4 pickResult(3): step4=${step4}`);
      expect(step4).assertEqual('8xfL');
      logInfo(`change>submit>change>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('8xfL');
      logInfo(`change>submit>change>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>submit>change>pickResult final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0083
     * @tc.name      CitySearch_CitySearchStateFlow_0083
     * @tc.desc      CitySearchState call flow submit > change > pickResult > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0083 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('rwhBL');
      logInfo(`step1 submit("rwhBL"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('xSample Title 123');
      logInfo(`step2 change("xSample Title 123"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pickResult(134);
      logInfo(`step3 pickResult(134): step3=${step3}`);
      expect(step3).assertEqual('xSample Title 123');
      const step4: number = subject.change('Hello_1');
      logInfo(`step4 change("Hello_1"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`submit>change>pickResult>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello_1');
      logInfo(`submit>change>pickResult>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>change>pickResult>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0084
     * @tc.name      CitySearch_CitySearchStateFlow_0084
     * @tc.desc      CitySearchState call flow pick > submit > submit > pickResult > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0084 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('0V');
      logInfo(`step1 pick("0V"): step1=${step1}`);
      expect(step1).assertEqual('0V');
      const step2: number = subject.submit('xO8vbe3RHuN');
      logInfo(`step2 submit("xO8vbe3RHuN"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: number = subject.submit('5fC8');
      logInfo(`step3 submit("5fC8"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: string = subject.pickResult(41);
      logInfo(`step4 pickResult(41): step4=${step4}`);
      expect(step4).assertEqual('5fC8');
      const step5: string = subject.pick('qWp3ybD');
      logInfo(`step5 pick("qWp3ybD"): step5=${step5}`);
      expect(step5).assertEqual('qWp3ybD');
      logInfo(`pick>submit>submit>pickResult>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('qWp3ybD');
      logInfo(`pick>submit>submit>pickResult>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit>submit>pickResult>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0085
     * @tc.name      CitySearch_CitySearchStateFlow_0085
     * @tc.desc      CitySearchState call flow pickResult > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0085 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(134);
      logInfo(`step1 pickResult(134): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pickResult(61);
      logInfo(`step2 pickResult(61): step2=${step2}`);
      expect(step2).assertEqual('');
      logInfo(`${BUNDLE}CitySearchStateFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0086
     * @tc.name      CitySearch_CitySearchStateFlow_0086
     * @tc.desc      CitySearchState call flow submit > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0086 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('Hello');
      logInfo(`step1 submit("Hello"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(21);
      logInfo(`step2 pickResult(21): step2=${step2}`);
      expect(step2).assertEqual('Hello');
      logInfo(`submit>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello');
      logInfo(`submit>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pickResult final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0087
     * @tc.name      CitySearch_CitySearchStateFlow_0087
     * @tc.desc      CitySearchState call flow pickResult > submit > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0087 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(135);
      logInfo(`step1 pickResult(135): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: number = subject.submit('1vB1');
      logInfo(`step2 submit("1vB1"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('x\u4e2d\u6587');
      logInfo(`step3 pick("x??"): step3=${step3}`);
      expect(step3).assertEqual('x\u4e2d\u6587');
      logInfo(`pickResult>submit>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('x\u4e2d\u6587');
      logInfo(`pickResult>submit>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>submit>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0088
     * @tc.name      CitySearch_CitySearchStateFlow_0088
     * @tc.desc      CitySearchState call flow submit > pickResult > pick > submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0088 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('NC');
      logInfo(`step1 submit("NC"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(32.21);
      logInfo(`step2 pickResult(32.21): step2=${step2}`);
      expect(step2).assertEqual('NC');
      const step3: string = subject.pick('7');
      logInfo(`step3 pick("7"): step3=${step3}`);
      expect(step3).assertEqual('7');
      const step4: number = subject.submit('NIKzts');
      logInfo(`step4 submit("NIKzts"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.change('sefhzp8bFs');
      logInfo(`step5 change("sefhzp8bFs"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`submit>pickResult>pick>submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('sefhzp8bFs');
      logInfo(`submit>pickResult>pick>submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pickResult>pick>submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0089
     * @tc.name      CitySearch_CitySearchStateFlow_0089
     * @tc.desc      CitySearchState call flow submit > pick > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0089 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('dQHt');
      logInfo(`step1 submit("dQHt"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('A_1');
      logInfo(`step2 pick("A_1"): step2=${step2}`);
      expect(step2).assertEqual('A_1');
      const step3: number = subject.change('2hhe1S');
      logInfo(`step3 change("2hhe1S"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`submit>pick>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('2hhe1S');
      logInfo(`submit>pick>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pick>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0090
     * @tc.name      CitySearch_CitySearchStateFlow_0090
     * @tc.desc      CitySearchState call flow pickResult > pickResult > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0090 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(10.08);
      logInfo(`step1 pickResult(10.08): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pickResult(119);
      logInfo(`step2 pickResult(119): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.change('7gL');
      logInfo(`step3 change("7gL"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`pickResult>pickResult>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('7gL');
      logInfo(`pickResult>pickResult>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0091
     * @tc.name      CitySearch_CitySearchStateFlow_0091
     * @tc.desc      CitySearchState call flow pick > submit > pick > submit > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0091 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('SXue6auidE');
      logInfo(`step1 pick("SXue6auidE"): step1=${step1}`);
      expect(step1).assertEqual('SXue6auidE');
      const step2: number = subject.submit('9fB9Fi74OgV');
      logInfo(`step2 submit("9fB9Fi74OgV"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('  ');
      logInfo(`step3 pick("  "): step3=${step3}`);
      expect(step3).assertEqual('  ');
      const step4: number = subject.submit('mTZV');
      logInfo(`step4 submit("mTZV"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: string = subject.pick('vUE');
      logInfo(`step5 pick("vUE"): step5=${step5}`);
      expect(step5).assertEqual('vUE');
      logInfo(`pick>submit>pick>submit>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('vUE');
      logInfo(`pick>submit>pick>submit>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit>pick>submit>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0092
     * @tc.name      CitySearch_CitySearchStateFlow_0092
     * @tc.desc      CitySearchState call flow pick > pickResult > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0092 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('Sample Title 123');
      logInfo(`step1 pick("Sample Title 123"): step1=${step1}`);
      expect(step1).assertEqual('Sample Title 123');
      const step2: string = subject.pickResult(186);
      logInfo(`step2 pickResult(186): step2=${step2}`);
      expect(step2).assertEqual('Sample Title 123');
      const step3: string = subject.pickResult(176);
      logInfo(`step3 pickResult(176): step3=${step3}`);
      expect(step3).assertEqual('Sample Title 123');
      logInfo(`pick>pickResult>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Sample Title 123');
      logInfo(`${BUNDLE}CitySearchStateFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0093
     * @tc.name      CitySearch_CitySearchStateFlow_0093
     * @tc.desc      CitySearchState call flow change > pick > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0093 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('hello world');
      logInfo(`step1 change("hello world"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('MH9sFVSx');
      logInfo(`step2 pick("MH9sFVSx"): step2=${step2}`);
      expect(step2).assertEqual('MH9sFVSx');
      const step3: number = subject.submit('EseWYUUTcsfb');
      logInfo(`step3 submit("EseWYUUTcsfb"): step3=${step3}`);
      expect(step3).assertEqual(0);
      logInfo(`change>pick>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('EseWYUUTcsfb');
      logInfo(`change>pick>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>pick>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0094
     * @tc.name      CitySearch_CitySearchStateFlow_0094
     * @tc.desc      CitySearchState call flow change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0094 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('sk7');
      logInfo(`step1 change("sk7"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('Gs');
      logInfo(`step2 pick("Gs"): step2=${step2}`);
      expect(step2).assertEqual('Gs');
      logInfo(`change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Gs');
      logInfo(`change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0095
     * @tc.name      CitySearch_CitySearchStateFlow_0095
     * @tc.desc      CitySearchState call flow pick > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0095 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('b5gewLT');
      logInfo(`step1 pick("b5gewLT"): step1=${step1}`);
      expect(step1).assertEqual('b5gewLT');
      const step2: string = subject.pickResult(170);
      logInfo(`step2 pickResult(170): step2=${step2}`);
      expect(step2).assertEqual('b5gewLT');
      logInfo(`pick>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('b5gewLT');
      logInfo(`${BUNDLE}CitySearchStateFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0096
     * @tc.name      CitySearch_CitySearchStateFlow_0096
     * @tc.desc      CitySearchState call flow change > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0096 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('SWSt7dh');
      logInfo(`step1 change("SWSt7dh"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.submit('zBTZ');
      logInfo(`step2 submit("zBTZ"): step2=${step2}`);
      expect(step2).assertEqual(0);
      logInfo(`change>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('zBTZ');
      logInfo(`change>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`change>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0097
     * @tc.name      CitySearch_CitySearchStateFlow_0097
     * @tc.desc      CitySearchState call flow pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0097 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('0V');
      logInfo(`step1 pick("0V"): step1=${step1}`);
      expect(step1).assertEqual('0V');
      const step2: string = subject.pick('ZM2AtjMjS');
      logInfo(`step2 pick("ZM2AtjMjS"): step2=${step2}`);
      expect(step2).assertEqual('ZM2AtjMjS');
      logInfo(`pick>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ZM2AtjMjS');
      logInfo(`${BUNDLE}CitySearchStateFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0098
     * @tc.name      CitySearch_CitySearchStateFlow_0098
     * @tc.desc      CitySearchState call flow submit > pickResult > pickResult keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0098 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('XX95wyeo8gIQ');
      logInfo(`step1 submit("XX95wyeo8gIQ"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pickResult(124);
      logInfo(`step2 pickResult(124): step2=${step2}`);
      expect(step2).assertEqual('XX95wyeo8gIQ');
      const step3: string = subject.pickResult(174);
      logInfo(`step3 pickResult(174): step3=${step3}`);
      expect(step3).assertEqual('XX95wyeo8gIQ');
      logInfo(`submit>pickResult>pickResult final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('XX95wyeo8gIQ');
      logInfo(`submit>pickResult>pickResult final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>pickResult>pickResult final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0099
     * @tc.name      CitySearch_CitySearchStateFlow_0099
     * @tc.desc      CitySearchState call flow submit > change > pick > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0099 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('MtfxqZlXkqbX');
      logInfo(`step1 submit("MtfxqZlXkqbX"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('UeePnY9D8M');
      logInfo(`step2 change("UeePnY9D8M"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('dNA1z4cCq3');
      logInfo(`step3 pick("dNA1z4cCq3"): step3=${step3}`);
      expect(step3).assertEqual('dNA1z4cCq3');
      const step4: string = subject.pick('WZ');
      logInfo(`step4 pick("WZ"): step4=${step4}`);
      expect(step4).assertEqual('WZ');
      logInfo(`submit>change>pick>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('WZ');
      logInfo(`submit>change>pick>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>change>pick>pick final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0100
     * @tc.name      CitySearch_CitySearchStateFlow_0100
     * @tc.desc      CitySearchState call flow pickResult > pickResult > change > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0100 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pickResult(50.91);
      logInfo(`step1 pickResult(50.91): step1=${step1}`);
      expect(step1).assertEqual('');
      const step2: string = subject.pickResult(119);
      logInfo(`step2 pickResult(119): step2=${step2}`);
      expect(step2).assertEqual('');
      const step3: number = subject.change('z645m');
      logInfo(`step3 change("z645m"): step3=${step3}`);
      expect(step3).assertEqual(0);
      const step4: number = subject.submit('Hello World_1');
      logInfo(`step4 submit("Hello World_1"): step4=${step4}`);
      expect(step4).assertEqual(0);
      logInfo(`pickResult>pickResult>change>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Hello World_1');
      logInfo(`pickResult>pickResult>change>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pickResult>pickResult>change>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0101
     * @tc.name      CitySearch_CitySearchStateFlow_0101
     * @tc.desc      CitySearchState call flow pick > submit > pick > change > submit keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0101 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: string = subject.pick('awcmIKBryv');
      logInfo(`step1 pick("awcmIKBryv"): step1=${step1}`);
      expect(step1).assertEqual('awcmIKBryv');
      const step2: number = subject.submit('pnYKJZyR9P');
      logInfo(`step2 submit("pnYKJZyR9P"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('5zz6yKJYB');
      logInfo(`step3 pick("5zz6yKJYB"): step3=${step3}`);
      expect(step3).assertEqual('5zz6yKJYB');
      const step4: number = subject.change('Jieh');
      logInfo(`step4 change("Jieh"): step4=${step4}`);
      expect(step4).assertEqual(0);
      const step5: number = subject.submit('yFinC');
      logInfo(`step5 submit("yFinC"): step5=${step5}`);
      expect(step5).assertEqual(0);
      logInfo(`pick>submit>pick>change>submit final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('yFinC');
      logInfo(`pick>submit>pick>change>submit final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`pick>submit>pick>change>submit final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(2);
      logInfo(`${BUNDLE}CitySearchStateFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0102
     * @tc.name      CitySearch_CitySearchStateFlow_0102
     * @tc.desc      CitySearchState call flow submit > change keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0102 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.submit('Hello World');
      logInfo(`step1 submit("Hello World"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('a');
      logInfo(`step2 change("a"): step2=${step2}`);
      expect(step2).assertEqual(4);
      logInfo(`submit>change final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('a');
      logInfo(`submit>change final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`submit>change final: subject.searchList.length=${subject.searchList.length}`);
      expect(subject.searchList.length).assertEqual(4);
      logInfo(`submit>change final: JSON.stringify(subject.search...${JSON.stringify(subject.searchList.slice(0, 2))}`);
      expect(JSON.stringify(subject.searchList.slice(0, 2)))
        .assertEqual('["\u963f\u5c14\u5c71","\u963f\u52d2\u6cf0\u5730\u533a"]');
      logInfo(`submit>change final: JSON.stringify(subject.search...${JSON.stringify(subject.searchList.slice(2, 4))}`);
      expect(JSON.stringify(subject.searchList.slice(2, 4))).assertEqual('["\u5b89\u5e86","\u5b89\u9633"]');
      logInfo(`submit>change final: subject.toasts=${subject.toasts}`);
      expect(subject.toasts).assertEqual(1);
      logInfo(`${BUNDLE}CitySearchStateFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0103
     * @tc.name      CitySearch_CitySearchStateFlow_0103
     * @tc.desc      CitySearchState call flow change > change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0103 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('vtmoh');
      logInfo(`step1 change("vtmoh"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: number = subject.change('ZO7KRor');
      logInfo(`step2 change("ZO7KRor"): step2=${step2}`);
      expect(step2).assertEqual(0);
      const step3: string = subject.pick('x\u4e2d\u6587');
      logInfo(`step3 pick("x??"): step3=${step3}`);
      expect(step3).assertEqual('x\u4e2d\u6587');
      logInfo(`change>change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('x\u4e2d\u6587');
      logInfo(`change>change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_FLOW_0104
     * @tc.name      CitySearch_CitySearchStateFlow_0104
     * @tc.desc      CitySearchState call flow change > pick keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateFlow_0104 begin`);
      const subject: CitySearchState = new CitySearchState();
      const step1: number = subject.change('o0Sioa');
      logInfo(`step1 change("o0Sioa"): step1=${step1}`);
      expect(step1).assertEqual(0);
      const step2: string = subject.pick('zMnMG');
      logInfo(`step2 pick("zMnMG"): step2=${step2}`);
      expect(step2).assertEqual('zMnMG');
      logInfo(`change>pick final: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('zMnMG');
      logInfo(`change>pick final: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateFlow_0104 end`);
    });
  });
}
