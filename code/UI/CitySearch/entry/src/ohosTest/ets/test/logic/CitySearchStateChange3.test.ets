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

/** Logic checks for CitySearchState.change (36 cases). */
export default function citySearchStateChange3Test(): void {
  describe('CitySearchStateChange3Test', () => {
    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0145
     * @tc.name      CitySearch_CitySearchStateChange_0145
     * @tc.desc      CitySearchState.change(value="Bxj") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0145 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('Bxj');
      logInfo(`change(value="Bxj"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="Bxj") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Bxj');
      logInfo(`change(value="Bxj") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0145 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0146
     * @tc.name      CitySearch_CitySearchStateChange_0146
     * @tc.desc      CitySearchState.change(value="lwExEs5D") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0146 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('lwExEs5D');
      logInfo(`change(value="lwExEs5D"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="lwExEs5D") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('lwExEs5D');
      logInfo(`change(value="lwExEs5D") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0146 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0147
     * @tc.name      CitySearch_CitySearchStateChange_0147
     * @tc.desc      CitySearchState.change(value="4hg58AZbF9mF") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0147 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('4hg58AZbF9mF');
      logInfo(`change(value="4hg58AZbF9mF"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="4hg58AZbF9mF") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('4hg58AZbF9mF');
      logInfo(`change(value="4hg58AZbF9mF") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0147 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0148
     * @tc.name      CitySearch_CitySearchStateChange_0148
     * @tc.desc      CitySearchState.change(value="kx7") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0148 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('kx7');
      logInfo(`change(value="kx7"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="kx7") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('kx7');
      logInfo(`change(value="kx7") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0148 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0149
     * @tc.name      CitySearch_CitySearchStateChange_0149
     * @tc.desc      CitySearchState.change(value="yr0NChJJ") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0149 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('yr0NChJJ');
      logInfo(`change(value="yr0NChJJ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="yr0NChJJ") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('yr0NChJJ');
      logInfo(`change(value="yr0NChJJ") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0149 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0150
     * @tc.name      CitySearch_CitySearchStateChange_0150
     * @tc.desc      CitySearchState.change(value="G5SSiBz") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0150 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('G5SSiBz');
      logInfo(`change(value="G5SSiBz"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="G5SSiBz") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('G5SSiBz');
      logInfo(`change(value="G5SSiBz") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0150 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0151
     * @tc.name      CitySearch_CitySearchStateChange_0151
     * @tc.desc      CitySearchState.change(value="EYoYo") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0151 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('EYoYo');
      logInfo(`change(value="EYoYo"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="EYoYo") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('EYoYo');
      logInfo(`change(value="EYoYo") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0151 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0152
     * @tc.name      CitySearch_CitySearchStateChange_0152
     * @tc.desc      CitySearchState.change(value="1wcTIt") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0152 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('1wcTIt');
      logInfo(`change(value="1wcTIt"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="1wcTIt") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('1wcTIt');
      logInfo(`change(value="1wcTIt") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0152 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0153
     * @tc.name      CitySearch_CitySearchStateChange_0153
     * @tc.desc      CitySearchState.change(value="ipMmpQ1G") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0153 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('ipMmpQ1G');
      logInfo(`change(value="ipMmpQ1G"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="ipMmpQ1G") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ipMmpQ1G');
      logInfo(`change(value="ipMmpQ1G") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0153 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0154
     * @tc.name      CitySearch_CitySearchStateChange_0154
     * @tc.desc      CitySearchState.change(value="E7r61MlE") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0154 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('E7r61MlE');
      logInfo(`change(value="E7r61MlE"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="E7r61MlE") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('E7r61MlE');
      logInfo(`change(value="E7r61MlE") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0154 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0155
     * @tc.name      CitySearch_CitySearchStateChange_0155
     * @tc.desc      CitySearchState.change(value="KrvR") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0155 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('KrvR');
      logInfo(`change(value="KrvR"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="KrvR") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('KrvR');
      logInfo(`change(value="KrvR") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0155 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0156
     * @tc.name      CitySearch_CitySearchStateChange_0156
     * @tc.desc      CitySearchState.change(value="S830Gl") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0156 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('S830Gl');
      logInfo(`change(value="S830Gl"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="S830Gl") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('S830Gl');
      logInfo(`change(value="S830Gl") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0156 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0157
     * @tc.name      CitySearch_CitySearchStateChange_0157
     * @tc.desc      CitySearchState.change(value="sk7") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0157 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('sk7');
      logInfo(`change(value="sk7"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="sk7") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('sk7');
      logInfo(`change(value="sk7") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0157 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0158
     * @tc.name      CitySearch_CitySearchStateChange_0158
     * @tc.desc      CitySearchState.change(value="IQvJ8cOGIMT4") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0158 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('IQvJ8cOGIMT4');
      logInfo(`change(value="IQvJ8cOGIMT4"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="IQvJ8cOGIMT4") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('IQvJ8cOGIMT4');
      logInfo(`change(value="IQvJ8cOGIMT4") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0158 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0159
     * @tc.name      CitySearch_CitySearchStateChange_0159
     * @tc.desc      CitySearchState.change(value="CzBD8Iy") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0159 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('CzBD8Iy');
      logInfo(`change(value="CzBD8Iy"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="CzBD8Iy") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('CzBD8Iy');
      logInfo(`change(value="CzBD8Iy") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0159 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0160
     * @tc.name      CitySearch_CitySearchStateChange_0160
     * @tc.desc      CitySearchState.change(value="i") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0160 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('i');
      logInfo(`change(value="i"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="i") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('i');
      logInfo(`change(value="i") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0160 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0161
     * @tc.name      CitySearch_CitySearchStateChange_0161
     * @tc.desc      CitySearchState.change(value="cTXi") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0161 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('cTXi');
      logInfo(`change(value="cTXi"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="cTXi") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('cTXi');
      logInfo(`change(value="cTXi") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0161 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0162
     * @tc.name      CitySearch_CitySearchStateChange_0162
     * @tc.desc      CitySearchState.change(value="VCphytda") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0162 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('VCphytda');
      logInfo(`change(value="VCphytda"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="VCphytda") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('VCphytda');
      logInfo(`change(value="VCphytda") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0162 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0163
     * @tc.name      CitySearch_CitySearchStateChange_0163
     * @tc.desc      CitySearchState.change(value="jqzONM") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0163 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('jqzONM');
      logInfo(`change(value="jqzONM"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="jqzONM") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('jqzONM');
      logInfo(`change(value="jqzONM") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0163 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0164
     * @tc.name      CitySearch_CitySearchStateChange_0164
     * @tc.desc      CitySearchState.change(value="v") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0164 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('v');
      logInfo(`change(value="v"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="v") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('v');
      logInfo(`change(value="v") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0164 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0165
     * @tc.name      CitySearch_CitySearchStateChange_0165
     * @tc.desc      CitySearchState.change(value="mnv") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0165 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('mnv');
      logInfo(`change(value="mnv"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="mnv") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('mnv');
      logInfo(`change(value="mnv") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0165 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0166
     * @tc.name      CitySearch_CitySearchStateChange_0166
     * @tc.desc      CitySearchState.change(value="67dqlTxZIhl") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0166 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('67dqlTxZIhl');
      logInfo(`change(value="67dqlTxZIhl"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="67dqlTxZIhl") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('67dqlTxZIhl');
      logInfo(`change(value="67dqlTxZIhl") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0166 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0167
     * @tc.name      CitySearch_CitySearchStateChange_0167
     * @tc.desc      CitySearchState.change(value="7P") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0167 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('7P');
      logInfo(`change(value="7P"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="7P") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('7P');
      logInfo(`change(value="7P") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0167 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0168
     * @tc.name      CitySearch_CitySearchStateChange_0168
     * @tc.desc      CitySearchState.change(value="ZO7KRor") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0168 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('ZO7KRor');
      logInfo(`change(value="ZO7KRor"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="ZO7KRor") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('ZO7KRor');
      logInfo(`change(value="ZO7KRor") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0168 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0169
     * @tc.name      CitySearch_CitySearchStateChange_0169
     * @tc.desc      CitySearchState.change(value="j0i40vg1skR") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0169 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('j0i40vg1skR');
      logInfo(`change(value="j0i40vg1skR"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="j0i40vg1skR") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('j0i40vg1skR');
      logInfo(`change(value="j0i40vg1skR") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0169 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0170
     * @tc.name      CitySearch_CitySearchStateChange_0170
     * @tc.desc      CitySearchState.change(value="cBf2qTVVBtiD") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0170 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('cBf2qTVVBtiD');
      logInfo(`change(value="cBf2qTVVBtiD"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="cBf2qTVVBtiD") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('cBf2qTVVBtiD');
      logInfo(`change(value="cBf2qTVVBtiD") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0170 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0171
     * @tc.name      CitySearch_CitySearchStateChange_0171
     * @tc.desc      CitySearchState.change(value="mVR") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0171 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('mVR');
      logInfo(`change(value="mVR"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="mVR") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('mVR');
      logInfo(`change(value="mVR") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0171 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0172
     * @tc.name      CitySearch_CitySearchStateChange_0172
     * @tc.desc      CitySearchState.change(value="x8T2Z") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0172 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('x8T2Z');
      logInfo(`change(value="x8T2Z"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="x8T2Z") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('x8T2Z');
      logInfo(`change(value="x8T2Z") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0172 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0173
     * @tc.name      CitySearch_CitySearchStateChange_0173
     * @tc.desc      CitySearchState.change(value="IAN6yy1J") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0173 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('IAN6yy1J');
      logInfo(`change(value="IAN6yy1J"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="IAN6yy1J") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('IAN6yy1J');
      logInfo(`change(value="IAN6yy1J") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0173 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0174
     * @tc.name      CitySearch_CitySearchStateChange_0174
     * @tc.desc      CitySearchState.change(value="8EbrHtYj") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0174 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('8EbrHtYj');
      logInfo(`change(value="8EbrHtYj"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="8EbrHtYj") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('8EbrHtYj');
      logInfo(`change(value="8EbrHtYj") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0174 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0175
     * @tc.name      CitySearch_CitySearchStateChange_0175
     * @tc.desc      CitySearchState.change(value="Emp0yS4xw") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0175 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('Emp0yS4xw');
      logInfo(`change(value="Emp0yS4xw"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="Emp0yS4xw") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('Emp0yS4xw');
      logInfo(`change(value="Emp0yS4xw") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0175 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0176
     * @tc.name      CitySearch_CitySearchStateChange_0176
     * @tc.desc      CitySearchState.change(value="RA") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0176 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('RA');
      logInfo(`change(value="RA"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="RA") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('RA');
      logInfo(`change(value="RA") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0176 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0177
     * @tc.name      CitySearch_CitySearchStateChange_0177
     * @tc.desc      CitySearchState.change(value="mBdd") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0177 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('mBdd');
      logInfo(`change(value="mBdd"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="mBdd") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('mBdd');
      logInfo(`change(value="mBdd") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0177 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0178
     * @tc.name      CitySearch_CitySearchStateChange_0178
     * @tc.desc      CitySearchState.change(value="1nJ2tOr9") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0178 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('1nJ2tOr9');
      logInfo(`change(value="1nJ2tOr9"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="1nJ2tOr9") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('1nJ2tOr9');
      logInfo(`change(value="1nJ2tOr9") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0178 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0179
     * @tc.name      CitySearch_CitySearchStateChange_0179
     * @tc.desc      CitySearchState.change(value="JyEYscjP") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0179 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('JyEYscjP');
      logInfo(`change(value="JyEYscjP"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="JyEYscjP") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('JyEYscjP');
      logInfo(`change(value="JyEYscjP") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0179 end`);
    });

    /**
     * @tc.number    SUB_CITYSEARCH_CITY_SEARCH_STATE_CHANGE_0180
     * @tc.name      CitySearch_CitySearchStateChange_0180
     * @tc.desc      CitySearchState.change(value="3YS4t6y2") yields 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CitySearch_CitySearchStateChange_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}CitySearchStateChange_0180 begin`);
      const subject: CitySearchState = new CitySearchState();
      const actual: number = subject.change('3YS4t6y2');
      logInfo(`change(value="3YS4t6y2"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`change(value="3YS4t6y2") state: subject.changeValue=${subject.changeValue}`);
      expect(subject.changeValue).assertEqual('3YS4t6y2');
      logInfo(`change(value="3YS4t6y2") state: subject.isSearchState=${subject.isSearchState}`);
      expect(subject.isSearchState).assertTrue();
      logInfo(`${BUNDLE}CitySearchStateChange_0180 end`);
    });
  });
}
